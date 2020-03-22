number(0,neither,neither,neither).
/** Numaralarin veritabani Her sayinin ozelliklerini gosteren ve siyahmi kirmizimi yoksa hangi duzineye karsilik geldigini gosteren kisim */

number(1,tek,kirmizi,birinci).
number(2,tek,siyah,birinci).
number(3,tek,kirmizi,birinci).
number(4,cift,siyah,birinci).
number(5,tek,kirmizi,birinci).
number(6,cift,siyah,birinci).
number(7,tek,kirmizi,birinci).
number(8,cift,siyah,birinci).
number(9,tek,kirmizi,birinci).
number(10,cift,siyah,birinci).
number(11,tek,siyah,birinci).
number(12,cift,kirmizi,birinci).
number(13,tek,siyah,ikinci).
number(14,cift,kirmizi,ikinci).
number(15,tek,siyah,ikinci).
number(16,cift,kirmizi,ikinci).
number(17,tek,siyah,ikinci).
number(18,cift,kirmizi,ikinci).
number(19,tek,kirmizi,ikinci).
number(20,cift,siyah,ikinci).
number(21,tek,kirmizi,ikinci).
number(22,cift,siyah,ikinci).
number(23,tek,kirmizi,ikinci).
number(24,cift,siyah,ikinci).
number(25,tek,kirmizi,ucuncu).
number(26,cift,siyah,ucuncu).
number(27,tek,kirmizi,ucuncu).
number(28,cift,siyah,ucuncu).
number(29,tek,siyah,ucuncu).
number(30,cift,kirmizi,ucuncu).
number(31,tek,siyah,ucuncu).
number(32,cift,kirmizi,ucuncu).
number(33,tek,siyah,ucuncu).
number(34,cift,kirmizi,ucuncu).
number(35,tek,siyah,ucuncu).
number(36,cift,kirmizi,ucuncu).



/** Program�n basladigi kisim ve oyununun nas�l oynand�g�na dair kisim.*/

start :-
write(' isminiz  nedir ?'), nl,
read(�sim1),
write(' Oyuna hosgeldiniz '),
write(�sim1), nl,
write('Ne kadar parayla oynamak istersiniz ?'), nl,
read(Para),
write(' Bugun riske atacaginiz para miktari:   '),
write(Para),
write(' taclar'), nl,
write('�stediginiz zaman oyundan quit yazarak ayrilabilirsiniz.'), nl,
write(' �yi Sanslar!!'),nl,
write(' Bahisler tek veya �ift, k�rm�z� veya siyah, bir say� veya ilk, ikinci veya ���nc� d�zine yat�r�labilir.'), nl,
write(' �nce bir, ikinci veya ���nc� bir d�zine tipte bahis yapmak istiyorsan�z.'), nl,
roulette(Para).

/** Bu kisim oyuncunun tum parasini kaybettiginde cikan uyari.*/
roulette(0):-
	write(' Butun paranizi kaybettiniz Art�k Durun'),
	abort.


roulette(Cash) :-
Cash > 0,
/** Rulet mantigi donen bi mekanizma ve zarla ilgili.Bahisleri koymadan once gerceklesir. Sayi rastgele atanir */
	random_between(0, 36, Cikis),
	/**	Random sayi uretilir.
        write(Cikis), nl,
	write(Oe), nl,
	write(Rb), nl,
	write(Dozen), nl,  */
	write(' Neyin ustune oynamak istersiniz ?'), nl,
	read(BahisTuru),
/** Kullanicinin devam edip etmeyecegi kontrol edilir. */
	(BahisTuru == quit -> timetoquit(Cash); number(Cikis, Oe, Rb, Dozen)),
	write(' Ne kadar yatirmak istersiniz? '),
	read(Bahismiktari),
	(Bahismiktari > Cash -> kotubahis(Cash) ; iyibahis(Bahismiktari, BahisTuru)),
	write(' Gelen oyun '),
	write(Cikis), write(' '), write(Rb), nl,
	write(' Ayrica '), write(Oe), write('   ve kar��l�k gelir.'),
	write(Dozen), write(' dozen.'), nl,
	(Oe == BahisTuru -> Moe is 2; Moe is 0),
	(Rb == BahisTuru -> Mrb is 2; Mrb is 0),
	(Cikis == BahisTuru -> Mnum is 36; Mnum is 0),
	(Dozen == BahisTuru -> Mdoz is 3; Mdoz is 0),
	Cashleft is Cash-Bahismiktari+ Bahismiktari* Moe + Bahismiktari* Mrb+ Bahismiktari* Mdoz+ Bahismiktari* Mnum,
	write(' Sahip oldugunuz '),
	write(Cashleft),
	write(' mevcut taclar '), nl,
	roulette(Cashleft).


kotubahis(Cash):- write('Yapmak istediginiz bahis mevcut oldugunuz paradan fazla.'), nl,
	roulette(Cash).

iyibahis(Bahismiktari, BahisTuru) :-
	write(' Basarili bi sekilde oynadiniz'),
	write(Bahismiktari),
	write(' taclar '),
	write(BahisTuru), nl.

/** Kullanicinin parayla ayrilmak istedigi bolum */
timetoquit(Out) :-
	write(' Bizimle oynadiginiz icin tesekkrler, Ayrildiginiz para miktari : '),
	write(Out),
	write(' taclar '), nl,
	write(' Tekrar oyuna bekleriz.'),
	abort.
