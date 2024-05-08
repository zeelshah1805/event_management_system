-- Create table for events
CREATE TABLE events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(255) NOT NULL,
    event_date DATE NOT NULL,
    venue_id INT,
    CONSTRAINT fk_venue
        FOREIGN KEY (venue_id)
        REFERENCES venues(venue_id)
);

-- Create table for attendees
CREATE TABLE attendees (
    attendee_id INT PRIMARY KEY AUTO_INCREMENT,
    attendee_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create table for venues
CREATE TABLE venues (
    venue_id INT PRIMARY KEY AUTO_INCREMENT,
    venue_name VARCHAR(255) NOT NULL,
    venue_address VARCHAR(255) NOT NULL
);

-- Create table for registrations
CREATE TABLE registrations (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    attendee_id INT,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_event
        FOREIGN KEY (event_id)
        REFERENCES events(event_id),
    CONSTRAINT fk_attendee
        FOREIGN KEY (attendee_id)
        REFERENCES attendees(attendee_id)
);

-- Create table for tickets
CREATE TABLE tickets (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    registration_id INT,
    ticket_code VARCHAR(20) UNIQUE,
    ticket_status ENUM('Reserved', 'Confirmed', 'Cancelled') DEFAULT 'Reserved',
    CONSTRAINT fk_registration
        FOREIGN KEY (registration_id)
        REFERENCES registrations(registration_id)
);
