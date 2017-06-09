<%@include file="/apps/GoogleMapEvents/global.jsp"%>

<hr>
<div class="row">

    <div class="col-lg-8">
        <h2><%=i18n.get("Here is where the map is supposed to go")%></h2>
        <cq:include path="eventsview" resourceType="google-map-events/components/content/eventsview"/>
    </div>

    <div class="col-lg-4">
        <h2><%=i18n.get("Also")%>:</h2>

        <p>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit.
            Et molestiae similique eligendi reiciendis sunt distinctio odit.
        <p/>

        <%-- Include useless additional stuff here --%>
        <cq:include path="sidebar-par" resourceType="foundation/components/parsys"/>

        <div class="sidebar-component-container">
            <cq:include path="rsspost" resourceType="test-multimodule-content-package/components/rsspost"/>
        </div>
    </div>
</div>