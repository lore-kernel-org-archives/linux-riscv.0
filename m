Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F044C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 06:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=slj/5Bwbry/1HHbItzqS/wANbOdFWKBlEuwyqkV/XKc=; b=VjAXfxZgh2lyWF
	VoDzTvxqAUJv0nH8g6l8EpeYg4E+xnXVkHq0x0OMis0rjTG5wahOL6szfCAtYawq62Y+hI8wcPDbS
	RHay2rtyUouGnKiE4OmidLoXVG9T3+2JFoQlkCsnwvsqmoUIhsw+Dj6WJvrScH/8yM7CrSZXyk6Ui
	cW6c1dt712uqRwU9aHbS5THEKY4TX3slAHejV6Ve9JewILhpautp0YUtuUmkOk0XvWQWR3GDIfvJu
	f1SE5Zy9ZEaHzZ4bfAUxbapIIFOGd46yGKHQGy607EoxChaQ78pWobR3aG6VA8fJs2ko6Z4tn8f0V
	bfPgKl2nXtpdLTFegLxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oseuc-00BMiZ-Ge; Wed, 09 Nov 2022 06:50:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oseuZ-00BMgl-GU
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 06:50:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 201EE618CF;
	Wed,  9 Nov 2022 06:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA54C433C1;
	Wed,  9 Nov 2022 06:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667976609;
	bh=ut7EzIUNIiE0yhwgdV7ZbRJKon0eflJ3Fbn5UHXoL04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TMNa28F5RRTMFGUaIb/uf6YrbkzsOwFQK8PGvRMUQ9xyrB9/PuUT9ztiKteYlIM2r
	 JC3eJrbZoUguf6W7EPJaY6zTNH83U6UY9BO6o932xt14lvKbh6uT9k+Q2nh5lwAcSo
	 cb6vXzzkKiqqUVNgkZBru/VUoh+Dkff6049EZ3xDzChiRDGwG+ac5tKbDNJoM/72Aj
	 PNCz/PMJh6y9xCF7FfR6CBOPbaNsnlFmy+xkbs9a9P/lT6vA0NK8J/8Dex2oZgKPqu
	 nuR9B2r8wqaAHjkKyvg035wpt9Oj1y7dryM6AGVBWoUBeFzqMCN+WC+9nEUPRJnMqd
	 AnsobWmxO0v3w==
From: guoren@kernel.org
To: anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	peterz@infradead.org,
	arnd@arndb.de,
	linux-arch@vger.kernel.org,
	keescook@chromium.org,
	paulmck@kernel.org,
	frederic@kernel.org,
	nsaenzju@redhat.com,
	changbin.du@intel.com,
	vincent.chen@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH 2/2] riscv: stacktrace: Make walk_stackframe cross pt_regs frame
