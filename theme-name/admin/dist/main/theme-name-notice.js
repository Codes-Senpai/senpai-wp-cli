/*! For license information please see theme-name-notice.js.LICENSE.txt */
(()=>{var __webpack_modules__={"./src/notice.js":()=>{eval('jQuery(document).ready(function ($) {\n  $(document).on(\'click\', \'.notice-dismiss\', function () {\n    let id = $(this).parent().attr(\'id\');\n    let settings = {\n      "url": senpai_notice_ajax_params.ajaxurl,\n      "method": "POST",\n      "timeout": 0,\n      "headers": {\n        "Content-Type": "application/x-www-form-urlencoded"\n      },\n      "data": {\n        "nonce": senpai_notice_ajax_params.nonce,\n        "id": id,\n        "action": "dashboard_notice_senpai"\n      }\n    };\n    $.ajax(settings).done(function (response) {\n      console.log(response);\n    });\n  });\n});\n\n//# sourceURL=webpack://theme-name/./src/notice.js?')}},__webpack_exports__={};__webpack_modules__["./src/notice.js"]()})();