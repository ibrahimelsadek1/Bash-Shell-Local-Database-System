
user_name=$(whoami)
check_user=$(grep ^$user_name ./DB_admins.db)
if [[ $user_name == $check_user ]] 
then 
	echo "Hello, here is the list of users"
	cat ./DB_admins.db
	echo "Please enter user you want to delete"
	read del_user
		if [[ $del_user == "Oracle" ]] 
		then
		echo "user oracle cannot be deleted"
		. DeleteDBuser.sh
		else 
		  sed -i "/$del_user/d" ./DB_admins.db                  
		  echo "user $del_user has been deleted"
		  echo "the rest of users"
		  cat ./DB_admins.db
		fi
else 
echo "You are not authorized to delete a user!"
fi
