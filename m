Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC89EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 14:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4KO/PX3reSt31LF8nT5Wmz59IPhe4AykbWSB15iSVQ=; b=spcPLE/298elE3
	nhs8wafGK/KIw/3aT91X01/T+6wlHP7rhRqDhC2OGLC/aiWs7ThLJ0LVZxxXyeN8YMh8APBxE0Smw
	6StL46EUAeHnjzsaBAb8HoRDki2pv+WtA02cbQozu0v2F4TavzhlzQNausSB7MBrrbXgWb6ICQ93T
	RFWR6e/+Ah+4kj3cugD0qZZfSqO9o7e5sQEcMxpJhGS56RSwHDFNLv5ON1/i1flD3EGFO09HWBqA/
	qImGId4aVEECouCYxRWDup9t1E2aWmyA5B69pzSlDw6McPyEVJGUnSESCYqzbqNyzB90dhP35b8pf
	ABsVy420Fx5ds+X576Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJE6T-00F55C-1T;
	Tue, 11 Jul 2023 14:12:33 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJE6Q-00F53x-1s
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 14:12:31 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31441dfbf97so6515736f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 07:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689084748; x=1691676748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kfD1QKdUUlCP07+roOoFywxk5muRqmFooE0qd5aLBns=;
        b=Kt9VufYvB/j33LbCFZgmXbkZGy73eeJnSwJU6p4I6FPhIWqWc/XSW9TCpHoNIlP8rV
         OTYAZr32mXwnI6z3yyXxO3bpKIrZwF4CJPrTbU2HTgCOTL8WMBFfMHVQkP+g87VqCPXM
         qfcuNn4l4ev0h26GQGWG3Mj1Xjeoo7InCIXUFEca6NR+P2cDr5X8/3eeI8WqJoWAg2TN
         iFQSJqpzrhAGrQ2tebTqq7MlT5APaAGqd1W+pXzuOdgmFeQ6Ka8F9I90N6QOuceU/gy6
         pk6Xn9jWWHFGkTJ+GvzoQk6r/PRePEf4t7JPhZchGETRjvERS3nflezo9XljrQUBYOa2
         thgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689084748; x=1691676748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfD1QKdUUlCP07+roOoFywxk5muRqmFooE0qd5aLBns=;
        b=G4G4teDdq17Ll3Fr05HgKm2prsoa0U9Qg2WZnQi/3uU+s0Vf760fhuFYAvmxjU2tf/
         DLTmftwJe6HxgEMAWJonp/cESPfBlPaDwHXxJqh7hVeOn8Zvenm5AVH4frUFw2ATe2Yc
         XgSLlVvkPcuDmAjnFlzZ7LpM33HBI4IMWF5uiVKveu4yhTs0jXSb5Ce1sFaUc6joSN8E
         MT4GrgMK5qjYzwdL52tMeHRbsIaJs0lgX6IrXbQNfiWODLJJTDuxPNoN6IM2gQl5HEGc
         xSUJPnnDFha2xgthAhxls2HY3FFFb7h8Gfkfe3byDD2s+wko6aPhBrx3K/FIuvjjaMyj
         QK6w==
X-Gm-Message-State: ABy/qLY4b48ZFt7pGRwQGQPSQwWH6ozDj+gWewC7+Q5oFeiHvGmwQcpK
	4jxTXlt/BPtHhFKQmM1IMauYKA==
X-Google-Smtp-Source: APBJJlHdpMDer9jq8C+08J0C6lUJOUhXFT5I8NKyZycrI5aqDIXOSH3usMO5vCEWntD4j587cS4rRw==
X-Received: by 2002:adf:db04:0:b0:313:ee73:cc9a with SMTP id s4-20020adfdb04000000b00313ee73cc9amr13524583wri.70.1689084747658;
        Tue, 11 Jul 2023 07:12:27 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id o18-20020adfe812000000b00314417f5272sm2354907wrm.64.2023.07.11.07.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:12:27 -0700 (PDT)
Date: Tue, 11 Jul 2023 16:12:26 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v5 2/9] irqchip/riscv-intc: Add support for RISC-V AIA
Message-ID: <20230711-df9211fcae3b67948896b77f@orel>
References: <20230710094321.1378351-1-apatel@ventanamicro.com>
 <20230710094321.1378351-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230710094321.1378351-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_071230_621844_64C7668F 
