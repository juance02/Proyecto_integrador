from unicodedata import name
from django.urls import path,include
from . import views
#from static import contact, contactar 


#from principal.views import perfilview
from principal.views import *
from gestion_ganado.views import *


urlpatterns = [
    
    #path('Registrarse/', views.register, name= 'registrarse'),
    path('agregar_res/', agregar_res, name= 'agregar_res'),
    path('ver_reses/', ver_reses, name= 'ver_reses'),
    path('dashboard/', dashboard_view, name= 'dashboard'),
  
    
    
]