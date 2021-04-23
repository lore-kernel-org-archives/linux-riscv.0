Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89393C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:32:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 091B661452
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 091B661452
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=k6HgB6RU4dJcHRmg4m0VFeeOwF4/+9oAOCpQhcxAbwQ=; b=LrHz2Mo5Kc/of3Ko42KF+qsEv
	+rmqYkuy1nQnt4IkK5F0r647hH6/wBij1fEYNaqsZ30VNOmZ2uAy1Lsj9gJwNDBsL0Mvf1X5OFExa
	EEzvxYxdFU8TxR9iaCli7nvw/vfUoMVpiS19xEwjUgjCzG6ihpB5NKPoygRDi/ai1HaL3OHLUHCv3
	sSAGcZrq6rCUzS47aXb5FRwowYmlXVint6/fYGhKYowyUYUIiX7LKf88DDwQlk1eZEHC6eFTvhLDj
	EE0WtH55Mq8+S14vzQ5J+q2x0wM1BrUetImBKe8LzAfeVbOB8ep8c4qqjO7gBBa+z5vzgNZW0FjYm
	A2m97vUjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZmXd-000TTl-2M; Fri, 23 Apr 2021 03:31:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmWu-000TKe-29
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 03:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=P+KGPCybOpBTLIxqFZUXq9jQtCur/PgkoYcaeqi73OM=; b=OW17Cdrnq2l6tglkw0GCSvjuN6
 09FJrwHxdM2ui7pAkRUnFaHbIRnupw/Zh4OVzKyPk2D6C5thCwxJsKAcRrJo/n+Fagvp+FAZB/it2
 Y25b1n2deXHoTbjAg24r5g2lIthsppLK/JsLZK1BjRLzg6aSwNeOutIldvBnC8ojCwV3JIqfN2aNP
 1sEV2TzseBRa2GPUOh4DN1Aj+LpmDXOOB5a6V7V9VTpL90rWRbqKb0RkRYRDh7/A3OQ3d72r+jEdG
 AIbmHs4tuyCy6evLBvW47XTLCwYKG0FxbsaK4vJMg31wH7O+TA61TrWWzxpIkffPPcIVAya+A2tTk
 uof1vqmg==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmWq-00E7HE-5G
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 03:30:54 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso531867pjn.0
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 20:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=P+KGPCybOpBTLIxqFZUXq9jQtCur/PgkoYcaeqi73OM=;
 b=ijT6VYkgPf6KT1zkyevJdPIOFt7wBBVnAd6GiE+QA2dvxyOgypKculval8AaeqRZru
 TYmVpZ7Ku7Aq/fyTzX9uhj5RkxPOkTRuaYdioxqB8YVDy6lF2080ev30EJeA5Gyhxp6T
 dCm36fGci/RH6hklN4bZ4mA1moRAzilWemNnx/US+EZNs0PpcbS4ZG+gtG0uofMv3y98
 0lNmxjswoaz4kRjU4wy6aYXd/3k5SkSzLRsfne85WFw8Q7NPR/CzscKGrQkHtC+z0SvY
 7genMihKufvmE67AunuJ0Ag6WuxDpqsYGTDCMpYo+PcvszpR3WhjIDgFFf958r+5Mcwh
 vVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=P+KGPCybOpBTLIxqFZUXq9jQtCur/PgkoYcaeqi73OM=;
 b=nHmG4hQs4vg3UPOXr4g2jg5ajgj/sttL3ZnMgs2QImeAhSF37u6DcAXwnF0XeZ5MeF
 P96OBKQrxQ8Rz8y9SNH9erSxz5Z72XgjhLHvOlwP/CANGe6NKJmxPdosJO7oZs0vgGW+
 EWU1cHwLoNGBnVMQsXm8DXJBMNNMC9CmavonHFvIAUCCEkV7NK7lmTPz2iFKz/Z/wHFS
 P4WMaTk8zp2aOm+29cPnpnbYLSdP6v0gDBdSaQg3L/DgPluRcd/nz74TzscwDHzFha6/
 iQjYnNoYCQHnAZa7CL/J+BhnbUgoTPom2t3p5Tl18savVAdR6uWz86wIdMCQMgVaoY34
 jtug==
X-Gm-Message-State: AOAM533unyWLyDCN6j2lgpQB7t7/q1Ym+Sr8UNmvewWTCZXXE6Tycg5g
 0tWDy/kqovVqhbwi0FnFpfCuag2s5w0rCw==
