import "../common/models.tsp";
import "./models.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace Azure.AI.Projects;

alias ToolsetsPreviewHeader = WithRequiredFoundryPreviewHeader<FoundryFeaturesOptInKeys.toolset_v1_preview>;

@tag("Toolsets")
interface Toolsets {
  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "not yet an Azure operation"
  @doc("Create a toolset.")
  @operationId("createToolset")
  @post
  @route("/toolsets")
  @extension("x-ms-foundry-meta", ToolsetsRequiredPreviews)
  createToolset is FoundryDataPlaneOperation<
    CreateToolsetRequest & ToolsetsPreviewHeader,
    ToolsetObject
  >;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "not yet an Azure operation"
  @doc("Update a toolset. Creates a new version of the toolset with an incremented version number.")
  @operationId("updateToolset")
  @post
  @route("/toolsets/{toolset_name}")
  @extension("x-ms-foundry-meta", ToolsetsRequiredPreviews)
  updateToolset is FoundryDataPlaneOperation<
    UpdateToolsetRequest & ToolsetsPreviewHeader,
    ToolsetObject
  >;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "not yet an Azure operation"
  @doc("Retrieve a toolset.")
  @operationId("getToolset")
  @get
  @route("/toolsets/{toolset_name}")
  @extension("x-ms-foundry-meta", ToolsetsRequiredPreviews)
  getToolset is FoundryDataPlaneOperation<
    GetToolsetRequest & ToolsetsPreviewHeader,
    ToolsetObject
  >;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "not yet an Azure operation"
  @doc("List all toolsets.")
  @operationId("listToolsets")
  @get
  @list
  @route("/toolsets")
  @extension("x-ms-foundry-meta", ToolsetsRequiredPreviews)
  listToolsets is FoundryDataPlaneOperation<
    ListToolsetsRequest & ToolsetsPreviewHeader,
    AgentsPagedResult<ToolsetObject>
  >;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "not yet an Azure operation"
  @doc("List all versions of a toolset.")
  @operationId("listToolsetVersions")
  @get
  @list
  @route("/toolsets/{toolset_name}/versions")
  @extension("x-ms-foundry-meta", ToolsetsRequiredPreviews)
  listToolsetVersions is FoundryDataPlaneOperation<
    ListToolsetVersionsRequest & ToolsetsPreviewHeader,
    AgentsPagedResult<ToolsetObject>
  >;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "not yet an Azure operation"
  @doc("Delete a toolset.")
  @operationId("deleteToolset")
  @delete
  @route("/toolsets/{toolset_name}")
  @extension("x-ms-foundry-meta", ToolsetsRequiredPreviews)
  deleteToolset is FoundryDataPlaneOperation<
    DeleteToolsetRequest & ToolsetsPreviewHeader,
    DeleteToolsetResponse
  >;
}
