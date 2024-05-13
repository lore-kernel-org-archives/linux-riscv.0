Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C72C25B10
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 18:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jky7V8MCsAqVxPYks8u2GzM3D5kRL+4jqzlKtGLY9bI=; b=C7h546qtBVxdH7oYeTJ7Rgv/nE
	FfTRZUUm2hSbZDmBvRM5GYTi/9ju2hPLj68HekcUYA47jryy5nK91NrcFSgBDrEjLL1vNWtlLz6JO
	KZ0pATN0+xdEDSjSFuYeCdKW69QG+3JJB8V42lytGnRnLPgmQqdekf8OngmGiISkyBBD2EB2MbMGS
	mLySC78lG5gDcKupbPB43FjGZrGsZbXfS2qkNBO9snJhpJ5X4ZMP7J1X0qs9CtITDfREKYKxHJ2PH
	IJk5mNptbIS+OVOeTH25vpVhcEfAr/AbJMkjkNAE77mCO0GpJogfGFz57q8xKzEXm2F/QvHcnYYFx
	fKQK0cIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6atE-0000000Dwav-1FgL;
	Mon, 13 May 2024 18:59:12 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6atB-0000000DwZC-3lfN
	for linux-riscv@lists.infradead.org;
	Mon, 13 May 2024 18:59:11 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1e4c4fb6af3so26963265ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 May 2024 11:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715626746; x=1716231546; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DkQ7gN7nCNGAvo6j4bf0eNtvdYMb49Sp4UB0TNBH5zI=;
        b=qom0GrPncvwY+PyzDNCfRRIAm1VIUFMtYd9cDT47ObZ3q9RBmHgA8rOszoJFVrJQIC
         NP0hdJTc6UgnsHnN7QzBaVzI3BOtHtcZaKBpdJ+OW1qB3z4fTX6gQH6j8hUERTeYg7HO
         TUVFol+E3SPwkm5DJ3JJ4QPhx7w1AwXS25DbDeOJfZl43vjbqCxWADCzSVbQHCm4qyjA
         50RHqBeJHUgJdJPFXmlO2qImCDxRHDiJXfzD7Qld1fS8sNL7m4ptLfdFxyubF2CSQwF9
         TNaTHi5/PZeDAociYY9oEIauUJGlaWTlvS2Bh9TPjmTcvQ0muAVotkmJv7gGFmsWNIzM
         pXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715626746; x=1716231546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkQ7gN7nCNGAvo6j4bf0eNtvdYMb49Sp4UB0TNBH5zI=;
        b=oTATIDNoqhdxgTKQNlczPKSD4U/7s0x7ZDdY+4HFiqAp6M6+viIcQasWYXNRz3Jb0W
         F2fbkDhC38XBHEh7abWoZgfIG2vIJhJERiyMFrZcxrqIH58radli9Q2zBgl6J8gVY7rJ
         94CRaod3YKMMjArcNYRX5dIEFnf5Mlmrq2m640F/WllCQRBywKHBKH0At6/bX9YwsDQn
         b+KRHKGz1deu/6F+K3dC7CegpQJkfgsLlUYEJqqjrGFW3pU8NCjaY1ivtd0DXYnGrg4m
         IcbQx3utMxnJZvNFW9k1JSQIukBDeE2/1nEG1NNeLYMLKS9yWvmV/irrjQR9pLF1NgJm
         6bGQ==
X-Gm-Message-State: AOJu0YzW9+BW05phFXVlLfQjp37Vs66BsJnhmCbQsKOGgyIy7hHJrVic
	km0pe9+rzejV5xujea1Pnt7J0gIFAzpa9RNJTAT52J2M/gGm11mHgKT2SFiRRJ4=
X-Google-Smtp-Source: AGHT+IG20sYXzHGsKV8cr1mnWemCePdNZlDhW5Dt/UqsXAayGzUvlBnnQvW06jxjqdu/cIJjaKjgrg==
X-Received: by 2002:a17:903:234c:b0:1e8:682b:7f67 with SMTP id d9443c01a7336-1ef432a0c85mr152017945ad.29.1715626746563;
        Mon, 13 May 2024 11:59:06 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f083c35680sm648365ad.119.2024.05.13.11.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 11:59:06 -0700 (PDT)
