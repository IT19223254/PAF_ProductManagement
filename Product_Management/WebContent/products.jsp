<%@ page import="com.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/products.js"></script>
<meta name="viewpoint" content="width=device-width, initial-scale=1">
<style>input[type=text], select, textarea {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
  
}

body{
	background-color: #D6EAF8;
	text-align:center;
}
h1{
  font-family: Broadway, Helvetica, sans-serif;
  font-size: 40px;
  color: #2980B9;
}
form{
	width:60%;
}
.container {
  padding: 20px; 
}
.txt-Lable{
	font-size:18px;
	font-weight: 600;
}
.save-Btn{
	width : 180px;
	
}
</style>

</head>
<body>

	
	
<div class="container"><div class="row"><div class="col-12">
	<h1>Product Details</h1>
 			

	<form id='formProduct' name='formProduct' method='post' action='products.jsp'>
	
		<!-- NAME -->
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
			<span class="txt-Lable" id="lblName">Product Name: </span>
			</div>
		<input type="text" id="productName" name="productName">
		</div>
		
		<!-- Price -->
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
			<span class="txt-Lable" id="lblName">Product Price: </span>
			</div>
		<input type="text" id="productPrice" name="productPrice">
		</div>
		
			
		<!-- Warranty -->
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
			<span class="txt-Lable" id="lblName">Product Warranty: </span>
			</div>	
			<select id="warrenty" name="warrenty">
				<option value="0">--Select warranty--</option>
				<option value="1">No Warranty</option>
				<option value="1">3 month</option>
				<option value="2">6 month</option>
				<option value="3">1 year</option>
				<option value="4">2 year</option>
				<option value="4">5 year</option>
			</select> 
		</div>
		
		<!-- Price -->
		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
			<span class="txt-Lable" id="lblName">Product Description: </span>
			</div>
		<input type="text" id="productDesc" name="productDesc">
		</div>
			
			<input id="btnSave" name="btnSave" type="button" value="Save" class='btn btn-primary save-Btn'>
			<input type='hidden' id='hidProductIDSave' name='hidProductIDSave' value=''>
	</form>
	


	<br>
	<div id="alertSuccess" class="alert alert-success"></div>
	
	<div id="alertError" class="alert alert-danger"></div>

	<br>
	<div id="divProductsGrid">
	<%
		Product productObj = new Product();
		out.print(productObj.readProduct());
	%>
	
	</div>
</div> </div> </div>
</body>
</html>