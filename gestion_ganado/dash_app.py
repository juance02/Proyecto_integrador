# myapp/dash_app.py

import dash
from dash import dcc, html
import pandas as pd
from dash.dependencies import Input, Output
import plotly.express as px
from gestion_ganado.models import *
from django_plotly_dash import DjangoDash

# Inicializando la app de Dash
app = dash.Dash(__name__)

# Definición de los datos de vacas


def obtener_datos():
    vacas = Reses.objects.all()
    data = {
        'Reses': [v.nombre for v in vacas],
        'Peso (kg)': [v.peso for v in vacas],
        'Estado de Salud': [v.estado_salud() for v in vacas],
    }
    return data

data = obtener_datos()

# Layout de la app
app.layout = html.Div([
    html.H1('Estadísticas de Vacas'),
    dcc.Dropdown(
        id='vaca-dropdown',
        options=[{'label': vaca, 'value': vaca} for vaca in data['Reses']],
        value=data['Reses'][0]  # Valor por defecto
    ),
    html.Div(id='vaca-info'),
    dcc.Graph(
        id='grafico-peso-barras',
        figure=px.bar(
            data_frame=data,
            x='Reses',
            y='Peso (kg)',
            title='Peso de Vacas',
            color='Peso (kg)',
            color_continuous_scale=px.colors.sequential.Viridis
        )
    ),
    dcc.Graph(
        id='grafico-salud-pastel',
        figure=px.pie(
            data_frame=data,
            values='Peso (kg)',
            names='Estado de Salud',
            title='Distribución de Peso por Estado de Salud',
            color_discrete_sequence=px.colors.qualitative.Set2
        )
    )
])
@app.callback(
    [Output('grafico-peso-barras', 'figure'),
     Output('grafico-salud-pastel', 'figure')],
    [Input('intervalo-actualizacion', 'n_intervals')]
)
def actualizar_graficos(n_intervals):
    data = obtener_datos()
    # Actualiza el gráfico de barras
    fig_barras = px.bar(
        data_frame=data,
        x='Reses',
        y='Peso (kg)',
        title='Peso de Vacas',
        color='Peso (kg)',
        color_continuous_scale=px.colors.sequential.Viridis
    )
    
    # Actualiza el gráfico de pastel
    fig_pastel = px.pie(
        data_frame=data,
        values='Peso (kg)',
        names='Estado de Salud',
        title='Distribución de Peso por Estado de Salud',
        color_discrete_sequence=px.colors.qualitative.Set2
    )
    
    return fig_barras, fig_pastel
# Callback para actualizar la información
@app.callback(
    Output('vaca-info', 'children'),
    Input('vaca-dropdown', 'value')
)
def update_output(selected_vaca):
    vaca = Reses.objects.get(nombre=selected_vaca)
    return f"Peso: {vaca.peso} kg, Estado de Salud: {vaca.estado_salud()}"

# Mantener la aplicación de Dash
def run_dash():
    app.run_server(debug=False, use_reloader=False)

"""

# Inicializar la app de Dash
app = DjangoDash('EstadisticasVacas')

# Definición de los datos de vacas


def obtener_datos():
    vacas = Reses.objects.all()
    data = {
        'Reses': [v.nombre for v in vacas],
        'Peso (kg)': [v.peso for v in vacas],
        'Estado de Salud': [v.estado_salud() for v in vacas],
    }
    return data

data = obtener_datos()

# Layout de la app
app.layout = html.Div([
    html.H1('Estadísticas de Vacas'),
    dcc.Dropdown(
        id='vaca-dropdown',
        options=[{'label': vaca, 'value': vaca} for vaca in data['Reses']],
        value=data['Reses'][0]  # Valor por defecto
    ),
    html.Div(id='vaca-info'),
    dcc.Graph(
        id='grafico-peso-barras',
        figure=px.bar(
            data_frame=data,
            x='Reses',
            y='Peso (kg)',
            title='Peso de Vacas',
            color='Peso (kg)',
            color_continuous_scale=px.colors.sequential.Viridis
        )
    ),
    dcc.Graph(
        id='grafico-salud-pastel',
        figure=px.pie(
            data_frame=data,
            values='Peso (kg)',
            names='Estado de Salud',
            title='Distribución de Peso por Estado de Salud',
            color_discrete_sequence=px.colors.qualitative.Set2
        )
    )
])

# Callback para actualizar la información
@app.callback(
    Output('vaca-info', 'children'),
    Input('vaca-dropdown', 'value')
)
def update_output(selected_vaca):
    vaca = Reses.objects.get(nombre=selected_vaca)
    return f"Peso: {vaca.peso} kg, Estado de Salud: {vaca.estado_salud()}"
"""