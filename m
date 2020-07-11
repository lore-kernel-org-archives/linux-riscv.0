Return-Path: <SRS0=q1JI=AW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F99C433E6
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2020 03:59:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6EFD2078B
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2020 03:59:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QIjyPiM9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="clS5+OEg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6EFD2078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=a/fWm+FhCQjyR8ktsI0Vsnt2nM7LekLvWcss4VO9YWE=; b=QIjyPiM9t9G1nB22tfubcwiMA
	0PkS2dAZKgJNZMlKI61sS688h7jvJVGO2tgSIJRA33/+l0VN/Tb+2f3twnU4aA9MHTmeuWrEeAZKh
	ZISRoyKm8BvK5nRGk5usaX4vh+qytQeQIms6N1CB1PyVu14Le1c08srLtwihHZRMURhmiWcyHPFew
	4ZB+E3YwbhZkCOMifG9a0KJriiho/yQJSkjW1ufjh4uS+gYAwK2mhcpiqr6G3unF2F2oBlFLr5Lk8
	OYDuJ0GMkrjI7aye8vanG0+iHPIcFyv9GdpdNXmt7qcuEE28cRS9/t9wjaovomoyAvq8kQd31HqMH
	pbE9w6LZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju6fs-0001cV-Fn; Sat, 11 Jul 2020 03:59:40 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju6fe-0001Yf-PI
 for linux-riscv@lists.infradead.org; Sat, 11 Jul 2020 03:59:34 +0000
Received: by mail-pj1-x1042.google.com with SMTP id o22so3441236pjw.2
 for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2020 20:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=5u3dOMjnnFUBmrOLtf+aUeCwXGvoSqbGtMXzD20rSKk=;
 b=clS5+OEgtxvg9or4PnfmCQY8YCEpv/eFRZPiaPUSSoalWPu+7XV2vAX9E8e7U+FCPj
 S9JjM/20tPzRRXmB2X5GcqCClJyTGyOhf9rpOMHrDCpJcreyHN9aFS8IJMFnuESOAkbF
 4+7Ug+jA+YaCZQfgDpDr5emuUXCl/fe6HoQDVmlB6a2HG5D9mHYlNasCyVWm0xDgLdxa
 PILyeB/2YEglSkQi6TQ1pcJBz+lZCaNWt7C95b6cA0IoB57BBVFuPCEpdMNaTIcjMdz4
 Yuqwh2yMT8esEqMCemnMXMZ6IS2KwCyJac6fqOgCgXo8NkDAslgBUGjN6NT7n5kkqCU7
 s4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=5u3dOMjnnFUBmrOLtf+aUeCwXGvoSqbGtMXzD20rSKk=;
 b=l5CS72PweH+uX6u5Oa/8hdmt3daiJgBTxFtZKOunfJOswEpxxnVFY5+4+bbVIJ3U7U
 ZGuErxZAsMFfULbIC8pdkrIhRsq+qW7iYHR+n5nTWhLhKq4iwtqQT5N8pIKVtoWBTUdS
 blkEmo53S4u6iTLOo+Gm0lcqxELo6YykXn6NSrOu6g2+Xh6y/f3NbA2ZbXSfsJTh7byD
 1ToALxTs0PYVbqVhU70nf2cr4n0TiuLGfzoEaYquULJfdjc6G/7/2Upws9t6EK8Sd2Lp
 91LI5Xtg/6/T2FYNK+TwUP37a+MPbEAPZyrh8Gg2OHJvguJr/5g2+vAGGwrcWGYM809o
 CHkg==
X-Gm-Message-State: AOAM531R1Kb2UTEIs5vnFVi0bttKCbyKlELc/Jc6EfT+TFhEmXLpRC+r
 jTb/2ssVnY742LNP55SJ9MU+TxSRCyY=
X-Google-Smtp-Source: ABdhPJwfWAKb5+gRaglNz07XJxLb6GmMymKxW6wkyLRmDsKImyech9xVEO6GeqxrmSiLpfIjLb+d0w==
X-Received: by 2002:a17:90a:454f:: with SMTP id
 r15mr8871458pjm.6.1594439964456; 
 Fri, 10 Jul 2020 20:59:24 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 193sm7225605pfz.85.2020.07.10.20.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 20:59:23 -0700 (PDT)
