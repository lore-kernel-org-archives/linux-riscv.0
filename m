Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330B2C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 19:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=IqLOPHamTGlcRIupziUNSSKu4lHG4gdKwHZGfmRAfho=; b=ZHNpRoYOgukBUq
	953RRQKdK+ioEIGfsN2Uja7bAKLPpVZRKi1BaE82OPIpjsZTZRT4x47JiiOcspBGgWtF4JbhlikkE
	eHT7ixyB7PgOiVqGFb5PfojYhTZO+PZZuCApZ0EgltEBkzjbejZ6hHA0y+JFSkYmjN7opavOGwkqQ
	IeuRgWMXwJPL4NJFFG8nPBdKAeWl70Bgr74IDfcaLQjoFBdfUpPORu4nI6HAx/afeeU9ItX60t+Dy
	KfZ9VC418FT59gU/fDLTz56s0u8M9hkquDtsaXl5nS3lN+DSlp4D6xq1WF6fcE1aXi0IW18EqAGIx
	IvnrKDq+y8yDpzJXd6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZFKN-00000002MHD-1xJF;
	Wed, 31 Jul 2024 19:49:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZFCH-00000002JvC-42c2;
	Wed, 31 Jul 2024 19:41:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C4678CE17FD;
	Wed, 31 Jul 2024 19:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF13C4AF09;
	Wed, 31 Jul 2024 19:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722454875;
	bh=ybbPtwxAbX+EdKv2j4xf5JOnL86Xh7bOuRhCwIfI1vg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=eXxzDAtu26AfRwv2jPkKCDNmEcjx5dvC/nrIF7bX3JyESgSKP/drRJqSwswz+Xbvz
	 1a/qOgmfOdppRfahfAnw11W9qDDeCy9Vn5CKXG6wNzU5wgCfgGIR0xG9JZEGo9ZYT8
	 W6N2x+Fdae5JLj4uAF2dVKdyL2u/h0JPSsVthWaFHnqFwdnmhBpGq0mEjoJBOpPCfM
	 pHbjTiGSKcZp68kKnKokVKgHx1QlsjcmfWSMi6AswOJJfL2Uzynh6W12SYFc8IGdrH
	 0uCrQEoxmjTfbYdhFdvo/6B1MEtkTVU0SbBH4nKaGsrIdQkN61zWJOb0y120nW7na3
	 o+OfdssbdzW2Q==
Date: Wed, 31 Jul 2024 14:41:13 -0500
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
Subject: Re: [PATCH v7 02/17] ACPI: scan: Add a weak function to reorder the
 IRQCHIP probe
Message-ID: <20240731194113.GA77955@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240729142241.733357-3-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_124118_371578_99E3EF66 
X-CRM114-Status: GOOD (  22.10  )
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

On Mon, Jul 29, 2024 at 07:52:24PM +0530, Sunil V L wrote:
> Unlike OF framework, the irqchip probe using IRQCHIP_ACPI_DECLARE has no
> order defined. Depending on the Makefile is not a good idea. So,
> usually it is worked around by mandating only root interrupt controller
> probed using IRQCHIP_ACPI_DECLARE and other interrupt controllers are
> probed via cascade mechanism.
> 
> However, this is also not a clean solution because if there are multiple
> root controllers (ex: RINTC in RISC-V which is per CPU) which need to be
> probed first, then the cascade will happen for every root controller.
> So, introduce a architecture specific weak function to order the probing
> of the interrupt controllers which can be implemented by different
> architectures as per their interrupt controller hierarchy.

Nit: I think it's nice if the commit log and even the subject line
includes the actual *name* of the function being added.

s/a architecture/an architecture/

No need to repost for these.

> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/acpi/scan.c  | 3 +++
>  include/linux/acpi.h | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 59771412686b..52a9dfc8e18c 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -2755,6 +2755,8 @@ static int __init acpi_match_madt(union acpi_subtable_headers *header,
>  	return 0;
>  }
>  
> +void __weak arch_sort_irqchip_probe(struct acpi_probe_entry *ap_head, int nr) { }
> +
>  int __init __acpi_probe_device_table(struct acpi_probe_entry *ap_head, int nr)
>  {
>  	int count = 0;
> @@ -2763,6 +2765,7 @@ int __init __acpi_probe_device_table(struct acpi_probe_entry *ap_head, int nr)
>  		return 0;
>  
>  	mutex_lock(&acpi_probe_mutex);
> +	arch_sort_irqchip_probe(ap_head, nr);
>  	for (ape = ap_head; nr; ape++, nr--) {
>  		if (ACPI_COMPARE_NAMESEG(ACPI_SIG_MADT, ape->id)) {
>  			acpi_probe_count = 0;
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 0687a442fec7..3fff86f95c2f 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -1343,6 +1343,8 @@ struct acpi_probe_entry {
>  	kernel_ulong_t driver_data;
>  };
>  
> +void arch_sort_irqchip_probe(struct acpi_probe_entry *ap_head, int nr);
> +
>  #define ACPI_DECLARE_PROBE_ENTRY(table, name, table_id, subtable,	\
>  				 valid, data, fn)			\
>  	static const struct acpi_probe_entry __acpi_probe_##name	\
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
