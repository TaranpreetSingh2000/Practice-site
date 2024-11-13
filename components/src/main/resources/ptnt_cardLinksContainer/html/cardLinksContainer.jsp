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

<c:set var="alignment" value="${currentNode.properties['headingalignment'].string}" />
<c:set var="column" value="${currentNode.properties['column'].string}" />

<c:if test="${alignment == 'right'}">
    <c:set var="align" value="end" /> 
</c:if>
<c:if test="${alignment == 'left'}">
    <c:set var="align" value="start" />
</c:if>
<c:if test="${alignment == 'center'}">
    <c:set var="align" value="center" />
</c:if>


<div class="card-links-container">
    <div class="grid grid-cols-1 lg:grid-cols-${column} justify-center items-center w-full gap-x-4 gap-y-8 ">
        <c:set var="cards" value="${jcr:getChildrenOfType(currentNode, 'ptnt:cardLinks')}" />
        <c:forEach items="${cards}" var="card" varStatus="item">
            <template:module node="${card}" nodeTypes="ptnt:cardLinks" editable="true" view="" />
        </c:forEach>
    </div>
</div>
    <c:if test="${renderContext.editMode}">
        <template:module path="*" nodeTypes="ptnt:cardLinks" />
    </c:if>

