Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758B1C001DB
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 23:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=plDiYhilybIB3i0SmyMCHW6uc3uIlMYAfeg8QEzFg2k=; b=gqPl9Vm/ACVx0k
	g+MV5w/QxXRE0xzj/m9RR+DUW0RlfCC/Fg8M+A56lFUqE9gC8gpiqWK72efvGf4B570cfgs50qNnH
	XREPyMZmM7qFIIKq1cS2xh15KBYyuWkT3A/WxwiJK5xbAXMtGBxkfiuelJ+j6p1NPjqod+HI1+9Ds
	o4eYMUFovvG4NYjzc09VTzlDz/Rb/CPaLhE7guVdYOHRKmrwocX6O7yUrbzL7kip4HEjxG2Tg4HCO
	82yCTIgWDZacup+cLxL0D71T4nyxNig2KDnQmR7uRZSuGUfHAfzdBuV24408TK29n0Rt6d9gax8tW
	j+scr5pY5Ciz7xs5GqcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsVB-000vYe-1m;
	Sat, 28 Oct 2023 23:13:57 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsV3-000vSy-03
	for linux-riscv@lists.infradead.org;
	Sat, 28 Oct 2023 23:13:50 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-581edcde26cso2063469eaf.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Oct 2023 16:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698534827; x=1699139627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56YUmquglDtdI2AgsFp8Dfqen0eRNcOUaE781b7rud8=;
        b=hWbAgnUioEl2nWEFFhlShO/jIRbFOvoL3x5uxCwXGiDR+p/5RvT7TKTEpMDRGTSPzb
         EkP4AxhcDU7GTX7XUT99gBmDCkDeq8voqg5lx7oHw1mg9V/iHLG1ODu4AEDcNSJSGJD6
         5aDCbkFRjQHl6Gtniw3zECuK0RYK9mIlHtCIXb51aypWnsfUzGH+VXPS2Koh3eR2m4q8
         EV9iWowye0w9nf6fjJ0enph+mnGA14W/NVMJK2NlGXbkNvKUY8RLqwvHCGtkX9+dhuK3
         Yh85Cw5RCzK1gOgjy2MV8k5iyywzeDNTvVO5utNo8YXj2k6rRfAxZ6Zy4LV9BjIXLTGg
         G7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698534827; x=1699139627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56YUmquglDtdI2AgsFp8Dfqen0eRNcOUaE781b7rud8=;
        b=KuK1MNl/1ZUgVeO1jUqLxVuKlKZxcMb/MzMhKn/N2+LCEcR40vNKBZzt7kOPIF9GQ0
         fOpt9Ecq1mrHjxnJAq9wnAhfYv6VT6ItksayGTnOZlvCb73rA+pK6JvKLI6QuZbUgk+v
         ns5MA6017JWHt9xensg51qmF9MDvAEciz6wPjzQCr62rX7YWBaCJ6y7EErWjWonyJAbX
         KNRfMqMgGdaBfSj1OGUgbX+HlSszqy6GuKHm0RwF9kTKxxzWwL+nWdl9VT5N72tslovM
         hGULlecpEo43HcC/KsNjOWRk8SK00AicnQnkaAH3nFmPTAx7822Z5gJ9yzwrqRw362aA
         LGTg==
X-Gm-Message-State: AOJu0YyjZGOKvfz5bTwMilS4xbwXbqL0piOK5V+W3ebeezc8XpoaJ4K+
	AvY48DPfX5QZ0blsrDnBa5Mbzw==
X-Google-Smtp-Source: AGHT+IGq5Mcxzf3tN07mJTIgv1Wxotaz2Uaine2ZZiRfV+MdLhpoDUKwMV8rRW6x4wnAP4zHnD4SGA==
X-Received: by 2002:a05:6358:903:b0:168:dc03:5b90 with SMTP id r3-20020a056358090300b00168dc035b90mr9086199rwi.23.1698534827455;
        Sat, 28 Oct 2023 16:13:47 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001b8622c1ad2sm3679345ple.130.2023.10.28.16.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 16:13:46 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Andrew Jones <ajones@ventanamicro.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 04/11] riscv: Improve flush_tlb_kernel_range()
Date: Sat, 28 Oct 2023 16:12:02 -0700
Message-ID: <20231028231339.3116618-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231028231339.3116618-1-samuel.holland@sifive.com>
References: <20231028231339.3116618-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_161349_055965_CDDAD197 
X-CRM114-Status: GOOD (  17.12  )
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

From: Alexandre Ghiti <alexghiti@rivosinc.com>

This function used to simply flush the whole tlb of all harts, be more
subtile and try to only flush the range.

The problem is that we can only use PAGE_SIZE as stride since we don't know
the size of the underlying mapping and then this function will be improved
only if the size of the region to flush is < threshold * PAGE_SIZE.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # On RZ/Five SMARC
[Samuel: Use cpu_online_mask and merge if statements]
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Rebase on Alexandre's "riscv: tlb flush improvements" series v5

 arch/riscv/include/asm/tlbflush.h | 11 +++++-----
 arch/riscv/mm/tlbflush.c          | 34 ++++++++++++++++++++++---------
 2 files changed, 30 insertions(+), 15 deletions(-)

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
index e46fefc70927..e6659d7368b3 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -97,20 +97,27 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 			      unsigned long size, unsigned long stride)
 {
 	struct flush_tlb_range_data ftd;
-	struct cpumask *cmask = mm_cpumask(mm);
+	const struct cpumask *cmask;
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
 
-	if (static_branch_unlikely(&use_asid_allocator))
-		asid = atomic_long_read(&mm->context.id) & asid_mask;
+		if (static_branch_unlikely(&use_asid_allocator))
+			asid = atomic_long_read(&mm->context.id) & asid_mask;
+	} else {
+		cmask = cpu_online_mask;
+		broadcast = true;
+	}
 
 	if (broadcast) {
 		if (riscv_use_ipi_for_rfence()) {
@@ -128,7 +135,8 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 		local_flush_tlb_range_asid(start, size, stride, asid);
 	}
 
-	put_cpu();
+	if (mm)
+		put_cpu();
 }
 
 void flush_tlb_mm(struct mm_struct *mm)
@@ -179,6 +187,12 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
