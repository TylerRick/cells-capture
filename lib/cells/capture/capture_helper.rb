# encoding: utf-8

module Cells
  module Helpers
    module CaptureHelper
      # Gives you access to the outer ActionView from within your Cell view.
      #
      # See render_cell in lib/cells/capture/rails.rb
      #
      def outer_view
        @opts[:__outer_view]
      end

      # Executes #capture on the outer ActionView and sets <tt>name</tt> as the
      # instance variable name.
      #
      # Example:
      #
      #  <p>
      #  <% outer_capture :greeting do %>
      #    <h1>Hi, Nick!</h1>
      #  <% end %>
      #
      # The captured markup can be accessed in your outer action view or in your layout.
      #
      #  <%= @greeting %>
      def outer_capture(name, &block)
        content     = capture(&block)
        outer_view.send(:instance_variable_set, :"@#{name}", content)
      end

      # Executes #content_for on the outer ActionView.
      #
      # Example:
      #
      #  <p>
      #  <% outer_content_for :greetings do %>
      #    <h1>Hi, Michal!</h1>
      #  <% end %>
      #
      # As in outer_capture, the markup can be accessed in your outer action view or in your layout.
      #
      #  <%= yield :greetings %>
      def outer_content_for(name, content = nil, &block)
        outer_view.instance_eval do
          #require 'ruby-debug'; debugger 
          #puts "self.object_id=#{self.object_id.inspect}"
          s = content_for(name, content, &block)
          #puts "s=#{s.inspect}"
        end
        nil
      end

      def outer_content_for?(name)
        outer_view.send("content_for?", name)
      end
    end
  end
end

Cells::Rails.class_eval do
  include ::Cells::Helpers::CaptureHelper
end
