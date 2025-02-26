namespace Devantler.HelmCLI.Tests.HelmTests;

/// <summary>
/// Tests for the RunAsync method.
/// </summary>
public class RunAsyncTests
{
  /// <summary>
  /// Tests that the binary can return the version of the helm CLI command.
  /// </summary>
  /// <returns></returns>
  [Fact]
  public async Task RunAsync_Version_ReturnsVersion()
  {
    // Act
    var (exitCode, output) = await Helm.RunAsync(["-v"]);

    // Assert
    Assert.Equal(0, exitCode);
    Assert.Matches(@"^v\d+\.\d+\.\d+$", output.Trim());
  }
}
