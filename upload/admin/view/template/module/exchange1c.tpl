<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
	
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-1c" data-toggle="tooltip" title="<?php echo $lang['button_save']; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $lang['button_cancel']; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			</div>
			<h1><?php echo $lang['heading_title']; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
  
	<div class="container-fluid">
	<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
	<?php } ?>
	<div class="panel panel-default">
		<div class="panel-heading"><h3 class="panel-title"><i class="fa fa-pencil"></i><?php echo $lang['heading_title']; ?></h3></div>
		<div class="panel-body">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $lang['text_tab_general']; ?></a></li>
				<li><a href="#tab-product" data-toggle="tab"><?php echo $lang['text_tab_product']; ?></a></li>
				<li><a href="#tab-order" data-toggle="tab"><?php echo $lang['text_tab_order']; ?></a></li>
				<li><a href="#tab-manual" data-toggle="tab"><?php echo $lang['text_tab_manual']; ?></a></li>
			</ul>
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-1c" class="form-horizontal">
		
		<div class="tab-content">
			<div  class="tab-pane active" id="tab-general">
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="exchange1c_username"><?php echo $lang['entry_username']; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="exchange1c_username" value="<?php echo $exchange1c_username; ?>" placeholder="<?php echo $exchange1c_username; ?>" id="exchange1c_username" class="form-control" />
				  <?php if ($error_exchange1c_username) { ?>
				  <div class="text-danger"><?php echo $error_exchange1c_username; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="exchange1c_password"><?php echo $lang['entry_password']; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="exchange1c_password" value="<?php echo $exchange1c_password; ?>" placeholder="<?php echo $exchange1c_password; ?>" id="exchange1c_password" class="form-control" />
				  <?php if ($error_exchange1c_password) { ?>
				  <div class="text-danger"><?php echo $error_exchange1c_password; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="exchange1c_status"><?php echo $lang['entry_status']; ?></label>
				<div class="col-sm-10">
				  <select name="exchange1c_status" id="exchange1c_status" class="form-control">
					<?php if ($exchange1c_status) { ?>
					<option value="1" selected="selected"><?php echo $lang['text_enabled']; ?></option>
					<option value="0"><?php echo $lang['text_disabled']; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $lang['text_enabled']; ?></option>
					<option value="0" selected="selected"><?php echo $lang['text_disabled']; ?></option>
					<?php } ?>
				  </select>
				</div>
			  </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="exchange1c_allow_ip"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $lang['help_allow_ip']; ?>"><?php echo $lang['entry_allow_ip']; ?></span></label>
                <div class="col-sm-10">
                  <textarea name="exchange1c_allow_ip" rows="5" placeholder="<?php echo $exchange1c_allow_ip; ?>" id="exchange1c_allow_ip" class="form-control"><?php echo $exchange1c_allow_ip; ?></textarea>
                </div>
              </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $lang['entry_full_log']; ?></label>
				<div class="col-sm-10">
				  <label class="radio-inline">
					<?php if ($exchange1c_full_log) { ?>
					<input type="radio" name="exchange1c_full_log" value="1" checked="checked" />
					<?php echo $lang['text_yes']; ?>
					<?php } else { ?>
					<input type="radio" name="exchange1c_full_log" value="1" />
					<?php echo $lang['text_yes']; ?>
					<?php } ?>
				  </label>
				  <label class="radio-inline">
					<?php if (!$exchange1c_full_log) { ?>
					<input type="radio" name="exchange1c_full_log" value="0" checked="checked" />
					<?php echo $lang['text_no']; ?>
					<?php } else { ?>
					<input type="radio" name="exchange1c_full_log" value="0" />
					<?php echo $lang['text_no']; ?>
					<?php } ?>
				  </label>
				</div>
			  </div>

			</div>

			<div class="tab-pane" id="tab-product">
			<div class="table-responsive">
			<table id="exchange1c_price_type_id" class="table table-bordered table-hover">
				<thead>
				  <tr>
					<td class="text-left"><?php echo $lang['entry_config_price_type']; ?></td>
					<td class="text-left"><?php echo $lang['entry_customer_group']; ?></td>
					<td class="text-right"><?php echo $lang['entry_quantity']; ?></td>
					<td class="text-right"><?php echo $lang['entry_priority']; ?></td>
					<td class="text-right"><?php echo $lang['entry_action']; ?></td>
				  </tr>
				</thead>
				<tbody>
				  <?php $price_row = 0; ?>
				  <?php foreach ($exchange1c_price_type as $obj) { ?>
					<?php if ($price_row == 0) {?>
					  <tr id="exchange1c_price_type_row<?php echo $price_row; ?>">
						<td class="left"><input type="text" name="exchange1c_price_type[<?php echo $price_row; ?>][keyword]" value="<?php echo $obj['keyword']; ?>" class="form-control"/></td>
						<td class="left"><?php  echo $lang['text_price_default']; ?><input type="hidden" name="exchange1c_price_type[<?php echo $price_row; ?>][customer_group_id]" value="0" /></td>
						<td class="center">-<input type="hidden" name="exchange1c_price_type[<?php echo $price_row; ?>][quantity]" value="0" /></td>
						<td class="center">-<input type="hidden" name="exchange1c_price_type[<?php echo $price_row; ?>][priority]" value="0" /></td>
						<td class="left">&nbsp;</td>
					  </tr>
					<?php } else { ?>
					  <tr id="exchange1c_price_type_row<?php echo $price_row; ?>">
						<td class="left"><input type="text" name="exchange1c_price_type[<?php echo $price_row; ?>][keyword]" value="<?php echo $obj['keyword']; ?>" /></td>
						<td class="left"><select name="exchange1c_price_type[<?php echo $price_row; ?>][customer_group_id]">
						  <?php foreach ($customer_groups as $customer_group) { ?>
							<?php if ($customer_group['customer_group_id'] == $obj['customer_group_id']) { ?>
							  <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
							<?php } else { ?>
							  <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
							<?php } ?>
						  <?php } ?>
						  </select></td>
						<td class="center"><input type="text" name="exchange1c_price_type[<?php echo $price_row; ?>][quantity]" value="<?php echo $obj['quantity']; ?>" size="2" /></td>
						<td class="center"><input type="text" name="exchange1c_price_type[<?php echo $price_row; ?>][priority]" value="<?php echo $obj['priority']; ?>" size="2" /></td>
						<td class="center">
						<button type="button" data-toggle="tooltip" title="<?php echo $lang['button_remove']; ?>" class="btn btn-danger" onclick="confirm('<?php echo $lang['text_confirm']; ?>') ? $('#exchange1c_price_type_row<?php echo $price_row; ?>').remove() : false;"><i class="fa fa-trash-o"></i></button>
						</td>
					  </tr>
					<?php } ?>
					<?php $price_row++; ?>
				  <?php } ?>
				</tbody>
				<tfoot>
				  <tr>
					<td colspan="4"></td>
					
					<td class="left">
					<a onclick="addConfigPriceType();" data-toggle="tooltip" title="<?php echo $lang['button_add']; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></a>
					</td>
				  </tr>
				</tfoot>
			  </table>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $lang['entry_flush_product']; ?></label>
				<div class="col-sm-10">
				  <label class="radio-inline">
					<?php if ($exchange1c_flush_product) { ?>
					<input type="radio" name="exchange1c_flush_product" value="1" checked="checked" />
					<?php echo $lang['text_yes']; ?>
					<?php } else { ?>
					<input type="radio" name="exchange1c_flush_product" value="1" />
					<?php echo $lang['text_yes']; ?>
					<?php } ?>
				  </label>
				  <label class="radio-inline">
					<?php if (!$exchange1c_flush_product) { ?>
					<input type="radio" name="exchange1c_flush_product" value="0" checked="checked" />
					<?php echo $lang['text_no']; ?>
					<?php } else { ?>
					<input type="radio" name="exchange1c_flush_product" value="0" />
					<?php echo $lang['text_no']; ?>
					<?php } ?>
				  </label>
				</div>
			  </div>
			  
			  <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $lang['entry_flush_category']; ?></label>
				<div class="col-sm-10">
				  <label class="radio-inline">
					<?php if ($exchange1c_flush_category) { ?>
					<input type="radio" name="exchange1c_flush_category" value="1" checked="checked" />
					<?php echo $lang['text_yes']; ?>
					<?php } else { ?>
					<input type="radio" name="exchange1c_flush_category" value="1" />
					<?php echo $lang['text_yes']; ?>
					<?php } ?>
				  </label>
				  <label class="radio-inline">
					<?php if (!$exchange1c_flush_category) { ?>
					<input type="radio" name="exchange1c_flush_category" value="0" checked="checked" />
					<?php echo $lang['text_no']; ?>
					<?php } else { ?>
					<input type="radio" name="exchange1c_flush_category" value="0" />
					<?php echo $lang['text_no']; ?>
					<?php } ?>
				  </label>
				</div>
			  </div>
			  
			  <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $lang['entry_flush_manufacturer']; ?></label>
				<div class="col-sm-10">
				  <label class="radio-inline">
					<?php if ($exchange1c_flush_manufacturer) { ?>
					<input type="radio" name="exchange1c_flush_manufacturer" value="1" checked="checked" />
					<?php echo $lang['text_yes']; ?>
					<?php } else { ?>
					<input type="radio" name="exchange1c_flush_manufacturer" value="1" />
					<?php echo $lang['text_yes']; ?>
					<?php } ?>
				  </label>
				  <label class="radio-inline">
					<?php if (!$exchange1c_flush_manufacturer) { ?>
					<input type="radio" name="exchange1c_flush_manufacturer" value="0" checked="checked" />
					<?php echo $lang['text_no']; ?>
					<?php } else { ?>
					<input type="radio" name="exchange1c_flush_manufacturer" value="0" />
					<?php echo $lang['text_no']; ?>
					<?php } ?>
				  </label>
				</div>
			  </div>
			  
			  <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $lang['entry_flush_attribute']; ?></label>
				<div class="col-sm-10">
				  <label class="radio-inline">
					<?php if ($exchange1c_flush_attribute) { ?>
					<input type="radio" name="exchange1c_flush_attribute" value="1" checked="checked" />
					<?php echo $lang['text_yes']; ?>
					<?php } else { ?>
					<input type="radio" name="exchange1c_flush_attribute" value="1" />
					<?php echo $lang['text_yes']; ?>
					<?php } ?>
				  </label>
				  <label class="radio-inline">
					<?php if (!$exchange1c_flush_attribute) { ?>
					<input type="radio" name="exchange1c_flush_attribute" value="0" checked="checked" />
					<?php echo $lang['text_no']; ?>
					<?php } else { ?>
					<input type="radio" name="exchange1c_flush_attribute" value="0" />
					<?php echo $lang['text_no']; ?>
					<?php } ?>
				  </label>
				</div>
			  </div>
			  
			  <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $lang['entry_flush_quantity']; ?></label>
				<div class="col-sm-10">
				  <label class="radio-inline">
					<?php if ($exchange1c_flush_quantity) { ?>
					<input type="radio" name="exchange1c_flush_quantity" value="1" checked="checked" />
					<?php echo $lang['text_yes']; ?>
					<?php } else { ?>
					<input type="radio" name="exchange1c_flush_quantity" value="1" />
					<?php echo $lang['text_yes']; ?>
					<?php } ?>
				  </label>
				  <label class="radio-inline">
					<?php if (!$exchange1c_flush_quantity) { ?>
					<input type="radio" name="exchange1c_flush_quantity" value="0" checked="checked" />
					<?php echo $lang['text_no']; ?>
					<?php } else { ?>
					<input type="radio" name="exchange1c_flush_quantity" value="0" />
					<?php echo $lang['text_no']; ?>
					<?php } ?>
				  </label>
				</div>
			  </div>
			  
			  <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $lang['entry_fill_parent_cats']; ?></label>
				<div class="col-sm-10">
				  <label class="radio-inline">
					<?php if ($exchange1c_fill_parent_cats) { ?>
					<input type="radio" name="exchange1c_fill_parent_cats" value="1" checked="checked" />
					<?php echo $lang['text_yes']; ?>
					<?php } else { ?>
					<input type="radio" name="exchange1c_fill_parent_cats" value="1" />
					<?php echo $lang['text_yes']; ?>
					<?php } ?>
				  </label>
				  <label class="radio-inline">
					<?php if (!$exchange1c_fill_parent_cats) { ?>
					<input type="radio" name="exchange1c_fill_parent_cats" value="0" checked="checked" />
					<?php echo $lang['text_no']; ?>
					<?php } else { ?>
					<input type="radio" name="exchange1c_fill_parent_cats" value="0" />
					<?php echo $lang['text_no']; ?>
					<?php } ?>
				  </label>
				</div>
			  </div>
			  
			  <div class="form-group">
			  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $lang['entry_relatedoptions_help']; ?>"><?php echo $lang['entry_relatedoptions']; ?></span></label>
			  <div class="col-sm-10">
				<label class="radio-inline">
				  <?php if ($exchange1c_relatedoptions) { ?>
				  <input type="radio" name="exchange1c_relatedoptions" value="1" checked="checked" />
				  <?php echo $lang['text_yes']; ?>
				  <?php } else { ?>
				  <input type="radio" name="exchange1c_relatedoptions" value="1" />
				  <?php echo $lang['text_yes']; ?>
				  <?php } ?>
				</label>
				<label class="radio-inline">
				  <?php if (!$exchange1c_relatedoptions) { ?>
				  <input type="radio" name="exchange1c_relatedoptions" value="0" checked="checked" />
				  <?php echo $lang['text_no']; ?>
				  <?php } else { ?>
				  <input type="radio" name="exchange1c_relatedoptions" value="0" />
				  <?php echo $lang['text_no']; ?>
				  <?php } ?>
				</label>
			  </div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $lang['entry_dont_use_artsync']; ?></label>
				<div class="col-sm-10">
				  <label class="radio-inline">
					<?php if ($exchange1c_dont_use_artsync) { ?>
					<input type="radio" name="exchange1c_dont_use_artsync" value="1" checked="checked" />
					<?php echo $lang['text_yes']; ?>
					<?php } else { ?>
					<input type="radio" name="exchange1c_dont_use_artsync" value="1" />
					<?php echo $lang['text_yes']; ?>
					<?php } ?>
				  </label>
				  <label class="radio-inline">
					<?php if (!$exchange1c_dont_use_artsync) { ?>
					<input type="radio" name="exchange1c_dont_use_artsync" value="0" checked="checked" />
					<?php echo $lang['text_no']; ?>
					<?php } else { ?>
					<input type="radio" name="exchange1c_dont_use_artsync" value="0" />
					<?php echo $lang['text_no']; ?>
					<?php } ?>
				  </label>
				</div>
			  </div>
			  
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="exchange1c_seo_url"><?php echo $lang['entry_seo_url']; ?></label>
                <div class="col-sm-10">
                  <select name="exchange1c_seo_url" id="exchange1c_seo_url" class="form-control">
                    
					<?php if ($exchange1c_seo_url == 0) { ?>
                    <option value="0" selected="selected"><?php echo $lang['text_disabled']; ?></option>
                    <?php } else { ?>
                    <option value="0"><?php echo $lang['text_disabled']; ?></option>
                    <?php } ?>
					
					<?php if ($exchange1c_seo_url == 1) { ?>
                    <option value="1" selected="selected"><?php echo $lang['entry_seo_url_deadcow']; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $lang['entry_seo_url_deadcow']; ?></option>
                    <?php } ?>
					
					<?php if ($exchange1c_seo_url == 2) { ?>
                    <option value="2" selected="selected"><?php echo $lang['entry_seo_url_translit']; ?></option>
                    <?php } else { ?>
                    <option value="2"><?php echo $lang['entry_seo_url_translit']; ?></option>
                    <?php } ?>
					
                  </select>
                </div>
              </div>
			  

			  <div class="form-group">
                <label class="col-sm-2 control-label" for="exchange1c_apply_watermark"><?php echo $lang['entry_apply_watermark']; ?></label>
                <div class="col-sm-10">
					<a title="" class="img_thumbnail" id="thumb-image0" aria-describedby="popover" href="" data-original-title="" data-toggle="image">
						<img src="<?php echo $thumb; ?>" data-placeholder="<?php echo $placeholder; ?>" alt="" />
						<input name="exchange1c_watermark" id="input_image0" value="<?php echo $exchange1c_watermark; ?>" type="hidden" />
					</a>
                </div>
              </div>

			</div>

			<div class="tab-pane" id="tab-order">
				<div class="form-group">
                <label class="col-sm-2 control-label" for="exchange1c_order_status_to_exchange"><?php echo $lang['entry_order_status_to_exchange']; ?></label>
                <div class="col-sm-10">
                  <select name="exchange1c_order_status_to_exchange" class="form-control">
				  <option value="0" <?php echo ($exchange1c_order_status_to_exchange == 0)? 'selected' : '' ;?>><?php echo $lang['entry_order_status_to_exchange_not']; ?></option>
				  <?php foreach ($order_statuses as $order_status) { ?>
					<?php if ($exchange1c_order_status_to_exchange == $order_status['order_status_id']) { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
				  <?php } ?>
                  </select>
                </div>
              </div>
			  
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="exchange1c_order_status"><?php echo $lang['entry_order_status']; ?></label>
                <div class="col-sm-10">
                  <select name="exchange1c_order_status" id="exchange1c_order_status" class="form-control">
				  <?php foreach ($order_statuses as $order_status) { ?>
					<?php if ($exchange1c_order_status == $order_status['order_status_id']) { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
				  <?php } ?>
                  </select>
                </div>
              </div>
			  
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="exchange1c_order_status_cancel"><?php echo $lang['entry_order_status_cancel']; ?></label>
                <div class="col-sm-10">
                  <select name="exchange1c_order_status_cancel" id="exchange1c_order_status_cancel" class="form-control">
				  <?php foreach ($order_statuses as $order_status) { ?>
					<?php if ($exchange1c_order_status_cancel == $order_status['order_status_id']) { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
				  <?php } ?>
                  </select>
                </div>
              </div>

			  <div class="form-group">
                <label class="col-sm-2 control-label" for="exchange1c_order_status_completed"><?php echo $lang['entry_order_status_completed']; ?></label>
                <div class="col-sm-10">
                  <select name="exchange1c_order_status_completed" id="entry_order_status_completed" class="form-control">
				  <?php foreach ($order_statuses as $order_status) { ?>
					<?php if ($exchange1c_order_status_completed == $order_status['order_status_id']) { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
				  <?php } ?>
                  </select>
                </div>
              </div>

			  <div class="form-group">
                <label class="col-sm-2 control-label" for="exchange1c_order_currency"><?php echo $lang['entry_order_currency']; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="exchange1c_order_currency" value="<?php echo $exchange1c_order_currency; ?>" placeholder="<?php echo $lang['entry_order_currency']; ?>" id="exchange1c_order_currency" class="form-control" />
                  
                </div>
              </div>
			  
			  <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $lang['entry_order_notify']; ?></label>
				<div class="col-sm-10">
				  <label class="radio-inline">
					<?php if ($exchange1c_order_notify) { ?>
					<input type="radio" name="exchange1c_order_notify" value="1" checked="checked" />
					<?php echo $lang['text_yes']; ?>
					<?php } else { ?>
					<input type="radio" name="exchange1c_order_notify" value="1" />
					<?php echo $lang['text_yes']; ?>
					<?php } ?>
				  </label>
				  <label class="radio-inline">
					<?php if (!$exchange1c_order_notify) { ?>
					<input type="radio" name="exchange1c_order_notify" value="0" checked="checked" />
					<?php echo $lang['text_no']; ?>
					<?php } else { ?>
					<input type="radio" name="exchange1c_order_notify" value="0" />
					<?php echo $lang['text_no']; ?>
					<?php } ?>
				  </label>
				</div>
			  </div>
			  
			 
			</div>

			<div class="tab-pane" id="tab-manual">
				<label class="col-sm-2 control-label" for="button-upload">
					<span title="" data-original-title="<?php echo $lang['help_upload']; ?>" data-toggle="tooltip"><?php echo $lang['entry_upload']; ?></span>
				</label>
				<button id="button-upload" class="btn btn-primary" type="button" data-loading-text="<?php echo $lang['button_upload']; ?>">
					<i class="fa fa-upload"></i>
					Загрузить
				</button>
			</div>
		  </form>
		</div>
      </div>
    </div>
	<div style="text-align:center; opacity: .5">
		<p><?php echo $version; ?> | <a href=https://github.com/KirilLoveVE/opencart2-exchange1c><?php echo $lang['text_source_code']; ?></a> | <a href="http://zenwalker.ru/lab/opencart-exchange1c"><?php echo $lang['text_homepage']; ?></a><br />
			<?php echo $lang['text_change']; ?></p>
	</div>
  </div>
</div>

<script type="text/javascript"><!--
$('#button-upload').on('click', function() {
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" value="" /></form>');
	
	$('#form-upload input[name=\'file\']').trigger('click');
	
	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}
		
	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			
			$.ajax({
				url: 'index.php?route=module/exchange1c/manualImport&token=<?php echo $token; ?>',
				type: 'post',		
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,		
				beforeSend: function() {
					$('#button-upload i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
					$('#button-upload').prop('disabled', true);
				},
				complete: function() {
					$('#button-upload i').replaceWith('<i class="fa fa-upload"></i>');
					$('#button-upload').prop('disabled', false);
				},
				success: function(json) {
					if (json['error']) {
						alert(json['error']);
					}
					
					if (json['success']) {
						alert(json['success']);
						
						$('#button-refresh').trigger('click');
					}
				},			
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});	
		}
	}, 500);
});
//--></script>


<script type="text/javascript"><!--
var price_row = <?php echo $price_row; ?>;

function addConfigPriceType() {
    html  = '';
    html += '  <tr id="exchange1c_price_type_row' + price_row + '">'; 
    html += '    <td class="left"><input type="text" name="exchange1c_price_type[' + price_row + '][keyword]" value="" /></td>';
    html += '    <td class="left"><select name="exchange1c_price_type[' + price_row + '][customer_group_id]">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
    <?php } ?>
    html += '    </select></td>';
    html += '    <td class="center"><input type="text" name="exchange1c_price_type[' + price_row + '][quantity]" value="0" size="2" /></td>';
    html += '    <td class="center"><input type="text" name="exchange1c_price_type[' + price_row + '][priority]" value="0" size="2" /></td>';
    html += '    <td class="center"><button type="button" data-toggle="tooltip" title="<?php echo $lang['button_remove']; ?>" class="btn btn-danger" onclick="confirm(\'<?php echo $lang['text_confirm']; ?>\') ? $(\'#exchange1c_price_type_row<?php echo $price_row; ?>\').remove() : false;"><i class="fa fa-minus-circle"></i></button></td>';
    html += '  </tr>';

    $('#exchange1c_price_type_id tbody').append(html);

    $('#config_price_type_row' + price_row + ' .date').datepicker({dateFormat: 'yy-mm-dd'});
    price_row++;
}
//--></script>

<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();

	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');

	$('#dialog').dialog({
		title: '<?php echo $lang['text_image_manager']; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script>

<?php echo $footer; ?>
