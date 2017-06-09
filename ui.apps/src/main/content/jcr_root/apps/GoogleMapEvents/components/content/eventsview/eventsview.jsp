<%--

  Google Map events view component.

  A Google Map and a list of events, both on it and as a separate list

--%>
<%@include file="/apps/GoogleMapEvents/global.jsp"%>

<cq:includeClientLib css="bmm.google-map-events.eventsview"/>

<sling:adaptTo adaptable="${slingRequest}" adaptTo="ru.bmm.aem.events.model.EventsMapModel" var="eventsMap"/>

<div class="eventsview-container">

    <h3>${eventsMap.title}</h3>

    <c:if test="<%=WCMMode.EDIT.equals(wcmMode)%>">
        <a class="btn btn-default btn-lg btn-top-right"
                target="_blank"
                href="${eventsMap.eventsPath}.html">
            <%=i18n.get("Edit events")%>
        </a>
    </c:if>

    <div id="events-map" class="google-map-container"></div>

    <div class="event-list">
        <c:forEach var="event" items="${eventsMap.events}">
            <c:if test="${not empty event.title && not empty event.streetAddress}">
                <div class="row event-item">
                    <div class="col-lg-12">
                        <p>
                            <strong>
                                <a data-marker-anchor href="#">
                                    <span data-event-title>${event.title}</span>
                                </a>
                            </strong>
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <p>
                            <%=i18n.get("Address")%>:
                            <span data-event-address>${event.address}</span>
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <p>
                            <%=i18n.get("Description")%>:
                            <span data-event-description>${event.description}</span>
                        </p>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>

</div>


<cq:includeClientLib js="bmm.google-map-events.eventsview"/>
<script src="https://maps.googleapis.com/maps/api/js?key=${eventsMap.googleMapAPIKey}&callback=initMap" async defer></script>
