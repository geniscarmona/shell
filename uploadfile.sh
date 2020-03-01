arxi=$(zenity --title="Archivos a subir al repositorio" --entry --text "Cuantos archivos quieres subir")
function upload(){

 	while [[ $arxi -ne 0 ]]; do
 		let arxi=$arxi-1
 		nom=$(zenity --title="$arxi archivo" --entry --text "Escribir el archivo a subir")
 		if [[ -f $nom ]]; then
 			echo git add $nom
 		else
 			echo El archivos selecionado $nom no existen en este equipo
 			
 		fi
 		
 	done

 	zenity --question --text "¿Quieres comprobar el estado de stagigng index?"
 	if [[ $? -eq 0 ]]; then
 		git status
 		opti=$(zenity --question --text "¿Subir repositorios a Github?")
 		if [[ $opti = "Si" ]]; then
 			git commit
 			else
 				exit

 		fi
 	fi
 	
 	
}
upload


	
 
 