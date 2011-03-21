require 'cells/rails'

module Cells
  module Capture
    module ActionView
      def render_cell(name, state, opts = {}, *args, &block)
        # This is so that we have this "outer" view object available to us from within the cell (available via @opts[:outer_view] or the outer_view helper) and can use Cells' outer_content_for, etc.
        opts.merge! :__outer_view => self
        super(name, state, opts, *args, &block)
      end
    end

  end
end

ActionView::Base.class_eval do
  include ::Cells::Capture::ActionView
end
