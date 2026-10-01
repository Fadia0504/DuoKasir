// tentukan besar diskon yang didapat pembeli
double hitungPersenDiskon(double totalBelanja, bool member){
  // belanja minimal 100rb dan terdaftar member diskon 15% (10% + bonus 5%)
  if (totalBelanja >= 100000 && member == true) {
    return 0.15;
  }
  // belanja minimal 100rb tapi ga daftar member cuman diskon 10% aja
  if (totalBelanja >= 100000 && member == false) {
    return 0.10;
  }
  // belanja kurang dari 100rb ga dapat diskon
  return 0;
}

double hitungPotongan(double diskon, double totalBelanja) {
  double potongan = diskon * totalBelanja;
  
  // potongan dibatasi maksimal 25.000
  if (potongan >= 25000){
    return 25000;
  }
  return potongan;
}

double hitungTotalBayar(double totalBelanja, bool member){
  
  double persen = hitungPersenDiskon(totalBelanja, member);
  double potongan = hitungPotongan(persen, totalBelanja);
  double totalBayar = totalBelanja - potongan;

  return totalBayar;
}
void main() {
  // cetak hasil keempat skenario
  print(hitungTotalBayar(80000,false));
  print(hitungTotalBayar(150000,false));
  print(hitungTotalBayar(150000,true));
  print(hitungTotalBayar(300000,true));
}