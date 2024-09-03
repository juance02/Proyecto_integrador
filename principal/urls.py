from re import template
from unicodedata import name
from django.urls import path, include
from . import views
#from static import contact, contactar 


#from principal.views import perfilview
from django.contrib.auth.views import LoginView, LogoutView
from principal.views import *


urlpatterns = [
    path('', views.Inicio, name="Form"),
    path('Registrarse/', views.register, name= 'registrarse'),
    path('login/', LoginView.as_view(template_name='login/login.html'), name='login'),
    path('logout/', LogoutView.as_view(template_name='login/logout.html'), name='logout'),
    
]