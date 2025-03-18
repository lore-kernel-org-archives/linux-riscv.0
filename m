Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E298FC35FF9
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 04:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SmjxGscVDcX7xDChu3Asd5VPBIahKIPSFy1bnJRj6o=; b=JMSoWcOYqob4xY
	xUOj+uXIFYeLDlzipg1srcBbeTlwdOhp1ipx1W07a4BDhApLfJpLwrTO8UbTixv7/Lt//vXYveTrA
	OIlbBLMkJInUglIIFrIy6pq+UQl+JcJ1+RnHClVqVCvTRtS67XeTcmd98y4PpPG8IS7YXw4zDPrum
	7orrKQeIjpOnpqglnNn08P+MzJknAUppVJI4MRVov9v8JAFxAfETBW0VOkwKJ5KDNRbhGWlZPr1Xb
	tdRYFTjUxTxRFZJKAJjGIaFyH8p8EIQyL+qy+Rucx21NSN/2bpLDy51GCupukof6FGQEeMPSpZ/3x
	rFYzE0qBZfyfePeq9qew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuOEb-00000004bVc-0SWR;
	Tue, 18 Mar 2025 04:07:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuO7P-00000004aeQ-47um
	for linux-riscv@bombadil.infradead.org;
	Tue, 18 Mar 2025 03:59:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4RzuTPLpNm7preMNxFl4olDUAY05FyWZH15sy7wmcR0=; b=dxkCF8Bj5wHPYA6OWQUh+6cJoW
	tb2PMgsh1pQ2/GyIXX9FzXPr2GEdB9gn9mB3j+9IJ8OiJs7QIaj5dT1OGYhx8LA5FkIN37ckmFfX0
	PB3iRKTrHqXD+3sElrNmbVQQcdBzC7sOru2O9dqVcwMs6GznqwHS9Wwi7QAEkTshEyx8VdOuNy8mY
	BPCHxbX4uB6Kx/ycGbrQTfVif9JJ1IFTru1ZDFn7db1S7oYt2LNtg4D+/bKkvDTVk7mXVhlL4gxNf
	aztNLJojMcghwURok5BqfqeMwxj2YSEJPHa8K1U/38CTehJ5MJRtQ149/GCWAvZZZ327k9XZvwQBG
	o4Kautvw==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuO7N-00000003eWN-0abm
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 03:59:54 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-225477548e1so88691265ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 20:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1742270390; x=1742875190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RzuTPLpNm7preMNxFl4olDUAY05FyWZH15sy7wmcR0=;
        b=Bl28ouiV9ytQPqTGNSPrneWAUq7YVM9ldu+3OiUHpLvD8v9B+s3ys1AyrCHuPxUDeS
         5aqP9UxfRSYLkwxv+IEV45Pws9laFTmO9drHkCHzihjB2GVAVnB5Q3Hc+QMqPr7m8ehx
         h/TnsCSKAV8toWLoV4FbCKo33dzN6TIik0DPN/Pb0C2j8okAG2EbWM7JusAJExG3cWqx
         TwfCLI2x7d3DH+htTPTMUOIsSTheMTOnKlRiHe4wgU075sK4RkJrBhjgyQZBjSFWENuU
         FVfHXvmvcsMMDCVSfbEQsFywzln8airlLn8kXfNK7fVAxLCyUm5wBcm3pD9o3Ltumb7a
         eDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742270390; x=1742875190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RzuTPLpNm7preMNxFl4olDUAY05FyWZH15sy7wmcR0=;
        b=bYPgzP9ZFk7Q5RnEH2fyVpz5SVbCQ3Tvm2srR5+KKCGSEMFbbfpgjN8DNHdtbk5WBc
         G8jqi0MOX5Qu5HY5GoOFrwEmpNCCcem+P6/ZYcAfYZnTGAGuVnhNenk2Bw2DrAorjfu0
         NsVFo6L77Plh0u885ghtWiN93USK0nP8lyXn82ZiDkH1ePfO71a8jdJKsV4+umMcYcXb
         28ifxOuBw5NLyHMpNn9Efy8UrXb2jdjKPMraKuIAmQQ+aRlOAdye1xLhnrCQCYxG795v
         wzcMbyiZEA5dhlwaIOu/TuFT0tEueCqRJmvcD9uiZ/9LJnr9XmNtLwqh8TotkICFiHZd
         zqng==
