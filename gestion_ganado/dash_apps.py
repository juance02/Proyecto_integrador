import dash
from dash import dcc, html
import plotly.express as px
from dash.dependencies import Input, Output
from django_plotly_dash import DjangoDash
from gestion_ganado.models import * 

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