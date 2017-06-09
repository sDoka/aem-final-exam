package ru.bmm.aem.events.model;

import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.resource.LoginException;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ResourceResolver;
import org.apache.sling.api.resource.ResourceResolverFactory;
import org.apache.sling.models.annotations.Default;
import org.apache.sling.models.annotations.Model;
import org.apache.sling.models.annotations.Via;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.inject.Named;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Sling presentation model for <code>eventsview</code>.
 */
@Model(adaptables = SlingHttpServletRequest.class)
public class EventsMapModel {


    /**
     * Path to the main parsys component (parent node of list of {@link EventModel))
     * of the events editor page template.
     */
    private final static String EDIT_TEMPLATE_PARSYS_PATH = "/jcr:content/par";

    @Inject
    @Via("resource")
    @Named ("jcr:title")
    @Default(values = "Default events map title")
    private String title;

    @Inject
    @Via("resource")
    @Default(values = "AIzaSyDXvhiXtfwljiFY8NA5d8aCSSwkRu8xG9Q")
    private String googleMapAPIKey;

    @Inject
    @Via("resource")
    private String eventsPath;

    /**
     * Events bound to this EventsMap. Configured via {@link EventsMapModel#eventsPath}
     * and the events editor page template structure ({@link EventsMapModel#EDIT_TEMPLATE_PARSYS_PATH})
     */
    private List<EventModel> events = new ArrayList<>();
    SlingHttpServletRequest request;

    @Inject
    public EventsMapModel(SlingHttpServletRequest request) {
        this.request = request;
    }

    @PostConstruct
    public void init() {
        try {
            String eventsPath = this.eventsPath + EDIT_TEMPLATE_PARSYS_PATH;
            ResourceResolver resourceResolver = resolverFactory.getAdministrativeResourceResolver(null);
            Resource res = resourceResolver.getResource(eventsPath);
            Iterator<Resource> resourceIterator = resourceResolver.listChildren(res);
            while (resourceIterator.hasNext()) {
                Resource childResource = resourceIterator.next();
                EventModel event = childResource.adaptTo(EventModel.class);
                events.add(event);
            }
            resourceResolver.close();
        } catch (LoginException e) {
            // log the error
        }
    }

    public String getTitle() {
        return title;
    }

    public String getGoogleMapAPIKey() {
        return googleMapAPIKey;
    }

    public String getEventsPath() {
        return eventsPath;
    }

    public List<EventModel> getEvents() {
        return events;
    }


    @Inject
    private ResourceResolverFactory resolverFactory;

}
