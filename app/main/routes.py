import sys

from flask import Blueprint, request, redirect, url_for, flash, render_template, send_from_directory, session, send_file
from sqlalchemy.exc import IntegrityError
from flask_login import current_user
from app import db
from app.algorithms.MoreFunctions import simple_filter, LOG, Canny
from app.auth.forms import ProfileForm
from app.main.forms import CannyForm, SimpleForm, ETFForm
from app.models import User, Image
import datetime
import os
import subprocess

bp_main = Blueprint('main', __name__)


@bp_main.route('/', methods=['GET'])
def index():
    if current_user.is_anonymous:
        return render_template('homepage.html')
    else:
        name = request.cookies.get('username')
        result = []
        return render_template('homepage.html', results=result)

@bp_main.route('/algorithms', methods=['GET'])
def algorithms():
    return render_template("algorithms.html")


@bp_main.route('/privacy_policy', methods=['GET'])
def privacy_policy():
    return render_template("privacy_policy.html")


@bp_main.route('/our_team', methods=['GET'])
def our_team():
    return render_template("our_team.html")


@bp_main.route('/history', methods=['GET', 'POST'])
def history():
    if 'username' in request.cookies:
        username = request.cookies.get('username')
        historys = db.session.query(Image.timestamp, Image.algorithm, Image.parameter, Image.user_username,
                                    Image.processedImageName).filter_by(user_username=username).all()
    else:
        historys = None
    if request.method == 'POST':
        return send_file(request.form["process_image"], mimetype="image/png", as_attachment=True)

    return render_template("history.html", historys=historys)


@bp_main.route('/generator')
def generator():
    return render_template('generator_select_algorithm.html')


@bp_main.route('/generator_enter_parameter_canny/', methods=['GET', 'POST'])
def generator_enter_parameter_canny():
    form = CannyForm(request.form)

    imagefile = request.files.get('file')
    if request.method == 'POST' and imagefile.filename != '':
        imagefile = request.files.get('file')
        imagefile.filename = str(datetime.datetime.now()).replace('.', '_').replace(' ', '_') + ".png"
        
        if 'username' in request.cookies:
            input_file_dir = os.path.join('app/static/filesystem/vip_uploaded_images/', imagefile.filename)
            output_file_dir = os.path.join('app/static/filesystem/vip_processed_images/', imagefile.filename)

            # save input image
            imagefile.save(input_file_dir)
            # process image and save output
            Canny(input_file_dir, output_file_dir, form.sigma.data, form.threshold.data)
            session['processed_image_filename'] = output_file_dir[4::]
        else:
            input_file_dir = os.path.join('app/static/filesystem/guest_uploaded_images/', imagefile.filename)
            output_file_dir = os.path.join('app/static/filesystem/guest_processed_images/', imagefile.filename)

            # save input image
            imagefile.save(input_file_dir)
            # process image and save output
            Canny(input_file_dir, output_file_dir, form.sigma.data, form.threshold.data)

            session['processed_image_filename'] = output_file_dir[4::]
        imagefile.close()
        image_object = Image(algorithm='canny', parameter='sigma: ' + str(form.sigma.data) + ',threshold: ' + str(form.threshold.data),
                             imagename=imagefile.filename, timestamp=str(datetime.datetime.now()),
                             user_username=request.cookies.get('username'), processedImageName=output_file_dir[4::])
        os.remove(input_file_dir)
        session['algorithm'] = 'Canny'
        session['parameter'] = {'Sigma:': str(form.sigma.data), 'Threshold: ': str(form.threshold.data)}

        db.session.add(image_object)
        db.session.commit()
        flash('You have successfully uploaded an image')
        return redirect(url_for('main.generator_display_result'))
    return render_template('generator_enter_parameter_canny.html')


