<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>${fn:escapeXml(renderContext.mainResource.node.displayableName)}</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">   
</head>

<body class="bg-gray-100 min-h-screen">
    <!-- left-nav.html -->
     
    <template:area path="header" moduleType="absoluteArea" level="0"/>
<div id="wrapperContainer" class="bodywrapper font-Lato flex flex-col lg:flex-row"><!--start bodywrapper-->
    <div class="container mx-auto px-6 py-8 w-full">
        <template:area path="mainContent"/>
    </div>


</div>
<!--stop bodywrapper-->
<template:addResources type="css" resources="output.css" />
<c:if test="${renderContext.editMode}">
    <template:addResources type="css" resources="edit.css" />
</c:if>
<template:addResources type="css" resources="960.css,01web.css"/>
<template:theme/>

<!-- <template:addResources type="css" resources="image.css" /> -->

<template:addResources type="css" resources="fonts.css" />


<!-- <script src="/modules/medica-component/javascript/medica/apiManager.js"></script> -->
<!-- <script src="/modules/medica-component/javascript/medica/app.js"></script> -->
<!-- <script src="/modules/medica-component/javascript/medica/signIn.js"></script> -->

</body>
</html>
