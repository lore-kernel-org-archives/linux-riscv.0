Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C053C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 13:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lCfT1JWI/4urpiiqNIR++Rg0QT7gBQXz0b/1LUMdDO4=; b=U10c3ABOA633GJ
	y3zj5uhhk0KVGyZQNsqM7PPXRGvJvgU3+v9Md5zg5PShLTWagWKDvzCOY2c/f9td8CXoytokVGYgC
	kder8tEV9uiTm+i1BR0x4s8kO++milHnQ1bFMqEEoa1kfUwXr4RnNwkcX/FY7H86Axp/T9LEJgiEn
	DqD3HgEXq2AHrdc5EaAi+Ny1kS/2zGTqVk9r0x4BSDKjORHyXGE6ZbB2Hlm72HfAMs0WZ03vvdwF9
	qRlob11aQGNmv9cmE6MdiUbM4gn161pqduA5MLhaD7t90RtfQW52cyzCKH56Iuy2lCNJT9rcULoSi
	262AcyZ5WERqr9VprtAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxSQD-003QPO-2x;
	Mon, 30 Oct 2023 13:35:13 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxSQB-003QOJ-1n
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 13:35:12 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so829434f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 06:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698672908; x=1699277708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+Voqb64JUu/S+my4bjKiePrsxn/AGTGcWHZA6URcLY=;
        b=2R0jxgvp1S1mzkazHvjegoJKJ83ypYukz5et1slDeEw8uY6sTDzz618W83W0cuOYV/
         I9z8X7Koj9MoMCQXowAWVGcpBOaa30YMIwlx3QtsXEFNFNxBrHXkWdYkrD5TGs0Q6Uqf
         vLWubE2MuOpAdg3qUzzxKu8+YwNAoeZPrJF9vKLhVcNafocuj9jLgEFR3LIAz16rVjCH
         9vWqf3gYqZqdGWEBunJAS++o28yXXCoTrDj97HvnaHjpnuNlhuepOFP7J7BIUQkJMXqj
         tzBZQXhP1oOD3YWW37/WnlTPnyBaL9Rty0ZaSTc46BG4/YOxLbypvdPEGBmTCtzx0Bac
         6hJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698672908; x=1699277708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+Voqb64JUu/S+my4bjKiePrsxn/AGTGcWHZA6URcLY=;
        b=j/g/SlCmNrw4dYlZdxBV7Z1oY/HZwV6tMpkoVKW6usILOELVR5ay7wXg73RMJZEKRa
         BiuTn2Rv8ErtD7vlkF8DOpWSw0b/HEALfJUo/W8HF6LAVL5KCjH07vtJyi8lpGh/MDYJ
         tz5tKw+dOrnCzAqPYCehI4gHe/5IdOGnXsnfzabv7/GsAU+c06zhxejdFpVp5IB30eq6
         BVA8bmZdSFhi1NdA90w9W+wLj+gnrk4oXKL4Enk/lwRzWczdVxUk82qVRZedRKJSJofH
         nW4zs8WOkUexO+S4Um8AG+dEHMeOGZJaGhX9uFhU7y7YXGz9yC4F35lKNoqg6Wh9AMEZ
         vnmA==
X-Gm-Message-State: AOJu0YzFRPgf9o0GMucq6FWmTnIMAIDsjRdvhcq6NGvPPSxzKyy/znG/
	7/uURKACJWld4I90oC7+kuVceA==
X-Google-Smtp-Source: AGHT+IHEw6T+OK2cXmEQUaFlVp9JTsP+3ENAfV/VP4H/l3hIJec/QWwZbGuNwmLLAlaAsmBtrNDznA==
X-Received: by 2002:a05:6000:1882:b0:32f:7f03:9a with SMTP id a2-20020a056000188200b0032f7f03009amr4279324wri.55.1698672907709;
        Mon, 30 Oct 2023 06:35:07 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id o12-20020a056000010c00b003232f167df5sm8252241wrx.108.2023.10.30.06.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 06:35:07 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v6 4/4] riscv: Improve flush_tlb_kernel_range()
Date: Mon, 30 Oct 2023 14:30:28 +0100
Message-Id: <20231030133027.19542-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030133027.19542-1-alexghiti@rivosinc.com>
References: <20231030133027.19542-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_063511_595964_821B3255 
X-CRM114-Status: GOOD (  17.59  )
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
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>
---
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
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
