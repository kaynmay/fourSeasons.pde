//read data from CSV to load images
class data{
  ArrayList<String> fll = new ArrayList<String>();
  ArrayList<String> spr = new ArrayList<String>();
  ArrayList<String> smr = new ArrayList<String>();
  ArrayList<String> wtr = new ArrayList<String>();
  Table table = loadTable("imgs.csv", "header");
  
  data(){
    for (TableRow row : table.rows()) {
    if (row.getInt("Season") == 0) {
      fll.add(row.getString("Name"));
    }
    if (row.getInt("Season") == 1) {
      spr.add(row.getString("Name"));
    }
    if (row.getInt("Season") == 2) {
    smr.add(row.getString("Name"));
    }
    if (row.getInt("Season") == 3) {
      wtr.add(row.getString("Name"));
    }  
  }
  }
  
  void display(){
  }
}