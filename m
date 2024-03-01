Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A188C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 09:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LjOoeS+kFvZExTxjJ/r0OvpgJFkUnwgVK/OpckST0EM=; b=gbeI6xd5pf9QQq
	+Z8ZvNcwI0wXTOuy2otpSGn7hG0CBaWm65aCN2+BdY66o3rPXavluKGXc0BVsVwqqnjcicvyvVIn3
	E77aiSePFS/rV2JxTGsW0A2lIBuh6z08XMqDTfBoOdPSueI37hjR2T8ypMewXA7041mvvqB3PZJ0n
	Ui0jECzmAATIcfRe4etSPxIv4FRcju0uhHwC1BfZKDrpV+2BOo+M0EsR+826IMDFwcTmlgsKTR+Ge
	g/kcllPMH4MSxZsVprIXu83oDsMc3+WwpvaeR0LQx1rpOKdYdQY6362t0PUqNIc0Twef8XMypdibS
	z/o2JTYTZKpJoIG6+Esg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfz69-0000000H81O-3cIB;
	Fri, 01 Mar 2024 09:22:33 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfz5w-0000000H7wc-3n6n
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 09:22:31 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-33ddd1624beso1174543f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 01:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709284939; x=1709889739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHzJQXP5BEIeqfOJsZUcjaIxOTpiaXVWcZpI+r0iAkE=;
        b=PkKjFO/EA83WbpzCUwN5bV51Ybfnnl7njjJ29NNqei0weZQZRhgQDNC3InOjYufRSV
         NWZlPoezk9kmEcHcbKBrdmfvU4wwgTyGUD0OCorF+P6ZxRB88gu5ixc1bbSus0JY4s8W
         o81fTW7oNFPU8mAJF1X6dcf7ay52Y4MrB5IjFAGCpbdTZjlCN4QAybEAS2NcFcqWYcd4
         LqbpnwntD0xmOBX57FkhBevpVyJiH5BJjbs5WGRNNcm2WXD4DPkOOZpHe2tFd03bmFW5
         9nqRvOzquY8rq0BBhKMZTRGeyCWwanf/LW6L6YAeETiLtFQNSgUbz8YFewwkSZmDKEMb
         ynKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709284939; x=1709889739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHzJQXP5BEIeqfOJsZUcjaIxOTpiaXVWcZpI+r0iAkE=;
        b=Vw2wHLk0+9qMyGaYbB/Xq02vlxbq7clgpg37H1OIpHZsNwavRs9nD/LBQ5NcckuZcr
         ZTD6rn5jMqPl2XFBXLYE3SCIbpYwNdLJyR6evpsYwiB+8wszgJiMbUj3isnfDfheXxgL
         4ScZtee6544Ty1iylmuOoJjio+QIVhMhUTxXr78Wzv/Tr5lW7PRM60jQfWnuE4Sl3tlh
         W2M2WO9+QUJ+aVdWQUf5OllGxk8k3EFKTjdHo8qze0KO4fahPai0akh+U065aD7Vb0ne
         3qvDZmcH3IIM5a/ZKc+txOtmZ097OIWtcTBvJp/BxztOzDbvDS//uz6v7j0odBpd8TaP
         /L5A==
X-Forwarded-Encrypted: i=1; AJvYcCWQy/i2VlF8elL988XKNHcdV3Yuv1NQPN/cW3xToC4PnykLDp+zD6x1YYcfiXy4KltHQO5rV03l6PnsxsVEjXM1vZIzJGVpwEbSjfQMcKcv
X-Gm-Message-State: AOJu0Yzf3W2XIULbcvlYLNlcmWSPQRT5VkCK5QbswN4jJXe9qXEcP93H
	8i4dGNeW/mLWO2+wapTN2IgLWJ1xz/FhzBgYC+V6UvOloQ4usRqYNgwmDHYMddnWWY6Bp/QjX1j
	d
X-Google-Smtp-Source: AGHT+IETq5VRJHPuwhCoVEqwX4u/EPRIvAhXp1XnZCRkR4LhBkbxP9zDwDTrac3tIekTrNx6Id8PTw==
X-Received: by 2002:adf:f84c:0:b0:33d:39db:a0f8 with SMTP id d12-20020adff84c000000b0033d39dba0f8mr1044349wrq.7.1709284939471;
        Fri, 01 Mar 2024 01:22:19 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id e13-20020a5d594d000000b0033e12b2e567sm3302518wri.35.2024.03.01.01.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 01:22:19 -0800 (PST)
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
Subject: [PATCH 7/9] mm: Use common huge_ptep_set_access_flags() function for riscv/arm64
Date: Fri,  1 Mar 2024 10:14:53 +0100
Message-Id: <20240301091455.246686-8-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240301091455.246686-1-alexghiti@rivosinc.com>
References: <20240301091455.246686-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_012223_093650_B1AEB327 
X-CRM114-Status: GOOD (  19.30  )
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

