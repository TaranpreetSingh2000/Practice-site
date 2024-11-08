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

<c:set var="tag" value="${currentNode.properties['tag'].string}" />
<c:set var="title" value="${currentNode.properties['title'].string}" />
<c:set var="description" value="${currentNode.properties['description'].string}" />
<c:set var="image" value="${currentNode.properties['Image'].node}" />
<c:set var="enableCta" value="${currentNode.properties['enableCta'].boolean}" />
<c:set var="imageAltText" value="${currentNode.properties['imgAltText'].string}"/>


<div class="teaser">
    <div class="teaser-content p-5 flex flex-col justify-start lg:justify-center lg:items-center">
        <c:if test="${not empty image}">
            <div class="teaser-image my-2 flex justify-center items-center">
                <img src="${image.url}" alt="${imageAltText}" class="w-[20px] h-full object-contain" >
            </div>
        </c:if>

        <c:if test="${not empty tag}"><span class="teaser-tag text-sm text-blue-800 font-bold font-sora">${tag}</span>
    </c:if>
        
         <c:if test="${not empty title}"><h5 class='cmp-teaser__title text-base lg:text-lg font-lato font-semibold mb-2 text-grey-700'>${title}</h5>
        </c:if>

        <c:if test="${not empty description}">
            <div class="teaser-description my-1">
                <span class="text-lg text-grey-700 text-start lg:text-center">${description}</span>
            </div>    
        </c:if>

        <c:if test="${enableCta == 'true'}">
            <div class="cmp-teaser__action-container flex items-end my-3 gap-1 font-sora">
                <c:forEach var="button" items="${jcr:getChildrenOfType(currentNode, 'ptnt:cta')}" >
                    <template:module node="${button}" view="" />
                </c:forEach>

                <c:if test="${renderContext.editMode}">
                        <template:module path="*" nodeTypes="ptnt:cta" />
                </c:if>
            </div>
        </c:if>

    </div>
</div>
