Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02222CAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 20:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/xnYyULHIM8OerWZfFIb/6B2Bvcdl80i0FgZuOjKLJI=; b=VYfv+66BpgGw18
	K4wKZmM95gTqOewVv+4EmxYzTujxAfV5IX6P42vFFWxFTbtCs7THfjxWSY9Ostrpi78vPiRxbwdjT
	r4Dk5farIktMQ+7NSY/0JYSlQwrzaIyettkLN8q7ODtTMN9Ly6tJtF3+uWo1BIIC6BYjyjIQRSFBD
	27Wy2PYYvLMbVL2V0DU+NPEyuTeK9d59ZrRpMdlD6x8WFWReX5UH6MEw4ibEt8YRDv1iw/epgjL08
	gU1i+hLDfZcM274+9fgIzmD71oxcfkOh7jzkCQu96sS0OnL4W4fU/ahPG/7d0/zOEXd8csziyiwS0
	oH/KVX2FW7r9zYwnUYMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nZu-0000000BVDW-0jfS;
	Mon, 22 Sep 2025 20:56:06 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nZs-0000000BVBW-0FG9
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 20:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=9/M25QqF3hrAvfV2pEYMvptZeJC6YyPZb9krRsEkPmg=; b=XDQqt0SmM3tdf1ro8bCYl/LJCO
	2tJJJhqELvRVwS+Qqwz4O+k8WURKU1kxiO75FJ6Bao31R81F0nEfQjX8qA4VK0L1Gu+hvMJOSOQPq
	MMgxBJBWQaxku+9ZOJ0hvBxSatHjUZdG1GJmYUMV7l5pd+UrhrwSVSRaSWfuOBULrvRFuWW+xPqjO
	HzCuLdCrg/mipDZNEVBaVgD35aSLqOKG7L4j1/Grr5PDqMCCDuUTFR3pLyrSmy2IPrsnwkRHyqNK/
	9ypXFfnxszPBI94Zx62D7Ji/rkzpvGBWoeyeGlgQ9y+mxXLzNzyRbtLUzP/GKcZo8BlEBSAs767tM
	nTyqcVBg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v0nZl-00AlVL-2f;
	Mon, 22 Sep 2025 22:55:57 +0200
Date: Mon, 22 Sep 2025 22:55:57 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 2/6] i2c: spacemit: remove stop function to avoid bus
 error
Message-ID: <aNG33WyGENMWI3Wl@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-2-e59bea02d680@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250827-k1-i2c-atomic-v1-2-e59bea02d680@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_135604_096841_2EDD8320 
X-CRM114-Status: GOOD (  21.83  )
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
> Previously, STOP handling was split into two separate steps:
>   1) clear TB/STOP/START/ACK bits
>   2) issue STOP by calling spacemit_i2c_stop()
> 
> This left a small window where the control register was updated
> twice, which can confuse the controller. While this race has not
> been observed with interrupt-driven transfers, it reliably causes
> bus errors in PIO mode.
> 
> Inline the STOP sequence into the IRQ handler and ensure that
> control register bits are updated atomically in a single writel().
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index ee08811f4087c8e709d25dd314854ed643cc5a47..d342752030d077953adf84a2886211de96e843c4 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -267,19 +267,6 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
>  	writel(val, i2c->base + SPACEMIT_ICR);
>  }
>  
> -static void spacemit_i2c_stop(struct spacemit_i2c_dev *i2c)
> -{
> -	u32 val;
> -
> -	val = readl(i2c->base + SPACEMIT_ICR);
> -	val |= SPACEMIT_CR_STOP | SPACEMIT_CR_ALDIE | SPACEMIT_CR_TB;
> -
> -	if (i2c->read)
> -		val |= SPACEMIT_CR_ACKNAK;
> -
> -	writel(val, i2c->base + SPACEMIT_ICR);
> -}
> -
>  static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>  {
>  	unsigned long time_left;
> @@ -412,7 +399,6 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>  
>  	val = readl(i2c->base + SPACEMIT_ICR);
>  	val &= ~(SPACEMIT_CR_TB | SPACEMIT_CR_ACKNAK | SPACEMIT_CR_STOP | SPACEMIT_CR_START);
> -	writel(val, i2c->base + SPACEMIT_ICR);
>  
>  	switch (i2c->state) {
>  	case SPACEMIT_STATE_START:
> @@ -429,14 +415,18 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>  	}
>  
>  	if (i2c->state != SPACEMIT_STATE_IDLE) {
> +		val |= SPACEMIT_CR_TB;
> +		if (i2c->is_pio)
> +			val |= SPACEMIT_CR_ALDIE;
> +

This needs to be moved to the last patch introducing PIO support.

>  		if (spacemit_i2c_is_last_msg(i2c)) {
>  			/* trigger next byte with stop */
> -			spacemit_i2c_stop(i2c);
> -		} else {
> -			/* trigger next byte */
> -			val |= SPACEMIT_CR_ALDIE | SPACEMIT_CR_TB;
> -			writel(val, i2c->base + SPACEMIT_ICR);
> +			val |= SPACEMIT_CR_STOP;
> +
> +			if (i2c->read)
> +				val |= SPACEMIT_CR_ACKNAK;
>  		}
> +		writel(val, i2c->base + SPACEMIT_ICR);
>  	}
>  
>  err_out:

Otherwise sounds good.

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
