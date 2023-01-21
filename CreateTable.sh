
user_name=$(whoami)
check_user=$(grep ^$user_name ./DB_admins.db)
if [[ $user_name == $check_user ]] 
then 
	echo "Hello, this is a list of the available databases"
	ls ./DataBases
	read -p "please enter the database name you want to create a table inside it: " database_n3
		if [[ $user_name == $(grep ^$user_name ./DataBases/$database_n3/owner.txt) ]] 
		then 
			read -p "please enter the table name: " table_name
			read -p "Please enter number of columns you want to create: " cols_num
				if [[ -z $(ls  ./DataBases/$database_n3 | grep $table_name) ]] 
				then
				touch ./DataBases/$database_n3/$table_name.table
				header=""
					for col in $(seq 1 $cols_num)
					do 
					read -p "please enter the name of coulmn number $col : " col_name
					header=$header$col_name","
					done
				else 
					echo "Table already existed!"
					. CreateTable.sh
				fi
			echo " header is  " ${header::len-1}
			echo ${header::len-1} >> ./DataBases/$database_n3/$table_name.table
			echo "table $table_name has been created succesfully"
			cat ./DataBases/$database_n3/$table_name.table
		else 
		  echo "Sorry, you are not the owner of the database"
		  . CreateTable.sh
		fi
else 
echo "You are not authorized to create a table"
fi

