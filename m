Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEAAF3C241
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 12:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Subject:
	Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0v+KGA9MtzB0c2e9tQ7XTvzADFGNdSFhJDTbunoNgA=; b=MyqrEK2n0whgu5
	pgkKhBHdlltE3ZW6LSut3ibJpMji4FvtEyYib7ZhhYIBb2Zqfvl8AgTiZbbCYKCsBdirUe14JZsXZ
	4pQDidXhsqyU+p8WImB/F9l4h9bfBUpJm5+KNJOnagd+oYw930gtA9aZk6tMEaCDkt7yj/jsRXqiO
	n+lDnE9iT9vAgC5GB3X02eCF141rUCATZNEDSAaEalqqjaEH/uTNqOLV/RS3ZLtp1HYdGf1fYpYVC
	pn6bja8apBPu4dgozndTUG7rw59eMN4BEUuyh2dnCQnHiUksUiB8gDuV9QhWreropr7r1JXCt7Wd0
	EMC0KGY2GQKdoVv+BewA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vza1N-00000007LI6-4B10;
	Mon, 09 Mar 2026 12:47:42 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vza1K-00000007LHg-0CXC
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 12:47:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 03B721A2DAB;
	Mon,  9 Mar 2026 12:47:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9B875FFB8;
	Mon,  9 Mar 2026 12:47:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09B6810369B97;
	Mon,  9 Mar 2026 13:47:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773060451; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wCTUnhuxvulHzW4p0uUdfASMjS854LLOHF+KryEvCLg=;
	b=el/ScjM4Ue552Q5u0YpglfOiNwlnWqvRvgPZRn0f2Rw9gC2K6miO3fjP58Kezv524ydiSu
	TnJe8U2jt+A1EJ6DB1yTs7y0A6UQYZvTUFLzohffbj2jx9dbDYRqYRIm/DKsAlA08WUE5o
	h+sY8NUKOa8F7OPKU7GdMADmAbHvAOWT3Xycjjt/+QEJcuQ8UijP4u56/6n693iG274Qyw
	TW2fwFCVxVMyU/LU5PH1DEo0plMmeu9xMuFSnZIDm/fLs/dYFW8oWIDiOD5qWXRnYonHxk
	qlKDmbIRISO2L4epJFOCo80mqRQNmcnKOiRv5ruerLteKpajtRCpOmq8Cv4YXQ==
Mime-Version: 1.0
Date: Mon, 09 Mar 2026 13:47:18 +0100
Message-Id: <DGY9GWWLXGNX.265MMEXXCG8YA@bootlin.com>
Subject: Re: [PATCH v7 3/8] drm: verisilicon: add a driver for Verisilicon
 display controllers
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Drew Fustini" <fustini@kernel.org>, "Guo
 Ren" <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
 <20260129023922.1527729-4-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260129023922.1527729-4-zhengxingda@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_054738_356528_D14693A8 
X-CRM114-Status: GOOD (  29.00  )
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
Cc: devicetree@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>, Han
 Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>, Michal Wilczynski <m.wilczynski@samsung.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Icenowy Zheng,

On Thu Jan 29, 2026 at 3:39 AM CET, Icenowy Zheng wrote:
> From: Icenowy Zheng <uwu@icenowy.me>
>
> This is a from-scratch driver targeting Verisilicon DC-series display
> controllers, which feature self-identification functionality like their
> GC-series GPUs.
>
> Only DC8200 is being supported now, and only the main framebuffer is set
> up (as the DRM primary plane). Support for more DC models and more
> features is my further targets.
>
> As the display controller is delivered to SoC vendors as a whole part,
> this driver does not use component framework and extra bridges inside a
> SoC is expected to be implemented as dedicated bridges (this driver
> properly supports bridge chaining).
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Tested-by: Han Gao <gaohan@iscas.ac.cn>
> Tested-by: Michal Wilczynski <m.wilczynski@samsung.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

I have reviewed the bridge part of this patch and have a few remarks, see
below.

[...]

> +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
> @@ -0,0 +1,371 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> + */
> +
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#include <uapi/linux/media-bus-format.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include "vs_bridge.h"
> +#include "vs_bridge_regs.h"
> +#include "vs_crtc.h"
> +#include "vs_dc.h"
> +
> +static int vs_bridge_attach(struct drm_bridge *bridge,
> +			    struct drm_encoder *encoder,
> +			    enum drm_bridge_attach_flags flags)
> +{
> +	struct vs_bridge *vbridge = drm_bridge_to_vs_bridge(bridge);
> +
> +	return drm_bridge_attach(encoder, vbridge->next_bridge,
> +				 bridge, flags);
> +}
> +
> +struct vsdc_dp_format {
> +	u32 linux_fmt;
> +	bool is_yuv;
> +	u32 vsdc_fmt;
> +};

