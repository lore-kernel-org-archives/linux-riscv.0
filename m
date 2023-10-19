Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADD0CDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 14:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gow8ZiM9/iNZyrRsXClRHqcYVSVzPTfq9r5Lev9yHQM=; b=OS1nWUHNiLXUUD
	J7cVS4FLaLVGUwNDDMnBeFox1naDcyQ5Ir4ZCoew51QaP8+INE0LE8Axnzf4Mi9/NgtkYnd3zw/1b
	0mT6U5XrEi4Ot9VJe3YmbHVOpOIlGUsYQucIE53xJHvBlxUQKNH8jEyllOLRaRfq78fHuI/ASa388
	Bw4g4Wn1YFnbQqv01YCX90zJONaGWPkIRqwzGt6uYlr6EjsSrDLHiptor9bk2y7T2MCdhMGiEirF7
	kQN1mcXvmRKtAdcgVRJBLo4FotMeDIQT2/eh77WIJIxWttCFq5BAD9h+mVtMdaKuubZ74sgSB3/Em
	ikhbHtrjJ5F/fqFAkO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTfG-0001Or-35;
	Thu, 19 Oct 2023 14:06:18 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTfE-0001Ml-0T
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 14:06:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32d9552d765so6219071f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 07:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697724375; x=1698329175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwR/Ke20NAcUS81IhTmctZxyEuc+6gPtGwlWuG8Kglw=;
        b=QtSPGKEwJzhjNTETm1+QognODAPGJEfdPvm1K6XksMRqJepgLAGIv5i9cvaMn8DAcI
         BAKMGLh/3+kesva4XHRPobnJBMPx0EWH/jvkuouw5ZKEKeqt36x+oG7iTT0JfvQqQ0vL
         kEoz7VOQ4ZqMeOZCzaXN2/OQWZy1cDsyJpA/Pff6FfpM3D5TilKvBTZpUq5GqT6SM38o
         JbJq7F1Orcny4AxUA/GwJp4EfUD3sAAhcUXETPScwmBb1aIENUXqjM63vON/cGO5T4X1
         KnvS3/H3WfY4CTHR4MHzvMb8aJRJZUuYyTGVkH3rGk9Kc7kgzSyMJqCAKZGeW0cF+SQs
         /4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697724375; x=1698329175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwR/Ke20NAcUS81IhTmctZxyEuc+6gPtGwlWuG8Kglw=;
        b=C2zcqAs539o8KwWLv/5ZZ0ihV2rbM+6dtA6MFxtPjoR8kfiAyZDaYDelrAggmJ5D63
         G/Lta/nM4ufiAP7CywXKVYL57KFbl1mf/L8Z45yvdRF/M9gm5R4EvBmESMLiAH1R+IVA
         u5qDDfzqIUqyJGGT5TBtAgYaNebsV/rrSJksTV44VLL37XQFEI7GVQCJ5WHQf8vsPiHT
         7r7pSAZHa5fdFeThqOMu87nBPCsPCj9cJBmi6CuizCTKWFVWXkF+c+DtGEBsQBa7gg7w
         gG632wtOOpubSJoKBtQO4v4b6o07yLL/bfBBVhuHfTtiASLNuJ7wKJCnul040wvmFfJJ
         A5cg==
X-Gm-Message-State: AOJu0YyJQllsUg6S6I2PBozMPkqe04WE0POycWKobP9EXVgp4KtJ4PQC
	wR4sqmFfWNTivrLQoCpFeeGeZw==
X-Google-Smtp-Source: AGHT+IEj56EYfD3VGGct58Hoxz0IsXjkWxjSdBpSEK26F7D/MeS2KrVfdBwf1rOZcSIiBfUvUcP6qg==
X-Received: by 2002:a5d:6e0b:0:b0:32d:8505:b9d7 with SMTP id h11-20020a5d6e0b000000b0032d8505b9d7mr1610093wrz.43.1697724374647;
        Thu, 19 Oct 2023 07:06:14 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id u11-20020a5d514b000000b0032db4825495sm4572197wrt.22.2023.10.19.07.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 07:06:14 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 4/4] riscv: Improve flush_tlb_kernel_range()
Date: Thu, 19 Oct 2023 16:01:51 +0200
Message-Id: <20231019140151.21629-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019140151.21629-1-alexghiti@rivosinc.com>
References: <20231019140151.21629-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_070616_182887_1058636C 
X-CRM114-Status: GOOD (  17.38  )
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
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # On RZ/Five SMARC
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
index c27ba720e35f..7e182f2bc0ab 100644
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
@@ -181,6 +190,12 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 
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
