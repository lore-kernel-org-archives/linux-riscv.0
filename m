Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB1FF46101
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 13:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=n9qWsovkkRtXpVIY+hrNDMUCSSIqaPkLghRd1zRXM64=; b=QPthoSgBQIC09V
	zwzIujM/GyxqGELsjVGVfxswJMKlt0n5IXib65F+qQGbqAJPYdQV8DWRgIbu9G/GoUtKO8ODPJWZJ
	37B5DWWnECmVc3kvcdt/uqqKNZ+wx42cgFNIq1LGa5xB8PCkFmYYvo2BXoICSzIJdgE/GKyZU6Pon
	wWAOhbzz9Q8eXXEFlsZZvyrjIHbLRz6glnFTUPyAEUZP/rYkaYAPgLQ0izm29HDc8aTunDuqAR8OO
	wMGldezvOhoXkewZMI2vEPJbtai59jrcHytSeB7yQYkP6JfcnuSe8XTfUxlDd0VkJ7mRxGjUPPzQZ
	tuQaDWXCpHKjS62VkXyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4exq-0000000Gkac-0mzd;
	Mon, 23 Mar 2026 13:05:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4exk-0000000GkYt-0a4e
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 13:04:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FD2560128;
	Mon, 23 Mar 2026 13:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961ABC4CEF7;
	Mon, 23 Mar 2026 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774271095;
	bh=nHxiC3qjtQiNvi5v5lj0/I0qKpbb54iQFDbxGgpzau8=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=UBhrrLAKZAE6tJfgeNxJbRKuuEoudifOitwswrFaJfVNzptPn2Mo1KozSYV6atB85
	 BR8OtMenO+nI1qk0Nk0bOowe8sTHW1Jh12oh31aep+6U48SjbFgCCthvZG14Tp5pnS
	 5tXUNyCRcyY+gpsY1mE2kDai77/2eA1XrQBImlOI=
Subject: Patch "riscv: stacktrace: Disable KASAN checks for non-current tasks" has been added to the 6.1-stable tree
To: aou@eecs.berkeley.edu,gregkh@linuxfoundation.org,jianqkang@sina.cn,linux-riscv@lists.infradead.org,palmer@dabbelt.com,patches@lists.linux.dev,paul.walmsley@sifive.com,pjw@kernel.org,xujiakai2025@iscas.ac.cn,zhangchunyan@iscas.ac.cn
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 23 Mar 2026 14:03:52 +0100
In-Reply-To: <20260323063115.3555043-1-jianqkang@sina.cn>
Message-ID: <2026032352-unwired-estranged-bbc0@gregkh>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore
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


This is a note to let you know that I've just added the patch titled

    riscv: stacktrace: Disable KASAN checks for non-current tasks

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     riscv-stacktrace-disable-kasan-checks-for-non-current-tasks.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-227888-greg=kroah.com@vger.kernel.org Mon Mar 23 07:32:09 2026
From: Jianqiang kang <jianqkang@sina.cn>
Date: Mon, 23 Mar 2026 14:31:14 +0800
Subject: riscv: stacktrace: Disable KASAN checks for non-current tasks
To: gregkh@linuxfoundation.org, stable@vger.kernel.org, zhangchunyan@iscas.ac.cn
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, xujiakai2025@iscas.ac.cn, linux-riscv@lists.infradead.org, pjw@kernel.org
Message-ID: <20260323063115.3555043-1-jianqkang@sina.cn>

From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>

[ Upstream commit 060ea84a484e852b52b938f234bf9b5503a6c910 ]

Unwinding the stack of a task other than current, KASAN would report
"BUG: KASAN: out-of-bounds in walk_stackframe+0x41c/0x460"

There is a same issue on x86 and has been resolved by the commit
84936118bdf3 ("x86/unwind: Disable KASAN checks for non-current tasks")
The solution could be applied to RISC-V too.

This patch also can solve the issue:
https://seclists.org/oss-sec/2025/q4/23

Fixes: 5d8544e2d007 ("RISC-V: Generic library routines and assembly")
Co-developed-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Link: https://lore.kernel.org/r/20251022072608.743484-1-zhangchunyan@iscas.ac.cn
[pjw@kernel.org: clean up checkpatch issues]
Signed-off-by: Paul Walmsley <pjw@kernel.org>
[ Minor conflict resolved. ]
Signed-off-by: Jianqiang kang <jianqkang@sina.cn>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/riscv/kernel/stacktrace.c |   21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -16,6 +16,22 @@
 
 #ifdef CONFIG_FRAME_POINTER
 
+/*
+ * This disables KASAN checking when reading a value from another task's stack,
+ * since the other task could be running on another CPU and could have poisoned
+ * the stack in the meantime.
+ */
+#define READ_ONCE_TASK_STACK(task, x)			\
+({							\
+	unsigned long val;				\
+	unsigned long addr = x;				\
+	if ((task) == current)				\
+		val = READ_ONCE(addr);			\
+	else						\
+		val = READ_ONCE_NOCHECK(addr);		\
+	val;						\
+})
+
 extern asmlinkage void ret_from_exception(void);
 
 static inline int fp_is_valid(unsigned long fp, unsigned long sp)
@@ -68,8 +84,9 @@ void notrace walk_stackframe(struct task
 			fp = frame->ra;
 			pc = regs->ra;
 		} else {
-			fp = frame->fp;
-			pc = ftrace_graph_ret_addr(current, &graph_idx, frame->ra,
+			fp = READ_ONCE_TASK_STACK(task, frame->fp);
+			pc = READ_ONCE_TASK_STACK(task, frame->ra);
+			pc = ftrace_graph_ret_addr(current, &graph_idx, pc,
 						   &frame->ra);
 			if (pc == (unsigned long)ret_from_exception) {
 				if (unlikely(!__kernel_text_address(pc) || !fn(arg, pc)))


Patches currently in stable-queue which might be from jianqkang@sina.cn are

queue-6.1/riscv-stacktrace-disable-kasan-checks-for-non-current-tasks.patch
queue-6.1/rcu-nocb-fix-possible-invalid-rdp-s-nocb_cb_kthread-pointer-access.patch
queue-6.1/io_uring-io-wq-check-io_wq_bit_exit-inside-work-run-loop.patch

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
