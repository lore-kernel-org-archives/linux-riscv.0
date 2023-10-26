Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2011C25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 17:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=C+Odogy48rtCypDtbSCh37+xbCNdf4OnWq2SA7A4/To=; b=h18LYexFBc4rMC
	Cvid8KnUxP0qlrfL4KTalbue7U09nuZRA1rtuCdb1FelhT4cf8TvtQGXmkMBHCWxYzCrOZB1Iz0vA
	Vq+3ELD+SgaXRRuep5uEh7pDgpgG/Z9Yl7s2wLgC9pZ7bdVQA8nRubTtifzhhZ2NQ0SJ+Gw6jUwla
	m8n/nxbPw0mVbf1em7nWT0DrnH6bkW50ijaSWefdkdvrG5csbzug4mnO6MpS1OR6ge4ROnFfa7PQ2
	jSURXAgduVZNfaSJYdtwMT58kEi1tVr20fAneMD5UETLlkyyV7GAjvPXOmCZJuMhbwwaJnSjrKige
	L6X6D25rl2TSqTB7D0WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw3mJ-00Eu5l-0p;
	Thu, 26 Oct 2023 17:04:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw3mF-00Eu4n-2A;
	Thu, 26 Oct 2023 17:04:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D60863574;
	Thu, 26 Oct 2023 17:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6849CC433C8;
	Thu, 26 Oct 2023 17:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698339850;
	bh=lohn07v+85pAnB2Smu7iOTuTgIcJkgpWbWvasyT0Fgw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Escr5IAbmRkywpD2oy80GZ3HPbUNYPxv48Yrj/nfqrSprJK3BJmybCJQwbFisJOjy
	 NrPuQWhwMOQvib+LwQXPASzj+Jyg12NTH2EGevoiJ4zXjWl5BDARgpagN13VoFZwcY
	 6xdVtztFRh3d3ukt8I/e+qpzBO8CYpcnaWAMpqGwO5WbEORXXThtSLF2G6haunf86F
	 pL3KUoqYEvk9PvF99SIzEEDiSDrmZQwjPFjbwUIaw9JU0WlXEj1qIRchKwFdWqPrw6
	 MPQdaZZrSB/9NQZ1Zoinq/WAh5vDMUB9YW+eyh9N2zc7VRPkH5LMo4lBpOiORHFGRw
	 Ife18O45et1cw==
Date: Thu, 26 Oct 2023 12:04:08 -0500
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
Message-ID: <20231026170408.GA1825378@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231025202344.581132-7-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_100411_771916_1C414ED4 
X-CRM114-Status: GOOD (  19.51  )
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

On Thu, Oct 26, 2023 at 01:53:29AM +0530, Sunil V L wrote:
> On RISC-V platforms, apart from root interrupt controllers (which
> provide local interrupts and IPI), other interrupt controllers in the
> hierarchy are probed late. Enable this select this CONFIG option for
> RISC-V platforms so that device drivers which connect to deferred
> interrupt controllers can take appropriate action.

Quite a bit of this series seems related to the question of interrupt
controllers being probed "late".

I don't see anything specific about *how* late this might be, but from
the use of -EPROBE_DEFER in individual drivers (8250_pnp explicitly,
and acpi_register_gsi() and pnp_irq() and acpi_pci_irq_enable(), which
are called from driver .probe() paths) it seems like interrupt
controllers might be detected even after devices that use them.

That seems like a fairly invasive change to the driver probe flow.
If we really need to do that, I think it might merit a little more
background as justification since we haven't had to do it for any
other arch yet.

Bjorn

> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 8c105a151e12..b62441aefa6a 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -12,6 +12,7 @@ config 32BIT
>  
>  config RISCV
>  	def_bool y
> +	select ARCH_ACPI_DEFERRED_GSI if ACPI
>  	select ACPI_GENERIC_GSI if ACPI
>  	select ACPI_MCFG if (ACPI && PCI)
>  	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
> -- 
> 2.39.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
