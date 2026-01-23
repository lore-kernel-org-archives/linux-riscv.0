Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D255D778B0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 20:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUmZsktnkE2JamSWhNiC91GGIIhcSIASjdACmnYbXvU=; b=wQSRPRV6MCWQBO
	HwLInwq4QzZkunFUphq5K8zvBi2NfQhXFrz0SsMKdGJtoQ6mndP+5lF3GLTaL8I97Y1ZwQHbCkE77
	hUpW96QCwmRuBLGoX/bYWDAxOFACtd7E+SiiXozP9qP3fGiFVqd/x31aZALF73DU2P9GDCB1YKKSi
	SlLiOqMf08SYGl9jKoK+YBEsCi/6fdHlu+mW3vyDr7hctHUEhsYxJatkE8qFcJ7XlYpZ4+4dQoEQT
	KM4ydjy6TulIB91RjdtqGzXljzuf2STphcryWOEu3bf/kUM/316xXcxUTlO+sHQh5dKhu8X4EMA+z
	Zx07h7IVff12IcqRAxlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjO9r-00000009UUu-3mWK;
	Fri, 23 Jan 2026 20:53:31 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjO9o-00000009UUW-24YE
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 20:53:30 +0000
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id DCD9A341432;
	Fri, 23 Jan 2026 20:53:23 +0000 (UTC)
Date: Sat, 24 Jan 2026 04:53:13 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Thomas Gleixner <tglx@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 11/21] i2c: spacemit: Remove IRQF_ONESHOT
Message-ID: <20260123205313-GYA71302@gentoo.org>
References: <20260123113708.416727-1-bigeasy@linutronix.de>
 <20260123113708.416727-12-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260123113708.416727-12-bigeasy@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_125328_566289_67407BEB 
X-CRM114-Status: GOOD (  17.26  )
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

Hi Sebastian, 

On 12:36 Fri 23 Jan     , Sebastian Andrzej Siewior wrote:
> Passing IRQF_ONESHOT ensures that the interrupt source is masked until
> the secondary (threaded) handler is done. If only a primary handler is
> used then the flag makes no sense because the interrupt can not fire
> (again) while its handler is running.
> The flag also disallows force-threading of the primary handler and the
> irq-core will warn about this.
> 
> Remove IRQF_ONESHOT from irqflags.
> 

I've sent out a similar patch which already accepted and queued, see
https://lore.kernel.org/r/20260122-05-k1-i2c-irq-v1-1-9b8d94bbcd22@kernel.org

> Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Cc: Yixun Lan <dlan@gentoo.org>
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/i2c/busses/i2c-k1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index d42c03ef5db59..8ef6d5d1927b7 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -566,7 +566,7 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, i2c->irq, "failed to get irq resource");
>  
>  	ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
> -			       IRQF_NO_SUSPEND | IRQF_ONESHOT, dev_name(i2c->dev), i2c);
> +			       IRQF_NO_SUSPEND, dev_name(i2c->dev), i2c);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to request irq");
>  
> -- 
> 2.51.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
