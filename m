Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97C1C021B2
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 03:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n6Ma2NJFcwkJSyzO/jsiEkvQwg4LtNIQ62pTriW3vkw=; b=DOe/67u31rKvPe
	MaeRS58CEYXThp66+iMUoVWVyFn/hg8cKaEP+EMk7Yaf6d8F2NPFI5zG3TJny8USseCu5bCtyxs6H
	ta7F5fbCEntkS3iOGgOBtP33JZnrusOtoV9OF+gfqOoq+S0jW1oVwN10gisH2QPEYQXM8L0V95ytF
	nKCsnUwIFSQNE9mKZE1mUPGb+gT2lNwpl0yMLCzi5MvPruzKzLh0ZxqRaxCs+Gw0+LVvjkRaURydB
	77SW5CbzwScXwLMy4tIhJ7m8Adw9Pkhpx5AU5sNz1AqLA0n1w15QbZ8rKVB2Fq2o1l19Gw/IcDHbh
	kt2xmonjHDkesioP0LFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmluP-0000000Ftl9-3ADT;
	Tue, 25 Feb 2025 03:47:01 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmluN-0000000Ftj9-1lrO
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 03:47:00 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22185cddbffso103440115ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 19:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455219; x=1741060019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIKiL/cvy76O78IwclMxfA3FUb4EAj4nzgq2isZtk2Q=;
        b=NXZ3oyUFlSHCtlRjPH9GogX5hscGHDUbWpSJgYn9AQ7KalLUlZM/W16It4djF+fky1
         cr52ZI+I5xbujCc2SoPahNY0SiljcvY1HxESqq2HwhwOhKtHIM2udR7Z7F5ndbgM3P67
         atZTT+3pl8aCwexdGgHyH4m4tiq6ldWhwHKcC+G+Srz4r75GlFn/3blw/5S8d6qW6zaP
         7qG9cNgKD+1v26LClDwjDF/PRjVwe2CWXF9gIEDTMlMakoOV9LCod0V6gDVHFou8FSZr
         ePaVSHafNrgyoQnw7hE/U3s85u+FNk/GwUp0ntJgzXcMB+h7YaZghwbmIrNT4e52w28v
         wFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455219; x=1741060019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIKiL/cvy76O78IwclMxfA3FUb4EAj4nzgq2isZtk2Q=;
        b=P9fxBuBdwpeRPbZAkoCdU0bGIc81gtRlSAT+IWYsofcj2vxLrxgzVdOZ/sMC76zZtT
         ivAuCA4DaQJsN/jVlsKVtIGhNI6qmftwUHcLb9WpzWvzksVH8uPL9KzUMeYB/2s4Tvbu
         Um6eAgWZYuBsmZKBK4Yrs8roLFS+lSjyC9hLyeDM8/KurQBOpbNPulHre2ZNsOps73cL
         ++3XznZbiItM3DyoYr/iY2IfGIj4MOVttuyEKiJSAx85AT3sO1IKP/eXulXUho086ei/
         4iWgFBYZ9ByzRZ5ktezlHoe8YJ+RXVmQorAyNX2/R3u6c/eaF4oW75xl9/XVEnXbt97d
         vr6w==
X-Forwarded-Encrypted: i=1; AJvYcCVzxNn5kA+KcgPcxpZFjgM005Katg68Hia302ZxFF/1y1Ropwpp9WAo0eKNllneDXkLZax/umytEn4+eQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3OFiUlt6g94idOefB3M76SQygu0i+/wX9+qW6Of0nX/hZwuAv
	vThoFBP4gP8EiDYXiFuz+JfeDIA1eWLNAHhAsu3R1jTaCcYKNRy8C48x712OjPQ=
X-Gm-Gg: ASbGncsN1IwOxE+AF8YLyBIfv7f827yVwtFeERWNlRt/joUJp3xiUm91W3meiX3arCE
	Xyc0vX25FahA+IcVwK4AOy1Fv7nY/CfldFLPKK/uWzU/BlEjG2MDjI2K9tE4M9a0RDJV+rmLnZR
	LYsB2EwHRoCauA7mSuBMVVZw1JC8ukR7mv6ljsk1QerOSTWA23itlloPye/RpeatwtD7JnMjs9q
	M4vueCgjd5rYXIBQwFgOQweWmBjsFqRkHMoqG8Y+T739FP2FUcaOzuCcOoDUsPkjyZtIRlyhlgD
	itgOwEPkuR2/dztWUx4AUEYAZOIfPU95CSi4ANVC0Z163v5H9hQdqVFqZzgRDMFZQw==
X-Google-Smtp-Source: AGHT+IGrbcobmtkudsLXXtQABX/QCxCZukDHXrGqT8EvNNCQnozfEzflYDWPRR+Q4O9sUaua1jgg6Q==
X-Received: by 2002:a05:6a00:3cd5:b0:725:41c4:dbc7 with SMTP id d2e1a72fcca58-73425b7fd45mr26417726b3a.4.1740455218800;
        Mon, 24 Feb 2025 19:46:58 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:46:58 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	kevin.brodsky@arm.com,
	riel@surriel.com,
	vishal.moola@gmail.com,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	willy@infradead.org,
	yuzhao@google.com,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 4/6] riscv: pgtable: unconditionally use tlb_remove_ptdesc()
