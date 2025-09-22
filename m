Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714AECAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 20:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E+6DBjqOInHr6BrR2132e+XEi1Jk1/9L0+G/FTQgphg=; b=K4XoQPXWeRjCEE
	7mg88Lk5y3AIn0rtey1y7GXomrqpQXSGe26eahEIMGTEzE6RcCzyKhraGs/+TUWcFTVMpS/0+uk3K
	BR3qkWhsk0lsPtmzVXfI5yPy9Dbw7TzoVfGsLj/aPoeygbIgQ0KBSTYf7fhg1piEMXsjVxYBVFTDl
	knhfeIif+r4iwjNVDwqMhDyOCT2tzXNA6icjnPkOGU3dwNgEfWVbQx1PouNUvKrisTIL+29+r6p03
	SPjNnITeUvG5KQ2Quu+WCaf3LjEKT1Oy0n5kUq5t62sSYhzjjZAkqx9dPtZ6Xnj1Z7El9ueHoNPZA
	HweMlP/gAtvUTXxF2vsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0na7-0000000BVPK-2wM0;
	Mon, 22 Sep 2025 20:56:19 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0na4-0000000BVLg-3E7P
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 20:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=QUOgJuOydaJvvEUKF3VgdXsY388ThHK01o8nAArGd1M=; b=DLF2S+l7LuH32J//NQoMt11fiQ
	/5lCo/GwSxHpqqv8/unALb7f59u5iZm2ClnYJAYp1gFl3nsQBRSk+Wrv4lSBchgydEk+DT441RiLw
	Dv7dWf7a+/LkkTUr27+JgAGpfGaFeGNXHhC8IqirC119WSqgRt2RPchtM1w80tskOimkzy8gciPDS
	UsCSupsGCQPeTLMQpwpM5WTCAr+FRUB2uwHCsUDDqVWMPNYe9/SZEoEx14iJCvu6H7jT86xXvfxRt
	d/n3e3b1jKdhvqciN6XCSmKhkQyIrvNcu0w8LeboneK/BGC7tMRO5P67HEEEPSAms57m7k/gdROgg
	rYd7DZVA==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v0nZz-00AlX1-0H;
	Mon, 22 Sep 2025 22:56:11 +0200
Date: Mon, 22 Sep 2025 22:56:10 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 5/6] i2c: spacemit: ensure SDA is released after bus reset
Message-ID: <aNG36jhaWN-mtgMm@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-5-e59bea02d680@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250827-k1-i2c-atomic-v1-5-e59bea02d680@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_135616_812290_3FFCD1B0 
X-CRM114-Status: GOOD (  25.05  )
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

On 2025-08-27 15:39, Troy Mitchell wrote:
> After performing a conditional bus reset, the controller must ensure
> that the SDA line is actually released.
> 
> Previously, the reset routine only performed a single check,
> which could leave the bus in a locked state in some situations.
> 
> This patch introduces a loop that toggles the reset cycle and issues
> a reset request up to SPACEMIT_BUS_RESET_CLK_CNT_MAX times, checking
> SDA after each attempt. If SDA is released before the maximum count,
> the function returns early. Otherwise, a warning is emitted.
> 
> This change improves bus recovery reliability.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 4d78ee7b6929ee43771e500d4f85d9e55e68b221..d2c0d20d19ba73baa8b2e9a6acb02b2cc3b7243f 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2024-2025 Troy Mitchell <troymitchell988@gmail.com>
>   */
>  
> +#include <linux/bitfield.h>
>   #include <linux/clk.h>
>   #include <linux/i2c.h>
>   #include <linux/iopoll.h>
> @@ -26,7 +27,8 @@
>  #define SPACEMIT_CR_MODE_FAST    BIT(8)		/* bus mode (master operation) */
>  /* Bit 9 is reserved */
>  #define SPACEMIT_CR_UR           BIT(10)	/* unit reset */
> -/* Bits 11-12 are reserved */
> +#define SPACEMIT_CR_RSTREQ	 BIT(11)	/* i2c bus reset request */
> +/* Bit 12 is reserved */
>  #define SPACEMIT_CR_SCLE         BIT(13)	/* master clock enable */
>  #define SPACEMIT_CR_IUE          BIT(14)	/* unit enable */
>  /* Bits 15-17 are reserved */
> @@ -78,6 +80,7 @@
>  					SPACEMIT_SR_ALD)
>  
>  #define SPACEMIT_RCR_SDA_GLITCH_NOFIX		BIT(7)		/* bypass the SDA glitch fix */
> +#define SPACEMIT_RCR_FIELD_RST_CYC		GENMASK(3, 0)	/* bypass the SDA glitch fix */

The comment here seems wrong, datasheet says "The cycles of SCL during 
bus reset."

>  /* SPACEMIT_IBMR register fields */
>  #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
> @@ -91,6 +94,8 @@
>  
>  #define SPACEMIT_SR_ERR	(SPACEMIT_SR_BED | SPACEMIT_SR_RXOV | SPACEMIT_SR_ALD)
>  
> +#define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
> +
>  enum spacemit_i2c_state {
>  	SPACEMIT_STATE_IDLE,
>  	SPACEMIT_STATE_START,
> @@ -163,6 +168,7 @@ static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
>  static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
>  {
>  	u32 status;
> +	u8 clk_cnt;
>  
>  	/* if bus is locked, reset unit. 0: locked */
>  	status = readl(i2c->base + SPACEMIT_IBMR);
> @@ -172,6 +178,21 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
>  	spacemit_i2c_reset(i2c);
>  	usleep_range(10, 20);
>  
> +	for (clk_cnt = 0; clk_cnt < SPACEMIT_BUS_RESET_CLK_CNT_MAX; clk_cnt++) {
> +		status = readl(i2c->base + SPACEMIT_IBMR);
> +		if (status & SPACEMIT_BMR_SDA)
> +			break;

What about just adding the return here instead of checking clk_cnt 
below?

> +
> +		/* There's nothing left to save here, we are about to exit */
> +		writel(FIELD_PREP(SPACEMIT_RCR_FIELD_RST_CYC, 1),
> +		       i2c->base + SPACEMIT_IRCR);
> +		writel(SPACEMIT_CR_RSTREQ, i2c->base + SPACEMIT_ICR);
> +		usleep_range(20, 30);
> +	}
> +
> +	if (clk_cnt < SPACEMIT_BUS_RESET_CLK_CNT_MAX)
> +		return;
> +
>  	/* check sda again here */
>  	status = readl(i2c->base + SPACEMIT_IBMR);
>  	if (!(status & SPACEMIT_BMR_SDA))

Once we have exited the loop, I am not sure we should check SDA once 
more, maybe just display the error message directly.

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
