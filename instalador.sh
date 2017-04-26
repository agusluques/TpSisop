#INSTALADOR

############################## CONSTANTES ###################################

#Declaro el PATH donde se debe trabajar SIEMPRE
GRUPO=`pwd`"/Grupo01/"

#Declaro subdirectorio dirconf (RESERVADO)
DIRCONF="$GRUPO""dirconf/"

#PATH al archivo de config
ARCHCONF="$DIRCONF""arch.conf"

#Declaro subdirectorio ejecutable (DEFAULT)
DIRBIN="$GRUPO""bin/"

#Declaro subdirectorio maestros (DEFAULT)
DIRMA="$GRUPO""maestros/"

#Declaro subdirectorio novedades (DEFAULT)
DIRNOV="$GRUPO""novedades/"

#Declaro subdirectorio aceptados (DEFAULT)
DIRACE="$GRUPO""aceptados/"

#Declaro subdirectorio rechazados (DEFAULT)
DIRREJ="$GRUPO""rechazados/"

#Declaro subdirectorio validados (DEFAULT)
DIRVAL="$GRUPO""validados/"

#Declaro subdirectorio de reporte (DEFAULT)
DIRREP="$GRUPO""reportes/"

#Declaro subdirectorio log (DEFAULT)
DIRLOG="$GRUPO""log/"

LOGFILE="$DIRCONF""insta.log"
##############################################################################

############################# PROCEDIMIENTOS #################################


crearArchivoDeLog(){

if [ ! -f "$LOGFILE" ]; then
    touch $LOGFILE
    if [ ! -f "$LOGFILE" ]; then
        echo "No existe $LOGFILE y no se puede generar"
        exit
    else
	return 0
    fi
else
	return 0	
fi

}
chequeoPerl(){

	echo "Chequeando Perl..."
	WHEN=`date "+%Y/%m/%d %T"`
      	WHO=$USER
     	echo -e "$WHEN - $WHO - instalador - Info-InstalandoPerl " >> $LOGFILE
	echo
	echo
	#Con el primer comando me quedo con la segunda linea de perl -v
	#Con el segundo me quedo con la version
	PERLV=`perl -v | sed -e 2b -e '$!d'`
	VERSION=`echo "$PERLV" | sed 's/^.*perl\ \([0-9]\).*$/\1/g'`

	if [ "$VERSION" -lt "5" ]; then
		echo "Debe instalar Perl 5 o superior"
		WHEN=`date "+%Y/%m/%d %T"`
      		WHO=$USER
     		echo -e "$WHEN - $WHO - instalador -Debe instalar Perl 5 o superior  " >> $LOGFILE
		echo
		echo
	else
		echo "Perl 5 o superior instalado"
		WHEN=`date "+%Y/%m/%d %T"`
      		WHO=$USER
     		echo -e "$WHEN - $WHO - instalador -Perl 5 o superior instalado  " >> $LOGFILE
		echo
	fi

}

borrarDirectorios(){
	rm -r "$DIRBIN" 
	rm -r "$DIRMA"
	rm -r "$DIRNOV"
	rm -r "$DIRACE"
	rm -r "$DIRREJ"
	rm -r "$DIRVAL"
	rm -r "$DIRREP"
	rm -r "$DIRLOG"
}

