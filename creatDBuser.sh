
user_name=$(whoami)
check_user=$(grep ^$user_name ./DB_admins.db)
if [[ $user_name == $check_user ]] 
then 
	echo "Hello, please enter a name for the new user"
	read new_user
		if [[ -z $(grep -i ^$new_user  ./DB_admins.db) ]] 
		then 	echo $new_user >> ./DB_admins.db
				echo "User $new_user has been created"
                                cat ./DB_admins.db
		else 
				echo "Username $new_user already existed please try again"
				. creatDBuser.sh
		fi
else 
echo "You are not authorized to create a user!"
fi

