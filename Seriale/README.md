#Baza danych Seriale

Baza danych utworzona w ramach projektu na studiach prezentująca moje umiejętności posługiwania się z relacyjnymi bazami danych i językiem SQL.

##Zawartość

- create.sql - skrypt tworzący tabele wraz z relacjami
- insert.sql - skrypt umieszczający dane do poszczególnych tabel
- select.sql - skrypt przesyłający zapytania do bazy

##Treść zadania

```
1. Zbuduj bazę danych złożoną z tabel

· Kanał

id_kanału liczba, klucz główny,

nazwa tekst(40), wymagany,

rok_powstania liczba, wymagany

· Serial

id_serialu liczba, klucz główny,

nazwa tekst(40), wymagany,

rok_start liczba, wymagany,

rok_koniec liczba,

id_kanału, wymagany, klucz obcy do Kanał,

ocena liczba, wymagany

· Postać

id_postaci liczba, klucz główny,

postać tekst(40), wymagany,

ginie char, wymagany,

id_serialu, wymagany, klucz obcy do Serial

2. Wprowadź dane do tabel po 15 rekordów w tym podane poniżej (dobierz dane tak aby na każde zapytanie wyświetlił się przynajmniej jeden wiersz odpowiedzi)

3. Wyświetl dla każdej postaci w serialu, na którym kanale się pojawia

4. Wyświetl dla każdego serialu ile postaci w nim ginie

5. Wyświetl nazwy kanałów bez seriali lub seriali bez postaci posortowane według roku powstania (kanału lub serialu)

6. Wyświetl dla każdego kanału jego nazwę oraz średnią ocenę jego seriali nie licząc najgorszego z nich (jeżeli kanał ma 3 seriale z ocenami 1, 3, 5 ta średnia to 4)

7. Wyświetl seriale które są jedynymi nieskończonymi serialami danej stacji

8. Wyświetl bohaterów najwyżej ocenionego serialu (lub ocenionych seriali)

9. Wyświetl dla każdego kanału najlepiej oceniony serial

10. Wyświetl dla każdego serialu, który powstał nie później niż 20 lat po powstaniu swojej kanału, którym (według roku powstania) serialem na swoim kanale jest
```
