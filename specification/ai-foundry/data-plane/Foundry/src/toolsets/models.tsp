import "../common/service.tsp";
import "../tools/models.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace Azure.AI.Projects;

const ToolsetsRequiredPreviews = #{
  conditional_previews: #[FoundryFeaturesOptInKeys.toolset_v1_preview],
};

union ToolsetObjectType {
  toolset: "toolset",
  toolsetDeleted: "toolset.deleted",
}

@doc("A toolset that stores reusable tool definitions for agents.")
model ToolsetObject {
  @doc("The object type, which is always 'toolset'.")
  object: ToolsetObjectType.toolset;

  @doc("The unique identifier of the toolset.")
  id: string;

  @doc("The version number of this toolset. Increments with each update.")
  @minValue(1)
  version: int32;

  @doc("The Unix timestamp (seconds) when the toolset was created.")
  @encode("unixTimestamp", int32)
  created_at: utcDateTime;

  @doc("The Unix timestamp (seconds) when this version was created.")
  @encode("unixTimestamp", int32)
  updated_at: utcDateTime;

  @doc("The name of the toolset.")
  @maxLength(256)
  name: string;

  @doc("A human-readable description of the toolset.")
  @maxLength(512)
  description?: string;

  @doc("Arbitrary key-value metadata to associate with the toolset.")
  metadata?: Record<string>;

  @doc("The list of tools contained in this toolset.")
  tools: OpenAI.Tool[];
}

@doc("Response returned when a toolset is deleted.")
model DeleteToolsetResponse {
  @doc("The object type. Always 'toolset.deleted'.")
  object: ToolsetObjectType.toolsetDeleted;

  @doc("The name of the toolset.")
  name: string;

  @doc("Whether the toolset was successfully deleted.")
  deleted: boolean;
}

alias CreateToolsetRequest = {
  @doc("The name of the toolset.")
  @maxLength(256)
  name: string;

  @doc("A human-readable description of the toolset.")
  @maxLength(512)
  description?: string;

  @doc("Arbitrary key-value metadata to associate with the toolset.")
  metadata?: Record<string>;

  @doc("The list of tools to include in the toolset.")
  tools: OpenAI.Tool[];
};

alias UpdateToolsetRequest = {
  @doc("The name of the toolset to update.")
  @path
  toolset_name: string;

  @doc("A human-readable description of the toolset.")
  @maxLength(512)
  description?: string;

  @doc("Arbitrary key-value metadata to associate with the toolset.")
  metadata?: Record<string>;

  @doc("The list of tools to include in the toolset.")
  tools: OpenAI.Tool[];
};

alias GetToolsetRequest = {
  @doc("The name of the toolset to retrieve.")
  @path
  toolset_name: string;

  @doc("The specific version to retrieve. If not specified, returns the latest version.")
  @query
  version?: int32;
};

alias ListToolsetsRequest = {
  ...CommonPageQueryParameters;
};

alias ListToolsetVersionsRequest = {
  @doc("The name of the toolset to list versions for.")
  @path
  toolset_name: string;

  ...CommonPageQueryParameters;
};

alias DeleteToolsetRequest = {
  @doc("The name of the toolset to delete.")
  @path
  toolset_name: string;

  @doc("The specific version to delete. If not specified, deletes all versions.")
  @query
  version?: int32;
};
