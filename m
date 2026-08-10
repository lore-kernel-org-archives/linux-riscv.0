Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46820C5AC82
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 08:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S7VJANhYNxODYgRlhhb/yHDbYzYG3zBXKBY8e9/JAKc=; b=S61OMqhu+Yj2D2
	RYdKH1uqsYDCavrFFelBjdVVYyZk7r2iPoVyOHjcVL2Ry/DCHMGiZephoE33O8ST5yNSSSQ0In7G2
	Qe0HvKESpk+iFsMlDulC8tPryIepYi18oQJjcfvvrMI2rXKnyCihcsyVJXxzO0BSUKX38GXS8Vr6P
	2FFXI40BTaUkCgCCQGtnM9baBeWai8GzoyuJpbdpUrVv7jub1YrbpRGTTIyUr+ShEaLRPEnBtcZY1
	BZNcHNfVXbUWb4mcNy0IJ8Nqx57tGNMVOx53ElFaRQqFCfTYVhbh4r0H4Vs/TXX8uZLd/Wg4/CRro
	I6EgyW7LFb3hV4dEvtAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKxU-0000000BEVS-1uIY;
	Mon, 10 Aug 2026 08:02:08 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKxQ-0000000BEU1-19wj
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 08:02:06 +0000
Received: from smtp.gmail.com (unknown [121.237.244.183])
	by APP-03 (Coremail) with SMTP id rQCowAB3fjxvhXlqEdJwBA--.3674S2;
	Mon, 10 Aug 2026 16:01:51 +0800 (CST)
From: daichengrong <daichengrong@iscas.ac.cn>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	daichengrong <daichengrong@iscas.ac.cn>
Subject: [PATCH v2] uprobes: Restore original return address in uretprobe context
Date: Mon, 10 Aug 2026 16:01:40 +0800
Message-Id: <20260810080140.96587-1-daichengrong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAB3fjxvhXlqEdJwBA--.3674S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGF1fJFW5tF48ur1rXr1DKFg_yoWrJr1xpa
	1vka43KFWDG34UurZxXr48Z3WFvrZ5Xw42kr1xK34fCw15KryfJr1I93y7ZF1rtrZagF13
	Ar4UtrWjvFZxJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxkIecxEwVAFwVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x0JUw0edUUUUU=
X-Originating-IP: [121.237.244.183]
X-CM-SenderInfo: pgdluxxhqj201qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_010204_709034_446982D6 
X-CRM114-Status: GOOD (  10.27  )
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

uretprobe replaces the original return address of a probed function with
a trampoline address to capture function return events.

After the trampoline is entered and the uretprobe handler completes, the
original return address needs to be restored in the user register context
to keep the register state consistent with the state before probing.

Add an architecture-specific hook for restoring the original return
address during uretprobe handling.

The initial implementation adds support for RISC-V. Other architectures
keep the default empty implementation until their corresponding restore
logic is implemented.

Signed-off-by: daichengrong <daichengrong@iscas.ac.cn>
---
Change in v2:
 - Rename arch_uretprobe_hijack_set_addr() to arch_uretprobe_restore_return_address() as suggested
 
v1: https://lore.kernel.org/all/20260717082331.27058-1-daichengrong@iscas.ac.cn/
---
 arch/riscv/kernel/probes/uprobes.c | 7 +++++++
 include/linux/uprobes.h            | 1 +
 kernel/events/uprobes.c            | 5 +++++
 3 files changed, 13 insertions(+)

diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
index eb177d0ce8ab..90ed8596e73f 100644
--- a/arch/riscv/kernel/probes/uprobes.c
+++ b/arch/riscv/kernel/probes/uprobes.c
@@ -139,6 +139,13 @@ arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr,
 	return ra;
 }
 
+void
+arch_uretprobe_restore_return_address(unsigned long orig_ret_vaddr,
+				  struct pt_regs *regs)
+{
+	regs->ra = orig_ret_vaddr;
+}
+
 int arch_uprobe_exception_notify(struct notifier_block *self,
 				 unsigned long val, void *data)
 {
diff --git a/include/linux/uprobes.h b/include/linux/uprobes.h
index f548fea2adec..af5b633f92dd 100644
--- a/include/linux/uprobes.h
+++ b/include/linux/uprobes.h
@@ -230,6 +230,7 @@ extern bool arch_uprobe_xol_was_trapped(struct task_struct *tsk);
 extern int  arch_uprobe_exception_notify(struct notifier_block *self, unsigned long val, void *data);
 extern void arch_uprobe_abort_xol(struct arch_uprobe *aup, struct pt_regs *regs);
 extern unsigned long arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr, struct pt_regs *regs);
+extern void arch_uretprobe_restore_return_address(unsigned long orig_ret_vaddr, struct pt_regs *regs);
 extern bool arch_uretprobe_is_alive(struct return_instance *ret, enum rp_check ctx, struct pt_regs *regs);
 extern bool arch_uprobe_ignore(struct arch_uprobe *aup, struct pt_regs *regs);
 extern void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 6300b216012c..9a2e9ce4e398 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -1748,6 +1748,10 @@ void * __weak arch_uretprobe_trampoline(unsigned long *psize)
 	return &insn;
 }
 
+void __weak arch_uretprobe_restore_return_address(unsigned long orig_ret_vaddr, struct pt_regs *regs)
+{
+}
+
 static struct xol_area *__create_xol_area(unsigned long vaddr)
 {
 	struct mm_struct *mm = current->mm;
@@ -2659,6 +2663,7 @@ void uprobe_handle_trampoline(struct pt_regs *regs)
 		valid = !next_chain || arch_uretprobe_is_alive(next_chain, RP_CHECK_RET, regs);
 
 		instruction_pointer_set(regs, ri->orig_ret_vaddr);
+		arch_uretprobe_restore_return_address(ri->orig_ret_vaddr, regs);
 		do {
 			/* pop current instance from the stack of pending return instances,
 			 * as it's not pending anymore: we just fixed up original
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
