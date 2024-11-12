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

<template:addResources type="css" resources="teaser.css" />

<c:set var="title" value="${currentNode.properties['title'].string}" />
<c:set var="alignment" value="${currentNode.properties['headingalignment'].string}" />


<c:if test="${alignment == 'right'}">
    <c:set var="align" value="end" />
</c:if>
<c:if test="${alignment == 'left'}">
    <c:set var="align" value="start" />
</c:if>
<c:if test="${alignment == 'center'}">
    <c:set var="align" value="center" />
</c:if>

<c:if test="${renderContext.editMode}">
    <c:if test="${empty title}">
        Configure Heading here
    </c:if>
</c:if>


<div class="tags-container">
    <div class=" flex flex-col flex-wrap w-full justify-${align} items-${align} mb-12">
        <h2 class="field-headline text-2xl uppercase underline tracking-[1.12px] font-semibold font-lato">${title}</h2>
    </div>

    <div class="flex flex-wrap gap-4">
        <c:set var="tags" value="${jcr:getChildrenOfType(currentNode, 'ptnt:Tags')}" />
        <c:forEach items="${tags}" var="tag" varStatus="item">
            <template:module node="${tag}" nodeTypes="ptnt:Tags" editable="true" view="" />
        </c:forEach>
    </div>
</div>
    <c:if test="${renderContext.editMode}">
        <template:module path="*" nodeTypes="ptnt:Tags" />
    </c:if>

