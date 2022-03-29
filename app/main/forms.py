from flask_wtf import FlaskForm
from wtforms import IntegerField, FileField, StringField, PasswordField, BooleanField, SelectField, DecimalField
from wtforms.validators import DataRequired, Length, Email, EqualTo, ValidationError

from app.models import User, Image


class CannyForm(FlaskForm):
    sigma = IntegerField('Sigma')
    threshold = IntegerField('Threshold')
    imagename = StringField('Image_name')


# Is also used by the LOG algorithm form
class SimpleForm(FlaskForm):
    sigma = IntegerField('Sigma')
    intensity = IntegerField('Intensity')
    imagename = StringField('Image_name')

class ETFForm(FlaskForm):
    sigma = IntegerField('Sigma')
    ETF_iter = IntegerField('ETF_iter')
    CLD_iter = IntegerField('CLD_iter')
    rho = DecimalField('rho')
    tau = DecimalField('tau')
    imagename = StringField('Image_name')
