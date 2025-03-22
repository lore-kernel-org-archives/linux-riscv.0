Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5F4C35FFC
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 16:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ett91bLhh/NQ0F4dtYOSKTQudnxIcpplodnl8nvLwY=; b=vQKYfnXS3aY6nE
	Gl8D1S/c2X50H5RkZqaBKsUW7Klmg5e5hrc4AJ7ftHfv+GRfVstg6BuVnW9+4GmUlcbIsD1nDvG6w
	kAsGnQeBBRZaLvXMRG9b+Jyqwq7r6DMV2ItR/xWKHuTfo5kjrgl4NuA3REtTV3xYB8HmEFcCqB/9I
	ks/EkRwqrPGPcYwqaNZK72GTSfhZN1/zCeTGoCMg4Avj2ueRaiMHGTzu37d9D2sb3OOBBI3WIHxmf
	t0xFhgcjBfBx1p8frt8xmqMF+Z5kFK0cUzdFM2k3NLaNRY+a82FwnDebq0CzbpW3yweHALGq8qW8h
	2EuqjMXPmfFOjNmpmesQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw1w0-000000006Ei-3Fss;
	Sat, 22 Mar 2025 16:42:56 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw1vx-000000006EI-24mu
	for linux-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 16:42:54 +0000
Received: from localhost (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3E8703431B5;
	Sat, 22 Mar 2025 16:42:51 +0000 (UTC)
Date: Sat, 22 Mar 2025 16:42:47 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heylenay@4d2.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 6/7] clk: spacemit: define new syscons with only
 resets
Message-ID: <20250322164247-GYD11633@gentoo>
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-7-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321151831.623575-7-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_094253_576390_BFDC8E47 
X-CRM114-Status: GOOD (  17.99  )
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

Hi Alex:

It occur to me it's a little odd to implemnt reset driver
for RCPU block, but after check with vendor the RCPU region can
be accessed both by ACPU and RCPU, then I'm fine with this.

ACPU - RISC-V Main CPU, with mmu, running Linux
RCPU - real time CPU, without mmu, running RT-OS

On 10:18 Fri 21 Mar     , Alex Elder wrote:
> Enable support for three additional syscon CCUs which support reset
> controls but no clocks:  ARCPU, RCPU2, and APBC2.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c | 106 ++++++++++++++++++++++++++++++++++
>  1 file changed, 106 insertions(+)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 17e321c25959a..bf5a3e2048619 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -130,6 +130,37 @@
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
> +/* XXX Next one is part of the AUD_AUDCLOCK region @ 0xc0882000 */
this comment looks odd, XXX?
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
>  struct spacemit_ccu_clk {
>  	int id;
>  	struct clk_hw *hw;
> @@ -1781,6 +1812,69 @@ static const struct k1_ccu_data k1_ccu_apmu_data = {
>  	.rst_data	= &apmu_reset_controller_data,
>  };
>  
> +static const struct ccu_reset_data rcpu_reset_data[] = {
> +	[RST_RCPU_SSP0]		= RST_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
> +	[RST_RCPU_I2C0]		= RST_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
> +	[RST_RCPU_UART1]	= RST_DATA(RCPU_UART1_CLK_RST,	0, BIT(0)),
> +	[RST_RCPU_IR]		= RST_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
> +	[RST_RCPU_CAN]		= RST_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
> +	[RST_RCPU_UART0]	= RST_DATA(RCPU_UART0_CLK_RST,	0, BIT(0)),
> +	[RST_RCPU_HDMI_AUDIO]	= RST_DATA(AUDIO_HDMI_CLK_CTRL,	0, BIT(0)),
> +};
> +
> +static const struct ccu_reset_controller_data rcpu_reset_controller_data = {
> +	.count		= ARRAY_SIZE(rcpu_reset_data),
> +	.data		= rcpu_reset_data,
> +};
> +
> +static struct k1_ccu_data k1_ccu_rcpu_data = {
> +	/* No clocks in the RCPU CCU */
> +	.rst_data	= &rcpu_reset_controller_data,
> +};
> +
> +static const struct ccu_reset_data rcpu2_reset_data[] = {
> +	[RST_RCPU2_PWM0]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
> +	[RST_RCPU2_PWM1]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
> +	[RST_RCPU2_PWM2]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
> +	[RST_RCPU2_PWM3]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
> +	[RST_RCPU2_PWM4]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
> +	[RST_RCPU2_PWM5]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
> +	[RST_RCPU2_PWM6]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
> +	[RST_RCPU2_PWM7]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
> +	[RST_RCPU2_PWM8]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
> +	[RST_RCPU2_PWM9]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
> +};
> +
> +static const struct ccu_reset_controller_data rcpu2_reset_controller_data = {
> +	.count		= ARRAY_SIZE(rcpu2_reset_data),
> +	.data		= rcpu2_reset_data,
> +};
> +
> +static struct k1_ccu_data k1_ccu_rcpu2_data = {
> +	/* No clocks in the RCPU2 CCU */
> +	.rst_data	= &rcpu2_reset_controller_data,
> +};
> +
> +static const struct ccu_reset_data apbc2_reset_data[] = {
> +	[RST_APBC2_UART1]	= RST_DATA(APBC2_UART1_CLK_RST,	BIT(2), (0)),
> +	[RST_APBC2_SSP2]	= RST_DATA(APBC2_SSP2_CLK_RST,	BIT(2), (0)),
> +	[RST_APBC2_TWSI3]	= RST_DATA(APBC2_TWSI3_CLK_RST,	BIT(2), (0)),
> +	[RST_APBC2_RTC]		= RST_DATA(APBC2_RTC_CLK_RST,	BIT(2), (0)),
> +	[RST_APBC2_TIMERS0]	= RST_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), (0)),
> +	[RST_APBC2_KPC]		= RST_DATA(APBC2_KPC_CLK_RST,	BIT(2), (0)),
> +	[RST_APBC2_GPIO]	= RST_DATA(APBC2_GPIO_CLK_RST,	BIT(2), (0)),
> +};
> +
> +static const struct ccu_reset_controller_data apbc2_reset_controller_data = {
> +	.count		= ARRAY_SIZE(apbc2_reset_data),
> +	.data		= apbc2_reset_data,
> +};
> +
> +static struct k1_ccu_data k1_ccu_apbc2_data = {
> +	/* No clocks in the RCPU2 CCU */
> +	.rst_data	= &apbc2_reset_controller_data,
> +};
> +
>  static struct ccu_reset_controller *
>  rcdev_to_controller(struct reset_controller_dev *rcdev)
>  {
> @@ -1959,6 +2053,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
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
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
