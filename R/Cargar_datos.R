'Todo lo que esta entre comillas simples son explicaciones y el resto es el código propiamente dicho. El primer paso para todos los calculos es cargar a nuestro entorno la base de datos que utilizaremos. Trataré de explicar linea a linea para que se entienda. Voy a ejemplificar cargando la base de datos ATP, pero es igual para WTA o cualquiera.'

'Primero importamos las librerias necesarias, que son herramientas que facilitan la programación'

library(data.table)

'Como tenemos una serie de archivos ordenados por años, en 'anios' selecciono los años que deseo cargar. En este caso "1968:2021" significa que queremos todos los años entre 1968 y 2021'

anios  <- (1968:2021)

'En la línea siguientes, estamos guardando todas las rutas de los archivos que queremos cargar y por último se cargan en la variable "datos" que formalmente es un "dataframe" y que es como una tabla gigante de datos. Es muy importante que en la primera linea tengan en cuenta y respeten la ubicación de los archivos de la base de datos en la compu de ustedes.'

archivos <- paste0("C:/Users/argentenista/Mi unidad/Tenis/Estadisticas/Datos/tennis_atp/atp_matches_", anios, ".csv")
lista_archivos <- lapply(archivos, function(m) df <- fread(m, na="", quote=F, fill = TRUE))
datos <- do.call("rbind", lista_archivos)

'A partir de estos datos cargados se harán todos los códigos para obtener datos.'
