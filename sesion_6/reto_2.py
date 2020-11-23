# ------ EVIDENCIAS --------------
# Alumnx : Eréndira Celis Acosta
# ere.is.not.here@gmail.com
# Módulo 1 - Sesión 6
# Reto #2:
# Usando las colecciones comments y users, 
# se requiere conocer el correo y contraseña 
# de cada persona que realizó un comentario. 
# Construye un pipeline que genere como resultado estos datos.
[
    {
        '$lookup': {
            'from': 'users', 
            'localField': 'email', 
            'foreignField': 'email', 
            'as': 'x_correo'
        }
    }, {
        '$addFields': {
            'usrobjct': {
                '$arrayElemAt': [
                    '$x_correo', 0
                ]
            }
        }
    }, {
        '$addFields': {
            'contrasenna': {
                '$arrayElemAt': [
                    '$x_correo.password', 0
                ]
            }
        }
    }, {
        '$project': {
            '_id': 0, 
            'name': 1, 
            'email': 1, 
            'contrasenna': 1
        }
    }
]