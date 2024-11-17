from django.shortcuts import render
from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm
from gestion_ganado.models import *
from multiprocessing import context
# Create your views here.


def Inicio(request):
    vacas = Reses.objects.all()
    context = {
        'vacas':vacas,
    }
    return render(request, "index.html",context)






