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

<c:set var="column" value="${currentNode.properties['columnSpan'].string}" />
<c:set var="cellRowHeading" value="${currentNode.properties['cellRowHeading'].string}" />
<c:set var="cellHeading" value="${currentNode.properties['cellHeading'].string}" />
<c:set var="cellSubHeading" value="${currentNode.properties['cellSubHeading'].string}" />
<c:set var="headingPosition" value="${currentNode.properties['headingPosition'].string}" />

<c:if test="${headingPosition == 'thead'}">
    <thead class="thead-section">
        <th class="text-black text-lg">${cellRowHeading}</th>
    </thead>
</c:if>

<c:if test="${not empty cellHeading}">
    <tbody class="tbody-section">
        <tr>
            <c:if test="${headingPosition == 'tbody'}">
                <th>
                    ${cellRowHeading}
                </th>
            </c:if>
            <td>
                <h2>${cellHeading}</h2>
                <p>${cellSubHeading}</p>
            </td>
        </tr>
    </tbody>
</c:if>