Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC05C28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 08:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XrMwFUhYI5i3Lfj1b5/Xx6dVjBdY0YBw+jbXyMUwca0=; b=w7Rtf6Ce6l1Stq
	3gjhWkfYTlPKcwtKaHk/5QaFOppuK8bO2K3+ZW2NMinOZot8uocscTGuGei6TQn+81hmDqLJFK7Uw
	eB7NCRsKIBM6o9ewntugOvKltX08wzOATeUhXzkYFJLio+sZ4HEvRlZSi6MT4Od1yH7n3eBwS9sVx
	mgKBhoP6o/uGFaiR4Pfl/iCFZ1DGiXl8tnnreBDoA5rFkJYFft+zYUj2zbPg5ZhKxNLyg3pT/E/lU
	ZJ6AEYN9pBc25YlPLnY0z1dIcEDgKw37rRTYD6dbZdrsiSzQZ62s9RNbYqGXyZteWeC/eTxnc9UsR
	f8Szs5c5QeGCTRA4CXhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ2wB-006Xyq-OS; Mon, 22 Aug 2022 08:37:36 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ2ic-006QFv-Bi; Mon, 22 Aug 2022 08:23:37 +0000
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MB4yW0hwhzXdwW;
	Mon, 22 Aug 2022 16:19:15 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 22 Aug 2022 16:23:30 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <linux-doc@vger.kernel.org>
CC: <corbet@lwn.net>, <peterz@infradead.org>, <arnd@arndb.de>,
	<linux-kernel@vger.kernel.org>, <darren@os.amperecomputing.com>,
	<yangyicong@hisilicon.com>, <huzhanyuan@oppo.com>, <lipeifeng@oppo.com>,
	<zhangshiming@oppo.com>, <guojian@oppo.com>, <realmz6@gmail.com>,
	<linux-mips@vger.kernel.org>, <openrisc@lists.librecores.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, Barry Song <21cnbao@gmail.com>,
	<wangkefeng.wang@huawei.com>, <xhao@linux.alibaba.com>,
	<prime.zeng@hisilicon.com>, <anshuman.khandual@arm.com>, Barry Song
	<v-songbaohua@oppo.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Nadav Amit
	<namit@vmware.com>, Mel Gorman <mgorman@suse.de>
Subject: [PATCH v3 3/4] mm: rmap: Extend tlbbatch APIs to fit new platforms
Date: Mon, 22 Aug 2022 16:21:19 +0800
Message-ID: <20220822082120.8347-4-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220822082120.8347-1-yangyicong@huawei.com>
References: <20220822082120.8347-1-yangyicong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_012334_821220_2D53B4AC 
X-CRM114-Status: GOOD (  11.02  )
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

From: Barry Song <v-songbaohua@oppo.com>

Add uaddr to tlbbatch APIs so that platforms like ARM64 are
able to apply this on their specific hardware features. For
ARM64, this could be sending tlbi into hardware queues for
the page with this particular uaddr.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Nadav Amit <namit@vmware.com>
Cc: Mel Gorman <mgorman@suse.de>
Tested-by: Xin Hao <xhao@linux.alibaba.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/x86/include/asm/tlbflush.h |  3 ++-
 mm/rmap.c                       | 10 ++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 8a497d902c16..5bd78ae55cd4 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -264,7 +264,8 @@ static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
 }
 
 static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
-					struct mm_struct *mm)
+					struct mm_struct *mm,
+					unsigned long uaddr)
 {
 	inc_mm_tlb_gen(mm);
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
diff --git a/mm/rmap.c b/mm/rmap.c
index a17a004550c6..7187a72b63b1 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -642,12 +642,13 @@ void try_to_unmap_flush_dirty(void)
 #define TLB_FLUSH_BATCH_PENDING_LARGE			\
 	(TLB_FLUSH_BATCH_PENDING_MASK / 2)
 
-static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
+static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable,
+				      unsigned long uaddr)
 {
 	struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
 	int batch, nbatch;
 
-	arch_tlbbatch_add_mm(&tlb_ubc->arch, mm);
+	arch_tlbbatch_add_mm(&tlb_ubc->arch, mm, uaddr);
 	tlb_ubc->flush_required = true;
 
 	/*
@@ -725,7 +726,8 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
 	}
 }
 #else
-static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
+static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable,
+				      unsigned long uaddr)
 {
 }
 
@@ -1587,7 +1589,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
 
-				set_tlb_ubc_flush_pending(mm, pte_dirty(pteval));
+				set_tlb_ubc_flush_pending(mm, pte_dirty(pteval), address);
 			} else {
 				pteval = ptep_clear_flush(vma, address, pvmw.pte);
 			}
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
