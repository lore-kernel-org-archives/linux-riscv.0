Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57831CAC5B5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3YiN6DW7hJgZa2ff70yqb1uU6PRE8lKJ/9EqJ09lflI=; b=EeUduHCi7Qh/Oo
	Hx9ihzGtWejYfbbO+e94PhJ/ugo/V4etaShZfDnDlPEcARhXUlt9DX/dEPxC2urA3REF7KAOlzZp3
	BY8Ou7SUjMwSJj2K7pWrED2FQlopAhPwO2r1MFJUSrC3p7vK23XEliJ8wSKyEANW0gem5p8avmD0L
	zwEAqdUTHTWhFpBjUbjta2LXKFHIJNA19CtpIF06wTjuX7uUDmzc2V0iIuer8eay5SxCJxqK/DKFD
	WO2fLLPqbIp7W0A0OL7TfdCotavpezz3zhvUj+w/vJH1aiGAvyN6ypKzY9FQJZUlpa+tX303kX6VY
	5PbSIqBJ5VTUkCHoECTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2pBw-0000000F6Lt-2Txs;
	Sun, 28 Sep 2025 11:03:44 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2pBt-0000000F6K0-49N1
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 11:03:43 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D4763340D20;
	Sun, 28 Sep 2025 11:03:37 +0000 (UTC)
Date: Sun, 28 Sep 2025 19:03:27 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <20250928110327-GYA1346428@gentoo.org>
References: <20250814-k1-i2c-ilcr-v3-1-317723e74bcd@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250814-k1-i2c-ilcr-v3-1-317723e74bcd@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_040342_070874_B254C865 
X-CRM114-Status: GOOD (  33.71  )
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

Hi Troy,

On 17:06 Thu 14 Aug     , Troy Mitchell wrote:
> The SpacemiT I2C controller's SCL (Serial Clock Line) frequency for
> master mode operations is determined by the ILCR (I2C Load Count Register).
> Previously, the driver relied on the hardware's reset default
> values for this register.
> 
> The hardware's default ILCR values (SLV=0x156, FLV=0x5d) yield SCL
> frequencies lower than intended. For example, with the default
> 31.5 MHz input clock, these default settings result in an SCL
> frequency of approximately 93 kHz (standard mode) when targeting 100 kHz,
> and approximately 338 kHz (fast mode) when targeting 400 kHz.
> These frequencies are below the 100 kHz/400 kHz nominal speeds.
> 
> This patch integrates the SCL frequency management into
> the Common Clock Framework (CCF). Specifically, the ILCR register,
> which acts as a frequency divider for the SCL clock, is now registered
> as a managed clock (scl_clk) within the CCF.
> 
> This patch also cleans up unnecessary whitespace
> in the included header files.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changelog in v3:
> - use MASK macro in `recalc_rate` function
> - rename clock name
> - Link to v2: https://lore.kernel.org/r/20250718-k1-i2c-ilcr-v2-1-b4c68f13dcb1@linux.spacemit.com
> 
> Changelog in v2:
> - Align line breaks.
> - Check `lv` in `clk_set_rate` function.
> - Force fast mode when SCL frequency is illegal or unavailable.
> - Change "linux/bits.h" to <linux/bits.h>
> - Kconfig: Add dependency on CCF.
> - Link to v1: https://lore.kernel.org/all/20250710-k1-i2c-ilcr-v1-1-188d1f460c7d@linux.spacemit.com/
> ---
>  drivers/i2c/busses/Kconfig  |   2 +-
>  drivers/i2c/busses/i2c-k1.c | 180 ++++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 167 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index c8d115b58e449b59a38339b439190dcb0e332965..1382b6c257fa4ba4cf5098d684c1bbd5e2636fd4 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -797,7 +797,7 @@ config I2C_JZ4780
>  config I2C_K1
>  	tristate "SpacemiT K1 I2C adapter"
>  	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	depends on OF
> +	depends on OF && COMMON_CLK
>  	help
>  	  This option enables support for the I2C interface on the SpacemiT K1
>  	  platform.
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index b68a21fff0b56b59fe2032ccb7ca6953423aad32..34b22969cf6789e99de58dd93dda6f0951069f85 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -3,17 +3,20 @@
>   * Copyright (C) 2024-2025 Troy Mitchell <troymitchell988@gmail.com>
>   */
>  
> - #include <linux/clk.h>
> - #include <linux/i2c.h>
> - #include <linux/iopoll.h>
> - #include <linux/module.h>
> - #include <linux/of_address.h>
> - #include <linux/platform_device.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
>  
>  /* spacemit i2c registers */
>  #define SPACEMIT_ICR		 0x0		/* Control register */
>  #define SPACEMIT_ISR		 0x4		/* Status register */
>  #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
> +#define SPACEMIT_ILCR		 0x10		/* Load Count Register */
>  #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
>  
>  /* SPACEMIT_ICR register fields */
> @@ -80,6 +83,19 @@
>  #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
>  #define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
>  
> +#define SPACEMIT_LCR_LV_STANDARD_SHIFT		0
> +#define SPACEMIT_LCR_LV_FAST_SHIFT		9
> +#define SPACEMIT_LCR_LV_STANDARD_WIDTH		9
> +#define SPACEMIT_LCR_LV_FAST_WIDTH		9
..
> +#define SPACEMIT_LCR_LV_STANDARD_MAX_VALUE	GENMASK(SPACEMIT_LCR_LV_STANDARD_WIDTH - 1, 0)
> +#define SPACEMIT_LCR_LV_FAST_MAX_VALUE		GENMASK(SPACEMIT_LCR_LV_FAST_WIDTH - 1, 0)
using GENMASK() makes people even confusing since it's not a mask, I would
suggest simply put value directly here, which is 0x1ff

