package spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import spring.model.Profile;

@Repository
public interface ProfileRepository extends JpaRepository<Profile, Long> {
}
