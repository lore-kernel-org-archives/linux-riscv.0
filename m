Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFE0C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 16:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=bnIEQMyJyg7+rkhYLB9jkwOS8jhXMiF9XEcDOtXKVkk=; b=Xfo0kuWLpTS8Wg
	PDQS4ZDSjVNUetwn5bx4mN5/N6gozvV62Dlfuk3mYv8naSGjuqyHqy0k/JCcGNGaP5oq2U5CTWNDs
	BWVrgNUjDGlkzZtdcX0w2Eaii0H4gjsHgJDtRIEP3msL0FW1MKaHsPWiMsYQE0OGL5DXpFYqV3THo
	Qq9UPOsy77R+38q42JQx5XGTLowBm2tls7CrEAvwC9kt2dXRajmw2PWcE7gJibxHNqRwYr37GBR5U
	6amfnq9IXoLz89u5o/H0oQyZAYJTkMhm5onzd5lhS1sc13a8vveSpDCLNVOsdWXX+oz5q1DKco3v9
	HOCfR+Oyg+CI+di4dMJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DFo-0000000AEcJ-13yz;
	Wed, 01 May 2024 16:56:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DFj-0000000AEZu-3VY1;
	Wed, 01 May 2024 16:56:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 742DB619C8;
	Wed,  1 May 2024 16:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC497C072AA;
	Wed,  1 May 2024 16:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714582577;
	bh=SfIUnFvTodi3ZAdSokEGwrQBZQMoBGP2gvIdsXxo1z8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=nwrFK+fQYl6W4IHr6gnMS8swEZfLcfdSm4TEcZt5aWvI5cpqh7w4by/NlSlrVYjZL
	 nSyMc1JZUgqnVPi3l4AskQDTBIg9ssQDqVRKrNblj13co5FmyvpEeH/66UR7xpkZOB
	 00NeWDZlTLiVmA0UQWYWoqUKgZkqpFbxOsnnVkdBIiEpBc979vFlZAfENsKIP5C4FP
	 ZgIXwvnYDTXwcasDNez+ynbUOZgMUa5OPy4YdrNoLJ+KdsG164DtG/7BQjY2pA2zWK
	 GEd3kS4ypFHM9mTJOQSG/RGht9W4bkGnY7CGz8RqZ+/Ebp1vm8DPjQkVyYEp898vFN
	 W1ZUMK9aRV32A==
Date: Wed, 1 May 2024 11:56:15 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
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
	Thomas Gleixner <tglx@linutronix.de>,
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
Subject: Re: [PATCH v5 08/17] ACPI: pci_link: Clear the dependencies after
 probe
Message-ID: <20240501165615.GA758227@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501121742.1215792-9-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_095619_998189_1D410A8D 
X-CRM114-Status: GOOD (  25.31  )
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

On Wed, May 01, 2024 at 05:47:33PM +0530, Sunil V L wrote:
> RISC-V platforms need to use dependencies between PCI host bridge, Link
> devices and the interrupt controllers to ensure probe order. The
> dependency is like below.
> 
> Interrupt controller <-- Link Device <-- PCI Host bridge.
> 
> If there is no dependency added between Link device and PCI Host Bridge,
> then the PCI end points can get probed prior to link device, unable to
> get mapping for INTx.
> 
> So, add the link device's HID to dependency honor list and also clear it
> after its probe.
> 
> Since this is required only for architectures like RISC-V, enable this
> code under a new config option and set this only in RISC-V.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/Kconfig      | 1 +
>  drivers/acpi/Kconfig    | 3 +++
>  drivers/acpi/pci_link.c | 3 +++
>  drivers/acpi/scan.c     | 1 +
>  4 files changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index f961449ca077..f7a36d79ff1a 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -14,6 +14,7 @@ config RISCV
>  	def_bool y
>  	select ACPI_GENERIC_GSI if ACPI
>  	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
> +	select ARCH_ACPI_DEFERRED_GSI if ACPI
>  	select ARCH_DMA_DEFAULT_COHERENT
>  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index e3a7c2aedd5f..ebec1707f662 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -587,6 +587,9 @@ config ACPI_PRMT
>  	  substantially increase computational overhead related to the
>  	  initialization of some server systems.
>  
> +config ARCH_ACPI_DEFERRED_GSI
> +	bool
> +
>  endif	# ACPI
>  
>  config X86_PM_TIMER
> diff --git a/drivers/acpi/pci_link.c b/drivers/acpi/pci_link.c
> index aa1038b8aec4..48cdcedafad6 100644
> --- a/drivers/acpi/pci_link.c
> +++ b/drivers/acpi/pci_link.c
> @@ -748,6 +748,9 @@ static int acpi_pci_link_add(struct acpi_device *device,
>  	if (result)
>  		kfree(link);
>  
> +	if (IS_ENABLED(CONFIG_ARCH_ACPI_DEFERRED_GSI))
> +		acpi_dev_clear_dependencies(device);

This is really a question for Rafael, but it doesn't seem right that
this completely depends on a config option.

Is there a reason this wouldn't work for all architectures, i.e., what
would happen if you just called acpi_dev_clear_dependencies()
unconditionally?

> +
>  	return result < 0 ? result : 1;
>  }
>  
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 3eeb4ce39fcc..67677a6ff8e3 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -834,6 +834,7 @@ static const char * const acpi_honor_dep_ids[] = {
>  	"INTC10CF", /* IVSC (MTL) driver must be loaded to allow i2c access to camera sensors */
>  	"RSCV0001", /* RISC-V PLIC */
>  	"RSCV0002", /* RISC-V APLIC */
> +	"PNP0C0F",  /* PCI Link Device */
>  	NULL
>  };
>  
> -- 
> 2.40.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
