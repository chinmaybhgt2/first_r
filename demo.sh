

option()
{

	value=$1

	case $value in
	1)
		# Creates New Directory
		clear
		echo "Please Enter Directory Name : "
		read dir_name

		mkdir -p $dir_name
		echo "Your Directory $dir_name has been Susscesfully created "
		read garbage
	;;
	  

	2)
		# Create New File
		clear
		echo "Please Enter File Name : "
		read f_name
		cat > $f_name
	
	;;

	3)
		# Rename File / Move File     
		clear 
		echo "Please Enter OLD File name :"
		read old

		if [ -f "$old" ]
		then
			echo "Please New Name : "
			read new
			mv $old $new
			echo "Renamed From $old --> $new "
	
		else
			echo "Sorry, $old not found."
		fi
		read garbage


	;;

	4)
		# Remove Directory
		clear
		echo "Please Enter Directory name for Remove: "
		read rm_name	
		rmdir $rm_name
		echo "Directory $rm_name is Successfully Removed...."
		read garbage
	;;

	5)
		# Mearge two files into third
		clear
		echo "Please Enter First File Name"
		read first
		echo "Please Enter Secoend File Name"
		read secoend

		echo "Please Enter File name for combine data"
		read combine
	
		cat $first $secoend >> $combine


	;;


	6)
		# Show the content of the file
		clear
		echo "Please Enter File Name : "
		read fname


		if [ -f "$fname" ]
		then
			cat -n $fname | more -5
		else
			echo "Sorry, $fname not found."
		fi


		read garbage

	;;


	7)
		# Find into the file
		clear
		echo "Please Enter File Name : "
		read filename

		if [ -f "$filename" ]
		then
			echo "Please Enter Keyword : "
			read keyword
				
			grep -n -i $keyword $filename 
			#cat tmp.txt
		else
			echo "Sorry, $filename not found."
		fi

		read garbage
	;;


	8)
		# Show Hidden files
		clear
		echo "Hidden Files in your Directory are...."
		ls -ld .?*
		read garbage

	;;

	9)
		# Edit File Permitiions
		clear
		echo "Please Enter the File Name : "
		read fname
	
		if [ -f "$fname" ]
		then
			echo "Please Enter Permition Value in 3 Digit i.e User-Group-Other "
			read permition

			LEN=$(echo ${#permition})
			if [ $LEN -le 3 -a $LEN -ge 3 ]
			then

				chmod $permition $fname
				echo "Permition Successfully Changed of file $fname"
			else
				echo "!!!...Please Enter Premition value in proper formate...."
			fi

		else
			echo "Sorry, $fname not found."
		fi

		read garbage


	;;

	10)
		watch -n1  cat test2.txt
	;;

	11)
		# out from the loop
		echo "EXIT"
		;;

	*) 
		echo "Wrong Input"

	esac
}





answer=0

until [ ! $answer -ne 11 ]
do
clear
	
	echo "1) Create Directory"
	echo "2) Create File"
 	echo "3) Rename File"
	echo "4) Remove Directory"
	echo "5) Combine Two Files"
	echo "6) Show file Contents"
	echo "7) Find in a File"
	echo "8) Show Hidden files in Current Directory"
	echo "9) Change Permition of File"
	echo "10) View Log"
 	echo "11) EXIT"
	
	echo ""
	echo "Please Select Value : "
	read  answer


option $answer

done


