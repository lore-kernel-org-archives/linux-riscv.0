Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03A5C47082
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 17:47:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DD3261059
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 17:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DD3261059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xj1ny7LvUaVfk26QqTMi1MJZlV1lYtqA8yNjpd7NpPU=; b=o7Wa+jLodY5slD
	cbRpR5IOhpW+jUGlkMpk2BaYoYZqb70v9KnKoBPoowjoXKichwjOwOOm4oBq7Wf0B6aL5/39IUc1a
	2hdi4hKrOUhH8D2FTL8pScKHo5SJ7CGh5ByYFqQe/wl6zMEs18z0UDUGn7FSdESa3GmdNtGowr3sA
	9IJpBRvWBoy5DBjtjSiYA8Q0oBCZMIb5L4i8wfXf7oS/HiNXhnXCbC1ylc9PoE5KvUvewjzuakBAY
	HSmzxpbzTjdikp8iSQzZc4JNMemvl5gGgqaG17MFuyNzhjDxija7nMbQA9chtpcHiFHN+aiOfQ6au
	YG68hx7zf6B4LXjpavNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln333-007zhU-Br; Sat, 29 May 2021 17:46:57 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln32y-007zh8-Pf
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 17:46:55 +0000
Received: by mail-pg1-x536.google.com with SMTP id j12so5040737pgh.7
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 10:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=afDZByCgWJ+x2J9slnp86jAqkUz/QwEqRWiknA9kR0A=;
 b=I/Vun365kr0Sz88Bb70crqHr7db8T1J7NXB6jEAvh/6NEalHZ7pr+RV0otvkh1917T
 YvMoe+2BEzid/wt9cGyn+uHEdQJrbH3YlvnxTFu1BwoKbr7oKzz6fsrMrOW/863YC0xV
 D1OsQmv2z2FmglzPjUlRobzIpZ07XZ46Jzpf5UR5/16PzcZT427y5haU6xM4go1CB8JH
 4sDrGIGi06om8LavcXUsu8y1pCQEsXabopk5YnzYTBSDeceti2gIR+Ns5jvxIuPPt8QD
 YIUQmKmrfAV/FtE4mqWwiUN1Dul3i2e7Qx6tncUDn14exoeR55X/0p9+w8Aob5P4vmcH
 t0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=afDZByCgWJ+x2J9slnp86jAqkUz/QwEqRWiknA9kR0A=;
 b=Oss8ZT7yWxrqzkXDJfn+dqE6y75eOTskAyHVa06U9/xRR4yTgaHd3tzQcCbsfoutJ0
 FoYYdv1GdmyscsymUWILuqYD03wIg/yMrKvsW7320Z7NqGMHo5qEKgWVSY5OQcT0yvZ9
 QHNVlyknHpjfMBTPHyCw4sGiGWTbHKqYpPoK0kdOA6x6eUmyo/cteTfKnSXUEdJw7fF1
 S4uhnRuUx2qCHzjlr92Mseli5zxCUspVEEmKLdE2lS8puc4dPcuvdvG5NCHnLZeY3itb
 KhzKAsIv5vq/UUsJA3DBh3w68pDsxB09pBZB/S/fGB9IF7NIvoCllAFQZpUL7Mm4V4PV
 KXIA==
X-Gm-Message-State: AOAM530JREA3GCOj2MDNhbN84v7sQpCEdzvWE1UYFDM8xu9sZsZEdMqo
 e/U+bYknzKfjBWwTHVAn6/pS9g==
X-Google-Smtp-Source: ABdhPJzwJvzwobXOQ6AO+2DqIjdoERsDo4lrr6qd7YhW+e3aOTLzu1nGQtOLgIfa0Wf2FltpN9TPbA==
X-Received: by 2002:a63:2444:: with SMTP id k65mr14617502pgk.1.1622310411745; 
 Sat, 29 May 2021 10:46:51 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:973:a900:a1a6:cdbd])
 by smtp.gmail.com with ESMTPSA id l9sm7060744pja.20.2021.05.29.10.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 10:46:50 -0700 (PDT)
Date: Sat, 29 May 2021 10:46:48 -0700
From: Drew Fustini <drew@beagleboard.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: Map the kernel with correct permissions the
 first time
Message-ID: <20210529174648.GA115256@x1>
References: <20210526134110.217073-1-alex@ghiti.fr> <20210529040843.GA51164@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210529040843.GA51164@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_104652_973253_D75A805C 
X-CRM114-Status: GOOD (  35.97  )
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

