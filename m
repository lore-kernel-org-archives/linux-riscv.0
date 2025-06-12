Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7D6C71149
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=or7qniVBVTiLkmrQWty9UkiMtNCFxG3VWMUOXbSRxtE=; b=netLVh23LH1SJgkNIgpNGqjjYY
	Yqajpn88EOPn2mQWhyLo+dCdgKNAOYKaHvAZzUu77JkkSIvkbpcTBJ+l+R19ewo8ZSQbLpkjSwHwC
	3AW+Wx9wEFrA3bnvLHLCRBuqRF5aHj5Knvvwo+Jg5TWbac9F9ucnFalRaD/+gQodlDTno8fh495+M
	utcKyV+zSrTEK20kvS7Qd4lcjB0v2RsRO2gb6AJuZJe9m6GynGWh0QO9DSCC+QNTyqwOWCuDnHrgo
	Kkszi5ivhU7JthQnzUehJCNOwuIyI4zRDlSc9Tict5nWa0Z3qNoBJVsUjauYyezC14007EtUBemLk
	FklUfVcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPntP-0000000ENaj-1nyM;
	Thu, 12 Jun 2025 19:47:19 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPlr2-0000000E2zw-2jir
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 17:36:45 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso1350652a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 10:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749749803; x=1750354603; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gt5YyyJeOLs2VGVgNIW5XxNcnh/B2T4VMdq9AInbPd0=;
        b=oWArcmTzi2dFw6nIrfaqH1p8ZqKMqF9I5O2DZp3LZ3ZD+1zzcbr90bVFHaX2ISRrRW
         28ofD0soav4U+y5H1AjkDBGALZJosNKic9uNKnqTUwnqN5LHraYbabKnfzcghwQmCkAO
         t/vW+3T+JOC7JV7tMET8wBFaiE4/4eVPz9ElkGAHR/nYpPgZe9QsdH745GO0CbiBtaPb
         P+n9CWSAcKlM8WjeXRT1F6nklqpXlFw/D4aDXa0exQp71yCuc93T0B2uBilsflcJ+8y8
         fAQgY96SI/FZ4WPSJ9tCLYkD1vu1r0YsSJdZIATkdZGilJkuwDpoPtSdjx108woAjefg
         bIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749749803; x=1750354603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt5YyyJeOLs2VGVgNIW5XxNcnh/B2T4VMdq9AInbPd0=;
        b=BEF6gydCRBpUqnKyR8pHc3NlENi3kkx8o1cjWdY/SafSTP+k0LSDJEDSj7Gyz2XURC
         iEi9eUrIq3d7MafDvrtzlhT9DsroFdyQtCdZaPlDzJzNF1ew9/kS/YNLCSkhQLEh6QDk
         0DfdhCD/B+A/2248g9vxETagthuX2nWx43xkfRNu4B5HX3UueSABhii34IdVWGFE46ac
         nXgMqIW0+iPwuiYW5RyxVLFHm0aVxENNzz5/xURjbipVu7+U7eQMTROyskHXjMKCSBOG
         ocbk1zhIAcLv6+TMYmfVHEufMOddpxYA2uoHBeE3NLyXk1Ttew7laV7oy/HcDbIz75gx
         Au0w==
X-Forwarded-Encrypted: i=1; AJvYcCUmxoFMKyac7HlyC1ZT2R5lUfYPX1ggx4333XCWvsk6s66/wtvOE7/r8pTXI3FSWyDCNNj/vv/M4+SeVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwylWVLToJsIz+e3SHHFpYd4TENtO9jqOOoG3cMwZ5JZEhBr1Oh
	dz64Bwn4MCARZ3xpp8UTAtakIamkWmTliIUKzsS+hDM+EIqA0BmrXts6aVezIkKY2tdy4ZLoqgY
	FR1cu
