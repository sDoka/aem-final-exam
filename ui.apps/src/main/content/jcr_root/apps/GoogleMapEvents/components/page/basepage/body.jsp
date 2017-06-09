<%@include file="/apps/GoogleMapEvents/global.jsp"%>

<body>

    <header class="business-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 tagline">
                    <cq:include path="title" resourceType="foundation/components/title"/>
                </div>
            </div>
        </div>
    </header>

    <div class="container">
        <!-- Change me please! -->
        <cq:include script="content" />
        <div class="clear"></div>
    </div>

    <div class="container">
        <footer class="useless-footer">
            <hr>
            <div class="row">
                <div class="col-lg-12">
                    <p>Contact us at: www.somesite.com</p>
                </div>
            </div>
        </footer>

    </div>

    <cq:include script="bottomlibs.jsp"/>

</body>