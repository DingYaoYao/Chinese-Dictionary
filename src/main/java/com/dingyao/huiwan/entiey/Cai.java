package com.dingyao.huiwan.entiey;

import javax.persistence.*;

@Table(name = "huiwan.cai")
public class Cai {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String zi;

    private String cai;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return zi
     */
    public String getZi() {
        return zi;
    }

    /**
     * @param zi
     */
    public void setZi(String zi) {
        this.zi = zi;
    }

    /**
     * @return cai
     */
    public String getCai() {
        return cai;
    }

    /**
     * @param cai
     */
    public void setCai(String cai) {
        this.cai = cai;
    }
}