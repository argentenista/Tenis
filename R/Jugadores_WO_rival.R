'Recorda que lo primero es cargar las bases de datos. Hay un archivo que explica paso a paso eso. Acá lo pongo sin explicación.'


library(data.table)
anios  <- (1968:2021)
archivos <- paste0("C:/Users/argentenista/Mi unidad/Tenis/Estadisticas/tennis_wta/wta_matches_", anios, ".csv")
lista_archivos <- lapply(archivos, function(m) df <- fread(m, na="", quote=F, fill = TRUE))
datos <- do.call("rbind", lista_archivos)

'En la base de datos hay dos maneras de poner que un jugador hizo Walkover, poniendo esa palabra o poniendo W/O. Así que el primer paso es seleccionar de toda la info 
que tenemos guardada en datos quedarnos solo con aquellos partidos donde el score es una de las dos opciones de Walkover. Esto se soluciona como ven abajo'

datos <- datos[score=='W/O'|score=='Walkover']

'La barrita esa | en programación significa "o", es un condicional. Nosotros estamos diciendo arriba: guarda en "datos" los partidos donde score sea igual a "W/O" o donde 
sea igual a "Walkover". Y toda esa info la volvemos a guardar en "datos". Ahora el último paso es contar cuantas veces se repite un mismo nombre. Para esto, recordamos 
que en la base de datos el nombre del jugador o la jugadora ganadora figura como "winner_name". Por lo tanto estoy diciendo: guarda en la variable "ganadores" la información
que figura en datos, pero agrupala por nombres (winner_name). Si nosotros reemplazamos "winner_name" por "loser_name", haciendo exactamente lo mismo tendríamos la lista 
de jugadores que más veces hicieron WO, es decir, que no se presentaron.'

ganadores <- datos[,.N,by=winner_name]

'Las siguientes dos lineas son estrictamente innecesarias. Simplemente es para cambiar los nombres de las columnas en las que figuran los datos. Con la primera linea digo:
de la variable ganadores, la primera columna quiero que se llame "Nombre" y la segunda columna quiero que se llame "Partidos ganados".'

names(ganadores)[1] <- 'Nombre'
names(ganadores)[2] <- 'Partidos ganados'

'Por último, con la siguiente línea lo que hago es ordenar los datos. Lo que estoy haciendo es: de la variable "ganadores" ordename la columna que se llama "Partidos ganados" 
en orden decreciente (-). El menos adelante indica que es en orden decreciente, si no ponemos nada lo ordena en orden creciente. Y al ponerle "Partidos ganados" le estamos
diciendo cual columna queremos que ordene. De la misma manera podríamos poner que ordene la columna "Nombre".'

setorder(ganadores,-'Partidos ganados')

'Ahora en "ganadores" tenemos una tabla de dos columnas, en la primera llamada "Nombre" tenemos los nombres de los jugadores o jugadores y en la segunda columna llamada 
"Partidos ganados" tenemos la cantidad de partidos que ganaron porque un rival dio WO ordenadas de forma decreciente.'

