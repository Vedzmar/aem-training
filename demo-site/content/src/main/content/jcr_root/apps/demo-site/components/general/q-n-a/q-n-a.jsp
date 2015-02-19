<%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" import="com.day.cq.wcm.api.WCMMode"%><%

    /* Services and Utilities */
    final WCMMode mode = WCMMode.fromRequest(slingRequest);

    /* Component Properties and Data */
    final String question = properties.get("question", "");
    final String answer = properties.get("answer", "");
    final String seeMorePath = properties.get("seeMorePath", "");
    final Page seeMorePage = pageManager.getContainingPage(seeMorePath);

%>
<%-- Component Init Checks --%>
<% if(seeMorePage == null || "".equals(question) || "".equals("answer")) {
    if(WCMMode.EDIT.equals(mode)) {
%><div><img src="/libs/cq/ui/resources/0.gif" class="cq-text-placeholder" alt=""></div><%
        }
        return;
    } 
%>
<div class="q-n-a">
    <a class="question collapsed" href="javascript:void(0);">
        <cq:text property="question" tagName="span" escapeXml="true"/>
    </a>
    <p class="answear">
        <%=answer %>
        </br>
        <a href="<%=seeMorePage.getPath() %>.html"><%=seeMorePage.getTitle()%></a>
    </p>
</div>