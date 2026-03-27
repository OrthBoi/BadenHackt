--Haupttabellen

INSERT INTO users(name, email, passwort) VALUES 
('Harry Potter', 'harry@potter.com', '123'),
('Bilbo Beutlin', 'bilbo@beutlin.com', '321'),
('Percy Jackson', 'percy@jackson.com', '456'),
('Saitama', 'saitama@one-punch-man.com', '654'),
('Fred Waeasley', 'fred@waeasley.com', '789');

INSERT INTO company (usersID, name, description) VALUES
(1,'Coop', 'Schweizer Detailhandelsgeschäft'),
(2, 'Migros', 'Schweizer Grosshandelsgeschäft');

INSERT INTO product (name, expiredate, storage) VALUES
('Milch', '2026-04-10', 1), -- 1 = kühl lagern 
('Brot', '2026-04-15', 0), -- 0 = normal lagern
('Schokolade', '2026-10-20', 1), 
('Muffin', '2026-04-05', 0),
('Zopf', '2026-03-01', 0);

INSERT INTO origin (country, region, producer, date_of_production) VALUES 
('Schweiz', 'Appenzell', 'Appenzeller Milch AG', '2026-03-20'),       
('Schweiz', 'Zürcher Unterland', 'Mühle Otelfingen', '2026-02-15'),    
('Deutschland', 'Lübeck', 'Niederegger Rohmassen', '2026-03-01'),      
('Liechtenstein', 'Balzers', 'Bäckerei Gutshof', '2026-03-10'),        
('Deutschland', 'Schwarzwald', 'Bauerntradition e.G.', '2026-02-20');  

INSERT INTO ingredient (originID, name, expiredate, storage, checked) VALUES 
(1, 'Past-Milch 3.5%', '2026-04-10', 1, 1),    -- Herkunft: Appenzell
(2, 'Weissmehl Type 550', '2027-02-01', 0, 1), -- Herkunft: Otelfingen
(3, 'Kakaomasse', '2027-01-15', 0, 1),         -- Herkunft: Lübeck
(4, 'Backhefe', '2026-06-01', 1, 1),           -- Herkunft: Balzers
(5, 'Roggenvollkorn', '2026-12-31', 0, 1);     -- Herkunft: Schwarzwald

-- Verbindungstabellen

INSERT INTO product_ingredient (productID, ingredientID) VALUES 
(1,1), -- Milch (ID 1) -> besteht teilweise aus Past-Milch
(2,5), -- BRot (ID 2) -> besteht teilweise aus Roggenvollkorn
(3,3),
(5,2), 
(5,4);


INSERT INTO product_company (companyID, productID) VALUES
(1,5), -- coop verkauf zopf
(1,1), 
(2,2), 
(2,3); -- migros verkauf schokolade


INSERT INTO users_company (usersID, companyID) VALUES
(1,1),
(4,2); -- saitama gehört zu migros 

-- tabelle für transport 

INSERT INTO transport (mean_of_transport, travel_distance_km) VALUES 
('LKW', 125),
('Güterzug', 80),
('Güterzug', 110),
('LKW', 50),
('Traktor', 13);

INSERT INTO transport_origin (transportID, originID) VALUES 
(1,1),
(3,2), -- per güterzug (T3) kamm das mehl von origin 2
(2,3),
(4,4), 
(5,5);