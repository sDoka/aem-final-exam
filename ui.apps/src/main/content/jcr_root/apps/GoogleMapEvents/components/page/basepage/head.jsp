<%@include file="/apps/GoogleMapEvents/global.jsp"%>
<%
    final String pageTitle = currentPage.getTitle();
    final String pageDescription = currentPage.getDescription();
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><%= xss.encodeForHTML(pageTitle) %></title>
    <meta name="description" content="<%= xss.encodeForHTML(pageDescription) %>">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <cq:include script="headlibs.jsp"/>
    <cq:include script="/libs/wcm/core/components/init/init.jsp"/>

    <cq:includeClientLib css="bmm.google-map-events.main"/>
    <cq:includeClientLib css="bmm.google-map-events.basepage"/>
</head>