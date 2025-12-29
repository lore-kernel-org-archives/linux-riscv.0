Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D05E8FDBE
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 14:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oOEE6WuGpGf6sOgMQSyjnc4loHPVjXW329/4wXryN8M=; b=Bv3uNAvoDnQ+fD
	IqPNsIhf/DWGBX1wIB3pq760vqU2VEYLmvC74/pKEHNu1shg4PcJqYPHMXjoRZZpjEOldP88Nnv83
	uC/GkFKqiXJ12Mv9kMm2LN1GoRgd8gaQJ1Pfx8zyhsrQaftWbKOVHZQEt9FQQt8hQLoq//Oh+gRfL
	FHH0l12lUSWCboV67r2DfQ/V1G8nf+lAP+qxuQjz5MntsClNAwzy8M1XT1pFmr9Z0wLlMwgy95ghi
	O/nZfrE/NOvMR+H6hZ7CH2iZrHA3kG5v4oSd/QpM87/1hR3loeij+fTekXXJQLU4rk0jY/4GYvh+P
	jVgasrMqzyrrIWB2FIPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEPS-00000003n3w-2k5X;
	Mon, 29 Dec 2025 14:39:46 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEPQ-00000003n3E-0nYF
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 14:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=GrYHcHnP6wftcFE2RuDhEbTzFwJI2LRIQv18lcOiPHM=; b=j39VqWGLn76xTD628aOXT/U3D9
	Mg85LIduMyYuCor5hbwHOgxNkI8d79FAhMAQyUtqsx+z2+MOvQhJWZi7Ty72AYTjmDO8gizDhVumM
	gBBxfynTeJLi9YVaQIl5ARzmjP/gGSHCEE0HTyuWx0cQtiyVvKEFCzcVrngEVtSUbXcsxKT05gm5S
	dj05HdZK41ZL7LKsVz3XaLRxRl1nkpGevfJjYi/yGM9iVBdhlgAnqABO8YN0LHFKwKSCzC9dj4DDu
	Eonhw2VcsGg3NqgOGL9GniibDOZlX5rrs1MfUWkSl191swBiRjxJqUod0vVOVkmjXn/R0CS6lMW2b
	y+PNbTYQ==;
Received: from [2a01:e34:ec5d:a742:6075:34ff:c68a:2cc7] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vaEPL-00000003LFG-3I9o;
	Mon, 29 Dec 2025 15:39:39 +0100
Date: Mon, 29 Dec 2025 15:39:39 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 1/2] i2c: spacemit: replace i2c_xfer_msg()
Message-ID: <aVKSqx6J4HHfnBNX@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <20251226-k1-i2c-atomic-v5-1-023c798c5523@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251226-k1-i2c-atomic-v5-1-023c798c5523@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_063944_230441_30B9E2EB 
X-CRM114-Status: GOOD (  20.23  )
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

On 2025-12-26 11:31, Troy Mitchell wrote:
> The upcoming PIO support requires a wait_pio_xfer() helper, which is
> invoked from xfer_msg().
> 
> Since wait_pio_xfer() depends on err_check(), move the definition of
> xfer_msg() after err_check() to avoid a forward declaration of
> err_check().
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 62 ++++++++++++++++++++++-----------------------
>  1 file changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index d42c03ef5db5984ea8e06b3d7eb485b4f899e616..accef6653b56bd3505770328af17e441fad613a7 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -304,37 +304,6 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
>  	writel(val, i2c->base + SPACEMIT_ICR);
>  }
>  
> -static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> -{
> -	unsigned long time_left;
> -	struct i2c_msg *msg;
> -
> -	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
> -		msg = &i2c->msgs[i2c->msg_idx];
> -		i2c->msg_buf = msg->buf;
> -		i2c->unprocessed = msg->len;
> -		i2c->status = 0;
> -
> -		reinit_completion(&i2c->complete);
> -
> -		spacemit_i2c_start(i2c);
> -
> -		time_left = wait_for_completion_timeout(&i2c->complete,
> -							i2c->adapt.timeout);
> -		if (!time_left) {
> -			dev_err(i2c->dev, "msg completion timeout\n");
> -			spacemit_i2c_conditionally_reset_bus(i2c);
> -			spacemit_i2c_reset(i2c);
> -			return -ETIMEDOUT;
> -		}
> -
> -		if (i2c->status & SPACEMIT_SR_ERR)
> -			return spacemit_i2c_handle_err(i2c);
> -	}
> -
> -	return 0;
> -}
> -
>  static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
>  {
>  	if (i2c->msg_idx != i2c->msg_num - 1)
> @@ -418,6 +387,37 @@ static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
>  	complete(&i2c->complete);
>  }
>  
> +static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> +{
> +	unsigned long time_left;
> +	struct i2c_msg *msg;
> +
> +	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
> +		msg = &i2c->msgs[i2c->msg_idx];
> +		i2c->msg_buf = msg->buf;
> +		i2c->unprocessed = msg->len;
> +		i2c->status = 0;
> +
> +		reinit_completion(&i2c->complete);
> +
> +		spacemit_i2c_start(i2c);
> +
> +		time_left = wait_for_completion_timeout(&i2c->complete,
> +							i2c->adapt.timeout);
> +		if (!time_left) {
> +			dev_err(i2c->dev, "msg completion timeout\n");
> +			spacemit_i2c_conditionally_reset_bus(i2c);
> +			spacemit_i2c_reset(i2c);
> +			return -ETIMEDOUT;
> +		}
> +
> +		if (i2c->status & SPACEMIT_SR_ERR)
> +			return spacemit_i2c_handle_err(i2c);
> +	}
> +
> +	return 0;
> +}
> +
>  static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>  {
>  	struct spacemit_i2c_dev *i2c = devid;

With the patch title updated as suggested:

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>


-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
