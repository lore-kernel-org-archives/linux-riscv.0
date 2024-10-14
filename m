Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96BBD1A429
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 06:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpWp0ik01l7u19ZxVQfpQTWc6wRcVZrroyCkXUcQNjU=; b=iBQHZGvnS8adgX
	4B8VPj/keAIaeBatKTSlh+O9kALi7ycx7dFS+SW57Xpub3GWSMO18twoLSApDvEyxgOolpQcdTM/v
	gc1TdP0ZovPNhEsvRbACNuIyeIwU2C7G63wc+XNbtp/n5paCVKv6aRSwtqx48vEJV1juamJIIzIHJ
	YMlIfdU2h9751XAzJhzHwOXTD2li6vycU/iqsyVEOVrcWW/qyOY6BR6qYkSYWXkm/d01+Q+diP5AN
	9+FrAkCUbbpw4TTudbXdyKxFzbRKcm7QChp8HovYNcfbQFdgHof+82ARzkB0VI2/5tWi412qeqvnD
	QUfBftCiPBNTNMV2dZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0EI0-00000003qT7-17xk;
	Mon, 14 Oct 2024 06:10:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0EHx-00000003qRc-24O4
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 06:10:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C73955C5990;
	Mon, 14 Oct 2024 06:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44453C4CEC3;
	Mon, 14 Oct 2024 06:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728886239;
	bh=vtOULXzKh1W2zjoRRH7MNf2bpYcEKecnN3dY3aNLMSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e5kxh8wdesQJ0pTug01/NkZeExuwthoVgZUktUVr+s/szlFweo7jeFGN5DGAw641X
	 1HqC/vulNeN0xjiBXuGBENKV/QLDFKwV/tobl31ROkTUGKA/9r+x/rAa1R/qNGU/b1
	 mJIYxxMrwmdXVJ2c+gJB78DB7j/keAhi5pGYExM4=
Date: Mon, 14 Oct 2024 08:10:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] tty: hvc: riscv_sbi: instantiate the legcay console
 earlier
Message-ID: <2024101402-starlet-riverside-02d4@gregkh>
References: <20241014000857.3032-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241014000857.3032-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_231041_661828_7452B652 
X-CRM114-Status: GOOD (  24.97  )
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

On Mon, Oct 14, 2024 at 08:08:57AM +0800, Jisheng Zhang wrote:
> The hvc_instantiate() is an early console discovery mechanism, it is
> usually called before allocating hvc terminal devices. In fact, if
> we check hvc_riscv_sbi's hvc_instantiate() return value, we'll find
> that it's -1. So the calling hvc_instantiate() is too late.
> 
> We can remove the hvc_instantiate() to only rely on the hvc_alloc() to
> register the kernel console. We can also move its calling earlier so
> the kernel console is registered earlier, so that we can get kernel
> console msg earlier. We take the 2nd choice in this patch.
> 
> Before the patch:
> [    0.367440] printk: legacy console [hvc0] enabled
> [    0.401397] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> 
> After the patch:
> 
> [    0.004665] printk: legacy console [hvc0] enabled
> [    0.050183] Calibrating delay loop (skipped), value calculated using timer frequency.. 20.00 BogoMIPS (lpj=100000)
> 
> As can be seen, now the kernel console is registered much earlier before
> the BogoMIPS calibrating.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

What commit id does this fix?

> ---
>  drivers/tty/hvc/hvc_riscv_sbi.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
> index cede8a572594..d2ecfbf7c84a 100644
> --- a/drivers/tty/hvc/hvc_riscv_sbi.c
> +++ b/drivers/tty/hvc/hvc_riscv_sbi.c
> @@ -68,12 +68,10 @@ static int __init hvc_sbi_init(void)
>  		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_dbcn_ops, 256));
>  		if (err)
>  			return err;
> -		hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
>  	} else if (IS_ENABLED(CONFIG_RISCV_SBI_V01)) {
>  		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_v01_ops, 256));
>  		if (err)
>  			return err;
> -		hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
>  	} else {
>  		return -ENODEV;
>  	}
> @@ -81,3 +79,18 @@ static int __init hvc_sbi_init(void)
>  	return 0;
>  }
>  device_initcall(hvc_sbi_init);
> +
> +static int __init hvc_sbi_console_init(void)
> +{
> +	int err;
> +
> +	if (sbi_debug_console_available)
> +		err = hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
> +	else if (IS_ENABLED(CONFIG_RISCV_SBI_V01))
> +		err = hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
> +	else
> +		return -ENODEV;
> +
> +	return err < 0 ? -ENODEV : 0;

Please spell out a ? : line, it's not required here.

> +}
> +console_initcall(hvc_sbi_console_init);

Are you sure this will always work properly?  For some reason the
original code did not do this, you might want to check the
lore.kernel.org archives to find out why.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