X-CRM114-Status: GOOD (  26.98  )
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
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 10, 2023 at 03:13:14PM +0530, Anup Patel wrote:
> The RISC-V advanced interrupt architecture (AIA) extends the per-HART
> local interrupts in following ways:
> 1. Minimum 64 local interrupts for both RV32 and RV64
> 2. Ability to process multiple pending local interrupts in same
>    interrupt handler
> 3. Priority configuration for each local interrupts
> 4. Special CSRs to configure/access the per-HART MSI controller

afaict, we're only doing (1) and (2) from this list in this patch.

> 
> This patch adds support for RISC-V AIA in the RISC-V intc driver.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  drivers/irqchip/irq-riscv-intc.c | 36 ++++++++++++++++++++++++++------
>  1 file changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> index 4adeee1bc391..e235bf1708a4 100644
> --- a/drivers/irqchip/irq-riscv-intc.c
> +++ b/drivers/irqchip/irq-riscv-intc.c
> @@ -17,6 +17,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/smp.h>
> +#include <asm/hwcap.h>
>  
>  static struct irq_domain *intc_domain;
>  
> @@ -30,6 +31,15 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
>  	generic_handle_domain_irq(intc_domain, cause);
>  }
>  
> +static asmlinkage void riscv_intc_aia_irq(struct pt_regs *regs)
> +{
> +	unsigned long topi;
> +
> +	while ((topi = csr_read(CSR_TOPI)))
> +		generic_handle_domain_irq(intc_domain,
> +					  topi >> TOPI_IID_SHIFT);
> +}
> +
>  /*
>   * On RISC-V systems local interrupts are masked or unmasked by writing
>   * the SIE (Supervisor Interrupt Enable) CSR.  As CSRs can only be written
> @@ -39,12 +49,18 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
>  
>  static void riscv_intc_irq_mask(struct irq_data *d)
>  {
> -	csr_clear(CSR_IE, BIT(d->hwirq));
> +	if (d->hwirq < BITS_PER_LONG)
> +		csr_clear(CSR_IE, BIT(d->hwirq));
> +	else
> +		csr_clear(CSR_IEH, BIT(d->hwirq - BITS_PER_LONG));

We can optimize rv64 by allowing the compiler to remove the branch

 if (IS_ENABLED(CONFIG_32BIT) && d->hwirq >= 32)
    csr_clear(CSR_IEH, BIT(d->hwirq - 32));
 else
    csr_clear(CSR_IE, BIT(d->hwirq));


>  }
>  
>  static void riscv_intc_irq_unmask(struct irq_data *d)
>  {
> -	csr_set(CSR_IE, BIT(d->hwirq));
> +	if (d->hwirq < BITS_PER_LONG)
> +		csr_set(CSR_IE, BIT(d->hwirq));
> +	else
> +		csr_set(CSR_IEH, BIT(d->hwirq - BITS_PER_LONG));

Same comment as above.

>  }
>  
>  static void riscv_intc_irq_eoi(struct irq_data *d)
> @@ -115,16 +131,22 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
>  
>  static int __init riscv_intc_init_common(struct fwnode_handle *fn)
>  {
> -	int rc;
> +	int rc, nr_irqs = BITS_PER_LONG;
> +
> +	if (riscv_isa_extension_available(NULL, SxAIA) && BITS_PER_LONG == 32)
> +		nr_irqs = nr_irqs * 2;

The AIA spec states sie and sip are explicitly 64, so how about writing
this as

 int rc, nr_irqs = BITS_PER_LONG;

 if (riscv_isa_extension_available(NULL, SxAIA))
     nr_irqs = 64;

>  
> -	intc_domain = irq_domain_create_linear(fn, BITS_PER_LONG,
> +	intc_domain = irq_domain_create_linear(fn, nr_irqs,
>  					       &riscv_intc_domain_ops, NULL);
>  	if (!intc_domain) {
>  		pr_err("unable to add IRQ domain\n");
>  		return -ENXIO;
>  	}
>  
> -	rc = set_handle_irq(&riscv_intc_irq);
> +	if (riscv_isa_extension_available(NULL, SxAIA))
> +		rc = set_handle_irq(&riscv_intc_aia_irq);
> +	else
> +		rc = set_handle_irq(&riscv_intc_irq);

nit: blank line here

>  	if (rc) {
>  		pr_err("failed to set irq handler\n");
>  		return rc;
> @@ -132,7 +154,9 @@ static int __init riscv_intc_init_common(struct fwnode_handle *fn)
>  
>  	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
>  
> -	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
> +	pr_info("%d local interrupts mapped%s\n",
> +		nr_irqs, (riscv_isa_extension_available(NULL, SxAIA)) ?

nit: unnecessary ()

> +			 " using AIA" : "");
>  
>  	return 0;
>  }
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
