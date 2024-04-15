Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6072CC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 23:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=DMXqd73Ip2uGpdj0HvwXzjXyeG7HFO/0CTFyp8i5qsM=; b=y/LRS0qr72DSoX
	swbJz+5mt0z/8xBu8Hr5K4IEIy1j86uZcVCliyM3QJB9cwc7WnY46LJmpzELtpk8aEU9x/9Vsfity
	E/RFUuQFAFQBOc9FHeQ7FcqKjFNJP4oQb7M3XwL6NaABgFEIkma/GW+cIwdwBq0uPKNpTuQPr6DhD
	SM+nA94m7WXJnk8KAzRqwMKGuTV+w1XUry8FLSJlaKMogAo0jr7c5dUm0pgr4WjBIzPaNDux8dN7c
	G4LJpPcnqj6iIbzVLwpPNEnR6UamYwZPxnwSdtKbfmm9jqODpQilnP2jJrl1p/7iErsEG6BSrHLpJ
	HjyIGTD1QIv6mj3l4/6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwVXu-0000000A9EP-2b5D;
	Mon, 15 Apr 2024 23:15:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwVXq-0000000A9DZ-0CZ7;
	Mon, 15 Apr 2024 23:15:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B9C060B96;
	Mon, 15 Apr 2024 23:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82CBC2BD11;
	Mon, 15 Apr 2024 23:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713222925;
	bh=g/+U37u84szEx/7PZiBV5MUYHjoIlyB1hUCoTjwWbPc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=p6cKqEvBtdkXDLHMpexoT3q0o5wpBwL9yufwCM7y/K2OWhX2p2yO3SS+pIOOvJ/0k
	 EvKTPpKgOKs9JyFFQRwOISlc2zpXCHMASoRpHNE/emJQ8/VP1tnNa0LFcsYkIx2fgD
	 6/E4Fn3eTDMJV0SUn6lH0nKjASXmhSRhzypyfYT4KWtG2sDrSSMPvtzsYgY1DZ0Cdd
	 n3LYvKqv+KqegGjjdXIzmv+j2R1WQb7OaMnJsAqCw6b8ZB4A8MIiILf8SChFHHLshL
	 lO9o/ffpYt21j+Joczzy/+1atdVBrrpFojYeTfDkFOJ4LPX/EyqA1dA8mI9PYnyl2g
	 2wPeEU90TsBpw==
Date: Mon, 15 Apr 2024 18:15:23 -0500
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
Message-ID: <20240415231523.GA139682@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415170113.662318-4-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_161526_213917_DC06F672 
X-CRM114-Status: GOOD (  16.00  )
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

On Mon, Apr 15, 2024 at 10:30:56PM +0530, Sunil V L wrote:
> Similar to commit 9ec37efb8783 ("PCI/MSI: Make
> pci_host_common_probe() declare its reliance on MSI domains"), declare
> this dependency for PCI probe in ACPI based flow.
> 
> This is required especially for RISC-V platforms where MSI controller
> can be absent. However, setting this for all architectures seem to cause
> issues on non RISC-V architectures [1]. Hence, enabled this only for
> RISC-V.
> 
> [1] - https://lore.kernel.org/oe-lkp/202403041047.791cb18e-oliver.sang@intel.com
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/pci/probe.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 1325fbae2f28..e09915bee2ee 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -3048,6 +3048,9 @@ struct pci_bus *pci_create_root_bus(struct device *parent, int bus,
>  	bridge->sysdata = sysdata;
>  	bridge->busnr = bus;
>  	bridge->ops = ops;
> +#ifdef CONFIG_RISCV
> +	bridge->msi_domain = true;
> +#endif

Ugh.  I looked at [1], but that's not a very good justification for
this #ifdef.  The fault mentioned in [1] would need to be fixed, but
not this way.

>  	error = pci_register_host_bridge(bridge);
>  	if (error < 0)
> -- 
> 2.40.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