@bp_main.route('/generator_enter_parameter_simple/', methods=['GET', 'POST'])
def generator_enter_parameter_simple():
    form = SimpleForm(request.form)

    imagefile = request.files.get('file')
    if request.method == 'POST' and imagefile.filename != '':
        imagefile = request.files.get('file')
        imagefile.filename = str(datetime.datetime.now()).replace('.', '_').replace(' ', '_') + ".png"

        if 'username' in request.cookies:
            input_file_dir = os.path.join('app/static/filesystem/vip_uploaded_images/', imagefile.filename)
            output_file_dir = os.path.join('app/static/filesystem/vip_processed_images/', imagefile.filename)

            # save input image
            imagefile.save(input_file_dir)
            # process image and save output
            simple_filter(input_file_dir, output_file_dir, form.sigma.data, form.intensity.data)
            session['processed_image_filename'] = output_file_dir[4::]
        else:
            input_file_dir = os.path.join('app/static/filesystem/guest_uploaded_images/', imagefile.filename)
            output_file_dir = os.path.join('app/static/filesystem/guest_processed_images/', imagefile.filename)

            # save input image
            imagefile.save(input_file_dir)
            # process image and save output
            simple_filter(input_file_dir, output_file_dir, form.sigma.data, form.intensity.data)

            session['processed_image_filename'] = output_file_dir[4::]
        imagefile.close()
        image_object = Image(algorithm='Simple edge detection',
                             parameter='sigma: ' + str(form.sigma.data) + ',intensity: ' + str(form.intensity.data),
                             imagename=imagefile.filename, timestamp=str(datetime.datetime.now()),
                             user_username=request.cookies.get('username'), processedImageName=output_file_dir[4::])
        os.remove(input_file_dir)
        session['algorithm'] = 'Simple edge detection'
        session['parameter'] = {'Sigma:': str(form.sigma.data), 'Intensity: ': str(form.intensity.data)}

        db.session.add(image_object)
        db.session.commit()
        flash('You have successfully uploaded an image')
        return redirect(url_for('main.generator_display_result'))
    return render_template('generator_enter_parameter_simple.html')


@bp_main.route('/generator_enter_parameter_LOG/', methods=['GET', 'POST'])
def generator_enter_parameter_LOG():
    form = SimpleForm(request.form)

    imagefile = request.files.get('file')
    if request.method == 'POST' and imagefile.filename != '':
        imagefile = request.files.get('file')
        imagefile.filename = str(datetime.datetime.now()).replace('.', '_').replace(' ', '_') + ".png"

        if 'username' in request.cookies:
            input_file_dir = os.path.join('app/static/filesystem/vip_uploaded_images/', imagefile.filename)
            output_file_dir = os.path.join('app/static/filesystem/vip_processed_images/', imagefile.filename)

            # save input image
            imagefile.save(input_file_dir)
            # process image and save output
            LOG(input_file_dir, output_file_dir, form.sigma.data, form.intensity.data)
            session['processed_image_filename'] = output_file_dir[4::]
        else:
            input_file_dir = os.path.join('app/static/filesystem/guest_uploaded_images/', imagefile.filename)
            output_file_dir = os.path.join('app/static/filesystem/guest_processed_images/', imagefile.filename)

            # save input image
            imagefile.save(input_file_dir)
            # process image and save output
            LOG(input_file_dir, output_file_dir, form.sigma.data, form.intensity.data)

            session['processed_image_filename'] = output_file_dir[4::]
        imagefile.close()
        image_object = Image(algorithm='Laplace of Gaussian edge detection',
                             parameter='sigma: ' + str(form.sigma.data) + ',intensity: ' + str(form.intensity.data),
                             imagename=imagefile.filename, timestamp=str(datetime.datetime.now()),
                             user_username=request.cookies.get('username'), processedImageName=output_file_dir[4::])
        os.remove(input_file_dir)
        session['algorithm'] = 'Laplace of Gaussian edge detection'
        session['parameter'] = {'Sigma:': str(form.sigma.data), 'Intensity: ': str(form.intensity.data)}

        db.session.add(image_object)
        db.session.commit()
        flash('You have successfully uploaded an image')
        return redirect(url_for('main.generator_display_result'))
    return render_template('generator_enter_parameter_LOG.html')


