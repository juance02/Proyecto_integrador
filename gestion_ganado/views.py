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


# Create your views here.

def agregar_res (request):
    

    return render(request, 'gestion_ganado/registar_res.html')






