Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4C0C001DF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 12:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ojAtF10e5kiaxAttTg9tX6/ekfanGd5zR7f6ySz4zg=; b=bEGEuHwnudJ5bYLh8yQ+L+5B9n
	sZseQgJSCefdjEDP/YRdr+YV1G6OmQ8VsogheA4Dalk4mkP7YXeSkuDyhFjXTu/Pi/UbhHPLNkf8k
	1PHfgnDx8w4BXee9LVqI0rJYEVjrxnZrM61aF6o4A2SKOFoJipArMVD3Wvs6/8z2lUJDnpYv/8Gy4
	eUxwgiSwvVrmmcL1MBczWRIZ0Tl28w1YbUIhIMF0PL8bie5Sr785xUrqvQDJrXhtUHBS6yEvLl6Qy
	aEs/+VlPgT0ugWvMr96q3WUqlaig+429WJWEIT63ChxaJL7Hxn7LFNG22cPzzkG0SnTuKnWdugs+b
	O2vn0aug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQoWA-002LtV-1G;
	Tue, 01 Aug 2023 12:30:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQo8j-002CWj-1T
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 12:06:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 66E2561585;
	Tue,  1 Aug 2023 12:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D416C433C7;
	Tue,  1 Aug 2023 12:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690891569;
	bh=s6YECtfwRWz+nn+e8dtTgfPFMuDS2G9MlvdIBiOeJvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KqMPTZxlteTlX/vW0spt/IyKiVoPJYdtMr2lPEmfbuQmmwhfCC21GhGz+yQWZ8GEd
	 RJW1lK9JN1DnTZJmTBwsvxtaZhWyU6xXWtVcaFKkx5L8z9m/yft5TuURPQh/J+IL7U
	 PHvcq8WNXFxjoQvwm9S5/fvJ1NcSpL5MoMmgslMiMQ5qDQ3DsuwUBL05Ll8j2x2V0T
	 Fmi+ZB4B+y3YDp+rI657BSpL6UbzABRJfYD+Czas7wkqLfwlQX9ueJGii9FSPJqKBt
	 8HPA9376cD/cny4bwakf8t2KopaxquTpFCkgWx5XoRWckS8rxRoyjnuCN7kB9nASW2
	 lheIZ7XLLLVog==
Date: Tue, 1 Aug 2023 14:06:06 +0200
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
Subject: Re: [PATCH v1 v1 6/7] drm/vs: Add KMS crtc&plane
Message-ID: <7sfzkc6b46izrfnhcoajllugfofh7otseocbiiftjx344hxiuf@jkjb5syqwo24>
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
 <20230801101030.2040-7-keith.zhao@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230801101030.2040-7-keith.zhao@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_050613_591243_86A326FE 
X-CRM114-Status: GOOD (  16.99  )
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
Content-Type: multipart/mixed; boundary="===============5739457431514735282=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5739457431514735282==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="duuftomxabqjg5ol"
Content-Disposition: inline


