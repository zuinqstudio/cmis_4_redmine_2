jQuery(function(){
	$.ajax({
	    url: "/projects/" + project_id + "/" + document_id + "/cmis/check_attachments_sync",
	    type: 'get',
	    success: function(data){
	      $('#attachments').html(data);
	    }
	  });
	
	$.ajax({
	    url: "/projects/" + project_id + "/" + document_id + "/cmis/check_new_attachments",
	    type: 'get',
	    success: function(data){
	      $('#attachments').html(data);
	    }
	  });
});

function synchronize_attachment(project_id, attachment_id) {
	$.ajax({
	    url: "/projects/" + project_id + "/" + attachment_id + "/cmis/synchronize_attachment",
	    type: 'get',
	    success: function(data){
	      $('#attachment_' + attachment_id).html(data);
	    }
	  });
}