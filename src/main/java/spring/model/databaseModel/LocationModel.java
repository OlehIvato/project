package spring.model.databaseModel;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "location")
public class LocationModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "herohp")
    private int heroHp;

    @Column(name = "heroenergy")
    private int heroEnergy;

    @Column(name = "herodamage")
    private int heroDamage;

    @Column(name = "herospelldamage")
    private int heroSpellDamage;

    @Column(name = "herorestorehealth")
    private int heroRestoreHealth;

    @Column(name = "heromana")
    private int heroMana;

    @Column(name = "creaturehp")
    private int creatureHp;

    @Column(name = "creaturedamage")
    private int creatureDamage;

    @Column(name = "creaturechance")
    private int creatureChance;



}
