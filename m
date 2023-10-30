Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A64C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 06:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wwVRwcl0aFla16lv+YiznOrmq4vqu94yMfm4gnih5b4=; b=uZv+rQqw5XeMTC
	bk3b2+TQpyUBYzcDvyh6z4xRXkkL7OcpTFQGROz6RwwDJdLmh5QImjHhMQK2PDMWBgkfvPSN8iXZl
	1IvKhu8DUgWWe8DzmwL+4+Zt28kT2vpH/DplWUDka0LjgN88synLrFhGQxIMS/4WXTkU3bPH6NvMp
	O/5xBGZuI7l5+52QyqlVq+1vf7l/BQqp+wRJjPLj0dXgsxdv0p4GQknUddF9k4gMFyQ0DjF807v0U
	66eaKH39zqkx3ZJ+Y5xWm+8BFd/TAm7g/RMOyf1SDsSIwpyZus0uumbwPHJF3YCpxzGt9Lzoj/8s0
	0GyulQ1e3dqExF9rJYcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxM0W-002grx-36;
	Mon, 30 Oct 2023 06:44:16 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxM0S-002gqP-0w
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 06:44:15 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 39U6hhxX026703;
	Mon, 30 Oct 2023 14:43:43 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Mon, 30 Oct 2023 14:43:40 +0800
Date: Mon, 30 Oct 2023 14:43:37 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <dminus@andestech.com>, <ycliang@andestech.com>,
        <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <tim609@andestech.com>,
        <dylan@andestech.com>, <locus84@andestech.com>
Subject: Re: [PATCH v2 03/10] irqchip/riscv-intc: Introduce Andes IRQ chip
Message-ID: <ZT9QmYDPC0cp77MM@APC323>
References: <20231019135723.3657156-1-peterlin@andestech.com>
 <87cyx04k53.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87cyx04k53.ffs@tglx>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 39U6hhxX026703
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_234412_787153_0F761597 
X-CRM114-Status: GOOD (  34.52  )
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

Hi Thomas,

On Fri, Oct 27, 2023 at 09:08:56AM +0200, Thomas Gleixner wrote:
> On Thu, Oct 19 2023 at 21:57, Yu Chien Peter Lin wrote:
> > This commit adds support for the Andes IRQ chip, which provides
> 
> "This commit" is not any different from "This patch" and equaly
> pointless. See Documentation/process/submitting-patches.rst

Sure, will rewrite the commit message.
Thanks for the pointer.

> Also please write out interrupt instead of IRQ. Changelogs are text and
> not subject to twitter limitations.

OK!

> > IRQ mask/unmask functions to access the custom CSR (SLIE)
> 
> What is a CSR? These acronyms are really annoying for people who are not
> familiar with the chip specific details.

OK!

> > +static void andes_intc_irq_mask(struct irq_data *d)
> > +{
> > +	unsigned int mask = BIT(d->hwirq % BITS_PER_LONG);
> > +
> > +	if (d->hwirq < ANDES_SLI_CAUSE_BASE)
> 
> This lacks a comment which explains why these hardware interrupts are
> special.

Sure, will add a comment here.

> > +		csr_clear(CSR_IE, mask);
> > +	else
> > +		csr_clear(ANDES_CSR_SLIE, mask);
> > +}
> > +
> > +static void andes_intc_irq_unmask(struct irq_data *d)
> > +{
> > +	unsigned int mask = BIT(d->hwirq % BITS_PER_LONG);
> > +
> > +	if (d->hwirq < ANDES_SLI_CAUSE_BASE)
> > +		csr_set(CSR_IE, mask);
> > +	else
> > +		csr_set(ANDES_CSR_SLIE, mask);
> > +}
> > +
> >  static void riscv_intc_irq_eoi(struct irq_data *d)
> >  {
> >  	/*
> > @@ -68,12 +89,35 @@ static struct irq_chip riscv_intc_chip = {
> >  	.irq_eoi = riscv_intc_irq_eoi,
> >  };
> >  
> > +static struct irq_chip andes_intc_chip = {
> > +	.name = "RISC-V INTC",
> > +	.irq_mask = andes_intc_irq_mask,
> > +	.irq_unmask = andes_intc_irq_unmask,
> > +	.irq_eoi = riscv_intc_irq_eoi,
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers

OK, will fix.

> > +};
> > +
> >  static int riscv_intc_domain_map(struct irq_domain *d, unsigned int irq,
> >  				 irq_hw_number_t hwirq)
> >  {
> > +	struct fwnode_handle *fn = riscv_get_intc_hwnode();
> > +	struct irq_chip *chip;
> > +	const char *cp;
> > +	int rc;
> > +
> >  	irq_set_percpu_devid(irq);
> 
> Why is this not moved after the failure condition too?
> 
> > -	irq_domain_set_info(d, irq, hwirq, &riscv_intc_chip, d->host_data,
> > -			    handle_percpu_devid_irq, NULL, NULL);
> > +
> > +	rc = fwnode_property_read_string(fn, "compatible", &cp);
> > +	if (rc)
> > +		return rc;
> > +
> > +	if (strcmp(cp, "riscv,cpu-intc") == 0)
> > +		chip = &riscv_intc_chip;
> > +	else if (strcmp(cp, "andestech,cpu-intc") == 0)
> > +		chip = &andes_intc_chip;
> 
> How is this supposed to work with ACPI?
> 
> The obvious solution for this is to have two different init functions
> 
> riscv_intc_init()
> {
>         riscv_intc_init_common(..., &risc_intc_chip);
> }
> 
> riscv_andes_init()
> {
>         riscv_intc_init_common(..., &andes_intc_chip);
> }
> 
> riscv_intc_init_common(...., *chip)
> {
>         // Set the interrupt chip pointer as domain host data
>         irqdomain_create_linear(...., chip);
> }
> 
> and then you can use that in the map function:
> 
>     chip = domain->host_data;
> 
> See?

Got it! Will reimplement according to this method.

> > diff --git a/include/linux/irqchip/irq-riscv-intc.h b/include/linux/irqchip/irq-riscv-intc.h
> > new file mode 100644
> > index 000000000000..87c105b5b545
> > --- /dev/null
> > +++ b/include/linux/irqchip/irq-riscv-intc.h
> > @@ -0,0 +1,12 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (C) 2023 Andes Technology Corporation
> > + */
> > +#ifndef __INCLUDE_LINUX_IRQCHIP_IRQ_RISCV_INTC_H
> > +#define __INCLUDE_LINUX_IRQCHIP_IRQ_RISCV_INTC_H
> > +
> > +#define ANDES_SLI_CAUSE_BASE	256
> > +#define ANDES_CSR_SLIE		0x9c4
> > +#define ANDES_CSR_SLIP		0x9c5
> > +
> > +#endif /* __INCLUDE_LINUX_IRQCHIP_IRQ_RISCV_INTC_H */
> 
> What's the purpose of this header file? The defines are only used in the
> interrupt chip driver code, so they can just be in the C file. No?
> 
> Thanks,

These definitions are shared with drivers/perf/riscv_pmu_sbi.c,
however, I should not add vendor specific things here, they
will be move to include/linux/soc/andes/irq.h.

Thanks for the review!

Best regards,
Peter Lin

>         tglx
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
