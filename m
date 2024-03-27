Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B0DC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 04:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dBu1KsUZbe3eQmmdlYEm4Ar7jXufBsKuJOkGmOmQgsU=; b=ZhROBW37JWpS/d
	Wz2AzmmrNfkBtN+9apLp+b7DPczFF0/OMRBfNvKhAekanOAbdqHGNfNcUE+fL3lbIRImfcbug7cch
	N/adlQfQksNT6FwD82nFLuhdT6+uJtWRcdy3fc+gae2WdTdjpG17Pak53rLZfvyiQVwYfaQxIZoF5
	/tBta39m55daRkInQYPGqWu4UBU+qQRRF+Z4iv87nZLqMqejGGHBe+a46+BJgobZy5TSEw4gduP7o
	mXQ1LQNv8XDKy7Irf4u7b9e1nhozN4i532q1irr15GruG2S36H1KhMi15a5Q5MP7nvftMteshICEz
	CXGXUq38PyYo/OqwE8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFi-00000007SJA-0nz6;
	Wed, 27 Mar 2024 04:51:06 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFU-00000007S6Z-3ha5
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 04:50:55 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6e6afb754fcso5566932b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 21:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711515051; x=1712119851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nL2m+hLarkGQvecSEd0KAq0QtYwqUItfZBnVAx3yeI=;
        b=ZLpALuIxe5/f+yfMJKUokUy81U52X+w89SeKSg/APeaUHqOaSggljlTWOY/R1aDoHf
         obvEqcFA2BSexxHIaPrp1sHW9tfDU0EMXEwsqRDuJ/0eQc6g+zxchGmB3GUQqKA4xO2S
         Vyfwe4IWFfRQvp1O29boOf4g3cn6A1Xynn6g0qrQZUTfOfD6QAqflSQU3+ZVBYr3RzYz
         IFGT6p3QfZRk1RAuHC/2g/530Jj5HmwyvjLiuC7H6jTPbyFNmT58WrnpSATf0T1vTAJk
         J6kGkJFzpa1btsK73X0RsDYZ5E4eUAXQxTzGbv9noUynGEyTcTffiyDY4Fvd2LRDT+TA
         Q6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711515051; x=1712119851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nL2m+hLarkGQvecSEd0KAq0QtYwqUItfZBnVAx3yeI=;
        b=ttl5Ulm9RpENV8R6aJzRcqtHhwegxNn4eM/mexKemLcf3jonaxqAiNUMyvq+c6BclU
         K3pNOLQ5EtacLqyy1I0acX/RPMAaTuSZE8w0UXLdl7yGKV2AeY8cts48QfNk+lr8lr1y
         gtvmv002/3YszJYz+yY7tACDKljR9WO+3smmx6UMJyMpIBNnMoO7IscANPhY/QuMay8j
         pCe6vKiQRK1yjq8htwYlMxi2nc6DywiUxA9Q3u4TU090hUesUjyC14E57n5pF6t/35mk
         LaejOEgSePHNsd7O/Pmohw4nIVPuob/7dkw8o/bg3QmqQj1dB7ZGcu8QPe6tc1upleUp
         VHVg==
X-Forwarded-Encrypted: i=1; AJvYcCVRWcB5s0NHQeb/ewf8bTjbzXEYCicuY8Cri4Db8xl8zjSoobweGbK31mAkOkY7J1v/fbWZPkv1fQd3ovHJaCcbM147xq7n/KuCLIMTuLSD
X-Gm-Message-State: AOJu0YxgnsGKpmOJPZONCeySjAzN0gE92a3LsTjc9W+lnOGUuHDGGnds
	uk1rg3Zz7flmCd4kySXg+7AmNWKUv8XdoTYtqH3FXHmUJnAR+uXWJlKPbSP6+X8=
X-Google-Smtp-Source: AGHT+IGyz4xXUqNq5aXCdK4lWIBgBxDZJLK6nH/Xm7w+Te1ce++GEK9gbqC/aCbf24OJ2Eh82pVCjA==
X-Received: by 2002:a05:6a00:13a2:b0:6ea:8e89:7eca with SMTP id t34-20020a056a0013a200b006ea8e897ecamr1940335pfg.32.1711515050263;
        Tue, 26 Mar 2024 21:50:50 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id e31-20020a63501f000000b005e4666261besm8351500pgb.50.2024.03.26.21.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 21:50:49 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v6 06/13] riscv: mm: Combine the SMP and UP TLB flush code
