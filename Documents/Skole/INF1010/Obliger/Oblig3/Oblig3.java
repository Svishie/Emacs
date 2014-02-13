import java.util.*;

class Oblig3 {
    public static void main(String[] args) {

    }
}


class Person {//Start Person
    private String navn;
    private String gaveKategori;
    
    private Person forelsketI;
    private Person sammenMed;
    public Person neste;

    private Person[]  kjenner = new Person[100];
    private Person[] likerIkke = new Person[100]; // = uvenner
    private Gave[] mineGaver;
    // Arrays som peker paa personobjekter som personen kjenner og 
    // som personen ikke liker

    private Gave[] mineGaver;

    Person (String n) {
	//Konstruktoer som setter navn paa personen
	this.navn = n;

    }

    public String getNavn() {//Henter navn utenifra
	return navn;
    }
    
    public boolean erKjentMed(Person p) {
	//sjekker om personen kjenner den gitte personen
	for(int i = 0; i < kjenner.length; i++) {
	    if(kjenner[i] == p) return true;
	}

	return false;
    }

    public void blirKjentMed(Person p) {
	//legger til en person i kjenner-arrayet
	if(!this.equals(p)) {
	    leggTilPerson(p, kjenner);
	}
    }
    private void leggTilPerson(Person p, Person[] a) {
	//intern metode for aa legge til en person paa en ledig plass
	//i et gitt array
	for(int i = 0; i < a.length; i++) {
	    if(a[i] == null) {
		a[i] = p;
		return;
	    }
	}

	return;
    }

    public void blirForelsketI(Person p) {
	//setter forelsketI til aa peke paa den gitte personen
	if(!(this.equals(p)) {
	    forelsketI = p;
	}
    }

    public void blirUvennMed(Person p) {
	//legger til en person i likerIkke-arrayen
	if(!(this == p)) {
	    leggTilPerson(p, likerIkke);
	}
    }

    public boolean erVennMed(Person p) {
	//sjekker om personen er venn med den gitte personen
	//altsaa at den kjenner personen og at personen ikke er i
	//likerIkke-arrayen
	if(inneholderPerson(p, kjenner) && !inneholderPerson(p, likerIkke)){
	    return true;
	}
	else{
	    return false;
	}
    }
    private boolean inneholderPerson(Person p, Person[] a) {
	//intern metode for aa sjekke om en gitt person i et gitt array
	for(int i = 0; i < a.length; i++) {
	    if(p.equals(a[i]))return true;
	}
	return false;
    }

    public void blirVennMed(Person p) {
	//blir venn med en gitt person
	//fjernes fra likerIkke-array hvis personen er i det
	if(inneholderPerson(p, likerIkke)) {
	    int i = indeksTilPerson(p, likerIkke);
	    likerIkke[i] = null;
	}
	blirKjentMed(p);
    }
    private int indeksTilPerson(Person p, Person[] a) {
	//intern metode for aa finne indeksen til en gitt person i et gitt array
	for(int i = 0; i < a.length; i++) {
	    if(p == a[i])return i;
	}
	return -1;
    }

    public void skrivUtVenner() {
	//Skriver ut alle vennene til en gitt person
	for(int i = 0; i < kjenner.length; i++) {
	    if(inneholderPerson(kjenner[i], likerIkke))continue;
	    
	    System.out.println(kjenner[i].getNavn());
	}
    }

    public Person hentBestevenn() {
	//returnerer en peker til bestevennen til personen
	return kjenner[0];
    }

    public Person[] hentVenner() {
	//Returnerer et array som inneholder alle vennene til personen
	//og er like lang som antall venner
	int indeks = 0;

	for(int i = 0; i < kjenner.length; i++) {
	    if(!inneholderPerson(kjenner[i], likerIkke)) {
		indeks++;
	    }
	}

	Person[] forkortet = new Person[indeks];

	for(int i = 0; i < forkortet.length; i++) {
	    forkortet[i] = kjenner[i];
	}

	return forkortet;
    }

    public int antVenner() {
	//returnerer antall venner
	return hentVenner().length;
    }

    public void skrivUtKjenninger() {
	//Skriver ut alle personene i arrayet kjenner
	for(Person p: kjenner) {
	    if(p != null) {
		System.out.print(p.getNavn() + " ");
	    }
	}
	System.out.println();
    }

    public void skrivUtLikerIkke() {
	//Skriver ut aller personene i arrayet likerIkke
	for(Person p: likerIkke) {
	    if(p != null) {
		System.out.print(p.getNavn() + " ");
	    }
	}
	System.out.println();
    }

    public void skrivUtAltOmMeg() {
	//Skriver ut hvem personen kjenner, er forelsket i og ikke liker
	System.out.print(navn + " kjenner: ");
	skrivUtKjenninger();

	if(forelsketI != null) {
	    System.out.println(navn + " er forelsket i " + 
			       forelsketI.getNavn());
	}

	if(likerIkke[0] != null) {
	    System.out.print(navn + " liker ikke: ");
	    skrivUtLikerIkke();
	}

	if(sammenMed != null) {
	    System.out.println(navn + " er sammen med " + sammenMed.getNavn());
	}

	for(int i = 0; i < mineGaver.length; ++i) {
	    //Skriv ut gaver
	}
    }

    public void samlerAv(String smlp, int ant) {
	gaveKategori = smlp;
	minegaver = new Gave[ant];
    }
    
    public void erSammenMed() {
	return sammenMed;
    }

    public void bliSammenMed(Person p) {
	if(this.equals(p)) return;

	sammenMed = p;

	if(!p.erSammenMed.equals(this)) {
	    p.bliSammenMed(this);
	}
    }

}//Person slutt
