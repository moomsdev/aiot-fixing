/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./resources/scripts/admin/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./resources/scripts/admin/custom_thumbnail_support.js":
/*!*************************************************************!*\
  !*** ./resources/scripts/admin/custom_thumbnail_support.js ***!
  \*************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

/* WEBPACK VAR INJECTION */(function(jQuery, $) {var mediaGridObserver = new MutationObserver(function (mutations) {
  for (var i = 0; i < mutations.length; i++) {
    for (var j = 0; j < mutations[i].addedNodes.length; j++) {
      var element = jQuery(mutations[i].addedNodes[j]);
      if (element.attr('class')) {
        var elementClass = element.attr('class');
        if (element.attr('class').indexOf('attachment') !== -1) {
          var attachmentPreview = element.children('.attachment-preview');
          if (attachmentPreview.length !== 0) {
            if (attachmentPreview.attr('class').indexOf('subtype-svg+xml') !== -1) {
              var handler = function (element) {
                jQuery.ajax({
                  url: '/wp-admin/admin-ajax.php',
                  type: "POST",
                  dataType: 'html',
                  data: {
                    'action': 'mm_get_attachment_url_thumbnail',
                    'attachmentID': element.attr('data-id')
                  },
                  success: function success(data) {
                    if (data) {
                      element.find('img').attr('src', data);
                      element.find('.filename').text('SVG Image');
                    }
                  }
                });
              }(element);
            }
          }
        }
      }
    }
  }
});
var attachmentPreviewObserver = new MutationObserver(function (mutations) {
  for (var i = 0; i < mutations.length; i++) {
    for (var j = 0; j < mutations[i].addedNodes.length; j++) {
      var element = $(mutations[i].addedNodes[j]);
      var onAttachmentPage = false;
      if (element.hasClass('attachment-details') || element.find('.attachment-details').length != 0) {
        onAttachmentPage = true;
      }
      if (onAttachmentPage == true) {
        var urlLabel = element.find('label[data-setting="url"]');
        if (urlLabel.length != 0) {
          var value = urlLabel.find('input').val();
          element.find('.details-image').attr('src', value);
        }
      }
    }
  }
});
jQuery(document).ready(function () {
  mediaGridObserver.observe(document.body, {
    childList: true,
    subtree: true
  });
});
/* WEBPACK VAR INJECTION */}.call(this, __webpack_require__(/*! jquery */ "jquery"), __webpack_require__(/*! jquery */ "jquery")))

/***/ }),

/***/ "./resources/scripts/admin/index.js":
/*!******************************************!*\
  !*** ./resources/scripts/admin/index.js ***!
  \******************************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _styles_admin__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @styles/admin */ "./resources/styles/admin/index.scss");
/* harmony import */ var _styles_admin__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_styles_admin__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var _scripts_admin_custom_thumbnail_support_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @scripts/admin/custom_thumbnail_support.js */ "./resources/scripts/admin/custom_thumbnail_support.js");
/* harmony import */ var _scripts_admin_custom_thumbnail_support_js__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(_scripts_admin_custom_thumbnail_support_js__WEBPACK_IMPORTED_MODULE_1__);



/***/ }),

/***/ "./resources/styles/admin/index.scss":
/*!*******************************************!*\
  !*** ./resources/styles/admin/index.scss ***!
  \*******************************************/
/*! no static exports found */
/***/ (function(module, exports) {

// removed by extract-text-webpack-plugin

/***/ }),

/***/ "jquery":
/*!*************************!*\
  !*** external "jQuery" ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = jQuery;

/***/ })

/******/ });
//# sourceMappingURL=admin.js.map