Date: Wed,  9 Nov 2022 01:49:37 -0500
Message-Id: <20221109064937.3643993-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221109064937.3643993-1-guoren@kernel.org>
References: <20221109064937.3643993-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_225011_651964_E5BAB5F8 
X-CRM114-Status: GOOD (  13.13  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The current walk_stackframe with FRAME_POINTER would stop unwinding at
ret_from_exception:
  BUG: sleeping function called from invalid context at kernel/locking/rwsem.c:1518
  in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1, name: init
  CPU: 0 PID: 1 Comm: init Not tainted 5.10.113-00021-g15c15974895c-dirty #192
  Call Trace:
  [<ffffffe0002038c8>] walk_stackframe+0x0/0xee
  [<ffffffe000aecf48>] show_stack+0x32/0x4a
  [<ffffffe000af1618>] dump_stack_lvl+0x72/0x8e
  [<ffffffe000af1648>] dump_stack+0x14/0x1c
  [<ffffffe000239ad2>] ___might_sleep+0x12e/0x138
  [<ffffffe000239aec>] __might_sleep+0x10/0x18
  [<ffffffe000afe3fe>] down_read+0x22/0xa4
  [<ffffffe000207588>] do_page_fault+0xb0/0x2fe
  [<ffffffe000201b80>] ret_from_exception+0x0/0xc

The optimization would help walk_stackframe cross the pt_regs frame and
get more backtrace of debug info:
  BUG: sleeping function called from invalid context at kernel/locking/rwsem.c:1518
  in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1, name: init
  CPU: 0 PID: 1 Comm: init Not tainted 5.10.113-00021-g15c15974895c-dirty #192
  Call Trace:
  [<ffffffe0002038c8>] walk_stackframe+0x0/0xee
  [<ffffffe000aecf48>] show_stack+0x32/0x4a
  [<ffffffe000af1618>] dump_stack_lvl+0x72/0x8e
  [<ffffffe000af1648>] dump_stack+0x14/0x1c
  [<ffffffe000239ad2>] ___might_sleep+0x12e/0x138
  [<ffffffe000239aec>] __might_sleep+0x10/0x18
  [<ffffffe000afe3fe>] down_read+0x22/0xa4
  [<ffffffe000207588>] do_page_fault+0xb0/0x2fe
  [<ffffffe000201b80>] ret_from_exception+0x0/0xc
  [<ffffffe000613c06>] riscv_intc_irq+0x1a/0x72
  [<ffffffe000201b80>] ret_from_exception+0x0/0xc
  [<ffffffe00033f44a>] vma_link+0x54/0x160
  [<ffffffe000341d7a>] mmap_region+0x2cc/0x4d0
  [<ffffffe000342256>] do_mmap+0x2d8/0x3ac
  [<ffffffe000326318>] vm_mmap_pgoff+0x70/0xb8
  [<ffffffe00032638a>] vm_mmap+0x2a/0x36
  [<ffffffe0003cfdde>] elf_map+0x72/0x84
  [<ffffffe0003d05f8>] load_elf_binary+0x69a/0xec8
  [<ffffffe000376240>] bprm_execve+0x246/0x53a
  [<ffffffe00037786c>] kernel_execve+0xe8/0x124
  [<ffffffe000aecdf2>] run_init_process+0xfa/0x10c
  [<ffffffe000aece16>] try_to_run_init_process+0x12/0x3c
  [<ffffffe000afa920>] kernel_init+0xb4/0xf8
  [<ffffffe000201b80>] ret_from_exception+0x0/0xc

Here is the error injection test code for the above output:
 drivers/irqchip/irq-riscv-intc.c:
 static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
 {
        unsigned long cause = regs->cause & ~CAUSE_IRQ_FLAG;
+       u32 tmp; __get_user(tmp, (u32 *)0);

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Changbin Du <changbin.du@intel.com>
---
 arch/riscv/kernel/entry.S      | 2 +-
 arch/riscv/kernel/stacktrace.c | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index b9eda3fcbd6d..329cf51fcd4d 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -248,7 +248,7 @@ ret_from_syscall_rejected:
 	andi t0, t0, _TIF_SYSCALL_WORK
 	bnez t0, handle_syscall_trace_exit
 
-ret_from_exception:
+ENTRY(ret_from_exception)
 	REG_L s0, PT_STATUS(sp)
 	csrc CSR_STATUS, SR_IE
 #ifdef CONFIG_TRACE_IRQFLAGS
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index bcfe9eb55f80..75c8dd64fc48 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -16,6 +16,8 @@
 
 #ifdef CONFIG_FRAME_POINTER
 
+extern asmlinkage void ret_from_exception(void);
+
 void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			     bool (*fn)(void *, unsigned long), void *arg)
 {
@@ -59,6 +61,13 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			fp = frame->fp;
 			pc = ftrace_graph_ret_addr(current, NULL, frame->ra,
 						   &frame->ra);
+			if (pc == (unsigned long)ret_from_exception) {
+				if (unlikely(!__kernel_text_address(pc) || !fn(arg, pc)))
+					break;
+
+				pc = ((struct pt_regs *)sp)->epc;
+				fp = ((struct pt_regs *)sp)->s0;
+			}
 		}
 
 	}
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
