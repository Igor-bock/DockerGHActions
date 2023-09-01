FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["GitHubActionTest.csproj", "GHAction/"]
RUN dotnet clean GHAction/GitHubActionTest.csproj
RUN dotnet restore GHAction/GitHubActionTest.csproj
COPY . ./
RUN dotnet publish GitHubActionTest.csproj -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish /app
ENTRYPOINT [ "dotnet", "/app/GitHubActionTest.dll" ]
