Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1928C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 08:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8PC0aQXakm1VoWPKkuiC1eNwPBVsui/sny3IRBTwGQ0=; b=lptCYm871WZVou5RPplhRMZZPG
	DpXC3A+RETmopAplrQvHdJwb+ZeK/G2PXGoKoNyGhNn4xILXTc20hkncn4GkIMgJ8blP7nVbBUMY3
	JBvhGn1XzJLxo4RYLGfvJ1sCPcxw58NeU2qxI9EEl1p+JwdQq7tcKnOseJf10VaST6PDVaJwi3X+c
	92ZqGxVSuiku7L+Rzap5RY5bcKClwVRX8vxRQNQib4GH3HmW4xgKaVTAmRd2LfF6WpxbJY5RBVh7S
	rRmgab7E4X6hPpER10rNkcY9Ir7q6z9xNH/3Qeh6atgDLrZYgXPXBNYHFiYHIRomDDYZYvW6asWNq
	OBpTgiEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAnhO-009Tyi-14;
	Wed, 06 Dec 2023 08:56:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAnhK-009Txc-2r
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 08:56:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 21683CE109B;
	Wed,  6 Dec 2023 08:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099CBC433C7;
	Wed,  6 Dec 2023 08:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701852959;
	bh=uqJ2ogRI4+ju5OsB6hLf+EL9NrtDGWD6YncJoNoFRNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uCSwwhTO/Bb/bXAOmJzeO7ZciWS+KvoUrsOoVSKe6uHyCD9pDRlFxKazoBy7DQ8If
	 uBQMGLf3jZSnpm0G3yc97m1ZCG7Yqu/eHgblLeWeMLQ+th5ByxzrLf+ouya+9XPdIC
	 zqPRpSvWtZX+5NSSUzFtxGhCdEinxHetFvOe+nS2ptzEClNbFHbj/zSro+xapgGm/U
	 mGH5pq6+86NIatAsGsl4rkZQtv+Hrs+Bdlq37AX7w5Tj+Xf/g2idlhXIPVweKUfC2e
	 6TgEcOErUM3AZiLkkrxH8nMlpPu8X+/N43Exsw4Bn3Va6YN1NUsfCt3R8E3i0UlYx0
	 /74Z/w0fi6XUg==
Date: Wed, 6 Dec 2023 09:55:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, tzimmermann@suse.de, 
	airlied@gmail.com, krzysztof.kozlowski+dt@linaro.org, william.qiu@starfivetech.com, 
	xingyu.wu@starfivetech.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	palmer@dabbelt.com, p.zabel@pengutronix.de, shengyang.chen@starfivetech.com, 
	jack.zhu@starfivetech.com, changhuang.liang@starfivetech.com, 
	maarten.lankhorst@linux.intel.com, suijingfeng@loongson.cn
