Return-Path: <SRS0=8FDR=BZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78AFC433E3
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Aug 2020 22:40:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89C122065C
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Aug 2020 22:40:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FrcukTA2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="PahHdVgL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89C122065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=uCn3AojlGEHufDSUvWji8YPmrf467VsacELdmTJlu84=; b=FrcukTA20LoAXx667KCcRhTC0
	0W6MlffNRGpmrga9c8Y/OkVvOH+G90z9ecWliC60Uzc6Tv/9vkYVRnIJh4n4d6qkUSZGu/3MDNBdj
	svLjgtO7WD21P6Tg58bmSqMbBb0LijPKKURZ7rK8loRI9LtvlcRDh28Pl42KPE3koS08jiJSgU/Km
	p3YnGRBL/HoV69LcsRLSBImb7xgHQKbW9bvGWFcY29UaqSwDrIopqdDbs6k8S07VEZGAO8Twq2go2
	Sd3v1zkerW87B7ep3fjsmNEONSve2hIdShXJW2rZ6heY0nZFaThLBJpcbZwa0TutkMDQqi1ZHG6px
	rWi/PX7ZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k74q3-0006Wt-7F; Sat, 15 Aug 2020 22:39:47 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k74q0-0006VC-DZ
 for linux-riscv@lists.infradead.org; Sat, 15 Aug 2020 22:39:45 +0000
Received: by mail-pj1-x1043.google.com with SMTP id d4so5907967pjx.5
 for <linux-riscv@lists.infradead.org>; Sat, 15 Aug 2020 15:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=qZZS3QqLxW0x2IUSQb8kGqWIW2Rbo+SUaTphs4YMLjY=;
 b=PahHdVgLtDceDSUxCJjinZbquJ+2LIhE3CgwscYYx81HvaSqgkv3iPPpKjsDFmmBkW
 Aw43/99brrNu1suJKzK3eGif/uI0zUWGh/iIP5Ud8vp+A1KXB49cVV04pH8z6Q8+4FxV
 xW9mqdN2G4G/P74iC5X050VLPNJZ2VgTGptDwz8dNCbRxL1PuqQENWEDQfbTswmgc3D0
 ZYBH818OeO8U11FgEvncSTAnFUR1o11u68sFj/v1TkVowymZwWbzRmCwd8yb/YdpkebS
 sRZUrYR8PVLdalwcxMFy2qM+kxfGpyWvfG5abP99aT0np0bf3maUITD4K5En8pK2KGpT
 e0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=qZZS3QqLxW0x2IUSQb8kGqWIW2Rbo+SUaTphs4YMLjY=;
 b=oZbSEpy1//4GcyJia0ECCLt5vuiwKY8h+E97iNaSOYvvYbKXex/y/guc5hQNrpwZwX
 9h6Mgf1Gw0cXgYzgHHdkdQph9gQslH7GU3uHws1xbc9hDFKb/1oPEPZmqmnOd3Gde15z
 oVvE5SX9+5GunHltm+D/wrSN6ZIohMAehkfnH51zKUgMx7/sd7J3wNHpHqlQ8QEqcw/T
 cj6FurNIfwosBiEqOblI2MkreDv4T9MO9HHnHgu921ZqAhcsT5nzze7BhJxnwXFQ1m7b
 dQVTtyxpopZwtpVhRaOicqZInt0ypj43T9AhXCzQ9oPRMa14jUC2s37HNJUuMpi1aT9c
 N3Rg==
X-Gm-Message-State: AOAM530p5yDHoQrLn1BlU0Pi9KfPR8MntQxkzXTwkgp2xpxbQr4B9PmH
 zJyz+cX/q9DBKXDndT4osB0CyA==
