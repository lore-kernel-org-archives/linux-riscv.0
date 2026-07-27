Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A71C531FC
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 07:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpYuTtBgw9N0Nni0W7JqpylfZHaT3GReQRDYITDIYcs=; b=wWnd47CAfF2q1S
	G4Lhs6gmB5V3cS1Fxu0l3OTb7JMMojvFDYL1O7mKaKkarv2H0fCapR9tVxrk5G9wah9Jq4INJNJHQ
	YLxat3EoiF5nJnX/ZP9Pz0PuphHLpUfXqtT0k9KS9qsC6W5n5gPzv081qd80sBJLDdtJzsBoGuJPd
	lQcfXFr6j/NEZV0gn8/DyOVO2KzDktOsI/eETkB+jT3Q7Al74kvKOAf9wf7E3ABvkUpk1ff/NBrNm
	G6YzJptGWMZWhbkjX/rRGeUwRKtiUdTYlsKT6omt8QpIaJo/LpR4uShejmTxGF3+QH0+Z/FdHSMiU
	cMm+GUz27R/kMdoJKuGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFsF-000000028X4-2pIS;
	Mon, 27 Jul 2026 07:35:43 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFsC-000000028VI-2L9P;
	Mon, 27 Jul 2026 07:35:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E504A202053;
	Mon, 27 Jul 2026 09:35:35 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1woFs7-001VMT-2c;
	Mon, 27 Jul 2026 09:35:35 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1woFs7-000000006sn-2xjW;
	Mon, 27 Jul 2026 09:35:35 +0200
Message-ID: <3d4204dbd1c73d50193144d1944d8237c625f6e3.camel@pengutronix.de>
Subject: Re: [PATCH RESEND 08/17] drm/spacemit: add Saturn DPU core types,
 cmdlist and display MMU
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
Date: Mon, 27 Jul 2026 09:35:35 +0200
In-Reply-To: <20260725-k3-display-v1-8-6de34d80e86c@gmail.com>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
	 <20260725-k3-display-v1-8-6de34d80e86c@gmail.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_003540_752691_DE5B33F4 
X-CRM114-Status: GOOD (  14.34  )
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
> Register programming of the Saturn DPU is batched: the driver builds
> per-module register lists in memory and the hardware command-list
> engine replays them at frame boundaries, while scanout buffers are
> mapped through the DPU's private address translation unit (DMMU)
> rather than scanned out by physical address.
> 
> Add the shared driver types, the MMIO field accessors, the trace
> events, the command-list builder and the DMMU table code. Some DPU
> configuration registers are write-only, so a read-modify-write would
> corrupt neighbouring fields; byte- and halfword-aligned fields are
> therefore written at their native width instead.
> 
> Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> ---
>  drivers/gpu/drm/spacemit/dpu/dpu_saturn.h   |  35 +++
>  drivers/gpu/drm/spacemit/dpu/dpu_trace.h    | 350 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/spacemit/spacemit_cmdlist.c | 304 ++++++++++++++++++++++++
>  drivers/gpu/drm/spacemit/spacemit_cmdlist.h | 146 ++++++++++++
>  drivers/gpu/drm/spacemit/spacemit_crtc.h    | 259 ++++++++++++++++++++
>  drivers/gpu/drm/spacemit/spacemit_dmmu.c    | 103 ++++++++
>  drivers/gpu/drm/spacemit/spacemit_dmmu.h    |  40 ++++
>  drivers/gpu/drm/spacemit/spacemit_dpu_reg.h | 108 +++++++++
>  drivers/gpu/drm/spacemit/spacemit_drm.h     |  68 ++++++
>  9 files changed, 1413 insertions(+)
> 
[...]
> diff --git a/drivers/gpu/drm/spacemit/spacemit_cmdlist.h b/drivers/gpu/drm/spacemit/spacemit_cmdlist.h
> new file mode 100644
> index 000000000000..d5acdbeb3b0e
> --- /dev/null
> +++ b/drivers/gpu/drm/spacemit/spacemit_cmdlist.h
> @@ -0,0 +1,146 @@
[...]
> +struct spacemit_crtc {
> +	struct device *dev;
> +	struct drm_crtc crtc;
> +	const struct dpu_core_ops *core;
> +	struct dpu_mmu_tbl mmu_tbl;
> +	int dev_id;
> +	int irq_online;
> +	struct timer_list cfg_rdy_timer;
> +
> +	bool is_1st_f;
> +	bool first_modeset;
> +	struct dpu_clk_context clk_ctx;
> +	u32 aclk;
> +	u32 out_format;
> +
> +	struct reset_control *mclk_reset;
> +	struct reset_control *lcd_reset;
> +	struct reset_control *esc_reset;
> +	struct reset_control *aclk_reset;
> +	struct reset_control *dsc_reset;

Why are these duplicated from spacemit_drm_private?
dpu_pm_suspend/resume() in patch 10 have access to priv.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
