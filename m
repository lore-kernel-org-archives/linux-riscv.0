Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36ECC04FF6
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 20:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=v1wWsr6o3Ow9l6OxqGb9ENW26f9u2a5gaSiYXjEA/7s=; b=MFL03RScdAIsKm
	DhSs4I8H6oTTcVAvBRS+LNOtWOlXgpS+HrvYAkPY5SE8oOlxYIr8tEuhCAQ9PqheFJUikVCrhP7bQ
	ilXd1D0pvBVZvCcrU2NMBiqVvE3/U5m13xYIgyigb24zf9D0rMylQ5op/lYTXuVzvWowS6w013D91
	dHe2gagTkw8AX/v1ZjniVuAT+jLe2cM1z4V3PSgUl+UA+ORC8JlkKqy2wNr2E03jOKbNmlZlI9mWu
	97Aj4hROpVTlL52tv01TQWke9O2IAVszky1zri88pUFIYo6N16hYyacIA2ktLTJ8YBeUOJeL0opwF
	XRQOdXaGdjdrjSM6CCew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwphr-0000000DlkY-3wh2;
	Tue, 16 Apr 2024 20:47:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwphk-0000000DliO-1Ti6;
	Tue, 16 Apr 2024 20:47:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 37B49612BB;
	Tue, 16 Apr 2024 20:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE13DC113CE;
	Tue, 16 Apr 2024 20:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713300416;
	bh=PzXDXli+NQ8Ipg2Q4mQ6/IuDWq/2DB2/UEhvKB1bDGY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=fSFZDRtQHi98DyjaM7ap3zCMfLlmmte/nFr/5XWlWTnTM1LpqvArQ+D8bckThywai
	 jFMa7mUCIFjhJ1oWR5p8SMN3y+R7l15DYEeFuqYu+hsTyNPM/RteaxG1JUO1BhDKgs
	 CrPUvOqTDDMl72OsXWjnO+jy5TEy4Wl5iPb/XgpMaiEktYx2XSYFM+F0IGvNhd5T8M
	 s32geYw0IVrgqrG54iJT61/6UeLeWhZ+vFl+wVtT5nrNT7V1W6bJ/7UDTXHjnV9J5g
	 k4S265Dw8ltfIt6gbU1DfKSUOJlTSed0ol1qhvoiaUS9wMATn9An1Tw38qqQwxejlW
	 PDM8tZvF67x5A==
Date: Tue, 16 Apr 2024 15:46:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
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
	Haibo1 Xu <haibo1.xu@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Andrei Warkentin <andrei.warkentin@intel.com>,
	Marc Zyngier <maz@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Subject: Re: [RFC PATCH v4 03/20] PCI: Make pci_create_root_bus() declare its
 reliance on MSI domains
Message-ID: <20240416204653.GA164172@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zh41pOmtAJ0EcbiN@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_134700_815897_EC844E80 
X-CRM114-Status: GOOD (  33.38  )
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

On Tue, Apr 16, 2024 at 01:54:04PM +0530, Sunil V L wrote:
> Hi Bjorn,
> 
> On Mon, Apr 15, 2024 at 06:15:23PM -0500, Bjorn Helgaas wrote:
> > On Mon, Apr 15, 2024 at 10:30:56PM +0530, Sunil V L wrote:
> > > Similar to commit 9ec37efb8783 ("PCI/MSI: Make
> > > pci_host_common_probe() declare its reliance on MSI domains"), declare
> > > this dependency for PCI probe in ACPI based flow.
> > > 
> > > This is required especially for RISC-V platforms where MSI controller
> > > can be absent. However, setting this for all architectures seem to cause
> > > issues on non RISC-V architectures [1]. Hence, enabled this only for
> > > RISC-V.
> > > 
> > > [1] - https://lore.kernel.org/oe-lkp/202403041047.791cb18e-oliver.sang@intel.com
> > > 
> > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > ---
> > >  drivers/pci/probe.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > > index 1325fbae2f28..e09915bee2ee 100644
> > > --- a/drivers/pci/probe.c
> > > +++ b/drivers/pci/probe.c
> > > @@ -3048,6 +3048,9 @@ struct pci_bus *pci_create_root_bus(struct device *parent, int bus,
> > >  	bridge->sysdata = sysdata;
> > >  	bridge->busnr = bus;
> > >  	bridge->ops = ops;
> > > +#ifdef CONFIG_RISCV
> > > +	bridge->msi_domain = true;
> > > +#endif
> > 
> > Ugh.  I looked at [1], but that's not a very good justification for
> > this #ifdef.  The fault mentioned in [1] would need to be fixed, but
> > not this way.
> 
> Thank you again for the feedback!
> 
> I agree. This is due to my limitation with knowledge and resources to
> debug the issue happening on non-UEFI x86 system with some particular
> PCIe RC. Also, I was worried that we get into a rat hole of
> assumptions/quirks with various architecture/PCIe RC combinations.

The problem is that adding #ifdefs like this leads to a rat hole
itself.  We need to understand and fix the underlying issue instead.

> For ex: I think the issue is, somehow MSI domain is not set at the time
> of PCI host bridge registration in pci_register_host_bridge() causing
> PCI_BUS_FLAGS_NO_MSI to be set. This causes pci_alloc_irq_vectors() to
> fail. In portdrv.c, pcie_init_service_irqs() doesn't switch to INTx
> handling if MSI can not be used. It switches only if pcie_pme_no_msi()
> returns true. I couldn't find who actually sets up MSI domain bit late
> on this platform so that it somehow worked when we didn't set this flag.
> 
> Unfortunately, I don't have system to root cause and fix this issue with
> confidence. Also, I don't know if any other architectures have similar
> issues which are not caught yet. Hence, I thought it may be better
> just restrict the change to RISC-V.

It sounds like the above is a good start on analyzing the problem.

I don't quite understand your statement that pcie_init_service_irqs()
doesn't fall back to INTx when MSI/MSI-X is not available.

I'm looking at this:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/pcie/portdrv.c?id=v6.8#n177
pcie_port_enable_irq_vec() attempts
pci_alloc_irq_vectors(PCI_IRQ_MSIX | PCI_IRQ_MSI) and returns 0 if
successful.  If it returns failure, it looks like
pcie_init_service_irqs() *does* fall through to trying INTx
(PCI_IRQ_LEGACY).

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