Date: Mon, 13 May 2024 11:59:02 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com,
	morbo@google.com, justinstitt@google.com, andy.chiu@sifive.com,
	hankuan.chen@sifive.com, guoren@kernel.org, greentime.hu@sifive.com,
	samitolvanen@google.com, cleger@rivosinc.com,
	apatel@ventanamicro.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com, waylingii@gmail.com, sameo@rivosinc.com,
	alexghiti@rivosinc.com, akpm@linux-foundation.org,
	shikemeng@huaweicloud.com, rppt@kernel.org, charlie@rivosinc.com,
	xiao.w.wang@intel.com, willy@infradead.org, jszhang@kernel.org,
	leobras@redhat.com, songshuaishuai@tinylab.org, haxel@fzi.de,
	samuel.holland@sifive.com, namcaov@gmail.com, bjorn@rivosinc.com,
	cuiyunhui@bytedance.com, wangkefeng.wang@huawei.com,
	falcon@tinylab.org, viro@zeniv.linux.org.uk, bhe@redhat.com,
	chenjiahao16@huawei.com, hca@linux.ibm.com, arnd@arndb.de,
	kent.overstreet@linux.dev, boqun.feng@gmail.com, oleg@redhat.com,
	paulmck@kernel.org, broonie@kernel.org, rick.p.edgecombe@intel.com
Subject: Re: [RFC PATCH 07/12] riscv/mm: prepare shadow stack for init task
 for kernel cfi
Message-ID: <ZkJi9rYMkwbp5h7I@debug.ba.rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
 <20240409061043.3269676-8-debug@rivosinc.com>
 <e46b2d43-fe4d-4e9b-95ad-1900779b8bed@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e46b2d43-fe4d-4e9b-95ad-1900779b8bed@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_115909_952967_41DAD46A 
X-CRM114-Status: GOOD (  18.47  )
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

Thanks Alex.


On Sun, May 12, 2024 at 10:12:33PM +0200, Alexandre Ghiti wrote:
>
>On 09/04/2024 08:10, Deepak Gupta wrote:
>>Under CONFIG_SHADOW_CALL_STACK, shadow call stack goes into data section.
>>Although with CONFIG_DYNAMIC_SCS on riscv, hardware assisted shadow stack
>>are used. Hardware assisted shadow stack on riscv uses PTE.R=0, PTE.W=1 &
>>PTE.X=0 encodings. Without CONFIG_DYNAMIC_SCS, shadow stack for init is
>>placed in data section and thus regular read/write encodings are applied
>>to it. Although with with CONFIG_DYNAMIC_SCS, they need to go into
>>different section. This change places it into `.shadowstack` section.
>>As part of this change early boot code (`setup_vm`), applies appropriate
>>PTE encodings to shadow call stack for init placed in `.shadowstack`
>>section.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  arch/riscv/include/asm/pgtable.h     |  4 ++++
>>  arch/riscv/include/asm/sections.h    | 22 +++++++++++++++++++++
>>  arch/riscv/include/asm/thread_info.h | 10 ++++++++--
>>  arch/riscv/kernel/vmlinux.lds.S      | 12 ++++++++++++
>>  arch/riscv/mm/init.c                 | 29 +++++++++++++++++++++-------
>>  5 files changed, 68 insertions(+), 9 deletions(-)
>>
>>diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>>index 9f8ea0e33eb1..3409b250390d 100644
>>--- a/arch/riscv/include/asm/pgtable.h
>>+++ b/arch/riscv/include/asm/pgtable.h
>>@@ -197,6 +197,10 @@ extern struct pt_alloc_ops pt_ops __initdata;
>>  #define PAGE_KERNEL_READ_EXEC	__pgprot((_PAGE_KERNEL & ~_PAGE_WRITE) \
>>  					 | _PAGE_EXEC)
>>+#ifdef CONFIG_DYNAMIC_SCS
>>+#define PAGE_KERNEL_SHADOWSTACK __pgprot(_PAGE_KERNEL & ~(_PAGE_READ | _PAGE_EXEC))
>>+#endif
>>+
>
>
>Not sure the ifdefs are necessary here, but I'll let others jump in. 
>We have a lot of them, so we should try not to add.