@bp_main.route('/generator_enter_parameter_ETF/', methods=['GET', 'POST'])
def generator_enter_parameter_ETF():
    form = ETFForm(request.form)

    imagefile = request.files.get('file')
    if request.method == 'POST' and imagefile.filename != '':
        imagefile = request.files.get('file')
        imagefile.filename = str(datetime.datetime.now()).replace('.', '_').replace(' ', '_') + ".png"

        if 'username' in request.cookies:
            input_file_dir = os.path.join('app/static/filesystem/vip_uploaded_images/', imagefile.filename)
            output_file_dir = os.path.join('app/static/filesystem/vip_processed_images/', imagefile.filename)

            # save input image
            imagefile.save(input_file_dir)
            # process image and save output
            
            subprocess.call("./app/algorithms/ETF+CLD/build/cld --src {} -o {} --ETF_iter {} --CLD_iter {} --sigma_m {} --rho {} --tau {} --debug_img".format(input_file_dir, output_file_dir, form.ETF_iter.data, form.CLD_iter.data, form.sigma.data, form.rho.data, form.tau.data), shell=True)

            session['processed_image_filename'] = output_file_dir[4::]
        else:
            input_file_dir = os.path.join('app/static/filesystem/guest_uploaded_images/', imagefile.filename)
            output_file_dir = os.path.join('app/static/filesystem/guest_processed_images/', imagefile.filename)

            # save input image
            imagefile.save(input_file_dir)
            # process image and save output
            subprocess.call("./app/algorithms/ETF+CLD/build/cld --src {} -o {} --ETF_iter {} --CLD_iter {} --sigma_m {} --rho {} --tau {} --debug_img".format(input_file_dir, output_file_dir, form.ETF_iter.data, form.CLD_iter.data, form.sigma.data, form.rho.data, form.tau.data), shell=True)

            session['processed_image_filename'] = output_file_dir[4::]
        imagefile.close()
        image_object = Image(algorithm='ETF + CLD',
                             parameter='Sigma: ' + str(form.sigma.data) + ', ETF_iter: ' + str(form.ETF_iter.data) + ', CLD_iter: ' + str(form.CLD_iter.data) + ', Rho: ' + str(form.rho.data) + ', Tau: ' + str(form.tau.data),
                             imagename=imagefile.filename, timestamp=str(datetime.datetime.now()),
                             user_username=request.cookies.get('username'), processedImageName=output_file_dir[4::])
        os.remove(input_file_dir)
        session['algorithm'] = 'ETF + CLD'
        session['parameter'] = {'Sigma: ': str(form.sigma.data), 'ETF_iter: ': str(form.ETF_iter.data),'CLD_iter: ': str(form.CLD_iter.data), 'Rho: ': str(form.rho.data), 'Tau: ': str(form.tau.data)}

        db.session.add(image_object)
        db.session.commit()
        flash('You have successfully uploaded an image')
        return redirect(url_for('main.generator_display_result'))
    return render_template('generator_enter_parameter_ETF.html')

@bp_main.route('/generator_display_result', methods=['GET', 'POST'])
def generator_display_result():
    if request.method == 'POST':
        return send_file(session['processed_image_filename'], mimetype="image/png", as_attachment=True)

    return render_template('generator_display_result.html', algorithm=session['algorithm'],
                           parameter=session['parameter'], processed_image_filename=session['processed_image_filename'])

@bp_main.route('/painter', methods=['GET', 'POST'])
def painter():
    return render_template('painter.html', image_path=session['processed_image_filename'])

@bp_main.route('/favicon.ico', methods=['GET'])
def favicon():
    return send_from_directory('../static', 'favicon.ico', mimetype='image/vnd.microsoft.icon')

