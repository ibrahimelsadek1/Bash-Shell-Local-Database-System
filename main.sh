select x in "Create Database user" "Delete Database user" "Create new Database" "Delete Database" "Create Table" "Insert Row" "Select Data" "Delete Data"
do

case $x in 
("Create Database user") 	bash creatDBuser.sh
;;
("Delete Database user") 	bash DeleteDBuser.sh
;;
("Create new Database") 	bash createDB.sh
;;	
("Delete Database")			bash DeleteDB.sh
;;
("Create Table")			bash CreateTable.sh
;;
("Insert Row")				bash InsertData.sh
;;
("Select Data")				bash SelectData.sh
;;
("Delete Data")				bash DeleteData.sh
;;
(*)
echo "wrong choice plese try agian"  
. main.sh
;;
esac
break
done
