# Ensures that when we pass a :message parameter to our validations, that
# message is a sentence (and not something to be prefixed by the column
# name). Rationale: ActiveSupport::Inflector is in over its head on this
# one.
#
# So instead of:
#   validates_presence_of :name, 'should not be blank'
# Use:
#   validates_presence_of :name, 'Name should not be blank'
#
# If, however, you just use:
#   validates_presence_of :name
#
# The behavior will remain unchanged.
module FixActiveRecordValidationsFullMessages
  def self.install
    # Instead of generating error messages in error_messages_for(), we
    # generate error messages as they are added. The messages are thus
    # suitable for presentation without helper methods.
    ActiveRecord::Errors.class_eval do
      # Remove complicated logic
      def full_messages_with_full_messages
        returning full_messages = [] do
          @errors.each_key do |attr|
            @errors[attr].each do |msg|
              full_messages << msg if msg
            end
          end
        end
      end
      alias_method_chain :full_messages, :full_messages # my little joke
    end
  end
end
