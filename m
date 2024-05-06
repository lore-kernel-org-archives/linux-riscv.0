Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C922FC10F16
	for <linux-riscv@archiver.kernel.org>; Mon,  6 May 2024 15:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvWK8C3bMA2FjgW23Jueaz7p2V/mBvYYroDQmRwJiIs=; b=yFCqFXcuCym35b
	vy3rfxSR+crkIF6zXt8JdInnPLWqhNetbYYGEJHiZ8GbTjoCTAAxEl8I4GviU3lTWX4Yt5cQPsg3O
	O9G/I13ipSJA95UKa8evbKeUuje2KKz6+ffpu2utOtQTBh0pAOdVjWekMDFh54um/IL9hJuM27aqC
	mgZ2gtVyX3Ghvfisyzb3TgH/lSGuj8a7K7xHZbLdbAaJbo5UT4KxtaFA99lv+s4Q1Y+g80Ho7HEww
	IFXsO+jJFzIk9X5jXENegti8fEa79VXkEod3iZBxjAX9Cv/TrDBvg49uprcrXSGRDDV4RIEmNZAIx
	7v1K4b5z4dn92s8XyvPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s40dg-00000007wGe-2auW;
	Mon, 06 May 2024 15:52:28 +0000
Received: from out0-203.mail.aliyun.com ([140.205.0.203])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s40dV-00000007w7z-2j1I
	for linux-riscv@lists.infradead.org;
	Mon, 06 May 2024 15:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1715010735; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=ymFvshx88TI9/EMP30aaqBdjrnITBbXYS6oOftHtOBQ=;
	b=oXToSApPtEK9/1viMmKccAM5oIJpOu3dmjnJ1wrczceq4v1GYkc7XdifB0OOObrZSMHpe8AD+5Ug1rXTW9UFKqMf6r775GTXetIlCw500KFpZMrrFtasDTp/7zCDiwn40XtyIYn24T+Sj7TZB6eMiWbnCbIXrSLEiPiPjDuHd3Q=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047198;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.XTf7qIH_1715010729;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XTf7qIH_1715010729)
          by smtp.aliyun-inc.com;
          Mon, 06 May 2024 23:52:10 +0800
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
Subject: [PATCH v2 5/5] mm: Add update_mmu_tlb_range()
Date: Mon, 06 May 2024 23:51:20 +0800
Message-Id: <20240506155120.83105-6-libang.li@antgroup.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20240506155120.83105-1-libang.li@antgroup.com>
References: <20240506155120.83105-1-libang.li@antgroup.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_085218_271933_08DE7807 
X-CRM114-Status: GOOD (  11.20  )
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

After the commit 19eaf44954df ("mm: thp: support allocation of anonymous
multi-size THP"), it may need to batch update tlb of an address range
through the update_mmu_tlb function. We can simplify this operation by
adding the update_mmu_tlb_range function, which may also reduce the
execution of some unnecessary code in some architectures.

Signed-off-by: Bang Li <libang.li@antgroup.com>
---
 include/linux/pgtable.h | 8 ++++++++
 mm/memory.c             | 4 +---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 18019f037bae..869bfe6054f1 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -737,6 +737,14 @@ static inline void update_mmu_tlb(struct vm_area_struct *vma,
 #define __HAVE_ARCH_UPDATE_MMU_TLB
 #endif
 
+#ifndef __HAVE_ARCH_UPDATE_MMU_TLB_RANGE
+static inline void update_mmu_tlb_range(struct vm_area_struct *vma,
+				unsigned long address, pte_t *ptep, unsigned int nr)
+{
+}
+#define __HAVE_ARCH_UPDATE_MMU_TLB_RANGE
+#endif
+
 /*
  * Some architectures may be able to avoid expensive synchronization
  * primitives when modifications are made to PTE's which are already
diff --git a/mm/memory.c b/mm/memory.c
index eea6e4984eae..2d53e29cf76e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4421,7 +4421,6 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	vm_fault_t ret = 0;
 	int nr_pages = 1;
 	pte_t entry;
-	int i;
 
 	/* File mapping without ->vm_ops ? */
 	if (vma->vm_flags & VM_SHARED)
@@ -4491,8 +4490,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 		update_mmu_tlb(vma, addr, vmf->pte);
 		goto release;
 	} else if (nr_pages > 1 && !pte_range_none(vmf->pte, nr_pages)) {
-		for (i = 0; i < nr_pages; i++)
-			update_mmu_tlb(vma, addr + PAGE_SIZE * i, vmf->pte + i);
+		update_mmu_tlb_range(vma, addr, vmf->pte, nr_pages);
 		goto release;
 	}
 
-- 
2.19.1.6.gb485710b


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
