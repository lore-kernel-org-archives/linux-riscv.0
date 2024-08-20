Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7A4C3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 15:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JsAfLPCrn2AZhQWNj/8k9Gz2Ow6vsLL0ySYXRtMIZWc=; b=o50QcHKr4ucuvA
	UCwOSmVPd394CK+gyUwTdbRKfhaAnMQOsB4g32GLabbel94lb4ULZHzy7zwx4xgqshmnwfdAhbzEL
	ELZzzXPTU5644XgFrcJHAF4RtoeNn2bIiDxiYl3eTliMLzeHy4CMBUFL20Ey09spg9rN2LRxIQ3zp
	hCzeZiZGrMx9PZV+nLZA8HidPF9wd5MRs2k2WLnaH6cSoMHNXUloyHPaedDf7cTsj+1+ieWqw7MSn
	ZY5rGUxh2oQVFcOrMILXjg3ACniWMB3Mf07i/+6fdAqQFAhQBrBTJdFfsj9/57p9lhUdjhCoGcaxL
	rn+uy3c2dT32KhMqNiaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQaC-00000005ktc-2E9s;
	Tue, 20 Aug 2024 15:15:40 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQQ3-00000005iAu-1dsA
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 15:05:24 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724166297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jutzbFVtDjLzUKkFixrW19VfHuctnJnFjP5315a6ero=;
	b=YEnweZCywClB4gSYEOeGlGXu1CGiltn5GSfYAscPYiCx1FnE5z3fNxSagh8dZ1VjfxaFdh
	0LCsEJC/anJQr3dzUbUttv4HBpW4ZvXkg0JcqL0VFdlkGjDkGnv1hIG2juSBMNF/46ghae
	cC553NC3YuCmrZ/zgnROW0WBlW48VfEZrNnaDcoWbcOCF0kB3L5+AQo7nwWEHPy+UwaNfb
	MYC0JUj7e+Q47b899JvB1/gN6GD2us10l/8/vogH1eJ0ZGr6EC1/l+gYDR0/LUOdLQREuU
	SmDvS4JPKYuBm9TpU1ygLzmTr0QqNmfXUhnoD/hX6CNcEbR9N8MFyyitfqEKYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724166297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jutzbFVtDjLzUKkFixrW19VfHuctnJnFjP5315a6ero=;
	b=JUf+c80MEZI2v9bgRxljapByyu9192D3hdQVIXhAUDQ6AdGmpdm3m3eRCjHbY8ovGpQ7jB
	SpKEPokWvf80MnDA==
To: Jinjie Ruan <ruanjinjie@huawei.com>, paul.walmsley@sifive.com,
 samuel.holland@sifive.com, apatel@ventanamicro.com,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH -next] irqchip/sifive-plic: Fix IS_ERR() vs NULL bug in
 plic_probe()
In-Reply-To: <20240820094542.1576537-1-ruanjinjie@huawei.com>
References: <20240820094542.1576537-1-ruanjinjie@huawei.com>
Date: Tue, 20 Aug 2024 17:04:57 +0200
Message-ID: <87plq3jkva.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_080511_652859_2D156D2A 
X-CRM114-Status: GOOD (  13.72  )
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

On Tue, Aug 20 2024 at 17:45, Jinjie Ruan wrote:
> The devm_platform_ioremap_resource() function returns error pointers.
> It never returns NULL. Update the check accordingly.
>
> Fixes: b68d0ff529a9 ("irqchip/sifive-plic: Use devm_xyz() for managed allocation")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 9e22f7e378f5..cea8dca89c50 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -511,8 +511,8 @@ static int plic_probe(struct platform_device *pdev)
>  	priv->nr_irqs = nr_irqs;
>  
>  	priv->regs = devm_platform_ioremap_resource(pdev, 0);
> -	if (WARN_ON(!priv->regs))
> -		return -EIO;
> +	if (WARN_ON(IS_ERR(priv->regs)))
> +		return PTR_ERR(priv->regs);

This is obsolete by now:

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=irq/urgent&id=4d936f10ff80274841537a26d1fbfe9984de0ef9

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
