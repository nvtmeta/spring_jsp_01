package fsa.training.ems.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebFilter(urlPatterns = {"/employee/*", "/private/*"})
public class AuthenticationFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String account = (String) request.getSession().getAttribute("account");

        System.out.println("call in authentication filter, account = " + account);
        if (account == null) {
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }
}
