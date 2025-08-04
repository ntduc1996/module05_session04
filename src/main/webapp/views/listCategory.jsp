<%--
  Created by IntelliJ IDEA.
  User: asahi
  Date: 8/4/2025
  Time: 5:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Category</title>
</head>
<body>
<h3>List Category</h3>
<table border="1">
    <thead>
    <tr>
        <td>No</td>
        <td>Mã Danh mục</td>
        <td>Tên danh mục</td>
        <td>Mô tả</td>
        <td>Trạng thái</td>
        <td>Actions</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${categories}" var="category" varStatus="loop">
        <tr>
            <td>${loop.index + 1}</td>
            <td>${category.id}</td>
            <td>${category.categoryName}</td>
            <td>${category.description}</td>
            <td>
                <c:choose>
                    <c:when test="${category.categoryStatus}">
                        Active
                    </c:when>
                    <c:otherwise>
                        Unactive
                    </c:otherwise>
                </c:choose>
            </td>

            <td>
                <c:url var="updateUrl" value="/CategoryController">
                    <c:param name="action" value="initUpdate"/>
                    <c:param name="id" value="${category.id}"/>
                </c:url>
                <a href="${updateUrl}">Update</a>

                <c:url var="deleteUrl" value="/CategoryController">
                    <c:param name="action" value="delete"/>
                    <c:param name="id" value="${category.id}"/>
                </c:url>
                <a href="${deleteUrl}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="<%= request.getContextPath()%>/views/newCatagory.jsp">Thêm danh mục mới</a>
</body>
</html>
