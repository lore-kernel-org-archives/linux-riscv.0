Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390C8C48BEB
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 03:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhvFhfu7NId8AVFif8MKCd5n47jM4U4q5tw1fXG1H8M=; b=cqWjPd9bearDCU
	I9zRn9OOGc8KderdyiLLBwUngaa8LvMjMBcG/ZKuZjg7q9wcYmSKy4u+s4YGqjrUYGo/1Qm+IGY1H
	7jqCmhWHFRZJuaIe3Ra4w4LEXJnFuBc2R9BL7ZqN9gzg6Dm4CdZ1b5Xstl+CbCUV0HTlRWtC6n5rM
	wZ/VVNY2rBs2T4YA9cXoPsgn8UyG3jgkqQt3/+aDefv/m2CyhHx8TKRZf67ErUnNf7MkI9ISCEUFB
	2Pi6Thom7+19n00uPhT6NcoEjuIpI+bMUUjm3aCSSUvbU4lWIhhcwaRCNDRxaCSQvW8SBnG8TD4Wj
	hA5VF3byo8NjsunlTKZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rczjI-00000003NPT-07dd;
	Thu, 22 Feb 2024 03:26:36 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rczjD-00000003NIv-3XMs;
	Thu, 22 Feb 2024 03:26:33 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 41M3PcR8080879;
	Thu, 22 Feb 2024 11:25:38 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Thu, 22 Feb 2024 11:25:35 +0800
Date: Thu, 22 Feb 2024 11:25:35 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v8 02/10] irqchip/riscv-intc: Allow large non-standard
 interrupt number
Message-ID: <Zda-r16ysaKzPdLV@APC323>
References: <20240129092553.2058043-1-peterlin@andestech.com>
 <20240129092553.2058043-3-peterlin@andestech.com>
 <877cj8issa.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877cj8issa.ffs@tglx>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 41M3PcR8080879
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_192632_155790_6C315649 
X-CRM114-Status: GOOD (  16.13  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, unicorn_wang@outlook.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, Randolph <randolph@andestech.com>, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, linux-arm-kernel@lists.infradead.org, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org, wefu@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Thomas,

On Tue, Feb 13, 2024 at 11:04:53AM +0100, Thomas Gleixner wrote:
> On Mon, Jan 29 2024 at 17:25, Yu Chien Peter Lin wrote:
> >  static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
> >  {
> >  	unsigned long cause = regs->cause & ~CAUSE_IRQ_FLAG;
> >  
> > -	if (unlikely(cause >= BITS_PER_LONG))
> > -		panic("unexpected interrupt cause");
> > -
> > -	generic_handle_domain_irq(intc_domain, cause);
> > +	if (generic_handle_domain_irq(intc_domain, cause))
> > +		pr_warn_ratelimited("Failed to handle interrupt (cause: %ld)\n",
> > +				    cause);
> 
> Either let the cause stick out or you need brackets. See:
> 
>   https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#bracket-rules
> 
> >  }
> >  
> >  /*
> > @@ -93,6 +95,14 @@ static int riscv_intc_domain_alloc(struct irq_domain *domain,
> >  	if (ret)
> >  		return ret;
> >  
> > +	/*
> > +	 * Only allow hwirq for which we have corresponding standard or
> > +	 * custom interrupt enable register.
> > +	 */
> > +	if ((riscv_intc_nr_irqs <= hwirq && hwirq < riscv_intc_custom_base) ||
> > +	    (riscv_intc_custom_base + riscv_intc_custom_nr_irqs) <= hwirq)
> > +		return -EINVAL;
> 
> Duh. This mix of ordering required to read this 3 times. What's wrong
> with writing this consistently:
> 
> 	if ((hwirq >= riscv_intc_nr_irqs && hwirq < riscv_intc_custom_base) ||
> 	    (hwirq >= iscv_intc_custom_base + riscv_intc_custom_nr_irqs)
> 		return -EINVAL;
> 
> Hmm?
> 
> > -	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
> > +	pr_info("%d local interrupts mapped\n", riscv_intc_nr_irqs);
> > +	if (riscv_intc_custom_nr_irqs)
> > +		pr_info("%d custom local interrupts mapped\n",
> > +			riscv_intc_custom_nr_irqs);
> 
> See bracket rules.
>   
> >  	return 0;
> >  }
> > @@ -166,6 +178,10 @@ static int __init riscv_intc_init(struct device_node *node,
> >  		return 0;
> >  	}
> >  
> > +	riscv_intc_nr_irqs = BITS_PER_LONG;
> > +	riscv_intc_custom_base = riscv_intc_nr_irqs;
> 
> Why don't you initialize the static variables with constants right away?
> 
> > +	riscv_intc_custom_nr_irqs = 0;
> 
> It's already 0, no?
> 
> >  	return riscv_intc_init_common(of_node_to_fwnode(node));
> >  }
> 
> Thanks,
> 
>         tglx

Thanks for pointing these out, I'll fix them in PATCH v9.

Regards,
Peter Lin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
