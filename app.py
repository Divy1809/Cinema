from flask import Flask, render_template, request, redirect, session, url_for, flash
import mysql.connector
app = Flask(__name__)
app.secret_key = '123456'
# DB config
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Divy1234",
    database="movie"
)
cursor = db.cursor()
@app.route('/')
def index():
    if 'username' in session:
        return redirect(url_for('dashboard'))
    return redirect(url_for('login'))
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        name = request.form['name']
        username = request.form['username']
        password = request.form['password']
        dob = request.form['dob']
        cursor.execute("SELECT * FROM users WHERE Username=%s", (username,))
        if cursor.fetchone():
            return render_template('register.html', error="Username already exists.")
        cursor.execute("INSERT INTO users (Name, Username, Password, DOB) VALUES (%s, %s, %s, %s)",
                       (name, username, password, dob))
        db.commit()
        return redirect(url_for('login'))
    return render_template('register.html')
@app.route('/login', methods=['GET', 'POST'])
def login():
    msg = ''
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        cursor.execute("SELECT * FROM users WHERE Username=%s AND Password=%s", (username, password))
        user = cursor.fetchone()
        if user:
            session['user_id'] = user[0]     
            session['name'] = user[1]         
            session['username'] = user[4]     
            session['dob'] = str(user[2])     
            cursor.execute("SELECT PreferredGenre FROM users WHERE Username=%s", (session['username'],))
            user_genre = cursor.fetchone()
            if user_genre and user_genre[0]:
                session['genre'] = user_genre[0]  
                return redirect('/dashboard')  
            else:
                return redirect('/genre-selection')  
        else:
            msg = 'Invalid credentials'
    return render_template('login.html', msg=msg)
@app.route('/genre-selection', methods=['GET', 'POST'])
def genre_selection():
    if request.method == 'POST':
        selected_genre_id = request.form['genre']
        session['genre'] = selected_genre_id
        try:
            cursor.execute("SELECT GenreID FROM genre WHERE GenreID = %s", (selected_genre_id,))
            check = cursor.fetchone()
            if check:
                cursor.execute("UPDATE users SET PreferredGenre=%s WHERE Username=%s",
                               (selected_genre_id, session['username']))
                db.commit()
                if cursor.rowcount == 1:
                    flash("Genre updated successfully!")
                else:
                    flash("Failed to update genre.")
            else:
                flash("Selected genre not found in the database.")
        except Exception as e:
            flash(f"Error: {e}")
        return redirect('/dashboard')
    cursor.execute("SELECT * FROM genre")
    genres = cursor.fetchall()
    return render_template('genre_selection.html', genres=genres)
@app.route('/dashboard')
def dashboard():
    if 'username' in session:
        genre_id = session.get('genre')
        recommendations = []
        if genre_id:
            cursor.execute("""
                SELECT m.MovieID, m.MovieName, g.GenreName, m.Duration,
                       r.MotionPictures, r.TSeries, r.IMDB,t.trailerlink
                FROM movies m
                JOIN moviegenre mg ON m.MovieID = mg.MovieID
                JOIN genre g ON g.GenreID = mg.GenreID
                LEFT JOIN ratings r ON m.MovieID = r.MovieID
                LEFT JOIN movie_trailer t ON m.MovieID = t.MovieID
                WHERE g.GenreID = %s
                ORDER BY RAND()
            """, (genre_id,))
            recommendations = cursor.fetchall()
            if not recommendations:
                flash("No recommendations available for this genre.")
        else:
            flash("Please select your favorite genre first.")
        return render_template('dashboard.html',
                               name=session['name'],
                               dob=session['dob'],
                               recommendations=recommendations)
    return redirect('/login')
@app.route('/rate', methods=['POST'])
def rate():
    if 'username' not in session:
        return redirect('/login')
    movie_id = request.form['movie_id']
    motion = request.form['motion']
    tseries = request.form['tseries']
    imdb = request.form['imdb']
    try:
        cursor.execute("SELECT * FROM ratings WHERE MovieID = %s", (movie_id,))
        if cursor.fetchone():
            cursor.execute("""
                UPDATE ratings 
                SET MotionPictures=%s, TSeries=%s, IMDB=%s 
                WHERE MovieID=%s
            """, (motion, tseries, imdb, movie_id))
        else:
            cursor.execute("""
                INSERT INTO ratings (MovieID, MotionPictures, TSeries, IMDB)
                VALUES (%s, %s, %s, %s)
            """, (movie_id, motion, tseries, imdb))
        db.commit()
        flash("Rating submitted successfully!")
    except Exception as e:
        db.rollback()
        flash(f"Error submitting rating: {e}")
    return redirect('/dashboard')
@app.route('/profile')
def profile():
    if 'username' in session:
        username = session['username']
        cursor.execute("""
            SELECT u.Name, u.DOB, u.Username, g.GenreName, 
                   s.PlanName, s.StartDate, s.EndDate, s.PlanPrice, s.PlanStatus, s.Details
            FROM users u
            LEFT JOIN genre g ON u.PreferredGenre = g.GenreID
            LEFT JOIN subscription s ON u.UserID = s.UserID
            WHERE u.Username = %s
        """, (username,))
        user_profile = cursor.fetchone()
        return render_template('profile.html', profile=user_profile)
    return redirect('/login')
@app.route('/logout')
def logout():
    session.clear()
    return redirect('/login')
if __name__ == '__main__':
    app.run(debug=True)