X-Gm-Gg: ASbGnctnEuX8njFn8ePUQFsSZqZouO0vsFBVk8+ugjBt5EAw3VCipML+MsnbdZN3nib
	xx7OXnRQ+TptCdn2sgSvuWF4qxk7afPyWhr1CrtPpFA2e1cHY79b2bcuAa46qa9RLCUV/8XIo5U
	cD6waOMFAV2yU3VAqR5GTf8jELB2VC6Ik+JP8ymkQFp/1ta4RnLBhDWh1UyAUb4lSb+gvIHCg+2
	iDEbhQ4/ip8SzMSwEBQGidjuaqEPTN6oP7wxVkBgURKSBfx5Qa8bmbYMlV038DL0qgVMuJf6MfV
	w0X/Ma9GagvzWvYrerGKD144tcsT5C4wiYB+8ohkNLj+Tj5WqKDqTaHKz0Hc4EFjpOMP6eEF
X-Google-Smtp-Source: AGHT+IFUg2RKRnIposbOF8fnfoBpdDR3SO+Eyx4YydJxNVc0sFUoQpaOabCcthfeabsf+6EmWv84Sw==
X-Received: by 2002:a17:90b:5845:b0:311:f05b:869a with SMTP id 98e67ed59e1d1-313d9c3292dmr85247a91.8.1749749803405;
        Thu, 12 Jun 2025 10:36:43 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19cd3cbsm1788950a91.11.2025.06.12.10.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 10:36:43 -0700 (PDT)
Date: Thu, 12 Jun 2025 10:36:41 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Ved Shanbhogue <ved@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v7 2/3] riscv: mm: Add soft-dirty page tracking
 support
Message-ID: <aEsQKeJGOlCooOUK@debug.ba.rivosinc.com>
References: <20250409095320.224100-1-zhangchunyan@iscas.ac.cn>
 <20250409095320.224100-3-zhangchunyan@iscas.ac.cn>
 <aEMkW8py61njmNLo@debug.ba.rivosinc.com>
 <CAAfSe-u3oyjW7D0f=XUVaOJsM00Mqx7-LeR-Ecxjui3sfaAMUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAfSe-u3oyjW7D0f=XUVaOJsM00Mqx7-LeR-Ecxjui3sfaAMUQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_103644_774381_375DE03B 
X-CRM114-Status: GOOD (  23.47  )
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

