from re import template
from unicodedata import name
from django.urls import path, include
from usuarios.views import *
#from static import contact, contactar 

from . import views 
#from principal.views import perfilview
from django.contrib.auth.views import LoginView, LogoutView

urlpatterns = [
    
    
    path('login/',login , name='login'),
    path('registrar_ganadero/', registrar_ganadero, name='registrar_ganadero'),
    path('logout/', logout, name='logout'),
    path('activate/<uidb64>/<token>/', views.activate, name='activate'),
]