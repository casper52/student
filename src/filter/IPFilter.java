package filter;

import lombok.extern.log4j.Log4j;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Log4j
@WebFilter("/*/*")
public class IPFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest)servletRequest;
        log.info("---------------------------------------");
        log.info(servletRequest.getRemoteAddr());

        String content = req.getParameter("content");

        if(content != null){
            log.info(content);

        }
        filterChain.doFilter(servletRequest, servletResponse);

    }
}
