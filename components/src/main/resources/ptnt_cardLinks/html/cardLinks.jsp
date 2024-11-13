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

<template:addResources type="css" resources="card.css" />

<c:set var="maintitle" value="${currentNode.properties['maintitle'].string}" />
<c:set var="enableCta" value="${currentNode.properties['enableCta'].boolean}" />


<div class="card">
    <div class="card-content p-5 flex flex-col">
         <c:if test="${not empty maintitle}"><h5 class='cmp-card__title text-base lg:text-2xl font-lato font-semibold mb-2 text-[#4a5a81]'>${maintitle}</h5>
        </c:if>

        <c:if test="${enableCta == 'true'}">
            <div class="cmp-teaser__action-container flex items-end my-3 gap-1 font-sora">
                <c:forEach var="button" items="${jcr:getChildrenOfType(currentNode, 'ptnt:cta')}" >
                    <template:module node="${button}" />
                </c:forEach>

                <c:if test="${renderContext.editMode}">
                        <template:module path="*" nodeTypes="ptnt:cta" />
                </c:if>
            </div>
        </c:if>

    </div>
</div>


