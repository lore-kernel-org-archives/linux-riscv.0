Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C36BC47422
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 00:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8zUeFEDEaBOs11pHlIHNJrJGhMoZJwRWFB/MYWRz2I=; b=gMnPXVW1YtByQn
	Iu4gA3SorH5GvWI0DfsRdo3x1xZC14gDsAg2MUDOkaV+EIBUCOZU3nbDizU74XkryLDU926184KDw
	EZn3poiYtE8t7+AYnd+4woKY3TSF3ZVES3cTioLk/HUcAgLEsLuCV9adwVkz35YPNBcmIy/p7ea+d
	9muh5IrZj4OCBKSw84M5KWMuULjorb/s25KjSDJQbvGLximznfUNHwrxacg0oYXng194shq8U+b3z
	uHkhghSy2cH8qyPETZ92MhcxFM5BE4KbBVQYnNcCjQTfQe1imFcXKKr8c7Xh0tgOpFc8+3Zxdkreh
	+m8mYOhq3iGnlZgohs4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTWbg-00000005ylZ-3Wp4;
	Sat, 27 Jan 2024 00:31:36 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTWbd-00000005yl7-3e7v
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 00:31:35 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-42a8b99eaf9so857571cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jan 2024 16:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1706315491; x=1706920291; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EE1ASbxE2gS1DHjjB75FAGFf+9sqnnv3UERtEA/9BEs=;
        b=Ts0GVxgdWp/kVKypl39ITl0ekLZtPODQq9Fx8DhfdjcN2hWqohqMARkqn35fVNpBdF
         SRISE7qpomQE0Slf881adQKzN7iVKkdSgjPdJoLycGIM/cPT1nvdZXbmj7GbMQctOoTc
         CIOspwIqWdoTfEh1eKofEDr27MgBskETfml22qu064YjIlE4Cxw9raCG5iC+tTGQJ02o
         0PmkIKjmL50ZpMvkJTfpXn/OilM7o1/PSYM+mJv3oQv3TmJ9LCch1TBNfbhCt4QquoFm
         xcuO+JO0XpSYoOgCP95tiqvvpXX0lmURmSJlfqba9sU9Gxs/ZgQRSivzYr6ywkGqrkiP
         XZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706315491; x=1706920291;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EE1ASbxE2gS1DHjjB75FAGFf+9sqnnv3UERtEA/9BEs=;
        b=eJmSVbdUfZYgxglWEKCD2gXwWyMLYHBEY01dXIm7V6H9Y9Z3lFCb3l5z7qxongEKMv
         ko+w5vxUzGzOmKHJ20dRdL/uNuHiy12BSgv7o16NsxQV4BEa4QAuJzkdHC7Azt+PGz50
         0P9cvGDdsH6eJZO4jPkVc7sPa7ZvXhEdzOh4l47VLOIHLQtDV1UudsooKQEwRIAkOqhl
         kGbYpG80jY5GFN8fjAag8yHD8aruQ7I1HAm9gTvav+XJH3IQlpt/gU9IDAodNqTLQ+ad
         2cALycWHI/rqMUMdMJhKsJi5pi++1aIpJQGSKRZA3MHEwzlA+QMDcmv2LXFqCIMDWbFi
         D8UA==
X-Gm-Message-State: AOJu0YymgaPk5joHlPQ0uXP6NhWYMz8NkqOkaVxsQYvEgFEVh55AaHCr
	6BipbsZg8YMGVBh+pfpPEdc64qcGuRjPUdVOad0qUBPTwQdEP/c7iprigBIrizs=
X-Google-Smtp-Source: AGHT+IHYBkYFYpz0r2W2w1iGtXElTSkPAKJefOG+eq74ZWSy/gVQVZ5V3xMjVE6TCOcBqwZTNSl3Ew==
X-Received: by 2002:a05:622a:307:b0:42a:6cc2:20c4 with SMTP id q7-20020a05622a030700b0042a6cc220c4mr882478qtw.60.1706315490927;
        Fri, 26 Jan 2024 16:31:30 -0800 (PST)
Received: from [100.64.0.1] ([136.226.108.192])
        by smtp.gmail.com with ESMTPSA id v26-20020ac873da000000b00427f1fa87e6sm994412qtp.56.2024.01.26.16.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 16:31:30 -0800 (PST)
Message-ID: <071142d9-3644-4c62-a99d-40b55bf64406@sifive.com>
Date: Fri, 26 Jan 2024 18:31:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/sifive-plic: enable interrupt if needed before
 EOI
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Samuel Holland <samuel@sholland.org>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>
Cc: stable@vger.kernel.org
References: <20240126223836.202321-1-namcao@linutronix.de>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240126223836.202321-1-namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_163133_964351_6091BACA 
X-CRM114-Status: GOOD (  26.51  )
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

Hi,

On 2024-01-26 4:38 PM, Nam Cao wrote:
> RISC-V PLIC cannot EOI disabled interrupts, as explained in the
> description of Interrupt Completion in the PLIC spec:
> 
> "The PLIC signals it has completed executing an interrupt handler by
> writing the interrupt ID it received from the claim to the claim/complete
> register. The PLIC does not check whether the completion ID is the same
> as the last claim ID for that target. If the completion ID does not match
> an interrupt source that *is currently enabled* for the target, the
> completion is silently ignored."
> 
> Commit 69ea463021be ("irqchip/sifive-plic: Fixup EOI failed when masked")
> ensured that by enabling the interrupt if needed before EOI.
> 
> Commit a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask
> operations") removed the interrupt enabling code from the previous
> commit, because it assumes that interrupt should be enabled at the point
> of EOI. However, this is incorrect: there is a small window after a hart
> claiming an interrupt and before irq_desc->lock getting acquired,
> interrupt can be disabled during this window. Thus, EOI can be invoked
> while the interrupt is disabled, effectively nullify this EOI.
> 
> Make sure that interrupt is really enabled before EOI.

Could you please try the patch I previously sent for this issue[1]? It
should fix the bug without complicating the IRQ hot path.

Thanks,
Samuel

[1]: https://lore.kernel.org/lkml/20230717185841.1294425-1-samuel.holland@sifive.com/

> Fixes: a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask operations")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 5b7bc4fd9517..0857a516c35b 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -148,7 +148,13 @@ static void plic_irq_eoi(struct irq_data *d)
>  {
>  	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
>  
> -	writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> +	if (irqd_irq_disabled(d)) {
> +		plic_toggle(handler, d->hwirq, 1);
> +		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> +		plic_toggle(handler, d->hwirq, 0);
> +	} else {
> +		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> +	}
>  }
>  
>  #ifdef CONFIG_SMP


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