Date: Fri, 10 Jul 2020 20:59:23 -0700 (PDT)
X-Google-Original-Date: Fri, 10 Jul 2020 20:55:58 PDT (-0700)
Subject: Re: [PATCH v2 3/3] RISC-V: Add crash kernel support
In-Reply-To: <20200623150512.896499-4-mick@ics.forth.gr>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mick@ics.forth.gr
Message-ID: <mhng-cf27f8bc-90c8-4ba2-a172-78af9e182f62@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_235926_971529_E50AD93B 
X-CRM114-Status: GOOD (  43.33  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: david.abdurachmanov@sifive.com, anup@brainfault.org,
 Atish Patra <Atish.Patra@wdc.com>, yibin_liu@c-sky.com, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, mick@ics.forth.gr,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 23 Jun 2020 08:05:12 PDT (-0700), mick@ics.forth.gr wrote:
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
> v2:
>  * Use linux,usable-memory on /memory instead of a new binding
>  * Use a reserved-memory node for ELF core header
>
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> ---
>  arch/riscv/Kconfig             | 10 ++++++++
>  arch/riscv/kernel/Makefile     |  1 +
>  arch/riscv/kernel/crash_dump.c | 46 ++++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/setup.c      | 35 +++++++++++++++++++++++---
>  arch/riscv/mm/init.c           | 33 ++++++++++++++++++++++++
>  5 files changed, 122 insertions(+), 3 deletions(-)
>  create mode 100644 arch/riscv/kernel/crash_dump.c
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e7dd2d1c5..6c59987f0 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -353,6 +353,16 @@ config KEXEC
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
> index b9a3842ad..f067f55f1 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -53,5 +53,6 @@ endif
>  obj-$(CONFIG_HOTPLUG_CPU)	+= cpu-hotplug.o
>  obj-$(CONFIG_KGDB)		+= kgdb.o
>  obj-${CONFIG_KEXEC}		+= kexec_relocate.o crash_save_regs.o machine_kexec.o
> +obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
>
>  clean:
> diff --git a/arch/riscv/kernel/crash_dump.c b/arch/riscv/kernel/crash_dump.c
> new file mode 100644
> index 000000000..81b9d2a71
> --- /dev/null
> +++ b/arch/riscv/kernel/crash_dump.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This code comes from arch/arm64/kernel/crash_dump.c

Which is "GPL-2.0-only", not "GPL-2.0".  I just sent out a patch set to make
this generic, as a handful of architectures use it exactly (and some others may
be able to).

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
> index 4dc940389..469470b0b 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -63,6 +63,9 @@ static struct resource code_res = { .name = "Kernel code", };
>  static struct resource data_res = { .name = "Kernel data", };
>  static struct resource rodata_res = { .name = "Kernel rodata", };
>  static struct resource bss_res = { .name = "Kernel bss", };
> +#ifdef CONFIG_CRASH_DUMP
> +static struct resource elfcorehdr_res = { .name = "ELF Core hdr", };
> +#endif
>
>  static int __init add_resource(struct resource *parent,
>  				struct resource *res)
> @@ -133,6 +135,16 @@ static int __init add_crashk_resource(struct resource *res)
>  }
>  #endif
>
> +#ifdef CONFIG_CRASH_DUMP
> +static int __init add_elfcorehdr_resource(struct resource *res)
> +{
> +	if (res->start <= elfcorehdr_res.start && res->end >= elfcorehdr_res.end)
> +		return add_resource(&iomem_resource, &elfcorehdr_res);
> +
> +	return 0;
> +}
> +#endif
> +
>  static void __init init_resources(void)
>  {
>  	struct memblock_region *region = NULL;
> @@ -155,6 +167,14 @@ static void __init init_resources(void)
>  	bss_res.end = __pa_symbol(__bss_stop) - 1;
>  	bss_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
>
> +#ifdef CONFIG_CRASH_DUMP
> +	if (elfcorehdr_size) {
> +		elfcorehdr_res.start = elfcorehdr_addr;
> +		elfcorehdr_res.end = elfcorehdr_addr + elfcorehdr_size - 1;
> +		elfcorehdr_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> +	}
> +#endif
> +
>  	/*
>  	 * Start by adding the reserved regions, if they overlap
>  	 * with /memory regions, insert_resource later on will take
> @@ -185,6 +206,14 @@ static void __init init_resources(void)
>  			continue;
>  #endif
>
> +#ifdef CONFIG_CRASH_DUMP
> +		ret = add_elfcorehdr_resource(res);
> +		if (ret < 0)
> +			goto error;
> +		else if (ret)
> +			continue;
> +#endif
> +
>  		/*
>  		 * Ignore any other reserved regions within
>  		 * system memory.
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index e4ce3a2af..c85ddfe44 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -13,6 +13,7 @@
>  #include <linux/swap.h>
>  #include <linux/sizes.h>
>  #include <linux/of_fdt.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/libfdt.h>
>  #include <linux/set_memory.h>
>  #include <linux/crash_dump.h>
> @@ -123,6 +124,26 @@ static void __init setup_initrd(void)
>  }
>  #endif /* CONFIG_BLK_DEV_INITRD */
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
>  static phys_addr_t dtb_early_pa __initdata;
>
>  void __init setup_bootmem(void)
> @@ -537,6 +558,18 @@ static void __init reserve_crashkernel(void)
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

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
