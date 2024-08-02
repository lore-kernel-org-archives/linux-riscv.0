Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34063C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 15:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+L7c1zCgYRSL280I/Pl7w3EResZfO82HX7OjH8zuXo0=; b=d9NWQvULExXwY1
	jMJ52xbpNpYy74ludxbNjV9ec7HPsiqdAM6hAoz/CzOr50oPTK74sSmsiEh5K1NLMST8h8S36JSdi
	kIH+AT0pMd2OjPSfN/4hVk6OzAfkGYKOzsCImq0F1Ja6Qc0GdGkcPF7zkitr1Sr5Z3qKL+UwXLvO0
	YDfY3Gp5/RLiy7V3pxEHSGLJJ36g/qTj2BuPcM3IqMvmv0JQSNsWXLGvTl3MHe9j2VcLmCOzvm3QW
	76qgPzXe/9fikhFb3Fd0IIBJEXPKef+7UKJTOhzx+PfbQheCjje0yj2fd3TSSVBmQrLP7KLXfWiN3
	o+B/mExyjKXS9rSv+9Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZu4l-00000009EfF-2n9s;
	Fri, 02 Aug 2024 15:20:15 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZu4F-00000009ENX-42fR
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 15:19:46 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ef27bfd15bso105961361fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 08:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722611981; x=1723216781; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgy6e6djKCEiajpx++weOAekuViyBMKy0O9RS2EJI5E=;
        b=2h5q1Wg7wgAezhB+Vb1/2+g1OrCERj4prssqD93rIxgzBscRISEOXIWdBpuzAn2f2L
         IRV78hsAnBRMrqafXrz0HHIhCeDZuMmLind1cCk10CsnJbYIJQWaDLcDsn6bjeKXR7OV
         KmXBmcYUiiqks1OgxtxaMRDX9bhS6t36qZly5969pgImcouBKHpoAi1dmNC04TSTeT4E
         jcBDnl1WBP3+Wp5FYr28yZ3CXVL2Rmb3U/72NSmxmKVB53mpOUhIZJVcrYYhFPgt1wwS
         ReShkEA3+APAdA6pmLyFt0v+/T7FoxQ3r0xfWGF6lncUbWcctLci4sffAtKADO72XY6z
         NZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722611981; x=1723216781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgy6e6djKCEiajpx++weOAekuViyBMKy0O9RS2EJI5E=;
        b=pQCDYUIolm8JeyMCBwytIgWo+2Qq7GaFEExGKTI+ySmJXEyXr3Q54zdh60OXgjdLBT
         j6PigINS8qpWTjGK2doabXteByaf1zAa9FlsKAqh/UyunGXNJtIwNrcQrlZ8DaiDnXUd
         n12MMhiOZ/hSUwctCXSpdip7Ozb0HK2aj2xJRcB9vFfnFXAX72HM1w2xKuugQtU1sOsI
         6Ow06TYQPn5qXlu46z2Ty/TiuDHWrak6QWaIII/IvQy5BTItCJP/P0G1oi3R3ybcJ2Uf
         lASsWzj+oQpf8uvsE7tzhnSPpM8r8aTQWEOwUN2F5bTZyoTe+ddDa9rmrJvaOuUAD/8x
         65bA==
X-Forwarded-Encrypted: i=1; AJvYcCWljnBsIZH0JjLcgZes9MvY1Qqn4WNzevBmjJ/HkgYCf0A+UNdl35+UvkWNMtrTFp/ovYVJFEvkLxS/bQft8C21TNdGiubTopthoRx5TWo5
X-Gm-Message-State: AOJu0YyzyHe+YRnWsqaY3EiEJVWXNoBf5M3f2xgwmd4DiCN06WZnVbb0
	uBTrZdXwc2OMmZjFoLM6gEmyjInMTx74OxWBmGZ1gE5VMirlesVx2h0qVLRM73E=
X-Google-Smtp-Source: AGHT+IEILpnFvb14vizaqdHNCAsEefKY8W5fJrghMGpJs4NQI541WsQVt7UAPN57wbPSjoIKa73jbQ==
X-Received: by 2002:a05:651c:b06:b0:2f1:6a30:6754 with SMTP id 38308e7fff4ca-2f16a3067dbmr1525221fa.12.1722611981105;
        Fri, 02 Aug 2024 08:19:41 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f15e17e840sm1828141fa.12.2024.08.02.08.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 08:19:40 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 5/9] mm: Use common huge_pte_clear() function for riscv/arm64
Date: Fri,  2 Aug 2024 17:14:26 +0200
Message-Id: <20240802151430.99114-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802151430.99114-1-alexghiti@rivosinc.com>
References: <20240802151430.99114-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_081944_077230_CCDC40ED 
X-CRM114-Status: GOOD (  13.82  )
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

