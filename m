Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22522C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 09:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZNsoHbSz7sDT44r632VXPuZkIkJDr2/0vvf5JtaG610=; b=nh+V4q3YVH+6oO
	4xR4Vq9VShQP9MBHb3XTYYKMP8fJB1XvymKfpNV4XTbCFI1fE3WCkHeAoBhFy8tBiZ+mVX3fwhpxb
	v9OjZunofgiA+3XmXTC8SMAnMl1GuBF6Oci0PN2fjfJ4btOzbq8b4tblVJs0NYyK9yMRESBt0CVhE
	Oxy0cBhXi+7GDKTSaosok9ruj2E4JfEK3ruJBafY6OZq4wh6FM96OvfhsuuqIRhrbnfKAqAcUW+dl
	Rqvkrs/UnUWfBLKXrtPdfB2DpDcg+bVgwEErmmaLZ/gIoZ8TYgX3onRAsbIC18b2jmtaoFbsDwrhO
	senv1AgwGnHhGsXlaCGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsoV-002eHn-1s;
	Thu, 13 Jul 2023 09:40:43 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsoM-002e6Y-0m;
	Thu, 13 Jul 2023 09:40:36 +0000
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4R1qMc4wfvz18Lt7;
	Thu, 13 Jul 2023 17:39:56 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 17:40:31 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
	<surenb@google.com>
CC: Russell King <linux@armlinux.org.uk>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
	<chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
	<gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>, Kefeng Wang
	<wangkefeng.wang@huawei.com>
Subject: [PATCH rfc -next 08/10] loongarch: mm: cleanup __do_page_fault()
Date: Thu, 13 Jul 2023 17:53:36 +0800
Message-ID: <20230713095339.189715-9-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713095339.189715-1-wangkefeng.wang@huawei.com>
References: <20230713095339.189715-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_024034_689041_111577F7 
X-CRM114-Status: GOOD (  12.79  )
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

Cleanup __do_page_fault() by reuse bad_area_nosemaphore and
bad_area label.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/loongarch/mm/fault.c | 36 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
index da5b6d518cdb..03d06ee184da 100644
--- a/arch/loongarch/mm/fault.c
+++ b/arch/loongarch/mm/fault.c
@@ -151,18 +151,15 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 		if (!user_mode(regs))
 			no_context(regs, address);
 		else
-			do_sigsegv(regs, write, address, si_code);
-		return;
+			goto bad_area_nosemaphore;
 	}
 
 	/*
 	 * If we're in an interrupt or have no user
 	 * context, we must not take the fault..
 	 */
-	if (faulthandler_disabled() || !mm) {
-		do_sigsegv(regs, write, address, si_code);
-		return;
-	}
+	if (faulthandler_disabled() || !mm)
+		goto bad_area_nosemaphore;
 
 	if (user_mode(regs))
 		flags |= FAULT_FLAG_USER;
@@ -172,23 +169,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 	vma = lock_mm_and_find_vma(mm, address, regs);
 	if (unlikely(!vma))
 		goto bad_area_nosemaphore;
-	goto good_area;
-
-/*
- * Something tried to access memory that isn't in our memory map..
- * Fix it, but check if it's kernel or user first..
- */
-bad_area:
-	mmap_read_unlock(mm);
-bad_area_nosemaphore:
-	do_sigsegv(regs, write, address, si_code);
-	return;
 
-/*
- * Ok, we have a good vm_area for this memory access, so
- * we can handle it..
- */
-good_area:
 	si_code = SEGV_ACCERR;
 
 	if (write) {
@@ -229,14 +210,15 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 		 */
 		goto retry;
 	}
+
+	mmap_read_unlock(mm);
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
-		mmap_read_unlock(mm);
 		if (fault & VM_FAULT_OOM) {
 			do_out_of_memory(regs, address);
 			return;
 		} else if (fault & VM_FAULT_SIGSEGV) {
-			do_sigsegv(regs, write, address, si_code);
-			return;
+			goto bad_area_nosemaphore;
 		} else if (fault & (VM_FAULT_SIGBUS|VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) {
 			do_sigbus(regs, write, address, si_code);
 			return;
@@ -244,7 +226,11 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 		BUG();
 	}
 
+	return;
+bad_area:
 	mmap_read_unlock(mm);
+bad_area_nosemaphore:
+	do_sigsegv(regs, write, address, si_code);
 }
 
 asmlinkage void __kprobes do_page_fault(struct pt_regs *regs,
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