Date: Tue, 25 Feb 2025 11:45:54 +0800
Message-Id: <9025595e895515515c95e48db54b29afa489c41d.1740454179.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1740454179.git.zhengqi.arch@bytedance.com>
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_194659_464062_77221851 
X-CRM114-Status: GOOD (  16.03  )
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

To support fast gup, the commit 69be3fb111e7 ("riscv: enable
MMU_GATHER_RCU_TABLE_FREE for SMP && MMU") did the following:

1) use tlb_remove_page_ptdesc() for those platforms which use IPI to
   perform TLB shootdown

2) use tlb_remove_ptdesc() for those platforms which use SBI to perform
   TLB shootdown

The tlb_remove_page_ptdesc() is the wrapper of the tlb_remove_page(). By
design, the tlb_remove_page() should be used to remove a normal page from
a page table entry, and should not be used for page table pages.

The tlb_remove_ptdesc() is the wrapper of the tlb_remove_table(), which is
designed specifically for freeing page table pages. If the
CONFIG_MMU_GATHER_TABLE_FREE is enabled, the tlb_remove_table() will use
semi RCU to free page table pages, that is:

 - batch table freeing: asynchronous free by RCU
 - single table freeing: IPI + synchronous free

If the CONFIG_MMU_GATHER_TABLE_FREE is disabled, the tlb_remove_table()
will fall back to pagetable_dtor() + tlb_remove_page().

For case 1), since we need to perform TLB shootdown before freeing the
page table page, the local_irq_save() in fast gup can block the freeing
and protect the fast gup page walker. Therefore we can ensure safety by
just using tlb_remove_page_ptdesc(). In addition, we can also the
tlb_remove_ptdesc()/tlb_remove_table() to achieve it, and it doesn't
matter whether CONFIG_MMU_GATHER_RCU_TABLE_FREE is selected. And in
theory, the performance of freeing pages asynchronously via RCU will not
be lower than synchronous free.

For case 2), since local_irq_save() only disable S-privilege IPI irq but
not M-privilege's, which is used by the SBI implementation to perform TLB
shootdown, so we must select CONFIG_MMU_GATHER_RCU_TABLE_FREE and use
tlb_remove_ptdesc() to ensure safety. The riscv selects this config for
SMP && MMU, the CONFIG_RISCV_SBI is dependent on MMU. Therefore, only the
UP system may have the situation where CONFIG_MMU_GATHER_RCU_TABLE_FREE is
disabled but CONFIG_RISCV_SBI is enabled. But there is no freeing vs fast
gup race in the UP system.

So, in summary, we can use tlb_remove_ptdesc() to support fast gup in all
cases, and this interface is specifically designed for page table pages.
So let's use it unconditionally.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/riscv/include/asm/pgalloc.h | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 3e2aebea6312d..770ce18a7328b 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -15,24 +15,6 @@
 #define __HAVE_ARCH_PUD_FREE
 #include <asm-generic/pgalloc.h>
 
-/*
- * While riscv platforms with riscv_ipi_for_rfence as true require an IPI to
- * perform TLB shootdown, some platforms with riscv_ipi_for_rfence as false use
- * SBI to perform TLB shootdown. To keep software pagetable walkers safe in this
- * case we switch to RCU based table free (MMU_GATHER_RCU_TABLE_FREE). See the
- * comment below 'ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE' in include/asm-generic/tlb.h
- * for more details.
- */
-static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
-{
-	if (riscv_use_sbi_for_rfence()) {
-		tlb_remove_ptdesc(tlb, pt);
-	} else {
-		pagetable_dtor(pt);
-		tlb_remove_page_ptdesc(tlb, pt);
-	}
-}
-
 static inline void pmd_populate_kernel(struct mm_struct *mm,
 	pmd_t *pmd, pte_t *pte)
 {
@@ -108,14 +90,14 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 				  unsigned long addr)
 {
 	if (pgtable_l4_enabled)
-		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
+		tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
 }
 
 static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 				  unsigned long addr)
 {
 	if (pgtable_l5_enabled)
-		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
+		tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
 }
 #endif /* __PAGETABLE_PMD_FOLDED */
 
@@ -143,7 +125,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 				  unsigned long addr)
 {
-	riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(pmd));
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pmd));
 }
 
 #endif /* __PAGETABLE_PMD_FOLDED */
@@ -151,7 +133,7 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 				  unsigned long addr)
 {
-	riscv_tlb_remove_ptdesc(tlb, page_ptdesc(pte));
+	tlb_remove_ptdesc(tlb, page_ptdesc(pte));
 }
 #endif /* CONFIG_MMU */
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
