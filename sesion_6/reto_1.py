# ------ EVIDENCIAS --------------
# Alumnx : Eréndira Celis Acosta
# ere.is.not.here@gmail.com
# Módulo 1 - Sesión 6
# Reto #1:
# Con base en el ejemplo 1, 
# modifica el agrupamiento para que 
# muestre el costo promedio por habitación por país 
# de las propiedades de tipo casa.
[
    {
        '$match': {
            'property_type': 'House', 
            'bedrooms': {
                '$gte': 1
            }
        }
    }, {
        '$addFields': {
            'costo_recamara': {
                '$divide': [
                    '$price', '$bedrooms'
                ]
            }
        }
    }, {
        '$group': {
            '_id': '$address.country', 
            'costo_promedio': {
                '$avg': '$costo_recamara'
            }
        }
    }, {
        '$project': {
            '_id': 1, 
            'costo_promedio': 1
        }
    }
]