I have no hard leanings either way. I was trying to make sure compile fails if shadow stack
is not enabled. But there are other places where config selection makes sure of this.
So may be not needed here.

>
>
>>  #define PAGE_TABLE		__pgprot(_PAGE_TABLE)
>>  #define _PAGE_IOREMAP	((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_IO)
>>diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
>>index a393d5035c54..4c4154d0021e 100644
>>--- a/arch/riscv/include/asm/sections.h
>>+++ b/arch/riscv/include/asm/sections.h
>>@@ -14,6 +14,10 @@ extern char __init_data_begin[], __init_data_end[];
>>  extern char __init_text_begin[], __init_text_end[];
>>  extern char __alt_start[], __alt_end[];
>>  extern char __exittext_begin[], __exittext_end[];
>>+#ifdef CONFIG_DYNAMIC_SCS
>>+extern char __init_shstk_start[], __init_shstk_end[];
>>+#endif
>>+extern char __end_srodata[];
>>  static inline bool is_va_kernel_text(uintptr_t va)
>>  {
>>@@ -31,4 +35,22 @@ static inline bool is_va_kernel_lm_alias_text(uintptr_t va)
>>  	return va >= start && va < end;
>>  }
>>+#ifdef CONFIG_DYNAMIC_SCS
>>+static inline bool is_va_init_shadow_stack_early(uintptr_t va)
>>+{
>>+	uintptr_t start = (uintptr_t)(kernel_mapping_pa_to_va(__init_shstk_start));
>>+	uintptr_t end = (uintptr_t)(kernel_mapping_pa_to_va(__init_shstk_end));
>>+
>>+	return va >= start && va < end;
>>+}
>>+
>>+static inline bool is_va_init_shadow_stack(uintptr_t va)
>>+{
>>+	uintptr_t start = (uintptr_t)(__init_shstk_start);
>>+	uintptr_t end = (uintptr_t)(__init_shstk_end);
>>+
>>+	return va >= start && va < end;
>>+}
>>+#endif
>
>
>You could have used an early flag and have only one function but 
>that's up to you.

Make sense, yeah I'll do that.

