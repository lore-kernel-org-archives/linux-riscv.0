Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612C2C369B5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 08:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AO7l54IDk4nElXCxaqFIYK+PuKOw2v1rBP30TC19e2Y=; b=GKeFJmfnWqKiz8
	G6e0HGkI0fUsPbDFDcKdqxSQK4Uk44F0qHbnqA+s63fJdP3fP4w9kw2i6BWca495p9h13GybjBFiD
	c0TBEN8IW6dQlfj8GBSorqk1hjEDhL7BPsZB0V6elR28O1oILRemXTy/BX3sL89HRBRv9nTIMhwjA
	Nm8PR6u8Nk0+2nc/2mqIUZUwO8vGzINNoKxuL2MCnM1ywgkNXXcBDvGXrvlGJqskw71KOTUTfikYs
	aPRORKppywVBQwR9gMg0KxFnezvLhO4miPSrnLnM6Zlpa1cAg8/bM83roG6G7vOk8c/RYoo7wj/uw
	E+jsYlDQHOkVhbdFNdog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bg8-000000050HI-36RU;
	Tue, 15 Apr 2025 08:30:00 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bZJ-00000004yOW-0PQE
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 08:22:58 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4bYu-0001z5-0U; Tue, 15 Apr 2025 10:22:32 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4bYs-000O14-3C;
	Tue, 15 Apr 2025 10:22:31 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4bYs-0003Kq-2s;
	Tue, 15 Apr 2025 10:22:30 +0200
Message-ID: <eee41968ecb0c16da214819b9a43e9dd881fcf13.camel@pengutronix.de>
Subject: Re: [PATCH v4 6/7] clk: spacemit: define new syscons with only
 resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, mturquette@baylibre.com,
 sboyd@kernel.org,  robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, heylenay@4d2.org, guodong@riscstar.com, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 15 Apr 2025 10:22:30 +0200
In-Reply-To: <20250414191715.2264758-7-elder@riscstar.com>
References: <20250414191715.2264758-1-elder@riscstar.com>
	 <20250414191715.2264758-7-elder@riscstar.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_012257_169848_A2201467 
X-CRM114-Status: GOOD (  16.03  )
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

On Mo, 2025-04-14 at 14:17 -0500, Alex Elder wrote:
> Enable support for three additional syscon CCUs which support reset
> controls but no clocks:  ARCPU, RCPU2, and APBC2.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c | 93 +++++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 7494c97c3c7ec..cd1a0668bd203 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -130,6 +130,36 @@
>  #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
>  #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
>  
> +/* RCPU register offsets */
> +#define RCPU_SSP0_CLK_RST		0x0028
> +#define RCPU_I2C0_CLK_RST		0x0030
> +#define RCPU_UART1_CLK_RST		0x003c
> +#define RCPU_CAN_CLK_RST		0x0048
> +#define RCPU_IR_CLK_RST			0x004c
> +#define RCPU_UART0_CLK_RST		0x00d8
> +#define AUDIO_HDMI_CLK_CTRL		0x2044
> +
> +/* RCPU2 register offsets */
> +#define RCPU2_PWM0_CLK_RST		0x0000
> +#define RCPU2_PWM1_CLK_RST		0x0004
> +#define RCPU2_PWM2_CLK_RST		0x0008
> +#define RCPU2_PWM3_CLK_RST		0x000c
> +#define RCPU2_PWM4_CLK_RST		0x0010
> +#define RCPU2_PWM5_CLK_RST		0x0014
> +#define RCPU2_PWM6_CLK_RST		0x0018
> +#define RCPU2_PWM7_CLK_RST		0x001c
> +#define RCPU2_PWM8_CLK_RST		0x0020
> +#define RCPU2_PWM9_CLK_RST		0x0024
> +
> +/* APBC2 register offsets */
> +#define APBC2_UART1_CLK_RST		0x0000
> +#define APBC2_SSP2_CLK_RST		0x0004
> +#define APBC2_TWSI3_CLK_RST		0x0008
> +#define APBC2_RTC_CLK_RST		0x000c
> +#define APBC2_TIMERS0_CLK_RST		0x0010
> +#define APBC2_KPC_CLK_RST		0x0014
> +#define APBC2_GPIO_CLK_RST		0x001c
> +
>  struct ccu_reset_data {
>  	u32 offset;
>  	u32 assert_mask;
> @@ -1177,6 +1207,57 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
>  	.reset_num	= ARRAY_SIZE(apmu_reset_data),
>  };
>  
> +static const struct ccu_reset_data rcpu_reset_data[] = {
> +	[RESET_RCPU_SSP0]	= RESET_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_I2C0]	= RESET_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_UART1]	= RESET_DATA(RCPU_UART1_CLK_RST, 0, BIT(0)),
> +	[RESET_RCPU_IR]		= RESET_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_CAN]	= RESET_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_UART0]	= RESET_DATA(RCPU_UART0_CLK_RST, 0, BIT(0)),
> +	[RESET_RCPU_HDMI_AUDIO]	= RESET_DATA(AUDIO_HDMI_CLK_CTRL, 0, BIT(0)),
> +};
> +
> +static struct spacemit_ccu_data k1_ccu_rcpu_data = {

Could be const.

> +	/* No clocks in the RCPU CCU */
> +	.reset_data	= rcpu_reset_data,
> +	.reset_num	= ARRAY_SIZE(rcpu_reset_data),
> +};
> +
> +static const struct ccu_reset_data rcpu2_reset_data[] = {
> +	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM9]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +};
> +
> +static struct spacemit_ccu_data k1_ccu_rcpu2_data = {

const

> +	/* No clocks in the RCPU2 CCU */
> +	.reset_data	= rcpu2_reset_data,
> +	.reset_num	= ARRAY_SIZE(rcpu2_reset_data),
> +};
> +
> +static const struct ccu_reset_data apbc2_reset_data[] = {
> +	[RESET_APBC2_UART1]	= RESET_DATA(APBC2_UART1_CLK_RST, BIT(2), (0)),
> +	[RESET_APBC2_SSP2]	= RESET_DATA(APBC2_SSP2_CLK_RST, BIT(2), (0)),
> +	[RESET_APBC2_TWSI3]	= RESET_DATA(APBC2_TWSI3_CLK_RST, BIT(2), (0)),
> +	[RESET_APBC2_RTC]	= RESET_DATA(APBC2_RTC_CLK_RST,	BIT(2), (0)),
> +	[RESET_APBC2_TIMERS0]	= RESET_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), (0)),
> +	[RESET_APBC2_KPC]	= RESET_DATA(APBC2_KPC_CLK_RST,	BIT(2), (0)),
> +	[RESET_APBC2_GPIO]	= RESET_DATA(APBC2_GPIO_CLK_RST, BIT(2), (0)),

Superfluous parentheses.

> +};
> +
> +static struct spacemit_ccu_data k1_ccu_apbc2_data = {

const

> +	/* No clocks in the APBC2 CCU */
> +	.reset_data	= apbc2_reset_data,
> +	.reset_num	= ARRAY_SIZE(apbc2_reset_data),
> +};
> +
>  static int spacemit_reset_update(struct reset_controller_dev *rcdev,
>  				 unsigned long id, bool assert)
>  {
> @@ -1351,6 +1432,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
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

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
