function price() {
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener("keypress", ()=>{

  const addTaxPrice = document.getElementById("add-tax-price");
  const inputPrice = itemPrice.Value;
  addTaxPrice.innerHTML = Math.floor(inputPrice * 0.1);

  })
}
window.addEventListener('load', price);