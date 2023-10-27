Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361D6C25B67
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 07:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3503e/R/nkuMLu7U+FDGJjf3M0Ls2KXjAWGiRk/51M=; b=hnTg/ZF+hdRUx7
	0v8+UA4coCUQ68VUPpAtzbNjIknpH5dPAhB09+Q5Th/S4nG6sh6LjaKuo9BsADc9DCqNFq5IzcK4a
	04petGhiSj33UnzwTHPv9OSidITTuRbymJtg2PsFX8M69iwg9aE3h92tH1Zq3N1c4f7kas2yXMlcj
	0JuS9WiTx+4w52kf/CwL5WCT+QL3gUyhKZ2Gp3NCvP4AYaA36llgwaHF0dVRvFKF66P6EIF+pvZyl
	AabnkTXUpJ/6/BP3c5SOv6wARmlFOZOg9ckBC6ngBlrE/Uph5I4JAKnqMJkflYh8ES/2G0Rkm+uKq
	ejzRsdvNAlw77krLb6+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwGxz-00Fjwd-1d;
	Fri, 27 Oct 2023 07:09:11 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwGxw-00FjqO-2k
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 07:09:10 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698390536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gS2w1/Bfi8i6DDWcB/LYnN4Uyo2XoSjAzsAo+3P1rhE=;
	b=xJaI0I9SbdRA1MUAA10lTxRe2PJdlTYZ/qKVe0NWxISoDDj4gxn3k5+iGHyIwkuUdido4r
	GT135+ErpzXcWFhZp7og8M5O8ngvIQUPdOJIfzU8dDxMGCO9cD30fiox9lMs10V4WS3RvY
	2wUb9I9IqM+qxJQ74vCwfvC/hN4iocLaBOzfEgHw7Ua6Z1MoTTiauAacOj37Vd2+gX8YsT
	QFHwJ/X1uwsm6ySO1UD5dgixQ9f2avOn5cbD0lKisFarWGzu/HuE7qhO/c8zutS37jBH85
	pB6Go2qgq7pcMzxnrjC5XuyWj4EOkZg6XPQsA9UAAH8z6jcZenKshY5GbM51OQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698390536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gS2w1/Bfi8i6DDWcB/LYnN4Uyo2XoSjAzsAo+3P1rhE=;
	b=mzDDZLL+KpmOjCnUAj9qbTtDUBoyxrHa5hR+TMailW3l5FE+Ru0fipv0s8ca4dDVeymvaz
	gaZBzqjr3/jRiOBA==
To: Yu Chien Peter Lin <peterlin@andestech.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, peterlin@andestech.com,
 dminus@andestech.com, ycliang@andestech.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com,
 dylan@andestech.com, locus84@andestech.com
Subject: Re: [PATCH v2 03/10] irqchip/riscv-intc: Introduce Andes IRQ chip
In-Reply-To: <20231019135723.3657156-1-peterlin@andestech.com>
References: <20231019135723.3657156-1-peterlin@andestech.com>
Date: Fri, 27 Oct 2023 09:08:56 +0200
Message-ID: <87cyx04k53.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_000909_034008_3CF42A1F 
X-CRM114-Status: GOOD (  23.91  )
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

On Thu, Oct 19 2023 at 21:57, Yu Chien Peter Lin wrote:
> This commit adds support for the Andes IRQ chip, which provides

"This commit" is not any different from "This patch" and equaly
pointless. See Documentation/process/submitting-patches.rst

Also please write out interrupt instead of IRQ. Changelogs are text and
not subject to twitter limitations.

> IRQ mask/unmask functions to access the custom CSR (SLIE)

What is a CSR? These acronyms are really annoying for people who are not
familiar with the chip specific details.

> +static void andes_intc_irq_mask(struct irq_data *d)
> +{
> +	unsigned int mask = BIT(d->hwirq % BITS_PER_LONG);
> +
> +	if (d->hwirq < ANDES_SLI_CAUSE_BASE)

This lacks a comment which explains why these hardware interrupts are
special.

> +		csr_clear(CSR_IE, mask);
> +	else
> +		csr_clear(ANDES_CSR_SLIE, mask);
> +}
> +
> +static void andes_intc_irq_unmask(struct irq_data *d)
> +{
> +	unsigned int mask = BIT(d->hwirq % BITS_PER_LONG);
> +
> +	if (d->hwirq < ANDES_SLI_CAUSE_BASE)
> +		csr_set(CSR_IE, mask);
> +	else
> +		csr_set(ANDES_CSR_SLIE, mask);
> +}
> +
>  static void riscv_intc_irq_eoi(struct irq_data *d)
>  {
>  	/*
> @@ -68,12 +89,35 @@ static struct irq_chip riscv_intc_chip = {
>  	.irq_eoi = riscv_intc_irq_eoi,
>  };
>  
> +static struct irq_chip andes_intc_chip = {
> +	.name = "RISC-V INTC",
> +	.irq_mask = andes_intc_irq_mask,
> +	.irq_unmask = andes_intc_irq_unmask,
> +	.irq_eoi = riscv_intc_irq_eoi,

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers

> +};
> +
>  static int riscv_intc_domain_map(struct irq_domain *d, unsigned int irq,
>  				 irq_hw_number_t hwirq)
>  {
> +	struct fwnode_handle *fn = riscv_get_intc_hwnode();
> +	struct irq_chip *chip;
> +	const char *cp;
> +	int rc;
> +
>  	irq_set_percpu_devid(irq);

Why is this not moved after the failure condition too?

> -	irq_domain_set_info(d, irq, hwirq, &riscv_intc_chip, d->host_data,
> -			    handle_percpu_devid_irq, NULL, NULL);
> +
> +	rc = fwnode_property_read_string(fn, "compatible", &cp);
> +	if (rc)
> +		return rc;
> +
> +	if (strcmp(cp, "riscv,cpu-intc") == 0)
> +		chip = &riscv_intc_chip;
> +	else if (strcmp(cp, "andestech,cpu-intc") == 0)
> +		chip = &andes_intc_chip;

How is this supposed to work with ACPI?

The obvious solution for this is to have two different init functions

riscv_intc_init()
{
        riscv_intc_init_common(..., &risc_intc_chip);
}

riscv_andes_init()
{
        riscv_intc_init_common(..., &andes_intc_chip);
}

riscv_intc_init_common(...., *chip)
{
        // Set the interrupt chip pointer as domain host data
        irqdomain_create_linear(...., chip);
}

and then you can use that in the map function:

    chip = domain->host_data;

See?

> diff --git a/include/linux/irqchip/irq-riscv-intc.h b/include/linux/irqchip/irq-riscv-intc.h
> new file mode 100644
> index 000000000000..87c105b5b545
> --- /dev/null
> +++ b/include/linux/irqchip/irq-riscv-intc.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2023 Andes Technology Corporation
> + */
> +#ifndef __INCLUDE_LINUX_IRQCHIP_IRQ_RISCV_INTC_H
> +#define __INCLUDE_LINUX_IRQCHIP_IRQ_RISCV_INTC_H
> +
> +#define ANDES_SLI_CAUSE_BASE	256
> +#define ANDES_CSR_SLIE		0x9c4
> +#define ANDES_CSR_SLIP		0x9c5
> +
> +#endif /* __INCLUDE_LINUX_IRQCHIP_IRQ_RISCV_INTC_H */

What's the purpose of this header file? The defines are only used in the
interrupt chip driver code, so they can just be in the C file. No?

Thanks,

        tglx


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
