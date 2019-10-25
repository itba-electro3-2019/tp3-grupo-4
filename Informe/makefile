# Makefile para compilar latex
#

#Nombre del informe
INFORME = Informe
#Archivos secundarios a eliminar
OTHER = *.aux *.gz *.log *.toc *.dvi

informe: $(INFORME).tex
	pdflatex -synctex=1 -interaction=nonstopmode $(INFORME).tex
	rm -rf $(OTHER)
