Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65262C46CCD
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 18:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D/xnvFeAJJuY376s5vQOO5bHFiTeN9Gw3nlp9V3pXxg=; b=hK8mZ6qijCd3e/
	A5Pg1n9gcvGyHChk0y3BSxnLILssDneQ9ouZ+wqn/yBHOSOC3Dm667wF4+GB5pD9DO1OPxCpt+myl
	PPlnrvvAtBJt7ng6C/r6kBjkkCA/ROnzns/t3WDYZ3wMwCSbrvWArPUPpssXEiYZ3WMl0Ue0vg2p0
	3JShUpHDCExEqRIZe/BIeWTd4HAN4A5I9cHQ2+QrdnCJi3yBjOXGp2RXIrdsWCePYPSQ7iki9cDGA
	dPKkuQSSkGq7cyLOYI02Zd61rf9HmaBaQglQQG0WJp6bTd/FIWCH6NO9rn9R9bU+LyHWUUdnaApkt
	TcJsDmH497bVij+k/8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeRH-00F6wH-1D;
	Tue, 19 Dec 2023 18:03:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeRD-00F6to-22
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 18:03:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 03F7BCE1AA9;
	Tue, 19 Dec 2023 18:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62CDC433C9;
	Tue, 19 Dec 2023 18:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703009005;
	bh=39JAuH598M6uo4CmVtLFeafqNHIttPmqjwfQDvfhOjs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NZ+HplTEbztnxahsANz3uYQlJxV91QZtNCH9i3pK9wbRFkjwTt4VzJXgiEfG1XQyS
	 BXqJkmD+ZuHI3pJbq7hpWh4FazAdi4Y3yKeIPf67IpkIahu9t2PTGodx/3z22CFrV7
	 m+cNydw6UBPt2db6BACnS7usZ86CqOzEjfRnK1vUXTwLBuz8h9WArwgkfMCsadNvpZ
	 ADKvoV3VZLzOxA8w0qKo27CtkfmEvEQi0IGRe7dYSov3cTESJzZ5pYlOHNLP8W51Mp
	 QrorLyrRGypL6qE5j1GbuY+013Qauw6noSlblzldFoZ80Yl2nqBBjJIFW2VycqEPjS
	 p8/QIHPpMR03g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 1/4] riscv: tlb: fix __p*d_free_tlb()
Date: Wed, 20 Dec 2023 01:50:43 +0800
Message-Id: <20231219175046.2496-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231219175046.2496-1-jszhang@kernel.org>
References: <20231219175046.2496-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_100327_839437_21565832 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

If non-leaf PTEs I.E pmd, pud or p4d is modified, a sfence.vma is
a must for safe, imagine if an implementation caches the non-leaf
translation in TLB, although I didn't meet this HW so far, but it's
possible in theory.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/pgalloc.h | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index d169a4f41a2e..a12fb83fa1f5 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -95,7 +95,13 @@ static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 		__pud_free(mm, pud);
 }
 
-#define __pud_free_tlb(tlb, pud, addr)  pud_free((tlb)->mm, pud)
+#define __pud_free_tlb(tlb, pud, addr)					\
+do {									\
+	if (pgtable_l4_enabled) {					\
+		pagetable_pud_dtor(virt_to_ptdesc(pud));		\
+		tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pud));	\
+	}								\
+} while (0)
 
 #define p4d_alloc_one p4d_alloc_one
 static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
@@ -124,7 +130,11 @@ static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
 		__p4d_free(mm, p4d);
 }
 
-#define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
+#define __p4d_free_tlb(tlb, p4d, addr)					\
+do {									\
+	if (pgtable_l5_enabled)						\
+		tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(p4d));	\
+} while (0)
 #endif /* __PAGETABLE_PMD_FOLDED */
 
 static inline void sync_kernel_mappings(pgd_t *pgd)
@@ -149,7 +159,11 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #ifndef __PAGETABLE_PMD_FOLDED
 
-#define __pmd_free_tlb(tlb, pmd, addr)  pmd_free((tlb)->mm, pmd)
+#define __pmd_free_tlb(tlb, pmd, addr)				\
+do {								\
+	pagetable_pmd_dtor(virt_to_ptdesc(pmd));		\
+	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
+} while (0)
 
 #endif /* __PAGETABLE_PMD_FOLDED */
 
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
