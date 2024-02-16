import React from "react"
import { Link } from "react-router-dom";
import { Card, CardBody, CardTitle, CardSubtitle } from "reactstrap"

const CatIndex = ({ cats }) => {
   return (
      <main className="cat-index-cards">
      {cats?.map((cat, index) => {
         return (
            <Card
               style={{ width: "14rem" }}
               key={index}
               data-testid="cat-card" // Add this line to include the data-testid attribute
            >
               <img alt={`profile of a cat named ${cat.name}`} src={cat.image} />
               <CardBody>
                  <CardTitle tag="h5">{cat.name}</CardTitle>
                  <CardSubtitle className="mb-2 text-muted" tag="h6">
                     Age: {cat.age}
                  </CardSubtitle>
                  <a href={`/catshow/${cat.id}`} className="nav-link">See More Details</a>
               </CardBody>
            </Card>
         );
      })}
      </main>
   );
};


export default CatIndex