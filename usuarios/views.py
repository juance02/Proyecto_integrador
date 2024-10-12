from django.shortcuts import render

from base64 import urlsafe_b64decode
from email import message
from urllib import request
from django.contrib import messages, auth
from multiprocessing import context
from django.shortcuts import render ,redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.contrib.auth.tokens import default_token_generator
from django.utils.encoding import force_bytes
from django.core.mail import EmailMessage
from django.core.mail import send_mail
from django.conf import settings


from usuarios.models import *

from .forms import *

from principal.views import *


import requests

# Create your views here.

def registrar_ganadero(request):
    form = registrarseGanaderoForm
    if request.method == 'POST':
        form = registrarseGanaderoForm(request.POST)
        if form.is_valid():
            nombres = form.cleaned_data['nombres']
            apellidos = form.cleaned_data['apellidos']
            numero_telefono = form.cleaned_data['numero_telefono']
            email = form.cleaned_data['email']
            password = form.cleaned_data['password']

            #
            nombreusuario = email.split("@")[0] 
            user = Cuentas.objects.create_user(nombres=nombres, apellidos=apellidos, email=email, nombreusuario=nombreusuario, password=password )
            user.numero_telefono = numero_telefono
            #messages.success(request,  'Su registro con exito ')
            # cuando user se guarda me genera una id 
            user.save() 


            current_site = get_current_site(request)
            mail_subject = 'Por favor activa tu Cuenta en Pesaje inteligente para ganado '
            body = render_to_string('login/verificacion_email.html', {
                'user': user,
                'domain': current_site,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': default_token_generator.make_token(user),
            })
            to_email = email
            send_email = EmailMessage(mail_subject, body, to=[to_email])
            send_email.send()

            return redirect('/login/?command=verification&email='+email)

    context = {
        'form': form
    }
    return render(request, 'login/registro.html' ,context)

def login(request):
    if request.method == 'POST':
        email = request.POST['email']
        password = request.POST['password']
        user = auth.authenticate(email=email, password=password)
        #http://127.0.0.1:8000/login/?next=/checkout
       

        if user is not None:#condicion para evalaluar si el usuario esta en la base de datos  
            auth.login(request, user)
            messages.success(request, 'Has iniciado sesion Exitosamente')
            return redirect('Form')     
           
        else:
            messages.error(request, 'la información no es correcta')
            return redirect('login')  
        
    return render(request, 'login/login.html')

@login_required(login_url='login')
def logout(request):
    auth.logout(request)
    messages.success(request,  'Has salido de session')

    return redirect('login')

def activate(request, uidb64, token):
    try:
        uid = urlsafe_base64_decode(uidb64).decode()
        user = Cuentas._default_manager.get(pk=uid)
    except(TypeError, ValueError, OverflowError, Cuentas.DoesNotExist):
        user = None

    if user is not None and default_token_generator.check_token(user, token):
        user.is_active = True
        user.save()
        messages.success(request, 'felicitaciones, tu cuenta esta activa!')
        return redirect('login')

    else:
        messages.error(request, 'La activacion es invalida')
        return redirect('registrar')


