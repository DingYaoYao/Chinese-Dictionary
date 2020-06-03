package com.dingyao.huiwan.entiey;

import java.util.Date;
import javax.persistence.*;

@Table(name = "huiwan.fankui")
public class Fankui {
    @Id
    private Integer uid;

    private String text;

    private String name;

    private Date inputedate;

    private String userip;

    /**
     * @return uid
     */
    public Integer getUid() {
        return uid;
    }

    /**
     * @param uid
     */
    public void setUid(Integer uid) {
        this.uid = uid;
    }

    /**
     * @return text
     */
    public String getText() {
        return text;
    }

    /**
     * @param text
     */
    public void setText(String text) {
        this.text = text;
    }

    /**
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return inputedate
     */
    public Date getInputedate() {
        return inputedate;
    }

    /**
     * @param inputedate
     */
    public void setInputedate(Date inputedate) {
        this.inputedate = inputedate;
    }

    /**
     * @return userip
     */
    public String getUserip() {
        return userip;
    }

    /**
     * @param userip
     */
    public void setUserip(String userip) {
        this.userip = userip;
    }
}