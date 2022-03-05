# Build app outside Docker container.
# Preferred for CI tools.

# Build runtime image.
FROM mcr.microsoft.com/dotnet/aspnet:6.0

# Copy the build artifacts from the publish folder on the computer to App folder in the container.
COPY bin/Release/net6.0/publish/ App/

# Changes the current directory inside of the container to App.
WORKDIR /App

# For added security, opt-out of the diagnostic pipeline.
# This allows the container to run as readonly. 
ENV DOTNET_EnableDiagnostics=0

# Configuring Docker container to run as an executable.
#   - When the container starts, the ENTRYPOINT command runs. 
#   - When this command ends, the container will automatically stop.
ENTRYPOINT ["dotnet", "aspnetapp-docker.dll"]