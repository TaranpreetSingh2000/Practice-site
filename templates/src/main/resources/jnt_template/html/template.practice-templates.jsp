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
<div id="hamburgerMenu" class="cursor fixed top-0 left-0 h-full w-64 bg-gray-800 z-10 text-white transform -translate-x-full transition-transform z-[999]">
    <div class="p-4">
        <div class="menu-bar flex justify-between items-baseline">
            <h2 class="text-lg font-semibold mb-4">Menu</h2>
            <span class="close-button cursor-pointer">&#10005;</span>
        </div>
        <!-- <nav>
            <a href="/sites/medica/dashboard.html" class="block py-2 hover:bg-gray-700">Dashboard</a>
            <a href="/sites/medica/dashboard/claims-summary.html" class="block py-2 hover:bg-gray-700">Claims Summary</a>
            <a href="/sites/medica/dashboard/spending-summary.html" class="block py-2 hover:bg-gray-700">Spending Summary</a>
            <a href="/sites/medica/dashboard/family-members.html" class="block py-2 hover:bg-gray-700">Family Members</a>
            
        </nav> -->
    </div>
</div>

    <header style="background-color: rgb(13, 35, 50) !important;" class="bg-blue-500 text-white p-4 flex justify-between items-center">
        <button id="hamburgerButton" class="text-white">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16">
                </path>
            </svg>
        </button>
        <span class="userName text-white uppercase">Hello</span>
        <div class="familyMembers items-center">
            <label for="familyMemberDropdown" class="mr-2">Switch Member:</label>
            <select id="familyMemberDropdown" class="bg-white text-black px-4 py-2 rounded"
                onchange="switchFamilyMember()">
            </select>
        </div>
        <div class="flex gap-6 items-center">
            <!-- <a href="/sites/medica/home/dashboard.html" class="text-white cursor-pointer">Dashboard</a>
            <button onclick="logout()" class="logoutBtn text-white">Logout</button>
            <a href="/sites/medica/home/sign-in.html" class="signBtn text-white cursor-pointer">Sign in</a> -->
        </div>
    </header>
<template:area path="header" moduleType="absoluteArea" level="0"/>
<div id="wrapperContainer" class="bodywrapper font-Lato flex flex-col lg:flex-row"><!--start bodywrapper-->
    <div class="container mx-auto p-6 lg:w-3/4">
        <template:area path="mainContent"/>
    </div>
    <div class="lg:w-1/4 p-6 space-y-6 ">
        <template:area path="asideContent" moduleType="absoluteArea" level="0"/>
    </div>
</div>
<!--stop bodywrapper-->
<template:addResources type="css" resources="output.css" />
<c:if test="${renderContext.editMode}">
    <template:addResources type="css" resources="edit.css" />
</c:if>
<template:addResources type="css" resources="960.css,01web.css"/>
<template:theme/>

<!-- <template:addResources type="css" resources="image.css" />
 -->
<template:addResources type="css" resources="fonts.css" />


<!-- <script src="/modules/medica-component/javascript/medica/faqSearch.js"></script>
<script src="/modules/medica-component/javascript/medica/accordion.js"></script>
<script src="/modules/medica-component/javascript/medica/authentication.js"></script> -->
<!-- <script src="/modules/medica-component/javascript/medica/signIn.js"></script> -->

</body>
</html>
