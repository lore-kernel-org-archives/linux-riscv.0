Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D24C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 04:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JR65NRwBuRNskPQmUjIipLyDAbKvSAWbegyoGfOR2FY=; b=BYiWLC5768KEjV
	rWgGa8TdaKbP3yCemsxdKGaka+1sgfC8fv012J3lgaaHrQgE+gfAZWmpOUEcnfNkSxCXLUMiJtziY
	SXvidgZrp7OyJr+ObcSBbDbrCoDsIed0x0d8DJyMViCr0+198A2GdDcetzpzKjiFouA6xzhsIyTew
	Aapi/RboI2wh7yaYzklFLU4ekwuH3mMiobeZrtlOerz07MiPJ/Uk06c2/WK5g6uEl9ou4FaOMY2v2
	oh1IVkDJ6f41i3grJGeHTVUjyvfBbi1Ac3q5s7gOd4MOKiZsFGaV+/wLddn2d/4zskJcEQCgA73Ej
	zPnYmXyT529XcL50kPJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBSLW-0000000DmiP-1AIG;
	Mon, 27 May 2024 04:52:30 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBSLS-0000000DmhB-24Dh
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 04:52:28 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6f8e9555eabso2321410b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 26 May 2024 21:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1716785541; x=1717390341; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7OwVnHZBL6wTRkCGzMu3WG8eEJumBpr030yY2OMz5XY=;
        b=jc0NJy0SxNVoJTRtw04vjGdFV9yA6cr9VDQAStBLK5wam8ri5XARKS4Px+6dVWStrX
         LvGDO2OnbdGM9sw+dsWY4XZjNlocrvWOwmgEaxPvX4eTaroz7gufMjgy5HKcwMT5yfnV
         1LXJIM6pg92EKpi+ehFMK7DyNV+U2Q2atgfo+4/WWfTn87FszsCzdh5CNxikJj94snzq
         ls98hd7MeJ2+7FvnaKKEXECWKkETgBNzeRnUmIBPapePJ/kVYqm8zTKHyTbO1w48tcGK
         OuGCY2Bh30Y73838cjoA8yOmZhy8xG5aW3uqhHncb2LH93KQppojKHKFm2uKWZQa8gmf
         wfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716785541; x=1717390341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OwVnHZBL6wTRkCGzMu3WG8eEJumBpr030yY2OMz5XY=;
        b=hpoqwsYXxLAZf/g0JobRVTo3GZ4vci00M+/6oVpbsU85BEjZJypYPnIFeoEa4x00T6
         DM+4gXMekjWRB9ClIAcW9kdqpvlNTq41mSSCBjdFvHnJR+sd/lVCoC2/tEWDragKgXY3
         WbQvbqSyJqt+zQimIEM7YiLtNkrXJFJo0UfxkE/d9mr8ixp5bcIEpzqr5NsUI7mRE1zp
         6POn819reozpWeSI7f45kAL5YukryuX4d+1NUB8HmSUbMS0gdIIJNI4X1tMvVGVNy5Qb
         ZBoHSjrGMNhH3PVOSyF5eZ7szFii3i7FkuN0yEljhE737K1wCW7oh1DFgTwc4xfz7PpW
         3Umg==
X-Forwarded-Encrypted: i=1; AJvYcCXHqpb3INP+A4jINo29P8ZX2NF22wIESWXiKEoSqnqmqcYdIrr4N0vUBVsZiNctFvml1x/mZ+F9XN/Z5ojSlW1v6w3HtD/lnaO8sDdkHgus
X-Gm-Message-State: AOJu0YzZfBlm7ZbuKdboEL7Pr7EtTiezljdwPC32Vdbw8xL4IuCoLSbA
	q2ROZY7pZgAsF9bIJ3H46fhuhnBk3POyYKe+7RLCnYSb9hMVXA2ZGvOYTMZJ4fo=
X-Google-Smtp-Source: AGHT+IH1+6Rmi8dE36D+B+xJAB7lUPPIYa2o+TDUzseyC6rijf8D9sllaHoXY4NG8W+kwmTTtncYfQ==
X-Received: by 2002:a05:6a21:191:b0:1a9:d6e2:66e9 with SMTP id adf61e73a8af0-1b212d4aee2mr9906286637.28.1716785540658;
        Sun, 26 May 2024 21:52:20 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f483584be5sm19427935ad.258.2024.05.26.21.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 21:52:20 -0700 (PDT)
Date: Mon, 27 May 2024 10:22:08 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marc Zyngier <maz@kernel.org>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Andrei Warkentin <andrei.warkentin@intel.com>,
	Haibo1 Xu <haibo1.xu@intel.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Subject: Re: [PATCH v5 14/17] irqchip/riscv-imsic: Add ACPI support
Message-ID: <ZlQReOytuJcMsXUW@sunil-laptop>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-15-sunilvl@ventanamicro.com>
 <871q5sfatm.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871q5sfatm.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240526_215226_566416_473C0450 
