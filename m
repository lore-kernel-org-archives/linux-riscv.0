Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31016EE57DF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 13:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHmDb5cGunlD6utfqeyX4EFsfqYlgeRznryju+5aXeQ=; b=Dkijax5MFy+TJL
	Wg2jLPb7PyhZNpImKq5T9kce+RnvdUeEZh+WuclKj2faj2iRvzo6FqeMU/Bc63BBnzZSkc2KtsATU
	ZVjeXlHcJh1Ui4gmau63ei4kvoAqen07x5LCI17k58lZnucitPhB8o3ZBiTVPL1KAaDFMxj6MBrxf
	isCgIreaufPMpLob26k2lc5JEeambcxlgdYr6Iz4/41+Lj6Ia9CqsX0HKZbPDgKj+pnMcuc2uwBDV
	YmSBLgaSi2U0RgvQCTZAgefe1mgUkGkk/n1qMqAmLFxrX5lEoTqVlNV//lUhPuEr159yRDF1jUI9u
	0RGqZ58gxc5bFQzqYvmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgmL-000aTf-04;
	Mon, 11 Sep 2023 13:16:37 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgmH-000aSe-25
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 13:16:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-401b0d97850so49314595e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 06:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694438192; x=1695042992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvOXQ7FYd4bs7bkUZT+Erh5aGWPCjNF5TJ6uV/v/MCg=;
        b=hYUzvlqUpeG/jdwN9S8LS80dgP9O8TbzVd34Qsj5dBzZyc0LxwD/w/auWvwbJC6sKL
         +9jHLttOk0Ifj95jcMuEf8E0/KHt8Z66oKQmcEGmXkdb87pUxpllItxX6qbFlPfkR/V4
         iwRzmrErE2LDNf79dOdkdn/5OznYvHBJvcaj+bC3jU10wtCjjpq4qdShsPgJ6iKl6SQH
         Ms1QDPoq6AZYu8RkgtLJdmc/bXBh8ogLalG7Zhl/qtDjk3UeIf+vlU8tacji1pMWk/zE
         6ZzzHohrVFkZ80u7Oe7h3XdCwTnF3gVhL7HIq2sMCYtYwtgwUqgaGc2DTlM1QuXHJKtg
         U3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694438192; x=1695042992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvOXQ7FYd4bs7bkUZT+Erh5aGWPCjNF5TJ6uV/v/MCg=;
        b=nVnJvb03A51fKdH2FlWe2JrVNGzYyiIvdjMXhS4HYmreaFjOfBt59SkxL7Y1m/jSY+
         KViLOzvx+jqlXiu/DI5hdrpvfULYEiWQ0iHONwJ3vKStcWjRu7FwMyv1wZRAkiGyWyLh
         kSRWwnlUPc3b36uqRKH6Z29gwdCzI4x3WKpbMMKprthzZuP62+y/p+WndMNZH3NXUKzZ
         CMiHHmYl4tlUk6EwdhUuxLjS5t86LFuEKiqcDs8j9o0kkebgRK3rCvGsabpFam8+ploL
         nG4gv2A8926AdO5OnM5/ft5pZj7SvhlNixFiEms2uOH8geWgKHoyNVNZT0tP0m3PHRuJ
         ggkA==
X-Gm-Message-State: AOJu0Ywe3nmxezTThS8H4ehbinYzFeMHYO/kLBEIxeToDY+LUFUSHY5r
	bVuPZvOUSLMK9UoyPJ/F6JTZLw==
X-Google-Smtp-Source: AGHT+IFRHd7EuaFwA1K1cfF+a13jKeLBoTHGF7TEiz4nS9tv95i5qHxXArflq3jWzwYQ4//q7JLqPw==
X-Received: by 2002:a05:600c:1c8f:b0:402:f55c:faee with SMTP id k15-20020a05600c1c8f00b00402f55cfaeemr7265932wms.26.1694438192211;
        Mon, 11 Sep 2023 06:16:32 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id b11-20020a5d4d8b000000b0031416362e23sm10134340wru.3.2023.09.11.06.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 06:16:31 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>,
	Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 4/4] riscv: Improve flush_tlb_kernel_range()
Date: Mon, 11 Sep 2023 15:12:24 +0200
Message-Id: <20230911131224.61924-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230911131224.61924-1-alexghiti@rivosinc.com>
References: <20230911131224.61924-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_061633_681564_8774CD79 
X-CRM114-Status: GOOD (  17.43  )
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

This function used to simply flush the whole tlb of all harts, be more
subtile and try to only flush the range.

The problem is that we can only use PAGE_SIZE as stride since we don't know
the size of the underlying mapping and then this function will be improved
only if the size of the region to flush is < threshold * PAGE_SIZE.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/tlbflush.h | 11 ++++++-----
 arch/riscv/mm/tlbflush.c          | 33 ++++++++++++++++++++++---------
 2 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 170a49c531c6..8f3418c5f172 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -40,6 +40,7 @@ void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end);
+void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
@@ -56,15 +57,15 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
 	local_flush_tlb_all();
 }
 
-#define flush_tlb_mm(mm) flush_tlb_all()
-#define flush_tlb_mm_range(mm, start, end, page_size) flush_tlb_all()
-#endif /* !CONFIG_SMP || !CONFIG_MMU */
-
 /* Flush a range of kernel pages */
 static inline void flush_tlb_kernel_range(unsigned long start,
 	unsigned long end)
 {
-	flush_tlb_all();
+	local_flush_tlb_all();
 }
 
+#define flush_tlb_mm(mm) flush_tlb_all()
+#define flush_tlb_mm_range(mm, start, end, page_size) flush_tlb_all()
+#endif /* !CONFIG_SMP || !CONFIG_MMU */
+
 #endif /* _ASM_RISCV_TLBFLUSH_H */
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 2c1136d73411..28cd8539b575 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -97,19 +97,27 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 			      unsigned long size, unsigned long stride)
 {
 	struct flush_tlb_range_data ftd;
-	struct cpumask *cmask = mm_cpumask(mm);
+	struct cpumask *cmask, full_cmask;
 	unsigned long asid = FLUSH_TLB_NO_ASID;
-	unsigned int cpuid;
 	bool broadcast;
 
-	if (cpumask_empty(cmask))
-		return;
+	if (mm) {
+		unsigned int cpuid;
+
+		cmask = mm_cpumask(mm);
+		if (cpumask_empty(cmask))
+			return;
 
-	cpuid = get_cpu();
-	/* check if the tlbflush needs to be sent to other CPUs */
-	broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
+		cpuid = get_cpu();
+		/* check if the tlbflush needs to be sent to other CPUs */
+		broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
+	} else {
+		cpumask_setall(&full_cmask);
+		cmask = &full_cmask;
+		broadcast = true;
+	}
 
-	if (static_branch_unlikely(&use_asid_allocator))
+	if (static_branch_unlikely(&use_asid_allocator) && mm)
 		asid = atomic_long_read(&mm->context.id) & asid_mask;
 
 	if (broadcast) {
@@ -128,7 +136,8 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 		local_flush_tlb_range_asid(start, size, stride, asid);
 	}
 
-	put_cpu();
+	if (mm)
+		put_cpu();
 }
 
 void flush_tlb_mm(struct mm_struct *mm)
@@ -189,6 +198,12 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 
 	__flush_tlb_range(vma->vm_mm, start, end - start, stride_size);
 }
+
+void flush_tlb_kernel_range(unsigned long start, unsigned long end)
+{
+	__flush_tlb_range(NULL, start, end - start, PAGE_SIZE);
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
