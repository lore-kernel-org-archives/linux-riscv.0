Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC86C36000
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 13:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WALJ9JwX78Jwxu8WiLrPtwiSEDnTfbqGC6cQBJUYJA=; b=omwb7piz48JoLM
	QPcEoCUXaHEY0vTFvNKUdfzd7DOSp0AXcqUQZQnUMNtyztgvwagsztxrQ4vhsdCtohPUL2gdSUOeQ
	lpMbpHkKPnN5Bg3daKfvRHFjFVbOjWyTpLldaBtnxITMPrFNCek6fqOBsm03Qr0P0H8XKOghzqgPj
	ZkWQktZGmQB2JXGSBXwGm6IdLlTY/inzsEYL6/cDNY1RBBTDtGaU/DwBAXNEkF0OF/iudsfSox9yH
	GYHNppM2FI1awJD5mVQX3Q2a8UJiuOds5rQxFGSwhjgcfQ+zMg1iECU/FKP8miNWT9CDdh7+ucq6x
	DGZWTNupVgMAY9EwgECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcFH-0000000Etd4-3KIP;
	Fri, 21 Mar 2025 13:17:07 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcB7-0000000EsYx-1EyN
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 13:12:50 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3913fdd0120so1168099f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Mar 2025 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742562768; x=1743167568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tW5CZGKlc6dgOhT2HYLkHYDVp73Jiwu1Hc2Rif5lDWM=;
        b=puYwddz8Wz+5V5YrPz2C2AcTgvDT4mKtmkEeH4loATwSKRXgec/hBnnIHbVyY5iX99
         XJbj7o+XUQz9QwtTeXsxV1+T95GhTQaVmC+gfCjXLN0ODUSMwH3joBtcrm9ZeCbgMy5l
         Ek/JROE7oNeRHAtrUxE/D2hTQBHy3trPvPcL6YHFW+l5uLcwW4AswEzsCyDJ8C2LB9MC
         QzrCr6oOEGQcE2oFvjVSGLuk19+uwLUn0g6zeszYFCUM02Vqwt3vJv6lkLR9VXMzXahT
         nS3aZhotDxEDXVdgx0M0YZ/wopd1FURCesZiNGP3gO364lvPf2zs4+COlqz7eUriMq+1
         DyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742562768; x=1743167568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tW5CZGKlc6dgOhT2HYLkHYDVp73Jiwu1Hc2Rif5lDWM=;
        b=T6wm14i02iJu9EFFUFKYfZqzZgd7pb6MlQIZN5nHqZw/VVWsaGQ3XRg1xzgQN3WWA4
         CRcK9QGxEZX3RKJtlP+gwd9tiWfbLs6n8xU734zNKesvV26EkqstgrbKwuSmppHuYpXd
         nv90Z4B5/6qj/ZPV8f/Gj6juuvyd8YeRYh6LD8eEMYFUapQf/cEDI8f3sTKImgVXHA/U
         DUL2McIH++4tXwc1MiovcW+vHHK1RRK30LAt4zHwKPGRsRQEPSvPw3uO+Ziaeihmri4J
         t1IwMTgDoyq4v4uYgViBopFgv1P+FhR0Amw6vQvuJwCzlzZNIyjHKMqTL94nOC95xpYw
         ZtBg==
X-Forwarded-Encrypted: i=1; AJvYcCVDwDuhAc1QaDOZcll33+pVx2TSq1t5JNI1CNR+zC+fKOL1YYnHau13VZK6bYKJdel7wDepxaysFT3t7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrCNUbczkOtmkZjCVO/X6D0gthbbiN+2JiOAtMt9DulbyjJNJF
	/AuwL70NKmX9mGT03KWyvl2cgUU6Ukii/9wZA1zKX/KwC6NBOWPrUMRhTm4sINs=
X-Gm-Gg: ASbGncsKfVuoNWX/P+ikkVm38W51QOOZm/fc6PCghlMdV9Wu4KRYGCg7OaSb3+0tOSW
	LNnRov7yml75ykksvR7v/zMVICAN+XL9/8dVnjpePrdAUtKzWrBm2r/wlUQVqhXFz6cE0MfwLwo
	N3i0BmXVmSvPy/YIzvGYc/EJ1bhCFgW138Rp84f9AM/L0LNRLW5DsHKuwucijaSX6LzHlAIwZzN
	69nnKZfSSF80Z8+nZAIgFUfv3bJFDclm+8Orf7+u9O+Y34UZg+3PYKaeMDIYTsVMs8dksdnLMMe
	38Nu8lLRsnKjTU9AynNPiwKh/xsxsMBus8zMhL35SOqDzBpZE/e5CAJUiK4VBt3bEZNWnQ==
X-Google-Smtp-Source: AGHT+IEUtROIBbu/cy/pImYWjl+q4lRngYo9z7idT6KT9+6QFPXCkP6BZJtyCAPZK3CSSAem4Gc0LA==
X-Received: by 2002:a5d:64af:0:b0:391:2db0:2961 with SMTP id ffacd0b85a97d-3997f932efcmr3394631f8f.38.1742562767493;
        Fri, 21 Mar 2025 06:12:47 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3d12:52fe:c1cc:c94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e66c7sm2356167f8f.79.2025.03.21.06.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:12:47 -0700 (PDT)
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
Subject: [PATCH v5 6/9] mm: Use common huge_ptep_get_and_clear() function for riscv/arm64
Date: Fri, 21 Mar 2025 14:06:32 +0100
Message-Id: <20250321130635.227011-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250321130635.227011-1-alexghiti@rivosinc.com>
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_061249_341092_004D1485 
X-CRM114-Status: GOOD (  16.62  )
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

