package cz.muni.fi.web;

import cz.muni.fi.hotel.GuestManagerImpl;
import cz.muni.fi.hotel.Main;
import cz.muni.fi.hotel.RoomManagerImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;

/**
 * Created by ${KristianKatanik} on 03.04.2017.
 */
@WebListener
public class StartListener implements ServletContextListener {

    private final static Logger log = LoggerFactory.getLogger(StartListener.class);

    @Override
    public void contextInitialized(ServletContextEvent ev) {
        log.info("webová aplikácia inicializována");
        ServletContext servletContext = ev.getServletContext();
        DataSource dataSource = Main.createMemoryDatabase();
        servletContext.setAttribute("guestManager", new GuestManagerImpl(dataSource));
        servletContext.setAttribute("roomManager", new RoomManagerImpl(dataSource));
        log.info("vytvorení manažéri a uložený do atribútov servletContextu");
    }

    @Override
    public void contextDestroyed(ServletContextEvent ev) {
        log.info("aplikácia končí");
    }
}
