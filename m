Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E012E7718A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 13:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ao4EobLEyJVvmISe2OoaK7jOR/ro0Rn309iC2NsrbuE=; b=J6y/PAmnw+8vEW
	j+24A+Wyuz3PCAycsRqzLAoFza6lfYrwfYoOoUSKD0y5clwm0xyK+MRS1Sxb25km24l/YSy0HOQIK
	SWguaUIWt13tjJYx2K7QvnLBvMIrImLlLKToYPWatYpzl1412gqJ/TNt96l28aRU86pc8FEGoI7ju
	sB+couImHARE/oxzJCQqcVplNMVKZw4N1ASczjyTJLNRwnPlt3PsEDZkAVzgoiRpTSmaiBBY+eAbT
	xzQ7Ztpa2yj9bl3EKarBqA5jLbrk1kUGk9Dyb6kP08ULDADzn++baNfVjYGsDdJbRlPyN5YKNm6Ey
	bekLNtZQg2ZsrMs0kwzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtnI-0000000GgKq-2UbC;
	Wed, 18 Dec 2024 13:08:52 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtkc-0000000Gfcw-2V0D
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 13:06:08 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2164b1f05caso59756285ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2024 05:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734527165; x=1735131965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtLDYyJyRe/cOzqFg0wwVyja+MW3+zRiiWZkoTiwjPI=;
        b=Eej6/PiHnybYl7XFr4hBpZSx9KlJ97BCtUujWFhP1PzMd4wbGkKnWz3IYZBdfK5ZyD
         TgGw5AnpdLDmElt27yYl2sDAHNk9IiPN0R3v27gkrQRl7m8+r9M4xNeCu6cjXc4c29iF
         nNgsRv60DCGaxdF4qastlct6xKP/db9L9PyghFo9L5ulh6lvtVivlamwEcsukyMOjO0D
         6U2eF2rBHpecHCJL1eN1fnpmg6YqjxMtygUmd50pOwHgoi4XVMdZ6iHN2Fm3ZU2iTsn6
         ESuzq6xVXA/t70l6X4OoREbTLjGjkLJhb9whbIWAmCREVfgxOgTb5cYZbfzUHqsBE37u
         2odA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734527165; x=1735131965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtLDYyJyRe/cOzqFg0wwVyja+MW3+zRiiWZkoTiwjPI=;
        b=uec03zlALNqpFB43KJbuFwCsEH2kSeinzsd3QsClzrsh1wQL3z2zc71i/91d2Cj51/
         edI4O3whtVco4Q1F57E+dPDUaymf3/1a1LNtQZqVkmlJxopXHQOUdkMxMCGhJhzy2Dgz
         DKBgkiQ1M8X5k5OF/IE6mVpSfEgVHltafnnnkpJCXAh8STAlE0Q/qI8QozAhYhJyxGVU
         FAzemiwXKxtCKADiGvz0k5yM3aMShKWJlbxfyUngINp6wSi55GsjY8gpGc5KAeY5fbi4
         BtIgsMDlkHVC5dJT4SiRi/vppA9/J78n8Rgzu0CVLhpGDXy3LHTc9r4v4gGLpmaqUo0j
         CO7g==
X-Forwarded-Encrypted: i=1; AJvYcCW5H0ejZnFbWApvr7iZwFS7S0f6xIA3ghxiD0sRMwXMWg2PxFbZvncsBkFX69R4lrlz3AT9+BLl9nhmQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxP3ckIP+qtYHmesKCcz3H303rxLxYeHkxG+r/gnpE6NN8gCgLV
	yoes8+4DKCFVqYOyqhjNBTOrFrFZpJQzuqbiAyhcvJ7l/MLnoLbiMSlx6c6nsYo=
X-Gm-Gg: ASbGncvi49ee62mV2Y5Rv4XvxLPcxaRLCVGvfueZTRnhg8qduEQ6SzRyUY/CnHi0hAD
	csJBOaG28vBwtHkpdlu3ZcWbVobiQYUy45j47MAPmDM2PuPQR+1vyLAVjt9jAqzMz3ip2e/GgYK
	7eKYB1VXKC8s8TZEJuN4oSHmza8UnvJSf43/R61GzgjeFIZzWnn7F4qZIKMUqwgjCRd2qh6QOGj
	0CKuRUdM64EsF47NLAw++NAuiXu2qyCymgSC+50MtbhYu0ly4tn+MaKkVZCiRpXj+iXFmqKhGSd
	KEA+j64Mg+7nKgm3Rw3upw==
