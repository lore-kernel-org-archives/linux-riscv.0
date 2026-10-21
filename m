Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF81606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 09:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LASVy1ZQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=ccvoIXh7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:From:In-Reply-To:To:
	Mime-Version:Date:Subject:Cc:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4A++8cRpk9LI2VgZG4jny0RoPcAu4OpE7aEXZYjDagA=; b=LASVy1ZQ+oykX+bOZRl1YUvwXA
	ae1D/iTan+o7QQK5STzE4ud1SFdmQ7/FeW/gWRhaOMUH840L/+tWEThcHGjcpp9uElALzjX9QsFK5
	11yXsmaiFUYOeKi4ogx020WarsVU3YZgpkaZceJKMXCC7COTUtWP47SS3XbFpCsIDovqyWbWwgXv/
	F9qtPRIDzR0V6YJPS9C4pLpD/ef/N6rIzEEN3PDi1RCFrEaNUozv/g+rWtMtuJu/vf0Xwcb7Dtxv2
	AfyKl/pwSPyIdUxxD8EkK87PZdWmrku7CD2fhjXw6qPqIsQifiL9nE07FGDEJm9jFVJlp8mXOCXqA
	qil09XZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSiA-0000000BV9B-21vI;
	Wed, 21 Oct 2026 09:34:18 +0000
Received: from va-2-113.ptr.blmpb.com ([209.127.231.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSi7-0000000BV7k-31Jk
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 09:34:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792575248; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=coNWzQ5GIYQq0sPIsYUvWDSkWqhCl1jRcwfPQzxcsYs=;
 b=ccvoIXh7oTjSziKOA6CLkKOftjqBtbQ/HZCtfXQBoaX7llsMqJ8i5XR/sTJ0r7YV70udCU
 x6jPBuL6mPNvszHK7m549UDVETqYNPf5FNG5fCvLfSo7rftcJpMQ2M6utGRADEUdhmJhPH
 ca1N2IQ6aC4qr98eGi45+aHbPYnzj+Fcr4PQRwekEaEFXeT9ha2xALGNlSiSA1nw6GjZKj
 OCssEO/OfwOc2E1IrlBEsMvQO2xvXmmbWoO4k1zvfjJPYeTu2loUCNxFDeb59tOV9lw6Pe
 EpjjCZuTvg29c/TtsRDBJhwWy0JBkClw6YKuA2hHnmP17UUX5SnEOHiNxYCOlQ==
References: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com> <20260924073714.1650588-3-himanshu.chauhan@oss.qualcomm.com>
Cc: <acpica-devel@lists.linux.dev>, <anup.patel@oss.qualcomm.com>, 
	<ardb@kernel.org>, <conor@kernel.org>, <james.morse@arm.com>, 
	<lenb@kernel.org>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>, 
	<robert.moore@intel.com>, <sunilvl@oss.qualcomm.com>, 
	<tony.luck@intel.com>, <zhangzhanpeng.jasper@bytedance.com>
Subject: Re: [PATCH v5 2/9] riscv: Define arch_apei_get_mem_attribute for RISC-V
Date: Wed, 21 Oct 2026 17:33:45 +0800
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Original-From: Rui Qi <qirui.001@bytedance.com>
To: "Himanshu Chauhan" <himanshu.chauhan@oss.qualcomm.com>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<linux-acpi@vger.kernel.org>, <linux-efi@vger.kernel.org>
In-Reply-To: <20260924073714.1650588-3-himanshu.chauhan@oss.qualcomm.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Message-Id: <98fe9db7-f22c-483d-9811-939263595004@bytedance.com>
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+26ad8870e+dc1956+lists.infradead.org+qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_023415_833148_F20CF97E 
X-CRM114-Status: GOOD (  19.65  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 9/24/26 3:37 PM, Himanshu Chauhan wrote:
> ghes_map function uses arch_apei_get_mem_attribute to get the
> protection bits for a given physical address. These protection
> bits are then used to map the physical address.
> 
> Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
> Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
> ---
>  arch/riscv/include/asm/acpi.h | 16 ++++++++++++++++
>  arch/riscv/kernel/acpi.c      | 12 ++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> index cdefa1f2d67d..c7dee956cdb1 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -16,6 +16,7 @@
>  
>  /* Basic configuration for ACPI */
>  #ifdef CONFIG_ACPI
> +pgprot_t __acpi_get_mem_attribute(phys_addr_t addr);
>  
>  typedef u64 phys_cpuid_t;
>  #define PHYS_CPUID_INVALID INVALID_HARTID
> @@ -29,6 +30,21 @@ extern int acpi_disabled;
>  extern int acpi_noirq;
>  extern int acpi_pci_disabled;
>  
> +#ifdef	CONFIG_ACPI_APEI
> +/*
> + * acpi_disable_cmcff to disable IA-32 Corrected Machine Check (CMC)
> + * Firmware-First mode. It is not required in RISC-V architecture
> + * and is present for compatibility
> + */
> +#define acpi_disable_cmcff 1
> +static inline pgprot_t arch_apei_get_mem_attribute(phys_addr_t addr)
> +{
> +	return  __acpi_get_mem_attribute(addr);
> +}
> +#else /* CONFIG_ACPI_APEI */
> +#define acpi_disable_cmcff 0
> +#endif /* !CONFIG_ACPI_APEI */
> +
>  static inline void disable_acpi(void)
>  {
>  	acpi_disabled = 1;
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index efd52a5d05b5..d1e472ce0878 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -204,6 +204,18 @@ struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
>  	return &cpu_madt_rintc[cpu];
>  }
>  
> +pgprot_t __acpi_get_mem_attribute(phys_addr_t addr)
> +{
> +	u64 attr;
> +
> +	attr = efi_mem_attributes(addr);
> +	if (attr & EFI_MEMORY_WB)
> +		return PAGE_KERNEL;
> +	if ((attr & EFI_MEMORY_WC) || (attr & EFI_MEMORY_WT))
> +		return pgprot_writecombine(PAGE_KERNEL);
> +	return PAGE_KERNEL;
> +}


Hi Himanshu,



Could you clarify why PAGE_KERNEL is used as the fallback here?

When none of EFI_MEMORY_WB, EFI_MEMORY_WC or EFI_MEMORY_WT is
present, including the case where only EFI_MEMORY_UC is advertised,
this returns PAGE_KERNEL.

With standard Svpbmt, PAGE_KERNEL leaves PBMT at zero and therefore
relies on the underlying PMA. In comparison, the existing RISC-V
acpi_os_ioremap() starts with PAGE_KERNEL_IO and retains it when none
of WB/WC/WT is present.

Is relying on the platform PMA intentional for the GHES error status
block mapped by ghes_map()? If so, is there a platform guarantee that
the PMA provides the appropriate memory type for every address reaching
this path?

Otherwise, would PAGE_KERNEL_IO be a more appropriate fallback here,
consistent with acpi_os_ioremap()? A comment documenting the intended
PMA dependency would also help clarify the difference between the two
mapping paths.

Thanks,
Qirui

> +
>  /*
>   * __acpi_map_table() will be called before paging_init(), so early_ioremap()
>   * or early_memremap() should be called here to for ACPI table mapping.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
