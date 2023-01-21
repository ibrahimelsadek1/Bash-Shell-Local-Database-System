
user_name=$(whoami)
check_user=$(grep ^$user_name ./DB_admins.db)
if [[ $user_name == $check_user ]] 
then 
	echo "Hello, please enter the database name you want to create"
	read database_n
		if [[ -z $(ls  ./DataBases | grep $database_n) ]] 
		then 
		mkdir -p ./DataBases/$database_n
		touch ./DataBases/$database_n/owner.txt
		echo $user_name >> ./DataBases/$database_n/owner.txt
		echo "DataBase $database_n has been created"
		else 
		  echo "DataBase $database_n already existed!"
		  . createDB.sh
		fi
else 
echo "You are not authorized to delete a database!"
fi