X-CRM114-Status: GOOD (  30.90  )
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

On Fri, May 24, 2024 at 12:00:21AM +0200, Thomas Gleixner wrote:
> On Wed, May 01 2024 at 17:47, Sunil V L wrote:
> 
> > RISC-V IMSIC interrupt controller provides IPI and MSI support.
> > Currently, DT based drivers setup the IPI feature early during boot but
> > defer setting up the MSI functionality. However, in ACPI systems, ACPI,
> > both IPI and MSI features need to be initialized early itself.
> 
> Why?
> 
Sorry, commit message got truncated by mistake. Basically, in ACPI PCI
scan happens very early and there is no concept of msi-parent/dependency
on MSI controller like in DT. It just assumes MSI is setup already. Due
to this, we need to setup MSI controller early as well.

> > +
> > +#ifdef CONFIG_ACPI
> > +
> > +static struct fwnode_handle *imsic_acpi_fwnode;
> > +
> > +struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev)
> 
> Why is this function global? It's only used in the very same file and
> under the same CONFIG_ACPI #ifdef, no?
> 
For platform devices using MSIs, we need a way to determine the MSI
domain. This function is exported so that platform device like
APLIC/IOMMU can find the MSI irqdomain.

For PCI, pci_msi_register_fwnode_provider() is registered by the MSI
driver for this purpose.

Let me know if this can be made better.

> > +{
> > +	return imsic_acpi_fwnode;
> > +}
> > +
> > +static int __init imsic_early_acpi_init(union acpi_subtable_headers *header,
> > +					const unsigned long end)
> > +{
> > +	struct acpi_madt_imsic *imsic = (struct acpi_madt_imsic *)header;
> > +	int rc;
> > +
> > +	imsic_acpi_fwnode = irq_domain_alloc_named_fwnode("imsic");
> > +	if (!imsic_acpi_fwnode) {
> > +		pr_err("unable to allocate IMSIC FW node\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	/* Setup IMSIC state */
> > +	rc = imsic_setup_state(imsic_acpi_fwnode, (void *)imsic);
> 
> Pointless (void *) cast.
> 
Okay.

> > +	if (rc) {
> > +		pr_err("%pfwP: failed to setup state (error %d)\n", imsic_acpi_fwnode, rc);
> > +		return rc;
> > +	}
> > +
> > +	/* Do early setup of IMSIC state and IPIs */
> > +	rc = imsic_early_probe(imsic_acpi_fwnode);
> > +	if (rc)
> > +		return rc;
> > +
> > +	rc = imsic_platform_acpi_probe(imsic_acpi_fwnode);
> > +
> > +#ifdef CONFIG_PCI
> > +	if (!rc)
> > +		pci_msi_register_fwnode_provider(&imsic_acpi_get_fwnode);
> > +#endif
> > +
> > +	return rc;
> 
> Any error return in this function leaks the firmware node and probably
> some more stuff.
>
Yeah, fwnode needs free up and need to update the code a bit. Thanks!
 
> > +}
> > +
> > +IRQCHIP_ACPI_DECLARE(riscv_imsic, ACPI_MADT_TYPE_IMSIC, NULL,
> > +		     1, imsic_early_acpi_init);
> > +#endif
> 
> ...
> 
> > -	/* Find number of interrupt identities */
> > -	rc = of_property_read_u32(to_of_node(fwnode), "riscv,num-ids",
> > -				  &global->nr_ids);
> > -	if (rc) {
> > -		pr_err("%pfwP: number of interrupt identities not found\n", fwnode);
> > -		return rc;
> > +		/* Find number of guest interrupt identities */
> > +		rc = of_property_read_u32(to_of_node(fwnode), "riscv,num-guest-ids",
> > +					  &global->nr_guest_ids);
> > +		if (rc)
> > +			global->nr_guest_ids = global->nr_ids;
> > +	} else {
> > +		global->guest_index_bits = imsic->guest_index_bits;
> > +		global->hart_index_bits = imsic->hart_index_bits;
> > +		global->group_index_bits = imsic->group_index_bits;
> > +		global->group_index_shift = imsic->group_index_shift;
> > +		global->nr_ids = imsic->num_ids;
> > +		global->nr_guest_ids = imsic->num_guest_ids;
> >  	}
> 
> Seriously?
> 
> Why can't you just split out the existing DT code into a separate
> function in an initial patch which avoulds all of this unreviewable
> churn of making the DT stuff indented ?
> 
Sure, makes sense. let me create separate patch first as you suggested.

> > +#ifdef CONFIG_ACPI
> > +int imsic_platform_acpi_probe(struct fwnode_handle *fwnode);
> > +struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev);
> > +#else
> > +static inline struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev)
> > +{
> > +	return NULL;
> > +}
> > +#endif
> 
> Oh well.
> 
I guess this is related to your prior comment about the need to make
this public function. Let me know if I am missing something.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