X-Forwarded-Encrypted: i=1; AJvYcCWmS6S0fPY2urD1awCW1t7/MKf2Qtjza5EVLqz9ZVLI49cannObegnRMrbpQKYW4n1Yt2hAVgoM8cUIaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoQaV8eZm4YRIViDAkYj7eLsJ/LYzKMsdTbgtW6gIFfns96s2k
	b5OFCyKbMAIbk83OvcMblmyU+ftac2024J/FaydYXMzdENrs267HqcvyuIhBejaD6ji4Bvf+oyv
	1EP8=
X-Gm-Gg: ASbGnctxDyQL6jzKrA2XQ6ryeCce2v3UZAy3KWQVXU6IIlpMREsDhp9bPDkoc0IeBhZ
	Guzlb8TTL2Ni64Y36T8jcFda7wMaq1ioXsydY+JkW+ex/0bUTmUVu6BbWbrcMvyY1XIa5tnw9/S
	CG9rNbSsIZzaKc63nxfZewsxpKcWuP9A4S8pi/bUiTv5Pe7GWEpKqGjIgri3Y+DYClTSJFhs5M1
	w8Z7H6BZbxAU+InCeM+jnlsa9tSz90hvXsNlHjozCWtcRYrAZrRzUPpf7opvseMH/vOQb/OuMZ9
	zz14IbU5V3TI1FIkBCy3pBLDKNz19oP0SIZGdQqpbsmFOkxkWrUMLywxue0kHyVekDe752zoupp
	aK5oEciY0tnIzjBErNVmjbKAP+7U=
X-Google-Smtp-Source: AGHT+IFE368rAoYFIO0lZVoCVYA7ODibd0bQTYRx4G4UreI6PSfoC7ExcjehLoXI4QO5c2ehzPanCg==
X-Received: by 2002:a17:902:e886:b0:211:e812:3948 with SMTP id d9443c01a7336-225e08597f2mr204021375ad.0.1742270390531;
        Mon, 17 Mar 2025 20:59:50 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4b30sm83720135ad.235.2025.03.17.20.59.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Mar 2025 20:59:49 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: akpm@linux-foundation.org,
	jhubbard@nvidia.com,
	kirill.shutemov@linux.intel.com,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH RESEND v2 2/4] iommu/riscv: Use pte_t to represent page table entry
Date: Tue, 18 Mar 2025 11:59:28 +0800
Message-Id: <20250318035930.11855-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250318035930.11855-1-luxu.kernel@bytedance.com>
References: <20250318035930.11855-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_035953_303081_F170F8F6 
X-CRM114-Status: GOOD (  15.43  )
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

Since RISC-V IOMMU has the same pte format and translation process with
MMU as is specified in RISC-V Privileged specification, we use pte_t to
represent IOMMU pte too to reuse existing pte operation functions.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 drivers/iommu/riscv/iommu.c | 79 ++++++++++++++++++-------------------
 1 file changed, 39 insertions(+), 40 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 8f049d4a0e2cb..3b0c934decd08 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -812,7 +812,7 @@ struct riscv_iommu_domain {
 	bool amo_enabled;
 	int numa_node;
 	unsigned int pgd_mode;
-	unsigned long *pgd_root;
+	pte_t *pgd_root;
 };
 
 #define iommu_domain_to_riscv(iommu_domain) \
