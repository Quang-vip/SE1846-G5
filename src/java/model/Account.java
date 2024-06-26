/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Long
 */
public class Account {

    private int userID;
    private String username;
    private String password;
    private String firstname;
    private String lastname;
    private String phoneNumber;
    private String email;
    private String profilePictureLink;
    private Date birthDate;
    private int rollID;
    private String salt;
    
    private Account account;

    public Account(int userID, String username, String password, String firstname, String lastname, String phoneNumber, String email, String profilePictureLink, Date birthDate, int rollID, String salt) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.profilePictureLink = profilePictureLink;
        this.birthDate = birthDate;
        this.rollID = rollID;
        this.salt = salt;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }
    
    public Account(int userID, String username, String password, String firstname, String lastname, String phoneNumber, String email, String profilePictureLink, Date birthDate, int rollID) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.profilePictureLink = profilePictureLink;
        this.birthDate = birthDate;
        this.rollID = rollID;
    }

    public Account(int userID, String username, String firstname, String lastname, String phoneNumber, String email, String profilePictureLink, Date birthDate, int rollID) {
        this.userID = userID;
        this.username = username;
        this.firstname = firstname;
        this.lastname = lastname;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.profilePictureLink = profilePictureLink;
        this.birthDate = birthDate;
        this.rollID = rollID;
    }

    public Account(String username, String firstname, String lastname, String phoneNumber, String email, Date birthDate) {
        this.username = username;
        this.firstname = firstname;
        this.lastname = lastname;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.birthDate = birthDate;
    }
    
    public Account() {
        
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProfilePictureLink() {
        return profilePictureLink;
    }

    public void setProfilePictureLink(String profilePictureLink) {
        this.profilePictureLink = profilePictureLink;
    }

    public int getRollID() {
        return rollID;
    }

    public void setRollID(int rollID) {
        this.rollID = rollID;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }    

    @Override
    public String toString() {
        return "Account{" + "userID=" + userID + ", username=" + username + ", password=" + password + ", firstname=" + firstname + ", lastname=" + lastname + ", phoneNumber=" + phoneNumber + ", email=" + email + ", profilePictureLink=" + profilePictureLink + ", birthDate=" + birthDate + ", rollID=" + rollID + '}';
    }
    
    
    
}
