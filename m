Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E64C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 19:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=G53ZI5qmzeJ+xTVFPtRhP8FVEV94WD95PFe/HTboHfE=; b=TeDmINZ+SHkUN4
	nNMTSX8w7pvk4JBFDe/CeI9wTOhX6nC7yRfkUlKeQEXQolmZEeuvQaCVfRmwZIQrz3CJ4iSdM4gUa
	WLmITBv+wq0RqFNRuj5nvMiuwzfMr5E2S9LnNrmYX4l+dk4DDqrr3jYyL/UuIt4Kz3guFtOGvcw/s
	IgyazoSZJym8OmWuVRVaRzQuBp5ASx1/bRMbzWM7H20D1OMvT/yoE5bjUhn1Wr+uD11bKr8RqxcRX
	m7WXsOzZAp7Hf/gzMi7TJpwho9npzAo2P0BylzYAEF5IPhoD30O4YfaXZNzsKaZfSVyj4RQ61Ynb6
	CNP10qOp5/HU+SnPnaxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZFLp-00000002Mwl-1vtK;
	Wed, 31 Jul 2024 19:51:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZFKF-00000002MEU-3B7T;
	Wed, 31 Jul 2024 19:49:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 07E74CE17D1;
	Wed, 31 Jul 2024 19:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118DEC4AF09;
	Wed, 31 Jul 2024 19:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722455369;
	bh=PUpvq4IvGstISJBnqSrlDq4K2g9I2Ugc4NXAsXQFQ+Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FzwcgcEJ2HxUeoOcvMsJeNsPl6w9Kj08seE75vXEQtKYVaw9J5f5kGITSMChJ5ngg
	 nyOup++1xb53SaOvf2JQ6WZNlC0k9CcImr85jS76aolvFVD1FC92psCq2PvJTtVh43
	 JSm+TZmXzo9IqPIorv/zUDNb7zcBKywFNjDBjzOenBlkIy7+dBWQj4PvcAIYmwZWJd
	 mnRfyHxi402vgsIw2XNgcy189EIbANEqBOYCgpV2Nbwbgkc9WXc2wGBBi/g4AHzyUm
	 adI7kyJrsRNPmnjJPx8nunXdyVHshIdNVxYRsg7P4rs98iTyg7W80qr3kqBAvFNRer
	 5IIcm7AENs1qQ==
Date: Wed, 31 Jul 2024 14:49:27 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Drew Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH v7 08/17] ACPI: pci_link: Clear the dependencies after
 probe
Message-ID: <20240731194927.GA78106@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240729142241.733357-9-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_124932_682387_6C1A099E 
X-CRM114-Status: GOOD (  21.20  )
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

On Mon, Jul 29, 2024 at 07:52:30PM +0530, Sunil V L wrote:
> RISC-V platforms need to use dependencies between PCI host bridge, Link
> devices and the interrupt controllers to ensure probe order. The
> dependency is like below.
> 
> Interrupt controller <-- Link Device <-- PCI Host bridge.
> 
> If there is no dependency added between Link device and PCI Host Bridge,
> then the PCI end points can get probed prior to link device, unable to
> get mapping for INTx.

This sentence is missing a word or something.  Maybe it's supposed to
say something like this:

  If there is no dependency between Link device and PCI Host Bridge,
  then PCI devices may be probed prior to Link devices.  If a PCI
  device is probed before its Link device, we won't be able to find
  its INTx mapping.

> So, add the link device's HID to dependency honor list and also clear it
> after its probe.

It looks like *this* patch only clears it after probe.  And the commit
log doesn't say why we need to clear the dependency.

> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/acpi/pci_link.c | 2 ++
>  drivers/acpi/scan.c     | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/acpi/pci_link.c b/drivers/acpi/pci_link.c
> index aa1038b8aec4..b727db968f33 100644
> --- a/drivers/acpi/pci_link.c
> +++ b/drivers/acpi/pci_link.c
> @@ -748,6 +748,8 @@ static int acpi_pci_link_add(struct acpi_device *device,
>  	if (result)
>  		kfree(link);
>  
> +	acpi_dev_clear_dependencies(device);
> +
>  	return result < 0 ? result : 1;
>  }
>  
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 28a221f956d7..753539a1f26b 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -863,6 +863,7 @@ static const char * const acpi_honor_dep_ids[] = {
>  	"INTC10CF", /* IVSC (MTL) driver must be loaded to allow i2c access to camera sensors */
>  	"RSCV0001", /* RISC-V PLIC */
>  	"RSCV0002", /* RISC-V APLIC */
> +	"PNP0C0F",  /* PCI Link Device */
>  	NULL
>  };
>  
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
