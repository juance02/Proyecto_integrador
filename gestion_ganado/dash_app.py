# myapp/dash_app.py

import dash
from dash import dcc, html
import pandas as pd
from dash.dependencies import Input, Output
import plotly.express as px

# Inicializando la app de Dash
app = dash.Dash(__name__)

# Definición de los datos de vacas
data = {
    'Vaca': ['Vaca 1', 'Vaca 2', 'Vaca 3', 'Vaca 4', 'Vaca 5',
             'Vaca 6', 'Vaca 7', 'Vaca 8', 'Vaca 9', 'Vaca 10'],
    'Peso (kg)': [450, 600, 550, 700, 500,
                   650, 480, 540, 710, 580]
}

# Crear un DataFrame
df = pd.DataFrame(data)

# Definir estado de salud según el peso
def evaluar_salud(peso):
    if peso < 500:
        return 'Bajo'
    elif 500 <= peso <= 650:
        return 'Normal'
    else:
        return 'Alto'

# Aplicar la función para determinar el estado de salud
df['Estado de Salud'] = df['Peso (kg)'].apply(evaluar_salud)

# Layout del dashboard
app.layout = html.Div([
    html.H1('Estadísticas de Vacas'),
    dcc.Dropdown(
        id='vaca-dropdown',
        options=[{'label': vaca, 'value': vaca} for vaca in df['Vaca']],
        value='Vaca 1'  # Valor por defecto
    ),
    html.Div(id='vaca-info'),
    dcc.Graph(
        id='grafico-peso-barras',
        figure=px.bar(df, x='Vaca', y='Peso (kg)', title='Peso de Vacas',
                      color='Peso (kg)', color_continuous_scale=px.colors.sequential.Viridis)
    ),
    dcc.Graph(
        id='grafico-salud-pastel',
        figure=px.pie(df, values='Peso (kg)', names='Estado de Salud', 
                      title='Distribución de Peso por Estado de Salud',
                      color_discrete_sequence=px.colors.qualitative.Set2)
    )
])

# Callback para actualizar la información de la vaca seleccionada
@app.callback(
    Output('vaca-info', 'children'),
    Input('vaca-dropdown', 'value')
)
def update_output(selected_vaca):
    vaca_data = df[df['Vaca'] == selected_vaca].iloc[0]
    return f"Peso: {vaca_data['Peso (kg)']} kg, Estado de Salud: {vaca_data['Estado de Salud']}"

# Mantener la aplicación de Dash
def run_dash():
    app.run_server(debug=True, use_reloader=True)
