Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F5BC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 10:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fs5rVVRAawHn0ddu1jVpfsgI+QBVwaXOinGgqsYlaYM=; b=hhnmVZKSB1VMsZ
	7z1+CULzkZBkfyEtMnl++Sr78IVcNuUJb9hBimsnEA6GC44LRNtdcUOBzSrUIn0by0TU/N4wfoT3c
	EWgg98fJ2AiENtyGGVLKXJkCVYb5LbW/b4ICmxn19qqmCBjoh9132c5lm3mTYmItv4m2WKgKWKAqn
	qGEoYzBuXlyIu854uzEi4pzltigTmGzyzMW3rYKVdKKiCQrY2KlH3uuz5HYx4AH5WlVjfVvJYhAZ8
	kgeNQeKaUVU/jVJ2EVuY9NLJfzbwKlAm6AvqCW46Rm0lKKGEJwbOOYMUShbMBL73aFZ/zq/16pNKE
	zBz7cZ+zHUNRN+1l+xrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD01d-00BIoC-2E;
	Tue, 12 Dec 2023 10:30:05 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD01Z-00BInL-1L;
	Tue, 12 Dec 2023 10:30:03 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3BCASoWD093073;
	Tue, 12 Dec 2023 18:28:50 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Tue, 12 Dec 2023 18:28:47 +0800
Date: Tue, 12 Dec 2023 18:28:47 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 03/13] irqchip/riscv-intc: Introduce Andes hart-level
 interrupt controller
Message-ID: <ZXg130SN3AOUmx_v@APC323>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-4-peterlin@andestech.com>
 <87y1e4r8db.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y1e4r8db.ffs@tglx>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3BCASoWD093073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_023001_932297_B2C0B9AD 
X-CRM114-Status: GOOD (  24.88  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, jszhang@kernel.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Thomas,

On Fri, Dec 08, 2023 at 05:01:36PM +0100, Thomas Gleixner wrote:
> On Wed, Nov 22 2023 at 20:12, Yu Chien Peter Lin wrote:
> > To share the riscv_intc_domain_map() with the generic RISC-V INTC and
> > ACPI, we add a chip parameter to riscv_intc_init_common(), so it can be
> 
> s/we//
> 
> See: Documentation/process/
> 
> > passed to the irq_domain_set_info() as private data.
> > diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> > index 2fdd40f2a791..30f0036c8978 100644
> > --- a/drivers/irqchip/irq-riscv-intc.c
> > +++ b/drivers/irqchip/irq-riscv-intc.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/smp.h>
> > +#include <linux/soc/andes/irq.h>
> >  
> >  static struct irq_domain *intc_domain;
> >  
> > @@ -46,6 +47,31 @@ static void riscv_intc_irq_unmask(struct irq_data *d)
> >  	csr_set(CSR_IE, BIT(d->hwirq));
> >  }
> >  
> > +static void andes_intc_irq_mask(struct irq_data *d)
> > +{
> > +	/*
> > +	 * Andes specific S-mode local interrupt causes (hwirq)
> > +	 * are defined as (256 + n) and controlled by n-th bit
> > +	 * of SLIE.
> > +	 */
> > +	unsigned int mask = BIT(d->hwirq % BITS_PER_LONG);
> 
> How is this supposed to be correct with BITS_PER_LONG == 64?

Yes, I should subtract ANDES_SLI_CAUSE_BASE directly here.

> > +
> > +	if (d->hwirq < ANDES_SLI_CAUSE_BASE)
> > +		csr_clear(CSR_IE, mask);
> > +	else
> > +		csr_clear(ANDES_CSR_SLIE, mask);
> > +}
> > +
> > +static void andes_intc_irq_unmask(struct irq_data *d)
> > +{
> > +	unsigned int mask = BIT(d->hwirq % BITS_PER_LONG);
> 
> Ditto.
> 
> > +	if (d->hwirq < ANDES_SLI_CAUSE_BASE)
> > +		csr_set(CSR_IE, mask);
> > +	else
> > +		csr_set(ANDES_CSR_SLIE, mask);
> > +}
> 
> >  static int riscv_intc_domain_map(struct irq_domain *d, unsigned int irq,
> >  				 irq_hw_number_t hwirq)
> >  {
> > +	struct irq_chip *chip = d->host_data;
> > +
> >  	irq_set_percpu_devid(irq);
> > -	irq_domain_set_info(d, irq, hwirq, &riscv_intc_chip, d->host_data,
> > +	irq_domain_set_info(d, irq, hwirq, chip, d->host_data,
> 
> So this sets 'chip_data' to the chip itself. What's the point? Just set
> it to NULL as the chip obviously does not need chip_data at all.

Will fix. Thanks.

Best regards,
Peter Lin

> >  			    handle_percpu_devid_irq, NULL, NULL);
> >  
> >  	return 0;
> > @@ -112,11 +147,12 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
> >  	return intc_domain->fwnode;
> >  }
> >  
> > -static int __init riscv_intc_init_common(struct fwnode_handle *fn)
> > +static int __init riscv_intc_init_common(struct fwnode_handle *fn,
> > +					 struct irq_chip *chip)
> >  {
> >  	int rc;
> >  
> > -	intc_domain = irq_domain_create_tree(fn, &riscv_intc_domain_ops, NULL);
> > +	intc_domain = irq_domain_create_tree(fn, &riscv_intc_domain_ops, chip);
> >  	if (!intc_domain) {
> >  		pr_err("unable to add IRQ domain\n");
> >  		return -ENXIO;
> > @@ -138,6 +174,7 @@ static int __init riscv_intc_init(struct device_node *node,
> >  {
> >  	int rc;
> >  	unsigned long hartid;
> > +	struct irq_chip *chip = &riscv_intc_chip;
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations
> 
> Thanks
> 
>         tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
