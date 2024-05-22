/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.*;

/**
 *
 * @author Long
 */
public class NotificationAlertDAO extends MyDAO {

    public List<NotificationAlert> getNotificationAlerts() {
        String sql = "SELECT * FROM NotificationAlert";
        List<NotificationAlert> notificationAlertList = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int notiID = rs.getInt("notiID");
                int userID = rs.getInt("userID");
                Date notiDate = rs.getDate("notiDate");
                String notiMessage = rs.getString("noti_message");
                boolean notiStatus = rs.getBoolean("noti_status");

                NotificationAlert notificationAlert = new NotificationAlert(notiID, userID, notiDate, notiMessage, notiStatus);
                notificationAlertList.add(notificationAlert);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return notificationAlertList;
    }

    public void addNotificationAlert(NotificationAlert notificationAlert) {
        String sql = "INSERT INTO NotificationAlert (userID, notiDate, noti_message, noti_status) VALUES (?, ?, ?, ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, notificationAlert.getUserID());
            ps.setDate(2, notificationAlert.getNotiDate());
            ps.setString(3, notificationAlert.getNotiMessage());
            ps.setBoolean(4, notificationAlert.isNotiStatus());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
