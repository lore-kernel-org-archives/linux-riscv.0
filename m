Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639DDC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Mar 2022 13:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUmpKuuZJkKavLPPfxcgFRmG+lNqI6MOtd8FXxXsqB4=; b=ld5THWbGgw8VGsBGERPCFbY9/b
	2wHrv7lfCHprdYKwha0GhOcFBa0kBz8QHkux2KyYTANXo1FLnB7ZGHQMPPuQWkU+A2ycTiZTqFdlR
	qfW88/8LO7n1MPC775EkD4px0s1fGNEaarED4qd4QakaEn9n4LHC7ELMMp76SEuUAp695n28oC3+3
	1bzlwB1geOq1KD+18TtTI1Ftt7OaUhkI0lGo6E/7MtMTseB0nXD4dqa0qt289MtaPuIZ92Oy86QZr
	/HfWO+i9n+CEqKUoXYqua2/QD/9OG4Zaij7MHFKCBPu09L0UAsiTbnJzUTaSsO62SfDFYFRf5jBZv
	h6VWUzLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPObd-002h0O-P9; Wed, 02 Mar 2022 13:01:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPOba-002gz8-Mh
 for linux-riscv@lists.infradead.org; Wed, 02 Mar 2022 13:01:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 44BFC6197E;
 Wed,  2 Mar 2022 13:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3938C004E1;
 Wed,  2 Mar 2022 13:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646226081;
 bh=PzGTvJy8mgIMpYeXJE0u5Qt34e245R2mxEKuBXhrcRI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WgdQkeqM5RDYeDLrwAcIPcwtic9dj+BstSMPoDDxRF8h8OrTUVTQyVsGpd4uRmNg7
 Y6LdCteg6YC3qG16g/m5EbhlRL1tVHA5JqxHTM9+egh94Cosxpqz6vFwS21QW4jxRU
 QYIAVBTpS22lSm0t/IZBipaSLvX8g4+xBBVKyLGf/K7bforopPysOEnlWpZXookgdW
 dEPaXDeRqknnWcKdhatjBXNZZ8TQ1k6EAO33v2xv3OP8Ku/4W9MGDhsz1HfHD3Bqdo
 Q239opn3yMlZ2oatSFBxTyhd/fLMJ98VJ+FqbVw78q339AreTwPtRjyD0Jpsk+fCKt
 eqzWB31vGDGPg==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1nPObX-00BgJP-EE; Wed, 02 Mar 2022 13:01:19 +0000
MIME-Version: 1.0
Date: Wed, 02 Mar 2022 13:01:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, damien.lemoal@opensource.wdc.com,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] irqchip/sifive-plic: Disable S-mode IRQs if
 running in M-mode
In-Reply-To: <20220301171317.3109161-3-Niklas.Cassel@wdc.com>
References: <20220301171317.3109161-1-Niklas.Cassel@wdc.com>
 <20220301171317.3109161-3-Niklas.Cassel@wdc.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <7ac17ea72a45f201c93b477657b6f766@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: Niklas.Cassel@wdc.com, tglx@linutronix.de,
 palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 damien.lemoal@opensource.wdc.com, linux-riscv@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_050122_867756_6778FBBF 
X-CRM114-Status: GOOD (  22.74  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2022-03-01 17:13, Niklas Cassel wrote:
> From: Niklas Cassel <niklas.cassel@wdc.com>
> 
> When detecting a context for a privilege mode different from the 
> current
> running privilege mode, we simply skip to the next context register.
> 
> This means that we never clear the S-mode enable bits when running in
> M-mode.
> 
> On canaan k210, a bunch of S-mode interrupts are enabled by the 
> bootrom.
> These S-mode specific interrupts should never trigger, since we never 
> set
> the mie.SEIE bit in the parent interrupt controller (riscv-intc).
> 
> However, we will be able to see the mip.SEIE bit set as pending.
> 
> This isn't a good default when CONFIG_RISCV_M_MODE is set, since in 
> that
> case we will never enter a lower privilege mode (e.g. S-mode).
> 
> Let's clear the S-mode enable bits when running the kernel in M-mode, 
> such
> that we won't have a interrupt pending bit set, which we will never 
> clear.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-sifive-plic.c
> b/drivers/irqchip/irq-sifive-plic.c
> index fc9da94eb816..e6193d66c0ae 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -81,17 +81,23 @@ static int plic_parent_irq __ro_after_init;
>  static bool plic_cpuhp_setup_done __ro_after_init;
>  static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
> 
> -static inline void plic_toggle(struct plic_handler *handler,
> -				int hwirq, int enable)
> +static inline void __plic_toggle(void __iomem *enable_base,
> +				 int hwirq, int enable)

While you're at it, please drop the inline attributes. They really
serve no purpose, as that's the job of the compiler.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
