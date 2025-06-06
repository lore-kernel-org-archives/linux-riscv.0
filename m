Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F86C61CE7
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 17:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlXBnLhP/Gv7Fu3cEQNM3TJJIIcpNARULxyDN7UiG0E=; b=tbNBMdTrxKDqM4zACZGtaG19wS
	Jmq5ZfWQmkTW/B4q4XStVukxKYoMD8YX9udUelkn75aWBWhoyZ94c+DpAitW2sPOdh+792Z2cuG7F
	LIzcQ3k8VzxyJps1Gsf5FVgZflMP4ZZkaXf1T6+bfdsMsB4oXdJbonLlqHEzYhD3eqG1d1enqYZQH
	QLSXHdrqs9At49mJUeEX+VuwqPj+V4Nrl/uyuXxlb56N7sdznV0ZFV1g++Ws8pEkCOYrIz4MuH/cW
	OjBUbnQJQw7bf2oPl39AMVOhsGQa60hP/oPuRQhl+dctD4RCUpV4YJDfoiqnNvwrO4rKjzJFc5htp
	zsZIuwzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNaoD-00000000io6-1khP;
	Fri, 06 Jun 2025 17:24:49 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNaoA-00000000ink-2Wpc
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 17:24:47 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-311c95ddfb5so1807723a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jun 2025 10:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749230686; x=1749835486; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lRmqKOZp4D3Po4Bjw8bM54XRDD+6MB8FGn9lAZKiGFc=;
        b=RopwwyMMz4r5owg5P5gU/HB1jpoK6P8T6rx9TmRa+x7uVcho0pINIKQubeZigvqsC1
         7Y7F29CcQbUxkL8dxheQp8soBnTomVompMwLtOeV50Lb7QCVfZfzJ3rH6ahcklUDw1i9
         s9ZvlEp6kAeunQi4PE07KhvoLx9QzlipDRgo2zfrjHDzveJA1VGzC7D0RoGxviR3ndCj
         PzWGBnmw5u+/ogkqDxWHtT8gY5sj6HjDdqzz5Ea4CO2d4f2giM1lGbV0p/t0jyHORHg0
         yMoEkXwd61Kelr+CIoJXEFekos699HxlxLUFdlxiTZWi5kw4hhx6hcSgW6b6lK9784Ur
         VHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749230686; x=1749835486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRmqKOZp4D3Po4Bjw8bM54XRDD+6MB8FGn9lAZKiGFc=;
        b=pC8QtK7g4OemEgXO8bRFa3E5PLzxIsuKFwFwSZv6m21luCNf249ItulzsYZgtzwHOv
         XV9m05TwpY9JY8YWEMKeht1mnlF3oZm50TvCy/dVbcg3hfhbae0rHz62m64JpKLGJ03T
         vd9wGWNZMFNy42SZXhodu8F4Hq7ZCZVmvEoHRTx9LRSGmujtllCNecOtfdBatQVRFagd
         mfopQ7JgJdORihK1LvcLddyvaN+Pnd4fcsI1ibMfZkFnaFKfhq4UDVKwuQDz/5cw/BQx
         2nxSqDMgv1Snct+n9WqJKhEjiU8TlCEO8Et6Dh83gwG5C9/8+cJ8gBY0jjUmDYLH2FFq
         qwQg==
X-Forwarded-Encrypted: i=1; AJvYcCW3Q14nRk4fH0jDCrWEaBAYw0gNpihXGt2mQ2mJCuXZzzKLlfJG403l2tqvQDrr1xUXhYalRIleIANAyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhWBVMsTdZSI5pcN74+yqmPOohXVzsBLSKqZoXEfOvYjaIepTU
	IGeLSslgtmbJdS/GRPBev9VtqPDz4RNo4X+0Hfpc3jZDrn2qwU39kmuZpG7ICcHfSuQ=
X-Gm-Gg: ASbGncuDKEGs2SWSymbRxaA+JkX8yIGlmi+E+RQEsrzI3yMgFlTHiQhTaV6+4chjc05
	jXr1mBPn6fEGSTos1wMGX71z8As8afdogNioq6nGymk6L7Ced0YeOS52Ms/6C6NBOYSOnsgpja8
	gN5tDo8kg2cKsYMARiNlMth0sq+IWEzvHWQw17gbC0HnuGkH1VIROGIPCvg+es08pM1lXlcqimu
	UBy91gpuiOYT3EuMPOT8BqAsKUNWcjk/bAekzzsEQqz9zQqjzXlujOFFmE3hJ8X5nHWcpljVyXz
	24tbBL8nzh11dltt8/waHYXJ6fUh47GAdJUWvYcHQUnXrghT3AEAHn2mDztNGQ==
