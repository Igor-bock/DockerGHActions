using Microsoft.AspNetCore.Mvc;

namespace GitHubActionTest.Controllers;

[Route("api/[controller]")]
public class TesteController : Controller
{
    [HttpGet]
    public string Index() => "Teste do GitHubActions!";
}

