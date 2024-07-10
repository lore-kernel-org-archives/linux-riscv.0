Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42E6C3DA41
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 13:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0Z341FVIBIE9JA6aQz+QRAwghiNDGNZyY844mU5FJ4=; b=IqV+Oi9LvROiP1
	BUcpg8mseTvYZgaWFsu0amRZk4m6XYHo38L7FwuKKkNYV/TizJAweVZ+X0mcdVQn8RBPUYW2RMsUG
	0/XWkB0Yrxiqsy8hF0LBpE4Vi+9WvhiKjUY25bsh1CXcDM+4w5eWxBawNnOiINvslnpe2+MduNWaP
	u5rzJ+p3C5KtulCkR1S/uou8w2otDPqPZEMucWu+zi/DgGyLGRqrr+T7UiJvfcCfiXJrIQvqTUfoH
	8RL8QT6YuMrOR8o4MyghR+udEEwGnB3W1LFE2yndEmwrta5c9KmagKnVyH3NdHjBYavpv7nEy9Wm8
	SA6NOJGawtISu12JoVTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRXas-0000000Agst-1WU4;
	Wed, 10 Jul 2024 13:42:50 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRXao-0000000AgqJ-1P5G
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 13:42:47 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5c651c521f2so2862560eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 06:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1720618964; x=1721223764; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYo7hiyQeiuXBsG523lCpU3OjDoScc8p3LqrHOuQZw8=;
        b=K7lkAMZFRlQT2FxLQWe0LyqbH7qkRyywZUK3rzV9YfnZfkVV/huSyHmuq1SLVy73FZ
         xo3GDKNE5TFRam3ca9S53j1dE2tMqgNmJn4KpXTgj50u/nzaH9TGwZW+cMkSBA8iN6Qb
         w3paFT9BMb2p6GqjBuNjOzcgufvLGuZU/IMov4hIG5n1E0jdjx3aty9A2tUXDotmg0PS
         e2g2RMixGZd3ctvF9CG1x+jDY0e5hUdHLzE0V0uKf+Sa0w7zGCTsT/M+Lr7W9VeuXDhO
         vHoK1jer4zSwVrsGZCj3vomL6rv9yuml2Rye7kuX83gAMEqwWf2/vEkbSQVHNlvgqX6p
         tv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720618964; x=1721223764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYo7hiyQeiuXBsG523lCpU3OjDoScc8p3LqrHOuQZw8=;
        b=MzSwG9x4gYbjEdbYtd7P73Uj4jz/Zgpk6Y1y72yDfKtqnZM8m7jB/PLopfX35hhwv5
         Vd3wUwSokAktoURaR69vb5UlN2G005pgmxz/wK6a0QE52Xn0/ChlGjZAyjXjrxFDdwYF
         /0xUuUQFx+lifCLG8BleX5ONt1DUjheUhCb8TsDqQqqtq9ifs+dqIuaLAQgcZFGDAySy
         5uCHFOx//xO3rOVv+2xmUDrPIFw5Se5h+4A+h0AlPjNfQccI42OlUnUz4XbRctKCYqJ9
         TFQQGmF/OEABnuh6rVvwbDFkO/3egyw+x279iiYZFEv7xo9OVjXfa3wpcOV6yrqJxAa5
         rWOA==
X-Forwarded-Encrypted: i=1; AJvYcCVcVwwwvZrM2Z8UcpluLeVMbid4IQbPCN1jc92wGxccx3Jmz+jN8nj0gk5vC2eltuTpncgB1rgGyWwHicIG0EgcqJZe3csLg5Y8LyVTjVzy
X-Gm-Message-State: AOJu0YyQooDkf4xUWqm+xTSB9PL1LxzM5D7+juSvLNxxx/yvbRIdeuq7
	dKBB8zZnb/2N0JGSAc1pM12rjVEuBXGRMvBXnO6pbw5I2cAO9GBZ4roFTP8f3t8=
