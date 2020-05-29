package game.sql;

import game.primary.Game;
import game.primary.TheMain;


import java.sql.*;
import java.util.Scanner;

public class HeroDatabase {
    private static Connection connection;

    public static void createHero() {
        showHeroesFromDatabase();
        setHeroToMain();
        new Game().createNewHero();
    }


    private static void setHeroToMain() {
        try {
            connection = DriverManager.getConnection(TheMain.getUrl(), TheMain.getUsername(), TheMain.getPassword());
            PreparedStatement preparedStatementHero = connection.prepareStatement("SELECT * FROM hero WHERE id = ?");
            PreparedStatement preparedStatementClass = connection.prepareStatement("select classtype1_.class as class  from hero_classes classes0_ inner join class classtype1_ on classes0_.classes_id=classtype1_.id where hero_model_id = ? order by hero_model_id");
            PreparedStatement preparedStatementArmor = connection.prepareStatement("select armor1_.armor as armor from hero_armors armors0_ inner join armor armor1_ on armors0_.armors_id = armor1_.id  where hero_model_id = ? order by hero_model_id");

            int resultScan = new Scanner(System.in).nextInt();

            preparedStatementHero.setInt(1, resultScan);
            preparedStatementClass.setInt(1, resultScan);
            preparedStatementArmor.setInt(1, resultScan);

            ResultSet resultSetHero = preparedStatementHero.executeQuery();
            ResultSet resultSetClass = preparedStatementClass.executeQuery();
            ResultSet resultSetArmor = preparedStatementArmor.executeQuery();

            while (resultSetHero.next() && resultSetClass.next() && resultSetArmor.next()) {
                TheMain.setHeroClass(resultSetClass.getString("class"));
                TheMain.setHeroName(resultSetHero.getString("name"));
                TheMain.setHeroHp(TheMain.getHeroHp() + resultSetHero.getInt("hp"));
                TheMain.setHeroDamage(TheMain.getHeroDamage() + resultSetHero.getInt("damage"));
                TheMain.setHeroMinSpell(TheMain.getHeroMinSpell() + resultSetHero.getInt("minSpellDamage"));
                TheMain.setHeroMaxSpell(TheMain.getHeroMaxSpell() + resultSetHero.getInt("maxSpellDamage"));
                TheMain.setHeroRestoreHp(TheMain.getHeroRestoreHp() + resultSetHero.getInt("restoreHealth"));
                TheMain.setHeroMana(TheMain.getHeroMana() + resultSetHero.getInt("mana"));
                TheMain.setHeroArmor(resultSetArmor.getString("armor"));
                System.out.println("You selected " + resultSetHero.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void showHeroesFromDatabase() {
        try {
            connection = DriverManager.getConnection(TheMain.getUrl(), TheMain.getUsername(), TheMain.getPassword());
            Statement statementHero = connection.createStatement();
            Statement statementArmor = connection.createStatement();
            Statement statementClass = connection.createStatement();

            ResultSet resultSetHero = statementHero.executeQuery("SELECT * FROM hero");
            ResultSet resultSetArmor = statementArmor.executeQuery("select armor1_.armor as armor from hero_armors armors0_ inner join armor armor1_ on armors0_.armors_id = armor1_.id order by hero_model_id");
            ResultSet resultSetClass = statementClass.executeQuery("select classtype1_.class as class from hero_classes classes0_ inner join class classtype1_ on classes0_.classes_id=classtype1_.id order by hero_model_id");

            System.out.println("\nSelect one:");
            while (resultSetHero.next() && resultSetArmor.next() && resultSetClass.next()) {
                String getFormat = "%1$-3s|%2$-16s|%3$-18s|%4$-9s|%5$-12s|%6$-22s|%7$-22s|%8$-16s|%9$-11s|%10$-21s|";
                String result = String.format(getFormat,
                        resultSetHero.getInt("id"),
                        " Class: " + resultSetClass.getString("class"),
                        " Name: " + resultSetHero.getString("name"),
                        " HP: " + resultSetHero.getInt("hp"),
                        " Damage: " + resultSetHero.getInt("damage"),
                        " Min Spell Damage: " + resultSetHero.getInt("minSpellDamage"),
                        " Max Spell Damage: " + resultSetHero.getInt("maxSpellDamage"),
                        " Restore HP: " + resultSetHero.getInt("restoreHealth"),
                        " Mana: " + resultSetHero.getInt("mana"),
                        " Armor Type: " + resultSetArmor.getString("armor"));
                System.out.println(result);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}