Both architectures have almost the same implementation:
__cont_access_flags_changed() is also correct on riscv and brings the
same benefits (ie don't do anything if the flags are unchanged).

As in the previous commit, get_clear_contig_flush() is duplicated in both
the arch and the generic codes, it will be removed from the arch code when
the last reference there gets moved to the generic code.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/mm/hugetlbpage.c | 65 --------------------------------
 arch/riscv/mm/hugetlbpage.c | 29 ---------------
 mm/contpte.c                | 74 +++++++++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+), 94 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index a2d33cbc7da5..b8abbd5ace4f 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -284,71 +284,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-/*
- * huge_ptep_set_access_flags will update access flags (dirty, accesssed)
- * and write permission.
- *
- * For a contiguous huge pte range we need to check whether or not write
- * permission has to change only on the first pte in the set. Then for
- * all the contiguous ptes we need to check whether or not there is a
- * discrepancy between dirty or young.
- */
-static int __cont_access_flags_changed(pte_t *ptep, pte_t pte, int ncontig)
-{
-	int i;
-
-	if (pte_write(pte) != pte_write(ptep_get(ptep)))
-		return 1;
-
-	for (i = 0; i < ncontig; i++) {
-		pte_t orig_pte = ptep_get(ptep + i);
-
-		if (pte_dirty(pte) != pte_dirty(orig_pte))
-			return 1;
-
-		if (pte_young(pte) != pte_young(orig_pte))
-			return 1;
-	}
-
-	return 0;
-}
-
-int huge_ptep_set_access_flags(struct vm_area_struct *vma,
-			       unsigned long addr, pte_t *ptep,
-			       pte_t pte, int dirty)
-{
-	int ncontig, i;
-	size_t pgsize = 0;
-	unsigned long pfn = pte_pfn(pte), dpfn;
-	struct mm_struct *mm = vma->vm_mm;
-	pgprot_t hugeprot;
-	pte_t orig_pte;
-
-	if (!pte_cont(pte))
-		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
-
-	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
-	dpfn = pgsize >> PAGE_SHIFT;
-
-	if (!__cont_access_flags_changed(ptep, pte, ncontig))
-		return 0;
-
-	orig_pte = get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
-
-	/* Make sure we don't lose the dirty or young state */
-	if (pte_dirty(orig_pte))
-		pte = pte_mkdirty(pte);
-
-	if (pte_young(orig_pte))
-		pte = pte_mkyoung(pte);
-
-	hugeprot = pte_pgprot(pte);
-	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
-		set_pte_at(mm, addr, ptep, pfn_pte(pfn, hugeprot));
-
-	return 1;
-}
-
 void huge_ptep_set_wrprotect(struct mm_struct *mm,
 			     unsigned long addr, pte_t *ptep)
 {
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 4c441664db8a..fdb633844d4b 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -173,35 +173,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-int huge_ptep_set_access_flags(struct vm_area_struct *vma,
-			       unsigned long addr,
-			       pte_t *ptep,
-			       pte_t pte,
-			       int dirty)
-{
-	struct mm_struct *mm = vma->vm_mm;
-	size_t pgsize;
-	pte_t orig_pte;
-	int pte_num;
-
-	if (!pte_napot(pte))
-		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
-
-	pte_num = arch_contpte_get_num_contig(vma->vm_mm, addr, ptep, 0, &pgsize);
-
-	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
-
-	if (pte_dirty(orig_pte))
-		pte = pte_mkdirty(pte);
-
-	if (pte_young(orig_pte))
-		pte = pte_mkyoung(pte);
-
-	set_ptes(mm, addr, ptep, pte, pte_num);
-
-	return true;
-}
-
 void huge_ptep_set_wrprotect(struct mm_struct *mm,
 			     unsigned long addr,
 			     pte_t *ptep)
diff --git a/mm/contpte.c b/mm/contpte.c
index 8d2ab391e0d8..3b65c49c6d4b 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -21,6 +21,7 @@
  * set_huge_pte_at()
  * huge_pte_clear()
  * huge_ptep_get_and_clear()
+ * huge_ptep_set_access_flags()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -156,3 +157,76 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 
 	return get_clear_contig(mm, addr, ptep, pgsize, ncontig);
 }
+
+/*
+ * huge_ptep_set_access_flags will update access flags (dirty, accesssed)
+ * and write permission.
+ *
+ * For a contiguous huge pte range we need to check whether or not write
+ * permission has to change only on the first pte in the set. Then for
+ * all the contiguous ptes we need to check whether or not there is a
+ * discrepancy between dirty or young.
+ */
+static int __cont_access_flags_changed(pte_t *ptep, pte_t pte, int ncontig)
+{
+	int i;
+
+	if (pte_write(pte) != pte_write(ptep_get(ptep)))
+		return 1;
+
+	for (i = 0; i < ncontig; i++) {
+		pte_t orig_pte = ptep_get(ptep + i);
+
+		if (pte_dirty(pte) != pte_dirty(orig_pte))
+			return 1;
+
+		if (pte_young(pte) != pte_young(orig_pte))
+			return 1;
+	}
+
+	return 0;
+}
+
+static pte_t get_clear_contig_flush(struct mm_struct *mm,
+				    unsigned long addr,
+				    pte_t *ptep,
+				    unsigned long pgsize,
+				    unsigned long ncontig)
+{
+	pte_t orig_pte = get_clear_contig(mm, addr, ptep, pgsize, ncontig);
+	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
+
+	flush_tlb_range(&vma, addr, addr + (pgsize * ncontig));
+	return orig_pte;
+}
+
+int huge_ptep_set_access_flags(struct vm_area_struct *vma,
+			       unsigned long addr, pte_t *ptep,
+			       pte_t pte, int dirty)
+{
+	int ncontig;
+	size_t pgsize = 0;
+	struct mm_struct *mm = vma->vm_mm;
+	pte_t orig_pte;
+
+	if (!pte_cont(pte))
+		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
+
+	ncontig = arch_contpte_get_num_contig(vma->vm_mm, addr, ptep, 0, &pgsize);
+
+	if (!__cont_access_flags_changed(ptep, pte, ncontig))
+		return 0;
+
+	orig_pte = get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
+
+	/* Make sure we don't lose the dirty or young state */
+	if (pte_dirty(orig_pte))
+		pte = pte_mkdirty(pte);
+
+	if (pte_young(orig_pte))
+		pte = pte_mkyoung(pte);
+
+	set_contptes(mm, addr, ptep, pte, ncontig, pgsize);
+
+	return 1;
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