After some adjustments, both architectures have the same implementation
so move it to the generic code.

Note that get_clear_contig() function is duplicated in the generic and
the arm64 code because it is still used by some arm64 functions that
will, in the next commits, be moved to the generic code. Once all have
been moved, the arm64 version will be removed.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/hugetlb.h |  3 --
 arch/arm64/mm/hugetlbpage.c      | 10 -------
 arch/riscv/include/asm/hugetlb.h |  5 ----
 arch/riscv/mm/hugetlbpage.c      | 15 ----------
 include/linux/hugetlb_contpte.h  |  5 ++++
 mm/hugetlb_contpte.c             | 51 ++++++++++++++++++++++++++++++++
 6 files changed, 56 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index ed75631ad63c..9b1c25775bea 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -39,9 +39,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 				      unsigned long addr, pte_t *ptep,
 				      pte_t pte, int dirty);
-#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
-extern pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
-				     pte_t *ptep, unsigned long sz);
 #define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
 extern void huge_ptep_set_wrprotect(struct mm_struct *mm,
 				    unsigned long addr, pte_t *ptep);
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 99728b02a3ca..62a66ce2b2fe 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -260,16 +260,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
-			      pte_t *ptep, unsigned long sz)
-{
-	int ncontig;
-	size_t pgsize;
-
-	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
-	return get_clear_contig(mm, addr, ptep, pgsize, ncontig);
-}
-
 /*
  * huge_ptep_set_access_flags will update access flags (dirty, accesssed)
  * and write permission.
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index 467bc30c2153..0fbb6b19df79 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -20,11 +20,6 @@ bool arch_hugetlb_migration_supported(struct hstate *h);
 #endif
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
-#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
-pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
-			      unsigned long addr, pte_t *ptep,
-			      unsigned long sz);
-
 #define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
 pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 			    unsigned long addr, pte_t *ptep);
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index fe82284c3dc4..87168123d4a2 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -203,21 +203,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	return true;
 }
 
-pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
-			      unsigned long addr,
-			      pte_t *ptep, unsigned long sz)
-{
-	pte_t orig_pte = ptep_get(ptep);
-	int pte_num;
-
-	if (!pte_napot(orig_pte))
-		return ptep_get_and_clear(mm, addr, ptep);
-
-	pte_num = arch_contpte_get_num_contig(ptep, sz, NULL);
-
-	return get_clear_contig(mm, addr, ptep, pte_num);
-}
-
 void huge_ptep_set_wrprotect(struct mm_struct *mm,
 			     unsigned long addr,
 			     pte_t *ptep)
diff --git a/include/linux/hugetlb_contpte.h b/include/linux/hugetlb_contpte.h
index e6aa9befa78c..1c8f46ff95ea 100644
--- a/include/linux/hugetlb_contpte.h
+++ b/include/linux/hugetlb_contpte.h
@@ -18,4 +18,9 @@ extern void set_huge_pte_at(struct mm_struct *mm,
 extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 			   pte_t *ptep, unsigned long sz);
 
+#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
+extern pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
+				     unsigned long addr, pte_t *ptep,
+				     unsigned long sz);
+
 #endif /* _LINUX_HUGETLB_CONTPTE_H */
diff --git a/mm/hugetlb_contpte.c b/mm/hugetlb_contpte.c
index e881b302dd63..82f49eb79ffb 100644
--- a/mm/hugetlb_contpte.c
+++ b/mm/hugetlb_contpte.c
@@ -98,3 +98,54 @@ void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
 		__pte_clear(mm, addr, ptep);
 }
+
+/*
+ * ARM: Changing some bits of contiguous entries requires us to follow a
+ * Break-Before-Make approach, breaking the whole contiguous set
+ * before we can change any entries. See ARM DDI 0487A.k_iss10775,
+ * "Misprogramming of the Contiguous bit", page D4-1762.
+ *
+ * RISCV: When dealing with NAPOT mappings, the privileged specification
+ * indicates that "if an update needs to be made, the OS generally should first
+ * mark all of the PTEs invalid, then issue SFENCE.VMA instruction(s) covering
+ * all 4 KiB regions within the range, [...] then update the PTE(s), as
+ * described in Section 4.2.1.". That's the equivalent of the Break-Before-Make
+ * approach used by arm64.
+ *
+ * This helper performs the break step.
+ */
+static pte_t get_clear_contig(struct mm_struct *mm,
+			     unsigned long addr,
+			     pte_t *ptep,
+			     unsigned long pgsize,
+			     unsigned long ncontig)
+{
+	pte_t pte, tmp_pte;
+	bool present;
+
+	pte = __ptep_get_and_clear(mm, addr, ptep);
+	present = pte_present(pte);
+	while (--ncontig) {
+		ptep++;
+		addr += pgsize;
+		tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
+		if (present) {
+			if (pte_dirty(tmp_pte))
+				pte = pte_mkdirty(pte);
+			if (pte_young(tmp_pte))
+				pte = pte_mkyoung(pte);
+		}
+	}
+	return pte;
+}
+
+pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
+			      unsigned long addr, pte_t *ptep, unsigned long sz)
+{
+	int ncontig;
+	size_t pgsize;
+
+	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
+
+	return get_clear_contig(mm, addr, ptep, pgsize, ncontig);
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
