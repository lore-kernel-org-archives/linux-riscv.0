Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD941C83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 10:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6PUX2yRW0LY19i+zuvZboj7EZGtZXHc0Hs8xJC/1Pno=; b=mq1SVLO/SxGMgt
	njFu0eIa0r3qZAKzDGxiTedSLtauTdyErjS6lL3nCgsL5klDwCI9rSPPgZrgnbKRHcIkf5o+8qy9G
	uVs36t5fNAOQi+28SR/xBLMrRB3i2ekR4YlID0PhL7MyyVXrmKLccK3Zzu/rjlb79umaz0nJuPXqy
	9/O4YCx6aDI5lcqeod/uGFgwN+JJF/5Yo9Edmgv5zhC3oaefdzae7hHo93V7R2QM27dkMY1PojdvC
	WS559UMvJy/CVzWRBd+csPvxvuLoavueJNGzUV2wpfNXQ7qEPL+tdNqgxSQdFvB+S7OE7JYZbvDBp
	o+LUhcf87OUqAraIa/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAfD-0000000ERPR-1Ola;
	Fri, 11 Jul 2025 10:07:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9w4-0000000EHqI-3wk1
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 09:20:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 45FDB61132;
	Fri, 11 Jul 2025 09:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD17C4CEF5;
	Fri, 11 Jul 2025 09:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752225652;
	bh=ljGZUkwu7/bMzuB6R6jei6eeG2QtIMDml2mCoGRDTj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VY4pYBtN8lnxbpJ+5q/R4BGHr6JoZIz+Bn79H9uX3gcWEz1rlmbz0dIthc4/2AaS/
	 X9o1EoUnXv31C/HJIy58EWfCPU3L0DZXPBNRTZL2zKyB0ylDbsYWqXjKWVEkaWGws6
	 yXXFyeY9Pm/A0xHn70Sd436+USpK9YXf9M0OUDb4fBTl0H16RIeL7Y8aWlFLf/83fB
	 xMWmNmN09av7ZlmccUbm5vIBPPUwqmcisWoMvVqEK40rVmkp/lqA2VfJpWE4TYlMNB
	 NHC34a+NZAaECbNqKx8GztyEjC7nzAn68rbHzn1P6jltkPy05x2xKBOgONT8in2Y4U
	 HVyP4hLKvjrZg==
Date: Fri, 11 Jul 2025 11:20:48 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] i2c: spacemit: configure ILCR for accurate SCL frequency
Message-ID: <bf6nkxdfctgz2tacf3vm6tv4qhd72vbqj52gu6kt2fc5erltkw@nufl7i3bddkb>
References: <20250710-k1-i2c-ilcr-v1-1-188d1f460c7d@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250710-k1-i2c-ilcr-v1-1-188d1f460c7d@linux.spacemit.com>
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

> - #include <linux/clk.h>
> - #include <linux/i2c.h>
> - #include <linux/iopoll.h>
> - #include <linux/module.h>
> - #include <linux/of_address.h>
> - #include <linux/platform_device.h>
> +#include "linux/bits.h"

this should be <linux/bits.h>

> +#include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>

Is the diff a bit noisy or am I failing to see some differences?

>  /* spacemit i2c registers */
>  #define SPACEMIT_ICR		 0x0		/* Control register */
>  #define SPACEMIT_ISR		 0x4		/* Status register */
>  #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
> +#define SPACEMIT_ILCR		 0x10		/* Load Count Register */
>  #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */

...

> +static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long parent_rate)

here the alignment is a bit off.

> +{
> +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
> +	u32 lv, lcr;
> +
> +	lv = DIV_ROUND_UP(parent_rate, rate);

do we want to sanity check the lv value here?

> +	lcr = readl(i2c->base + SPACEMIT_ILCR);
> +	if (i2c->mode == SPACEMIT_MODE_STANDARD) {
> +		lcr &= ~SPACEMIT_LCR_LV_STANDARD_MASK;
> +		lcr |= lv << SPACEMIT_LCR_LV_STANDARD_SHIFT;
> +	} else if (i2c->mode == SPACEMIT_MODE_FAST) {
> +		lcr &= ~SPACEMIT_LCR_LV_FAST_MASK;
> +		lcr |= lv << SPACEMIT_LCR_LV_FAST_SHIFT;
> +	}
> +	writel(lcr, i2c->base + SPACEMIT_ILCR);
> +
> +	return 0;
> +}
> +
> +static long spacemit_i2c_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long *parent_rate)

Alignment.

> +{
> +	u32 lv, freq;
> +
> +	lv = DIV_ROUND_UP(*parent_rate, rate);
> +	freq = DIV_ROUND_UP(*parent_rate, lv);
> +
> +	return freq;
> +}
> +
> +static unsigned long spacemit_i2c_clk_recalc_rate(struct clk_hw *hw,
> +						unsigned long parent_rate)

alignment.

> +{

...

> @@ -519,15 +636,13 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>  		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
>  
>  	/* For now, this driver doesn't support high-speed. */
> -	if (!i2c->clock_freq || i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> -			 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
> -		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
> -	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> -			 i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
> -		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
> -	}
> +	if (i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ &&
> +	    i2c->clock_freq <= SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
> +		i2c->mode = SPACEMIT_MODE_FAST;
> +	else if (i2c->clock_freq && i2c->clock_freq <= SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ)
> +		i2c->mode = SPACEMIT_MODE_STANDARD;
> +	else
> +		return -EINVAL;

Should we print an error here? And how likely is this case to
happen? Perhaps we can force the mode even if the frequency is
off and move forward instead of forcing the failure.

Andi

>  
>  	i2c->dev = &pdev->dev;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
