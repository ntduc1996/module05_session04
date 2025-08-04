<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asahi
  Date: 8/4/2025
  Time: 6:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update </title>
</head>
<body>
<form action="<%=request.getContextPath()%>/CategoryController?action=Update" method="post">
    <label for="categoryId">categoryId</label>
    <input type="text" id="categoryId" name="categoryId" value="${category.id}" readonly/><br>
    <label for="categoryName">Category Name</label>
    <input type="text" id="categoryName" name="categoryName" value="${category.categoryName}"/><br>
    <label for="description">Description</label>
    <input type="text" id="description" name="description" value="${category.description}"/><br>
    <label for="categoryStatus">Status</label>
    <input type="radio" id="active" name="categoryStatus" value="true"
           <c:if test="${category.categoryStatus == true}">checked</c:if> />
    <label for="active">Active</label>

    <input type="radio" id="unActive" name="categoryStatus" value="false"
           <c:if test="${category.categoryStatus == false}">checked</c:if> />
    <label for="unActive">Unactive</label><br>

    <input type="submit" value="Update"/>
</form>
</body>
</html>

