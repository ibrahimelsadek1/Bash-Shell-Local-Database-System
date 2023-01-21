
user_name=$(whoami)
check_user=$(grep ^$user_name ./DB_admins.db)
if [[ $user_name == $check_user ]] 
then 
	echo "Hello, this is a list of the available databases"
	ls ./DataBases
	read -p "please enter the database name: " database_n4
		if [[ $user_name == $(grep ^$user_name ./DataBases/$database_n4/owner.txt) ]] 
		then 
			ls ./DataBases/$database_n4
			read -p "please enter the table name: " table_name
			cat ./DataBases/$database_n4/$table_name.table | head -1 ;
			num_of_cols=$(cat ./DataBases/$database_n4/$table_name.table | head -1 | tr ',' ' ' | wc -w);
			row_data=""
			flag6=0;
				for col in $(seq 1 $num_of_cols)
					do 
					column_name=$(cat ./DataBases/$database_n4/$table_name.table | head -1 |cut -d, -f$col )
					read -p "please enter $column_name : " col_value
							
								if [[ $col -eq 1 ]]
								then
									while [[ $(grep ^$col_value ./DataBases/$database_n4/$table_name.table | wc -l) -ge 1 ]]
									do
										echo "$column_name column must be unique "
										flag6=0
										read -p "please enter $column_name : " col_value
									done
								row_data=$row_data$col_value","	
								else
								flag6=1
								row_data=$row_data$col_value","	
								fi
					done
					
					if [[ $flag6 -eq 1 ]]
					then				
						echo " data entered is:  " ${row_data::len-1}
						echo ${row_data::len-1} >> ./DataBases/$database_n4/$table_name.table
						echo "Data has been added succesfully"
						cat ./DataBases/$database_n4/$table_name.table
					
					else 
					echo "please try again "
					. InsertData.sh
					fi
		else 
		  echo "Sorry, you are not the owner of the database"
		  . InsertData.sh
		fi
else 
echo "You are not authorized to create a table"
fi

