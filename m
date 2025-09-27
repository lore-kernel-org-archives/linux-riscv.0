Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6AECAC5B9
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Sep 2025 10:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gsw3YqX6P6BCtzx9XPw3UW98y3XylzxQFzQtBH183EM=; b=0cO8mc8n8sp1sW
	9g+SsjZJoXBL0xHDkhHtf1PakrxA/bE2N+8f1zaoX46HxyUaN+2K2NeIk8L4iuguFdtTAFB621ExH
	KFvZjOjVXzFrlA96lxqLUzFNFdoHNafm+PcK/lG9cJighxQrmGheWtantjJ9hyQbmc33iQpZKa+80
	fGaK3dGcdDZ04uyL+9gPBBQVol368AJwdW9651Buf8YZsp6qw6pOJYfL8a5dylYllxsIwohzKGBvO
	+rAT/8WFmpGK/nfGGx2PWQzNZuXrXec68HUJ6cDN8DUuU6JX49QIsULDjT2nDwZmzO4FKkkpUqG8y
	hdMvl/r7szyjinX+QuSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2SbM-000000099Ve-255G;
	Sat, 27 Sep 2025 10:56:28 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2SbJ-000000099VD-3UUr
	for linux-riscv@lists.infradead.org;
	Sat, 27 Sep 2025 10:56:26 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 12DB133BEAD;
	Sat, 27 Sep 2025 10:56:21 +0000 (UTC)
Date: Sat, 27 Sep 2025 18:56:16 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <20250927105616-GYB1338789@gentoo.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_035625_900529_C763C54A 
X-CRM114-Status: GOOD (  20.50  )
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

On 10:02 Thu 25 Sep     , Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C with interrupts disabled.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 164 +++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 140 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 6b918770e612e098b8ad17418f420d87c94df166..e403eb7d6f329f4fe5c5242f94cc21094dff105c 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -97,6 +97,9 @@
>  
..
>  static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>  {
>  	unsigned long time_left;
> @@ -310,10 +368,28 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>  
>  		reinit_completion(&i2c->complete);
>  
> -		spacemit_i2c_start(i2c);
> +		if (i2c->is_pio) {
> +			/* We disable the interrupt to avoid unintended spurious triggers. */
the comment is suspicious, and seems wrong..
> +			disable_irq(i2c->irq);
> +
I guess this doesn't disable interrupt in the hardware layer, it will still
fire interrupt once enabled, so instead of calling disable_irq(), why not
dealing with ISR setting of the controller? I mean those "IE bits"(interrupt
enableing) of ICR REGISTER, disabling them should prevent the interrupt
triggered?

> +			/*
> +			 * The K1 I2C controller has a quirk:
> +			 * when doing PIO transfers, the status register must be cleared
> +			 * of all other bits before issuing a START.
> +			 * Failing to do so will prevent the transfer from working properly.
> +			 */
> +			spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
this also doesn't seem correct to me, the irq status bit should be cleared once
interrupt occur, not dealing it here before sending msg, this seems a
wrong procedure

> +
> +			spacemit_i2c_start(i2c);
> +			time_left = spacemit_i2c_wait_pio_xfer(i2c);
> +
> +			enable_irq(i2c->irq);
> +		} else {
> +			spacemit_i2c_start(i2c);
> +			time_left = wait_for_completion_timeout(&i2c->complete,
> +								i2c->adapt.timeout);
> +		}
>  
> -		time_left = wait_for_completion_timeout(&i2c->complete,
> -							i2c->adapt.timeout);
>  		if (!time_left) {
>  			dev_err(i2c->dev, "msg completion timeout\n");
>  			spacemit_i2c_conditionally_reset_bus(i2c);
> @@ -341,6 +417,9 @@ static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
