# Book "Principios y algoritmos de concurrencia"

29/02/2016: Abierto el repositorio del texo completo del libro. La rama master es la original del ebook, la rama paper tiene las modificaciones para el libro en papel


El código fuente de los ejemplos están en https://github.com/gallir/concurrencia

La página del libro: https://gallir.wordpress.com/principios-de-concurrencia/

EN Amazon (tapa blanda y Kindle): http://www.amazon.es/Principios-algoritmos-concurrencia-Ricardo-Granada/dp/1517029759/

En Google Play: https://play.google.com/store/books/details?id=cLXfCQAAQBAJ

Para generar epub y html hay que clonar también el repositorio del código el directorio "code" e instalar asciidoctor, docbook y a2x:

    make html
    
    make epub
    

De la rama paper se puede generar el PDF de la versión en tapa blanda, pero fue una pesadilla de instalaciones y modificaciones. No me preguntéis, pero acepto parches para instrucciones ;)

