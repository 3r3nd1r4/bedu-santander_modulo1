# ------ EVIDENCIAS --------------
# Alumnx : Eréndira Celis Acosta
# ere.is.not.here@gmail.com
# Módulo 1 - Sesión 5
# Reto #3:
# Usando la colección sample_airbnb.listingsAndReviews, 
# mediante el uso de agregaciones, 
# encontrar el número de publicaciones que 
# tienen conexión a Internet, sea desde Wifi o desde cable (Ethernet).
[
    {
        '$match': {
            'amenities': {
                '$in': [
                    'Wifi', 'Ethernet'
                ]
            }
        }
    }, {
        '$count': 'null'
    }
]