Moving the bool after the two 'u32's would be better for packing and
spatial locality (especially in case more fields are added in the future).

> +
> +static struct vsdc_dp_format vsdc_dp_supported_fmts[] = {
> +	/* default to RGB888 */
> +	{ MEDIA_BUS_FMT_FIXED, false, VSDC_DISP_DP_CONFIG_FMT_RGB888 },
> +	{ MEDIA_BUS_FMT_RGB888_1X24, false, VSDC_DISP_DP_CONFIG_FMT_RGB888 },
> +	{ MEDIA_BUS_FMT_RGB565_1X16, false, VSDC_DISP_DP_CONFIG_FMT_RGB565 },
> +	{ MEDIA_BUS_FMT_RGB666_1X18, false, VSDC_DISP_DP_CONFIG_FMT_RGB666 },
> +	{ MEDIA_BUS_FMT_RGB101010_1X30,
> +	  false, VSDC_DISP_DP_CONFIG_FMT_RGB101010 },

You can put up to 100 chars per line and avoid the newline here to make
this table more readable. Same below.

> +	{ MEDIA_BUS_FMT_UYVY8_1X16, true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYVY8 },
> +	{ MEDIA_BUS_FMT_UYVY10_1X20, true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYVY10 },
> +	{ MEDIA_BUS_FMT_YUV8_1X24, true, VSDC_DISP_DP_CONFIG_YUV_FMT_YUV8 },
> +	{ MEDIA_BUS_FMT_YUV10_1X30, true, VSDC_DISP_DP_CONFIG_YUV_FMT_YUV10 },
> +	{ MEDIA_BUS_FMT_UYYVYY8_0_5X24,
> +	  true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYYVYY8 },
> +	{ MEDIA_BUS_FMT_UYYVYY10_0_5X30,
> +	  true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYYVYY10 },
> +};
> +

[...]

> +struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
> +				 struct vs_crtc *crtc)
> +{
> +	unsigned int output = crtc->id;
> +	struct vs_bridge *bridge;

In common practice a variable named 'bridge' is used to point to a 'struct
drm_bridge', so it feels weird when it is used for another type. Can you
rename to 'vbridge' or 'vsbridge' or similar, to clarify it's the
"Verisilicon bridge"?

This is after all what you did in vs_bridge_attach() above, where the
ambiguity of the 'bridge' name used for a driver-specific struct is
evident.

> +	struct drm_bridge *next;
> +	enum vs_bridge_output_interface intf;
> +	const struct drm_bridge_funcs *bridge_funcs;
> +	int ret, enctype;
> +
> +	intf = vs_bridge_detect_output_interface(drm_dev->dev->of_node,
> +						 output);
> +	if (intf == -ENODEV) {
> +		drm_dbg(drm_dev, "Skipping output %u\n", output);
> +		return NULL;
> +	}
> +
> +	next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,
> +				      output, intf);
> +	if (IS_ERR(next)) {
> +		ret = PTR_ERR(next);
> +		if (ret != -EPROBE_DEFER)
> +			drm_err(drm_dev,
> +				"Cannot get downstream bridge of output %u\n",
> +				output);

100 chars per line are allowed, so this could fit on a single line being
nicer to read. This applies to a lot places in this driver, of logging
calls in particular. I understand this would be annoying to change on an
already reviewed patch and at v7 so up to you, but it would be good to keep
it in mind for the future.

> +		return ERR_PTR(ret);
> +	}
> +
> +	if (intf == VSDC_OUTPUT_INTERFACE_DPI)
> +		bridge_funcs = &vs_dpi_bridge_funcs;
> +	else
> +		bridge_funcs = &vs_dp_bridge_funcs;
> +
> +	bridge = devm_drm_bridge_alloc(drm_dev->dev, struct vs_bridge, base,
> +				       bridge_funcs);

The 'struct drm_bridge' field embedded in a driver-specific struct is
conventionally called 'bridge', so renaming it from 'base' to 'bridge'
would make it more consistent with other drivers. That would go in sync
with the coding convention I mentioned above: 'bridge' for struct
drm_bridge, <XYZ>bridge or just <XYZZ> for a custom driver struct embedding
a bridge.

> +	if (IS_ERR(bridge))
> +		return ERR_PTR(PTR_ERR(bridge));
> +
> +	bridge->crtc = crtc;
> +	bridge->intf = intf;
> +	bridge->next_bridge = next;

There is now a next_bridge field in struct drm_bridge, which handles the
bridge lifetime in a safer way and more simply [0], so you could use it:

       bridge->base.next_bridge = next;

Or, after the renames I suggested above:

       vbridge->bridge.next_bridge = next;

[0] https://elixir.bootlin.com/linux/v7.0-rc2/source/include/drm/drm_bridge.h#L1269-L1278

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
