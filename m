Return-Path: <SRS0=8FDR=BZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2022DC433DF
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Aug 2020 22:40:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E015A2065C
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Aug 2020 22:40:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ipfeoevB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="t/Iwf9VE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E015A2065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=NYNgH/2GTWVmyWyKZCUFb6IcMTULE+a4L/NvrlcslaY=; b=ipfeoevBeVTjL2sdC8jCPWO9X
	CkpN3EzXAF8o9sTIP5l9nDOUPOH0heSr9lvphDZ2I4sv5iBfrMTnnHXE3jqH+UAk/QlU8cy42SpPe
	/3aXeNoBv1KlUqJ+Vwl0ccn4cGMSG9kxIWD6YqDrPb6dQ0Moa4U8j/y9nAhzS4+gjkcmHjhVmuIru
	5SD6OABimJvtfhwLLQxTQH8YE81FrsKdObsVNbwX8gWZuuQJQ4sqvL3jHReT7lAJHrJxU8Mq6RXiA
	mdTVyxWK6TtaVziTujX97Urhn8RE54ETvQcijhHKkajWcNR5BaL4AyH/qkjq+mQ8WlrYXbvHhyBZs
	/34UqIXJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k74q1-0006WS-Md; Sat, 15 Aug 2020 22:39:45 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k74pz-0006V9-6b
 for linux-riscv@lists.infradead.org; Sat, 15 Aug 2020 22:39:44 +0000
Received: by mail-pl1-x642.google.com with SMTP id g15so1808791plj.6
 for <linux-riscv@lists.infradead.org>; Sat, 15 Aug 2020 15:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=WQ5OI4UCJDE+qCrOzP54nmzSKEv4r9sWpyhZFytCM3o=;
 b=t/Iwf9VEvU6m5tL6BD+5Z9xDWKQZ0bAXbfokrTshGedHqb5QkOILqKXIEBnmn9A2Ie
 HGZ9dPQ5JcHgpNRwnIl8o+e49+1yY2TnwIHdC96lXyRvFkBKo6VMVtmnomT5EriauY6Y
 +6im3cDE37fBt8odVlTm26Xjigm7NSOi0roUSWiLSCIHdnp02d1N4O9FLbGzrxMGLLV3
 0AQFh+Sogmb6I/IN3aQPc1OJ4YWNFqA/gIPH9/RssWuFDjUeT+m6cgSsRypBbo+bbk15
 YtFLBgjvEApBuQxCZQhQ5ofMlY9QHUWNPkxL7fbP7CSABAFOCfuSGvMBqwtEAkR4qkd2
 QSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=WQ5OI4UCJDE+qCrOzP54nmzSKEv4r9sWpyhZFytCM3o=;
 b=EfVNVnUYvO86fTICWjbwQThDXBSb8aIOZIuFXpcPgLLAHfIbulCRjOC7o73nBkCzhD
 JEO3UTOA8qA68elN4W5fTq4pP0lJpUoZrfeohQgothy+VUgcStTYgi4pcEu1xXcZhAxq
 niKj7pAh1HtlcuuvJCDijQl4c2BZBsa7mYJ/Qv9pqO0rRGBKwzvjIY1tmBVt2w+57V+4
 KURSapbY+2eTtPbtgDG1nTu5Jm04mda8SDGfsXWKfbfOKU+RKimTKw4K21cLTVZIqGNH
 9P/X+VU6UeyZWmHlSkXOk0df/kgQQQBFwyGdSIdcEs21uuztBbWyPfMexkq0/repKd09
 L9pQ==
X-Gm-Message-State: AOAM532wfApsXVekESxkAMnjhdiT3dQuiG22ZY1kGux2b4M/AGNcbreo
 K1T4ML6wWKkd+9PesjyLoEeXDA==
X-Google-Smtp-Source: ABdhPJyNIMVJgrggqji8XuHVSKPD4LVWLQ4smCU7xc+FXAM4pddrIpsAUMxVFqrfCnqajfwLEOLsRw==
X-Received: by 2002:a17:90a:1d0f:: with SMTP id
 c15mr7424337pjd.180.1597531179004; 
 Sat, 15 Aug 2020 15:39:39 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d127sm13047599pfc.175.2020.08.15.15.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2020 15:39:37 -0700 (PDT)