Subject: Re: [v3 4/6] drm/vs: Add KMS crtc&plane
Message-ID: <o4ica2jg2rqfx6znir6j7mkoojoqzejjuqvlwcnehanw5mvop6@a3t6vi7c55tz>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-5-keith.zhao@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231204123315.28456-5-keith.zhao@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_005603_393757_D73D9532 
X-CRM114-Status: GOOD (  11.56  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2998461079911625885=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2998461079911625885==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dtxa2tapzrbxyrb6"
Content-Disposition: inline


--dtxa2tapzrbxyrb6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 04, 2023 at 08:33:13PM +0800, Keith Zhao wrote:
> +static const struct vs_plane_info dc_hw_planes_rev0[PLANE_NUM] = {
> +	{
> +		.name			= "Primary",
> +		.id			= PRIMARY_PLANE_0,
> +		.type			= DRM_PLANE_TYPE_PRIMARY,
> +		.num_formats		= ARRAY_SIZE(primary_overlay_format0),
> +		.formats		= primary_overlay_format0,
> +		.num_modifiers		= ARRAY_SIZE(format_modifier0),
> +		.modifiers		= format_modifier0,
> +		.min_width		= 0,
> +		.min_height		= 0,
> +		.max_width		= 4096,
> +		.max_height		= 4096,
> +		.rotation		= DRM_MODE_ROTATE_0 |
> +					  DRM_MODE_ROTATE_90 |
> +					  DRM_MODE_ROTATE_180 |
> +					  DRM_MODE_ROTATE_270 |
> +					  DRM_MODE_REFLECT_X |
> +					  DRM_MODE_REFLECT_Y,
> +		.blend_mode		= BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +					  BIT(DRM_MODE_BLEND_PREMULTI) |
> +					  BIT(DRM_MODE_BLEND_COVERAGE),
> +		.color_encoding		= BIT(DRM_COLOR_YCBCR_BT709) |
> +					  BIT(DRM_COLOR_YCBCR_BT2020),
> +		.degamma_size		= DEGAMMA_SIZE,
> +		.min_scale		= FRAC_16_16(1, 3),
> +		.max_scale		= FRAC_16_16(10, 1),
> +		.zpos			= 0,
> +		.watermark		= true,
> +		.color_mgmt		= true,
> +		.roi			= true,
> +	},
> +	{
> +		.name			= "Overlay",
> +		.id			= OVERLAY_PLANE_0,
> +		.type			= DRM_PLANE_TYPE_OVERLAY,
> +		.num_formats		= ARRAY_SIZE(primary_overlay_format0),
> +		.formats		= primary_overlay_format0,
> +		.num_modifiers		= ARRAY_SIZE(format_modifier0),
> +		.modifiers		= format_modifier0,
> +		.min_width		= 0,
> +		.min_height		= 0,
> +		.max_width		= 4096,
> +		.max_height		= 4096,
> +		.rotation		= DRM_MODE_ROTATE_0 |
> +					  DRM_MODE_ROTATE_90 |
> +					  DRM_MODE_ROTATE_180 |
> +					  DRM_MODE_ROTATE_270 |
> +					  DRM_MODE_REFLECT_X |
> +					  DRM_MODE_REFLECT_Y,
> +		.blend_mode		= BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +					  BIT(DRM_MODE_BLEND_PREMULTI) |
> +					  BIT(DRM_MODE_BLEND_COVERAGE),
> +		.color_encoding		= BIT(DRM_COLOR_YCBCR_BT709) |
> +					  BIT(DRM_COLOR_YCBCR_BT2020),
> +		.degamma_size		= DEGAMMA_SIZE,
> +		.min_scale		= FRAC_16_16(1, 3),
> +		.max_scale		= FRAC_16_16(10, 1),
> +		.zpos			= 1,
> +		.watermark		= true,
> +		.color_mgmt		= true,
> +		.roi			= true,
> +	},
> +	{
> +		.name			= "Overlay_1",
> +		.id			= OVERLAY_PLANE_1,
> +		.type			= DRM_PLANE_TYPE_OVERLAY,
> +		.num_formats		= ARRAY_SIZE(primary_overlay_format0),
> +		.formats		= primary_overlay_format0,
> +		.num_modifiers		= ARRAY_SIZE(secondary_format_modifiers),
> +		.modifiers		= secondary_format_modifiers,
> +		.min_width		= 0,
> +		.min_height		= 0,
> +		.max_width		= 4096,
> +		.max_height		= 4096,
> +		.rotation		= 0,
> +		.blend_mode		= BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +					  BIT(DRM_MODE_BLEND_PREMULTI) |
> +					  BIT(DRM_MODE_BLEND_COVERAGE),
> +		.color_encoding		= BIT(DRM_COLOR_YCBCR_BT709) |
> +					  BIT(DRM_COLOR_YCBCR_BT2020),
> +		.degamma_size		= DEGAMMA_SIZE,
> +		.min_scale		= DRM_PLANE_NO_SCALING,
> +		.max_scale		= DRM_PLANE_NO_SCALING,
> +		.zpos			= 2,
> +		.watermark		= true,
> +		.color_mgmt		= true,
> +		.roi			= true,
> +	},
> +	{
> +		.name			= "Primary_1",
> +		.id			= PRIMARY_PLANE_1,
> +		.type			= DRM_PLANE_TYPE_PRIMARY,
> +		.num_formats		= ARRAY_SIZE(primary_overlay_format0),
> +		.formats		= primary_overlay_format0,
> +		.num_modifiers		= ARRAY_SIZE(format_modifier0),
> +		.modifiers		= format_modifier0,
> +		.min_width		= 0,
> +		.min_height		= 0,
> +		.max_width		= 4096,
> +		.max_height		= 4096,
> +		.rotation		= DRM_MODE_ROTATE_0 |
> +					  DRM_MODE_ROTATE_90 |
> +					  DRM_MODE_ROTATE_180 |
> +					  DRM_MODE_ROTATE_270 |
> +					  DRM_MODE_REFLECT_X |
> +					  DRM_MODE_REFLECT_Y,
> +		.blend_mode		= BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +					  BIT(DRM_MODE_BLEND_PREMULTI) |
> +					  BIT(DRM_MODE_BLEND_COVERAGE),
> +		.color_encoding		= BIT(DRM_COLOR_YCBCR_BT709) |
> +					  BIT(DRM_COLOR_YCBCR_BT2020),
> +		.degamma_size		= DEGAMMA_SIZE,
> +		.min_scale		= FRAC_16_16(1, 3),
> +		.max_scale		= FRAC_16_16(10, 1),
> +		.zpos			= 3,
> +		.watermark		= true,
> +		.color_mgmt		= true,
> +		.roi			= true,
> +	},
> +	{
> +		.name			= "Overlay_2",
> +		.id			= OVERLAY_PLANE_2,
> +		.type			= DRM_PLANE_TYPE_OVERLAY,
> +		.num_formats		= ARRAY_SIZE(primary_overlay_format0),
> +		.formats		= primary_overlay_format0,
> +		.num_modifiers		= ARRAY_SIZE(format_modifier0),
> +		.modifiers		= format_modifier0,
> +		.min_width		= 0,
> +		.min_height		= 0,
> +		.max_width		= 4096,
> +		.max_height		= 4096,
> +		.rotation		= DRM_MODE_ROTATE_0 |
> +					  DRM_MODE_ROTATE_90 |
> +					  DRM_MODE_ROTATE_180 |
> +					  DRM_MODE_ROTATE_270 |
> +					  DRM_MODE_REFLECT_X |
> +					  DRM_MODE_REFLECT_Y,
> +		.blend_mode		= BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +					  BIT(DRM_MODE_BLEND_PREMULTI) |
> +					  BIT(DRM_MODE_BLEND_COVERAGE),
> +		.color_encoding		= BIT(DRM_COLOR_YCBCR_BT709) |
> +					  BIT(DRM_COLOR_YCBCR_BT2020),
> +		.degamma_size		= DEGAMMA_SIZE,
> +		.min_scale		= FRAC_16_16(1, 3),
> +		.max_scale		= FRAC_16_16(10, 1),
> +		.zpos			= 4,
> +		.watermark		= true,
> +		.color_mgmt		= true,
> +		.roi			= true,
> +	},
> +	{
> +		.name			= "Overlay_3",
> +		.id			= OVERLAY_PLANE_3,
> +		.type			= DRM_PLANE_TYPE_OVERLAY,
> +		.num_formats		= ARRAY_SIZE(primary_overlay_format0),
> +		.formats		= primary_overlay_format0,
> +		.num_modifiers		= ARRAY_SIZE(secondary_format_modifiers),
> +		.modifiers		= secondary_format_modifiers,
> +		.min_width		= 0,
> +		.min_height		= 0,
> +		.max_width		= 4096,
> +		.max_height		= 4096,
> +		.rotation		= 0,
> +		.blend_mode		= BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +					  BIT(DRM_MODE_BLEND_PREMULTI) |
> +					  BIT(DRM_MODE_BLEND_COVERAGE),
> +		.color_encoding		= BIT(DRM_COLOR_YCBCR_BT709) |
> +					  BIT(DRM_COLOR_YCBCR_BT2020),
> +		.degamma_size		= DEGAMMA_SIZE,
> +		.min_scale		= DRM_PLANE_NO_SCALING,
> +		.max_scale		= DRM_PLANE_NO_SCALING,
> +		.zpos			= 5,
> +		.watermark		= true,
> +		.color_mgmt		= true,
> +		.roi			= true,
> +	},
> +	{
> +		.name			= "Cursor",
> +		.id			= CURSOR_PLANE_0,
> +		.type			= DRM_PLANE_TYPE_CURSOR,
> +		.num_formats		= ARRAY_SIZE(cursor_formats),
> +		.formats		= cursor_formats,
> +		.num_modifiers		= 0,
> +		.modifiers		= NULL,
> +		.min_width		= 32,
> +		.min_height		= 32,
> +		.max_width		= 64,
> +		.max_height		= 64,
> +		.rotation		= 0,
> +		.degamma_size		= 0,
> +		.min_scale		= DRM_PLANE_NO_SCALING,
> +		.max_scale		= DRM_PLANE_NO_SCALING,
> +		.zpos			= 255,
> +		.watermark		= false,
> +		.color_mgmt		= false,
> +		.roi			= false,
> +	},
> +	{
> +		.name			= "Cursor_1",
> +		.id			= CURSOR_PLANE_1,
> +		.type			= DRM_PLANE_TYPE_CURSOR,
> +		.num_formats		= ARRAY_SIZE(cursor_formats),
> +		.formats		= cursor_formats,
> +		.num_modifiers		= 0,
> +		.modifiers		= NULL,
> +		.min_width		= 32,
> +		.min_height		= 32,
> +		.max_width		= 64,
> +		.max_height		= 64,
> +		.rotation		= 0,
> +		.degamma_size		= 0,
> +		.min_scale		= DRM_PLANE_NO_SCALING,
> +		.max_scale		= DRM_PLANE_NO_SCALING,
> +		.zpos			= 255,
> +		.watermark		= false,
> +		.color_mgmt		= false,
> +		.roi			= false,
> +	},
> +};
> +
> +static const struct vs_dc_info dc8200_info = {
> +	.name			= "DC8200",
> +	.panel_num		= 2,
> +	.plane_num		= 8,
> +	.planes			= dc_hw_planes_rev0,
> +	.layer_num		= 6,
> +	.max_bpc		= 10,
> +	.color_formats		= DRM_COLOR_FORMAT_RGB444 |
> +				  DRM_COLOR_FORMAT_YCBCR444 |
> +				  DRM_COLOR_FORMAT_YCBCR422 |
> +				  DRM_COLOR_FORMAT_YCBCR420,
> +	.gamma_size		= GAMMA_EX_SIZE,
> +	.gamma_bits		= 12,
> +	.pitch_alignment	= 128,
> +	.pipe_sync		= false,
> +	.background		= true,
> +	.panel_sync		= true,
> +	.cap_dec		= true,
> +};

I really think that entire thing is to workaround a suboptimal device
tree binding. You should have two CRTCs in the device tree, you'll probe
twice, and you won't get to do that whole dance.


> +struct dc_hw_plane_reg {
> +	u32 y_address;
> +	u32 u_address;
> +	u32 v_address;
> +	u32 y_stride;
> +	u32 u_stride;
> +	u32 v_stride;
> +	u32 size;
> +	u32 top_left;
> +	u32 bottom_right;
> +	u32 scale_factor_x;
> +	u32 scale_factor_y;
> +	u32 h_filter_coef_index;
> +	u32 h_filter_coef_data;
> +	u32 v_filter_coef_index;
> +	u32 v_filter_coef_data;
> +	u32 init_offset;
> +	u32 color_key;
> +	u32 color_key_high;
> +	u32 clear_value;
> +	u32 color_table_index;
> +	u32 color_table_data;
> +	u32 scale_config;
> +	u32 water_mark;
> +	u32 degamma_index;
> +	u32 degamma_data;
> +	u32 degamma_ex_data;
> +	u32 src_global_color;
> +	u32 dst_global_color;
> +	u32 blend_config;
> +	u32 roi_origin;
> +	u32 roi_size;
> +	u32 yuv_to_rgb_coef0;
> +	u32 yuv_to_rgb_coef1;
> +	u32 yuv_to_rgb_coef2;
> +	u32 yuv_to_rgb_coef3;
> +	u32 yuv_to_rgb_coef4;
> +	u32 yuv_to_rgb_coefd0;
> +	u32 yuv_to_rgb_coefd1;
> +	u32 yuv_to_rgb_coefd2;
> +	u32 y_clamp_bound;
> +	u32 uv_clamp_bound;
> +	u32 rgb_to_rgb_coef0;
> +	u32 rgb_to_rgb_coef1;
> +	u32 rgb_to_rgb_coef2;
> +	u32 rgb_to_rgb_coef3;
> +	u32 rgb_to_rgb_coef4;
> +};

That's your plane state.

> +struct dc_hw_fb {
> +	u32 y_address;
> +	u32 u_address;
> +	u32 v_address;
> +	u32 clear_value;
> +	u32 water_mark;
> +	u16 y_stride;
> +	u16 u_stride;
> +	u16 v_stride;
> +	u16 width;
> +	u16 height;
> +	u8	format;
> +	u8	tile_mode;
> +	u8	rotation;
> +	u8	yuv_color_space;
> +	u8	swizzle;
> +	u8	uv_swizzle;
> +	u8	zpos;
> +	u8	display_id;
> +	bool	clear_enable;
> +	bool	dec_enable;
> +	bool	enable;
> +	bool	dirty;
> +};

Your framebuffer

> +struct dc_hw_scale {
> +	u32 scale_factor_x;
> +	u32 scale_factor_y;
> +	bool	enable;
> +	bool	dirty;
> +};
> +
> +struct dc_hw_position {
> +	u16 start_x;
> +	u16 start_y;
> +	u16 end_x;
> +	u16 end_y;
> +	bool	dirty;
> +};
> +
> +struct dc_hw_blend {
> +	u8	alpha;
> +	u8	blend_mode;
> +	bool	dirty;
> +};
> +
> +struct dc_hw_colorkey {
> +	u32 colorkey;
> +	u32 colorkey_high;
> +	u8	transparency;
> +	bool dirty;
> +};

Your CRTC state.

> +struct dc_hw_roi {
> +	u16 x;
> +	u16 y;
> +	u16 width;
> +	u16 height;
> +	bool enable;
> +	bool dirty;
> +};
> +
> +struct dc_hw_cursor {
> +	u32 address;
> +	u16 x;
> +	u16 y;
> +	u16 hot_x;
> +	u16 hot_y;
> +	u8	size;
> +	u8	display_id;
> +	bool	enable;
> +	bool	dirty;
> +};
> +
> +struct dc_hw_display {
> +	u32 bus_format;
> +	u16 h_active;
> +	u16 h_total;
> +	u16 h_sync_start;
> +	u16 h_sync_end;
> +	u16 v_active;
> +	u16 v_total;
> +	u16 v_sync_start;
> +	u16 v_sync_end;
> +	u8	id;
> +	bool	h_sync_polarity;
> +	bool	v_sync_polarity;
> +	bool	enable;
> +};

Your display mode.

Really, you have the huge majority of those informations already
available, there's no need to duplicate it. And chances are you'll
create bugs in the process.
Maxime

--dtxa2tapzrbxyrb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXA3HAAKCRDj7w1vZxhR
xZezAP0UJLYoF63qozP9Ic7D0t86zUYiWskfVpc1HI4HmdOblwD+Lk+XuNL28bo+
9o/v+zD7uwcCLnQAPMpTa+SpW0YGKAY=
=AhPP
-----END PGP SIGNATURE-----

--dtxa2tapzrbxyrb6--


--===============2998461079911625885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2998461079911625885==--

