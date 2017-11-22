package services;

public interface TokenServiceInterface {
    void addToken(int id, String token);

    void updateToken(int id, String token);

    void deleteToken(String token);
    int findToken(String token) ;
}
