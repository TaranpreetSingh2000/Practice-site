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

<template:addResources type="css" resources="cta.css" />

<c:set var="ctaLabel" value="${currentNode.properties['ctaLabel'].string}" />
<c:set var="ctaVariant" value="${currentNode.properties['ctaVariant'].string}" />
<c:set var="ctaAlignment" value="${currentNode.properties['ctaAlignment'].string}" />
<div class="flex font-sora  <c:if test='${ctaAlignment == " left"}'>justify-start</c:if>
    <c:if test='${ctaAlignment == "center"}'>justify-center</c:if>
    <c:if test='${ctaAlignment == "right"}'>justify-end</c:if> ">

    <div class="cta-link-btn font-sora button last:me-0 inline-flex w-full lg:w-fit group">
        <a href="#" data-is-internal="true" target="_blank" class="
            cmp-button overflow-hidden flex
            flex-wrap
            items-center justify-center
            cursor-pointer font-sora w-full
            <c:if test=" ${ctaVariant=='primary'}">
            ${ctaVariant}-cta black text-white px-4
            lg:px-6 border-2
            border-white rounded-lg
            min-h-12 lg:min-h-14
            </c:if>
            <c:if test="${ctaVariant == 'secondary'}">
                ${ctaVariant}-cta
                black text-white px-4
                lg:px-6 border-2
                border-white rounded-lg
                min-h-12 lg:min-h-14
                bg-black
            </c:if>
            <c:if test="${ctaVariant == 'withIcon'}">
                ${ctaVariant}-cta
                text-gray-800
                dark:text-white px-0 text-sm
                justify-start
                lg:justify-center
            </c:if>
            <c:if test="${ctaVariant == 'white'}">
                ${ctaVariant}-cta
                white cta-bg-white px-4
                lg:px-6 bg-white
                hover:text-grey-700
                text-grey-900 shadow-md
                border-2 border-white
                rounded-lg min-h-12
                lg:min-h-14
            </c:if>
            <c:if test="${ctaVariant == 'noBackGround'}">
                ${ctaVariant}-cta
            </c:if>"
            style="--x: 0px; --y: 0px;">
            <span class="cmp-button__text font-semibold">
                <c:if test="${renderContext.editMode}">
                    <c:if test="${empty ctaLabel}">
                        Add CTA here
                    </c:if>
                </c:if>
                ${ctaLabel}
            </span>
            <c:if test="${ctaVariant == 'withIcon'}">
                <span class="cmp-button__icon ms-1">
                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="11px"
                        height="11px" viewBox="0 0 11 19" version="1.1">
                        <title>Icon/Carot/Large/Right/@Berry@3x</title>
                        <g id="Find-A-Agent" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"
                            stroke-linecap="round">
                            <g id="Group" transform="translate(0.000000, 1.000000)" stroke="#C81766" stroke-width="2">
                                <g id="Line"
                                    transform="translate(6.000000, 8.500000) rotate(-90.000000) translate(-6.000000, -8.500000) translate(-2.000000, 4.000000)">
                                    <line x1="15.8391919" y1="6.79136747e-13" x2="7.91959595" y2="8.0185909"></line>
                                    <line x1="9.09494702e-14" y1="-7.9424467e-13" x2="7.91959595" y2="8.0185909"></line>
                                </g>
                            </g>
                        </g>
                    </svg>
                </span>
            </c:if>
        </a>
    </div>
</div>