On Thu, Jun 12, 2025 at 02:51:57PM +0800, Chunyan Zhang wrote:
>Hi Deepak,
>
>On Sat, 7 Jun 2025 at 01:24, Deepak Gupta <debug@rivosinc.com> wrote:
>>
>> On Wed, Apr 09, 2025 at 05:53:19PM +0800, Chunyan Zhang wrote:
>> >The Svrsw60t59b extension allows to free the PTE reserved bits 60 and 59
>> >for software, this patch uses bit 59 for soft-dirty.
>> >
>> >To add swap PTE soft-dirty tracking, we borrow bit 3 which is available
>> >for swap PTEs on RISC-V systems.
>> >
>> >Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
>> >---
>> > arch/riscv/Kconfig                    |  1 +
>> > arch/riscv/include/asm/pgtable-bits.h | 19 +++++++
>> > arch/riscv/include/asm/pgtable.h      | 71 ++++++++++++++++++++++++++-
>> > 3 files changed, 89 insertions(+), 2 deletions(-)
>> >
>> >diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> >index 332fc00243ad..652e2bbfb702 100644
>> >--- a/arch/riscv/Kconfig
>> >+++ b/arch/riscv/Kconfig
>> >@@ -139,6 +139,7 @@ config RISCV
>> >       select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
>> >       select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
>> >       select HAVE_ARCH_SECCOMP_FILTER
>> >+      select HAVE_ARCH_SOFT_DIRTY if 64BIT && MMU && RISCV_ISA_SVRSW60T59B
>> >       select HAVE_ARCH_STACKLEAK
>> >       select HAVE_ARCH_THREAD_STRUCT_WHITELIST
>> >       select HAVE_ARCH_TRACEHOOK
>> >diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
>> >index a8f5205cea54..a6fa871dc19e 100644
>> >--- a/arch/riscv/include/asm/pgtable-bits.h
>> >+++ b/arch/riscv/include/asm/pgtable-bits.h
>> >@@ -20,6 +20,25 @@
>> >
>> > #define _PAGE_SPECIAL   (1 << 8)    /* RSW: 0x1 */
>> > #define _PAGE_DEVMAP    (1 << 9)    /* RSW, devmap */
>> >+
>> >+#ifdef CONFIG_MEM_SOFT_DIRTY
>> >+
>> >+/* ext_svrsw60t59b: bit 59 for software dirty tracking */
>> >+#define _PAGE_SOFT_DIRTY                                              \
>> >+      ((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?    \
>> >+       (1UL << 59) : 0)
>> >+/*
>> >+ * Bit 3 is always zero for swap entry computation, so we
>> >+ * can borrow it for swap page soft-dirty tracking.
>> >+ */
>> >+#define _PAGE_SWP_SOFT_DIRTY                                          \
>> >+      ((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?    \
>> >+       _PAGE_EXEC : 0)
>> >+#else
>> >+#define _PAGE_SOFT_DIRTY      0
>> >+#define _PAGE_SWP_SOFT_DIRTY  0
>> >+#endif /* CONFIG_MEM_SOFT_DIRTY */
>> >+
>>
>> Above can be done like this
>>
>> +
>> +#ifdef CONFIG_MEM_SOFT_DIRTY && RISCV_ISA_EXT_SVRSW60T59B
>> +
>> +/* ext_svrsw60t59b: bit 59 for software dirty tracking */
>> +#define _PAGE_SOFT_DIRTY (1UL << 59)
>> +/*
>> + * Bit 3 is always zero for swap entry computation, so we
>> + * can borrow it for swap page soft-dirty tracking.
>> + */
>> +#define _PAGE_SWP_SOFT_DIRTY _PAGE_EXEC
>> +#else
>> +#define _PAGE_SOFT_DIRTY       0
>> +#define _PAGE_SWP_SOFT_DIRTY   0
>> +#endif /* CONFIG_MEM_SOFT_DIRTY */
>>
>
>No, the feature depends not only on the compile-time configuration but
>also on the run-time environment.
>
>We need to check if the platform on which the system is running
>supports the extension SVRSW60T59B, and riscv_has_extension_unlikely()
>does that check that is a run-time check, not a build-time condition.
>

aah you are right. Ignore my comment.

>> > #define _PAGE_TABLE     _PAGE_PRESENT
>> >
>> > /*
>> >diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> >index 428e48e5f57d..14461ffe6321 100644
>> >--- a/arch/riscv/include/asm/pgtable.h
>> >+++ b/arch/riscv/include/asm/pgtable.h
>> >@@ -436,7 +436,7 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
>>
>> Shouldn't "static inline int pte_dirty(pte_t pte)" be updated as well
>
>It may not be needed, since pte_dirty() on X86 and ARM doesn't check
>_PAGE_SOFT_DIRTY either.

arch/arm64/include/asm/pgtable.h
#define pte_dirty(pte)		(pte_sw_dirty(pte) || pte_hw_dirty(pte))


`pte_sw_dirty` eventually expands to checking of b55 which is soft dirty.

But when I look at `pte_to_pagemap_entry` (`fs/proc/task_mmu.c`), I don't
see that pte to pagemap entry conversion for arm64. There is no equivalent
`pte_soft_dirty` macro defined on arm64.

Yeah may be it's not needed then.

>
>Thanks for the review,
>Chunyan
>
>
>
>
>>
>> static inline int pte_dirty(pte_t pte)
>> {
>>         return pte_val(pte) & (_PAGE_DIRTY | _PAGE_SOFT_DIRTY);
>> }
>>
>> Perhaps have a macro which includes both dirty together and then use together.
>>
>>
>> >
>> > static inline pte_t pte_mkdirty(pte_t pte)
>> > {
>> >-      return __pte(pte_val(pte) | _PAGE_DIRTY);
>> >+      return __pte(pte_val(pte) | _PAGE_DIRTY | _PAGE_SOFT_DIRTY);
>> > }
>> >
>> > static inline pte_t pte_mkclean(pte_t pte)
>> >@@ -469,6 +469,38 @@ static inline pte_t pte_mkhuge(pte_t pte)
>> >       return pte;
>> > }
>> >
>> >+#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
>> >+static inline bool pte_soft_dirty(pte_t pte)
>> >+{
>> >+      return !!(pte_val(pte) & _PAGE_SOFT_DIRTY);
>> >+}
>> >+
>> >+static inline pte_t pte_mksoft_dirty(pte_t pte)
>> >+{
>> >+      return __pte(pte_val(pte) | _PAGE_SOFT_DIRTY);
>> >+}
>> >+
>> >+static inline pte_t pte_clear_soft_dirty(pte_t pte)
>> >+{
>> >+      return __pte(pte_val(pte) & ~(_PAGE_SOFT_DIRTY));
>> >+}
>> >+
>> >+static inline bool pte_swp_soft_dirty(pte_t pte)
>> >+{
>> >+      return !!(pte_val(pte) & _PAGE_SWP_SOFT_DIRTY);
>> >+}
>> >+
>> >+static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
>> >+{
>> >+      return __pte(pte_val(pte) | _PAGE_SWP_SOFT_DIRTY);
>> >+}
>> >+
>> >+static inline pte_t pte_swp_clear_soft_dirty(pte_t pte)
>> >+{
>> >+      return __pte(pte_val(pte) & ~(_PAGE_SWP_SOFT_DIRTY));
>> >+}
>> >+#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
>> >+
>> > #ifdef CONFIG_RISCV_ISA_SVNAPOT
>> > #define pte_leaf_size(pte)    (pte_napot(pte) ?                               \
>> >                                       napot_cont_size(napot_cont_order(pte)) :\
>> >@@ -821,6 +853,40 @@ static inline pud_t pud_mkspecial(pud_t pud)
>> > }
>> > #endif
>> >
>> >+#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
>> >+static inline bool pmd_soft_dirty(pmd_t pmd)
>> >+{
>> >+      return pte_soft_dirty(pmd_pte(pmd));
>> >+}
>> >+
>> >+static inline pmd_t pmd_mksoft_dirty(pmd_t pmd)
>> >+{
>> >+      return pte_pmd(pte_mksoft_dirty(pmd_pte(pmd)));
>> >+}
>> >+
>> >+static inline pmd_t pmd_clear_soft_dirty(pmd_t pmd)
>> >+{
>> >+      return pte_pmd(pte_clear_soft_dirty(pmd_pte(pmd)));
>> >+}
>> >+
>> >+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>> >+static inline bool pmd_swp_soft_dirty(pmd_t pmd)
>> >+{
>> >+      return pte_swp_soft_dirty(pmd_pte(pmd));
>> >+}
>> >+
>> >+static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
>> >+{
>> >+      return pte_pmd(pte_swp_mksoft_dirty(pmd_pte(pmd)));
>> >+}
>> >+
>> >+static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
>> >+{
>> >+      return pte_pmd(pte_swp_clear_soft_dirty(pmd_pte(pmd)));
>> >+}
>> >+#endif /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
>> >+#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
>> >+
>> > static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
>> >                               pmd_t *pmdp, pmd_t pmd)
>> > {
>> >@@ -910,7 +976,8 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
>> >  *
>> >  * Format of swap PTE:
>> >  *    bit            0:       _PAGE_PRESENT (zero)
>> >- *    bit       1 to 3:       _PAGE_LEAF (zero)
>> >+ *    bit       1 to 2:       (zero)
>> >+ *    bit            3:       _PAGE_SWP_SOFT_DIRTY
>> >  *    bit            5:       _PAGE_PROT_NONE (zero)
>> >  *    bit            6:       exclusive marker
>> >  *    bits      7 to 11:      swap type
>> >--
>> >2.34.1
>> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