X-Google-Smtp-Source: ABdhPJzUHqQ+urmPQNixu2rmxzJ0Z/43d/PXa+8zuqofUpXLwpY0B30xP16jUJjAIK2RrvNVmOdbLg==
X-Received: by 2002:a17:90a:55c5:: with SMTP id
 o5mr2055142pjm.78.1619148649823; 
 Thu, 22 Apr 2021 20:30:49 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a11sm3210267pfg.124.2021.04.22.20.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 20:30:49 -0700 (PDT)
Date: Thu, 22 Apr 2021 20:30:49 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Apr 2021 20:30:22 PDT (-0700)
Subject: Re: [PATCH v3 5/5] RISC-V: Add crash kernel support
In-Reply-To: <20210405085712.1953848-6-mick@ics.forth.gr>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-kernel@vger.kernel.org, mickflemm@gmail.com, mick@ics.forth.gr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mick@ics.forth.gr
Message-ID: <mhng-87edd3c7-0ddf-4e6f-8138-b410e53dc3ad@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_203052_250801_FA016AD4 
X-CRM114-Status: GOOD (  49.33  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 05 Apr 2021 01:57:12 PDT (-0700), mick@ics.forth.gr wrote:
> From: Nick Kossifidis <mickflemm@gmail.com>

This doesn't match the SOB.  I just fixed it up.  IIUC that's not 
generally the right way to go, but since it came from the right address 
I'm OK with it this time.

>
> This patch allows Linux to act as a crash kernel for use with
> kdump. Userspace will let the crash kernel know about the
> memory region it can use through linux,usable-memory property
> on the /memory node (overriding its reg property), and about the
> memory region where the elf core header of the previous kernel
> is saved, through a reserved-memory node with a compatible string
> of "linux,elfcorehdr". This approach is the least invasive and
> re-uses functionality already present.
>
> I tested this on riscv64 qemu and it works as expected, you
> may test it by retrieving the dmesg of the previous kernel
> through /proc/vmcore, using the vmcore-dmesg utility from
> kexec-tools.
>
> v3:
>  * Rebase
>
> v2:
>  * Use linux,usable-memory on /memory instead of a new binding
>  * Use a reserved-memory node for ELF core header
>
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> ---
>  arch/riscv/Kconfig             | 10 ++++++++
>  arch/riscv/kernel/Makefile     |  1 +
>  arch/riscv/kernel/crash_dump.c | 46 ++++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/setup.c      | 12 +++++++++
>  arch/riscv/mm/init.c           | 33 ++++++++++++++++++++++++
>  5 files changed, 102 insertions(+)
>  create mode 100644 arch/riscv/kernel/crash_dump.c
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 3716262ef..553c2dced 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -403,6 +403,16 @@ config KEXEC
>
>  	  The name comes from the similarity to the exec system call.
>
> +config CRASH_DUMP
> +	bool "Build kdump crash kernel"
> +	help
> +	  Generate crash dump after being started by kexec. This should
> +	  be normally only set in special crash dump kernels which are
> +	  loaded in the main kernel with kexec-tools into a specially
> +	  reserved region and then later executed after a crash by
> +	  kdump/kexec.
> +
> +	  For more details see Documentation/admin-guide/kdump/kdump.rst
>
>  endmenu
>
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 07f676ad3..bd66d2ce0 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -59,6 +59,7 @@ endif
>  obj-$(CONFIG_HOTPLUG_CPU)	+= cpu-hotplug.o
>  obj-$(CONFIG_KGDB)		+= kgdb.o
>  obj-${CONFIG_KEXEC}		+= kexec_relocate.o crash_save_regs.o machine_kexec.o
> +obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
>
>  obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
>
> diff --git a/arch/riscv/kernel/crash_dump.c b/arch/riscv/kernel/crash_dump.c
> new file mode 100644
> index 000000000..86cc0ada5
> --- /dev/null
> +++ b/arch/riscv/kernel/crash_dump.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This code comes from arch/arm64/kernel/crash_dump.c
> + * Created by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> + * Copyright (C) 2017 Linaro Limited
> + */
> +
> +#include <linux/crash_dump.h>
> +#include <linux/io.h>
> +
> +/**
> + * copy_oldmem_page() - copy one page from old kernel memory
> + * @pfn: page frame number to be copied
> + * @buf: buffer where the copied page is placed
> + * @csize: number of bytes to copy
> + * @offset: offset in bytes into the page
> + * @userbuf: if set, @buf is in a user address space
> + *
> + * This function copies one page from old kernel memory into buffer pointed by
> + * @buf. If @buf is in userspace, set @userbuf to %1. Returns number of bytes
> + * copied or negative error in case of failure.
> + */
> +ssize_t copy_oldmem_page(unsigned long pfn, char *buf,
> +			 size_t csize, unsigned long offset,
> +			 int userbuf)
> +{
> +	void *vaddr;
> +
> +	if (!csize)
> +		return 0;
> +
> +	vaddr = memremap(__pfn_to_phys(pfn), PAGE_SIZE, MEMREMAP_WB);
> +	if (!vaddr)
> +		return -ENOMEM;
> +
> +	if (userbuf) {
> +		if (copy_to_user((char __user *)buf, vaddr + offset, csize)) {
> +			memunmap(vaddr);
> +			return -EFAULT;
> +		}
> +	} else
> +		memcpy(buf, vaddr + offset, csize);
> +
> +	memunmap(vaddr);
> +	return csize;
> +}
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 31866dce9..ff398a3d8 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -66,6 +66,9 @@ static struct resource code_res = { .name = "Kernel code", };
>  static struct resource data_res = { .name = "Kernel data", };
>  static struct resource rodata_res = { .name = "Kernel rodata", };
>  static struct resource bss_res = { .name = "Kernel bss", };
> +#ifdef CONFIG_CRASH_DUMP
> +static struct resource elfcorehdr_res = { .name = "ELF Core hdr", };
> +#endif
>
>  static int __init add_resource(struct resource *parent,
>  				struct resource *res)
> @@ -169,6 +172,15 @@ static void __init init_resources(void)
>  	}
>  #endif
>
> +#ifdef CONFIG_CRASH_DUMP
> +	if (elfcorehdr_size > 0) {
> +		elfcorehdr_res.start = elfcorehdr_addr;
> +		elfcorehdr_res.end = elfcorehdr_addr + elfcorehdr_size - 1;
> +		elfcorehdr_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> +		add_resource(&iomem_resource, &elfcorehdr_res);
> +	}
> +#endif
> +
>  	for_each_reserved_mem_region(region) {
>  		res = &mem_res[res_idx--];
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index e71b35cec..f66011816 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -13,6 +13,7 @@
>  #include <linux/swap.h>
>  #include <linux/sizes.h>
>  #include <linux/of_fdt.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/libfdt.h>
>  #include <linux/set_memory.h>
>  #include <linux/dma-map-ops.h>
> @@ -606,6 +607,18 @@ static void __init reserve_crashkernel(void)
>
>  	int ret = 0;
>
> +	/*
> +	 * Don't reserve a region for a crash kernel on a crash kernel
> +	 * since it doesn't make much sense and we have limited memory
> +	 * resources.
> +	 */
> +#ifdef CONFIG_CRASH_DUMP
> +	if (is_kdump_kernel()) {
> +		pr_info("crashkernel: ignoring reservation request\n");
> +		return;
> +	}
> +#endif
> +
>  	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
>  				&crash_size, &crash_base);
>  	if (ret || !crash_size)
> @@ -660,6 +673,26 @@ static void __init reserve_crashkernel(void)
>  }
>  #endif /* CONFIG_KEXEC_CORE */
>
> +#ifdef CONFIG_CRASH_DUMP
> +/*
> + * We keep track of the ELF core header of the crashed
> + * kernel with a reserved-memory region with compatible
> + * string "linux,elfcorehdr". Here we register a callback
> + * to populate elfcorehdr_addr/size when this region is
> + * present. Note that this region will be marked as
> + * reserved once we call early_init_fdt_scan_reserved_mem()
> + * later on.
> + */
> +static int elfcore_hdr_setup(struct reserved_mem *rmem)
> +{
> +	elfcorehdr_addr = rmem->base;
> +	elfcorehdr_size = rmem->size;
> +	return 0;
> +}
> +
> +RESERVEDMEM_OF_DECLARE(elfcorehdr, "linux,elfcorehdr", elfcore_hdr_setup);
> +#endif
> +
>  void __init paging_init(void)
>  {
>  	setup_vm_final();

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
