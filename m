Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCF3C531D0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 07:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5enu35CT3QSaAP41T0SjHa1cxW9kxqx1WtCYzEkN4/o=; b=UbtLwix5QtexU3
	CEqGcYoLJVd/Oh4QMpOkeaXveElwx4pSdsWExRN8OjGe+qWi8eLvIbAZHWpFersjv6wnqc3ZN8CAl
	Rw6nAbNF7B+u0BDGyXMteKEMr+l8tPizz5NxYqrEHn0JzDTRsJgTLPI24Sf4GlsxME0ybOtgO0SM/
	mt/bmDLMIigNCcdayYUfstt79Tz3eCVGxSt+q2PX97V9AZq8Z8JEmx9IGdevF8MRmpRlYbapEDSVD
	yzMNVkbJ0LqeI/lyR8Sp+KDCIReE0RcGzSvbQ548IuPXv7v8dcuymY7VYJI9ao9HrWkYSNNNDP4KK
	NLxp67QBAw+SmQG1Bs4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woG68-00000002BNy-0cDL;
	Mon, 27 Jul 2026 07:50:04 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woG65-00000002BNB-0dDn;
	Mon, 27 Jul 2026 07:50:03 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E93CF20203C;
	Mon, 27 Jul 2026 09:49:58 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1woG62-001VNt-2h;
	Mon, 27 Jul 2026 09:49:58 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1woG62-000000007Mr-32Va;
	Mon, 27 Jul 2026 09:49:58 +0200
Message-ID: <5537a40f12e80b89e330f37032016de6f3b9f4c7.camel@pengutronix.de>
Subject: Re: [PATCH RESEND 12/17] drm/spacemit: add Innosilicon DP/eDP
 controller bridge driver
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
Date: Mon, 27 Jul 2026 09:49:58 +0200
In-Reply-To: <20260725-k3-display-v1-12-6de34d80e86c@gmail.com>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
	 <20260725-k3-display-v1-12-6de34d80e86c@gmail.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_005001_372227_04A1BC67 
X-CRM114-Status: GOOD (  22.57  )
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
> Add the DP/eDP controller that sits downstream of the Saturn DPU. Two
> identical instances share one compatible; the eDP-vs-DP role is board
> wiring, so it is taken from the devicetree: an eDP panel always sits
> under an aux-bus child node, an external DP connector never does.
> 
> The link is driven through the generic PHY framework, so the controller
> never touches a PLL register. The controller's HPD interrupt is gated by
> the DP pixel clock, which can be off exactly when a plug has to be
> caught, so the connector is also polled and the interrupt path re-reads
> the live level when it does fire.
> 
> Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> ---
>  drivers/gpu/drm/spacemit/Kconfig            |   19 +
>  drivers/gpu/drm/spacemit/Makefile           |    3 +
>  drivers/gpu/drm/spacemit/spacemit_inno_dp.c | 2443 +++++++++++++++++++++++++++
>  drivers/gpu/drm/spacemit/spacemit_inno_dp.h |  328 ++++
>  4 files changed, 2793 insertions(+)
> 
[...]
> diff --git a/drivers/gpu/drm/spacemit/spacemit_inno_dp.c b/drivers/gpu/drm/spacemit/spacemit_inno_dp.c
> new file mode 100644
> index 000000000000..e88731d9b18b
> --- /dev/null
> +++ b/drivers/gpu/drm/spacemit/spacemit_inno_dp.c
> @@ -0,0 +1,2443 @@
[...]
> +static int inno_dp_probe(struct platform_device *pdev)
> +{
[...]
> +	dp->reset = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);

Since this is only asserted in probe and deasserted in remove, you
could use devm_reset_control_get_optional_exclusive_deasserted() [1].

[1] https://docs.kernel.org/driver-api/reset.html#c.devm_reset_control_get_optional_exclusive_deasserted

> +	if (IS_ERR(dp->reset)) {
> +		ret = dev_err_probe(dev, PTR_ERR(dp->reset),
> +				    "failed to get reset\n");
> +		return ret;
> +	}
> +
> +	dp->pxclk = devm_clk_get(dev, "pxclk");
> +	if (IS_ERR(dp->pxclk)) {
> +		ret = dev_err_probe(dev, PTR_ERR(dp->pxclk),
> +				    "failed to get pxclk\n");
> +		return ret;
> +	}
> +
> +	if (dp->edp_mode) {
> +		dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
> +		/*
> +		 * OP_DETECT is required: without it
> +		 * drm_bridge_connector_detect() hard-codes CONNECTED for any
> +		 * eDP connector and fbdev wedges at bind.
> +		 */
> +		dp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> +				 DRM_BRIDGE_OP_HPD;
> +	} else {
> +		dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
> +		/*
> +		 * No OP_HPD: the HPD interrupt is gated by the DP pixel clock.
> +		 * Leaving it out marks the connector POLL_CONNECT |
> +		 * POLL_DISCONNECT instead.
> +		 */
> +		dp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> +				 DRM_BRIDGE_OP_MODES;
> +	}
> +
> +	if (dp->reset) {

This check is not necessary, reset_control_deassert() handles NULL
pointers.

> +		ret = reset_control_deassert(dp->reset);

If the _deasserted() variant is used above, this can be removed and the
reset control doesn't need to be stored in dp.

> +		if (ret) {
> +			dev_err(dev, "failed to deassert reset: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
[...]
> +	return 0;
> +
> +err_clk:
> +	clk_disable_unprepare(dp->pxclk);
> +err_reset:
> +	if (dp->reset)
> +		reset_control_assert(dp->reset);

Same as above. Remove the unnecessary check or manual assertion
entirely.

> +
> +	return ret;
> +}
> +
> +static void inno_dp_remove(struct platform_device *pdev)
> +{
> +	struct spacemit_dp_dev *dp = platform_get_drvdata(pdev);
> +
> +	component_del(&pdev->dev, &spacemit_dp_ops);
> +
> +	if (dp) {
> +		clk_disable_unprepare(dp->pxclk);
> +		if (dp->reset)
> +			reset_control_assert(dp->reset);

Same as above.

> +	}
> +}

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
