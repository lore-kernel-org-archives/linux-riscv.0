Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A034EC0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 13:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAupMt8F59FjzgDnKDtXsEJD2/k5UNovW2mEXGz4ZfE=; b=Bf/4t/cRFA8nj7xxonTxf+QdKf
	D31ixPFKRHtUc1ZIdJ4oXoUI8LLSriG4898ZwANb3C7Ck1E71fUvb51UBcFX40Tq7q4qYu3II74Y/
	+4fN2Nr7s3tPk9XHIjgD6AFzCDNtIs2OQDxBzU42c7qBrJhzBGi9jOLKZ5D9xZt2F9zx4rbRUMe++
	GW8KK5G8DxA9zPF8N1M7rZt/5J0QljjqgDKuTctO7FfmEjb54UDZe6DI7AF6UxtW0CzHfcBSCKW2O
	0BYD07+lZFhoRLELKdlT8cUrreid75kB3bVObZvUzDr9Kk3zjvXzbg6+uSiTmIsaJR4gzbcPsS76M
	1HkrIh4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qveOL-00CS4G-0h;
	Wed, 25 Oct 2023 13:57:49 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qveOF-00CS0R-33
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 13:57:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D7503B82F6E;
	Wed, 25 Oct 2023 13:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F05FC433C7;
	Wed, 25 Oct 2023 13:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698242251;
	bh=mL9aaBJh7T4dWkfq57W9E21rwjuh1Dt0dXBpKyIZtA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ahC34Et4TkfTRirGAN2NqFk+LWAL4dV6tJrge28TGVmvlgK8OHAtr4S/mvlbi810K
	 q3H2Ib4H9hw5mPctEaDZOj2zcNEouX+SApw328WgQ+LlQ1QhU+bZzbmWfNdR/vn9fq
	 J8YpFTwF7mv48aWDbMUjn8mJ29e6Ay5xoGBIL482uPSk/fBsLbbPEc518JsnZZNDBi
	 VW7AOVyLiIFvZjfA2kEIgIxcuiI3Yx0/AA5CjI+Vkpkqi44Pyl4fRCHrxE3OELYQSB
	 WKvItQ/mYZQdJel2dZWuc4dc90EmJUhS7Es8iQl1O/XuIFNTM/CiwcuszdcoCqIuc0
	 NoIhoLFwHK7QA==
Date: Wed, 25 Oct 2023 15:57:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com, 
	Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>, 
	Chris Morgan <macromorgan@hotmail.com>, Jack Zhu <jack.zhu@starfivetech.com>, 
	Shengyang Chen <shengyang.chen@starfivetech.com>, Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v2 5/6] drm/vs: Add KMS crtc&plane
Message-ID: <pfjfxkpg4cheozhnjgql67ntfiapssba36ukusqrlo6za4owv3@mwzucmdqboy5>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-6-keith.zhao@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231025103957.3776-6-keith.zhao@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_065744_247618_B7AE13A9 
X-CRM114-Status: GOOD (  26.34  )
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
Content-Type: multipart/mixed; boundary="===============9050911854601892092=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9050911854601892092==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gne3qq4wbplxfl5j"
Content-Disposition: inline


