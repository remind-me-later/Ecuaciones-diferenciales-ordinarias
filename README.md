# Ecuaciones diferenciales ordinarias

Apuntes de ecuaciones diferenciales ordinarias.

## Requisitos

Los Makefile utilizan xelatex, latexmk y pdfcrop. Para compilar basta hacer
`make` en la raíz.

## Estructura

Dentro de la carpeta `sty` se encuentran las macros personalizadas usadas en el
proyecto. El código fuente está en `src`, dentro de esta carpeta se encuentra el
archivo principal del proyecto `main` junto a una carpeta por cada capítulo.

Dentro de las carpetas de los capítulos hay dos archivos `teoria.tex` y
`problemas.tex` el primero con la teoría (los capítulos) y el segundo con los 
problemas referentes al capítulo en cuestión (sección en el apéndice de 
problemas resueltos). Opcionalmente puede haber una carpeta `figuras` con las 
figuras en tikz usadas en el capítulo. En esta carpeta se encuentran los
archivos con el código en tikz así como un Makefile que compila todas las
figuras del capítulo y las guarda en la subcarpeta `pdf`. Esto permite compilar
rápidamente las figuras mientras se editan y evita que sean compiladas cada vez
que se compila el proyecto.