X-Google-Smtp-Source: AGHT+IGIK8Erhji21niUWFPogzt6iDf0VsC6RhJImYChHCMhfsalLAttwAM/hAjBUM+rRasFiPUl/w==
X-Received: by 2002:a17:90b:2252:b0:312:25dd:1c86 with SMTP id 98e67ed59e1d1-3134730af09mr7057432a91.18.1749230685624;
        Fri, 06 Jun 2025 10:24:45 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349f17c04sm1725087a91.8.2025.06.06.10.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 10:24:45 -0700 (PDT)
Date: Fri, 6 Jun 2025 10:24:43 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Ved Shanbhogue <ved@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH RFC v7 2/3] riscv: mm: Add soft-dirty page tracking
 support
Message-ID: <aEMkW8py61njmNLo@debug.ba.rivosinc.com>
References: <20250409095320.224100-1-zhangchunyan@iscas.ac.cn>
 <20250409095320.224100-3-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409095320.224100-3-zhangchunyan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_102446_640917_5CC5BAE4 
X-CRM114-Status: GOOD (  14.16  )
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

On Wed, Apr 09, 2025 at 05:53:19PM +0800, Chunyan Zhang wrote:
>The Svrsw60t59b extension allows to free the PTE reserved bits 60 and 59
>for software, this patch uses bit 59 for soft-dirty.
>
>To add swap PTE soft-dirty tracking, we borrow bit 3 which is available
>for swap PTEs on RISC-V systems.
>
>Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
>---
> arch/riscv/Kconfig                    |  1 +
> arch/riscv/include/asm/pgtable-bits.h | 19 +++++++
> arch/riscv/include/asm/pgtable.h      | 71 ++++++++++++++++++++++++++-
> 3 files changed, 89 insertions(+), 2 deletions(-)
>
>diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>index 332fc00243ad..652e2bbfb702 100644
>--- a/arch/riscv/Kconfig
>+++ b/arch/riscv/Kconfig
>@@ -139,6 +139,7 @@ config RISCV
> 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
> 	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
> 	select HAVE_ARCH_SECCOMP_FILTER
>+	select HAVE_ARCH_SOFT_DIRTY if 64BIT && MMU && RISCV_ISA_SVRSW60T59B
> 	select HAVE_ARCH_STACKLEAK
> 	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
> 	select HAVE_ARCH_TRACEHOOK
>diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
>index a8f5205cea54..a6fa871dc19e 100644
>--- a/arch/riscv/include/asm/pgtable-bits.h
>+++ b/arch/riscv/include/asm/pgtable-bits.h
>@@ -20,6 +20,25 @@
>
> #define _PAGE_SPECIAL   (1 << 8)    /* RSW: 0x1 */
> #define _PAGE_DEVMAP    (1 << 9)    /* RSW, devmap */
>+
>+#ifdef CONFIG_MEM_SOFT_DIRTY
>+
>+/* ext_svrsw60t59b: bit 59 for software dirty tracking */
>+#define _PAGE_SOFT_DIRTY						\
>+	((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?	\
>+	 (1UL << 59) : 0)
>+/*
>+ * Bit 3 is always zero for swap entry computation, so we
>+ * can borrow it for swap page soft-dirty tracking.
>+ */
>+#define _PAGE_SWP_SOFT_DIRTY						\
>+	((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?	\
>+	 _PAGE_EXEC : 0)
>+#else
>+#define _PAGE_SOFT_DIRTY	0
>+#define _PAGE_SWP_SOFT_DIRTY	0
>+#endif /* CONFIG_MEM_SOFT_DIRTY */
>+

Above can be done like this

+
+#ifdef CONFIG_MEM_SOFT_DIRTY && RISCV_ISA_EXT_SVRSW60T59B
+
+/* ext_svrsw60t59b: bit 59 for software dirty tracking */
+#define _PAGE_SOFT_DIRTY (1UL << 59)
+/*
+ * Bit 3 is always zero for swap entry computation, so we
+ * can borrow it for swap page soft-dirty tracking.
+ */
+#define _PAGE_SWP_SOFT_DIRTY _PAGE_EXEC
+#else
+#define _PAGE_SOFT_DIRTY       0
+#define _PAGE_SWP_SOFT_DIRTY   0
+#endif /* CONFIG_MEM_SOFT_DIRTY */

> #define _PAGE_TABLE     _PAGE_PRESENT
>
> /*
>diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>index 428e48e5f57d..14461ffe6321 100644
>--- a/arch/riscv/include/asm/pgtable.h
>+++ b/arch/riscv/include/asm/pgtable.h
>@@ -436,7 +436,7 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)

Shouldn't "static inline int pte_dirty(pte_t pte)" be updated as well

static inline int pte_dirty(pte_t pte)
{
	return pte_val(pte) & (_PAGE_DIRTY | _PAGE_SOFT_DIRTY);
}

Perhaps have a macro which includes both dirty together and then use together.


>
> static inline pte_t pte_mkdirty(pte_t pte)
> {
>-	return __pte(pte_val(pte) | _PAGE_DIRTY);
>+	return __pte(pte_val(pte) | _PAGE_DIRTY | _PAGE_SOFT_DIRTY);
> }
>
> static inline pte_t pte_mkclean(pte_t pte)
>@@ -469,6 +469,38 @@ static inline pte_t pte_mkhuge(pte_t pte)
> 	return pte;
> }
>
>+#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
>+static inline bool pte_soft_dirty(pte_t pte)
>+{
>+	return !!(pte_val(pte) & _PAGE_SOFT_DIRTY);
>+}
>+
>+static inline pte_t pte_mksoft_dirty(pte_t pte)
>+{
>+	return __pte(pte_val(pte) | _PAGE_SOFT_DIRTY);
>+}
>+
>+static inline pte_t pte_clear_soft_dirty(pte_t pte)
>+{
>+	return __pte(pte_val(pte) & ~(_PAGE_SOFT_DIRTY));
>+}
>+
>+static inline bool pte_swp_soft_dirty(pte_t pte)
>+{
>+	return !!(pte_val(pte) & _PAGE_SWP_SOFT_DIRTY);
>+}
>+
>+static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
>+{
>+	return __pte(pte_val(pte) | _PAGE_SWP_SOFT_DIRTY);
>+}
>+
>+static inline pte_t pte_swp_clear_soft_dirty(pte_t pte)
>+{
>+	return __pte(pte_val(pte) & ~(_PAGE_SWP_SOFT_DIRTY));
>+}
>+#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
>+
> #ifdef CONFIG_RISCV_ISA_SVNAPOT
> #define pte_leaf_size(pte)	(pte_napot(pte) ?				\
> 					napot_cont_size(napot_cont_order(pte)) :\
>@@ -821,6 +853,40 @@ static inline pud_t pud_mkspecial(pud_t pud)
> }
> #endif
>
>+#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
>+static inline bool pmd_soft_dirty(pmd_t pmd)
>+{
>+	return pte_soft_dirty(pmd_pte(pmd));
>+}
>+
>+static inline pmd_t pmd_mksoft_dirty(pmd_t pmd)
>+{
>+	return pte_pmd(pte_mksoft_dirty(pmd_pte(pmd)));
>+}
>+
>+static inline pmd_t pmd_clear_soft_dirty(pmd_t pmd)
>+{
>+	return pte_pmd(pte_clear_soft_dirty(pmd_pte(pmd)));
>+}
>+
>+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>+static inline bool pmd_swp_soft_dirty(pmd_t pmd)
>+{
>+	return pte_swp_soft_dirty(pmd_pte(pmd));
>+}
>+
>+static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
>+{
>+	return pte_pmd(pte_swp_mksoft_dirty(pmd_pte(pmd)));
>+}
>+
>+static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
>+{
>+	return pte_pmd(pte_swp_clear_soft_dirty(pmd_pte(pmd)));
>+}
>+#endif /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
>+#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
>+
> static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
> 				pmd_t *pmdp, pmd_t pmd)
> {
>@@ -910,7 +976,8 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
>  *
>  * Format of swap PTE:
>  *	bit            0:	_PAGE_PRESENT (zero)
>- *	bit       1 to 3:       _PAGE_LEAF (zero)
>+ *	bit       1 to 2:	(zero)
>+ *	bit            3:	_PAGE_SWP_SOFT_DIRTY
>  *	bit            5:	_PAGE_PROT_NONE (zero)
>  *	bit            6:	exclusive marker
>  *	bits      7 to 11:	swap type
>-- 
>2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
