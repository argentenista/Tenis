
'Recorda que lo primero es cargar las bases de datos. Hay un archivo que explica paso a paso eso. Acá lo pongo sin explicación'


library(data.table)
anios  <- (1968:2021)
archivos <- paste0("C:/Users/argentenista/Mi unidad/Tenis/Estadisticas/tennis_wta/wta_matches_", anios, ".csv")
lista_archivos <- lapply(archivos, function(m) df <- fread(m, na="", quote=F, fill = TRUE))
datos <- do.call("rbind", lista_archivos)

'Primero filtrar los torneos y quedarnos solo con los Grand Slam. Para esto selecciono los de categoria "G".
Con la siguiente linea quiero decir: de toda la info que esta en "datos", elegi solo los partidos de nivel 
Grand Slam y volve a guardarlos en "datos". Esto significa que se borra la info que no queremos'

datos<-datos[tourney_level=='G']

'Ahora queremos quedarnos con la info de las jugadoras que llegaron a semifinales. Hay varias maneras de hacer esto,
la manera más sencilla para mi es elegir la ronda anterior (en este caso cuartos de final) y solo utilizar la info de 
las jugadoras que ganaron la instancia de cuartos de final (es decir, semifinalistas). Esto suena enredado pero es sencillo'

datos<-datos[round=='QF']

'Ahora solo tenemos en "datos" la info sobre los partidos de cuartos de final a nivel Grand Slam. Ahora si elegimos solo las ganadoras de
esta ronda, y que hayan entrado al torneo por Qualy, tendremos la info de las jugadoras que llegaron a SF provenientes de la qualy.
Para esto tenemos la info de "winner_entry" que brinda información sobre preclasificados, qualy etc.'

datos<-datos[winner_entry=='Q']

'Si llegaste hasta acá, en "datos" deberías tener 3 partidos:
  * 1978 en Australian open
  * 1999 en Wimbledon
  * 2020 en Roland Garros
Hoy 08/09/2021, Emma Raducanu no figura porque aun no esta cargada la base de datos porque no termino el torneo'
