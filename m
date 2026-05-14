Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC63CD4851
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 10:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wtd5GSPB3rezd2FQba8L8hpNbyhFYyQHzxjHJFt0ZzU=; b=LSscjUaxzh4GgV
	GKXDsqNmxDUNy/z/e5+uHhWlS3WUKo8+FfzI34wCVvSEp9McsDk5/MpSlZZsEVYTfkwFje/HiZpac
	xBZDCxdyOqmi7raKM04fxMqkeYQPVz98liSZSBfRaeZSckhArL1KEvjo9dmTqbjjiyPOKIMF4xEMn
	RDigFDhU8ic6Ftwln/UkBOQ50lO5BJfxaHQ5PUbyPTrZzIZRob5joAP8deKAomEQLtAHefEUHmCHv
	FpLLqQSZmkhaDnacMRz0ksecL5/t1hxlcQoUiu4mmUgQ7o8LN9iesDraUFZq2siqCVT9GuVGSlI0k
	ehPfBuuMTPUmoA2PVzWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSyX-0000000595Q-3oG7;
	Thu, 14 May 2026 10:07:29 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSyV-0000000594h-0PCD
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 10:07:28 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACXQm7XngVqRHA0EA--.11494S2;
	Thu, 14 May 2026 18:07:20 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Matthew Bystrin <dev.mbstr@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH] riscv: stacktrace: fix stack-out-of-bounds in walk_stackframe
Date: Thu, 14 May 2026 10:07:11 +0000
Message-Id: <20260514100711.838895-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowACXQm7XngVqRHA0EA--.11494S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF47Gr4UKw1kuryUAw47Jwb_yoW5JF4rpF
	Zak3Zrtr47G3y293sxAr18ury5Jrs3W3yUKFZxtw15J3W7GFyYvryqqa45Zr1Yyryvqa42
	kFyjyw4DCan0vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjEoGDUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBg0HCWoFh+JXSAAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_030727_510029_87941240 
X-CRM114-Status: GOOD (  13.03  )
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

The fp_is_valid() function uses ALIGN(sp, THREAD_SIZE) as the upper
bound for the frame pointer check. This bound is calculated relative
to the current sp and shifts upward when sp itself exceeds the valid
stack region, allowing the unwinder to read past the end of the
allocated task stack and triggering KASAN stack-out-of-bounds.

Fix this by using the absolute task stack boundary
(task_stack_page(task) + THREAD_SIZE) instead. This ensures that
once the frame pointer walks past the actual end of the stack,
the check consistently fails and the unwinding terminates.

Note that the frame pointer unwinder has no mechanism to detect
when the unwind has crossed from the task stack onto a different
kernel stack (e.g., IRQ stack). Using the absolute task stack
boundary provides correct protection against out-of-bounds reads
at the end of the task stack.

Fixes: a2a4d4a6a0bf ("riscv: stacktrace: fixed walk_stackframe()")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Assisted-by: OpenClaw:DeepSeek-V3.2
---
 arch/riscv/kernel/stacktrace.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index b41b6255751c..d23681873b5a 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -35,12 +35,16 @@
 extern asmlinkage void handle_exception(void);
 extern unsigned long ret_from_exception_end;
 
-static inline int fp_is_valid(unsigned long fp, unsigned long sp)
+static inline int fp_is_valid(unsigned long fp, unsigned long sp,
+			      struct task_struct *task)
 {
 	unsigned long low, high;
 
+	if (!task)
+		task = current;
+
 	low = sp + sizeof(struct stackframe);
-	high = ALIGN(sp, THREAD_SIZE);
+	high = (unsigned long)task_stack_page(task) + THREAD_SIZE;
 
 	return !(fp < low || fp > high || fp & 0x07);
 }
@@ -74,13 +78,13 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 		if (unlikely(!__kernel_text_address(pc) || (level++ >= 0 && !fn(arg, pc))))
 			break;
 
-		if (unlikely(!fp_is_valid(fp, sp)))
+		if (unlikely(!fp_is_valid(fp, sp, task)))
 			break;
 
 		/* Unwind stack frame */
 		frame = (struct stackframe *)fp - 1;
 		sp = fp;
-		if (regs && (regs->epc == pc) && fp_is_valid(frame->ra, sp)) {
+		if (regs && (regs->epc == pc) && fp_is_valid(frame->ra, sp, task)) {
 			/* We hit function where ra is not saved on the stack */
 			fp = frame->ra;
 			pc = regs->ra;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
