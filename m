Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD05CC25B79
	for <linux-riscv@archiver.kernel.org>; Sat, 18 May 2024 07:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMsP0D5fwSCSa72iHDxRpg/hm/A3cG1XDoK25xUv8ys=; b=4jJShcUXOMa4h3
	Jf/buqfFKG2CrEbvaYiKEhTO2Fu70V66LgR75nOxq8DEoP3WvB9RVNtVKfoyIG0OzQE50BXQphNGu
	JRcH+ULmXdSv5ngxh4HyQ3kvIKCtTgBghEFXxgwbCkjMhvH4/m9jm60Fajv7WSJv8HVZtc1yA5L5R
	zmcB1hW7lHdG8Bl8aRywwK0LQXiHmWYOD8Q27Kf8dyEOULKpDvJac4VzImmrh0z/pYLDsl50sNFF9
	i/OfQgk6v7+aODyA+myAiRO0rYfxVcSmJOkzuMfsBAq91hW5WKFnSbu6Xe7Wq5+ZoPyoPxOeMgv8g
	Ka+ZR0KHhhzhxHEFdekw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8ErI-00000009ixe-06F7;
	Sat, 18 May 2024 07:52:00 +0000
Received: from out0-202.mail.aliyun.com ([140.205.0.202])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8ErB-00000009isl-4B3E
	for linux-riscv@lists.infradead.org;
	Sat, 18 May 2024 07:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1716018700; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=B0+VTL/IM0NbM2rCCBStVIPALiltW036NQkMXLbs88g=;
	b=We5K/S5OIGdG+MrG47WBebCXsSCBe/a75ly7D0575o9kGvMQICbur5+KsNjUf6Olno+F1qrsa971Rx6vSwmt1jqhEqK6G8vdr9EOzvRPEcldiIzXI2NI87W19PbDlXmWKVNtqzWR6Ow4yJEYc6TNBtgSs+SwHqz6MLphonRndik=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047190;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.XgA9uMI_1716018696;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XgA9uMI_1716018696)
          by smtp.aliyun-inc.com;
          Sat, 18 May 2024 15:51:37 +0800
From: "Bang Li" <libang.li@antgroup.com>
To: akpm@linux-foundation.org,
	chenhuacai@kernel.org,
	tsbogend@alpha.franken.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com
Cc: <linux-kernel@vger.kernel.org>,
   <linux-mm@kvack.org>,
   <loongarch@lists.linux.dev>,
   <linux-riscv@lists.infradead.org>,
   <david@redhat.com>,
   <ryan.roberts@arm.com>,
   <ioworker0@gmail.com>,
   <libang.linux@gmail.com>,
  "Bang Li" <libang.li@antgroup.com>
Subject: [PATCH v3 2/3] mm: Refactor update_mmu_tlb()
Date: Sat, 18 May 2024 15:49:13 +0800
Message-Id: <20240518074914.52170-3-libang.li@antgroup.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20240518074914.52170-1-libang.li@antgroup.com>
References: <20240518074914.52170-1-libang.li@antgroup.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_005154_186979_325F94EC 
X-CRM114-Status: UNSURE (   7.91  )
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

Remove update_mmu_tlb() from those architectures and define
generically via update_mmu_tlb_range(), removing the ability
for arches to override it.

Signed-off-by: Bang Li <libang.li@antgroup.com>
---
 arch/loongarch/include/asm/pgtable.h |  2 --
 arch/mips/include/asm/pgtable.h      |  2 --
 arch/riscv/include/asm/pgtable.h     |  2 --
 arch/xtensa/include/asm/pgtable.h    |  3 ---
 arch/xtensa/mm/tlb.c                 |  6 ------
 include/linux/pgtable.h              | 11 ++++++++---
 6 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 5ccc2a3a6f7a..161dd6e10479 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -467,8 +467,6 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 #define update_mmu_cache(vma, addr, ptep) \
 	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
 
-#define __HAVE_ARCH_UPDATE_MMU_TLB
-#define update_mmu_tlb	update_mmu_cache
 #define update_mmu_tlb_range(vma, addr, ptep, nr) \
 	update_mmu_cache_range(NULL, vma, addr, ptep, nr)
 
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 0891ad7d43b6..c29a551eb0ca 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -594,8 +594,6 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 #define update_mmu_cache(vma, address, ptep) \
 	update_mmu_cache_range(NULL, vma, address, ptep, 1)
 
-#define	__HAVE_ARCH_UPDATE_MMU_TLB
-#define update_mmu_tlb	update_mmu_cache
 #define update_mmu_tlb_range(vma, address, ptep, nr) \
 	update_mmu_cache_range(NULL, vma, address, ptep, nr)
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index fc07b829ac4a..158170442d2f 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -486,8 +486,6 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 #define update_mmu_cache(vma, addr, ptep) \
 	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
 
-#define __HAVE_ARCH_UPDATE_MMU_TLB
-#define update_mmu_tlb update_mmu_cache
 #define update_mmu_tlb_range(vma, addr, ptep, nr) \
 	update_mmu_cache_range(NULL, vma, addr, ptep, nr)
 
diff --git a/arch/xtensa/include/asm/pgtable.h b/arch/xtensa/include/asm/pgtable.h
index 436158bd9030..1647a7cc3fbf 100644
--- a/arch/xtensa/include/asm/pgtable.h
+++ b/arch/xtensa/include/asm/pgtable.h
@@ -410,9 +410,6 @@ void update_mmu_cache_range(struct vm_fault *vmf, struct vm_area_struct *vma,
 
 typedef pte_t *pte_addr_t;
 
-void update_mmu_tlb(struct vm_area_struct *vma,
-		    unsigned long address, pte_t *ptep);
-#define __HAVE_ARCH_UPDATE_MMU_TLB
 void update_mmu_tlb_range(struct vm_area_struct *vma,
 		unsigned long address, pte_t *ptep, unsigned int nr);
 #define update_mmu_tlb_range update_mmu_tlb_range
diff --git a/arch/xtensa/mm/tlb.c b/arch/xtensa/mm/tlb.c
index 05efba86b870..0a1a815dc796 100644
--- a/arch/xtensa/mm/tlb.c
+++ b/arch/xtensa/mm/tlb.c
@@ -163,12 +163,6 @@ void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
 	}
 }
 
-void update_mmu_tlb(struct vm_area_struct *vma,
-		    unsigned long address, pte_t *ptep)
-{
-	local_flush_tlb_page(vma, address);
-}
-
 void update_mmu_tlb_range(struct vm_area_struct *vma,
 			unsigned long address, pte_t *ptep, unsigned int nr)
 {
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 18019f037bae..117b807e3f89 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -729,13 +729,18 @@ static inline void clear_full_ptes(struct mm_struct *mm, unsigned long addr,
  * fault. This function updates TLB only, do nothing with cache or others.
  * It is the difference with function update_mmu_cache.
  */
-#ifndef __HAVE_ARCH_UPDATE_MMU_TLB
+#ifndef update_mmu_tlb_range
+static inline void update_mmu_tlb_range(struct vm_area_struct *vma,
+				unsigned long address, pte_t *ptep, unsigned int nr)
+{
+}
+#endif
+
 static inline void update_mmu_tlb(struct vm_area_struct *vma,
 				unsigned long address, pte_t *ptep)
 {
+	update_mmu_tlb_range(vma, address, ptep, 1);
 }
-#define __HAVE_ARCH_UPDATE_MMU_TLB
-#endif
 
 /*
  * Some architectures may be able to avoid expensive synchronization
-- 
2.19.1.6.gb485710b


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
