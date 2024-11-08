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


<c:set var="label" value="${currentNode.properties['label'].string}" />
<c:set var="baseUrl" value="${currentNode.properties['baseUrl'].string}" />
<c:set var="apiKey" value="${currentNode.properties['apiKey'].string}" />
<c:set var="apiKeyHeader" value="${currentNode.properties['apiKeyHeader'].string}" />
<c:set var="contentType" value="${currentNode.properties['contentType'].string}" />
<c:set var="ctaBackground" value="${currentNode.properties['ctaBackground'].string}" />
<c:set var="ctaAlignment" value="${currentNode.properties['ctaAlignment'].string}" />
<c:set var="alignCtaValue" value=""/>

<c:choose>
    <c:when test="${ctaAlignment == 'left'}">
        <c:set var="alignCtaValue" value="justify-start"/>
    </c:when>
    <c:when test="${ctaAlignment == 'center'}">
        <c:set var="alignCtaValue" value="justify-center"/>
    </c:when>
    <c:when test="${ctaAlignment == 'right'}">
        <c:set var="alignCtaValue" value="justify-end"/>
    </c:when>
</c:choose>

<!-- <div class="apicontainer flex flex-col gap-y-3">
    <span>${baseUrl}</span>
    <span>${apiKey}</span>
    <span>${apiKeyHeader}</span>
    <span>${contentType}</span>
</div> -->


<!-- <div class="ctaContainer my-4 flex <c:if test="${ctaAlignment == 'left'}"> md:justify-start justify-start </c:if> <c:if test="${ctaAlignment == 'center'}"> md:justify-center justify-center </c:if> <c:if test="${ctaAlignment == 'right'}"> md:justify-end justify-end </c:if>  <c:if test="${ctaAlignment == 'left'}">md:items-start items-start </c:if> <c:if test="${ctaAlignment == 'center'}">md:items-center itenms-center </c:if> <c:if test="${ctaAlignment == 'right'}">md:items-end items-end</c:if>"> -->

<!-- <div class="ctaContainer my-4 flex ${alignCtaValue} ">
    <div class=" font-sora button last:me-0 inline-flex  w-fit group">
        <a href="#" data-is-internal="true" target="_blank" class=" ctaGradient  cmp-button overflow-hidden flex flex-wrap items-center  cursor-pointer font-sora w-full text-white px-4 lg:px-6 bg-xenon-400 rounded-lg min-h-12 lg:min-h-14 <c:if test="${ctaBackground == 'primary'}">blue-gradient</c:if>">
        <span class="cmp-button__text font-semibold mx-auto font-sora leading-1.5 text-sm lg:text-base tracking-[0.28px] lg:tracking-[0.32px]">${label}</span>
 </a>
</div>        
</div>
</div>

<div class="ctaContainer">
    <span class="ctaGradient">
        <a href="" class="font-sor text-white cmp-button overflow-hidden rounded-lg min-h-1">
            <span class="cmp-button__text font-semibold mx-auto font-sora leading-1.5 text-sm lg:base">${label}</span>
        </a>
    </span>
</div> 

