(function() {
  'use strict';

  angular.module('app.components')
    .directive('latestAlertsTable', LatestAlertsTableDirective);

  /** @ngInject */
  function LatestAlertsTableDirective() {
    var directive = {
      restrict: 'AE',
      scope: {
        alerts: '='
      },
      link: link,
      templateUrl: 'app/components/latest-alerts-table/latest-alerts-table.html',
      controller: LatestAlertsTableController,
      controllerAs: 'vm',
      bindToController: true
    };

    return directive;

    function link(scope, element, attrs, vm, transclude) {
      vm.activate();
    }

    /** @ngInject */
    function LatestAlertsTableController() {
      var vm = this;

      vm.activate = activate;

      function activate() {
      }
    }
  }
})();
