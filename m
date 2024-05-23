Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4979DC25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 21:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2L9LkmNiCEjvQ6h+Hk7BWkxznnontOqpBxX7w0Y9vKE=; b=3UVxEIweRZMz44
	cHuWDOA3V+XwUgmN/usBak1IFGoI0/JoVsGWoywd/kT4pgfApg3TA+8MfmU5jQv0Ml4vbKmmAEHkb
	hkevejA0ymIulYRdGdXhcexah7zYqfDxb7KTVR8v7n9fGbz1pNrR7zhbAMm88HGrke+bGOmXMv8ZQ
	kySgHXVaDWa8fZi/+WeSiWXDZ+WtYXxb5BA3eQAV03FrmOGgq7XldkE39/3q0NpREH2lQq2Dbi9Tv
	ApA4OHcsKdjH+o2LZgIDUZsxh3lhjVuxtby2y3FQwDEDSOsM+G88dMjhIce0yozm8kDw+qkVzIiNU
	NMMJlBqsPzbfIg2/s05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAGHT-00000007Oti-1Vax;
	Thu, 23 May 2024 21:47:23 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAGHL-00000007OsL-3Ow9;
	Thu, 23 May 2024 21:47:19 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1716500826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HfSWMIeSro48ZWRAqUv8vmWmiMIU3qQetnBBw4e5rJU=;
	b=031Z2ztTxyuFXWApXykB4FQ6WaX9zYH0aXVpcqWQB5qgDssiFxcYkRuP1BHwBoJ0as9q/P
	EXzT6AwP1f0MokxzuLUtGHnd/YRw6WlyeA3HqslxGXNKpX5tBLVchRJXUxPP3ciz07FdXC
	P/IsavOejg3ADUlytLFev1n1x38CxXmCTeOmlrGUgy+dVEu2JXXP76YK3Y74Q43LLU+rpx
	4e818JFQXHcoX9MRoZIv+/tG6baHUjQO/AN6kVInuwH6xJm8KrDuozEyKCeBwJtzdUm4LO
	/OP+ayf6aZztWmSr9kpUB6ABm2jqlch7+LGwc3L8WMXS9E/1Qi0N2qxEpt8xdQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1716500826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HfSWMIeSro48ZWRAqUv8vmWmiMIU3qQetnBBw4e5rJU=;
	b=uPxNlIt2bLb0MzrZ7XtUuIjHV0iT2joAzZuN1nk4jaICo6I8QMAAOXKwoGUFFYbIa7H/D7
	NeqcFf+VNhZB4jBA==
To: Sunil V L <sunilvl@ventanamicro.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
 acpica-devel@lists.linux.dev
