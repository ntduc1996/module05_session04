<%--
  Created by IntelliJ IDEA.
  User: asahi
  Date: 8/4/2025
  Time: 7:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Category</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/CategoryController?action=Create" method="post">
    <label for="categoryName">Category Name</label>
    <input type="text" id="categoryName" name="categoryName" value="${category.categoryName}"/><br>
    <label for="description">Description</label>
    <input type="text" id="description" name="description" value="${category.description}"/><br>
    <label for="categoryStatus">Status</label>
    <input type="radio" id="active" name="categoryStatus" value="true"
<%--           <c:if test="${category.categoryStatus == true}">checked</c:if> />--%>
    <label for="active">Active</label>

    <input type="radio" id="unActive" name="categoryStatus" value="false"
<%--           <c:if test="${category.categoryStatus == false}">checked</c:if> />--%>
    <label for="unActive">Unactive</label><br>

    <input type="submit" value="Add Category"/>
</form>
</body>
</html>
