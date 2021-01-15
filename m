Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD42C433E6
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 02:33:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22DD623AF8
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 02:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22DD623AF8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Mime-Version:Message-ID:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=tOCpudATn528xYtdd5FK3TQ/+zrQStaJeOG5UWSz0T0=; b=cThPlbCAmBnOcuQ2aXDIpjaVG
	6xY3QlIMKUAVwTD8z4REwRoQOPXuWGPandJrii0haFi6D4jeyLoLWayFgCcCl/o6k88GF40JxpRtW
	kiWqXPuzI11tsbKaRMLtBNaSK3XBvR0bg4AjK4bsqLDRsEC4TfYvsanwo7cU/WQnHhoCnozR5XfZU
	pzG/hYEeV8VKeJpyOuOtxyOYizKFVbQkVDWELJp83+/aMa2eG9u1sNhQeaCSq6jj3cllxb4aEMLk+
	0pE830LLiOPrMLM8MTUd9BPQ5/AYwwBkC7bO5xIe3Vxg8ecANQhUHyp85ffAy34u8cR/9MO5rjVtr
	1H0bCDLTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0EvE-0000CH-Iu; Fri, 15 Jan 2021 02:33:08 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0EvC-0000B8-1k
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 02:33:07 +0000
Received: by mail-pj1-x102b.google.com with SMTP id cq1so4217398pjb.4
 for <linux-riscv@lists.infradead.org>; Thu, 14 Jan 2021 18:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=JnaSGfJtOIit6mn8j+tKksOhMgr8XbO/qeaO1rbIlgE=;
 b=M3D3RdZnIWZhoP2FbSU7H4kzbubXSTwUj7R1cMqL9BXmmI/Ept7l28Q24Um/pHR23/
 fD/CnGScG1y2nK7FEPNAeRBTIIuaBX7OkNM0tsO3noAh3GApP/O3Bq3HfjxeiFfD+ZDD
 i+2+0t6ZtT4bdqW0+/lSAek2vsRZO2cH1nVrLOGFTokdxY47MpRZQ55WEIOrCrApu2OM
 WOlLqJmnZZQEY8/618JXF9IEPRkgmvqU5114S/qF+nNrNxgFnGQ7hF///8wbzaCztnsd
 reKATUCJAmtZo8DLg9ypBBTZXJdvvLSMpp745Ldi5HmYxvL5+rRNfNH/vVRJtHwbRacJ
 1Waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=JnaSGfJtOIit6mn8j+tKksOhMgr8XbO/qeaO1rbIlgE=;
 b=sptxPouLSLEPtbRB20SWbK7M4Epikh9M4fPfDyIftXzBniEIDo/hcibdes9Qy2Eec1
 ujJCm/Nqp1GB7oDNOaglC5fr8vJ7jNb1qd0uhAhLsPak1sGhS7MVCEb5JYh0pYG3rq+6
 tC5ZdFgIJ7aAnDpzHF4Rd8gB9D2o456HO00HMzzXcu6hV8SGTIL1JO7CiKHLBbXR1RlF
 92r42eeLYg5X6IVppiFcx8nnU/cKozbjsATKPRitgPO2JqCW2HGcGowIqlUjB9/pWMJ/
 q1Rdnl2RXyMqVlihhfIXWazddjuVyJ0mLBprDeISp/O/uGnuy+wy8MyCGaJFObUo0QVc
 Ubxw==
X-Gm-Message-State: AOAM531U7nyueBfVRXip+TFwY1TIG3DAVRkFVSpKADTMXjij0yH2u+6M
 zqmRF3NTIpueJWvCg5XGKPjDpA==
X-Google-Smtp-Source: ABdhPJx9CtB/nQ1G0zSjSjhXt54hVd39Ky3Aowjgi42BadbWjyuDLQs7tkSofuYj7FHX2m4I6g61aQ==
X-Received: by 2002:a17:902:a5cb:b029:dc:2706:4cc8 with SMTP id
 t11-20020a170902a5cbb02900dc27064cc8mr10497550plq.62.1610677983962; 
 Thu, 14 Jan 2021 18:33:03 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e3sm178929pgs.60.2021.01.14.18.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 18:33:03 -0800 (PST)
Date: Thu, 14 Jan 2021 18:33:03 -0800 (PST)
X-Google-Original-Date: Thu, 14 Jan 2021 18:31:24 PST (-0800)
Subject: Re: [PATCH v2] initramfs: Provide a common initrd reserve function
In-Reply-To: <20210114023358.176459-1-wangkefeng.wang@huawei.com>
Message-ID: <mhng-68a3f8a1-02f5-4487-ae17-fc06c81f072c@penguin>
Mime-Version: 1.0 (MHng)
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_213306_150207_7313C39D 
X-CRM114-Status: GOOD (  31.96  )
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
Cc: wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, Atish Patra <Atish.Patra@wdc.com>, guoren@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 13 Jan 2021 18:33:58 PST (-0800), wangkefeng.wang@huawei.com wrote:
> The ARM and riscv have same logic to check and reserve
> the memory of initrd, let's provide a common function to
> reduce duplicated code.
>
> Add __LINUX_INITRD_H define in initrd.h to prevent build error
> (found by kernel test robot <lkp@intel.com>) from the multiple
> inclusion of same header file multiple time.

