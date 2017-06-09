<%@include file="/apps/GoogleMapEvents/global.jsp"%>

<cq:includeClientLib css="bmm.google-map-events.eventedit"/>

<%-- TODO Check via Google geolocator WS if address is valid --%>

<sling:adaptTo adaptable="${resource}" adaptTo="ru.bmm.aem.events.model.EventModel" var="event"/>
<h3>${event.title}</h3>

<c:choose>
    <c:when test="${not empty event.title && not empty event.streetAddress}">

        <div class="container show-grid">
            <div class="row">
                <div class="col-lg-12">
                    <%=i18n.get("Description")%>:
                    <strong>${event.description}</strong>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3">
                    <%=i18n.get("Address")%>:
                    <strong>${event.streetAddress}</strong>
                </div>
                <div class="col-lg-3">
                    <%=i18n.get("City")%>:
                    <strong>${event.city}</strong>
                </div>
                <div class="col-lg-3">
                    <%=i18n.get("State")%>:
                    <strong>${event.state}</strong>
                </div>
                <div class="col-lg-3">
                    <%=i18n.get("Country")%>:
                    <strong>${event.country}</strong>
                </div>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="alert alert-warning" role="alert">
            <%=i18n.get("Edit the component to initialize the Event entry.")%>
        </div>
    </c:otherwise>
</c:choose>