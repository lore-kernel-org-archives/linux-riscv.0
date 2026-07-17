Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B92C44514
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 08:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aGduo4Qd+UpL7td6/klVzdjl4oJdoZOWIkDMiDrQKts=; b=YZ5tsEhQtXVUWr
	GmFXrUTN3sZRmXYDU8JTrnW+/XPhywMiX5zq3+1Kk+IMnjR0eY488UysrvtENPX/+6cVI2QRPiOMm
	3L3Shqt3dCMwhLPm9NZ9hDKL7Hf7faKeqjCtu7ygNbwPwHa/nBlIJvjHOPqJVJzYRV+qgLLJv46HE
	zdCsebWeLWdA2ZU/wH6fyWKiA3oiwAUuDPPpf3OtuYY4SjgQNbD6y67q3OH+PsR+lI7IivzHlwQ7S
	+xmKsT4kojHK1afRtlJNz5lkn/w2BKTr3WqTnJcVJN+OdeAry12yl4QiQyqtAt+TWJ8/Gjn+04l0q
	EjeUvzAi8SpohJ7eaduA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdrO-00000001cmM-1ANp;
	Fri, 17 Jul 2026 08:23:54 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdrI-00000001ckm-3Ml7
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 08:23:52 +0000
Received: from localhost.localdomain (unknown [180.111.28.80])
	by APP-03 (Coremail) with SMTP id rQCowADn8T+M5llq49QfAA--.30915S2;
	Fri, 17 Jul 2026 16:23:41 +0800 (CST)
From: daichengrong <daichengrong@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	daichengrong <daichengrong@iscas.ac.cn>
Subject: [PATCH] uprobes: Restore original return address in uretprobe context
Date: Fri, 17 Jul 2026 16:23:31 +0800
Message-Id: <20260717082331.27058-1-daichengrong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowADn8T+M5llq49QfAA--.30915S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGF1fJFW5tFykXr1UCFWUtwb_yoW5uw4rpa
	1vk343KFWkG3yUuF9rXrW8Zw1FvrZ5J3y2kr17G34akw15tryftF1I9rW7ZF1rtrZagF17
	Ar4UKrWjvFZxJrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjJ73PUUUU
	U==
X-Originating-IP: [180.111.28.80]
X-CM-SenderInfo: pgdluxxhqj201qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_012349_219919_86A3416C 
X-CRM114-Status: UNSURE (   9.56  )
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
 arch/riscv/kernel/probes/uprobes.c | 7 +++++++
 include/linux/uprobes.h            | 1 +
 kernel/events/uprobes.c            | 5 +++++
 3 files changed, 13 insertions(+)

diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
index eb177d0ce8ab..0b1b94d9683e 100644
--- a/arch/riscv/kernel/probes/uprobes.c
+++ b/arch/riscv/kernel/probes/uprobes.c
@@ -139,6 +139,13 @@ arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr,
 	return ra;
 }
 
+void
+arch_uretprobe_hijack_set_addr(unsigned long orig_ret_vaddr,
+				  struct pt_regs *regs)
+{
+	regs->ra = orig_ret_vaddr;
+}
+
 int arch_uprobe_exception_notify(struct notifier_block *self,
 				 unsigned long val, void *data)
 {
diff --git a/include/linux/uprobes.h b/include/linux/uprobes.h
index f548fea2adec..2d0dc919845d 100644
--- a/include/linux/uprobes.h
+++ b/include/linux/uprobes.h
@@ -230,6 +230,7 @@ extern bool arch_uprobe_xol_was_trapped(struct task_struct *tsk);
 extern int  arch_uprobe_exception_notify(struct notifier_block *self, unsigned long val, void *data);
 extern void arch_uprobe_abort_xol(struct arch_uprobe *aup, struct pt_regs *regs);
 extern unsigned long arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr, struct pt_regs *regs);
+extern void arch_uretprobe_hijack_set_addr(unsigned long orig_ret_vaddr, struct pt_regs *regs);
 extern bool arch_uretprobe_is_alive(struct return_instance *ret, enum rp_check ctx, struct pt_regs *regs);
 extern bool arch_uprobe_ignore(struct arch_uprobe *aup, struct pt_regs *regs);
 extern void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 4084e926e284..deecaae01ab7 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -1748,6 +1748,10 @@ void * __weak arch_uretprobe_trampoline(unsigned long *psize)
 	return &insn;
 }
 
+void __weak arch_uretprobe_hijack_set_addr(unsigned long orig_ret_vaddr, struct pt_regs *regs)
+{
+}
+
 static struct xol_area *__create_xol_area(unsigned long vaddr)
 {
 	struct mm_struct *mm = current->mm;
@@ -2659,6 +2663,7 @@ void uprobe_handle_trampoline(struct pt_regs *regs)
 		valid = !next_chain || arch_uretprobe_is_alive(next_chain, RP_CHECK_RET, regs);
 
 		instruction_pointer_set(regs, ri->orig_ret_vaddr);
+		arch_uretprobe_hijack_set_addr(ri->orig_ret_vaddr, regs);
 		do {
 			/* pop current instance from the stack of pending return instances,
 			 * as it's not pending anymore: we just fixed up original
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
