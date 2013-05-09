
var fileFieldCount = 1;

function addFileField() {
  var fields = $('#attachments_fields');
  if (fields.children().length >= 10) return false;
  fileFieldCount++;
  var s = fields.children('span').first().clone();
  s.children('input.file').attr('name', "attachments[" + fileFieldCount + "][file]").val('');
  s.children('input.description').attr('name', "attachments[" + fileFieldCount + "][description]").val('');
  fields.append(s);
}

function removeFileField(el) {
  var fields = $('#attachments_fields');
  var s = $(el).parents('span').first();
  if (fields.children().length > 1) {
    s.remove();
  } else {
    s.children('input.file').val('');
    s.children('input.description').val('');
  }
}

function checkFileSize(el, maxSize, message) {
  var files = el.files;
  if (files) {
    for (var i=0; i<files.length; i++) {
      if (files[i].size > maxSize) {
        alert(message);
        el.value = "";
      }
    }
  }
}