--duuftomxabqjg5ol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Aug 01, 2023 at 06:10:29PM +0800, Keith Zhao wrote:
> +static int vs_crtc_atomic_set_property(struct drm_crtc *crtc,
> +				       struct drm_crtc_state *state,
> +				       struct drm_property *property,
> +				       uint64_t val)
> +{
> +	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
> +	struct vs_crtc_state *vs_crtc_state = to_vs_crtc_state(state);
> +
> +	if (property == vs_crtc->sync_mode)
> +		vs_crtc_state->sync_mode = val;
> +	else if (property == vs_crtc->mmu_prefetch)
> +		vs_crtc_state->mmu_prefetch = val;
> +	else if (property == vs_crtc->bg_color)
> +		vs_crtc_state->bg_color = val;
> +	else if (property == vs_crtc->panel_sync)
> +		vs_crtc_state->sync_enable = val;
> +	else if (property == vs_crtc->dither)
> +		vs_crtc_state->dither_enable = val;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int vs_crtc_atomic_get_property(struct drm_crtc *crtc,
> +				       const struct drm_crtc_state *state,
> +				       struct drm_property *property,
> +				       uint64_t *val)
> +{
> +	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
> +	const struct vs_crtc_state *vs_crtc_state =
> +		container_of(state, const struct vs_crtc_state, base);
> +
> +	if (property == vs_crtc->sync_mode)
> +		*val = vs_crtc_state->sync_mode;
> +	else if (property == vs_crtc->mmu_prefetch)
> +		*val = vs_crtc_state->mmu_prefetch;
> +	else if (property == vs_crtc->bg_color)
> +		*val = vs_crtc_state->bg_color;
> +	else if (property == vs_crtc->panel_sync)
> +		*val = vs_crtc_state->sync_enable;
> +	else if (property == vs_crtc->dither)
> +		*val = vs_crtc_state->dither_enable;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}

Any new property needs to follow these requirements:
https://docs.kernel.org/gpu/drm-kms.html#requirements
https://docs.kernel.org/gpu/drm-uapi.html#open-source-userspace-requirements

Also, most of them are suspicious, like sync_mode, mmu_prefetch,
panel_sync or dither_enable. Why would you want userspace to change
those ?


> +static int vs_crtc_late_register(struct drm_crtc *crtc)
> +{
> +	return 0;
> +}

You can drop that.

> +static int vs_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
> +
> +	vs_dc_enable_vblank(vs_crtc->dev, true);
> +
> +	return 0;
> +}
> +
> +static void vs_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
> +
> +	vs_dc_enable_vblank(vs_crtc->dev, false);
> +}
> +
> +static const struct drm_crtc_funcs vs_crtc_funcs = {
> +	.set_config		= drm_atomic_helper_set_config,
> +	.page_flip		= drm_atomic_helper_page_flip,
> +	.reset			= vs_crtc_reset,
> +	.atomic_duplicate_state = vs_crtc_atomic_duplicate_state,
> +	.atomic_destroy_state	= vs_crtc_atomic_destroy_state,
> +	.atomic_set_property	= vs_crtc_atomic_set_property,
> +	.atomic_get_property	= vs_crtc_atomic_get_property,
> +	.late_register		= vs_crtc_late_register,
> +	.enable_vblank		= vs_crtc_enable_vblank,
> +	.disable_vblank		= vs_crtc_disable_vblank,
> +};
> +
> +static u8 cal_pixel_bits(u32 bus_format)
> +{
> +	u8 bpp;
> +
> +	switch (bus_format) {
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +		bpp = 16;
> +		break;
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> +		bpp = 18;
> +		break;
> +	case MEDIA_BUS_FMT_UYVY10_1X20:
> +		bpp = 20;
> +		break;
> +	case MEDIA_BUS_FMT_BGR888_1X24:
> +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> +	case MEDIA_BUS_FMT_YUV8_1X24:
> +		bpp = 24;
> +		break;
> +	case MEDIA_BUS_FMT_RGB101010_1X30:
> +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> +	case MEDIA_BUS_FMT_YUV10_1X30:
> +		bpp = 30;
> +		break;
> +	default:
> +		bpp = 24;
> +		break;
> +	}
> +
> +	return bpp;
> +}
> +
> +static bool vs_crtc_mode_fixup(struct drm_crtc *crtc,
> +			       const struct drm_display_mode *mode,
> +			       struct drm_display_mode *adjusted_mode)
> +{
> +	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
> +
> +	return vs_dc_mode_fixup(vs_crtc->dev, mode, adjusted_mode);
> +}

You should be using atomic_check.

Maxime

--duuftomxabqjg5ol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMj1LgAKCRDj7w1vZxhR
xcuiAQDVAHuCXQLiF4aho3J76b/1omEGtDLrJYqMFou4trNeDQEA9a+4doYz0r8T
e4MChnbgb7U5q3ndReWR8iY6I4VZ/wc=
=sNPG
-----END PGP SIGNATURE-----

--duuftomxabqjg5ol--


--===============5739457431514735282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5739457431514735282==--

