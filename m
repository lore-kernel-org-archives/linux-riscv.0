Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12259C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 16:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSpbdNmCanqLZjPKB9FKza6iKicGsE5Km0Z8OcSq0z0=; b=xvKw62S5t0kXeL
	1IXGQ7Bhryb6J0UxbgzWvb9pg3clDc5Gn/NH9pzZiyB42bCx+valziR8+RL2ACTQmtyOaaMMBCRkv
	857a/zKp4o8B+/5LTGRupQteh65oCxrBWTa427gIYoM3RmUkdBZcLwAeAl3lOPyFuCNKFWMZOER4O
	7m3PfRBqxYv66NnmEHD7xbPVqilh1yOoO6Zkk/CBjJkm6d8aJPIWqRCsMEC6CFickg2TUfQ30FO6g
	kwM1j90JPZIGlsZvktQpfzbX0qpaQb0u9dl2wdS1yN0tymvV0g6ilBBltHnqnrBJCOm/t+FhtebGO
	4Ch4P3Y5639SGowbpSMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdIO-00Fy2D-0y;
	Fri, 08 Dec 2023 16:01:44 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdIJ-00Fy1F-1Q;
	Fri, 08 Dec 2023 16:01:41 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702051297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qvRAzOC1s8CTEnsQtk9rLB7j6MoLVbJs1vS74413VOI=;
	b=F6b04T2civNLQw/P6s4AjzqPlLxejEuPzBLrsl+3EDPegBJH2cSw9MQ1smQ5Sw29sgPJQu
	ITzGSWkzHF9HDteBgxCvuKiCROwKwUayT0g5XTT0TV2meAB/hQMDJfPOy5+E6qhvuVdcxz
	F5h4rv9IjyTf01PH68AhJNVMolCVgX+T9+lF4iqo2ogmyFISaR7ZE58c/FEgr0Ldvm88wA
	fuJ03avfwq9fqVlsu1VqdbvDFc5IfzeriRwuH5YnME0j4+rgIUvo8xzAw6YYf6aCuz5A6R
	svKmtinn9ugY0gdh0PrRE0i22zRIx+ijyF9odKxUwrPUGDVK2RqBrnq/aSrTlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702051297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qvRAzOC1s8CTEnsQtk9rLB7j6MoLVbJs1vS74413VOI=;
	b=/EgalgirjNm9ep45ZEQnecmn1UAJ6YqdDBfC+cG20lSeVMQLVO8XCGc5FYnuScjwlSzGAe
	kBHD3v0GQNt+fqCQ==
To: Yu Chien Peter Lin <peterlin@andestech.com>, acme@kernel.org,
 adrian.hunter@intel.com, ajones@ventanamicro.com,
 alexander.shishkin@linux.intel.com, andre.przywara@arm.com,
 anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org,
 conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org,
 devicetree@vger.kernel.org, dminus@andestech.com, evan@rivosinc.com,
 geert+renesas@glider.be, guoren@kernel.org, heiko@sntech.de,
 irogers@google.com, jernej.skrabec@gmail.com, jolsa@kernel.org,
 jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
 locus84@andestech.com, magnus.damm@gmail.com, mark.rutland@arm.com,
 mingo@redhat.com, n.shubin@yadro.com, namhyung@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, peterlin@andestech.com,
 peterz@infradead.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rdunlap@infradead.org, robh+dt@kernel.org, samuel@sholland.org,
 sunilvl@ventanamicro.com, tim609@andestech.com, uwu@icenowy.me,
 wens@csie.org, will@kernel.org, ycliang@andestech.com,
 inochiama@outlook.com
Subject: Re: [PATCH v4 03/13] irqchip/riscv-intc: Introduce Andes hart-level
 interrupt controller
In-Reply-To: <20231122121235.827122-4-peterlin@andestech.com>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-4-peterlin@andestech.com>
Date: Fri, 08 Dec 2023 17:01:36 +0100
Message-ID: <87y1e4r8db.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_080139_757898_BA6C5F5E 
X-CRM114-Status: GOOD (  18.69  )
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

On Wed, Nov 22 2023 at 20:12, Yu Chien Peter Lin wrote:
> To share the riscv_intc_domain_map() with the generic RISC-V INTC and
> ACPI, we add a chip parameter to riscv_intc_init_common(), so it can be

s/we//

See: Documentation/process/

> passed to the irq_domain_set_info() as private data.
> diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> index 2fdd40f2a791..30f0036c8978 100644
> --- a/drivers/irqchip/irq-riscv-intc.c
> +++ b/drivers/irqchip/irq-riscv-intc.c
> @@ -17,6 +17,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/smp.h>
> +#include <linux/soc/andes/irq.h>
>  
>  static struct irq_domain *intc_domain;
>  
> @@ -46,6 +47,31 @@ static void riscv_intc_irq_unmask(struct irq_data *d)
>  	csr_set(CSR_IE, BIT(d->hwirq));
>  }
>  
> +static void andes_intc_irq_mask(struct irq_data *d)
> +{
> +	/*
> +	 * Andes specific S-mode local interrupt causes (hwirq)
> +	 * are defined as (256 + n) and controlled by n-th bit
> +	 * of SLIE.
> +	 */
> +	unsigned int mask = BIT(d->hwirq % BITS_PER_LONG);

How is this supposed to be correct with BITS_PER_LONG == 64?

> +
> +	if (d->hwirq < ANDES_SLI_CAUSE_BASE)
> +		csr_clear(CSR_IE, mask);
> +	else
> +		csr_clear(ANDES_CSR_SLIE, mask);
> +}
> +
> +static void andes_intc_irq_unmask(struct irq_data *d)
> +{
> +	unsigned int mask = BIT(d->hwirq % BITS_PER_LONG);

Ditto.

> +	if (d->hwirq < ANDES_SLI_CAUSE_BASE)
> +		csr_set(CSR_IE, mask);
> +	else
> +		csr_set(ANDES_CSR_SLIE, mask);
> +}

>  static int riscv_intc_domain_map(struct irq_domain *d, unsigned int irq,
>  				 irq_hw_number_t hwirq)
>  {
> +	struct irq_chip *chip = d->host_data;
> +
>  	irq_set_percpu_devid(irq);
> -	irq_domain_set_info(d, irq, hwirq, &riscv_intc_chip, d->host_data,
> +	irq_domain_set_info(d, irq, hwirq, chip, d->host_data,

So this sets 'chip_data' to the chip itself. What's the point? Just set
it to NULL as the chip obviously does not need chip_data at all.

>  			    handle_percpu_devid_irq, NULL, NULL);
>  
>  	return 0;
> @@ -112,11 +147,12 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
>  	return intc_domain->fwnode;
>  }
>  
> -static int __init riscv_intc_init_common(struct fwnode_handle *fn)
> +static int __init riscv_intc_init_common(struct fwnode_handle *fn,
> +					 struct irq_chip *chip)
>  {
>  	int rc;
>  
> -	intc_domain = irq_domain_create_tree(fn, &riscv_intc_domain_ops, NULL);
> +	intc_domain = irq_domain_create_tree(fn, &riscv_intc_domain_ops, chip);
>  	if (!intc_domain) {
>  		pr_err("unable to add IRQ domain\n");
>  		return -ENXIO;
> @@ -138,6 +174,7 @@ static int __init riscv_intc_init(struct device_node *node,
>  {
>  	int rc;
>  	unsigned long hartid;
> +	struct irq_chip *chip = &riscv_intc_chip;

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations

Thanks

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