X-Google-Smtp-Source: AGHT+IEKatB3eqFgez+wXc1iMLGNbwHvkjmaIQf9kU0G+YZPSgDIUnJE7UlX38DLcJq5LYXxTX1LPA==
X-Received: by 2002:a4a:6c4:0:b0:5c4:68b8:e27f with SMTP id 006d021491bc7-5c68e19136bmr5609120eaf.6.1720618964379;
        Wed, 10 Jul 2024 06:42:44 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c68cd9a709sm674614eaf.22.2024.07.10.06.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 06:42:43 -0700 (PDT)
Date: Wed, 10 Jul 2024 19:12:29 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marc Zyngier <maz@kernel.org>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Haibo1 Xu <haibo1.xu@intel.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Subject: Re: [PATCH v6 11/17] ACPI: RISC-V: Initialize GSI mapping structures
Message-ID: <Zo6PxdFM2GzTV1yc@sunil-laptop>
References: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
 <20240601150411.1929783-12-sunilvl@ventanamicro.com>
 <Zo5mMiWbEtKEeZ2r@lpieralisi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zo5mMiWbEtKEeZ2r@lpieralisi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_064246_444305_AA78749E 
X-CRM114-Status: GOOD (  36.20  )
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

On Wed, Jul 10, 2024 at 12:45:06PM +0200, Lorenzo Pieralisi wrote:
> On Sat, Jun 01, 2024 at 08:34:05PM +0530, Sunil V L wrote:
> > RISC-V has PLIC and APLIC in MADT as well as namespace devices.
> > Initialize the list of those structures using MADT and namespace devices
> > to create mapping between the ACPI handle and the GSI ranges. This will
> > be used later to add dependencies.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/irq.h |  22 ++++++
> >  drivers/acpi/riscv/init.c    |   2 +
> >  drivers/acpi/riscv/init.h    |   4 +
> >  drivers/acpi/riscv/irq.c     | 142 +++++++++++++++++++++++++++++++++++
> >  4 files changed, 170 insertions(+)
> >  create mode 100644 drivers/acpi/riscv/init.h
> > 
> > diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
> > index 8e10a94430a2..44a0b128c602 100644
> > --- a/arch/riscv/include/asm/irq.h
> > +++ b/arch/riscv/include/asm/irq.h
> > @@ -16,4 +16,26 @@ void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));
> >  
> >  struct fwnode_handle *riscv_get_intc_hwnode(void);
> >  
> > +#ifdef CONFIG_ACPI
> > +
> > +enum riscv_irqchip_type {
> > +	ACPI_RISCV_IRQCHIP_INTC		= 0x00,
> > +	ACPI_RISCV_IRQCHIP_IMSIC	= 0x01,
> > +	ACPI_RISCV_IRQCHIP_PLIC		= 0x02,
> > +	ACPI_RISCV_IRQCHIP_APLIC	= 0x03,
> > +};
> > +
> > +int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
> > +			    u32 *id, u32 *nr_irqs, u32 *nr_idcs);
> > +struct fwnode_handle *riscv_acpi_get_gsi_domain_id(u32 gsi);
> > +
> > +#else
> > +static inline int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
> > +					  u32 *id, u32 *nr_irqs, u32 *nr_idcs)
> > +{
> > +	return 0;
> > +}
> > +
> > +#endif /* CONFIG_ACPI */
> > +
> >  #endif /* _ASM_RISCV_IRQ_H */
> > diff --git a/drivers/acpi/riscv/init.c b/drivers/acpi/riscv/init.c
> > index 5f7571143245..22db97f7a772 100644
> > --- a/drivers/acpi/riscv/init.c
> > +++ b/drivers/acpi/riscv/init.c
> > @@ -6,7 +6,9 @@
> >   */
> >  
> >  #include <linux/acpi.h>
> > +#include "init.h"
> >  
> >  void __init acpi_riscv_init(void)
> >  {
> > +	riscv_acpi_init_gsi_mapping();
> >  }
> > diff --git a/drivers/acpi/riscv/init.h b/drivers/acpi/riscv/init.h
> > new file mode 100644
> > index 000000000000..0b9a07e4031f
> > --- /dev/null
> > +++ b/drivers/acpi/riscv/init.h
> > @@ -0,0 +1,4 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#include <linux/init.h>
> > +
> > +void __init riscv_acpi_init_gsi_mapping(void);
> > diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
> > index f56e103a501f..0473428e8d1e 100644
> > --- a/drivers/acpi/riscv/irq.c
> > +++ b/drivers/acpi/riscv/irq.c
> > @@ -7,6 +7,21 @@
> >  
> >  #include <linux/acpi.h>
> >  #include <linux/sort.h>
> > +#include <linux/irq.h>
> > +
> > +#include "init.h"
> > +
> > +struct riscv_ext_intc_list {
> > +	acpi_handle handle;
> > +	u32 gsi_base;
> > +	u32 nr_irqs;
> > +	u32 nr_idcs;
> > +	u32 id;
> > +	u32 type;
> > +	struct list_head list;
> > +};
> > +
> > +LIST_HEAD(ext_intc_list);
> >  
> >  static int irqchip_cmp_func(const void *in0, const void *in1)
> >  {
> > @@ -30,3 +45,130 @@ void arch_sort_irqchip_probe(struct acpi_probe_entry *ap_head, int nr)
> >  		return;
> >  	sort(ape, nr, sizeof(*ape), irqchip_cmp_func, NULL);
> >  }
> > +
> > +static void riscv_acpi_update_gsi_handle(u32 gsi_base, acpi_handle handle)
> > +{
> > +	struct riscv_ext_intc_list *ext_intc_element;
> > +	struct list_head *i, *tmp;
> > +
> > +	list_for_each_safe(i, tmp, &ext_intc_list) {
> > +		ext_intc_element = list_entry(i, struct riscv_ext_intc_list, list);
> > +		if (gsi_base == ext_intc_element->gsi_base) {
> > +			ext_intc_element->handle = handle;
> > +			return;
> > +		}
> > +	}
> > +
> > +	acpi_handle_err(handle, "failed to find the GSI mapping entry\n");
> > +}
> > +
> > +int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
> > +			    u32 *id, u32 *nr_irqs, u32 *nr_idcs)
> > +{
> > +	struct riscv_ext_intc_list *ext_intc_element;
> > +	struct list_head *i, *tmp;
> > +
> > +	list_for_each_safe(i, tmp, &ext_intc_list) {
> > +		ext_intc_element = list_entry(i, struct riscv_ext_intc_list, list);
> > +		if (ext_intc_element->handle == ACPI_HANDLE_FWNODE(fwnode)) {
> > +			*gsi_base = ext_intc_element->gsi_base;
> > +			*id = ext_intc_element->id;
> > +			*nr_irqs = ext_intc_element->nr_irqs;
> > +			if (nr_idcs)
> > +				*nr_idcs = ext_intc_element->nr_idcs;
> > +
> > +			return 0;
> > +		}
> > +	}
> > +
> > +	return -ENODEV;
> > +}
> > +
> > +struct fwnode_handle *riscv_acpi_get_gsi_domain_id(u32 gsi)
> > +{
> > +	struct riscv_ext_intc_list *ext_intc_element;
> > +	struct acpi_device *adev;
> > +	struct list_head *i, *tmp;
> > +
> > +	list_for_each_safe(i, tmp, &ext_intc_list) {
> > +		ext_intc_element = list_entry(i, struct riscv_ext_intc_list, list);
> > +		if (gsi >= ext_intc_element->gsi_base &&
> > +		    gsi < (ext_intc_element->gsi_base + ext_intc_element->nr_irqs)) {
> > +			adev = acpi_fetch_acpi_dev(ext_intc_element->handle);
> > +			if (!adev)
> > +				return NULL;
> > +
> > +			return acpi_fwnode_handle(adev);
> > +		}
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> > +static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr_idcs,
> > +					       u32 id, u32 type)
> > +{
> > +	struct riscv_ext_intc_list *ext_intc_element;
> > +
> > +	ext_intc_element = kzalloc(sizeof(*ext_intc_element), GFP_KERNEL);
> > +	if (!ext_intc_element)
> > +		return -ENOMEM;
> > +
> > +	ext_intc_element->gsi_base = gsi_base;
> > +	ext_intc_element->nr_irqs = nr_irqs;
> > +	ext_intc_element->nr_idcs = nr_idcs;
> > +	ext_intc_element->id = id;
> > +	list_add_tail(&ext_intc_element->list, &ext_intc_list);
> > +	return 0;
> > +}
> > +
> > +static acpi_status __init riscv_acpi_create_gsi_map(acpi_handle handle, u32 level,
> > +						    void *context, void **return_value)
> > +{
> > +	acpi_status status;
> > +	u64 gbase;
> > +
> > +	if (!acpi_has_method(handle, "_GSB")) {
> > +		acpi_handle_err(handle, "_GSB method not found\n");
> > +		return AE_OK;
> > +	}
> > +
> > +	status = acpi_evaluate_integer(handle, "_GSB", NULL, &gbase);
> > +	if (ACPI_FAILURE(status)) {
> > +		acpi_handle_err(handle, "failed to evaluate _GSB method\n");
> > +		return AE_OK;
> > +	}
> > +
> > +	riscv_acpi_update_gsi_handle((u32)gbase, handle);
> > +	return AE_OK;
> > +}
> > +
> > +static int __init riscv_acpi_aplic_parse_madt(union acpi_subtable_headers *header,
> > +					      const unsigned long end)
> > +{
> > +	struct acpi_madt_aplic *aplic = (struct acpi_madt_aplic *)header;
> > +
> > +	return riscv_acpi_register_ext_intc(aplic->gsi_base, aplic->num_sources, aplic->num_idcs,
> > +					    aplic->id, ACPI_RISCV_IRQCHIP_APLIC);
> > +}
> > +
> > +static int __init riscv_acpi_plic_parse_madt(union acpi_subtable_headers *header,
> > +					     const unsigned long end)
> > +{
> > +	struct acpi_madt_plic *plic = (struct acpi_madt_plic *)header;
> > +
> > +	return riscv_acpi_register_ext_intc(plic->gsi_base, plic->num_irqs, 0,
> > +					    plic->id, ACPI_RISCV_IRQCHIP_PLIC);
> > +}
> > +
> > +void __init riscv_acpi_init_gsi_mapping(void)
> > +{
> > +	/* There can be either PLIC or APLIC */
> > +	if (acpi_table_parse_madt(ACPI_MADT_TYPE_PLIC, riscv_acpi_plic_parse_madt, 0) > 0) {
> > +		acpi_get_devices("RSCV0001", riscv_acpi_create_gsi_map, NULL, NULL);
> > +		return;
> > +	}
> > +
> > +	if (acpi_table_parse_madt(ACPI_MADT_TYPE_APLIC, riscv_acpi_aplic_parse_madt, 0) > 0)
> > +		acpi_get_devices("RSCV0002", riscv_acpi_create_gsi_map, NULL, NULL);
> > +}
> 
> I don't know if it is needed in RISC-V - it is a question - but how would you
> resolve a GSI mapping before the ACPI intepreter is initialized ?
> 
> This model relies on the _GSB method to be called on the interrupt controller
> device to discover the GSI range it actually covers, I was wondering how this
> works for "devices" (eg components described in static table, eg timers)
> that require a GSI mapping before you are able to retrieve the required
> information from the namespace devices.
> 
Hi Lorenzo,

This model is based on the idea of _DEP method to describe dependencies
between devices and interrupt controller. So, you are right it needs
interpreter to be up. RISC-V doesn't have devices like timers defined in
a static table. Every other platform device which needs GSIs should be
defined in the namespace.

Thanks,
Sunil


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
