from re import template
from unicodedata import name
from django.urls import path, include
from . import views
#from static import contact, contactar 


#from principal.views import perfilview
from principal.views import *


urlpatterns = [
    path('', views.Inicio, name="Form"),
    #path('Registrarse/', views.register, name= 'registrarse'),
    
    
]