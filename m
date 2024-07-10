Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05ADAC3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 13:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ato+Gmgj8xW9OvRxFAxqljKuptg2LwAz/r/lfxoteVA=; b=C4hu0PEMrfyHna
	qGtU2Lj/B6Z8AT4jiqlUYexFxtvaLiJBOhIPXIfBOMbiW6Ybkx5TWJ0d2xqkFcVVx+2RQyhYjhVl4
	sn8+yYA7qYIehogutOaMeLfjovek+l4baWSBs+gfd1WNFKDZc3IKkOhsthuNrFBGBTJ7p0GwapsNO
	eRAiuBcaVXJ2neq8QwIRvtWyhxgfce9rAWjotbV7bNgTlQMLLmb+dUdTvxzLVr6zZqYGVnAiBjCH6
	2Jw+yBCE7RkEjTKm3bICQQebZBL9iZiYIuB79ADTNJCX3Cntx59Baezh8sVJVF71w9xWFzWweNXql
	xj2YW9pZDDf66nIf6ZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRXnp-0000000AjcZ-0Ug2;
	Wed, 10 Jul 2024 13:56:13 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRXnl-0000000AjbZ-2Xbf
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 13:56:10 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5c74f6e5432so723788eaf.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 06:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1720619768; x=1721224568; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kbBxTrEkr/JgMWsq56fte0LuyrtPahP1hWVuaQ2pC/c=;
        b=ocGOR7gRzFGylgfbt99ejCawGSZJMS/nwddyQ+EaHyDKJg1gmuJ8eIESmLJTLmCNDA
         ku5joMYGe9r0gIcSM15A5qlgyIEja0VzwdFBt7JHr6Aic2G5qbQzkFGWbowF+lOL9AAs
         2pPr4Otc2yGG6ZV0TXm08sggxnJCpSadPNzjuMWgQBlqoduI5HvtPTl8zOYxbg6wDbmi
         7rm1+FvefXhQBVxKXlwhl4n/4Wnf62OxRGcnOWsA5KHEX3QoeLySOFYVakaqAfLsOiaJ
         ew/r/aRWE6wd9B81QdQz38jReCqQJtqLbu3WBBMRyBOs2gInqXpthlh+1HUkyCy1imVw
         jagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720619768; x=1721224568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbBxTrEkr/JgMWsq56fte0LuyrtPahP1hWVuaQ2pC/c=;
        b=f6qck/3S/r58/kpWIejxufXJui9Y+o3vZwFsSwUB/PnpRQ34gTJfY0zTkSm0eJCOeM
         9t6KEQZP5pexOwuxZnjcEoNNE9HzisFmKcgRGQnU9JNPO90nVll+wwx2fRiQsiE9pJGE
         Aa7S9Q+UWJnbbBXLuemShASN8SKS/+dpJx5ZeY8byXhMT/qxceg0ZY02I1HBHDpJo4/9
         cMwJ8fRwtuN/8LJDBB6mDhdBQGiFZbTJUS3LbAO85eLYFAovYstaWhGNlqIt7UkVV3z/
         vQeD+A/d7Q21BwuERs5GcE/ep3qCRcVebNvkO3VjL798tAbcff+SfdT3ncg1pm2ptOQ0
         FM3A==
X-Forwarded-Encrypted: i=1; AJvYcCVdEJud8Jp5sTSCgWx7wY6B21s+DmxnFGvQsm508KOXgFfpxKOYmw6g0B6yg4+VtONPW0ciOqJhQwjBXeeSkqFKlZKarLGJY3kKdL9r2pdT
X-Gm-Message-State: AOJu0YyYjFEYLbb1uXAaaISTzTr6hK4A5y8ZXoncCiZoGQnSOsIUpEoj
	FvHB0tYPUBpXhhAGjf0voK0nYU6q3/eYdj6zyNdPHjxCD9SC6k1x7Jxb3XuJ228=
X-Google-Smtp-Source: AGHT+IFcEa/6ymDnm7Yw+exYpWcVCdVGgsioH7lKM2D2Vq9RknY06qP+ZWew0XTxFouYZL+Q02zZqA==
X-Received: by 2002:a05:6870:82a5:b0:25e:1551:a2ec with SMTP id 586e51a60fabf-25eae75ec0bmr4447821fac.3.1720619767895;
        Wed, 10 Jul 2024 06:56:07 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25ea9f8219asm1177943fac.12.2024.07.10.06.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 06:56:07 -0700 (PDT)
