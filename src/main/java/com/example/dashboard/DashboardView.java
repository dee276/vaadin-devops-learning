package com.example.dashboard;

import com.vaadin.flow.component.html.H1;
import com.vaadin.flow.component.html.Paragraph;
import com.vaadin.flow.component.html.Span;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.router.PageTitle;
import com.vaadin.flow.router.Route;

@Route("")
@PageTitle("DevOps Learning Dashboard")
public class DashboardView extends VerticalLayout {

    static final String STATUS = "Running";
    static final String ENVIRONMENT = "Local";
    static final String VERSION = "0.1.0";

    public DashboardView() {
        addClassName("dashboard-view");

        var title = new H1("DevOps Learning Dashboard");
        var subtitle = new Paragraph("A minimal Vaadin application for learning CI/CD step by step.");
        subtitle.addClassName("dashboard-subtitle");

        var metrics = new HorizontalLayout(
                createMetricCard("Application status", STATUS),
                createMetricCard("Environment", ENVIRONMENT),
                createMetricCard("Version", VERSION));
        metrics.addClassName("metrics");

        add(title, subtitle, metrics);
    }

    private VerticalLayout createMetricCard(String label, String value) {
        var labelText = new Span(label);
        labelText.addClassName("metric-label");

        var valueText = new Span(value);
        valueText.addClassName("metric-value");

        var card = new VerticalLayout(labelText, valueText);
        card.addClassName("metric-card");
        card.setPadding(false);
        card.setSpacing(false);
        return card;
    }
}
