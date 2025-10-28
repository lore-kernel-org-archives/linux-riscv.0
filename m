Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA5CCCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 08:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q25vxNm6k9bdj7gY868DLjITkLupQHj7/dAAyGufyBI=; b=AOtk6puUIJnbE+
	7mSXMzr7McJzmkD0lCl2ukW82CYl4Tua3sZzLpTrStGH31bVQEq9yRbprn/qNruqEUZRS22LUoezf
	XtjLNRyhhc/sFlPcHdr2K+wzNxNV/HHBvf/uvDcHekLENynXgRrTIx3CsO8Wei1KNdu6A8nEuqI0+
	1J48DDPrPrnZDBPu1H02dtPkYIi8rQV9uVGHM/8sBRliQ2akWf7zPc79CG6WKkbH35xAvTocRDejx
	LxHbw++/rAoltICIFvHJSzghjCtPGJNafUaG20K8QZsIUT0prA4FaeHGJWId8nVPj53535519BfWF
	mNV7W5i6t7Y6PV2wuK7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeuI-0000000FWWe-3sDx;
	Tue, 28 Oct 2025 08:18:18 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeuG-0000000FWVY-3wWM
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 08:18:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vDeu0-000287-GT; Tue, 28 Oct 2025 09:18:00 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vDetx-005qNe-2y;
	Tue, 28 Oct 2025 09:17:57 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vDetx-000000002YE-3YQN;
	Tue, 28 Oct 2025 09:17:57 +0100
Message-ID: <36d28431c41ec9ed86487135d81e50b136ee0fae.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/6] reset: anlogic: add support for Anlogic DR1V90
 resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Junhui Liu <junhui.liu@pigmoral.tech>, Michael Turquette
	 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	 <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Date: Tue, 28 Oct 2025 09:17:57 +0100
In-Reply-To: <20251026-dr1v90-cru-v2-4-43b67acd6ddd@pigmoral.tech>
References: <20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech>
	 <20251026-dr1v90-cru-v2-4-43b67acd6ddd@pigmoral.tech>
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_011816_981306_C302FBBB 
X-CRM114-Status: GOOD (  14.83  )
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

On So, 2025-10-26 at 22:00 +0800, Junhui Liu wrote:
> Add reset controller support for the Anlogic DR1V90 SoC, which is an
> auxiliary device associated with the Clock and Reset Unit (CRU). All
> resets are active-low.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/reset/Kconfig        |   9 +++
>  drivers/reset/Makefile       |   1 +
>  drivers/reset/reset-dr1v90.c | 135 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 145 insertions(+)
> 
[...]
> diff --git a/drivers/reset/reset-dr1v90.c b/drivers/reset/reset-dr1v90.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..eb9064e3ab454fb39adc1ad426f458e39bb6169e
> --- /dev/null
> +++ b/drivers/reset/reset-dr1v90.c
> @@ -0,0 +1,135 @@
[...]
> +static const struct dr1v90_reset_map dr1v90_resets[] = {
> +	[RESET_OCM]		= { 0x74, BIT(4)},
[...]
> +	[RESET_NIC_HP0]		= { 0x78, BIT(0)},
[...]
> +	[RESET_USB0]		= { 0x7C, BIT(0)},

The registers 0x74, 0x78, and 0x7C are exclusively used for resets?

[...]
> +};
> +
> +static int dr1v90_reset_control_update(struct reset_controller_dev *rcdev,
> +				       unsigned long id, bool assert)
> +{
> +	struct dr1v90_reset_controller *rstc = to_dr1v90_reset_controller(rcdev);
> +	u32 offset = dr1v90_resets[id].offset;
> +	u32 bit = dr1v90_resets[id].bit;
> +	u32 reg;
> +
> +	reg = readl(rstc->base + offset);
> +	if (assert)
> +		reg &= ~bit;
> +	else
> +		reg |= bit;
> +	writel(reg, rstc->base + offset);

There should be a lock around this read-modify-write access.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