> +#define SPACEMIT_LCR_LV_STANDARD_MASK		GENMASK(SPACEMIT_LCR_LV_STANDARD_SHIFT +\
> +						SPACEMIT_LCR_LV_STANDARD_WIDTH - 1,\
> +						SPACEMIT_LCR_LV_STANDARD_SHIFT)
same reason here, suggest simplify as
#define SPACEMIT_LCR_LV_STANDARD_MASK		GENMASK(8, 0)
which is more readable and maintenace friendly

> +#define SPACEMIT_LCR_LV_FAST_MASK		GENMASK(SPACEMIT_LCR_LV_FAST_SHIFT +\
> +						SPACEMIT_LCR_LV_FAST_WIDTH - 1,\
> +						SPACEMIT_LCR_LV_FAST_SHIFT)
> +
..[snip]
> +static struct clk *spacemit_i2c_register_scl_clk(struct spacemit_i2c_dev *i2c,
> +						 struct clk *parent)
> +{
> +	struct clk_init_data init;
> +	char name[32];
> +
> +	snprintf(name, sizeof(name), "%s_scl_clk", dev_name(i2c->dev));
> +
> +	init.name = name;
> +	init.ops = &spacemit_i2c_clk_ops;
> +	init.parent_data = (struct clk_parent_data[]) {
> +		{ .fw_name = "func" },
> +	};
> +	init.num_parents = 1;
..
> +	init.flags = 0;
I think you can drop this line, by simply init it at declaration
	struct clk_init_data init = {};
..
> +
> +	i2c->scl_clk_hw.init = &init;
> +
> +	return devm_clk_register(i2c->dev, &i2c->scl_clk_hw);
> +}
> +
>  static void spacemit_i2c_reset(struct spacemit_i2c_dev *i2c)
>  {
>  	writel(SPACEMIT_CR_UR, i2c->base + SPACEMIT_ICR);
> @@ -224,7 +352,7 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>  	 */
>  	val |= SPACEMIT_CR_DRFIE;
>  
> -	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
> +	if (i2c->mode == SPACEMIT_MODE_FAST)
>  		val |= SPACEMIT_CR_MODE_FAST;
>  
>  	/* disable response to general call */
> @@ -519,14 +647,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>  		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
>  
>  	/* For now, this driver doesn't support high-speed. */
> -	if (!i2c->clock_freq || i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> -			 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
> +	if (i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ &&
> +	    i2c->clock_freq <= SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> +		i2c->mode = SPACEMIT_MODE_FAST;
> +	} else if (i2c->clock_freq && i2c->clock_freq <= SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> +		i2c->mode = SPACEMIT_MODE_STANDARD;
> +	} else {
> +		dev_warn(i2c->dev, "invalid clock-frequency, using fast mode");
s/using../fallback to fast mode/

> +		i2c->mode = SPACEMIT_MODE_FAST;
>  		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
> -	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> -			 i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
> -		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
>  	}
>  
>  	i2c->dev = &pdev->dev;
> @@ -548,10 +677,33 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>  	if (IS_ERR(clk))
>  		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
>  
> +	i2c->scl_clk = spacemit_i2c_register_scl_clk(i2c, clk);
> +	if (IS_ERR(i2c->scl_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->scl_clk),
> +				     "failed to register scl clock\n");
> +
>  	clk = devm_clk_get_enabled(dev, "bus");
>  	if (IS_ERR(clk))
>  		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
you can use dev_err_ptr_probe()

>  
> +	ret = clk_set_rate_exclusive(i2c->scl_clk, i2c->clock_freq);
why use _exclusive_ API? is there multi consumers? can you explain?

> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to set exclusive rate for SCL clock");
> +
 

-- 
Yixun Lan (dlan)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
