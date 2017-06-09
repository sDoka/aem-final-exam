package ru.bmm.aem.events.model;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.models.annotations.Default;
import org.apache.sling.models.annotations.Model;
import org.apache.sling.models.annotations.Optional;

import javax.inject.Inject;
import javax.inject.Named;


/**
 * Sling model for eventedit component.
 */
@Model(adaptables = Resource.class )
public class EventModel {

    /**
     * Title of the event. Required property.
     */
    @Inject
    @Named("jcr:title")
    @Default(values = "Default title")
    private String title;

    @Inject
    @Named ("jcr:description")
    @Default(values = "Default Description")
    private String description;

    /**
     * City scoped address (building, street). Required property.
     */
    @Inject
    @Default(values = "Коломяжский 15")
    private String streetAddress;

    @Inject
    @Optional
    @Default(values = "Санкт-Петербург")
    private String city;

    @Inject
    @Optional
    private String state;

    @Inject
    @Optional
    private String country;


    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public String getStreetAddress() {
        return streetAddress;
    }

    public String getCity() {
        return city;
    }

    public String getState() {
        return state;
    }

    public String getCountry() {
        return country;
    }

    /**
     * @return Google Maps-compliant full address of the event or <code>""</code>
     * if not all required properties were set.
     */
    public String getAddress() {

        if (null == streetAddress || streetAddress.isEmpty()) return "";

        StringBuilder stringBuilder = new StringBuilder();

        stringBuilder.append(streetAddress);

        if (null != city && !city.isEmpty()) {
            stringBuilder.append(", ");
            stringBuilder.append(city);
        }
        if (null != state && !state.isEmpty()) {
            stringBuilder.append(", ");
            stringBuilder.append(state);
        }
        if (null != country && !country.isEmpty()) {
            stringBuilder.append(", ");
            stringBuilder.append(country);
        }
        return stringBuilder.toString();
    }

}
