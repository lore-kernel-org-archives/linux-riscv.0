Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357FAC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=km10Y3HJJLWwa/e9s40aPgiq8jpJFeOPB83TGzIGppg=; b=FHGgWvIJXS3Wbo
	65BKxaFYT7BVL8/TG/QS3UDy8XwPis8oMlbm7SQekVxDOSPN6MDDzUtIzmcUyvd/HLw9Yz6RNPzEi
	Is6Mc1VD7ZRYdM5YSfe7ugD5cGac1OCw6gd1aeHwUhspD8+h/HGnpovaZBWCuarsdYp4jrJFJMXdb
	ev0P4P4BVXYeON+FmPBiRG26fHS74TuZE4V+cr08lBKzNidONssx1pQvBD1JPtL7JLrJa7AoCIHUJ
	DPgbIYn83toJec9N6RlYWXdEJAhlTELMGLC/iM9UBKr72e55YW2fbjRzanLUgZWN7rrydrDXUph9s
	dSylOU7qBqXqYiPvJ2Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olqbZ-007UQz-Lj; Fri, 21 Oct 2022 11:54:25 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olqbW-007UPD-Jt
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 11:54:24 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mv2tg64RCzHv7g;
	Fri, 21 Oct 2022 19:54:03 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 19:53:45 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 19:53:45 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tong
 Tiangen" <tongtiangen@huawei.com>, <wangkefeng.wang@huawei.com>, Guohanjun
	<guohanjun@huawei.com>
Subject: [PATCH -next] riscv/mm/fault: simplify code for do_page_fault()
Date: Fri, 21 Oct 2022 12:19:32 +0000
Message-ID: <20221021121932.40967-1-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_045423_006560_C4B31C17 
X-CRM114-Status: GOOD (  15.50  )
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

To make the code more hierarchical and readable, we fold vma related
judgments into __do_page_fault(). And to simplify the code, move the
tsk->thread.bad_cause's setting into bad_area(). No functional change
intended.

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/riscv/mm/fault.c | 77 +++++++++++++++++++++++--------------------
 1 file changed, 41 insertions(+), 36 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index d86f7cebd4a7..7194326ae96c 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -85,6 +85,8 @@ static inline void mm_fault_error(struct pt_regs *regs, unsigned long addr, vm_f
 
 static inline void bad_area(struct pt_regs *regs, struct mm_struct *mm, int code, unsigned long addr)
 {
+	current->thread.bad_cause = regs->cause;
+
 	/*
 	 * Something tried to access memory that isn't in our memory map.
 	 * Fix it, but check if it's kernel or user first.
@@ -200,6 +202,38 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
 	return false;
 }
 
+#define VM_FAULT_BADMAP		((__force vm_fault_t)0x010000)
+#define VM_FAULT_BADACCESS	((__force vm_fault_t)0x020000)
+
+static vm_fault_t __do_page_fault(struct mm_struct *mm, unsigned long addr,
+				unsigned int mm_flags, struct pt_regs *regs)
+{
+	struct vm_area_struct *vma = find_vma(mm, addr);
+
+	if (unlikely(!vma))
+		return VM_FAULT_BADMAP;
+
+	if (unlikely(vma->vm_start > addr)) {
+		if (unlikely(!(vma->vm_flags & VM_GROWSDOWN) ||
+				expand_stack(vma, addr)))
+			return VM_FAULT_BADMAP;
+	}
+
+	/*
+	 * Ok, we have a good vm_area for this memory access, so
+	 * we can handle it.
+	 */
+	if (unlikely(access_error(regs->cause, vma)))
+		return VM_FAULT_BADACCESS;
+
+	/*
+	 * If for any reason at all we could not handle the fault,
+	 * make sure we exit gracefully rather than endlessly redo
+	 * the fault.
+	 */
+	return handle_mm_fault(vma, addr, mm_flags, regs);
+}
+
 /*
  * This routine handles page faults.  It determines the address and the
  * problem, and then passes it off to one of the appropriate routines.
@@ -207,7 +241,6 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
 asmlinkage void do_page_fault(struct pt_regs *regs)
 {
 	struct task_struct *tsk;
-	struct vm_area_struct *vma;
 	struct mm_struct *mm;
 	unsigned long addr, cause;
 	unsigned int flags = FAULT_FLAG_DEFAULT;
@@ -280,44 +313,16 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 		flags |= FAULT_FLAG_INSTRUCTION;
 retry:
 	mmap_read_lock(mm);
-	vma = find_vma(mm, addr);
-	if (unlikely(!vma)) {
-		tsk->thread.bad_cause = cause;
-		bad_area(regs, mm, code, addr);
-		return;
-	}
-	if (likely(vma->vm_start <= addr))
-		goto good_area;
-	if (unlikely(!(vma->vm_flags & VM_GROWSDOWN))) {
-		tsk->thread.bad_cause = cause;
-		bad_area(regs, mm, code, addr);
-		return;
-	}
-	if (unlikely(expand_stack(vma, addr))) {
-		tsk->thread.bad_cause = cause;
-		bad_area(regs, mm, code, addr);
-		return;
-	}
 
-	/*
-	 * Ok, we have a good vm_area for this memory access, so
-	 * we can handle it.
-	 */
-good_area:
-	code = SEGV_ACCERR;
+	fault = __do_page_fault(mm, addr, flags, regs);
 
-	if (unlikely(access_error(cause, vma))) {
-		tsk->thread.bad_cause = cause;
-		bad_area(regs, mm, code, addr);
-		return;
-	}
+	if (unlikely(fault & VM_FAULT_BADMAP))
+		return bad_area(regs, mm, code, addr);
 
-	/*
-	 * If for any reason at all we could not handle the fault,
-	 * make sure we exit gracefully rather than endlessly redo
-	 * the fault.
-	 */
-	fault = handle_mm_fault(vma, addr, flags, regs);
+	if (unlikely(fault & VM_FAULT_BADMAP)) {
+		code = SEGV_ACCERR;
+		return bad_area(regs, mm, code, addr);
+	}
 
 	/*
 	 * If we need to retry but a fatal signal is pending, handle the
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