Date: Sat, 15 Aug 2020 15:39:37 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Aug 2020 17:17:01 PDT (-0700)
Subject: Re: [PATCH v5 1/9] RISC-V: Move DT mapping outof fixmap
In-Reply-To: <20200812234758.3563-2-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-163a2157-ae6c-424e-b3f1-581364f7650a@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200815_183943_293551_A3ECDA4A 
X-CRM114-Status: GOOD (  29.28  )
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

On Wed, 12 Aug 2020 16:47:50 PDT (-0700), Atish Patra wrote:
> From: Anup Patel <anup.patel@wdc.com>
>
> Currently, RISC-V reserves 1MB of fixmap memory for device tree. However,
> it maps only single PMD (2MB) space for fixmap which leaves only < 1MB space
> left for other kernel features such as early ioremap which requires fixmap
> as well. The fixmap size can be increased by another 2MB but it brings
> additional complexity and changes the virtual memory layout as well.
> If we require some additional feature requiring fixmap again, it has to be
> moved again.
>
> Technically, DT doesn't need a fixmap as the memory occupied by the DT is
> only used during boot. That's why, We map device tree in early page table
> using two consecutive PGD mappings at lower addresses (< PAGE_OFFSET).
> This frees lot of space in fixmap and also makes maximum supported
> device tree size supported as PGDIR_SIZE. Thus, init memory section can be used
> for the same purpose as well. This simplifies fixmap implementation.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/include/asm/fixmap.h  |  3 ---
>  arch/riscv/include/asm/pgtable.h |  1 +
>  arch/riscv/kernel/head.S         |  1 -
>  arch/riscv/kernel/head.h         |  2 --
>  arch/riscv/kernel/setup.c        |  9 +++++++--
>  arch/riscv/mm/init.c             | 26 ++++++++++++--------------
>  6 files changed, 20 insertions(+), 22 deletions(-)
>
> diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
> index 1ff075a8dfc7..11613f38228a 100644
> --- a/arch/riscv/include/asm/fixmap.h
> +++ b/arch/riscv/include/asm/fixmap.h
> @@ -22,9 +22,6 @@
>   */
>  enum fixed_addresses {
>  	FIX_HOLE,
> -#define FIX_FDT_SIZE	SZ_1M
> -	FIX_FDT_END,
> -	FIX_FDT = FIX_FDT_END + FIX_FDT_SIZE / PAGE_SIZE - 1,
>  	FIX_PTE,
>  	FIX_PMD,
>  	FIX_TEXT_POKE1,
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index eaea1f717010..815f8c959dd4 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -464,6 +464,7 @@ static inline void __kernel_map_pages(struct page *page, int numpages, int enabl
>  #define kern_addr_valid(addr)   (1) /* FIXME */
>
>  extern void *dtb_early_va;
> +extern uintptr_t dtb_early_pa;
>  void setup_bootmem(void);
>  void paging_init(void);
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 7822054dbd88..a2f0cb3ca0a6 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -255,7 +255,6 @@ clear_bss_done:
>  #endif
>  	/* Start the kernel */
>  	call soc_early_init
> -	call parse_dtb
>  	tail start_kernel
>
>  .Lsecondary_start:
> diff --git a/arch/riscv/kernel/head.h b/arch/riscv/kernel/head.h
> index 105fb0496b24..b48dda3d04f6 100644
> --- a/arch/riscv/kernel/head.h
> +++ b/arch/riscv/kernel/head.h
> @@ -16,6 +16,4 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa);
>  extern void *__cpu_up_stack_pointer[];
>  extern void *__cpu_up_task_pointer[];
>
> -void __init parse_dtb(void);
> -
>  #endif /* __ASM_HEAD_H */
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index f04373be54a6..6a0ee2405813 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -49,8 +49,9 @@ atomic_t hart_lottery __section(.sdata);
>  unsigned long boot_cpu_hartid;
>  static DEFINE_PER_CPU(struct cpu, cpu_devices);
>
> -void __init parse_dtb(void)
> +static void __init parse_dtb(void)
>  {
> +	/* Early scan of device tree from init memory */
>  	if (early_init_dt_scan(dtb_early_va))
>  		return;
>
> @@ -63,6 +64,7 @@ void __init parse_dtb(void)
>
>  void __init setup_arch(char **cmdline_p)
>  {
> +	parse_dtb();
>  	init_mm.start_code = (unsigned long) _stext;
>  	init_mm.end_code   = (unsigned long) _etext;
>  	init_mm.end_data   = (unsigned long) _edata;
> @@ -77,7 +79,10 @@ void __init setup_arch(char **cmdline_p)
>  #if IS_ENABLED(CONFIG_BUILTIN_DTB)
>  	unflatten_and_copy_device_tree();
>  #else
> -	unflatten_device_tree();
> +	if (early_init_dt_verify(__va(dtb_early_pa)))
> +		unflatten_device_tree();
> +	else
> +		pr_err("No DTB found in kernel mappings\n");
>  #endif
>  	clint_init_boot_cpu();
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 787c75f751a5..2b651f63f5c4 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -28,7 +28,9 @@ unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
>  EXPORT_SYMBOL(empty_zero_page);
>
>  extern char _start[];
> -void *dtb_early_va;
> +#define DTB_EARLY_BASE_VA      PGDIR_SIZE
> +void *dtb_early_va __initdata;
> +uintptr_t dtb_early_pa __initdata;
>
>  static void __init zone_sizes_init(void)
>  {
> @@ -141,8 +143,6 @@ static void __init setup_initrd(void)
>  }
>  #endif /* CONFIG_BLK_DEV_INITRD */
>
> -static phys_addr_t dtb_early_pa __initdata;
> -
>  void __init setup_bootmem(void)
>  {
>  	struct memblock_region *reg;
> @@ -399,7 +399,7 @@ static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
>
>  asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  {
> -	uintptr_t va, end_va;
> +	uintptr_t va, pa, end_va;
>  	uintptr_t load_pa = (uintptr_t)(&_start);
>  	uintptr_t load_sz = (uintptr_t)(&_end) - load_pa;
>  	uintptr_t map_size = best_map_size(load_pa, MAX_EARLY_MAPPING_SIZE);
> @@ -448,16 +448,13 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  				   load_pa + (va - PAGE_OFFSET),
>  				   map_size, PAGE_KERNEL_EXEC);
>
> -	/* Create fixed mapping for early FDT parsing */
> -	end_va = __fix_to_virt(FIX_FDT) + FIX_FDT_SIZE;
> -	for (va = __fix_to_virt(FIX_FDT); va < end_va; va += PAGE_SIZE)
> -		create_pte_mapping(fixmap_pte, va,
> -				   dtb_pa + (va - __fix_to_virt(FIX_FDT)),
> -				   PAGE_SIZE, PAGE_KERNEL);
> -
> -	/* Save pointer to DTB for early FDT parsing */
> -	dtb_early_va = (void *)fix_to_virt(FIX_FDT) + (dtb_pa & ~PAGE_MASK);
> -	/* Save physical address for memblock reservation */
> +	/* Create two consecutive PGD mappings for FDT early scan */
> +	pa = dtb_pa & ~(PGDIR_SIZE - 1);
> +	create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
> +			   pa, PGDIR_SIZE, PAGE_KERNEL);
> +	create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA + PGDIR_SIZE,
> +			   pa + PGDIR_SIZE, PGDIR_SIZE, PAGE_KERNEL);
> +	dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PGDIR_SIZE - 1));
>  	dtb_early_pa = dtb_pa;
>  }
>
> @@ -516,6 +513,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  #else
>  	dtb_early_va = (void *)dtb_pa;
>  #endif
> +	dtb_early_pa = dtb_pa;
>  }
>
>  static inline void setup_vm_final(void)

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
