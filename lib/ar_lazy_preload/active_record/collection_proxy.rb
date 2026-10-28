# frozen_string_literal: true

module ArLazyPreload
  # ActiveRecord::CollectionProxy patch for getting records for preload
  module CollectionProxy
    # A loaded association sends the queries chained after it (where, order, scopes) to its
    # association scope, so the scope gets the flag too.
    def preload_associations_lazily
      super.tap { scope.preloads_associations_lazily = true if loaded? }
    end

    private

    def ar_lazy_preload_records
      target
    end
  end
end
