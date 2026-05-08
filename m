Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB7ECD342F
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 06:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PThJnfTF2OtPgferwoBDlu9c6d+tRqtZr7YjqMz0HSc=; b=R8XB25yWSg+bF6
	9xCnAtNnYQEyr8xJnpdVHR+hIdP6e6V52RIQGqgPI7DUXmZjee6CfI+/8rWX2Hkhi7qqydLORK3Fz
	gRLmzG/WSJvf4DsZ3RI2MBYRDGMO0TgIdauQjUTJJmh6IKxLEFHZ+uxnmYsZEJv0d3oZ66j7AaCAV
	920fLFZ/ezUmcerLSZMGrNX6uu9aMdTJ9lJCnPjXlvYRc3TbQDtz/AerO5825yPQsPXi9vEa9n7WW
	WG7LIKpwSQpTSX0Lb+KogO+Ncdk9hVKmNaJAoGcOIBwlb+HssjKzKMtV2UPmG9ggdGyzUvv3hQlJ+
	A3mQ33Zbgh6HtITlertw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEbZ-00000005j1H-2gbU;
	Fri, 08 May 2026 06:22:33 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEbV-00000005izT-3NbQ
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 06:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778221340; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Q8RtE4dLjzG2wwaekV9P1X3i3i7rjDf0GtrQubIx02M=;
	b=WpqzQ4f7SV13BSTY2yIoQxfi8XwV4rLjWmWOlrdHqkTC+zA4ddyamxVcWAwMCaaF6UYl+xhaMLNkPK/jjCi7IxdjdekLZfNsH5IHnXXc9LcNdstR5GZ+k2K53L5QxBeqam+sD9RspWR4cISe/d9aRWl3H0yYbz0CBu18slG8WR8=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0X2WYVTj_1778221336;
Received: from t50a05405.sqa.eu95.tbsite.net(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X2WYVTj_1778221336 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 08 May 2026 14:22:18 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhuo.song@linux.alibaba.com,
	oliver.yang@linux.alibaba.com,
	winterddd <tianruidong@linux.alibaba.com>
Subject: [RESEND] riscv: mm: Add proper handling for HWPOISON faults
Date: Fri,  8 May 2026 14:22:15 +0800
Message-ID: <20260508062215.2997173-1-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_232230_214046_456C8098 
X-CRM114-Status: GOOD (  13.34  )
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

From: winterddd <tianruidong@linux.alibaba.com>

Currently, the RISC-V fault handler treats memory poisoning faults
(VM_FAULT_HWPOISON and VM_FAULT_HWPOISON_LARGE) as a generic bus error
(BUS_ADRERR). This is incorrect as it loses crucial information about
the nature of the error.

As for describe in [0], A SIGBUS is sent with the correct machine check
error code (BUS_MCEERR_AR) and populates `si_addr_lsb`(log2 of the
corruption page size) in siginfo while there is page fault with poison
page.

The logic is based on the existing arm64 implementation for handling
HWPOISON.

Testing
--------------
ras-tools[0] is used to test.

./einj_mem_uc -j -k single &

echo 0x107943b400 > /sys/devices/system/memory/hard_offline_page

echo trigger > ./trigger_start

before apply this patch:
	signal 7 code 2 addr 0x7fff95bdc400
after apply this patch:
	signal 7 code 4 addr 0x7fff95bdc400

[0]: https://www.man7.org/linux/man-pages/man2/sigaction.2.html
[1]: https://kernel.googlesource.com/pub/scm/linux/kernel/git/aegl/ras-tools/

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 arch/riscv/include/asm/bug.h |  1 +
 arch/riscv/kernel/traps.c    | 32 ++++++++++++++++++++++----------
 arch/riscv/mm/fault.c        | 12 +++++++++++-
 3 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 6f581b84d8fc..824c641c08a8 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -95,5 +95,6 @@ struct task_struct;
 void __show_regs(struct pt_regs *regs);
 void die(struct pt_regs *regs, const char *str);
 void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr);
+void riscv_force_sig_mceerr(int code, unsigned long addr, short lsb);
 
 #endif /* _ASM_RISCV_BUG_H */
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 8c62c771a656..5ff3604fdea4 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -112,20 +112,32 @@ void die(struct pt_regs *regs, const char *str)
 		make_task_dead(SIGSEGV);
 }
 
-void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr)
+static void riscv_show_signal(int signo, int code, unsigned long addr)
 {
 	struct task_struct *tsk = current;
+	struct pt_regs *regs = task_pt_regs(tsk);
 
-	if (show_unhandled_signals && unhandled_signal(tsk, signo)
-	    && printk_ratelimit()) {
-		pr_info("%s[%d]: unhandled signal %d code 0x%x at 0x" REG_FMT,
-			tsk->comm, task_pid_nr(tsk), signo, code, addr);
-		print_vma_addr(KERN_CONT " in ", instruction_pointer(regs));
-		pr_cont("\n");
-		__show_regs(regs);
-		dump_instr(KERN_INFO, regs);
-	}
+	if (!show_unhandled_signals || !unhandled_signal(tsk, signo)
+	    || !printk_ratelimit())
+		return;
+
+	pr_info("%s[%d]: unhandled signal %d code 0x%x at 0x" REG_FMT,
+		tsk->comm, task_pid_nr(tsk), signo, code, addr);
+	print_vma_addr(KERN_CONT " in ", instruction_pointer(regs));
+	pr_cont("\n");
+	__show_regs(regs);
+	dump_instr(KERN_INFO, regs);
+}
 
+void riscv_force_sig_mceerr(int code, unsigned long addr, short lsb)
+{
+	riscv_show_signal(SIGBUS, code, addr);
+	force_sig_mceerr(code, (void __user *)addr, lsb);
+}
+
+void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr)
+{
+	riscv_show_signal(signo, code, addr);
 	force_sig_fault(signo, code, (void __user *)addr);
 }
 
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 04ed6f8acae4..a6ccc4ab3a75 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -16,6 +16,7 @@
 #include <linux/kprobes.h>
 #include <linux/kfence.h>
 #include <linux/entry-common.h>
+#include <linux/hugetlb.h>
 
 #include <asm/ptrace.h>
 #include <asm/tlbflush.h>
@@ -128,10 +129,19 @@ static inline void mm_fault_error(struct pt_regs *regs, unsigned long addr, vm_f
 		 */
 		pagefault_out_of_memory();
 		return;
-	} else if (fault & (VM_FAULT_SIGBUS | VM_FAULT_HWPOISON | VM_FAULT_HWPOISON_LARGE)) {
+	} else if (fault & VM_FAULT_SIGBUS) {
 		/* Kernel mode? Handle exceptions or die */
 		do_trap(regs, SIGBUS, BUS_ADRERR, addr);
 		return;
+	} else if (fault & (VM_FAULT_HWPOISON_LARGE | VM_FAULT_HWPOISON)) {
+		unsigned int lsb;
+
+		lsb = PAGE_SHIFT;
+		if (fault & VM_FAULT_HWPOISON_LARGE)
+			lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
+
+		riscv_force_sig_mceerr(BUS_MCEERR_AR, addr, lsb);
+		return;
 	} else if (fault & VM_FAULT_SIGSEGV) {
 		do_trap(regs, SIGSEGV, SEGV_MAPERR, addr);
 		return;
-- 
2.51.2.612.gdc70283dfc


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
