Return-Path: <SRS0=zhGB=7D=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D689C433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 May 2020 22:06:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2B61206F6
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 May 2020 22:06:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YAoQRBs0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="x7AysmNp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2B61206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=z4qjWDJS+dDEG6zsJVodzvcv2AJMK5S0YVhak8+CMXA=; b=YAoQRBs06Ou3AE
	hi9T/PX0xH7jP9hvFKGJBXNSEKyq71dDBx3joWx3H+kwousKSPm3v3w3w/PK+wkzPnItO7xFAiDY2
	4SJmZdIUjBAxwvJs6lWz2v6ZZW/nMpnajqmmjpQWlanQC5YAh35AG/+DunVQ/+Q9B2hyphmmDKRR7
	0HPMfB+mqkyupSC1w+U7ZFoeaRLfZFE38Kq3ddiV9zYstlKj+1Fx4XbhQem4Nb3fhCQsAwOSNx4lp
	bp2vstCfx6+IKv98ipLRlbEvzLeiDgqNrZqsYBLJQZotwY3pa6VuT0OhV1+MySlVooF2BDFOVDHsO
	EXKtaikBgOk40MRKSUnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbtKZ-0007QG-E3; Thu, 21 May 2020 22:06:23 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbtKU-0007Mm-IC
 for linux-riscv@lists.infradead.org; Thu, 21 May 2020 22:06:22 +0000
Received: by mail-pg1-x544.google.com with SMTP id f21so957546pgg.12
 for <linux-riscv@lists.infradead.org>; Thu, 21 May 2020 15:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=z4qjWDJS+dDEG6zsJVodzvcv2AJMK5S0YVhak8+CMXA=;
 b=x7AysmNp0uZndl6qCVfHpRaL6qwKwUKih6h6F4bYJ5i+no/SnDwO35gG5Eo7C+oaOm
 MpxI+tMIP+WzltyQEgPNkG4DBL9GqCf2buVXoU52+/n6bdMlcqcRv/fF6yC22dQsOLWI
 noZAmJZVDt3ryDt9cyeG5ibC6Lb59+K63CG/9HNRRRVEQYuydaiZdkiVUxoHN14A3/WK
 9h7rpwKhDRYjxQfg1kvKiLx/+OIF0y8/HnFr+pziSjuL3HV21wLfoE2PCtUuYzC20XYn
 Zie6+tByf13dxvZD5BQaBzKuYgmptdAZIrdjAayFYNJdPej5FLb8RuBsZsdzrX6DWxYF
 0kCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=z4qjWDJS+dDEG6zsJVodzvcv2AJMK5S0YVhak8+CMXA=;
 b=igrdCvNxI63msnPrjpyFGOAjB6AVjDbZiHAjOfFdzU0DJmWzoWZm8+EoKqvoVMJEb+
 RitkvdT2dywLVul0WpYikxE+596gNkXq52WnBPQQIi2Gad0m3NJR7m+6vtMBTUuGusgY
 QNSGBdSIpIbE1vDAbC2fowXTeClQBcJcf3jqUPo+wKnf5rDWzVrNZuawpyxuJxoZQXdl
 i3nwDkyV+wJ/8d55XO9sRBFwZZs8Er1SRUZLnp1uIx8AiJcu9Xup10ZbsytMk3RU9E/m
 6clOUJqA0BlhXv21N37QnoDDRGugIaxk1REz+5hMrULNQPAtmnripXSVwN/yOnDTavkr
 XYnA==
X-Gm-Message-State: AOAM532tym46runonRyCJOkONSE17bxUdZH+pzkt1tTHiuI4Al+6i1Ku
 l6t4p9y+sNr0+lhj9egMx0k+rg==
X-Google-Smtp-Source: ABdhPJzX1rMTBYpTHR0AQoHMU8WuWYu6PtLRSmk111NXu1EZlrTns2JDN2mP6/jPDZFUnz++IQpRjw==
X-Received: by 2002:a62:fc4c:: with SMTP id e73mr755715pfh.305.1590098777630; 
 Thu, 21 May 2020 15:06:17 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u17sm4961524pgo.90.2020.05.21.15.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 15:06:16 -0700 (PDT)
Date: Thu, 21 May 2020 15:06:16 -0700 (PDT)
X-Google-Original-Date: Thu, 21 May 2020 14:58:47 PDT (-0700)
Subject: Re: [PATCH v2 2/3] irqchip/sifive-plic: Setup cpuhp once after boot
 CPU handler is present
In-Reply-To: <20200518091441.94843-3-anup.patel@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-06a48d36-b37c-481f-97aa-8fc0b1f9795e@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_150618_597531_6F1131F7 
X-CRM114-Status: GOOD (  18.62  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: jason@lakedaemon.net, Marc Zyngier <maz@kernel.org>, anup@brainfault.org,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 18 May 2020 02:14:40 PDT (-0700), Anup Patel wrote:
> For multiple PLIC instances, the plic_init() is called once for each
> PLIC instance. Due to this we have two issues:
> 1. cpuhp_setup_state() is called multiple times
> 2. plic_starting_cpu() can crash for boot CPU if cpuhp_setup_state()
>    is called before boot CPU PLIC handler is available.
>
> This patch fixes both above issues.
>
> Fixes: f1ad1133b18f ("irqchip/sifive-plic: Add support for multiple PLICs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 9f7f8ce88c00..6c54abf5cc5e 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -76,6 +76,7 @@ struct plic_handler {
>  	void __iomem		*enable_base;
>  	struct plic_priv	*priv;
>  };
> +static bool plic_cpuhp_setup_done;
>  static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
>
>  static inline void plic_toggle(struct plic_handler *handler,
> @@ -285,6 +286,7 @@ static int __init plic_init(struct device_node *node,
>  	int error = 0, nr_contexts, nr_handlers = 0, i;
>  	u32 nr_irqs;
>  	struct plic_priv *priv;
> +	struct plic_handler *handler;
>
>  	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
> @@ -313,7 +315,6 @@ static int __init plic_init(struct device_node *node,
>
>  	for (i = 0; i < nr_contexts; i++) {
>  		struct of_phandle_args parent;
> -		struct plic_handler *handler;
>  		irq_hw_number_t hwirq;
>  		int cpu, hartid;
>
> @@ -367,9 +368,18 @@ static int __init plic_init(struct device_node *node,
>  		nr_handlers++;
>  	}
>
> -	cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
> +	/*
> +	 * We can have multiple PLIC instances so setup cpuhp state only
> +	 * when context handler for current/boot CPU is present.
> +	 */
> +	handler = this_cpu_ptr(&plic_handlers);
> +	if (handler->present && !plic_cpuhp_setup_done) {
> +		cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
>  				  "irqchip/sifive/plic:starting",
>  				  plic_starting_cpu, plic_dying_cpu);
> +		plic_cpuhp_setup_done = true;

So presumably something else is preventing multiple plic_init() calls from
executing at the same time?  Assuming that's the case

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

> +	}
> +
>  	pr_info("mapped %d interrupts with %d handlers for %d contexts.\n",
>  		nr_irqs, nr_handlers, nr_contexts);
>  	set_handle_irq(plic_handle_irq);

