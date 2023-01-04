describe("Add to Cart Testing", () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit("http://localhost:3000");
  });

  it("displays 'WELCOME TO THE JUNGLE' on a landing page", () => {
    cy.get('.title > h1')
    cy.contains("Welcome to")
    cy.contains("The Jungle")
  });

  it("goes to the product detail page and clicks add to cart and checks it's added to the cart", () => {
    cy.get('[alt="Scented Blade"]').click();
    cy.contains('The Scented Blade is an extremely rare')
    cy.get('.btn').click();
    cy.get('.end-0 > .nav-link').contains("1");
    // cy.contains('The Scented Blade is an extremely rare')
  });

});