X-Google-Smtp-Source: AGHT+IFCnYr+lY/2cKu1iNZU0iqph0CddR5mvkArPJVeCIaobzeDvVooRJFIjfOJ9AL+45aiVbBYIg==
X-Received: by 2002:a17:902:c40d:b0:215:a05d:fb05 with SMTP id d9443c01a7336-218d72161camr43962385ad.32.1734527165431;
        Wed, 18 Dec 2024 05:06:05 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1db755dsm75751825ad.42.2024.12.18.05.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 05:06:04 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 08/15] riscv: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Wed, 18 Dec 2024 21:04:44 +0800
Message-Id: <d52e5fc456e9cbf90ded3b3a1d97cf8d9d17a2e5.1734526570.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734526570.git.zhengqi.arch@bytedance.com>
References: <cover.1734526570.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_050606_634907_A184FC0E 
X-CRM114-Status: GOOD (  13.41  )
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

Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
table pages can be freed together (regardless of whether RCU is used).
This prevents the use-after-free problem where the ptlock is freed
immediately but the page table pages is freed later via RCU.

Page tables shouldn't have swap cache, so use pagetable_free() instead of
free_page_and_swap_cache() to free page table pages.

By the way, move the comment above __tlb_remove_table() to
riscv_tlb_remove_ptdesc(), it will be more appropriate.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/include/asm/pgalloc.h | 38 ++++++++++++++------------------
 arch/riscv/include/asm/tlb.h     | 14 ++++--------
 2 files changed, 21 insertions(+), 31 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 09c2eff571a49..fc50d14010246 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -18,12 +18,22 @@
 #define __HAVE_ARCH_P4D_FREE
 #include <asm-generic/pgalloc.h>
 
+/*
+ * While riscv platforms with riscv_ipi_for_rfence as true require an IPI to
+ * perform TLB shootdown, some platforms with riscv_ipi_for_rfence as false use
+ * SBI to perform TLB shootdown. To keep software pagetable walkers safe in this
+ * case we switch to RCU based table free (MMU_GATHER_RCU_TABLE_FREE). See the
+ * comment below 'ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE' in include/asm-generic/tlb.h
+ * for more details.
+ */
 static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
 {
-	if (riscv_use_sbi_for_rfence())
+	if (riscv_use_sbi_for_rfence()) {
 		tlb_remove_ptdesc(tlb, pt);
-	else
+	} else {
+		pagetable_dtor(pt);
 		tlb_remove_page_ptdesc(tlb, pt);
+	}
 }
 
 static inline void pmd_populate_kernel(struct mm_struct *mm,
@@ -109,12 +119,8 @@ static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 				  unsigned long addr)
 {
-	if (pgtable_l4_enabled) {
-		struct ptdesc *ptdesc = virt_to_ptdesc(pud);
-
-		pagetable_dtor(ptdesc);
-		riscv_tlb_remove_ptdesc(tlb, ptdesc);
-	}
+	if (pgtable_l4_enabled)
+		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
 }
 
 #define p4d_alloc_one p4d_alloc_one
@@ -136,12 +142,8 @@ static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
 static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 				  unsigned long addr)
 {
-	if (pgtable_l5_enabled) {
-		struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
-
-		pagetable_dtor(ptdesc);
+	if (pgtable_l5_enabled)
 		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
-	}
 }
 #endif /* __PAGETABLE_PMD_FOLDED */
 
@@ -170,10 +172,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 				  unsigned long addr)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
-
-	pagetable_dtor(ptdesc);
-	riscv_tlb_remove_ptdesc(tlb, ptdesc);
+	riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(pmd));
 }
 
 #endif /* __PAGETABLE_PMD_FOLDED */
@@ -181,10 +180,7 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 				  unsigned long addr)
 {
-	struct ptdesc *ptdesc = page_ptdesc(pte);
-
-	pagetable_dtor(ptdesc);
-	riscv_tlb_remove_ptdesc(tlb, ptdesc);
+	riscv_tlb_remove_ptdesc(tlb, page_ptdesc(pte));
 }
 #endif /* CONFIG_MMU */
 
diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
index 1f6c38420d8e0..ded8724b3c4f7 100644
--- a/arch/riscv/include/asm/tlb.h
+++ b/arch/riscv/include/asm/tlb.h
@@ -11,19 +11,13 @@ struct mmu_gather;
 static void tlb_flush(struct mmu_gather *tlb);
 
 #ifdef CONFIG_MMU
-#include <linux/swap.h>
 
-/*
- * While riscv platforms with riscv_ipi_for_rfence as true require an IPI to
- * perform TLB shootdown, some platforms with riscv_ipi_for_rfence as false use
- * SBI to perform TLB shootdown. To keep software pagetable walkers safe in this
- * case we switch to RCU based table free (MMU_GATHER_RCU_TABLE_FREE). See the
- * comment below 'ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE' in include/asm-generic/tlb.h
- * for more details.
- */
 static inline void __tlb_remove_table(void *table)
 {
-	free_page_and_swap_cache(table);
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #endif /* CONFIG_MMU */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
