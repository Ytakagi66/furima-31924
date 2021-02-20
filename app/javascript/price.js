function price() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", (e) => {
    const inputPrice = document.getElementById("item-price").value;
    const add_tax_price_id = document.getElementById("add-tax-price");
    const profit_id = document.getElementById("profit");
    const tax =  Math.ceil(inputPrice * 0.1);
    const profit = Math.floor(inputPrice - tax);
    add_tax_price_id.innerHTML = tax;
    profit_id.innerHTML = profit;
  });

}
window.addEventListener('load', price);