X-Google-Smtp-Source: ABdhPJzQ3/qxoCM1pD6I7fIrLFu+lfjNpT/Xr+EeE2QbxI7YjKJFvDOcewB9Fy90lvmv3GRQ6gI9QQ==
X-Received: by 2002:a17:902:848d:: with SMTP id
 c13mr6283615plo.304.1597531180479; 
 Sat, 15 Aug 2020 15:39:40 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b22sm13476748pfb.52.2020.08.15.15.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2020 15:39:39 -0700 (PDT)
Date: Sat, 15 Aug 2020 15:39:39 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Aug 2020 17:33:14 PDT (-0700)
Subject: Re: [PATCH v5 2/9] RISC-V: Add early ioremap support
In-Reply-To: <20200812234758.3563-3-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-13f476e6-5247-4960-83dd-4d2d96de4bce@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200815_183944_480242_5C4C69DB 
X-CRM114-Status: GOOD (  22.86  )
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
Cc: linux-efi@vger.kernel.org, ardb@kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, nivedita@alum.mit.edu,
 Alistair Francis <Alistair.Francis@wdc.com>, longman@redhat.com,
 linux-riscv@lists.infradead.org, will@kernel.org, mingo@kernel.org,
 masahiroy@kernel.org, michal.simek@xilinx.com, steven.price@arm.com,
 greentime.hu@sifive.com, bp@suse.de, han_mao@c-sky.com,
 daniel.schaefer@hpe.com, aou@eecs.berkeley.edu, keescook@chromium.org,
 abner.chang@hpe.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Anup Patel <Anup.Patel@wdc.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, fwts-devel@lists.ubuntu.com,
 akpm@linux-foundation.org, rppt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 12 Aug 2020 16:47:51 PDT (-0700), Atish Patra wrote:
> UEFI uses early IO or memory mappings for runtime services before
> normal ioremap() is usable. Add the necessary fixmap bindings and
> pmd mappings for generic ioremap support to work.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/Kconfig              |  1 +
>  arch/riscv/include/asm/Kbuild   |  1 +
>  arch/riscv/include/asm/fixmap.h | 13 +++++++++++++
>  arch/riscv/include/asm/io.h     |  1 +
>  arch/riscv/kernel/setup.c       |  1 +
>  arch/riscv/mm/init.c            | 33 +++++++++++++++++++++++++++++++++
>  6 files changed, 50 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 7b5905529146..15597f5f504f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -37,6 +37,7 @@ config RISCV
>  	select GENERIC_ARCH_TOPOLOGY if SMP
>  	select GENERIC_ATOMIC64 if !64BIT
>  	select GENERIC_CLOCKEVENTS
> +	select GENERIC_EARLY_IOREMAP
>  	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO
>  	select GENERIC_IOREMAP
>  	select GENERIC_IRQ_MULTI_HANDLER
> diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
> index 3d9410bb4de0..59dd7be55005 100644
> --- a/arch/riscv/include/asm/Kbuild
> +++ b/arch/riscv/include/asm/Kbuild
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +generic-y += early_ioremap.h
>  generic-y += extable.h
>  generic-y += flat.h
>  generic-y += kvm_para.h
> diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
> index 11613f38228a..54cbf07fb4e9 100644
> --- a/arch/riscv/include/asm/fixmap.h
> +++ b/arch/riscv/include/asm/fixmap.h
> @@ -27,6 +27,19 @@ enum fixed_addresses {
>  	FIX_TEXT_POKE1,
>  	FIX_TEXT_POKE0,
>  	FIX_EARLYCON_MEM_BASE,
> +
> +	__end_of_permanent_fixed_addresses,
> +	/*
> +	 * Temporary boot-time mappings, used by early_ioremap(),
> +	 * before ioremap() is functional.
> +	 */
> +#define NR_FIX_BTMAPS		(SZ_256K / PAGE_SIZE)
> +#define FIX_BTMAPS_SLOTS	7
> +#define TOTAL_FIX_BTMAPS	(NR_FIX_BTMAPS * FIX_BTMAPS_SLOTS)
> +
> +	FIX_BTMAP_END = __end_of_permanent_fixed_addresses,
> +	FIX_BTMAP_BEGIN = FIX_BTMAP_END + TOTAL_FIX_BTMAPS - 1,
> +
>  	__end_of_fixed_addresses
>  };
>
> diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
> index 3835c3295dc5..c025a746a148 100644
> --- a/arch/riscv/include/asm/io.h
> +++ b/arch/riscv/include/asm/io.h
> @@ -14,6 +14,7 @@
>  #include <linux/types.h>
>  #include <linux/pgtable.h>
>  #include <asm/mmiowb.h>
> +#include <asm/early_ioremap.h>
>
>  /*
>   * MMIO access functions are separated out to break dependency cycles
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 6a0ee2405813..c71788e6aff4 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -72,6 +72,7 @@ void __init setup_arch(char **cmdline_p)
>
>  	*cmdline_p = boot_command_line;
>
> +	early_ioremap_setup();
>  	parse_early_param();
>
>  	setup_bootmem();
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 2b651f63f5c4..b75ebe8e7a92 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -403,6 +403,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  	uintptr_t load_pa = (uintptr_t)(&_start);
>  	uintptr_t load_sz = (uintptr_t)(&_end) - load_pa;
>  	uintptr_t map_size = best_map_size(load_pa, MAX_EARLY_MAPPING_SIZE);
> +#ifndef __PAGETABLE_PMD_FOLDED
> +	pmd_t fix_bmap_spmd, fix_bmap_epmd;
> +#endif
>
>  	va_pa_offset = PAGE_OFFSET - load_pa;
>  	pfn_base = PFN_DOWN(load_pa);
> @@ -456,6 +459,36 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  			   pa + PGDIR_SIZE, PGDIR_SIZE, PAGE_KERNEL);
>  	dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PGDIR_SIZE - 1));
>  	dtb_early_pa = dtb_pa;
> +
> +	/*
> +	 * Bootime fixmap only can handle PMD_SIZE mapping. Thus, boot-ioremap
> +	 * range can not span multiple pmds.
> +	 */
> +	BUILD_BUG_ON((__fix_to_virt(FIX_BTMAP_BEGIN) >> PMD_SHIFT)
> +		     != (__fix_to_virt(FIX_BTMAP_END) >> PMD_SHIFT));
> +
> +#ifndef __PAGETABLE_PMD_FOLDED
> +	/*
> +	 * Early ioremap fixmap is already created as it lies within first 2MB
> +	 * of fixmap region. We always map PMD_SIZE. Thus, both FIX_BTMAP_END
> +	 * FIX_BTMAP_BEGIN should lie in the same pmd. Verify that and warn
> +	 * the user if not.
> +	 */
> +	fix_bmap_spmd = fixmap_pmd[pmd_index(__fix_to_virt(FIX_BTMAP_BEGIN))];
> +	fix_bmap_epmd = fixmap_pmd[pmd_index(__fix_to_virt(FIX_BTMAP_END))];
> +	if (pmd_val(fix_bmap_spmd) != pmd_val(fix_bmap_epmd)) {
> +		WARN_ON(1);
> +		pr_warn("fixmap btmap start [%08lx] != end [%08lx]\n",
> +			pmd_val(fix_bmap_spmd), pmd_val(fix_bmap_epmd));
> +		pr_warn("fix_to_virt(FIX_BTMAP_BEGIN): %08lx\n",
> +			fix_to_virt(FIX_BTMAP_BEGIN));
> +		pr_warn("fix_to_virt(FIX_BTMAP_END):   %08lx\n",
> +			fix_to_virt(FIX_BTMAP_END));
> +
> +		pr_warn("FIX_BTMAP_END:       %d\n", FIX_BTMAP_END);
> +		pr_warn("FIX_BTMAP_BEGIN:     %d\n", FIX_BTMAP_BEGIN);
> +	}
> +#endif
>  }
>
>  static void __init setup_vm_final(void)

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
