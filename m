Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6E8C41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 18:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b1/kTvaeTSIFOwgrjGe4dDxkHNgbDbCNHw+05KSxvdo=; b=s2GBFiCJ19CNIy
	UJaAGWkfHtw4wowAzSmPD6f9xU6M/gbKHz2c6XtD7q+gXaCk3D/juv9yY6C9Zq3h3QeewGclsPnrC
	fuPjB1GTse7HzqXGhIkfRlXmEsTvn8rB1tyyTV+TjmHk0de6oFjHz9AD7GcB3YQZ1hA95hvluIwkA
	k5dHMlrDIOMHFkQEz9vzw0CFxo2PiP8VXtXoqd1/3s/iKfx/VI0oo6aglvJnGyWvUTDzoymde1In8
	74i2uc3kHf3+jehlssCONu55ltOB0XQiJKLLAxTbWH+QWyKaf/mZab9f0+LWyWY+/QBB44gGBs1L8
	V+3HxzkOACX4JEAkDsIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeRL-00F6zi-2x;
	Tue, 19 Dec 2023 18:03:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeRH-00F6wF-1u
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 18:03:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE1B26141D;
	Tue, 19 Dec 2023 18:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48267C433C7;
	Tue, 19 Dec 2023 18:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703009010;
	bh=7HEG7NxaC+hEbKvi6V3ezlMLYmQxX8eFSiY1oLoxI38=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fIZMvRHaWT8zGpNUvDXtLuxxyNtS3fWC3iodCoNDOBXnwEoc+rjvl0JDXiUFsG9JF
	 6g39zjtD2RlRHz83NGBvDZhFP9DCC+xyZFyt+3RESTpahoQOFX42bsSJldjUzDdjj9
	 yLPv1UTkwiTLGP8tz243HzVOxqcWTkvEMmM9JfpeHT5eaT5GmJwY3atxcN7rVSj+6K
	 MuLrMN1qzfxqovVsps8N8LtxMR7kl1Zkg95orsXK4QgvYkfd+e+rZzqpNYxx+fG2Cl
	 Uf048r/vPqCqySf8ci8W/7sQQ9/qvAcl8d1Y/tYdpY5KC4rBLQqt2HdR1BOhpOH6P5
	 PRUU08tc5mcJg==
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
Subject: [PATCH 3/4] riscv: enable MMU_GATHER_RCU_TABLE_FREE for SMP && MMU
Date: Wed, 20 Dec 2023 01:50:45 +0800
Message-Id: <20231219175046.2496-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231219175046.2496-1-jszhang@kernel.org>
References: <20231219175046.2496-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_100331_752536_C6B0D91B 
X-CRM114-Status: GOOD (  14.17  )
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

In order to implement fast gup we need to ensure that the page
table walker is protected from page table pages being freed from
under it.

riscv situation is more complicated than other architectures: some
riscv platforms may use IPI to perform TLB shootdown, for example,
those platforms which support AIA, usually the riscv_ipi_for_rfence is
true on these platforms; some riscv platforms may rely on the SBI to
perform TLB shootdown, usually the riscv_ipi_for_rfence is false on
these platforms. To keep software pagetable walkers safe in this case
we switch to RCU based table free (MMU_GATHER_RCU_TABLE_FREE). See the
comment below 'ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE' in
include/asm-generic/tlb.h for more details.

This patch enables MMU_GATHER_RCU_TABLE_FREE, then use

*tlb_remove_page_ptdesc() for those platforms which use IPI to perform
TLB shootdown;

*tlb_remove_ptdesc() for those platforms which use SBI to perform TLB
shootdown;

Both case mean that disabling interrupts will block the free and
protect the fast gup page walker.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/pgalloc.h | 23 ++++++++++++++++++-----
 arch/riscv/include/asm/tlb.h     | 18 ++++++++++++++++++
 3 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 24c1799e2ec4..d3555173d9f4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -147,6 +147,7 @@ config RISCV
 	select IRQ_FORCED_THREADING
 	select KASAN_VMALLOC if KASAN
 	select LOCK_MM_AND_FIND_VMA
+	select MMU_GATHER_RCU_TABLE_FREE if SMP && MMU
 	select MODULES_USE_ELF_RELA if MODULES
 	select MODULE_SECTIONS if MODULES
 	select OF
diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 3c5e3bd15f46..deaf971253a2 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -102,7 +102,10 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 		struct ptdesc *ptdesc = virt_to_ptdesc(pud);
 
 		pagetable_pud_dtor(ptdesc);
-		tlb_remove_page_ptdesc(tlb, ptdesc);
+		if (riscv_use_ipi_for_rfence())
+			tlb_remove_page_ptdesc(tlb, ptdesc);
+		else
+			tlb_remove_ptdesc(tlb, ptdesc);
 	}
 }
 
@@ -136,8 +139,12 @@ static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
 static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 				  unsigned long addr)
 {
-	if (pgtable_l5_enabled)
-		tlb_remove_page_ptdesc(tlb, virt_to_ptdesc(p4d));
+	if (pgtable_l5_enabled) {
+		if (riscv_use_ipi_for_rfence())
+			tlb_remove_page_ptdesc(tlb, virt_to_ptdesc(p4d));
+		else
+			tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
+	}
 }
 #endif /* __PAGETABLE_PMD_FOLDED */
 
@@ -169,7 +176,10 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
 
 	pagetable_pmd_dtor(ptdesc);
-	tlb_remove_page_ptdesc(tlb, ptdesc);
+	if (riscv_use_ipi_for_rfence())
+		tlb_remove_page_ptdesc(tlb, ptdesc);
+	else
+		tlb_remove_ptdesc(tlb, ptdesc);
 }
 
 #endif /* __PAGETABLE_PMD_FOLDED */
@@ -180,7 +190,10 @@ static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
 	pagetable_pte_dtor(ptdesc);
-	tlb_remove_page_ptdesc(tlb, ptdesc);
+	if (riscv_use_ipi_for_rfence())
+		tlb_remove_page_ptdesc(tlb, ptdesc);
+	else
+		tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif /* CONFIG_MMU */
 
diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
index 1eb5682b2af6..a0b8b853503f 100644
--- a/arch/riscv/include/asm/tlb.h
+++ b/arch/riscv/include/asm/tlb.h
@@ -10,6 +10,24 @@ struct mmu_gather;
 
 static void tlb_flush(struct mmu_gather *tlb);
 
+#ifdef CONFIG_MMU
+#include <linux/swap.h>
+
+/*
+ * While riscv platforms with riscv_ipi_for_rfence as true require an IPI to
+ * perform TLB shootdown, some platforms with riscv_ipi_for_rfence as false use
+ * SBI to perform TLB shootdown. To keep software pagetable walkers safe in this
+ * case we switch to RCU based table free (MMU_GATHER_RCU_TABLE_FREE). See the
+ * comment below 'ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE' in include/asm-generic/tlb.h
+ * for more details.
+ */
+static inline void __tlb_remove_table(void *table)
+{
+	free_page_and_swap_cache(table);
+}
+
+#endif /* CONFIG_MMU */
+
 #define tlb_flush tlb_flush
 #include <asm-generic/tlb.h>
 
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
