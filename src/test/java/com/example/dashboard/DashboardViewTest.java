package com.example.dashboard;

import com.vaadin.flow.component.html.H1;
import com.vaadin.flow.component.html.Span;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

class DashboardViewTest {

    @Test
    void dashboard_displays_the_title_and_expected_metrics() {
        var view = new DashboardView();

        var title = view.getChildren()
                .filter(H1.class::isInstance)
                .map(H1.class::cast)
                .findFirst();
        var values = view.getChildren()
                .flatMap(component -> component.getChildren())
                .flatMap(component -> component.getChildren())
                .filter(Span.class::isInstance)
                .map(Span.class::cast)
                .filter(span -> span.hasClassName("metric-value"))
                .map(Span::getText)
                .toList();

        assertThat(title).isPresent().get().extracting(H1::getText)
                .isEqualTo("DevOps Learning Dashboard");
        assertThat(values).containsExactlyInAnyOrderElementsOf(
                List.of(DashboardView.STATUS, DashboardView.ENVIRONMENT, DashboardView.VERSION));
    }
}