definirNombresDirectorios(){

	echo "A continuacion, ingrese los nombres de los directorios sin '/'."
	echo "En caso de desear el de DEFAULT, presionar ENTER."
	echo

	CORTE=false

	while [ "$CORTE" = false ]; do

		echo "DIRECTORIO PARA EJECUTABLES"
		echo "DEFAULT $DIRBIN"
		
		echo
		read INPUT
		if [ "$INPUT" != "dirconf" ] && [ ! -e "$GRUPO$INPUT/" ] ; then
			CORTE=true
			DIRBIN="$GRUPO""$INPUT""/"
			mkdir "$DIRBIN"
		elif [ -z "$INPUT" ]; then
			mkdir "$DIRBIN"
			CORTE=true
		else
			echo
			echo "DIRECTORIO INCORRECTO!!!!!"
			echo "Verifique que el nombre no sea: "
			echo "Duplicado o igual a \"dirconf\""
			echo
		fi

	done

	CORTE=false

	while [ "$CORTE" = false ]; do

		echo "DIRECTORIO PARA MAESTROS"
		echo "DEFAULT $DIRMA"
		echo
		read INPUT
		if [ "$INPUT" != "dirconf" ] && [ ! -e "$GRUPO$INPUT/" ] ; then
			CORTE=true
			DIRMA="$GRUPO""$INPUT""/"
			mkdir "$DIRMA"
		elif [ -z "$INPUT" ]; then
			mkdir "$DIRMA"
			CORTE=true
		else
			echo
			echo "DIRECTORIO INCORRECTO!!!!!"
			echo "Verifique que el nombre no sea: "
			echo "Duplicado o igual a \"dirconf\""
			echo
		fi

	done

	CORTE=false

	while [ "$CORTE" = false ]; do

		echo "DIRECTORIO PARA NOVEDADES"
		echo "DEFAULT $DIRNOV"
		echo
		read INPUT
		if [ "$INPUT" != "dirconf" ] && [ ! -e "$GRUPO$INPUT/" ] ; then
			CORTE=true
			DIRNOV="$GRUPO""$INPUT""/"
			mkdir "$DIRNOV"
		elif [ -z "$INPUT" ]; then
			mkdir "$DIRNOV"
			CORTE=true
		else
			echo
			echo "DIRECTORIO INCORRECTO!!!!!"
			echo "Verifique que el nombre no sea: "
			echo "Duplicado o igual a \"dirconf\""
			echo
		fi

	done

	CORTE=false

	while [ "$CORTE" = false ]; do

		echo "DIRECTORIO PARA ACEPTADOS"
		echo "DEFAULT $DIRACE"
		echo
		read INPUT
		if [ "$INPUT" != "dirconf" ] && [ ! -e "$GRUPO$INPUT/" ] ; then
			CORTE=true
			DIRACE="$GRUPO""$INPUT""/"
			mkdir "$DIRACE"
		elif [ -z "$INPUT" ]; then
			mkdir "$DIRACE"
			CORTE=true
		else
			echo
			echo "DIRECTORIO INCORRECTO!!!!!"
			echo "Verifique que el nombre no sea: "
			echo "Duplicado o igual a \"dirconf\""
			echo
		fi

	done

	CORTE=false

	while [ "$CORTE" = false ]; do

		echo "DIRECTORIO PARA RECHAZADOS"
		echo "DEFAULT $DIRREJ"
		echo
		read INPUT
		if [ "$INPUT" != "dirconf" ] && [ ! -e "$GRUPO$INPUT/" ] ; then
			CORTE=true
			DIRREJ="$GRUPO""$INPUT""/"
			mkdir "$DIRREJ"
		elif [ -z "$INPUT" ]; then
			mkdir "$DIRREJ"
			CORTE=true
		else
			echo
			echo "DIRECTORIO INCORRECTO!!!!!"
			echo "Verifique que el nombre no sea: "
			echo "Duplicado o igual a \"dirconf\""
			echo
		fi

	done

	CORTE=false

	while [ "$CORTE" = false ]; do

		echo "DIRECTORIO PARA VALIDADOS"
		echo "DEFAULT $DIRVAL"
		echo
		read INPUT
		if [ "$INPUT" != "dirconf" ] && [ ! -e "$GRUPO$INPUT/" ] ; then
			CORTE=true
			DIRVAL="$GRUPO""$INPUT""/"
			mkdir "$DIRVAL"
		elif [ -z "$INPUT" ]; then
			mkdir "$DIRVAL"
			CORTE=true
		else
			echo
			echo "DIRECTORIO INCORRECTO!!!!!"
			echo "Verifique que el nombre no sea: "
			echo "Duplicado o igual a \"dirconf\""
			echo
		fi

	done

	CORTE=false

	while [ "$CORTE" = false ]; do

		echo "DIRECTORIO PARA REPORTES"
		echo "DEFAULT $DIRREP"
		echo
		read INPUT
		if [ "$INPUT" != "dirconf" ] && [ ! -e "$GRUPO$INPUT/" ] ; then
			CORTE=true
			DIRREP="$GRUPO""$INPUT""/"
			mkdir "$DIRREP"
		elif [ -z "$INPUT" ]; then
			mkdir "$DIRREP"			
			CORTE=true
		else
			echo
			echo "DIRECTORIO INCORRECTO!!!!!"
			echo "Verifique que el nombre no sea: "
			echo "Duplicado o igual a \"dirconf\""
			echo
		fi

	done

	CORTE=false

	while [ "$CORTE" = false ]; do

		echo "DIRECTORIO PARA LOGS"
		echo "DEFAULT $DIRLOG"
		echo
		read INPUT
		if [ "$INPUT" != "dirconf" ] && [ ! -e "$GRUPO$INPUT/" ] ; then
			CORTE=true
			DIRLOG="$GRUPO""$INPUT""/"
			mkdir "$DIRLOG"
		elif [ -z "$INPUT" ]; then
			mkdir "$DIRLOG"
			CORTE=true
		else
			echo
			echo "DIRECTORIO INCORRECTO!!!!!"
			echo "Verifique que el nombre no sea: "
			echo "Duplicado o igual a \"dirconf\""
			echo
		fi

	done

	CORTE=false

	while [ "$CORTE" = false ]; do
		echo "LOS VALORES INDICADOS SON: "
		echo
		echo "EJECUTABLES=$DIRBIN"
		echo "MAESTROS=$DIRMA"
		echo "NOVEDADES=$DIRNOV"
		echo "ACEPTADOS=$DIRACE"
		echo "RECHAZADOS=$DIRREJ"
		echo "VALIDADOS=$DIRVAL"
		echo "REPORTES=$DIRREP"
		echo "LOGS=$DIRLOG"
		echo
		echo "Si desea editar alguno presione Editar. Si no, presione Ok."
		read INPUT
		if [ "$INPUT" = "Ok" ]; then
			CORTE=true
		elif [ "$INPUT" = "Editar" ]; then
			borrarDirectorios
			definirNombresDirectorios
			CORTE=true
		fi
	done


}

