module ActiveScaffold::Config
  class Nested < Base
    def initialize(core_config)
      @core = core_config
    end

    # global level configuration
    # --------------------------
    
    # instance-level configuration
    # ----------------------------

    # Add a nested ActionLink
    def add_link(label, models)
      @core.action_links.add('nested', :label => label, :type => :record, :security_method => :nested_authorized?, :position => :after, :parameters => {:associations => models.join(' ')})
    end

    # the label for this Nested action. used for the header.
    attr_writer :label
    def label
      @label ? _(@label) : "#{_('CREATE_FROM_EXISTING')} #{@core.label.singularize}"
    end

  end
end
