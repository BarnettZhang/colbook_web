from sqlalchemy import Integer
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import UserMixin
from app import db

from sqlalchemy.dialects import postgresql


class User(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True, nullable=True, unique=True)
    username = db.Column(db.Text, nullable=False)
    password = db.Column(db.Text, nullable=False)
    email = db.Column(db.Text, nullable=False)

    def __repr__(self):
        return '<User {}>'.format(self.id)

    def set_password(self, password):
        self.password = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password, password)


class Image(db.Model):
    id = db.Column(db.Integer, primary_key=True, nullable=True, unique=True)
    algorithm = db.Column(db.Text, nullable=False)
    parameter = db.Column(db.Text, nullable=False)
    # 3D array for image (channel * height * width)
    # image = db.Column(postgresql.ARRAY(Integer), nullable=False) 
    imagename = db.Column(db.Text, nullable=False)

    timestamp = db.Column(db.Text, nullable=False)
    user_username = db.Column(db.Text, nullable=True)

    processedImageName = db.Column(db.Text, nullable=True)

    def __repr__(self):
        return '<Image {}>'.format(self.id)