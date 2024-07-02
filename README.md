# Astro Glide: Dojo Backend

## Development Setup

### Local Build Instructions

To get the Dojo Backend up and running locally, you will need to follow a series of steps across multiple terminal windows. Here’s a step-by-step guide:

#### Step 1: Initial Setup

1. **Terminal 1 - Build the Project**:
   - Navigate to the `dojo_backend` directory.
   - Run the following command to build the project:
     ```bash
     sozo build
     ```
   
2. **Terminal 2 - Disable Transaction Fees**:
   - In a new terminal, deploy a new instance of katana:
     ```bash
     katana --disable-fee
     ```

#### Step 2: Apply Migrations

3. **Terminal 1 - Apply Database Migrations**:
   - Back in Terminal 1, apply sozo migration in order to deploy your world to katana:
     ```bash
     sozo migrate apply
     ```

4. **Authorization Script**:
   - Run the authorization script located in the `scripts` directory to set default authentication settings. Ensure this script executes successfully:
     ```bash
     ./scripts/default_auth.sh
     ```

5. **Terminal 3 - Run Torii**:
   - Open a third terminal and start the Torii service with the specified world parameter:
     ```bash
     torii --world 0x446f1f19ba951b59935df72974f8ba6060e5fbb411ca21d3e3e3812e3eb8df8
     ```

### Accessing GraphQL Interface

- **GraphQL Endpoint**:
  - You can access the GraphQL interface through the following URL once the backend services are running:
    [http://0.0.0.0:8080/graphql](http://0.0.0.0:8080/graphql)

