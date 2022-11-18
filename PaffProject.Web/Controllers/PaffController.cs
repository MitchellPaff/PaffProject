using Microsoft.AspNetCore.Mvc;
using Azure.Storage.Blobs;

namespace PaffProject.Web.Controllers;

[ApiController]
[Route("[controller]")]
public class PaffController : ControllerBase
{
    private readonly ILogger<PaffController> _logger;
    private readonly BlobServiceClient _blobServiceClient;

    public PaffController(ILogger<PaffController> logger, BlobServiceClient blobServiceClient)
    {
        _logger = logger;
        _blobServiceClient = blobServiceClient;

    }

    [HttpPost(Name = "PaffPost")]
    public string Post()
    {
        var containerClient = _blobServiceClient.GetBlobContainerClient("paffstoragecontainer");
        var date = DateTime.Now.ToString("G");
        containerClient.UploadBlobAsync(date, BinaryData.FromString(date));
        return date;
    }
}
