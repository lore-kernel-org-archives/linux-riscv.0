Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F63C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 22:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=a15SYqr+YQzqvLF94kptNXFFlDXPg/XTpiZLliXia2E=; b=j6AgdANOi/0gJt
	xYXmLsVt19rFgZM+u5ZSZ4/JrPWHw1i2A8mUN6Z8BI7VfmnZ0bWQL+apU0uUQCpAFajy0L1BIP3Qa
	luoFTq51VsehbRXG2uXTmvA0TVGDNoopjrnXtVNjOzilRqGmptRRaVWWy+eF0/Mza50xO7F+JWmHv
	SBkFhNS8Ux8wkXBGwb9NHtocull36xE/YRFxAfrOrDX5JkztEtrQFa4vGBa+T67dO+4VsENqycpVl
	XQ89RPw4wOoRZB7HVtmp1SXdShAvmhK14yM9luAhzgLNY5rDnLMFhAxi9zKkMB9o8Ci/hoFzX+cIa
	XRM1CXa2+3QqBw6nbqHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r07tK-0002wg-0k;
	Mon, 06 Nov 2023 22:16:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r07tF-0002ve-32;
	Mon, 06 Nov 2023 22:16:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 68B24B80FC3;
	Mon,  6 Nov 2023 22:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654D4C433C7;
	Mon,  6 Nov 2023 22:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699308968;
	bh=WqMPMf39yh9ITC8OB+ZJDb9Ky2cXoNVF1zs0fDuZdN0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=s9wsq7xSaMr7iJ3kiO+j9shFPCu8qXLQJrWBsw5/DIGa63jW9h/MG2FWa4Q2525Fk
	 OjpRYf8HorKnxNU3Hxd7c9qYr5lVgIQ2x2GKK4SW3NQG2m2DrhvB+H4HSpgNcBV0Xm
	 UexMpN5ETc1fwqspUoTwns6vzMNGIZVNuuUpM3LRhO2Bm4e0H3XmyhB/R8RnmgY61O
	 RMkozKDLwcq2NKMzwnpifndjlCiTKAbwke2cUF3PmrGJ1apjCeBMdRlf9vbK3njNaf
	 nd2W1a1Kw3zJIXfyl08QIw/lVuVFqZH09q5OGyu7ra9oxT7+g50f5xlVeku7nKzyeu
	 VvuUm+kw/bHlQ==
Date: Mon, 6 Nov 2023 16:16:06 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [RFC PATCH v2 06/21] RISC-V: Kconfig: Select deferred GSI probe
 for ACPI systems
Message-ID: <20231106221606.GA264641@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZTuzJ1nsicZYp+uh@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_141614_307939_959B7D84 
X-CRM114-Status: GOOD (  35.71  )
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

On Fri, Oct 27, 2023 at 06:25:03PM +0530, Sunil V L wrote:
> On Thu, Oct 26, 2023 at 12:04:08PM -0500, Bjorn Helgaas wrote:
> > On Thu, Oct 26, 2023 at 01:53:29AM +0530, Sunil V L wrote:
> > > On RISC-V platforms, apart from root interrupt controllers (which
> > > provide local interrupts and IPI), other interrupt controllers in the
> > > hierarchy are probed late. Enable this select this CONFIG option for
> > > RISC-V platforms so that device drivers which connect to deferred
> > > interrupt controllers can take appropriate action.
> > 
> > Quite a bit of this series seems related to the question of interrupt
> > controllers being probed "late".
> > 
> > I don't see anything specific about *how* late this might be, but from
> > the use of -EPROBE_DEFER in individual drivers (8250_pnp explicitly,
> > and acpi_register_gsi() and pnp_irq() and acpi_pci_irq_enable(), which
> > are called from driver .probe() paths) it seems like interrupt
> > controllers might be detected even after devices that use them.
> > 
> > That seems like a fairly invasive change to the driver probe flow.
> > If we really need to do that, I think it might merit a little more
> > background as justification since we haven't had to do it for any
> > other arch yet.
> 
> In RISC-V, the APLIC can be a converter from wired (GSI) to MSI interrupts.
> Hence, especially in this mode, it has to be a platform device to use
> device MSI domain. Also, according to Marc Zyngier there is no reason to
> probe interrupt controllers early apart from root controller. So, the
> device drivers which use wired interrupts need to be probed after APLIC.
> 
> The PNP devices and PCI INTx GSI links use either
> acpi_dev_resource_interrupt() (PNP) or acpi_register_gsi() directly
> (PCI). The approach taken here is to follow the example of
> acpi_irq_get() which is enhanced to return EPROBE_DEFER and several
> platform device drivers which use platform_get_irq() seem to be handling
> this already.

This series (patch 04/21 "ACPI: irq: Add support for deferred probe in
acpi_register_gsi()" [1]) makes acpi_register_gsi() return
-EPROBE_DEFER, which percolates up through pci_enable_device().

Maybe that's ok, but this affects *all* PCI drivers, and it's a new
case that did not occur before.  Many drivers emit warning or error
messages for any pci_enable_device() failure, which you probably don't
want in this case, since -EPROBE_DEFER is not really a "failure";
IIUC, it just means "probe again later."

> Using ResourceSource dependency (mbigen uses) in the namespace as part of
> Extended Interrupt Descriptor will not ensure the order since PNP/INTx
> GSI devices don't work with that.

Are these PNP/INTx GSI devices described in ACPI?  In the namespace?
Or in a static table?

> Is there any other better way to create dependency between IO devices
> and the interrupt controllers when interrupt controller itself is a
> platform device? While using core_initcall() for interrupt controllers
> seem to work which forces the interrupt controller to be probed first,
> Marc is not in favor of that approach since it is fragile.

I guess PCI interrupts from the PCI host bridges (PNP0A03 devices)
feed into the APLIC?  And APLIC is described via MADT?  Based on this
series, it looks like this:

    acpi_init
  +   acpi_riscv_init
  +     riscv_acpi_aplic_platform_init
  +       acpi_table_parse_madt(ACPI_MADT_TYPE_APLIC, aplic_parse_madt, 0)
      acpi_scan_init
        acpi_pci_root_init
        acpi_pci_link_init
	acpi_bus_scan             # add PCI host bridges, etc

If that's the sequence, it looks like aplic_parse_madt() should be
called before the PCI host bridges are added.

Or maybe this isn't how the APLICs are enumerated?

Bjorn

[1] https://lore.kernel.org/r/20231025202344.581132-5-sunilvl@ventanamicro.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
