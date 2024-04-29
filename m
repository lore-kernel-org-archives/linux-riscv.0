Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37478C04FFE
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 10:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kf0soOSUGaxrrmMczZuSZKlAJZUmCSi5uqkrngi6Qkk=; b=eof+PB4AnHtepG
	5fGHCG8vEyQHa7r90IaOWED0BowWAfDyM8qurFcKebc7OEQ03xto4d8SERhwJR6/3lPkhfTR+OcRQ
	xHbGANWsFGppoDvvLT0vB2UBeJo3tAQ9mw1hV3AgTjS9Khn/tWoNqXmId20O8snCADUxIQtICkGB7
	NsXEZRcYOedl6//SPP2aeyjAaxcYT1YHAwxvnfJs+vdYgm/j/LyfG1yDRQg4AaFyoFmgTjpXkaAjL
	C7lvJyA4QMLfgTLVS5lyJPUg0pE9QnoHq/lf7O+KA8CWFmUQqLTapEwtzHFxZtAmMxBo6FbCI0Y9C
	INcz7MxRVdfLq18snaeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ON7-00000002Ief-0NgN;
	Mon, 29 Apr 2024 10:36:33 +0000
Received: from out0-196.mail.aliyun.com ([140.205.0.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1OMl-00000002IMe-1UQ9
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 10:36:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1714386961; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=MCByWayo1rTtWGbtdA4qwJOFgDYVs7q3tTYHIInGmHY=;
	b=V9juz5RxFGMGwrjlGxUh97IayTySsqHdx93GAsZJba2WhiS8GGBz02xt4XsuxTdbaQ9wKXc7rUzfor1j2xII6VQP6ynLRcRZTlCtX/ozvt3PeNKrm2W2FTXR2a1q32wbdkxfpqivwBtjHj2UacqHIdl2SS6tZ0M5i4ybLeSuRJI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047192;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---.XOEanMm_1714386958;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XOEanMm_1714386958)
          by smtp.aliyun-inc.com;
          Mon, 29 Apr 2024 18:35:59 +0800
From: "Bang Li" <libang.li@antgroup.com>
To: akpm@linux-foundation.org,
	chenhuacai@kernel.org,
	tsbogend@alpha.franken.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com
Cc: <david@redhat.com>,
   <ryan.roberts@arm.com>,
   <libang.linux@gmail.com>,
   <ioworker0@gmail.com>,
   <linux-kernel@vger.kernel.org>,
   <linux-mm@kvack.org>,
   <loongarch@lists.linux.dev>,
   <linux-mips@vger.kernel.org>,
   <linux-riscv@lists.infradead.org>,
  "Bang Li" <libang.li@antgroup.com>
Subject: [PATCH v1 5/5] mm: Add update_mmu_tlb_range()
Date: Mon, 29 Apr 2024 18:33:46 +0800
Message-Id: <20240429103346.59115-6-libang.li@antgroup.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20240429103346.59115-1-libang.li@antgroup.com>
References: <20240429103346.59115-1-libang.li@antgroup.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_033611_670870_9C3051ED 
X-CRM114-Status: GOOD (  10.71  )
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
 include/linux/pgtable.h | 5 +++++
 mm/memory.c             | 4 +---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 18019f037bae..73411dfebf7a 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -734,6 +734,11 @@ static inline void update_mmu_tlb(struct vm_area_struct *vma,
 				unsigned long address, pte_t *ptep)
 {
 }
+
+static inline void update_mmu_tlb_range(struct vm_area_struct *vma,
+				unsigned long address, pte_t *ptep, unsigned int nr)
+{
+}
 #define __HAVE_ARCH_UPDATE_MMU_TLB
 #endif
 
diff --git a/mm/memory.c b/mm/memory.c
index 6647685fd3c4..1f0ca362b82a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4396,7 +4396,6 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	vm_fault_t ret = 0;
 	int nr_pages = 1;
 	pte_t entry;
-	int i;
 
 	/* File mapping without ->vm_ops ? */
 	if (vma->vm_flags & VM_SHARED)
@@ -4465,8 +4464,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
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
