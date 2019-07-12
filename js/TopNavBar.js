class TopNavBar extends HTMLElement {
  constructor() {
    super();
    //shadow root
    const shadow = this.attachShadow({ mode: "open" });
    //navbar div
    const nav = document.createElement("div");
    nav.setAttribute("class", "topNavBar");
    //Home
    const li_home = document.createElement("a");
    li_home.setAttribute("href", "./flights.html");
    li_home.innerHTML = "Flights";
    nav.appendChild(li_home);
    //Customer Registration
    const li_reg = document.createElement("a");
    li_reg.setAttribute("href", "./reg.html");
    li_reg.innerHTML = "Customer Registration";
    nav.appendChild(li_reg);
    //Representative Login
    const li_repLogin = document.createElement("a");
    li_repLogin.setAttribute("href", "./repLogin.html");
    li_repLogin.innerHTML = "Login";
    nav.appendChild(li_repLogin);

    const style = document.createElement("style");
    style.textContent = `
    .topNavBar {
        /*background-color: #333;*/
        width: 100%;
        overflow: hidden;
        padding: 0;
        position: relative;
        margin-top: 0;
        height: 5vh;
        }
        
        .topNavBar a {
        float: left;
        color: black;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        font-size: 17px;
        }
        
        .topNavBar a:hover {
        background-color: #ddd;
        color: black;
        }
        
        .topNavBar a.active {
        background-color: #4CAF50;
        color: white;
        }
  `;
    shadow.appendChild(style);
    shadow.appendChild(nav);
  }
}
customElements.define("top-navbar", TopNavBar);