--gne3qq4wbplxfl5j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 25, 2023 at 06:39:56PM +0800, Keith Zhao wrote:
> +static struct drm_crtc_state *
> +vs_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
> +{
> +	struct vs_crtc_state *ori_state;
> +	struct vs_crtc_state *state;
> +
> +	if (!crtc->state)
> +		return NULL;
> +
> +	ori_state = to_vs_crtc_state(crtc->state);
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return NULL;
> +
> +	__drm_atomic_helper_crtc_duplicate_state(crtc, &state->base);
> +
> +	state->output_fmt = ori_state->output_fmt;

That field is never set in your patch.

> +	state->encoder_type = ori_state->encoder_type;

That isn't either, and it's not clear why you would need the
encoder_type stored in the CRTC?

> +	state->bpp = ori_state->bpp;

You seem to derive that from output_fmt, it doesn't need to be in the
CRTC state.

> +	state->underflow = ori_state->underflow;

Assuming you're setting this from the interrupt handler, it's unsafe,
you shouldn't do that. What are you using it for?

> +static const struct drm_prop_enum_list vs_sync_mode_enum_list[] = {
> +	{ VS_SINGLE_DC,				"single dc mode" },
> +	{ VS_MULTI_DC_PRIMARY,		"primary dc for multi dc mode" },
> +	{ VS_MULTI_DC_SECONDARY,	"secondary dc for multi dc mode" },
> +};

Custom driver properties are a no-go:
https://docs.kernel.org/gpu/drm-kms.html#requirements

And

https://docs.kernel.org/gpu/drm-uapi.html#open-source-userspace-requirements

> +void vs_dc_enable(struct vs_dc *dc, struct drm_crtc *crtc)
> +{
> +	struct vs_crtc_state *crtc_state = to_vs_crtc_state(crtc->state);
> +	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
> +	struct dc_hw_display display;

Why are you rolling your own structure here, if it's exactly equivalent
to what drm_display_mode and the crtc_state provide?

> +void vs_dc_commit(struct vs_dc *dc)
> +{
> +	dc_hw_enable_shadow_register(&dc->hw, false);
> +
> +	dc_hw_commit(&dc->hw);
> +
> +	if (dc->first_frame)
> +		dc->first_frame = false;
> +
> +	dc_hw_enable_shadow_register(&dc->hw, true);
> +}

It's not clear to me what you're trying to do here, does the hardware
have latched registers that are only updated during vblank?

> +static int dc_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct drm_device *drm_dev = data;
> +	struct vs_dc *dc = dev_get_drvdata(dev);
> +	struct device_node *port;
> +	struct vs_crtc *crtc;
> +	struct vs_dc_info *dc_info;
> +	struct vs_plane *plane;
> +	struct vs_plane_info *plane_info;
> +	int i, ret;
> +	u32 ctrc_mask = 0;
> +
> +	if (!drm_dev || !dc) {
> +		dev_err(dev, "devices are not created.\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = dc_init(dev);
> +	if (ret < 0) {
> +		drm_err(drm_dev, "Failed to initialize DC hardware.\n");
> +		return ret;
> +	}
> +
> +	port = of_get_child_by_name(dev->of_node, "port");
> +	if (!port) {
> +		drm_err(drm_dev, "no port node found\n");
> +		return -ENODEV;
> +	}
> +	of_node_put(port);
> +
> +	dc_info = dc->hw.info;
> +
> +	for (i = 0; i < dc_info->panel_num; i++) {
> +		crtc = vs_crtc_create(drm_dev, dc_info);
> +		if (!crtc) {
> +			drm_err(drm_dev, "Failed to create CRTC.\n");
> +			ret = -ENOMEM;
> +			return ret;
> +		}
> +
> +		crtc->base.port = port;
> +		crtc->dev = dev;
> +		dc->crtc[i] = crtc;
> +		ctrc_mask |= drm_crtc_mask(&crtc->base);
> +	}
> +
> +	for (i = 0; i < dc_info->plane_num; i++) {
> +		plane_info = (struct vs_plane_info *)&dc_info->planes[i];
> +
> +		if (!strcmp(plane_info->name, "Primary") || !strcmp(plane_info->name, "Cursor")) {
> +			plane = vs_plane_create(drm_dev, plane_info, dc_info->layer_num,
> +						drm_crtc_mask(&dc->crtc[0]->base));
> +		} else if (!strcmp(plane_info->name, "Primary_1") ||
> +				   !strcmp(plane_info->name, "Cursor_1")) {

Please use an enum and an id there.

> +static int vs_plane_atomic_set_property(struct drm_plane *plane,
> +					struct drm_plane_state *state,
> +					struct drm_property *property,
> +					uint64_t val)
> +{
> +	struct drm_device *dev = plane->dev;
> +	struct vs_plane *vs_plane = to_vs_plane(plane);
> +	struct vs_plane_state *vs_plane_state = to_vs_plane_state(state);
> +	int ret = 0;
> +
> +	if (property == vs_plane->degamma_mode) {
> +		if (vs_plane_state->degamma != val) {
> +			vs_plane_state->degamma = val;
> +			vs_plane_state->degamma_changed = true;
> +		} else {
> +			vs_plane_state->degamma_changed = false;
> +		}
> +	} else if (property == vs_plane->watermark_prop) {
> +		ret = _vs_plane_set_property_blob_from_id(dev,
> +							  &vs_plane_state->watermark,
> +							  val,
> +							  sizeof(struct drm_vs_watermark));
> +		return ret;
> +	} else if (property == vs_plane->color_mgmt_prop) {
> +		ret = _vs_plane_set_property_blob_from_id(dev,
> +							  &vs_plane_state->color_mgmt,
> +							  val,
> +							  sizeof(struct drm_vs_color_mgmt));
> +		return ret;
> +	} else if (property == vs_plane->roi_prop) {
> +		ret = _vs_plane_set_property_blob_from_id(dev,
> +							  &vs_plane_state->roi,
> +							  val,
> +							  sizeof(struct drm_vs_roi));
> +		return ret;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

Same story than above for properties


Honestly, that driver is pretty massive, and you should be simplifying
it a lot of you want the initial contribution to be as smooth as
possible.

Things like all the tiling formats, the underflowing handling, all those
properties, etc can (and should) be added in a second step once the
foundations are in.

Maxime

--gne3qq4wbplxfl5j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTkexwAKCRDj7w1vZxhR
xVc2AQDt1GUu/XJrbLjzUqX2QBMsMrPFuT0gkDUTQBP87bT4TQD/fxbMJ+PO/Guy
dWrnZFx2MNMwz2yBjRVOwStrbI0sWQo=
=dDhB
-----END PGP SIGNATURE-----

--gne3qq4wbplxfl5j--


--===============9050911854601892092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9050911854601892092==--

