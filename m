Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5746C47DDF
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 13:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87Rnaatah6OxU9T6UI75F0Vd9nuJRA/1IxEcFb0ynrs=; b=yK3cw6WSJ0jH+ICHxEPfzIVFDR
	O2kHXUaDk1Qvf7cs/kgNLfkMHF20ZcPgUd/MoW/uW+ogtsMGY96IEx0jJ9bnjMg0DycdzD5eMjJ3/
	CXXA2UlPnFMUaWBSpextOIHV8EKwi0cpb2d8MRXsQDHzzYffwHWr5xhtYxEmzykNbot1pGPotXBG9
	DK+E/onk5NzL1JuD9MR65UW3vtoChIKNIkxc+Po5gwjWgUNCZq6I1TRBXMs3WdKhoUlelHJH4EYIB
	7JWFFinrf+0f8gy4CWecsW5PZs2+rlKkBlAmKbybx9bHxhBCzxEs2+0+eDYF9D9UWfQK64kEMH7pS
	v2dR8M5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAZD-00000003b1u-4Bzm;
	Wed, 31 Jan 2024 13:23:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAZB-00000003b0u-43Kq
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 13:23:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F4B8614C0;
	Wed, 31 Jan 2024 13:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911B4C433C7;
	Wed, 31 Jan 2024 13:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706707428;
	bh=J9hRJqEVyfz6m3bzfd1driAZjOz6J5Kpse04aYCgsWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pCP2EhycfmHkioOPAG2x9UfrGfTpe25lgPmfQu9o2dxEExQYDUQjnqxosSSo8ab4G
	 GwL2pZeVA/EbZDPPe0OiMpxNbuVyC+rBvFHqJF4x3CMyF9FrxqXWWiDU6vQJ7D/js2
	 dm6SXZ/hcB6uOzEaAcDxOXTn1esc/aWsnnPmKr5CXvRdZy2mpverNmuuxXZu/ClK+c
	 4tskyQIrjCWsSEuMBhi1pqSs+qCTjlOTlyyYX8J1gyj+q5f/lIRHzNXq7/MAQ75z/U
	 UmbxuNK5Nui7xwr1mk02XZRGYWPdtKgilhfc7Ma42Yz7kZ8rXp6dZYoy1A+hXsCqBr
	 rMXVjRaqHuCyA==
Date: Wed, 31 Jan 2024 14:23:46 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"airlied@gmail.com" <airlied@gmail.com>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, William Qiu <william.qiu@starfivetech.com>, 
	Xingyu Wu <xingyu.wu@starfivetech.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Shengyang Chen <shengyang.chen@starfivetech.com>, 
	Jack Zhu <jack.zhu@starfivetech.com>, Changhuang Liang <changhuang.liang@starfivetech.com>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [v3 4/6] drm/vs: Add KMS crtc&plane
Message-ID: <rvwcfjon4hjdx4youknherj2rrvvbfrn4bufdqlcd7tn3l5lc2@74rwotxzgyuq>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-5-keith.zhao@starfivetech.com>
 <o4ica2jg2rqfx6znir6j7mkoojoqzejjuqvlwcnehanw5mvop6@a3t6vi7c55tz>
 <NTZPR01MB1050C46113AD71AA5E93C67BEE7CA@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <NTZPR01MB1050C46113AD71AA5E93C67BEE7CA@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_052350_116001_2B1902C9 
X-CRM114-Status: GOOD (  20.78  )
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
Content-Type: multipart/mixed; boundary="===============4118466729244595557=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4118466729244595557==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pxujij5httjhwier"
Content-Disposition: inline


