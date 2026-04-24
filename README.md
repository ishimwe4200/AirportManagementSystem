## 📁 Project Structure

```
AirportManagementSystem/
├── src/                          ← Source root (configured in .classpath and .vscode/settings.json)
│   ├── core/
│   │   ├── AirportEntity.java    ← Abstract class with 10 abstract methods
│   │   └── AirportManager.java   ← Implements Reservable, Payable, Trackable
│   ├── interfaces/
│   │   ├── Reservable.java
│   │   ├── Payable.java
│   │   └── Trackable.java
│   ├── flights/
│   │   ├── Flight.java           ← Base class
│   │   ├── DomesticFlight.java
│   │   ├── InternationalFlight.java
│   │   ├── CargoFlight.java
│   │   ├── CharterFlight.java
│   │   └── EmergencyFlight.java
│   ├── passengers/
│   │   └── Passenger.java
│   ├── booking/
│   │   ├── Ticket.java
│   │   ├── Reservation.java
│   │   └── BoardingPass.java
│   ├── staff/
│   │   ├── Staff.java            ← Base class
│   │   ├── Pilot.java
│   │   ├── CabinCrew.java
│   │   ├── GroundStaff.java
│   │   ├── SecurityOfficer.java
│   │   └── MaintenanceStaff.java
│   ├── airport/
│   │   ├── Airport.java
│   │   ├── Terminal.java
│   │   └── Gate.java
│   ├── operations/
│   │   ├── Baggage.java
│   │   ├── SecurityCheck.java
│   │   ├── Payment.java
│   │   ├── Schedule.java
│   │   └── Notification.java
│   └── system/
│       ├── AirportSystem.java    ← Main class with interactive menu
│       ├── FlightFactory.java    ← Factory pattern
│       ├── InputValidator.java   ← Comprehensive validation
│       └── ReportGenerator.java  ← 4 report types
├── out/                          ← Compiled .class files (44 files)
├── .classpath                    ← Eclipse project config
├── .project                      ← Eclipse project metadata
├── .vscode/
│   └── settings.json             ← VS Code Java source root config
├── run.bat                       ← Windows compile & run script
└── README.md                     ← This file
```

---

## 🎯 OOP Concepts Demonstrated

| Concept | Implementation |
|---------|----------------|
| **Encapsulation** | All classes use private fields with public getters/setters |
| **Abstraction** | `AirportEntity` abstract class with 10 abstract methods |
| **Interfaces** | `Reservable`, `Payable`, `Trackable` — all implemented by `AirportManager` |
| **Inheritance** | 5 Flight subclasses, 5 Staff subclasses |
| **Polymorphism** | Method overriding (`toString`, `getFlightType`, `displayFlightInfo`), Factory pattern |
| **Constructors** | Default + parameterized constructors in every class |

---

## 🚀 How to Run

### Option 1: Run the JAR (Recommended)
```bash
java -jar AirportManagementSystem.jar
```

### Option 2: Run with Docker
```bash
# Build the Docker image
docker build -t airport-management-system .

# Run interactively (the -it flag is required for the menu)
docker run -it airport-management-system
```

### Option 3: Using the Batch Script (Windows)
```cmd
run.bat
```

### Option 4: Compile from source (standard JDK in PATH)
```bash
javac -d out -sourcepath src src/system/AirportSystem.java \
  src/staff/*.java src/airport/*.java \
  src/operations/Schedule.java src/operations/Notification.java

java -cp out system.AirportSystem
```

---

## 📋 Features

### Main Menu Options

1. **Register Passenger** — Create new passenger with validation
2. **View Available Flights** — Display all flights (7 pre-seeded)
3. **Book a Flight** — Select passenger, flight, seat, class
4. **View My Bookings** — Show all tickets for a passenger
5. **Process Payment** — Pay for a ticket (CREDIT_CARD, CASH, ONLINE, DEBIT_CARD)
6. **Generate Boarding Pass** — Create formatted boarding pass
7. **Security Check** — Run security screening for a passenger
8. **Check Baggage** — Check-in baggage with weight validation
9. **View Reports** — 4 report types:
   - Daily Flights Report
   - Passenger Statistics
   - Revenue Report
   - Delays Report
10. **Airport Manager Demo** — Demonstrates all OOP concepts

---

## ✅ Validation Features

The `InputValidator` class provides comprehensive validation with clear error messages:

- **Empty input** — Rejects null/blank values
- **Invalid data types** — Validates integers and doubles
- **Negative values** — Ensures positive numbers where required
- **Passport format** — 1-2 letters + 6-9 digits (e.g., A1234567)
- **Flight ID format** — 2-3 letters + 3-4 digits (e.g., AA123)
- **Seat number format** — 1-3 digits + letter A-F (e.g., 12A)
- **Phone format** — 10-15 digits, optional +
- **Duplicate entries** — Prevents duplicate passports, seat bookings
- **Overbooking** — Checks flight capacity before booking
- **Class type** — Validates ECONOMY/BUSINESS/FIRST
- **Payment method** — Validates CREDIT_CARD/DEBIT_CARD/CASH/ONLINE

