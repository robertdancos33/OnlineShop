package com.example.shop;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.servlet.util.matcher.MvcRequestMatcher;
import org.springframework.web.servlet.handler.HandlerMappingIntrospector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    private HandlerMappingIntrospector handlerMappingIntrospector;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        MvcRequestMatcher mvcRequestMatcher = new MvcRequestMatcher(handlerMappingIntrospector, "/h2-console/**");
        mvcRequestMatcher.setServletPath("/");  // Explicitly set the servlet path for the MVC pattern

        http
                .csrf(csrf -> csrf
                        .ignoringRequestMatchers("/h2-console/**")  // Disable CSRF for H2 console
                        .disable()
                )
                .authorizeRequests(authz -> authz
                        .requestMatchers(mvcRequestMatcher).permitAll()  // Allow H2 console access
                        .anyRequest().authenticated()
                )
                .headers(headers -> headers
                        .frameOptions(frame -> frame.sameOrigin())  // Allow iframe for H2 console
                );
        return http.build();
    }
}
