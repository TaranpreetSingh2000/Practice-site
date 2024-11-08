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
<template:addResources type="css" resources="cta.css" />

<c:set var="tag" value="${currentNode.properties['tag'].string}" />
<c:set var="title" value="${currentNode.properties['title'].string}" />
<c:set var="description" value="${currentNode.properties['description'].string}" />
<c:set var="image" value="${currentNode.properties['Image'].node}" />
<c:set var="enableCta" value="${currentNode.properties['enableCta'].boolean}" />
<c:set var="imageAltText" value="${currentNode.properties['imgAltText'].string}"/>
<c:set var="imageWidth" value="${currentNode.properties['imageWidth'].string}" />
<c:set var="imageHeight" value="${currentNode.properties['imageHeight'].string}" />


<div class="teaser">
    <div class="teaser-content p-5 flex flex-col lg:flex-row justify-between gap-x-12">
        <c:if test="${not empty image}">
            <div class="teaser-image">
                <img src="${image.url}" alt="${imageAltText}" class="w-[220px] h-full max-w-full object-contain" style="width: <c:if test="${not empty imageWidth}">${imageWidth}px</c:if>; height:<c:if test="${not empty imageHeight}">${imageHeight}px;" </c:if> />
            </div>
        </c:if>

        <div class="teaser-right-content flex flex-col justify-center gap-2">
            <c:if test="${not empty tag}"><span class="teaser-tag text-sm uppercase font-extrabold font-sora">${tag}</span>
        </c:if>
            
             <c:if test="${not empty title}"><h5 class='cmp-teaser__title text-base lg:text-[32px] leading-9 font-sora font-semibold mb-2 text-black'>${title}</h5>
            </c:if>
    
            <c:if test="${not empty description}">
                <div class="teaser-description my-1">
                    <span class="text-lg text-grey-700 text-start">${description}</span>
                </div>    
            </c:if>
    
            <c:if test="${enableCta == 'true'}">
                <div class="cmp-teaser__action-container flex items-center my-3 gap-4 font-sora">
                    <c:forEach var="button" items="${jcr:getChildrenOfType(currentNode, 'ptnt:cta')}" >
                        <template:module node="${button}" view="hidden.leftImage" />
                    </c:forEach>
    
                    <c:if test="${renderContext.editMode}">
                            <template:module path="*" nodeTypes="ptnt:cta" />
                    </c:if>
                </div>
            </c:if>
        </div>

    </div>
</div>
