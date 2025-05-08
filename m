Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DE3C3ABC0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 09:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0C46A+V3MGUjsf995JgrZU5R93Kpc5XhCW8WP+pgvkU=; b=qGlvlPTicu7pEd
	wvIy5mm1OxFYwW0BiA1zkgcgZj2GKJmRKXSbQ+jEZkZR2/n9FdOaLZObU9vZMx3mopWtVAUs7+a9k
	4mrwWNhKYQaRRrYcNPkp4B5nj9gsY873yN4ThcVbpQ2d24FTndk+Y21Saz46mRCwzvhTqDRjsg4bO
	QvmQcn9sY+HCZCcRNG8VNhETOjjSMD1VGVOhdy5LtBU/UZuJhDNjZAjVnki//t6dcBrGOSB0YPHEO
	OWQO2dA/t4a8Cxa1M96E6q6xjbZ2a/etWzA9FNmtZofzy6Oc9XqOuUh6CGbSz5KTBhvGtAtW3fK7u
	E51cZ0j3JiALCE3Rtr+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxfz-00000000H4J-1lcT;
	Thu, 08 May 2025 09:36:23 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxIB-00000000DUv-2GT0
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 09:11:48 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCxHz-0001pr-Kw; Thu, 08 May 2025 11:11:35 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCxHz-001hZ8-0z;
	Thu, 08 May 2025 11:11:35 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCxHz-0003qM-0i;
	Thu, 08 May 2025 11:11:35 +0200
Message-ID: <a3febd3718397d7cf067e2ae637c2d633388f89f.camel@pengutronix.de>
Subject: Re: [PATCH v6 5/6] reset: spacemit: define three more CCUs
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr,  dlan@gentoo.org
Cc: heylenay@4d2.org, inochiama@outlook.com, guodong@riscstar.com, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Thu, 08 May 2025 11:11:35 +0200
In-Reply-To: <20250506210638.2800228-6-elder@riscstar.com>
References: <20250506210638.2800228-1-elder@riscstar.com>
	 <20250506210638.2800228-6-elder@riscstar.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_021147_588957_ECA23BA0 
X-CRM114-Status: GOOD (  16.93  )
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

On Di, 2025-05-06 at 16:06 -0500, Alex Elder wrote:
> Three more CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
> Define these resets so they can be used.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c | 24 ++++++++++++++++
>  drivers/reset/spacemit/k1.c   | 54 +++++++++++++++++++++++++++++++++++
>  include/soc/spacemit/ccu_k1.h | 30 +++++++++++++++++++
>  3 files changed, 108 insertions(+)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 6b1845e899e5f..bddc83aff23cd 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -939,6 +939,18 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
>  	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
>  };
>  
> +static const struct spacemit_ccu_data k1_ccu_rcpu_data = {

The /* No clocks in the RCPU CCU */ comment belongs here, instead of in
the reset driver.

I wonder though, if these units have no clocks, why are they called
CCUs? It doesn't make much sense to me to add their compatibles to the
ccu-k1 driver only to load the reset aux driver. Why not just add a
platform driver next to the aux driver in reset-spacemit.ko for these
three?

> +	.reset_name	= "rcpu-reset",
> +};
> +
> +static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
> +	.reset_name	= "rcpu2-reset",
> +};
> +
> +static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
> +	.reset_name	= "apbc2-reset",
> +};
> +
>  static int spacemit_ccu_register(struct device *dev,
>  				 struct regmap *regmap,
>  				 struct regmap *lock_regmap,
> @@ -1106,6 +1118,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
>  		.compatible	= "spacemit,k1-syscon-apmu",
>  		.data		= &k1_ccu_apmu_data,
>  	},
> +	{
> +		.compatible	= "spacemit,k1-syscon-rcpu",
> +		.data		= &k1_ccu_rcpu_data,
> +	},
> +	{
> +		.compatible	= "spacemit,k1-syscon-rcpu2",
> +		.data		= &k1_ccu_rcpu2_data,
> +	},
> +	{
> +		.compatible	= "spacemit,k1-syscon-apbc2",
> +		.data		= &k1_ccu_apbc2_data,
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
> diff --git a/drivers/reset/spacemit/k1.c b/drivers/reset/spacemit/k1.c
> index 19a34f151b214..27434a1928261 100644
> --- a/drivers/reset/spacemit/k1.c
> +++ b/drivers/reset/spacemit/k1.c
> @@ -137,6 +137,57 @@ static const struct ccu_reset_controller_data k1_apmu_reset_data = {
>  	.count		= ARRAY_SIZE(apmu_resets),
>  };
>  
> +static const struct ccu_reset_data rcpu_resets[] = {
> +	[RESET_RCPU_SSP0]	= RESET_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_I2C0]	= RESET_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_UART1]	= RESET_DATA(RCPU_UART1_CLK_RST, 0, BIT(0)),
> +	[RESET_RCPU_IR]		= RESET_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_CAN]	= RESET_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_UART0]	= RESET_DATA(RCPU_UART0_CLK_RST, 0, BIT(0)),
> +	[RESET_RCPU_HDMI_AUDIO]	= RESET_DATA(AUDIO_HDMI_CLK_CTRL, 0, BIT(0)),
> +};
> +
> +static const struct ccu_reset_controller_data k1_rcpu_reset_data = {
> +	/* No clocks in the RCPU CCU */

This information is not useful in the reset driver.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