On Fri, May 28, 2021 at 09:08:43PM -0700, Drew Fustini wrote:
> On Wed, May 26, 2021 at 03:41:10PM +0200, Alexandre Ghiti wrote:
> > For 64b kernels, we map all the kernel with write and execute permissions
> > and afterwards remove writability from text and executability from data.
> > 
> > For 32b kernels, the kernel mapping resides in the linear mapping, so we
> > map all the linear mapping as writable and executable and afterwards we
> > remove those properties for unused memory and kernel mapping as
> > described above.
> > 
> > Change this behavior to directly map the kernel with correct permissions
> > and avoid going through the whole mapping to fix the permissions.
> > 
> > At the same time, this fixes an issue introduced by commit 2bfc6cd81bd1
> > ("riscv: Move kernel mapping outside of linear mapping") as reported
> > here https://github.com/starfive-tech/linux/issues/17.
> > 
> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> > ---
> > 
> > Changes in v2:
> > * Rebased on top of for-next (and "riscv: mm: fix build errors caused by
> >   mk_pmd()")
> > * Get rid of protect_kernel_linear_mapping_text_rodata as suggested by
> >   Jisheng
> > * Improve code in general compared to previous RFC
> > 
> > Tested on:
> > 
> > * kernel
> > - rv32: OK
> > - rv64: OK
> > 
> > * kernel w/o CONFIG_STRICT_KERNEL_RWX:
> > - rv32: OK
> > - rv64: OK
> > 
> > * xipkernel:
> > - rv32: build only
> > - rv64: OK
> > 
> > * nommukernel:
> > - rv64: build only
> > 
> >  arch/riscv/include/asm/page.h       |   9 +-
> >  arch/riscv/include/asm/sections.h   |  16 ++++
> >  arch/riscv/include/asm/set_memory.h |   8 --
> >  arch/riscv/kernel/setup.c           |   5 --
> >  arch/riscv/mm/init.c                | 123 +++++++++++++++-------------
> >  5 files changed, 89 insertions(+), 72 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> > index 6e004d8fda4d..7ff5e0d81e41 100644
> > --- a/arch/riscv/include/asm/page.h
> > +++ b/arch/riscv/include/asm/page.h
> > @@ -95,6 +95,7 @@ extern unsigned long va_kernel_pa_offset;
> >  #endif
> >  extern unsigned long va_kernel_xip_pa_offset;
> >  extern unsigned long pfn_base;
> > +extern uintptr_t load_sz;
> >  #define ARCH_PFN_OFFSET		(pfn_base)
> >  #else
> >  #define va_pa_offset		0
> > @@ -108,6 +109,9 @@ extern unsigned long pfn_base;
> >  extern unsigned long kernel_virt_addr;
> >  
> >  #ifdef CONFIG_64BIT
> > +#define is_kernel_mapping(x)	((x) >= kernel_virt_addr && (x) < (kernel_virt_addr + load_sz))
> > +#define is_linear_mapping(x)	((x) >= PAGE_OFFSET && (x) < kernel_virt_addr)
> > +
> >  #define linear_mapping_pa_to_va(x)	((void *)((unsigned long)(x) + va_pa_offset))
> >  #define kernel_mapping_pa_to_va(y)	({						\
> >  	unsigned long _y = y;								\
> > @@ -127,10 +131,13 @@ extern unsigned long kernel_virt_addr;
> >  
> >  #define __va_to_pa_nodebug(x)	({						\
> >  	unsigned long _x = x;							\
> > -	(_x < kernel_virt_addr) ?						\
> > +	is_linear_mapping(_x) ?							\
> >  		linear_mapping_va_to_pa(_x) : kernel_mapping_va_to_pa(_x);	\
> >  	})
> >  #else
> > +#define is_kernel_mapping(x)	((x) >= kernel_virt_addr && (x) < (kernel_virt_addr + load_sz))
> > +#define is_linear_mapping(x)	((x) >= PAGE_OFFSET)
> > +
> >  #define __pa_to_va_nodebug(x)  ((void *)((unsigned long) (x) + va_pa_offset))
> >  #define __va_to_pa_nodebug(x)  ((unsigned long)(x) - va_pa_offset)
> >  #endif /* CONFIG_64BIT */
> > diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
> > index 8a303fb1ee3b..6b5affecca83 100644
> > --- a/arch/riscv/include/asm/sections.h
> > +++ b/arch/riscv/include/asm/sections.h
> > @@ -6,6 +6,7 @@
> >  #define __ASM_SECTIONS_H
> >  
> >  #include <asm-generic/sections.h>
> > +#include <linux/mm.h>
> >  
> >  extern char _start[];
> >  extern char _start_kernel[];
> > @@ -13,4 +14,19 @@ extern char __init_data_begin[], __init_data_end[];
> >  extern char __init_text_begin[], __init_text_end[];
> >  extern char __alt_start[], __alt_end[];
> >  
> > +static inline bool is_va_kernel_text(uintptr_t va)
> > +{
> > +	return (va >= (uintptr_t)_start && va < (uintptr_t)__init_text_begin);
> > +}
> > +
> > +static inline bool is_va_kernel_lm_alias_text(uintptr_t va)
> > +{
> > +	return (va >= (uintptr_t)lm_alias(_start) && va < (uintptr_t)lm_alias(__init_text_begin));
> > +}
> > +
> > +static inline bool is_va_kernel_init_text(uintptr_t va)
> > +{
> > +	return (va >= (uintptr_t)__init_text_begin && va < (uintptr_t)__init_data_begin);
> > +}
> > +
> >  #endif /* __ASM_SECTIONS_H */
> > diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> > index 086f757e8ba3..ebb8516ec5bc 100644
> > --- a/arch/riscv/include/asm/set_memory.h
> > +++ b/arch/riscv/include/asm/set_memory.h
> > @@ -16,22 +16,14 @@ int set_memory_rw(unsigned long addr, int numpages);
> >  int set_memory_x(unsigned long addr, int numpages);
> >  int set_memory_nx(unsigned long addr, int numpages);
> >  int set_memory_rw_nx(unsigned long addr, int numpages);
> > -void protect_kernel_text_data(void);
> >  #else
> >  static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
> >  static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
> >  static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
> >  static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
> > -static inline void protect_kernel_text_data(void) {}
> >  static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
> >  #endif
> >  
> > -#if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
> > -void protect_kernel_linear_mapping_text_rodata(void);
> > -#else
> > -static inline void protect_kernel_linear_mapping_text_rodata(void) {}
> > -#endif
> > -
> >  int set_direct_map_invalid_noflush(struct page *page);
> >  int set_direct_map_default_noflush(struct page *page);
> >  bool kernel_page_present(struct page *page);
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index 4db4d0b5911f..96f483e7c279 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -290,11 +290,6 @@ void __init setup_arch(char **cmdline_p)
> >  	init_resources();
> >  	sbi_init();
> >  
> > -	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
> > -		protect_kernel_text_data();
> > -		protect_kernel_linear_mapping_text_rodata();
> > -	}
> > -
> >  #ifdef CONFIG_SWIOTLB
> >  	swiotlb_init(1);
> >  #endif
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 2d80088f33d5..4b1bcbbd50aa 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -425,6 +425,63 @@ asmlinkage void __init __copy_data(void)
> >  }
> >  #endif
> >  
> > +#ifdef CONFIG_STRICT_KERNEL_RWX
> > +static __init pgprot_t pgprot_from_va(uintptr_t va)
> > +{
> > +#ifdef CONFIG_64BIT
> > +	if (is_va_kernel_text(va) || is_va_kernel_init_text(va))
> > +		return PAGE_KERNEL_READ_EXEC;
> > +
> > +	/*
> > +	 * We must mark only text as read-only as init text will get freed later
> > +	 * and rodata section is marked readonly in mark_rodata_ro.
> > +	 */
> > +	if (is_va_kernel_lm_alias_text(va))
> > +		return PAGE_KERNEL_READ;
> > +
> > +	return PAGE_KERNEL;
> > +#else
> > +	if (is_va_kernel_text(va))
> > +		return PAGE_KERNEL_READ_EXEC;
> > +
> > +	if (is_va_kernel_init_text(va))
> > +		return PAGE_KERNEL_EXEC;
> > +
> > +	return PAGE_KERNEL;
> > +#endif /* CONFIG_64BIT */
> > +}
> > +
> > +void mark_rodata_ro(void)
> > +{
> > +	unsigned long rodata_start = (unsigned long)__start_rodata;
> > +	unsigned long data_start = (unsigned long)_data;
> > +	unsigned long __maybe_unused lm_rodata_start = (unsigned long)lm_alias(__start_rodata);
> > +	unsigned long __maybe_unused lm_data_start = (unsigned long)lm_alias(_data);
> > +
> > +	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
> > +#ifdef CONFIG_64BIT
> > +	set_memory_ro(lm_rodata_start, (lm_data_start - lm_rodata_start) >> PAGE_SHIFT);
> > +#endif
> > +
> > +	debug_checkwx();
> > +}
> > +#else /* CONFIG_STRICT_KERNEL_RWX */
> > +static __init pgprot_t pgprot_from_va(uintptr_t va)
> > +{
> > +#ifdef CONFIG_64BIT
> > +	if (is_kernel_mapping(va))
> > +		return PAGE_KERNEL_EXEC;
> > +
> > +	if (is_linear_mapping(va))
> > +		return PAGE_KERNEL;
> > +
> > +	return PAGE_KERNEL;
> > +#else
> > +	return PAGE_KERNEL_EXEC;
> > +#endif /* CONFIG_64BIT */
> > +}
> > +#endif /* CONFIG_STRICT_KERNEL_RWX */
> > +
> >  /*
> >   * setup_vm() is called from head.S with MMU-off.
> >   *
> > @@ -454,7 +511,8 @@ uintptr_t xiprom, xiprom_sz;
> >  #define xiprom_sz      (*((uintptr_t *)XIP_FIXUP(&xiprom_sz)))
> >  #define xiprom         (*((uintptr_t *)XIP_FIXUP(&xiprom)))
> >  
> > -static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
> > +static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size,
> > +					    __always_unused bool early)
> >  {
> >  	uintptr_t va, end_va;
> >  
> > @@ -473,7 +531,7 @@ static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
> >  				   map_size, PAGE_KERNEL);
> >  }
> >  #else
> > -static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
> > +static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size, bool early)
> >  {
> >  	uintptr_t va, end_va;
> >  
> > @@ -481,7 +539,7 @@ static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
> >  	for (va = kernel_virt_addr; va < end_va; va += map_size)
> >  		create_pgd_mapping(pgdir, va,
> >  				   load_pa + (va - kernel_virt_addr),
> > -				   map_size, PAGE_KERNEL_EXEC);
> > +				   map_size, early ? PAGE_KERNEL_EXEC : pgprot_from_va(va));
> >  }
> >  #endif
> >  
> > @@ -558,7 +616,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> >  	 * us to reach paging_init(). We map all memory banks later
> >  	 * in setup_vm_final() below.
> >  	 */
> > -	create_kernel_page_table(early_pg_dir, map_size);
> > +	create_kernel_page_table(early_pg_dir, map_size, true);
> >  
> >  #ifndef __PAGETABLE_PMD_FOLDED
> >  	/* Setup early PMD for DTB */
> > @@ -634,22 +692,6 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> >  #endif
> >  }
> >  
> > -#if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
> > -void protect_kernel_linear_mapping_text_rodata(void)
> > -{
> > -	unsigned long text_start = (unsigned long)lm_alias(_start);
> > -	unsigned long init_text_start = (unsigned long)lm_alias(__init_text_begin);
> > -	unsigned long rodata_start = (unsigned long)lm_alias(__start_rodata);
> > -	unsigned long data_start = (unsigned long)lm_alias(_data);
> > -
> > -	set_memory_ro(text_start, (init_text_start - text_start) >> PAGE_SHIFT);
> > -	set_memory_nx(text_start, (init_text_start - text_start) >> PAGE_SHIFT);
> > -
> > -	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
> > -	set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
> > -}
> > -#endif
> > -
> >  static void __init setup_vm_final(void)
> >  {
> >  	uintptr_t va, map_size;
> > @@ -682,21 +724,15 @@ static void __init setup_vm_final(void)
> >  		map_size = best_map_size(start, end - start);
> >  		for (pa = start; pa < end; pa += map_size) {
> >  			va = (uintptr_t)__va(pa);
> > -			create_pgd_mapping(swapper_pg_dir, va, pa,
> > -					   map_size,
> > -#ifdef CONFIG_64BIT
> > -					   PAGE_KERNEL
> > -#else
> > -					   PAGE_KERNEL_EXEC
> > -#endif
> > -					);
> >  
> > +			create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
> > +					   pgprot_from_va(va));
> >  		}
> >  	}
> >  
> >  #ifdef CONFIG_64BIT
> >  	/* Map the kernel */
> > -	create_kernel_page_table(swapper_pg_dir, PMD_SIZE);
> > +	create_kernel_page_table(swapper_pg_dir, PMD_SIZE, false);
> >  #endif
> >  
> >  	/* Clear fixmap PTE and PMD mappings */
> > @@ -727,35 +763,6 @@ static inline void setup_vm_final(void)
> >  }
> >  #endif /* CONFIG_MMU */
> >  
> > -#ifdef CONFIG_STRICT_KERNEL_RWX
> > -void __init protect_kernel_text_data(void)
> > -{
> > -	unsigned long text_start = (unsigned long)_start;
> > -	unsigned long init_text_start = (unsigned long)__init_text_begin;
> > -	unsigned long init_data_start = (unsigned long)__init_data_begin;
> > -	unsigned long rodata_start = (unsigned long)__start_rodata;
> > -	unsigned long data_start = (unsigned long)_data;
> > -	unsigned long max_low = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
> > -
> > -	set_memory_ro(text_start, (init_text_start - text_start) >> PAGE_SHIFT);
> > -	set_memory_ro(init_text_start, (init_data_start - init_text_start) >> PAGE_SHIFT);
> > -	set_memory_nx(init_data_start, (rodata_start - init_data_start) >> PAGE_SHIFT);
> > -	/* rodata section is marked readonly in mark_rodata_ro */
> > -	set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
> > -	set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
> > -}
> > -
> > -void mark_rodata_ro(void)
> > -{
> > -	unsigned long rodata_start = (unsigned long)__start_rodata;
> > -	unsigned long data_start = (unsigned long)_data;
> > -
> > -	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
> > -
> > -	debug_checkwx();
> > -}
> > -#endif
> > -
> >  #ifdef CONFIG_KEXEC_CORE
> >  /*
> >   * reserve_crashkernel() - reserves memory for crash kernel
> > -- 
> > 2.30.2
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> I wanted to try testing this on the BeagleV Starlight but I could not
> apply it cleanly against 5.13-rc3:
> 
>   $ git am /tmp/patch.am
>   Applying: riscv: Map the kernel with correct permissions the first time
>   error: patch failed: arch/riscv/include/asm/page.h:95
>   error: arch/riscv/include/asm/page.h: patch does not apply
>   Patch failed at 0001 riscv: Map the kernel with correct permissions the first time
>   hint: Use 'git am --show-current-patch=diff' to see the failed patch
>   When you have resolved this problem, run "git am --continue".
>   If you prefer to skip this patch, run "git am --skip" instead.
>   To restore the original branch and stop patching, run "git am --abort".
> 
> Is there another branch I should be looking at?
> 
> thanks,
> drew

I realized I should have using riscv/for-next but I still seem to
encounter problem applying:

  $ git checkout -b riscv_for_next riscv/for-next
  Branch 'riscv_for_next' set up to track remote branch 'for-next' from 'riscv'.
  Switched to a new branch 'riscv_for_next'
  pdp7@x1:~/dev/starfive/linux$ git status
  On branch riscv_for_next
  Your branch is up to date with 'riscv/for-next'.
  
  nothing to commit, working tree clean

  $ git log -1 --oneline
  37a7a2a10ec5 (HEAD -> riscv_for_next, riscv/for-next) riscv: Turn has_fpu into a static key if FPU=y

  $ b4 am 20210526134110.217073-1-alex@ghiti.fr
  Looking up https://lore.kernel.org/r/20210526134110.217073-1-alex%40ghiti.fr
  Grabbing thread from lore.kernel.org/linux-riscv
  Analyzing 4 messages in the thread
  ---
  Writing ./v2_20210526_alex_riscv_map_the_kernel_with_correct_permissions_the_first_time.mbx
    [PATCH v2] riscv: Map the kernel with correct permissions the first time
    ---
  Total patches: 1
  ---
   Link: https://lore.kernel.org/r/20210526134110.217073-1-alex@ghiti.fr
   Base: not found
         git am ./v2_20210526_alex_riscv_map_the_kernel_with_correct_permissions_the_first_time.mbx

  $ git am v2_20210526_alex_riscv_map_the_kernel_with_correct_permissions_the_first_time.mbx
  Applying: riscv: Map the kernel with correct permissions the first time
  error: patch failed: arch/riscv/include/asm/page.h:95
  error: arch/riscv/include/asm/page.h: patch does not apply
  Patch failed at 0001 riscv: Map the kernel with correct permissions the first time
  hint: Use 'git am --show-current-patch=diff' to see the failed patch
  When you have resolved this problem, run "git am --continue".
  If you prefer to skip this patch, run "git am --skip" instead.
  To restore the original branch and stop patching, run "git am --abort".

Am I doing something wrong?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