Date: Tue, 26 Mar 2024 21:49:47 -0700
Message-ID: <20240327045035.368512-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327045035.368512-1-samuel.holland@sifive.com>
References: <20240327045035.368512-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_215052_990709_92DFA4BB 
X-CRM114-Status: GOOD (  13.63  )
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

In SMP configurations, all TLB flushing narrower than flush_tlb_all()
goes through __flush_tlb_range(). Do the same in UP configurations.

This allows UP configurations to take advantage of recent improvements
to the code in tlbflush.c, such as support for huge pages and flushing
multiple-page ranges.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v4)

Changes in v4:
 - Merge the two copies of __flush_tlb_range() and rely on the compiler
   to optimize out the broadcast path (both clang and gcc do this)
 - Merge the two copies of flush_tlb_all() and rely on constant folding

Changes in v2:
 - Move the SMP/UP merge earlier in the series to avoid build issues
 - Make a copy of __flush_tlb_range() instead of adding ifdefs inside
 - local_flush_tlb_all() is the only function used on !MMU (smpboot.c)

 arch/riscv/Kconfig                |  2 +-
 arch/riscv/include/asm/tlbflush.h | 31 +++----------------------------
 arch/riscv/mm/Makefile            |  5 +----
 3 files changed, 5 insertions(+), 33 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index be09c8836d56..442532819a44 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -60,7 +60,7 @@ config RISCV
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USES_CFI_TRAPS if CFI_CLANG
-	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if SMP && MMU
+	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if MMU
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 4112cc8d1d69..4f86424b1ba5 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -27,12 +27,7 @@ static inline void local_flush_tlb_page(unsigned long addr)
 {
 	ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory"));
 }
-#else /* CONFIG_MMU */
-#define local_flush_tlb_all()			do { } while (0)
-#define local_flush_tlb_page(addr)		do { } while (0)
-#endif /* CONFIG_MMU */
 
-#if defined(CONFIG_SMP) && defined(CONFIG_MMU)
 void flush_tlb_all(void);
 void flush_tlb_mm(struct mm_struct *mm);
 void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
@@ -54,28 +49,8 @@ void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 			       unsigned long uaddr);
 void arch_flush_tlb_batched_pending(struct mm_struct *mm);
 void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
-
-#else /* CONFIG_SMP && CONFIG_MMU */
-
-#define flush_tlb_all() local_flush_tlb_all()
-#define flush_tlb_page(vma, addr) local_flush_tlb_page(addr)
-
-static inline void flush_tlb_range(struct vm_area_struct *vma,
-		unsigned long start, unsigned long end)
-{
-	local_flush_tlb_all();
-}
-
-/* Flush a range of kernel pages */
-static inline void flush_tlb_kernel_range(unsigned long start,
-	unsigned long end)
-{
-	local_flush_tlb_all();
-}
-
-#define flush_tlb_mm(mm) flush_tlb_all()
-#define flush_tlb_mm_range(mm, start, end, page_size) flush_tlb_all()
-#define local_flush_tlb_kernel_range(start, end) flush_tlb_all()
-#endif /* !CONFIG_SMP || !CONFIG_MMU */
+#else /* CONFIG_MMU */
+#define local_flush_tlb_all()			do { } while (0)
+#endif /* CONFIG_MMU */
 
 #endif /* _ASM_RISCV_TLBFLUSH_H */
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 2c869f8026a8..cbe4d775ef56 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -13,14 +13,11 @@ endif
 KCOV_INSTRUMENT_init.o := n
 
 obj-y += init.o
-obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o pgtable.o
+obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o pgtable.o tlbflush.o
 obj-y += cacheflush.o
 obj-y += context.o
 obj-y += pmem.o
 
-ifeq ($(CONFIG_MMU),y)
-obj-$(CONFIG_SMP) += tlbflush.o
-endif
 obj-$(CONFIG_HUGETLB_PAGE) += hugetlbpage.o
 obj-$(CONFIG_PTDUMP_CORE) += ptdump.o
 obj-$(CONFIG_KASAN)   += kasan_init.o
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
