Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A131D37E44
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 15:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GOzAYNrKsVP6RNgElh/HcNLgpaIAS81LqSTy8a67Tdg=; b=h2kteQL+gJ1LhN
	Z6V+yxPIaxQFAu2Uv7L7A9SYcpr2Sy88GwO2yQKF4nhsfCDYDlDM1mkHokKX0tVtARzdcJkIpoSrZ
	Oeuix8sI52TEgNBUh9J4sclyjv1MlQAqUvRk0myxuZ9Pt5EANUujok5FtYgVNY94rvNf+GwCd6IFW
	MqSau8iNNmVinqI1z+bSXVv6/RbiQlaVsswV/SjlHp6OHzUU/BysFZIuYwgkIhypY/tw8UX7/kQiD
	J+jtFqVm7rH7V95FLf4k0VKee7QMvT1IpjSz8vmY/atPA+8bP7r0i5de8HoRG+sguXS9j3ZYILo67
	muHidTZ718WELnb/NHDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg35l-00000009lff-0zFE;
	Wed, 14 Jan 2026 15:47:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg35i-00000009lfL-2zuz
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 15:47:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C6A4B600CB;
	Wed, 14 Jan 2026 15:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2B8C4CEF7;
	Wed, 14 Jan 2026 15:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768405645;
	bh=gErwCbPWxg85fNo495sxPpFMvvtkbsFJg6xUa56/AlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QpFf7575toSf2HueGcvcfezNtNTHiMg9B1RojAExCrCWHjhdQZhwvNGwa+xKZ8XEC
	 l0C/H+2W+GbpPWkUiQtveAEx58CUywDzMItInrWUy/6CED47/wc9a6qnsAjXruKMCI
	 bjM9wG6/1zFgW3bQUk7WSwCckRETgy7ANThtF93L6d3MiGWxNyDR1lAM1VHmFbA8ID
	 5gwE1/HRFUGizMcdhUeOnbBF1Z0sXKQLYN9m+TZ019+lYDTmNxEfS3gfVwfrKG+SRV
	 zY/0zm/ScgTg4d+VOwd/WlmVJ5O3I0NZFBnl37qFAvSeNxC3ZtvsEf+h9W6dX8Kz7B
	 ig6FPzpWWJ8dQ==
Date: Wed, 14 Jan 2026 16:47:22 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v6 2/2] i2c: spacemit: introduce pio for k1
Message-ID: <aWeyT8gb8Z31S_V9@zenone.zhora.eu>
References: <20260108-k1-i2c-atomic-v6-0-41b132b70f68@linux.spacemit.com>
 <20260108-k1-i2c-atomic-v6-2-41b132b70f68@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-k1-i2c-atomic-v6-2-41b132b70f68@linux.spacemit.com>
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

...

> @@ -171,6 +176,16 @@ static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
>  	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
>  }
>  
> +static inline void spacemit_i2c_delay(struct spacemit_i2c_dev *i2c,
> +				      unsigned int min_us,
> +				      unsigned int max_us)
> +{
> +	if (i2c->use_pio)
> +		udelay(max_us);

We need some control on how much we want to sleep in atomic. This
can have effects on the whole system.

> +	else
> +		usleep_range(min_us, max_us);

If we assume that max_us = min_us * 2 we don't need to pass it as
a parameter. Even better you can use fsleep here which does it
for you.

> +}

...

> +	if (!i2c->use_pio) {
> +		/*
> +		 * Enable interrupt bits for all xfer mode:
> +		 * bus error, arbitration loss detected.
> +		 */
> +		val |= SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
> +
> +		/*
> +		 * Unmask interrupt bits for interrupt xfer mode:
> +		 * When IDBR receives a byte, an interrupt is triggered.
> +		 *
> +		 * For the tx empty interrupt, it will be enabled in the
> +		 * i2c_start().
> +		 * We don't want a TX empty interrupt until we start
> +		 * a transfer in i2c_start().
> +		 */
> +		val |= SPACEMIT_CR_DRFIE;
> +
> +		/* Enable master stop interrupt bit.

Please run checkpatch.pl before sending the patch. Here the
comment format is wrong.

> +		 * For transaction complete signal, we use master stop
> +		 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
> +		 */
> +		val |= SPACEMIT_CR_MSDIE;
> +	}

...

> +static void spacemit_i2c_handle_state(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 val;
> +
> +	if (i2c->status & SPACEMIT_SR_ERR)
> +		goto err_out;
> +
> +	val = readl(i2c->base + SPACEMIT_ICR);
> +	val &= ~(SPACEMIT_CR_TB | SPACEMIT_CR_ACKNAK | SPACEMIT_CR_STOP | SPACEMIT_CR_START);
> +
> +	switch (i2c->state) {
> +	case SPACEMIT_STATE_START:
> +		spacemit_i2c_handle_start(i2c);
> +		break;
> +	case SPACEMIT_STATE_READ:
> +		spacemit_i2c_handle_read(i2c);
> +		break;
> +	case SPACEMIT_STATE_WRITE:
> +		spacemit_i2c_handle_write(i2c);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (i2c->state != SPACEMIT_STATE_IDLE) {
> +		val |= SPACEMIT_CR_TB;
> +		if (i2c->use_pio)
> +			val |= SPACEMIT_CR_ALDIE;

Why are we enabling ALDIE here?

> +
> +

please drop one blank line here

> +		if (spacemit_i2c_is_last_msg(i2c)) {
> +			/* trigger next byte with stop */
> +			val |= SPACEMIT_CR_STOP;
> +
> +			if (i2c->read)
> +				val |= SPACEMIT_CR_ACKNAK;
> +		}
> +		writel(val, i2c->base + SPACEMIT_ICR);
> +	}

...

> @@ -431,41 +605,8 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>  
>  	spacemit_i2c_clear_int_status(i2c, status);
>  
> -	if (i2c->status & SPACEMIT_SR_ERR)
> -		goto err_out;
> -
> -	val = readl(i2c->base + SPACEMIT_ICR);
> -	val &= ~(SPACEMIT_CR_TB | SPACEMIT_CR_ACKNAK | SPACEMIT_CR_STOP | SPACEMIT_CR_START);
> -
> -	switch (i2c->state) {
> -	case SPACEMIT_STATE_START:
> -		spacemit_i2c_handle_start(i2c);
> -		break;
> -	case SPACEMIT_STATE_READ:
> -		spacemit_i2c_handle_read(i2c);
> -		break;
> -	case SPACEMIT_STATE_WRITE:
> -		spacemit_i2c_handle_write(i2c);
> -		break;
> -	default:
> -		break;
> -	}
> -
> -	if (i2c->state != SPACEMIT_STATE_IDLE) {
> -		val |= SPACEMIT_CR_TB | SPACEMIT_CR_ALDIE;
> -
> -		if (spacemit_i2c_is_last_msg(i2c)) {
> -			/* trigger next byte with stop */
> -			val |= SPACEMIT_CR_STOP;
> -
> -			if (i2c->read)
> -				val |= SPACEMIT_CR_ACKNAK;
> -		}
> -		writel(val, i2c->base + SPACEMIT_ICR);
> -	}
> +	spacemit_i2c_handle_state(i2c);

Next time this can be on a separate patch as a preparatory patch
to make the review of this one a bit easier.

>  
> -err_out:
> -	spacemit_i2c_err_check(i2c);
>  	return IRQ_HANDLED;
>  }

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