Subject: Re: [PATCH v5 13/17] irqchip/riscv-intc: Add ACPI support for AIA
In-Reply-To: <20240501121742.1215792-14-sunilvl@ventanamicro.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-14-sunilvl@ventanamicro.com>
Date: Thu, 23 May 2024 23:47:06 +0200
Message-ID: <874jaofbfp.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_144716_188482_173EBDDB 
X-CRM114-Status: GOOD (  23.88  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Samuel Holland <samuel.holland@sifive.com>, Robert Moore <robert.moore@intel.com>, Conor Dooley <conor.dooley@microchip.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, May 01 2024 at 17:47, Sunil V L wrote:
> diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> index 9e71c4428814..af7a2f78f0ee 100644
> --- a/drivers/irqchip/irq-riscv-intc.c
> +++ b/drivers/irqchip/irq-riscv-intc.c
> @@ -249,14 +249,105 @@ IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
>  IRQCHIP_DECLARE(andes, "andestech,cpu-intc", riscv_intc_init);
>  
>  #ifdef CONFIG_ACPI
> +struct rintc_data {
> +	u32 ext_intc_id;
> +	unsigned long hart_id;
> +	u64 imsic_addr;
> +	u32 imsic_size;

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers

> +};
> +
> +static u32 nr_rintc;
> +static struct rintc_data *rintc_acpi_data[NR_CPUS];
> +
> +int acpi_get_intc_index_hartid(u32 index, unsigned long *hartid)

Why int? All of these functions have strictly boolean return values:
success = true, fail = false, no?

Either bool or get rid of the pointer and let the function return
either the real hart id or an invalid one.

> +{
> +	if (index >= nr_rintc)
> +		return -1;
> +
> +	*hartid = rintc_acpi_data[index]->hart_id;
> +	return 0;

I.e.

	return index >= nr_rintc ? rintc_acpi_data[index]->hart_id : INVALID_HART_ID;

> +int acpi_get_ext_intc_parent_hartid(u8 id, u32 idx, unsigned long *hartid)
> +{
> +	int i, j = 0;
> +
> +	for (i = 0; i < nr_rintc; i++) {
> +		if (APLIC_PLIC_ID(rintc_acpi_data[i]->ext_intc_id) == id) {
> +			if (idx == j) {
> +				*hartid = rintc_acpi_data[i]->hart_id;
> +				return 0;
> +			}
> +			j++;
> +		}
> +	}
> +
> +	return -1;
> +}
> +
> +void acpi_get_plic_nr_contexts(u8 id, int *nr_contexts)
> +{
> +	int i, j = 0;
> +
> +	for (i = 0; i < nr_rintc; i++) {
> +		if (APLIC_PLIC_ID(rintc_acpi_data[i]->ext_intc_id) == id)
> +			j++;
> +	}
> +
> +	*nr_contexts = j;
> +}
> +
> +int acpi_get_plic_context(u8 id, u32 idx, int *context_id)
> +{
> +	int i, j = 0;
> +
> +	for (i = 0; i < nr_rintc; i++) {
> +		if (APLIC_PLIC_ID(rintc_acpi_data[i]->ext_intc_id) == id) {
> +			if (idx == j) {
> +				*context_id = IDC_CONTEXT_ID(rintc_acpi_data[i]->ext_intc_id);
> +				return 0;
> +			}
> +
> +			j++;
> +		}
> +	}

So that's the third incarnation of the same loop with the truly self
explaining variable and argument names.

    j is actually the index of the context which is associated to a
    given PLIC ID.

    idx is the context index to search for

Right? So why can't these things be named in a way which makes the
intent of the code clear?

Also why are all the arguments u8/u32? There is no hardware
involved. Simple 'unsigned int' is just fine and the u8/u32 is not bying
you anything here.

Aside of that these ugly macros can be completely avoided and the code
can be written without a copy & pasta orgy.

struct rintc_data {
	union {
		u32		ext_intc_id;
                struct {
                	u32	context_id	: 16,
                        			:  8,
                        	aplic_plic_id	:  8;
                }
        };
	unsigned long		hart_id;
	u64			imsic_addr;
	u32			imsic_size;
};

#define for_each_matching_plic(_plic, _plic_id)				\
	for (_plic = 0; _plic < nr_rintc; _plict++)			\
        	if (rintc_acpi_data[_plic]->aplic_plic_id != _plic_id)	\
                	continue;					\
                else

unsigned int acpi_get_plic_nr_contexts(unsigned int plic_id)
{
	unsigned int nctx = 0;

	for_each_matching_plic(plic, plic_id)
		nctx++;

	return nctx;
}

static struct rintc_data *get_plic_context(unsigned int plic_id, unsigned int ctxt_idx)
{
	unsigned int ctxt = 0;

	for_each_matching_plic(plic, plic_id) {
        	if (ctxt == ctxt_idx)
                	return rintc_acpi_data + plic;
        }
        return NULL;
}

unsigned long acpi_get_ext_intc_parent_hartid(unsigned int plic_id, unsigned int ctxt_idx)
{
        struct rintc_data *data = get_plic_context(plic_id, ctxt_idx);

        return data ? data->hart_id : INVALID_HART_ID;
}

unsigned int acpi_get_plic_context(unsigned int plic_id, unsigned int ctxt_idx)
{
        struct rintc_data *data = get_plic_context(plic_id, ctxt_idx);

        return data ? data->context_id : INVALID_CONTEXT;
}

Or something like that. Hmm?

> +int acpi_get_imsic_mmio_info(u32 index, struct resource *res)
> +{
> +	if (index >= nr_rintc)
> +		return -1;
> +
> +	res->start = rintc_acpi_data[index]->imsic_addr;
> +	res->end = res->start + rintc_acpi_data[index]->imsic_size - 1;
> +	res->flags = IORESOURCE_MEM;
> +	return 0;
> +}
> +
> +static struct fwnode_handle *ext_entc_get_gsi_domain_id(u32 gsi)
> +{
> +	return riscv_acpi_get_gsi_domain_id(gsi);
> +}

This wrapper is required because using riscv_acpi_get_gsi_domain_id()
directly is too obvious, right?

>  static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
>  				       const unsigned long end)
>  {
> -	struct fwnode_handle *fn;
>  	struct acpi_madt_rintc *rintc;
> +	struct fwnode_handle *fn;
> +	int rc;
>  
>  	rintc = (struct acpi_madt_rintc *)header;
> +	rintc_acpi_data[nr_rintc] = kzalloc(sizeof(*rintc_acpi_data[0]), GFP_KERNEL);
> +	if (!rintc_acpi_data[nr_rintc])
> +		return -ENOMEM;
> +
> +	rintc_acpi_data[nr_rintc]->ext_intc_id = rintc->ext_intc_id;
> +	rintc_acpi_data[nr_rintc]->hart_id = rintc->hart_id;
> +	rintc_acpi_data[nr_rintc]->imsic_addr = rintc->imsic_addr;
> +	rintc_acpi_data[nr_rintc]->imsic_size = rintc->imsic_size;
> +	nr_rintc++;
>  
>  	/*
>  	 * The ACPI MADT will have one INTC for each CPU (or HART)
> @@ -273,7 +364,14 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
>  		return -ENOMEM;
>  	}
>  
> -	return riscv_intc_init_common(fn, &riscv_intc_chip);
> +	rc = riscv_intc_init_common(fn, &riscv_intc_chip);
> +	if (rc) {
> +		irq_domain_free_fwnode(fn);
> +		return rc;
> +	}

This looks like a completely unrelated bug fix. Please don't mix functional
changes and fixes.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