This is doing a bunch of different things:

* Fixing the lack of a preprocessor guard in initrd.h
* Adding some generic code.
* Converting two architectures over to that generic code.

It needs to be split into four patches.  I'm happy to take them via the RISC-V 
tree (with an Ack from for the arch/arm/ stuff), but not all together.

It looks like csky copied this as well, they at least have exactly the same 
message.

> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> v2: fix build err
>
>  arch/arm/mm/init.c     | 43 +---------------------------------
>  arch/riscv/mm/init.c   | 53 +-----------------------------------------
>  include/linux/initrd.h | 11 +++++++++
>  init/initramfs.c       | 45 +++++++++++++++++++++++++++++++++++
>  4 files changed, 58 insertions(+), 94 deletions(-)
>
> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> index 828a2561b229..a29e14cd626c 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> @@ -153,47 +153,6 @@ phys_addr_t __init arm_memblock_steal(phys_addr_t size, phys_addr_t align)
>  	return phys;
>  }
>
> -static void __init arm_initrd_init(void)
> -{
> -#ifdef CONFIG_BLK_DEV_INITRD
> -	phys_addr_t start;
> -	unsigned long size;
> -
> -	initrd_start = initrd_end = 0;
> -
> -	if (!phys_initrd_size)
> -		return;
> -
> -	/*
> -	 * Round the memory region to page boundaries as per free_initrd_mem()
> -	 * This allows us to detect whether the pages overlapping the initrd
> -	 * are in use, but more importantly, reserves the entire set of pages
> -	 * as we don't want these pages allocated for other purposes.
> -	 */
> -	start = round_down(phys_initrd_start, PAGE_SIZE);
> -	size = phys_initrd_size + (phys_initrd_start - start);
> -	size = round_up(size, PAGE_SIZE);
> -
> -	if (!memblock_is_region_memory(start, size)) {
> -		pr_err("INITRD: 0x%08llx+0x%08lx is not a memory region - disabling initrd\n",
> -		       (u64)start, size);
> -		return;
> -	}
> -
> -	if (memblock_is_region_reserved(start, size)) {
> -		pr_err("INITRD: 0x%08llx+0x%08lx overlaps in-use memory region - disabling initrd\n",
> -		       (u64)start, size);
> -		return;
> -	}
> -
> -	memblock_reserve(start, size);
> -
> -	/* Now convert initrd to virtual addresses */
> -	initrd_start = __phys_to_virt(phys_initrd_start);
> -	initrd_end = initrd_start + phys_initrd_size;
> -#endif
> -}
> -
>  #ifdef CONFIG_CPU_ICACHE_MISMATCH_WORKAROUND
>  void check_cpu_icache_size(int cpuid)
>  {
> @@ -215,7 +174,7 @@ void __init arm_memblock_init(const struct machine_desc *mdesc)
>  	/* Register the kernel text, kernel data and initrd with memblock. */
>  	memblock_reserve(__pa(KERNEL_START), KERNEL_END - KERNEL_START);
>
> -	arm_initrd_init();
> +	reserve_initrd_mem();
>
>  	arm_mm_memblock_reserve();
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index da53902ef0fc..93cba0d3f43f 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -105,55 +105,6 @@ void __init mem_init(void)
>  	print_vm_layout();
>  }
>
> -#ifdef CONFIG_BLK_DEV_INITRD
> -static void __init setup_initrd(void)
> -{
> -	phys_addr_t start;
> -	unsigned long size;
> -
> -	/* Ignore the virtul address computed during device tree parsing */
> -	initrd_start = initrd_end = 0;
> -
> -	if (!phys_initrd_size)
> -		return;
> -	/*
> -	 * Round the memory region to page boundaries as per free_initrd_mem()
> -	 * This allows us to detect whether the pages overlapping the initrd
> -	 * are in use, but more importantly, reserves the entire set of pages
> -	 * as we don't want these pages allocated for other purposes.
> -	 */
> -	start = round_down(phys_initrd_start, PAGE_SIZE);
> -	size = phys_initrd_size + (phys_initrd_start - start);
> -	size = round_up(size, PAGE_SIZE);
> -
> -	if (!memblock_is_region_memory(start, size)) {
> -		pr_err("INITRD: 0x%08llx+0x%08lx is not a memory region",
> -		       (u64)start, size);
> -		goto disable;
> -	}
> -
> -	if (memblock_is_region_reserved(start, size)) {
> -		pr_err("INITRD: 0x%08llx+0x%08lx overlaps in-use memory region\n",
> -		       (u64)start, size);
> -		goto disable;
> -	}
> -
> -	memblock_reserve(start, size);
> -	/* Now convert initrd to virtual addresses */
> -	initrd_start = (unsigned long)__va(phys_initrd_start);
> -	initrd_end = initrd_start + phys_initrd_size;
> -	initrd_below_start_ok = 1;
> -
> -	pr_info("Initial ramdisk at: 0x%p (%lu bytes)\n",
> -		(void *)(initrd_start), size);
> -	return;
> -disable:
> -	pr_cont(" - disabling initrd\n");
> -	initrd_start = 0;
> -	initrd_end = 0;
> -}
> -#endif /* CONFIG_BLK_DEV_INITRD */
> -
>  void __init setup_bootmem(void)
>  {
>  	phys_addr_t mem_start = 0;
> @@ -198,9 +149,7 @@ void __init setup_bootmem(void)
>  	dma32_phys_limit = min(4UL * SZ_1G, (unsigned long)PFN_PHYS(max_low_pfn));
>  	set_max_mapnr(max_low_pfn);
>
> -#ifdef CONFIG_BLK_DEV_INITRD
> -	setup_initrd();
> -#endif /* CONFIG_BLK_DEV_INITRD */
> +	reserve_initrd_mem();
>
>  	/*
>  	 * Avoid using early_init_fdt_reserve_self() since __pa() does
> diff --git a/include/linux/initrd.h b/include/linux/initrd.h
> index 8db6f8c8030b..85c15717af34 100644
> --- a/include/linux/initrd.h
> +++ b/include/linux/initrd.h
> @@ -1,5 +1,8 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>
> +#ifndef __LINUX_INITRD_H
> +#define __LINUX_INITRD_H
> +
>  #define INITRD_MINOR 250 /* shouldn't collide with /dev/ram* too soon ... */
>
>  /* starting block # of image */
> @@ -15,6 +18,12 @@ extern int initrd_below_start_ok;
>  extern unsigned long initrd_start, initrd_end;
>  extern void free_initrd_mem(unsigned long, unsigned long);
>
> +#ifdef CONFIG_BLK_DEV_INITRD
> +extern void __init reserve_initrd_mem(void);
> +#else
> +static inline void __init reserve_initrd_mem(void) {}
> +#endif
> +
>  extern phys_addr_t phys_initrd_start;
>  extern unsigned long phys_initrd_size;
>
> @@ -24,3 +33,5 @@ extern char __initramfs_start[];
>  extern unsigned long __initramfs_size;
>
>  void console_on_rootfs(void);
> +
> +#endif /* __LINUX_INITRD_H */
> diff --git a/init/initramfs.c b/init/initramfs.c
> index 55b74d7e5260..f75c89e9d602 100644
> --- a/init/initramfs.c
> +++ b/init/initramfs.c
> @@ -535,6 +535,51 @@ extern unsigned long __initramfs_size;
>  #include <linux/initrd.h>
>  #include <linux/kexec.h>
>
> +void __init reserve_initrd_mem(void)
> +{
> +	phys_addr_t start;
> +	unsigned long size;
> +
> +	/* Ignore the virtul address computed during device tree parsing */
> +	initrd_start = initrd_end = 0;
> +
> +	if (!phys_initrd_size)
> +		return;
> +	/*
> +	 * Round the memory region to page boundaries as per free_initrd_mem()
> +	 * This allows us to detect whether the pages overlapping the initrd
> +	 * are in use, but more importantly, reserves the entire set of pages
> +	 * as we don't want these pages allocated for other purposes.
> +	 */
> +	start = round_down(phys_initrd_start, PAGE_SIZE);
> +	size = phys_initrd_size + (phys_initrd_start - start);
> +	size = round_up(size, PAGE_SIZE);
> +
> +	if (!memblock_is_region_memory(start, size)) {
> +		pr_err("INITRD: 0x%08llx+0x%08lx is not a memory region",
> +		       (u64)start, size);
> +		goto disable;
> +	}
> +
> +	if (memblock_is_region_reserved(start, size)) {
> +		pr_err("INITRD: 0x%08llx+0x%08lx overlaps in-use memory region\n",
> +		       (u64)start, size);
> +		goto disable;
> +	}
> +
> +	memblock_reserve(start, size);
> +	/* Now convert initrd to virtual addresses */
> +	initrd_start = (unsigned long)__va(phys_initrd_start);
> +	initrd_end = initrd_start + phys_initrd_size;
> +	initrd_below_start_ok = 1;
> +
> +	return;
> +disable:
> +	pr_cont(" - disabling initrd\n");
> +	initrd_start = 0;
> +	initrd_end = 0;
> +}
> +
>  void __weak __init free_initrd_mem(unsigned long start, unsigned long end)
>  {
>  #ifdef CONFIG_ARCH_KEEP_MEMBLOCK

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
