user_name=$(whoami)
check_user=$(grep ^$user_name ./DB_admins.db)
if [[ $user_name == $check_user ]] 
then 
	echo "Hello, this is a list of the available databases"
	ls ./DataBases
	echo "please enter the database name you want to delete"
	read database_n2
		if [[ $user_name == $(cat ./DataBases/$database_n2/owner.txt) ]] 
		then 
		rm -r -f ./DataBases/$database_n2
		echo "DataBase $database_n2 has been deleted"
		else 
		  echo "Sorry, you are not the owner of the database"
		  . DeleteDB.sh
		fi
else 
echo "You are not authorized to delete a database!"
fi