grabarArchConf(){
	FECHA=`date "+%d/%m/%Y %H:%M"`
	USR="$USER"

	mkdir "$DIRCONF"


	echo "GRUPO=$GRUPO=$USR=$FECHA" >> "$ARCHCONF"
	echo "DIRCONF=$DIRCONF=$USR=$FECHA" >> "$ARCHCONF"
	echo "DIRBIN=$DIRBIN=$USR=$FECHA" >> "$ARCHCONF"
	echo "DIRMA=$DIRMA=$USR=$FECHA" >> "$ARCHCONF"
	echo "DIRNOV=$DIRNOV=$USR=$FECHA" >> "$ARCHCONF"
	echo "DIRACE=$DIRACE=$USR=$FECHA" >> "$ARCHCONF"
	echo "DIRREJ=$DIRREJ=$USR=$FECHA" >> "$ARCHCONF"
	echo "DIRVAL=$DIRVAL=$USR=$FECHA" >> "$ARCHCONF"
	echo "DIRREP=$DIRREP=$USR=$FECHA" >> "$ARCHCONF"
	echo "DIRLOG=$DIRLOG=$USR=$FECHA" >> "$ARCHCONF"
	echo "ARCHCONF=$ARCHCONF=$USR=$FECHA" >> "$ARCHCONF"

}

##############################################################################

################################### MAIN ####################################
if [ "$#" != 1 ]; then
	echo "Modo de uso: $0 [argumento]"
	exit 0
fi

if [ "$1" = "-t" ]; then

	if [ -e "$ARCHCONF" ]; then
		echo "El sistema está instalado"
		echo "Contenido del archivo $ARCHCONF:"
		echo
		cat "$ARCHCONF"
		echo
		echo
		exit 0
	else
		echo "El sistema no está instalado"
		echo
		exit 1
	fi
	
fi

chequeoPerl

if [ "$1" = "-i" ]; then
	
	if [ ! -e "$ARCHCONF" ]; then
		echo "Instalando sistema..."
		WHEN=`date "+%Y/%m/%d %T"`
      		WHO=$USER
     		echo -e "$WHEN - $WHO - instalador - Info-Instalando sistema... " >> $LOGFILE
		echo
		echo "Creando $GRUPO ..."
		mkdir "$GRUPO"
		definirNombresDirectorios
		grabarArchConf
	else
		echo 
		#reinstalacion (Sprint2)
		WHEN=`date "+%Y/%m/%d %T"`
      		WHO=$USER
     		echo -e "$WHEN - $WHO - instalador - Info-Re Instalando sistema... " >> $LOGFILE
		echo
	fi

fi





	



##############################################################################
