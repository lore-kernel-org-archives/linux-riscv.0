Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04864C25B67
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 16:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=9MfCCfietn94JADE4xaKxz6GJM5asutAJ0L0GD0ijP8=; b=ZqAT4mr3NefCy2
	YnYc6xoIbPPvl5nt95eGjTu+T7L6QZVat6mNI8YLa29UgRSHH+QQNZcE0AlXP0zFnjLtLvgW0kZ36
	tLgUf9G7j3vqbixH0UmrqA0qMJ8icvwK72wfsvX5zn8snPEsHuNDIDmDlkuCHyD695aJpc4uxkNHr
	cTego0wMX3LLh/V2pZfIMRmg3tYOqEdT7E+7Bblad5ErsyLY5sjUM6ga2JqAxVTp1FRBfWxk/OqQP
	kQm2hgze/Iiv4qXwfuJaGy79I76E1avmxLixD6OBuczWQywG0SW635zDg3VquqibxvVlx/IRdnoRN
	iSdR3uWmIzIwOhoBcvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw3aR-00Et0w-1H;
	Thu, 26 Oct 2023 16:51:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw3aN-00Et02-12;
	Thu, 26 Oct 2023 16:51:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 169F3B80ED9;
	Thu, 26 Oct 2023 16:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283EDC433C7;
	Thu, 26 Oct 2023 16:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698339112;
	bh=V8qM86kYWnahH8L8to5RnmhawuvXMtXfMH61MytOS1c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=BlavQRLWWVuUARbinIctcKA8CrUyeRJJCzAYRa0Fnlh/gujQqIpQDkbPZLXuTsxB2
	 anoCTsLnIYAxfr4tz2637av8xqeK14rbMoxBmRXEei5mUPe81JdX75sAvTlkKPRNqV
	 aynexxIOqntWEOLzZPUH5nNkvFYeW0ENy6fgdQP35bLmHR0J1eUHWj6v7oBJfkeF9r
	 QCu85klS6/56jeSeth5ZOSf58mkffvvnAjmJn+9muzJEhOFbbnf3HVpv6YH7BlEevY
	 /nN6PwqU4zJ5iUO6kAuM0XyjWTf/804GKb8OJVf4hoVSFGWdZyt/87Y+yIhWIg3Hfp
	 kQuiBNn/fG3wA==
Date: Thu, 26 Oct 2023 11:51:50 -0500
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
Subject: Re: [RFC PATCH v2 13/21] irqchip: riscv-intc: Add ACPI support for
 AIA
Message-ID: <20231026165150.GA1825130@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231025202344.581132-14-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_095155_532739_ED072B65 
X-CRM114-Status: GOOD (  12.05  )
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

On Thu, Oct 26, 2023 at 01:53:36AM +0530, Sunil V L wrote:
> The RINTC subtype structure in MADT also has information about other
> interrupt controllers like MMIO. So, save those information and provide
> interfaces to retrieve them when required by corresponding drivers.

> @@ -218,7 +306,19 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,

> +	 * MSI controller (IMSIC) in RISC-V is optional. So, unless
> +	 * IMSIC is discovered, set system wide MSI support as
> +	 * unsupported. Once IMSIC is probed, MSI support will be set.
> +	 */
> +	pci_no_msi();

It doesn't seem like we should have to tell the PCI core about
functionality we *don't* have.

I would think IMSIC would be detected before enumerating PCI devices
that might use it, and if we *haven't* found an IMSIC by the time we
get to pci_register_host_bridge(), would/should we set
PCI_BUS_FLAGS_NO_MSI there?

I see Thomas is cc'd; he'd have better insight.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
