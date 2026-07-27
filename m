Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFF9C531FC
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 07:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29mTpIgiAoxMf2OPHN27FuxvuKdD5J1lw3ae6nF0PXo=; b=zMPM9fiy0r2/f6
	syaKnvjW5Wfz8eM13CjI5v+cGM9p2GZ8ks7nJBTc6ohd/Jzpvux/PniUJT/92KS5ZM8Jgg7rYKOsx
	ug8Z2HIeLKvUqLZQ1KvpWG/a6XiYDDJtG801Si1jo0XQeu/9sYVDQVwC5XBz6U27S+bc75RdXxjkC
	jECjaoqSZ7PRRO8yOCzm93RpPb+CpMrW042Rk7JqaA4ezuOkrhMHbUlVGGBODEBYLuOYaY9DJRGQl
	PP9kbJG/KCnvPdo2F+rNJ74UH0wcPCUSNr1XZQUWoOZ/mA6PJekNM6lEZY7kjvXH5msT7hDqLa1Y1
	QZnZ9+0GSGPbgthAo5zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFsK-000000028Z3-43sA;
	Mon, 27 Jul 2026 07:35:48 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFsC-000000028Vh-3fhv;
	Mon, 27 Jul 2026 07:35:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 1D66B202054;
	Mon, 27 Jul 2026 09:35:39 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1woFsB-001VMX-07;
	Mon, 27 Jul 2026 09:35:39 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1woFsA-000000006t9-3uCi;
	Mon, 27 Jul 2026 09:35:38 +0200
Message-ID: <084a860a77f18aaafcda4b223eec4fdcd96e75c9.camel@pengutronix.de>
Subject: Re: [PATCH RESEND 10/17] drm/spacemit: add Saturn DPU KMS pipeline
From: Philipp Zabel <p.zabel@pengutronix.de>
To: codykang.hk@gmail.com, David Airlie <airlied@gmail.com>, Simona Vetter	
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan	
 <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>, Michael
 Turquette	 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney	 <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti	 <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-clk@vger.kernel.org
Date: Mon, 27 Jul 2026 09:35:38 +0200
In-Reply-To: <20260725-k3-display-v1-10-6de34d80e86c@gmail.com>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
	 <20260725-k3-display-v1-10-6de34d80e86c@gmail.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_003541_065302_40B5C584 
X-CRM114-Status: GOOD (  17.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sa, 2026-07-25 at 00:51 -0400, Cody Kang via B4 Relay wrote:
> From: Cody Kang <codykang.hk@gmail.com>
> 
> Add the atomic KMS implementation on top of the hardware backend: one
> CRTC and one primary plane per DPU instance. atomic_check validates
> the plane rectangle 1:1 against the mode and sizes the per-channel FBC
> line buffer; atomic commit builds the cmdlist batches, maps the
> framebuffer through the DMMU and arms the cfg-ready handshake, with
> vblank events driven from the DPU interrupt.
> 
> Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> ---
>  drivers/gpu/drm/spacemit/spacemit_crtc.c   | 815 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/spacemit/spacemit_planes.c | 376 +++++++++++++
>  2 files changed, 1191 insertions(+)
> 
> diff --git a/drivers/gpu/drm/spacemit/spacemit_crtc.c b/drivers/gpu/drm/spacemit/spacemit_crtc.c
> new file mode 100644
> index 000000000000..b75ff6320501
> --- /dev/null
> +++ b/drivers/gpu/drm/spacemit/spacemit_crtc.c
> @@ -0,0 +1,815 @@
[...]
> +/*
> + * The assert and deassert orders are not mirror images: the hardware wants
> + * these.
> + */
> +static void dpu_reset_assert(struct device *dev, const char *name,
> +			     struct reset_control *rstc)
> +{
> +	int ret = reset_control_assert(rstc);
> +
> +	if (ret)
> +		dev_warn(dev, "failed to assert %s reset: %d\n", name, ret);
> +}
> +
> +static void dpu_reset_deassert(struct device *dev, const char *name,
> +			       struct reset_control *rstc)
> +{
> +	int ret = reset_control_deassert(rstc);
> +
> +	if (ret)
> +		dev_warn(dev, "failed to deassert %s reset: %d\n", name, ret);
> +}
> +
> +static int dpu_pm_suspend(struct device *dev)
> +{
> +	struct spacemit_drm_private *priv = dev_get_drvdata(dev);
> +	struct spacemit_crtc *a_crtc = priv->a_crtc;
> +
> +	/*
> +	 * Assert before gating: a reset asserted into an already-gated block
> +	 * has no clock edges to propagate on and leaves the register file
> +	 * untouched.
> +	 */
> +	dpu_reset_assert(dev, "lcd", a_crtc->lcd_reset);
> +	dpu_reset_assert(dev, "esc", a_crtc->esc_reset);
> +	dpu_reset_assert(dev, "mclk", a_crtc->mclk_reset);

It looks like these three are mirrored, and could be handled by
reset_control_bulk_assert/deassert().

> +	dpu_reset_assert(dev, "aclk", a_crtc->aclk_reset);
> +	dpu_reset_assert(dev, "dsc", a_crtc->dsc_reset);
> +	usleep_range(10000, 20000);
> +
> +	if (a_crtc->core && a_crtc->core->disable_clk)
> +		a_crtc->core->disable_clk(a_crtc);
> +
> +	return 0;
> +}
> +
> +static int dpu_pm_resume(struct device *dev)
> +{
> +	struct spacemit_drm_private *priv = dev_get_drvdata(dev);
> +	struct spacemit_crtc *a_crtc = priv->a_crtc;
> +
> +	dpu_reset_deassert(dev, "mclk", a_crtc->mclk_reset);
> +	dpu_reset_deassert(dev, "esc", a_crtc->esc_reset);
> +	dpu_reset_deassert(dev, "lcd", a_crtc->lcd_reset);
> +	dpu_reset_deassert(dev, "aclk", a_crtc->aclk_reset);
> +	dpu_reset_deassert(dev, "dsc", a_crtc->dsc_reset);
> +
> +	if (a_crtc->core && a_crtc->core->enable_clk)
> +		a_crtc->core->enable_clk(a_crtc);
> +
> +	return 0;
> +}

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