Date: Wed, 10 Jul 2024 19:25:53 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Bjorn Helgaas <helgaas@kernel.org>
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
Subject: Re: [PATCH v6 10/17] ACPI: RISC-V: Implement function to reorder
 irqchip probe entries
Message-ID: <Zo6S6T3HXW1IY1lP@sunil-laptop>
References: <20240601150411.1929783-11-sunilvl@ventanamicro.com>
 <20240606220743.GA821335@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606220743.GA821335@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_065609_675666_4646B928 
X-CRM114-Status: GOOD (  32.90  )
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

Hi Bjorn,

On Thu, Jun 06, 2024 at 05:07:43PM -0500, Bjorn Helgaas wrote:
> On Sat, Jun 01, 2024 at 08:34:04PM +0530, Sunil V L wrote:
> > ACPI MADT entries for interrupt controllers don't have a way to describe
> > the hierarchy. However, the hierarchy is known to the architecture and
> > on RISC-V platforms, the MADT sub table types are ordered in the
> > incremental order from the root controller which is RINTC. So, add
> > architecture function for RISC-V to reorder the interrupt controller
> > probing as per the hierarchy as below.
> 
> Is this ordering requirement documented anywhere?  I don't see it in
> the RISC-V ECRs to the ACPI r6.5 spec.
> 

Thanks. We have added this clarity in a new mantis request.

> I guess the implication is that you need to process MADT structures in
> order of ascending acpi_madt_type:
> 
>   ACPI_MADT_TYPE_RINTC = 24,
>   ACPI_MADT_TYPE_IMSIC = 25,
>   ACPI_MADT_TYPE_APLIC = 26,
>   ACPI_MADT_TYPE_PLIC = 27,
> 
> regardless of the order they appear in the MADT?  I.e., process all
> the RINTC structures (in order of appearance in MADT), followed by all
> the IMSIC structures, then all the APLIC structures, etc?
> 
Correct!

> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  drivers/acpi/riscv/Makefile |  2 +-
> >  drivers/acpi/riscv/irq.c    | 32 ++++++++++++++++++++++++++++++++
> >  2 files changed, 33 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/acpi/riscv/irq.c
> > 
> > diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
> > index 877de00d1b50..a96fdf1e2cb8 100644
> > --- a/drivers/acpi/riscv/Makefile
> > +++ b/drivers/acpi/riscv/Makefile
> > @@ -1,4 +1,4 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> > -obj-y					+= rhct.o init.o
> > +obj-y					+= rhct.o init.o irq.o
> >  obj-$(CONFIG_ACPI_PROCESSOR_IDLE)	+= cpuidle.o
> >  obj-$(CONFIG_ACPI_CPPC_LIB)		+= cppc.o
> > diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
> > new file mode 100644
> > index 000000000000..f56e103a501f
> > --- /dev/null
> > +++ b/drivers/acpi/riscv/irq.c
> > @@ -0,0 +1,32 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2023-2024, Ventana Micro Systems Inc
> > + *	Author: Sunil V L <sunilvl@ventanamicro.com>
> > + *
> 
> Spurious blank line.
> 
Okay.

> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/sort.h>
> > +
> > +static int irqchip_cmp_func(const void *in0, const void *in1)
> > +{
> > +	struct acpi_probe_entry *elem0 = (struct acpi_probe_entry *)in0;
> > +	struct acpi_probe_entry *elem1 = (struct acpi_probe_entry *)in1;
> > +
> > +	return (elem0->type > elem1->type) - (elem0->type < elem1->type);
> > +}
> > +
> > +/*
> > + * RISC-V irqchips in MADT of ACPI spec are defined in the same order how
> > + * they should be probed. Since IRQCHIP_ACPI_DECLARE doesn't define any
> > + * order, this arch function will reorder the probe functions as per the
> > + * required order for the architecture.
> 
> But this comment seems to contradict the commit log.  This comment
> says you should process MADT structures in the order they appear in
> the MADT.  But if that were the case, you wouldn't need to sort
> anything.
> 
> Maybe "defined in the order they should be probed" means "in order of
> increasing Interrupt Controller structure type value"?
>
Agree. Let me update.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