@@ -1081,27 +1081,29 @@ static void riscv_iommu_iotlb_sync(struct iommu_domain *iommu_domain,
 
 #define PT_SHIFT (PAGE_SHIFT - ilog2(sizeof(pte_t)))
 
-#define _io_pte_present(pte)	((pte) & (_PAGE_PRESENT | _PAGE_PROT_NONE))
-#define _io_pte_leaf(pte)	((pte) & _PAGE_LEAF)
-#define _io_pte_none(pte)	((pte) == 0)
-#define _io_pte_entry(pn, prot)	((_PAGE_PFN_MASK & ((pn) << _PAGE_PFN_SHIFT)) | (prot))
+#define _io_pte_present(pte)	(pte_val(pte) & (_PAGE_PRESENT | _PAGE_PROT_NONE))
+#define _io_pte_leaf(pte)	(pte_val(pte) & _PAGE_LEAF)
+#define _io_pte_none(pte)	(pte_val(pte) == 0)
+#define _io_pte_entry(pn, prot)	(__pte((_PAGE_PFN_MASK & ((pn) << _PAGE_PFN_SHIFT)) | (prot)))
 
 static void riscv_iommu_pte_free(struct riscv_iommu_domain *domain,
-				 unsigned long pte, struct list_head *freelist)
+				 pte_t pte, struct list_head *freelist)
 {
-	unsigned long *ptr;
+	pte_t *ptr;
 	int i;
 
 	if (!_io_pte_present(pte) || _io_pte_leaf(pte))
 		return;
 
-	ptr = (unsigned long *)pfn_to_virt(__page_val_to_pfn(pte));
+	ptr = (pte_t *)pfn_to_virt(pte_pfn(pte));
 
 	/* Recursively free all sub page table pages */
 	for (i = 0; i < PTRS_PER_PTE; i++) {
-		pte = READ_ONCE(ptr[i]);
-		if (!_io_pte_none(pte) && cmpxchg_relaxed(ptr + i, pte, 0) == pte)
+		pte = ptr[i];
+		if (!_io_pte_none(pte)) {
+			ptr[i] = __pte(0);
 			riscv_iommu_pte_free(domain, pte, freelist);
+		}
 	}
 
 	if (freelist)
@@ -1110,12 +1112,12 @@ static void riscv_iommu_pte_free(struct riscv_iommu_domain *domain,
 		iommu_free_page(ptr);
 }
 
-static unsigned long *riscv_iommu_pte_alloc(struct riscv_iommu_domain *domain,
-					    unsigned long iova, size_t pgsize,
-					    gfp_t gfp)
+static pte_t *riscv_iommu_pte_alloc(struct riscv_iommu_domain *domain,
+				    unsigned long iova, size_t pgsize,
+				    gfp_t gfp)
 {
-	unsigned long *ptr = domain->pgd_root;
-	unsigned long pte, old;
+	pte_t *ptr = domain->pgd_root;
+	pte_t pte, old;
 	int level = domain->pgd_mode - RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV39 + 2;
 	void *addr;
 
@@ -1131,7 +1133,7 @@ static unsigned long *riscv_iommu_pte_alloc(struct riscv_iommu_domain *domain,
 		if (((size_t)1 << shift) == pgsize)
 			return ptr;
 pte_retry:
-		pte = READ_ONCE(*ptr);
+		pte = ptep_get(ptr);
 		/*
 		 * This is very likely incorrect as we should not be adding
 		 * new mapping with smaller granularity on top
@@ -1147,38 +1149,37 @@ static unsigned long *riscv_iommu_pte_alloc(struct riscv_iommu_domain *domain,
 			addr = iommu_alloc_page_node(domain->numa_node, gfp);
 			if (!addr)
 				return NULL;
-			old = pte;
-			pte = _io_pte_entry(virt_to_pfn(addr), _PAGE_TABLE);
-			if (cmpxchg_relaxed(ptr, old, pte) != old) {
-				iommu_free_page(addr);
+			old = ptep_get(ptr);
+			if (!_io_pte_none(old))
 				goto pte_retry;
-			}
+			pte = _io_pte_entry(virt_to_pfn(addr), _PAGE_TABLE);
+			set_pte(ptr, pte);
 		}
-		ptr = (unsigned long *)pfn_to_virt(__page_val_to_pfn(pte));
+		ptr = (pte_t *)pfn_to_virt(pte_pfn(pte));
 	} while (level-- > 0);
 
 	return NULL;
 }
 
-static unsigned long *riscv_iommu_pte_fetch(struct riscv_iommu_domain *domain,
-					    unsigned long iova, size_t *pte_pgsize)
+static pte_t *riscv_iommu_pte_fetch(struct riscv_iommu_domain *domain,
+				    unsigned long iova, size_t *pte_pgsize)
 {
-	unsigned long *ptr = domain->pgd_root;
-	unsigned long pte;
+	pte_t *ptr = domain->pgd_root;
+	pte_t pte;
 	int level = domain->pgd_mode - RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV39 + 2;
 
 	do {
 		const int shift = PAGE_SHIFT + PT_SHIFT * level;
 
 		ptr += ((iova >> shift) & (PTRS_PER_PTE - 1));
-		pte = READ_ONCE(*ptr);
+		pte = ptep_get(ptr);
 		if (_io_pte_present(pte) && _io_pte_leaf(pte)) {
 			*pte_pgsize = (size_t)1 << shift;
 			return ptr;
 		}
 		if (_io_pte_none(pte))
 			return NULL;
-		ptr = (unsigned long *)pfn_to_virt(__page_val_to_pfn(pte));
+		ptr = (pte_t *)pfn_to_virt(pte_pfn(pte));
 	} while (level-- > 0);
 
 	return NULL;
@@ -1191,8 +1192,9 @@ static int riscv_iommu_map_pages(struct iommu_domain *iommu_domain,
 {
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	size_t size = 0;
-	unsigned long *ptr;
-	unsigned long pte, old, pte_prot;
+	pte_t *ptr;
+	pte_t pte, old;
+	unsigned long pte_prot;
 	int rc = 0;
 	LIST_HEAD(freelist);
 
@@ -1210,10 +1212,9 @@ static int riscv_iommu_map_pages(struct iommu_domain *iommu_domain,
 			break;
 		}
 
-		old = READ_ONCE(*ptr);
+		old = ptep_get(ptr);
 		pte = _io_pte_entry(phys_to_pfn(phys), pte_prot);
-		if (cmpxchg_relaxed(ptr, old, pte) != old)
-			continue;
+		set_pte(ptr, pte);
 
 		riscv_iommu_pte_free(domain, old, &freelist);
 
@@ -1247,7 +1248,7 @@ static size_t riscv_iommu_unmap_pages(struct iommu_domain *iommu_domain,
 {
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	size_t size = pgcount << __ffs(pgsize);
-	unsigned long *ptr, old;
+	pte_t *ptr;
 	size_t unmapped = 0;
 	size_t pte_size;
 
@@ -1260,9 +1261,7 @@ static size_t riscv_iommu_unmap_pages(struct iommu_domain *iommu_domain,
 		if (iova & (pte_size - 1))
 			return unmapped;
 
-		old = READ_ONCE(*ptr);
-		if (cmpxchg_relaxed(ptr, old, 0) != old)
-			continue;
+		set_pte(ptr, __pte(0));
 
 		iommu_iotlb_gather_add_page(&domain->domain, gather, iova,
 					    pte_size);
@@ -1279,13 +1278,13 @@ static phys_addr_t riscv_iommu_iova_to_phys(struct iommu_domain *iommu_domain,
 {
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	size_t pte_size;
-	unsigned long *ptr;
+	pte_t *ptr;
 
 	ptr = riscv_iommu_pte_fetch(domain, iova, &pte_size);
-	if (_io_pte_none(*ptr) || !_io_pte_present(*ptr))
+	if (_io_pte_none(ptep_get(ptr)) || !_io_pte_present(ptep_get(ptr)))
 		return 0;
 
-	return pfn_to_phys(__page_val_to_pfn(*ptr)) | (iova & (pte_size - 1));
+	return pfn_to_phys(pte_pfn(ptep_get(ptr))) | (iova & (pte_size - 1));
 }
 
 static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