>
>
>>+
>>  #endif /* __ASM_SECTIONS_H */
>>diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
>>index 5d473343634b..7ae28d627f84 100644
>>--- a/arch/riscv/include/asm/thread_info.h
>>+++ b/arch/riscv/include/asm/thread_info.h
>>@@ -63,12 +63,18 @@ struct thread_info {
>>  };
>>  #ifdef CONFIG_SHADOW_CALL_STACK
>>+#ifdef CONFIG_DYNAMIC_SCS
>>  #define INIT_SCS							\
>>-	.scs_base	= init_shadow_call_stack,			\
>>+	.scs_base	= init_shadow_call_stack,	\
>>+	.scs_sp		= &init_shadow_call_stack[SCS_SIZE / sizeof(long)],
>>+#else
>>+#define INIT_SCS							\
>>+	.scs_base	= init_shadow_call_stack,	\
>>  	.scs_sp		= init_shadow_call_stack,
>>+#endif /* CONFIG_DYNAMIC_SCS */
>>  #else
>>  #define INIT_SCS
>>-#endif
>>+#endif /* CONFIG_SHADOW_CALL_STACK */
>>  /*
>>   * macros/functions for gaining access to the thread information structure
>>diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
>>index 002ca58dd998..cccc51f845ab 100644
>>--- a/arch/riscv/kernel/vmlinux.lds.S
>>+++ b/arch/riscv/kernel/vmlinux.lds.S
>>@@ -126,6 +126,18 @@ SECTIONS
>>  		*(.srodata*)
>>  	}
>>+	. = ALIGN(SECTION_ALIGN);
>>+	__end_srodata = .;
>>+
>>+#ifdef CONFIG_DYNAMIC_SCS
>>+	.shadowstack : AT(ADDR(.shadowstack) - LOAD_OFFSET){
>>+		__init_shstk_start = .;
>>+		KEEP(*(.shadowstack..init))
>>+		. = __init_shstk_start + PAGE_SIZE;
>>+		__init_shstk_end = .;
>>+	}
>>+#endif
>>+
>>  	. = ALIGN(SECTION_ALIGN);
>>  	_data = .;
>>diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>>index fe8e159394d8..5b6f0cfa5719 100644
>>--- a/arch/riscv/mm/init.c
>>+++ b/arch/riscv/mm/init.c
>>@@ -713,14 +713,22 @@ static __init pgprot_t pgprot_from_va(uintptr_t va)
>>  	if (IS_ENABLED(CONFIG_64BIT) && is_va_kernel_lm_alias_text(va))
>>  		return PAGE_KERNEL_READ;
>>+#ifdef CONFIG_DYNAMIC_SCS
>>+	/* If init task's shadow stack va, return write only page protections */
>>+	if (IS_ENABLED(CONFIG_64BIT) && is_va_init_shadow_stack(va)) {
>>+		pr_info("Shadow stack protections are being applied to for init\n");
>>+		return PAGE_KERNEL_SHADOWSTACK;
>>+	}
>>+#endif
>
>
>To avoid the ifdef here, I would hide it inis_va_init_shadow_stack().

Make sense too.

>
>
>>+
>>  	return PAGE_KERNEL;
>>  }
>>  void mark_rodata_ro(void)
>>  {
>>-	set_kernel_memory(__start_rodata, _data, set_memory_ro);
>>+	set_kernel_memory(__start_rodata, __end_srodata, set_memory_ro);
>>  	if (IS_ENABLED(CONFIG_64BIT))
>>-		set_kernel_memory(lm_alias(__start_rodata), lm_alias(_data),
>>+		set_kernel_memory(lm_alias(__start_rodata), lm_alias(__end_srodata),
>>  				  set_memory_ro);
>>  }
>>  #else
>>@@ -913,14 +921,21 @@ static void __init create_kernel_page_table(pgd_t *pgdir,
>>  static void __init create_kernel_page_table(pgd_t *pgdir, bool early)
>>  {
>>  	uintptr_t va, end_va;
>>+	pgprot_t prot;
>>  	end_va = kernel_map.virt_addr + kernel_map.size;
>>-	for (va = kernel_map.virt_addr; va < end_va; va += PMD_SIZE)
>>+	for (va = kernel_map.virt_addr; va < end_va; va += PMD_SIZE) {
>>+		prot = PAGE_KERNEL_EXEC;
>>+#ifdef CONFIG_DYNAMIC_SCS
>>+		if (early && is_va_init_shadow_stack_early(va))
>>+			prot = PAGE_KERNEL_SHADOWSTACK;
>>+#endif
>
>
>Ditto here to avoid the ifdef, hide it intois_va_init_shadow_stack_early().

Yes, will do.

>
>
>>  		create_pgd_mapping(pgdir, va,
>>-				   kernel_map.phys_addr + (va - kernel_map.virt_addr),
>>-				   PMD_SIZE,
>>-				   early ?
>>-					PAGE_KERNEL_EXEC : pgprot_from_va(va));
>>+					kernel_map.phys_addr + (va - kernel_map.virt_addr),
>>+					PMD_SIZE,
>>+					early ?
>
>
>The 3 lines above are not modified, so no need to indent them.

noted.

>
>
>>+					prot : pgprot_from_va(va));
>>+	}
>>  }
>>  #endif
>
>
>Apart from the nits above, you can add:
>
>Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
>Thanks,
>
>Alex
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
