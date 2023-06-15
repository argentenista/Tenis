# si las librearias no estan instaladas se installan poniendo: install.packages("ggplot2") y luego install.packages("reshape2")
library(ggplot2)
library(reshape2)

# Aca cargo los datos, cada renglon es una punta del grafico
# En cada renglon, el primer dato corresponde a Lendl, el segundo a Connors, etc
datos <- data.frame(
  Player = c("Ivan Lendl", "Jimmy Connors", "Stefan Edberg"),
  Hard = c(82.4, 82.6,78.8),
  Clay = c(81.03, 77.8,68.0),
  Grass = c(75.0, 82.9,78.6),
  Carpet = c(83.0,82.3,70.8),
  GS = c(81.9, 82.6,79.1),
  M1000 = c(80.1, 69.7,72.9),
  ATP = c(82.6, 83.4, 75.3),
  Top10 = c(64.2, 51.8, 46.5)
)

# la siguiente linea te reacomoda los datos para poder graficarlos
datos_largo <- reshape2::melt(datos, id.vars = "Player")

# esta parte hace el grafico
ggplot(datos_largo, aes(x = variable, y = value, group = player, color = player)) +
  # en el renglon de abajo si cambias NA por TRUE, te rellena el grafico, puede quedar bien
  geom_polygon(fill = NA, alpha = 0.5) + 
  # El 3 es el tamaño del punto
  geom_point(size = 3) +
  coord_polar(start = -pi/2) +
  theme_minimal() +
  # aca se puede agregar texto adentro de las comillas, el primer renglon es el titulo y el resto los ejes
  labs(title = "",
       x = "",
       y = "")+
  # aca abajo, nudge_x,nudge_y, hjust y vjust permiten mover las etiquetas que dicen los porcentajes para que se vean
  geom_text(
    aes(label = paste0(value, "%")), 
    nudge_x = 0.25, 
    nudge_y = 0,
    hjust = 0.25, 
    vjust = 0.5,
    size = 4, # esto es el tamaño de la letra de las etiquetas
    check_overlap = TRUE # esto si esta TRUE omite algunas etiquetas para que no se superpongan, sino poner FALSE
  )

#############################################################################################
# el grafico de abajo hace lo mismo, con la diferencia que los ejes van del 0% al 100% siempre
# el grafico de arriba va del minimo % al maximo % por eso da la sensacion de zoom


library(ggplot2)
library(reshape2)
datos <- data.frame(
  player = c("Novak Djokovic", "Rafael Nadal", "Roger Federer"),
  hard = c(84.4, 77.9,83.4),
  clay = c(80.4, 91.3,76.1),
  grass = c(85.8, 79.2,86.9),
  GS = c(87.7, 88.2,86.0),
  M1000 = c(82.1, 82.2,77.9),
  ATP = c(81.7, 81.4, 81.1),
  Top10 = c(69.2, 64.6, 64.6)
)
datos_largo <- reshape2::melt(datos, id.vars = "player")

# Crear el grafico spider
ggplot(datos_largo, aes(x = variable, y = value, group = player, color = player)) +
  geom_polygon(fill = NA, alpha = 0.5) +
  geom_point(size = 3) +
  coord_polar(start = -pi/2) +
  theme_minimal() +
  labs(title = "",
       x = "",
       y = "") +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray") +
  geom_hline(yintercept = 100, linetype = "dashed", color = "gray") +
  geom_vline(xintercept = seq(0, 6, 1), linetype = "dashed", color = "gray") +
  scale_y_continuous(limits = c(0, 100), breaks = c(0, 25, 50, 75, 100), labels = c("", "", "", "", "")) +
  geom_text(
    aes(label = paste0(value, "%")), 
    nudge_x = 0.25, 
    nudge_y = 0,
    hjust = 0.25, 
    vjust = 0.5,
    size = 4,
    check_overlap = TRUE
  )

