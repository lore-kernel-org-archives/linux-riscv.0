Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469A7C04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 11:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uEUat0iqir3m/BwW8pN+ZJiIZ0Z8EXP6prqKCnmIK1I=; b=w1mKjHERwOzP2W
	VqPdGmJGvTxEqJ4wDTgQldx+/RX2VXIa5REdtJnA0ophPSmz+jxrzJXsxWVh8Dnmky8IM/NZ3DFvD
	dtEco+Vi4mW0VLZMCw6iDs7eiXwVtUdMbQfcJaSNLKvTzo16zjwubaJQizI8bHkKB2aEgUskBIwsl
	0kG05YuZ2C4nALk8fn9ZUqgMFMhED4S3KvEdM6biwlzeUqWGPhQKXt4NNrMP2fEIkI/buaXiGx0tB
	zXO+dBEnc2J8Ui7lryL8J4MKuvRHE43kbq7Mysi++FVHTk5bc9YoLnaW8X8n5NMge+kTnuqlaN5s+
	YqIZ7cZLd5p7RmyboOhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fOt-0000000FCrv-1j0z;
	Wed, 08 May 2024 11:23:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fOp-0000000FCma-164C
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 11:23:53 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-41c7ac73fddso43651895e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 04:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715167423; x=1715772223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkOJ479CewvDdU5HWPEgLgm2sAjKEVUPHaCHVUUKnDI=;
        b=nUIRpH0IbwO4SEiw8o0YJRMyb1YkTSgGmia8wGxcWYCOpGSL2MvTU2c7DUDHzuLCVu
         Xv6iIHvXxU1CWr613qPaAeUAujXp8JFH7fjTB/c572I3DqhIqChoT4gZW7Zcumhc3Vmy
         Geig3BLO+MZ0QVbh2swIY1Fu/B4EO201rK5YuUOkHlg1grBo+iN+KFYbqsqD2SpUVaKd
         8cOMx4r5jTYOP6N9pmN21Pp1H/azGNFfPimqpoYldnjjb8xEcO0k1ejcpmSHLQAqeO3C
         WNaXuyTj6Tfi0lMpYjSYw0ehIqWaYBGlX2wraSTnnLy8GGrZSdRBgY+i+c1nMncCgr6u
         rNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715167423; x=1715772223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkOJ479CewvDdU5HWPEgLgm2sAjKEVUPHaCHVUUKnDI=;
        b=mY96ThdXDvxfE2N3n0gaHnPXPD06qk19ykRuV9YNV9yhig10WEel9mPS+RHXjdSpS/
         CEfCV6EsH195zdvaXEhh8OEvd4Ed782a+RmL96YW//S19Wf+yL4amtfxMVWXnzBQ8Z0Q
         kzPa1diJwd6PzkcUzY8JRV1F5uTVZ+rr1UE0D9ZHKI7Exa9mbsl6CoQmcCW3W5zyqNVp
         75dd0GN5aVLyavYRAVQSocNQO+03CzLMIDASWDt06c2cXC09eiyy6AIN5/cvRZ4A/wn/
         GE7kE0YAhTA5C2FNcorw8ySunsSPeuTuH3Upoy10JSaWjthRpYU/feN8491Wf7qrCQNE
         E3Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXdb2e5fIaNum9/eUhcG04LOo4F1fshG0eCxKqCfRqyvI/9mGpiSOzdAnAUDiHS6wsabTWI5BlEjRGK2VKZYbQqjGMPlNBuXu4U6fbUTERy
X-Gm-Message-State: AOJu0YxlKNSCZf/W7FyyPG8QFal2xI+pH6yv3kNqkhlSkHKTxm+MRU56
	kHtMJ4gWn2QKKugvuO5gSszuCawUGvq1+ZAnM8DNLYjjUob19yZYF95t2tg5B7A=
X-Google-Smtp-Source: AGHT+IFALljM8hm4oiWBT04Jw0JLiRkkyPDpkUx9yCVH0D1QlIeoTfNU3Xx59AzAW7ujf7brtTm4rA==
X-Received: by 2002:a05:600c:3d93:b0:41a:adc3:f777 with SMTP id 5b1f17b1804b1-41f7130a17bmr26482125e9.16.1715167422759;
        Wed, 08 May 2024 04:23:42 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id o14-20020a05600c4fce00b0041bf685921dsm1992749wmq.0.2024.05.08.04.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:23:41 -0700 (PDT)
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
Subject: [PATCH v2 5/9] mm: Use common huge_pte_clear() function for riscv/arm64
Date: Wed,  8 May 2024 13:18:25 +0200
Message-Id: <20240508111829.16891-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240508111829.16891-1-alexghiti@rivosinc.com>
References: <20240508111829.16891-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_042351_311156_5907174A 
X-CRM114-Status: GOOD (  13.10  )
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
 arch/arm64/mm/hugetlbpage.c      | 12 ------------
 arch/riscv/include/asm/pgtable.h |  5 +++--
 arch/riscv/mm/hugetlbpage.c      | 19 -------------------
 mm/contpte.c                     | 14 ++++++++++++++
 4 files changed, 17 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index b8353b0a273c..cf44837369be 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -277,18 +277,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
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
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 5d1d3a6c7c44..0847a7fb8661 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -644,8 +644,8 @@ static inline void __set_ptes(struct mm_struct *mm, unsigned long addr,
 #define set_contptes(mm, addr, ptep, pte, nr, pgsize)			\
 			__set_ptes(mm, addr, ptep, pte, nr)
 
-static inline void pte_clear(struct mm_struct *mm,
-	unsigned long addr, pte_t *ptep)
+static inline void __pte_clear(struct mm_struct *mm,
+			       unsigned long addr, pte_t *ptep)
 {
 	__set_pte_at(mm, ptep, __pte(0));
 }
@@ -700,6 +700,7 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 #define set_ptes		__set_ptes
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 #define ptep_get_and_clear	__ptep_get_and_clear
+#define pte_clear		__pte_clear
 
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index d8f07aef758b..437b1df059eb 100644
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
-	pte_num = arch_contpte_get_num_contig(ptep, 0, &pgsize);
-	for (i = 0; i < pte_num; i++, addr += pgsize, ptep++)
-		pte_clear(mm, addr, ptep);
-}
-
 static bool is_napot_size(unsigned long size)
 {
 	unsigned long order;
diff --git a/mm/contpte.c b/mm/contpte.c
index 2320ee23478a..22e0de197bd3 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
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
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -102,3 +104,15 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 
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
