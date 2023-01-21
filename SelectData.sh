
echo "Hello, this is a list of the available databases"
ls ./DataBases
read -p "please enter the database name: " database_n7
ls ./DataBases/$database_n7
read -p "please enter the table name: " table_name7

select z in "Show table content" "Search inside a table"
do
	case $z in 
	("Show table content") 
		cat ./DataBases/$database_n7/$table_name7.table
	;;
	("Search inside a table") 
		read -p "enter a keyword to search for it: " key_word
		grep $key_word  ./DataBases/$database_n7/$table_name7.table
	;;
	(*)
		echo "Wrong choice :) please try again"
	;;
	esac
break;
done


