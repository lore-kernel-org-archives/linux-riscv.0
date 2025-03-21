Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0ABC36002
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 13:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ulwP/rs51nTkRypgTq05ejd6ES49HXquARkFTnSNYGY=; b=Iszl8YSI0CPKTy
	qxuZRj6pB3XNXet8pINcahyD0PQfMR5Xmfe9rztV+Ijh8JzWDrpOmFPVQooCOid8gTqQJDb7nBVmz
	GhVLLRWkGdx+9yZCFhjoGvoiIiAtb4hHLu1m/vvqmC4MrxGe8R5JQqBWo8bziZLZx0nvRxsyHrtMv
	LTRICz+qCrg7hQnxao5BeFbGDjyIPncFgqoVqitKgVfmkpuOtef0jueOQnDLIXbH02IF6NZVY7DBn
	HYNt6ClMlm9eBP3jFuuHTgZC8FmVyv8PBMcYuMJrhWPZD2kTLcYV+bANR+vRYRvPffIgHTqm+/CcL
	miFSEa3FFvh4N5eiZgyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcFH-0000000Etcg-0qLt;
	Fri, 21 Mar 2025 13:17:07 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcA7-0000000EsLo-2Mv5
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 13:11:49 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1751275f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Mar 2025 06:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742562706; x=1743167506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+Ba9lH6i+4JHX31VX+vvn1rf15Jq1WxTsiq92NtkJo=;
        b=gAT+RXyYDzHUhNh+se7154L412bJnmpvmO7n8rDmf2+H3R5GQTuccUUmYnnZYWZsfI
         TNRZRO4G/zVSuaTjJDour7qFUaQLGnC8QnwU+J398Knw3fZTdbs/tvBrLMNwo5QX8dX6
         0NSyekD0p55jyuPsSDjzY3ql1jDPRgDrhCj2+G+RIqBAramF2e7Dkz2XKBjooEzxSUDM
         AbOXxbExRdr1/aTTbrsaABNH9lEUvjjqSU1m2U7AZ+Mthy9hQViE7zxFW7wyeoYFnbpB
         c7OI12TC/DEGV9sqEd3bPHPjqEagfq0/SDc6mtlLdKjbASDKKRVA37PcdSnIykW6rqWf
         5btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742562706; x=1743167506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+Ba9lH6i+4JHX31VX+vvn1rf15Jq1WxTsiq92NtkJo=;
        b=oXtPKbpCxz01bq81oOiBVuQv2Pqb2TR+qab4ZRVmfFE0FvW0lte/kWBfsMHWf3zuL8
         yO5PJwYP49m7mXz8EF+atPGc8Ae597XwlCNczrca24G43+UeRSthMniqGku/850yx2kN
         q1LjHHQQQP5SSd2/7iX8i+IkShAR355ZyEGkniCz47V9ADNkRaBcIMMdSzxeaZn1R0lh
         C2AVaWIa67ySehyjmNtev28nOT2KOX6r5iy0GRRcc4y8oaxH4lkOWCr8opS3U2iLECPb
         BEXuGilg5ONw2TmH937gs1M5kt5dxFertfNBcgbcmNgBDz/1XwJ556imDQi4wCRiDnSa
         +FgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDMWiPmx2SmvG6Ui5c/Fz49yBdb9xflbege0287ZeteYj1xrKva6F2zSkn1K03Jrszyhyl2mfxvKx5IQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx8TtAlqgRPTNNZ1WudNX5+24Ar0YspkjSdbAjZcnDFz0rclDN
	fmRIftUH7tnvy25ky78s0N4qE+wh4GbspCxR2IBFsxHeW5oPTCP3mhNwczlejWk=
X-Gm-Gg: ASbGncsDMSYZmy0tkxtJv46UILDiWOGoO7AzfxAgPuHK/8Unam/41YHTnauc9+Un3iH
	1geblA61L9Ob+BqMTKqUq+qQFthwu6hGz3vUlR8Llw6gOU4sCvvs17sqo4vA2z24QBltOiLOCWy
	ILPfl7LuobjdO7+K65utj/meqkD8ni5Q22Xp5Tww1aQbutaxKUj/K9pnUiH4dDwTp3KGRu51rVw
	sbO833dnCAzcOWoAgWEvKXU4cYbMArfxDmOIB06eKGLumEJUmGWJlRos91T0SxwQOFwXeDtqqRd
	dUnkV8aeqIK9+pcVzjsy4yaFhiG82Uu1Qb/Oe4fdJuKkf0+sNVIjlDijGVMPgbXr2H5ViA==
X-Google-Smtp-Source: AGHT+IEGZPDoYAPQGYmkPYx5aU5RVlINcZRG7cNrGB3gR0sMYyiWL8XPHTT0J17da9GbtboJpKfvoQ==
X-Received: by 2002:a05:6000:154a:b0:38f:3224:660b with SMTP id ffacd0b85a97d-3997f90a69bmr2874098f8f.22.1742562705888;
        Fri, 21 Mar 2025 06:11:45 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3d12:52fe:c1cc:c94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b26a6sm2310275f8f.44.2025.03.21.06.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:11:45 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 5/9] mm: Use common huge_pte_clear() function for riscv/arm64
Date: Fri, 21 Mar 2025 14:06:31 +0100
Message-Id: <20250321130635.227011-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250321130635.227011-1-alexghiti@rivosinc.com>
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_061147_602376_55C4BD71 
X-CRM114-Status: GOOD (  12.75  )
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
 mm/hugetlb_contpte.c             | 12 ++++++++++++
 7 files changed, 19 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index cfdc04e11585..ed75631ad63c 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -48,9 +48,6 @@ extern void huge_ptep_set_wrprotect(struct mm_struct *mm,
 #define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
 extern pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 				   unsigned long addr, pte_t *ptep);
-#define __HAVE_ARCH_HUGE_PTE_CLEAR
-extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
-			   pte_t *ptep, unsigned long sz);
 
 void __init arm64_hugetlb_cma_reserve(void);
 
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 6feb90ed2e7d..99728b02a3ca 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -260,18 +260,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
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
 pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 			      pte_t *ptep, unsigned long sz)
 {
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index 7049a17b819d..467bc30c2153 100644
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
 			      unsigned long addr, pte_t *ptep,
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 5b34b3c9c0f9..72d3592454d3 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -651,8 +651,8 @@ static inline int arch_contpte_get_num_contig(pte_t *ptep, unsigned long size,
 }
 #endif
 
-static inline void pte_clear(struct mm_struct *mm,
-	unsigned long addr, pte_t *ptep)
+static inline void __pte_clear(struct mm_struct *mm,
+			       unsigned long addr, pte_t *ptep)
 {
 	__set_pte_at(mm, ptep, __pte(0));
 }
@@ -787,6 +787,7 @@ static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 #define ptep_get_and_clear	__ptep_get_and_clear
+#define pte_clear		__pte_clear
 
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 75faeacc8138..fe82284c3dc4 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -254,25 +254,6 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
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
index 135b68bd09ca..e6aa9befa78c 100644
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
index cbf93ffcd882..e881b302dd63 100644
--- a/mm/hugetlb_contpte.c
+++ b/mm/hugetlb_contpte.c
@@ -86,3 +86,15 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 
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
