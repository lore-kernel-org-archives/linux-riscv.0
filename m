Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FD9C61D98
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 01:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6cV1L383SFCkQk53le6a3x0uI3kmtC+kOSUi5kGbDw=; b=iP4TccCRdt4e9C
	THkxQmvHi+kNn4oh4+OtszIVR8GZCB4EY9A+J73s1nDt1CrPZofdU/58kdbfsTaJGcjIp51k9Sooa
	wGYA2EPfWHCXpSXwXLf4w1IgtKAFKR755iJOLSDwnjcHddrbbsE6rAd7nqClgRpvT6SBg55U8RVa9
	pQq8YGh2cNFh/zhe68S0YZA5UqMMxO1cBnAKv6aKNr2KVdQU7avvMEjXvBGf7KN0iZ5QLJXiSN3KB
	L7UdaXvLF3VFLOTt5X8cQlhCi+l2hjHjB76EI95qZ5OAV/xCisHWjp2o14XSg82myy6xXHDVNxvcd
	jujz/CcEUxJctfx2O+Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bj5-000N98-0L;
	Wed, 22 Nov 2023 01:08:23 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bj1-000N7R-2b
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 01:08:21 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6cbc8199a2aso601571b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 17:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700615298; x=1701220098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6X+mOMZoGJuf/KhFjronMx0sFEsDU8bO3mA0YdbfIg=;
        b=F+DpzMPnYsEmkjvgJRwfREzR7hNOm5jG2qqw91KphWTdl55n35xGt2QPnQS26di+d2
         YCOF87Rl1HvxeTlEjnUfmv+6ekrTZyjrnzYDqRYxUcouQBOJISEIkDuAZhPwF8tp3YLh
         HbBg+i5lzWvi+Wf2NbJlclnqiG+dhkKbtzlXUHsDxxdni1fHHAYOUrqV7jW6ekzo2aFs
         GwwUKbAzvqqPLiqwP4HEcaGgTF+Bb6StZvxqtxBeOc99FX6anuKEPrBXGcuz/cAAUzcq
         Nb3RkKqDZrS8NPkCoPGPMDexqYhuxa4M9fLFgqMMauj/7JR0kMpFpZL7vl9/LB7C6VGZ
         ZRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700615298; x=1701220098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6X+mOMZoGJuf/KhFjronMx0sFEsDU8bO3mA0YdbfIg=;
        b=mXCqnx+P1Y2/xZrmLS4lyEfGkXVJNE+ZSxRy7gjIJraP8Um4N2wADXbOf/YeP3dNLn
         PiiuZVi9MnaFTr0+v9igrphMQVRJ4SXIWtDV5NL/jQ+xq4s8TFSO5fioRCYaQLQPu2xw
         b2uprAP9voV/XoqqlQtHAl/C5UWsivv/nAs06G95rFr89dnvPL9SvptFT6hd8rox5u9D
         jnqe7rYWr2OFwneTq6pqJ3ReMHKPfO9StG6j6uoPdfwcT2nEdHuOUIElsgFkuUTk217D
         TpJV/cYlW83mB5R3QUq7NqcNdOGP9/y3JZ6eSTWR8qQ8/IXkL7WKJ7yiK/rgIYIPgGHx
         djTw==
X-Gm-Message-State: AOJu0Yy3XmxAApFnav8rQmy0oxPc44G3vxEv5NAhIl63mQXSemW8a0/8
	VxQtWZ4yCTIm0e2/1bqHUvp/Xw==
X-Google-Smtp-Source: AGHT+IF0MPSUCqiTsnl1eQc+NOEkZdfylg4Cinzvui2qig7vBCcLaky4/GlXwa1fL7VF+JjfOGRcVA==
X-Received: by 2002:a05:6a20:431a:b0:18a:da5a:3825 with SMTP id h26-20020a056a20431a00b0018ada5a3825mr948843pzk.34.1700615298368;
        Tue, 21 Nov 2023 17:08:18 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bn5-20020a056a00324500b006be047268d5sm8713961pfb.174.2023.11.21.17.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 17:08:18 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 1/8] riscv: mm: Combine the SMP and UP TLB flush code
Date: Tue, 21 Nov 2023 17:07:12 -0800
Message-ID: <20231122010815.3545294-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122010815.3545294-1-samuel.holland@sifive.com>
References: <20231122010815.3545294-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_170819_846084_0648494A 
X-CRM114-Status: GOOD (  13.53  )
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

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - Move the SMP/UP merge earlier in the series to avoid build issues
 - Make a copy of __flush_tlb_range() instead of adding ifdefs inside
 - local_flush_tlb_all() is the only function used on !MMU (smpboot.c)

 arch/riscv/include/asm/tlbflush.h | 33 +++++++------------------------
 arch/riscv/mm/Makefile            |  5 +----
 arch/riscv/mm/tlbflush.c          | 13 ++++++++++++
 3 files changed, 21 insertions(+), 30 deletions(-)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 8f3418c5f172..317a1811aa51 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -27,13 +27,12 @@ static inline void local_flush_tlb_page(unsigned long addr)
 {
 	ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory"));
 }
-#else /* CONFIG_MMU */
-#define local_flush_tlb_all()			do { } while (0)
-#define local_flush_tlb_page(addr)		do { } while (0)
-#endif /* CONFIG_MMU */
 
-#if defined(CONFIG_SMP) && defined(CONFIG_MMU)
+#ifdef CONFIG_SMP
 void flush_tlb_all(void);
+#else
+#define flush_tlb_all() local_flush_tlb_all()
+#endif
 void flush_tlb_mm(struct mm_struct *mm);
 void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
 			unsigned long end, unsigned int page_size);
@@ -46,26 +45,8 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end);
 #endif
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
-#endif /* !CONFIG_SMP || !CONFIG_MMU */
+#else /* CONFIG_MMU */
+#define local_flush_tlb_all()			do { } while (0)
+#endif /* CONFIG_MMU */
 
 #endif /* _ASM_RISCV_TLBFLUSH_H */
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 3a4dfc8babcf..96e65c571ce8 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -13,15 +13,12 @@ endif
 KCOV_INSTRUMENT_init.o := n
 
 obj-y += init.o
-obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o
+obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o tlbflush.o
 obj-y += cacheflush.o
 obj-y += context.o
 obj-y += pgtable.o
 obj-y += pmem.o
 
-ifeq ($(CONFIG_MMU),y)
-obj-$(CONFIG_SMP) += tlbflush.o
-endif
 obj-$(CONFIG_HUGETLB_PAGE) += hugetlbpage.o
 obj-$(CONFIG_PTDUMP_CORE) += ptdump.o
 obj-$(CONFIG_KASAN)   += kasan_init.o
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index e6659d7368b3..22d7ed5abf8e 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -66,6 +66,7 @@ static inline void local_flush_tlb_range_asid(unsigned long start,
 		local_flush_tlb_range_threshold_asid(start, size, stride, asid);
 }
 
+#ifdef CONFIG_SMP
 static void __ipi_flush_tlb_all(void *info)
 {
 	local_flush_tlb_all();
@@ -138,6 +139,18 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 	if (mm)
 		put_cpu();
 }
+#else
+static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
+			      unsigned long size, unsigned long stride)
+{
+	unsigned long asid = FLUSH_TLB_NO_ASID;
+
+	if (mm && static_branch_unlikely(&use_asid_allocator))
+		asid = atomic_long_read(&mm->context.id) & asid_mask;
+
+	local_flush_tlb_range_asid(start, size, stride, asid);
+}
+#endif
 
 void flush_tlb_mm(struct mm_struct *mm)
 {
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
