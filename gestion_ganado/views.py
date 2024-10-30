from django.shortcuts import render
import matplotlib.pyplot as plt

from multiprocessing import context
from django.shortcuts import render, get_object_or_404, redirect
from .models import *

from django.contrib import messages
from django.db.models import Q

from django.contrib.auth.decorators import  login_required

import dash
from dash import dcc, html
import pandas as pd
from dash.dependencies import Input, Output
import plotly.express as px
from gestion_ganado.forms import *

# Create your views here.



# myapp/views.py

from django.shortcuts import render
from django.http import HttpResponse
from threading import Thread
from gestion_ganado.dash_app import run_dash

def dashboard_view(request):
    # Iniciar el servidor Dash en un hilo
    thread = Thread(target=run_dash)
    thread.daemon = True
    thread.start()
    
    return HttpResponse("El dashboard de Dash se está ejecutando. Visítalo en http://127.0.0.1:8050")

def dashboard(request):
    return render(request, 'index.html')




def agregar_res(request):
    
    if request.method == 'POST':
        formulario = ResesForm(data=request.POST, files=request.FILES)
        if formulario.is_valid():
            producto = formulario.save(commit=False)
            producto.save()
            messages.success(request, 'Res registrada correctamente')
            return redirect ('Form')

    else:
        formulario = ResesForm()

    return render(request, 'gestion_ganado/registar_res.html', {'formulario' : formulario})
@login_required
def gestion_reses(request):
    reses = Reses.objects.all()
    data ={
        'reses': reses
    }
    return render(request, 'producto/listar.html', data)

def modificar_producto(request,pk):
    
    reses = get_object_or_404(Reses, pk=pk)

    data = {
        'form': ResesForm(instance=reses)
    }
    if request.method == 'POST':
        form = ResesForm(data=request.POST, instance=reses, files=request.FILES)
        if form.is_valid():
            form.save()
            messages.success(request, 'Producto Modificado con Exito')
            return redirect("Form")

        data["form"] = form    
    return render(request, 'producto/modificar.html', data)


def eliminar_producto(request, pk):
    reses = get_object_or_404(Reses, pk=pk)
    reses.delete()
    messages.success(request, 'Producto Eliminado con Exito')
    return redirect(to="tablero")









