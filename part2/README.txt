1.NAME: JINGZHE SONG; KUN RONG

2.LIST OF FILES: 
1)A transcript of schema--expdat.dmp
2)queries.txt
3)README.txt
4)a transcript of schema in txt format--schema.txt

3.Oracle account name: js4153 @adb2

4.The object type is named "customer_typ",an object specification and 
object body are defined in the "Create type body customer_type" .
The object type "customer_typ" are composed of attributes and methods.
    The attributes of "customer_typ" are "cid""name""phone" and "address".
They contain the data of customers.
    The "orders" table is a new relation of the object type, it is a relational 
table with an object type "customer_typ",and additional information of 
customers--that is, how many orders each customer has made.
    We define method get_cid() in the object type "customer_typ" to display 
customer id number in the "orders" table. This is a member method. 
    The built-in parameter SELF makes it simpler to write member methods.
Our project takes the advantage of SELF to omit qualification of the attributes
cid, name, phone and address.