All validation errors display helpful messages and re-prompt the user.

---

## 🏗️ Class Hierarchy

### Abstract Class: AirportEntity
```
AirportEntity (abstract)
├── 10 Abstract Methods:
│   ├── validateEntity()
│   ├── activateEntity()
│   ├── deactivateEntity()
│   ├── updateDetails()
│   ├── generateReport()
│   ├── logActivity()
│   ├── checkStatus()
│   ├── archiveEntity()
│   ├── restoreEntity()
│   └── displaySummary()
└── Implemented by: AirportManager
```

### Flight Inheritance
```
Flight (base)
├── DomesticFlight (regionCode)
├── InternationalFlight (passportRequired, visaRequirement)
├── CargoFlight (cargoWeightLimit, cargoType)
├── CharterFlight (privateClientName, charterFee)
└── EmergencyFlight (emergencyLevel, emergencyDescription)
```

### Staff Inheritance
```
Staff (base)
├── Pilot (flightHours, licenseNumber)
├── CabinCrew (languageSkills)
├── GroundStaff (department)
├── SecurityOfficer (securityLevel, badgeNumber)
└── MaintenanceStaff (specialization)
```

---

## 🔧 IDE Configuration

### VS Code / Eclipse
The project includes:
- `.classpath` — Eclipse Java project configuration
- `.project` — Eclipse project metadata
- `.vscode/settings.json` — VS Code Java extension configuration

These files tell the IDE that `src/` is the source root, resolving all package imports correctly.

### IntelliJ IDEA
If using IntelliJ:
1. Open the `AirportManagementSystem` folder as a project
2. Right-click `src` → Mark Directory as → Sources Root
3. Set output path to `out`

---

## 📊 Sample Output

### Boarding Pass
```
╔══════════════════════════════════════╗
║           BOARDING PASS              ║
╠══════════════════════════════════════╣
║ BP ID       : BP001                  ║
║ Passenger   : John Doe               ║
║ Flight      : AA101                  ║
║ Destination : Los Angeles            ║
║ Seat        : 12A                    ║
║ Class       : ECONOMY                ║
║ Gate        : G12                    ║
║ Boarding    : 2026-04-24 14:30       ║
╚══════════════════════════════════════╝
```

### Payment Receipt
```
╔══════════════════════════════════════╗
║           PAYMENT RECEIPT            ║
╠══════════════════════════════════════╣
║ Payment ID  : PAY001                 ║
║ Amount      : $200.00                ║
║ Method      : CREDIT_CARD            ║
║ Status      : COMPLETED              ║
║ Time        : 2026-04-24 14:25:30    ║
╚══════════════════════════════════════╝
```

---

## 📝 Assignment Requirements Checklist

### PART A: Core System Structure ✅
- [x] Abstract class `AirportEntity` with 10 abstract methods
- [x] Default + parameterized constructors
- [x] Getters/setters, toString() override
- [x] Interface `Reservable` (3 methods)
- [x] Interface `Payable` (3 methods)
- [x] Interface `Trackable` (3 methods)
- [x] Class `AirportManager` extends `AirportEntity`, implements all 3 interfaces

### PART B: Flight System ✅
- [x] Base class `Flight` with all required attributes
- [x] 5 Flight subclasses with unique attributes
- [x] Method overriding (toString, getFlightType, displayFlightInfo)
- [x] calculateFlightDuration() method

### PART C: Passenger & Booking System ✅
- [x] Class `Passenger` with all attributes
- [x] Class `Ticket` with calculateTicketPrice(), generateTicketDetails()
- [x] Class `Reservation` with confirm/cancel/update methods
- [x] Class `BoardingPass` with formatted output

### PART D: Staff & Operations ✅
- [x] Base class `Staff`
- [x] 5 Staff subclasses with unique attributes
- [x] Classes: Airport, Terminal, Gate

### PART E: Advanced System Classes ✅
- [x] Class `Baggage` with status tracking
- [x] Class `SecurityCheck` with performCheck()
- [x] Class `Payment` with processPayment(), generateReceipt()
- [x] Class `Schedule`
- [x] Class `Notification`
- [x] Class `ReportGenerator` (4 report types)
- [x] Class `InputValidator` (comprehensive validation)
- [x] Class `FlightFactory` (factory pattern)
- [x] Class `AirportSystem` (main class with full menu)

### Validation Requirements ✅
- [x] Empty input handling
- [x] Invalid data type handling
- [x] Negative value validation
- [x] Passport/ID format validation
- [x] Duplicate entry prevention
- [x] Overbooking prevention
- [x] Clear error messages
- [x] Re-prompt on invalid input

---

## 🐳 Docker

### Build & Run
```bash
# Build the image
docker build -t airport-management-system .

# Run interactively (-it is required for the menu input)
docker run -it airport-management-system
```
