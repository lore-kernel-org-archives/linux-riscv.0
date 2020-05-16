Return-Path: <SRS0=t6IZ=66=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C40DC433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 16 May 2020 12:11:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F5FB20657
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 16 May 2020 12:11:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ihRqNXJw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZUTWWof"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F5FB20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:
	References:In-Reply-To:Subject:To:From:Date:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N04gHaSlJXQqF3FDfaekaM4YISOkv+DTMov8OoQzaaU=; b=ihRqNXJwqDl0HG6eB6KB+pGFn
	Dam5Y4ZgGPAoIkwMRC8+86KtbQnZLpOtIh+LsoD1i5ZckPVU/fFawc9h7v42JP7DTKvqvWzvzNjev
	OyxMk1ybdLDTwGQTD/rc+m92ZjayLSG3xKvo+aVAek9POq2uJCZZ6kNUCjWRqxFVr+wDBq0sTYzb8
	rpDaQ+DP2MhNC97X/fm70XoeBmSiNxxNUWVmEFTdWCJ2dCPqKkHWMRaSbhFE48KnpdlmVPWwx18o2
	cLS+8tCmTOOZT3a76+j5+ypjSmdpMQUl/1mIlb7wUOAS0kUruleJBS383/j90gxnixTOa15MrmVlN
	INJIR9vXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZvfT-0006JZ-6p; Sat, 16 May 2020 12:11:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZvfQ-0006FE-RC
 for linux-riscv@lists.infradead.org; Sat, 16 May 2020 12:11:50 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C11D20657;
 Sat, 16 May 2020 12:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589631104;
 bh=wrMFzf+QBFblU189yRzbGWglv3qwzLmaHvcvHlV0GUE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cZUTWWofrxjhsMrtbblojBWSTAuVWrw2XfAsy+QYwUuumLbri+luonsWq2TXbojcm
 mfDYXurSW0VN2DlmyjAuIgiP0aLq+iJ5DWW4JtcTSZ0MssmCZTKdOnNS1RK+bXSxTA
 PvbQ6LY1xv4i5CPuT+x3nynooAgmFy78LUzhZPuw=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jZvfK-00Co1D-He; Sat, 16 May 2020 13:11:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 16 May 2020 13:11:42 +0100
From: Marc Zyngier <maz@kernel.org>
To: Anup Patel <anup.patel@wdc.com>
Subject: Re: [PATCH 1/4] irqchip/sifive-plic: Setup cpuhp once after current
 handler is present
In-Reply-To: <20200516063901.18365-2-anup.patel@wdc.com>
References: <20200516063901.18365-1-anup.patel@wdc.com>
 <20200516063901.18365-2-anup.patel@wdc.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <d4e0dcceecad49e71ffe785f8950981d@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: anup.patel@wdc.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, tglx@linutronix.de, jason@lakedaemon.net,
 atish.patra@wdc.com, Alistair.Francis@wdc.com, anup@brainfault.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200516_051148_917953_967AACDE 
X-CRM114-Status: GOOD (  18.32  )
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
Cc: Jason Cooper <jason@lakedaemon.net>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Anup,

On 2020-05-16 07:38, Anup Patel wrote:
> For multiple PLIC instances, the plic_init() is called once for each
> PLIC instance. Due to this we have two issues:
> 1. cpuhp_setup_state() is called multiple times
> 2. plic_starting_cpu() can crash for boot CPU if cpuhp_setup_state()
>    is called before boot CPU PLIC handler is available.
> 
> This patch fixes both above issues.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-sifive-plic.c
> b/drivers/irqchip/irq-sifive-plic.c
> index 822e074c0600..7dc23edb3267 100644
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
> @@ -282,6 +283,7 @@ static int __init plic_init(struct device_node 
> *node,
>  	int error = 0, nr_contexts, nr_handlers = 0, i;
>  	u32 nr_irqs;
>  	struct plic_priv *priv;
> +	struct plic_handler *handler;
> 
>  	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
> @@ -310,7 +312,6 @@ static int __init plic_init(struct device_node 
> *node,
> 
>  	for (i = 0; i < nr_contexts; i++) {
>  		struct of_phandle_args parent;
> -		struct plic_handler *handler;
>  		irq_hw_number_t hwirq;
>  		int cpu, hartid;
> 
> @@ -364,9 +365,18 @@ static int __init plic_init(struct device_node 
> *node,
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

If there is no context handler for the boot CPU, the system is doomed,
right? It isn't able to get any interrupt, and you don't register
the hotplug notifier that could allow secondary CPUs to boot.

So what is the point? It feels like you should just give up here.

Also, the boot CPU is always CPU 0. So checking that you only register
the hotplug notifier from CPU 0 should be enough.

> +		cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
>  				  "irqchip/sifive/plic:starting",
>  				  plic_starting_cpu, plic_dying_cpu);
> +		plic_cpuhp_setup_done = true;
> +	}
> +
>  	pr_info("mapped %d interrupts with %d handlers for %d contexts.\n",
>  		nr_irqs, nr_handlers, nr_contexts);
>  	set_handle_irq(plic_handle_irq);

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

