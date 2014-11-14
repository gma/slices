module Slices
  # We keep this method in here to facilate easier overriding when re-opening Page.
  module PageAsJSON
    def as_json(options = {})
      options ||= {}

      hash = attributes.symbolize_keys.except(:_id, :_type, :_keywords, :set_slices, :site_id).merge(
        id:        id,
        permalink: permalink,
        slices:    ordered_slices_for(options[:slice_embed]).map {|slice| slice.as_json },
        available_layouts: available_layouts,
        author:    author
      )

      fields.select { |name, field| field.localized? }.keys.each do |key|
        hash.merge!(key.to_sym => send(key))
      end

      keys = options[:only]
      keys ? hash.slice(keys) : hash
    end
  end
end
