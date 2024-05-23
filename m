Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F2AC25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 22:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kmgh0j+JA+g39SCUiPlYYymkpOxWk8xcXF0abxV+HT8=; b=L1nSBAZjX276ij
	K7oM7k/qm9xOdNOGMiFJqBkq74PlNHq3i7g6p95W+BJ5q5WR4ALTNsp+7y7M8GmcqSO5p406RKCcJ
	WstDzyDyyIrsKJEHZrQEndCjUQFcdHSCiuGZ9oqZx2s/uC1zf7MJoiXCAZuNDaUs6bXf2S4qvImzl
	2mUmLir/7Icf2NyANxVQxGlI4jR9DCBsfJI6e6Ya91/HJSXMlMktn6rgGkqKPa+rA1rKdpSNEmYFU
	8T09J4rAVfBQjf/PkaSL4tFso6g3ze1u6sVDQFPNVtn8Iys4ltagfNDTsHh/aLVkZ/a6KQ4wTmntQ
	fLLhc9ESwZSnMOrT06tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAGU9-00000007QW1-26NF;
	Thu, 23 May 2024 22:00:29 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAGU4-00000007QTu-1I6H;
	Thu, 23 May 2024 22:00:27 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1716501621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=18bFCkDiE5Sbgi4NXueQ8erF60YbZu7PrN26lvvIIBA=;
	b=AbYeiDrhr7a8f7DpLWT7jPVQsX5p8BYnloO9JHGWZo1jwWM2TNA1GkS+RXgQQZ4kwveXJA
	uO2F3wxgENt5+tKqVIgI6LKhXREauGP4TyVSnMEjWlqAQaaQOAFEqtPs/deTAO0TFZJ7Ty
	XF8dZT5GJXGueFBS1ZHnF05S7WpTqg0DfkUciatQMe2lVzrH9N7yj6h8ufGhwlj3MNvTIQ
	EyaFwwIde5NjZXu/+dN8DnAO4TXG/44owA2GfGZdyYXZKje8Uxr03QDeKC3OlmZc4fjhmF
	yOl2dALXgw8lwL0coqnq1DwlyJLRFqb5paIzqkr2HPPs4pBa2EKFPyuWxO8WYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1716501621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=18bFCkDiE5Sbgi4NXueQ8erF60YbZu7PrN26lvvIIBA=;
	b=hG7nVsQdEZxaAwZk4oZt4Q8Vn66oqj4h5KlI8OqVC3M2q2XO0TFXx9+UzcEfwt+sQD2dkW
	Gavtq8THOFkIrzAw==
To: Sunil V L <sunilvl@ventanamicro.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
 acpica-devel@lists.linux.dev
Subject: Re: [PATCH v5 14/17] irqchip/riscv-imsic: Add ACPI support
In-Reply-To: <20240501121742.1215792-15-sunilvl@ventanamicro.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-15-sunilvl@ventanamicro.com>
Date: Fri, 24 May 2024 00:00:21 +0200
Message-ID: <871q5sfatm.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_150024_660056_E5D6C34C 
X-CRM114-Status: GOOD (  17.77  )
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

> RISC-V IMSIC interrupt controller provides IPI and MSI support.
> Currently, DT based drivers setup the IPI feature early during boot but
> defer setting up the MSI functionality. However, in ACPI systems, ACPI,
> both IPI and MSI features need to be initialized early itself.

Why?

> +
> +#ifdef CONFIG_ACPI
> +
> +static struct fwnode_handle *imsic_acpi_fwnode;
> +
> +struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev)

Why is this function global? It's only used in the very same file and
under the same CONFIG_ACPI #ifdef, no?

> +{
> +	return imsic_acpi_fwnode;
> +}
> +
> +static int __init imsic_early_acpi_init(union acpi_subtable_headers *header,
> +					const unsigned long end)
> +{
> +	struct acpi_madt_imsic *imsic = (struct acpi_madt_imsic *)header;
> +	int rc;
> +
> +	imsic_acpi_fwnode = irq_domain_alloc_named_fwnode("imsic");
> +	if (!imsic_acpi_fwnode) {
> +		pr_err("unable to allocate IMSIC FW node\n");
> +		return -ENOMEM;
> +	}
> +
> +	/* Setup IMSIC state */
> +	rc = imsic_setup_state(imsic_acpi_fwnode, (void *)imsic);

Pointless (void *) cast.

> +	if (rc) {
> +		pr_err("%pfwP: failed to setup state (error %d)\n", imsic_acpi_fwnode, rc);
> +		return rc;
> +	}
> +
> +	/* Do early setup of IMSIC state and IPIs */
> +	rc = imsic_early_probe(imsic_acpi_fwnode);
> +	if (rc)
> +		return rc;
> +
> +	rc = imsic_platform_acpi_probe(imsic_acpi_fwnode);
> +
> +#ifdef CONFIG_PCI
> +	if (!rc)
> +		pci_msi_register_fwnode_provider(&imsic_acpi_get_fwnode);
> +#endif
> +
> +	return rc;

Any error return in this function leaks the firmware node and probably
some more stuff.

> +}
> +
> +IRQCHIP_ACPI_DECLARE(riscv_imsic, ACPI_MADT_TYPE_IMSIC, NULL,
> +		     1, imsic_early_acpi_init);
> +#endif

...

> -	/* Find number of interrupt identities */
> -	rc = of_property_read_u32(to_of_node(fwnode), "riscv,num-ids",
> -				  &global->nr_ids);
> -	if (rc) {
> -		pr_err("%pfwP: number of interrupt identities not found\n", fwnode);
> -		return rc;
> +		/* Find number of guest interrupt identities */
> +		rc = of_property_read_u32(to_of_node(fwnode), "riscv,num-guest-ids",
> +					  &global->nr_guest_ids);
> +		if (rc)
> +			global->nr_guest_ids = global->nr_ids;
> +	} else {
> +		global->guest_index_bits = imsic->guest_index_bits;
> +		global->hart_index_bits = imsic->hart_index_bits;
> +		global->group_index_bits = imsic->group_index_bits;
> +		global->group_index_shift = imsic->group_index_shift;
> +		global->nr_ids = imsic->num_ids;
> +		global->nr_guest_ids = imsic->num_guest_ids;
>  	}

Seriously?

Why can't you just split out the existing DT code into a separate
function in an initial patch which avoulds all of this unreviewable
churn of making the DT stuff indented ?

> +#ifdef CONFIG_ACPI
> +int imsic_platform_acpi_probe(struct fwnode_handle *fwnode);
> +struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev);
> +#else
> +static inline struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev)
> +{
> +	return NULL;
> +}
> +#endif

Oh well.

>  #endif

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
