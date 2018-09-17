local string_array = {
  type = "array",
  elements = { type = "string" },
  default = {},
}


local colon_string_array = {
  type = "array",
  elements = { type = "string", match = "^[^:]+:.*$" },
  default = {},
}

local default_record = { json = {}, headers = {} }

local string_record = {
  type = "record", nullable = false,
  fields = {
    json = string_array,
    headers = string_array,
  },
  default = default_record,
}


local colon_string_record = {
  type = "record", nullable = false,
  fields = {
    json = colon_string_array,
    headers = colon_string_array,
  },
  default = default_record,
}


return {
  name = "response-transformer",
  fields = {
    config = {
      type = "record",
      nullable = false,
      fields = {
        { remove = string_record },
        { replace = colon_string_record },
        { add = colon_string_record },
        { append = colon_string_record },
      },
    },
  },
}