Both architectures have the same implementation so move it to generic code.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/hugetlb.h |  3 ---
 arch/arm64/mm/hugetlbpage.c      | 12 ------------
 arch/riscv/include/asm/hugetlb.h |  4 ----
 arch/riscv/include/asm/pgtable.h |  5 +++--
 arch/riscv/mm/hugetlbpage.c      | 19 -------------------
 include/linux/hugetlb_contpte.h  |  4 ++++
 mm/hugetlb_contpte.c             | 14 ++++++++++++++
 7 files changed, 21 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index d35093b7ab59..fab0afbe4eea 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -40,9 +40,6 @@ extern void huge_ptep_set_wrprotect(struct mm_struct *mm,
 #define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
 extern pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 				   unsigned long addr, pte_t *ptep);
-#define __HAVE_ARCH_HUGE_PTE_CLEAR
-extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
-			   pte_t *ptep, unsigned long sz);
 
 void __init arm64_hugetlb_cma_reserve(void);
 
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index c7130d1f07c4..495f706e0170 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -266,18 +266,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
-		    pte_t *ptep, unsigned long sz)
-{
-	int i, ncontig;
-	size_t pgsize;
-
-	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
-
-	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
-		__pte_clear(mm, addr, ptep);
-}
-
 pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 			      unsigned long addr, pte_t *ptep)
 {
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index 28cbf5d761e1..ca9930cdf2e6 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -20,10 +20,6 @@ bool arch_hugetlb_migration_supported(struct hstate *h);
 #endif
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
-#define __HAVE_ARCH_HUGE_PTE_CLEAR
-void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
-		    pte_t *ptep, unsigned long sz);
-
 #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
 pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 			      unsigned long addr, pte_t *ptep);
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 46b409e558b3..5ab0559b0bd2 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -615,8 +615,8 @@ static inline int arch_contpte_get_num_contig(pte_t *ptep, unsigned long size,
 }
 #endif
 
-static inline void pte_clear(struct mm_struct *mm,
-	unsigned long addr, pte_t *ptep)
+static inline void __pte_clear(struct mm_struct *mm,
+			       unsigned long addr, pte_t *ptep)
 {
 	__set_pte_at(mm, ptep, __pte(0));
 }
@@ -731,6 +731,7 @@ static inline pte_t ptep_get(pte_t *ptep)
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 #define ptep_get_and_clear	__ptep_get_and_clear
+#define pte_clear		__pte_clear
 
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 0ecb2846c3f0..e2093e7266a5 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -251,25 +251,6 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 	return get_clear_contig_flush(vma->vm_mm, addr, ptep, pte_num);
 }
 
-void huge_pte_clear(struct mm_struct *mm,
-		    unsigned long addr,
-		    pte_t *ptep,
-		    unsigned long sz)
-{
-	size_t pgsize;
-	pte_t pte = ptep_get(ptep);
-	int i, pte_num;
-
-	if (!pte_napot(pte)) {
-		pte_clear(mm, addr, ptep);
-		return;
-	}
-
-	pte_num = arch_contpte_get_num_contig(ptep, sz, &pgsize);
-	for (i = 0; i < pte_num; i++, addr += pgsize, ptep++)
-		pte_clear(mm, addr, ptep);
-}
-
 static bool is_napot_size(unsigned long size)
 {
 	unsigned long order;
diff --git a/include/linux/hugetlb_contpte.h b/include/linux/hugetlb_contpte.h
index 7acd734a75e8..d9892a047b2b 100644
--- a/include/linux/hugetlb_contpte.h
+++ b/include/linux/hugetlb_contpte.h
@@ -14,4 +14,8 @@ extern void set_huge_pte_at(struct mm_struct *mm,
 			    unsigned long addr, pte_t *ptep, pte_t pte,
 			    unsigned long sz);
 
+#define __HAVE_ARCH_HUGE_PTE_CLEAR
+extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
+			   pte_t *ptep, unsigned long sz);
+
 #endif /* _LINUX_HUGETLB_CONTPTE_H */
diff --git a/mm/hugetlb_contpte.c b/mm/hugetlb_contpte.c
index 9a3a376784b0..b9634ffa1bad 100644
--- a/mm/hugetlb_contpte.c
+++ b/mm/hugetlb_contpte.c
@@ -12,6 +12,7 @@
  *   - __ptep_get()
  *   - __set_ptes()
  *   - __ptep_get_and_clear()
+ *   - __pte_clear()
  *   - pte_cont()
  *   - arch_contpte_get_num_contig()
  */
@@ -20,6 +21,7 @@
  * This file implements the following contpte aware API:
  *   - huge_ptep_get()
  *   - set_huge_pte_at()
+ *   - huge_pte_clear()
  */
 
 pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
@@ -101,3 +103,15 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 
 	set_contptes(mm, addr, ptep, pte, ncontig, pgsize);
 }
+
+void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
+		    pte_t *ptep, unsigned long sz)
+{
+	int i, ncontig;
+	size_t pgsize;
+
+	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
+
+	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
+		__pte_clear(mm, addr, ptep);
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
