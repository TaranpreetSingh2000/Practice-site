<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<template:addResources type="javascript" resources="jquery.js" />


<c:set var="name" value="${currentNode.properties['name'].string}" />
<c:set var="position" value="${currentNode.properties['position'].string}" />
<c:set var="office" value="${currentNode.properties['office'].string}" />
<c:set var="age" value="${currentNode.properties['age'].string}" />
<c:set var="startdate" value="${currentNode.properties['startdate'].string}" />
<c:set var="salary" value="${currentNode.properties['salary'].string}" />


<div >
    <table id="example" class="datatable my-10" class="display" style="width:100%">
        <thead>
            <tr>
                <th>${name}</th>
                <th>${position}</th>
                <th>${office}</th>
                <th>${age}</th>
                <th>${datenew}</th>
                <th>${salary}</th>
            </tr>
        </thead>

        <tbody>
            <c:set var="rows" value="${jcr:getChildrenOfType(currentNode, 'ptnt:datarows')}" />
            <c:forEach items="${rows}" var="row" varStatus="item">
                <template:module node="${row}" nodeTypes="ptnt:datarows" editable="true" view="" />
            </c:forEach>
        </tbody>
        </table>
    </div>   
    
    <c:if test="${renderContext.editMode}">
        <template:module path="*" nodeTypes="ptnt:datarows" />
    </c:if>


    <script>
        $(document).ready(function () {
            let table = $('#example').DataTable({
                paging: true,
                searching: true,
                info: true
            });

            $('#example tbody').on('click', 'tr', function () {
                let data = table.row(this).data();
                alert('You clicked on ' + data[0] + "'s row");
            });
        });
    </script>