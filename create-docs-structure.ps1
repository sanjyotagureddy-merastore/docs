# Define the root directory for the documentation
$RootDir = "."

# Create the main directory
try {
    New-Item -Path $RootDir -ItemType Directory -Force
    Write-Host "Main directory '$RootDir' created or already exists."
} catch {
    Write-Error "Failed to create main directory '$RootDir': $_"
}

# Create the subdirectories
$dirs = @(
    "$RootDir\architecture",
    "$RootDir\services\user-service",
    "$RootDir\services\product-service",
    "$RootDir\services\inventory-service",
    "$RootDir\services\cart-service",
    "$RootDir\services\order-service",
    "$RootDir\services\authentication-service",
    "$RootDir\shared-kernel",
    "$RootDir\deployment\docker",
    "$RootDir\deployment\ci-cd",
    "$RootDir\deployment\monitoring",
    "$RootDir\multi-tenancy",
    "$RootDir\testing",
    "$RootDir\guides"
)

foreach ($dir in $dirs) {
    try {
        New-Item -Path $dir -ItemType Directory -Force
        Write-Host "Directory '$dir' created or already exists."
    } catch {
        Write-Error "Failed to create directory '$dir': $_"
    }
}

# Create initial files
$files = @(
    "$RootDir\README.md",
    "$RootDir\architecture\system-architecture.md",
    "$RootDir\architecture\deployment-diagram.md",
    "$RootDir\architecture\design-decisions.md",
    "$RootDir\services\user-service\api-docs.md",
    "$RootDir\services\user-service\data-models.md",
    "$RootDir\services\user-service\authentication.md",
    "$RootDir\services\user-service\error-handling.md",
    "$RootDir\services\user-service\logging.md",
    "$RootDir\services\product-service\api-docs.md",
    "$RootDir\services\product-service\data-models.md",
    "$RootDir\services\product-service\authentication.md",
    "$RootDir\services\product-service\error-handling.md",
    "$RootDir\services\product-service\logging.md",
    "$RootDir\services\inventory-service\api-docs.md",
    "$RootDir\services\inventory-service\data-models.md",
    "$RootDir\services\inventory-service\authentication.md",
    "$RootDir\services\inventory-service\error-handling.md",
    "$RootDir\services\inventory-service\logging.md",
    "$RootDir\services\cart-service\api-docs.md",
    "$RootDir\services\cart-service\data-models.md",
    "$RootDir\services\cart-service\authentication.md",
    "$RootDir\services\cart-service\error-handling.md",
    "$RootDir\services\cart-service\logging.md",
    "$RootDir\services\order-service\api-docs.md",
    "$RootDir\services\order-service\data-models.md",
    "$RootDir\services\order-service\authentication.md",
    "$RootDir\services\order-service\error-handling.md",
    "$RootDir\services\order-service\logging.md",
    "$RootDir\services\authentication-service\api-docs.md",
    "$RootDir\services\authentication-service\data-models.md",
    "$RootDir\services\authentication-service\authentication.md",
    "$RootDir\services\authentication-service\error-handling.md",
    "$RootDir\services\authentication-service\logging.md",
    "$RootDir\shared-kernel\error-handling.md",
    "$RootDir\shared-kernel\logging.md",
    "$RootDir\shared-kernel\configuration.md",
    "$RootDir\shared-kernel\api-client.md",
    "$RootDir\deployment\docker\docker-compose.md",
    "$RootDir\deployment\docker\Dockerfile.md",
    "$RootDir\deployment\ci-cd\github-actions.md",
    "$RootDir\deployment\ci-cd\deployment-pipeline.md",
    "$RootDir\deployment\monitoring\monitoring-setup.md",
    "$RootDir\deployment\monitoring\alerting.md",
    "$RootDir\multi-tenancy\architecture.md",
    "$RootDir\multi-tenancy\tenant-management.md",
    "$RootDir\multi-tenancy\security.md",
    "$RootDir\multi-tenancy\configuration.md",
    "$RootDir\testing\testing-strategy.md",
    "$RootDir\testing\unit-tests.md",
    "$RootDir\testing\integration-tests.md",
    "$RootDir\testing\end-to-end-tests.md",
    "$RootDir\guides\user-guide.md",
    "$RootDir\guides\developer-guide.md"
)

foreach ($file in $files) {
    try {
        New-Item -Path $file -ItemType File -Force
        Write-Host "File '$file' created or already exists."
    } catch {
        Write-Error "Failed to create file '$file': $_"
    }
}

Write-Host "Documentation folder structure and initial files created successfully."
