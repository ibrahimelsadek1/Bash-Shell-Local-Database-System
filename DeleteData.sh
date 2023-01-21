

echo "Hello, this is a list of the available databases"
ls ./DataBases
read -p "please enter the database name: " database_n8
ls ./DataBases/$database_n8
read -p "please enter the table name: " table_name8
cat ./DataBases/$database_n8/$table_name8.table
read -p "please enter the string you want to delete: " del_row 
sed -i "/$del_row/d" ./DataBases/$database_n8/$table_name8.table
cat ./DataBases/$database_n8/$table_name8.table