--pxujij5httjhwier
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 09:33:06AM +0000, Keith Zhao wrote:
>=20
>=20
> > -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> > =E5=8F=91=E4=BB=B6=E4=BA=BA: Maxime Ripard <mripard@kernel.org>
> > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2023=E5=B9=B412=E6=9C=886=E6=97=
=A5 16:56
> > =E6=94=B6=E4=BB=B6=E4=BA=BA: Keith Zhao <keith.zhao@starfivetech.com>
> > =E6=8A=84=E9=80=81: devicetree@vger.kernel.org; dri-devel@lists.freedes=
ktop.org;
> > linux-kernel@vger.kernel.org; linux-riscv@lists.infradead.org;
> > tzimmermann@suse.de; airlied@gmail.com; krzysztof.kozlowski+dt@linaro.o=
rg;
> > William Qiu <william.qiu@starfivetech.com>; Xingyu Wu
> > <xingyu.wu@starfivetech.com>; paul.walmsley@sifive.com;
> > aou@eecs.berkeley.edu; palmer@dabbelt.com; p.zabel@pengutronix.de;
> > Shengyang Chen <shengyang.chen@starfivetech.com>; Jack Zhu
> > <jack.zhu@starfivetech.com>; Changhuang Liang
> > <changhuang.liang@starfivetech.com>; maarten.lankhorst@linux.intel.com;
> > suijingfeng@loongson.cn
> > =E4=B8=BB=E9=A2=98: Re: [v3 4/6] drm/vs: Add KMS crtc&plane
> >=20
> > On Mon, Dec 04, 2023 at 08:33:13PM +0800, Keith Zhao wrote:
> > > +static const struct vs_plane_info dc_hw_planes_rev0[PLANE_NUM] =3D {
> > > +	{
> > > +		.name			=3D "Primary",
> > > +		.id			=3D PRIMARY_PLANE_0,
> > > +		.type			=3D DRM_PLANE_TYPE_PRIMARY,
> > > +		.num_formats		=3D ARRAY_SIZE(primary_overlay_format0),
> > > +		.formats		=3D primary_overlay_format0,
> > > +		.num_modifiers		=3D ARRAY_SIZE(format_modifier0),
> > > +		.modifiers		=3D format_modifier0,
> > > +		.min_width		=3D 0,
> > > +		.min_height		=3D 0,
> > > +		.max_width		=3D 4096,
> > > +		.max_height		=3D 4096,
> > > +		.rotation		=3D DRM_MODE_ROTATE_0 |
> > > +					  DRM_MODE_ROTATE_90 |
> > > +					  DRM_MODE_ROTATE_180 |
> > > +					  DRM_MODE_ROTATE_270 |
> > > +					  DRM_MODE_REFLECT_X |
> > > +					  DRM_MODE_REFLECT_Y,
> > > +		.blend_mode		=3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> > > +					  BIT(DRM_MODE_BLEND_PREMULTI) |
> > > +					  BIT(DRM_MODE_BLEND_COVERAGE),
> > > +		.color_encoding		=3D BIT(DRM_COLOR_YCBCR_BT709) |
> > > +					  BIT(DRM_COLOR_YCBCR_BT2020),
> > > +		.degamma_size		=3D DEGAMMA_SIZE,
> > > +		.min_scale		=3D FRAC_16_16(1, 3),
> > > +		.max_scale		=3D FRAC_16_16(10, 1),
> > > +		.zpos			=3D 0,
> > > +		.watermark		=3D true,
> > > +		.color_mgmt		=3D true,
> > > +		.roi			=3D true,
> > > +	},
> > > +	{
> > > +		.name			=3D "Overlay",
> > > +		.id			=3D OVERLAY_PLANE_0,
> > > +		.type			=3D DRM_PLANE_TYPE_OVERLAY,
> > > +		.num_formats		=3D ARRAY_SIZE(primary_overlay_format0),
> > > +		.formats		=3D primary_overlay_format0,
> > > +		.num_modifiers		=3D ARRAY_SIZE(format_modifier0),
> > > +		.modifiers		=3D format_modifier0,
> > > +		.min_width		=3D 0,
> > > +		.min_height		=3D 0,
> > > +		.max_width		=3D 4096,
> > > +		.max_height		=3D 4096,
> > > +		.rotation		=3D DRM_MODE_ROTATE_0 |
> > > +					  DRM_MODE_ROTATE_90 |
> > > +					  DRM_MODE_ROTATE_180 |
> > > +					  DRM_MODE_ROTATE_270 |
> > > +					  DRM_MODE_REFLECT_X |
> > > +					  DRM_MODE_REFLECT_Y,
> > > +		.blend_mode		=3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> > > +					  BIT(DRM_MODE_BLEND_PREMULTI) |
> > > +					  BIT(DRM_MODE_BLEND_COVERAGE),
> > > +		.color_encoding		=3D BIT(DRM_COLOR_YCBCR_BT709) |
> > > +					  BIT(DRM_COLOR_YCBCR_BT2020),
> > > +		.degamma_size		=3D DEGAMMA_SIZE,
> > > +		.min_scale		=3D FRAC_16_16(1, 3),
> > > +		.max_scale		=3D FRAC_16_16(10, 1),
> > > +		.zpos			=3D 1,
> > > +		.watermark		=3D true,
> > > +		.color_mgmt		=3D true,
> > > +		.roi			=3D true,
> > > +	},
> > > +	{
> > > +		.name			=3D "Overlay_1",
> > > +		.id			=3D OVERLAY_PLANE_1,
> > > +		.type			=3D DRM_PLANE_TYPE_OVERLAY,
> > > +		.num_formats		=3D ARRAY_SIZE(primary_overlay_format0),
> > > +		.formats		=3D primary_overlay_format0,
> > > +		.num_modifiers		=3D ARRAY_SIZE(secondary_format_modifiers),
> > > +		.modifiers		=3D secondary_format_modifiers,
> > > +		.min_width		=3D 0,
> > > +		.min_height		=3D 0,
> > > +		.max_width		=3D 4096,
> > > +		.max_height		=3D 4096,
> > > +		.rotation		=3D 0,
> > > +		.blend_mode		=3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> > > +					  BIT(DRM_MODE_BLEND_PREMULTI) |
> > > +					  BIT(DRM_MODE_BLEND_COVERAGE),
> > > +		.color_encoding		=3D BIT(DRM_COLOR_YCBCR_BT709) |
> > > +					  BIT(DRM_COLOR_YCBCR_BT2020),
> > > +		.degamma_size		=3D DEGAMMA_SIZE,
> > > +		.min_scale		=3D DRM_PLANE_NO_SCALING,
> > > +		.max_scale		=3D DRM_PLANE_NO_SCALING,
> > > +		.zpos			=3D 2,
> > > +		.watermark		=3D true,
> > > +		.color_mgmt		=3D true,
> > > +		.roi			=3D true,
> > > +	},
> > > +	{
> > > +		.name			=3D "Primary_1",
> > > +		.id			=3D PRIMARY_PLANE_1,
> > > +		.type			=3D DRM_PLANE_TYPE_PRIMARY,
> > > +		.num_formats		=3D ARRAY_SIZE(primary_overlay_format0),
> > > +		.formats		=3D primary_overlay_format0,
> > > +		.num_modifiers		=3D ARRAY_SIZE(format_modifier0),
> > > +		.modifiers		=3D format_modifier0,
> > > +		.min_width		=3D 0,
> > > +		.min_height		=3D 0,
> > > +		.max_width		=3D 4096,
> > > +		.max_height		=3D 4096,
> > > +		.rotation		=3D DRM_MODE_ROTATE_0 |
> > > +					  DRM_MODE_ROTATE_90 |
> > > +					  DRM_MODE_ROTATE_180 |
> > > +					  DRM_MODE_ROTATE_270 |
> > > +					  DRM_MODE_REFLECT_X |
> > > +					  DRM_MODE_REFLECT_Y,
> > > +		.blend_mode		=3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> > > +					  BIT(DRM_MODE_BLEND_PREMULTI) |
> > > +					  BIT(DRM_MODE_BLEND_COVERAGE),
> > > +		.color_encoding		=3D BIT(DRM_COLOR_YCBCR_BT709) |
> > > +					  BIT(DRM_COLOR_YCBCR_BT2020),
> > > +		.degamma_size		=3D DEGAMMA_SIZE,
> > > +		.min_scale		=3D FRAC_16_16(1, 3),
> > > +		.max_scale		=3D FRAC_16_16(10, 1),
> > > +		.zpos			=3D 3,
> > > +		.watermark		=3D true,
> > > +		.color_mgmt		=3D true,
> > > +		.roi			=3D true,
> > > +	},
> > > +	{
> > > +		.name			=3D "Overlay_2",
> > > +		.id			=3D OVERLAY_PLANE_2,
> > > +		.type			=3D DRM_PLANE_TYPE_OVERLAY,
> > > +		.num_formats		=3D ARRAY_SIZE(primary_overlay_format0),
> > > +		.formats		=3D primary_overlay_format0,
> > > +		.num_modifiers		=3D ARRAY_SIZE(format_modifier0),
> > > +		.modifiers		=3D format_modifier0,
> > > +		.min_width		=3D 0,
> > > +		.min_height		=3D 0,
> > > +		.max_width		=3D 4096,
> > > +		.max_height		=3D 4096,
> > > +		.rotation		=3D DRM_MODE_ROTATE_0 |
> > > +					  DRM_MODE_ROTATE_90 |
> > > +					  DRM_MODE_ROTATE_180 |
> > > +					  DRM_MODE_ROTATE_270 |
> > > +					  DRM_MODE_REFLECT_X |
> > > +					  DRM_MODE_REFLECT_Y,
> > > +		.blend_mode		=3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> > > +					  BIT(DRM_MODE_BLEND_PREMULTI) |
> > > +					  BIT(DRM_MODE_BLEND_COVERAGE),
> > > +		.color_encoding		=3D BIT(DRM_COLOR_YCBCR_BT709) |
> > > +					  BIT(DRM_COLOR_YCBCR_BT2020),
> > > +		.degamma_size		=3D DEGAMMA_SIZE,
> > > +		.min_scale		=3D FRAC_16_16(1, 3),
> > > +		.max_scale		=3D FRAC_16_16(10, 1),
> > > +		.zpos			=3D 4,
> > > +		.watermark		=3D true,
> > > +		.color_mgmt		=3D true,
> > > +		.roi			=3D true,
> > > +	},
> > > +	{
> > > +		.name			=3D "Overlay_3",
> > > +		.id			=3D OVERLAY_PLANE_3,
> > > +		.type			=3D DRM_PLANE_TYPE_OVERLAY,
> > > +		.num_formats		=3D ARRAY_SIZE(primary_overlay_format0),
> > > +		.formats		=3D primary_overlay_format0,
> > > +		.num_modifiers		=3D ARRAY_SIZE(secondary_format_modifiers),
> > > +		.modifiers		=3D secondary_format_modifiers,
> > > +		.min_width		=3D 0,
> > > +		.min_height		=3D 0,
> > > +		.max_width		=3D 4096,
> > > +		.max_height		=3D 4096,
> > > +		.rotation		=3D 0,
> > > +		.blend_mode		=3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> > > +					  BIT(DRM_MODE_BLEND_PREMULTI) |
> > > +					  BIT(DRM_MODE_BLEND_COVERAGE),
> > > +		.color_encoding		=3D BIT(DRM_COLOR_YCBCR_BT709) |
> > > +					  BIT(DRM_COLOR_YCBCR_BT2020),
> > > +		.degamma_size		=3D DEGAMMA_SIZE,
> > > +		.min_scale		=3D DRM_PLANE_NO_SCALING,
> > > +		.max_scale		=3D DRM_PLANE_NO_SCALING,
> > > +		.zpos			=3D 5,
> > > +		.watermark		=3D true,
> > > +		.color_mgmt		=3D true,
> > > +		.roi			=3D true,
> > > +	},
> > > +	{
> > > +		.name			=3D "Cursor",
> > > +		.id			=3D CURSOR_PLANE_0,
> > > +		.type			=3D DRM_PLANE_TYPE_CURSOR,
> > > +		.num_formats		=3D ARRAY_SIZE(cursor_formats),
> > > +		.formats		=3D cursor_formats,
> > > +		.num_modifiers		=3D 0,
> > > +		.modifiers		=3D NULL,
> > > +		.min_width		=3D 32,
> > > +		.min_height		=3D 32,
> > > +		.max_width		=3D 64,
> > > +		.max_height		=3D 64,
> > > +		.rotation		=3D 0,
> > > +		.degamma_size		=3D 0,
> > > +		.min_scale		=3D DRM_PLANE_NO_SCALING,
> > > +		.max_scale		=3D DRM_PLANE_NO_SCALING,
> > > +		.zpos			=3D 255,
> > > +		.watermark		=3D false,
> > > +		.color_mgmt		=3D false,
> > > +		.roi			=3D false,
> > > +	},
> > > +	{
> > > +		.name			=3D "Cursor_1",
> > > +		.id			=3D CURSOR_PLANE_1,
> > > +		.type			=3D DRM_PLANE_TYPE_CURSOR,
> > > +		.num_formats		=3D ARRAY_SIZE(cursor_formats),
> > > +		.formats		=3D cursor_formats,
> > > +		.num_modifiers		=3D 0,
> > > +		.modifiers		=3D NULL,
> > > +		.min_width		=3D 32,
> > > +		.min_height		=3D 32,
> > > +		.max_width		=3D 64,
> > > +		.max_height		=3D 64,
> > > +		.rotation		=3D 0,
> > > +		.degamma_size		=3D 0,
> > > +		.min_scale		=3D DRM_PLANE_NO_SCALING,
> > > +		.max_scale		=3D DRM_PLANE_NO_SCALING,
> > > +		.zpos			=3D 255,
> > > +		.watermark		=3D false,
> > > +		.color_mgmt		=3D false,
> > > +		.roi			=3D false,
> > > +	},
> > > +};
> > > +
> > > +static const struct vs_dc_info dc8200_info =3D {
> > > +	.name			=3D "DC8200",
> > > +	.panel_num		=3D 2,
> > > +	.plane_num		=3D 8,
> > > +	.planes			=3D dc_hw_planes_rev0,
> > > +	.layer_num		=3D 6,
> > > +	.max_bpc		=3D 10,
> > > +	.color_formats		=3D DRM_COLOR_FORMAT_RGB444 |
> > > +				  DRM_COLOR_FORMAT_YCBCR444 |
> > > +				  DRM_COLOR_FORMAT_YCBCR422 |
> > > +				  DRM_COLOR_FORMAT_YCBCR420,
> > > +	.gamma_size		=3D GAMMA_EX_SIZE,
> > > +	.gamma_bits		=3D 12,
> > > +	.pitch_alignment	=3D 128,
> > > +	.pipe_sync		=3D false,
> > > +	.background		=3D true,
> > > +	.panel_sync		=3D true,
> > > +	.cap_dec		=3D true,
> > > +};
> >=20
> > I really think that entire thing is to workaround a suboptimal device t=
ree binding.
> > You should have two CRTCs in the device tree, you'll probe twice, and y=
ou won't
> > get to do that whole dance.
> >=20

> I tried to modify it according to this idea Found it too difficult In
> terms of hardware, the two crtc designs are too close to separate, and
> they are even designed into the same reg with different bits
> representing crtc0 and crtc1. It seems not easy to described the 2
> ctrc hardware by 2 device nodes

What are these bits doing?

> The idea is to avoid a whole dance I don't know if I understand
> correctly about whole dance. Is it means I create 2 ctrc and 8 plane
> in the dc_bind?

Yeah, you should strive to make it two separate devices.

Maxime

--pxujij5httjhwier
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZbpJ4QAKCRDj7w1vZxhR
xbXKAQCkvP9gj89Uud9IYEso1eFoTC1FwHXjqrFhiyGdoEM2jgEAnCBvuWdLGfFs
puqhj3XR1WkyppzKeff6yOmoPFnMvwM=
=cHAW
-----END PGP SIGNATURE-----

--pxujij5httjhwier--


--===============4118466729244595557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4118466729244595557==--

