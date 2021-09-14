Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B0EC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 12:13:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 750DB6112D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 12:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 750DB6112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ty/xDsHbSUNWLDSIcDJ0DGfbJi+CgQaofgzvCaNm4d4=; b=OHJ7S9+fvABCVp
	5RTsBmsm/6QZZWQ2/loSXUdYx7cLXHun/Ly3viXy3xFklqq0L8k3L+tEGqC7sHcbo5/u/TsphIx4J
	1blUSzc+75o3I0u/jk1y8gYODyzM3T8w4Gw9x4VFpVXwrKey6csxPEj/9VTjlsd0LD8Kn3MaRyLqK
	eq+z9LG1NBm2VpnBHmmp2chQ8CddnZso2uF5EhZAeoVX6HYRY/ANpZZ5I90HAVNg65fuBcVMjYfyI
	Ujoqrji1gCM3whNOuny5PDeDxkIKmjJMemSIRLAbDOAWzkXOVm/y3HFfTEF8ee6LHuMS/QN6Udkex
	gLTTurRaYbxmn3EbGsPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ7Jm-005aHg-QK; Tue, 14 Sep 2021 12:13:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ7HQ-005YwM-Lq; Tue, 14 Sep 2021 12:11:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2DEE6103B;
 Tue, 14 Sep 2021 12:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631621476;
 bh=Kj7AdLjk9dRbSxRbhe4+hhQ+UqbNDKHemx+IxWmvoNc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TzJIvOEIOpmXfZwzK1fGcRtZ1AJ6gHdJFZonxAsu5yeb23QMvOAZzgn1jTzcmC7D7
 Y9Xp3JLFCqSwMg5yNBekuYixSeGJMle39ftqovV11b595vCe/uW+RHR95JUi+C9gQt
 dfETGkTcetXFVM/ZUM+dKpKs5tU03Gv1Y/puwrlMZfPn482RfB3f//qcjM/UJAZ4Fr
 Rs5ZVsZ8nxd9GFp9Hr1MXlQspsUSdK/0zEqqdeEA5eq44sKGlbNlGWTVSSw0T6KULy
 ZI/b3XkNSeKGjVoAf7GKdLo5Xy9/dk6eYbIqXvYas4SoJMTczY+lrh3JhVBdzUgoCJ
 axau0kIfnkywg==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Keith Packard <keithpac@amazon.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>,
 Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
Subject: [RFC PATCH 5/8] sched: move CPU field back into thread_info if
 THREAD_INFO_IN_TASK=y
Date: Tue, 14 Sep 2021 14:10:33 +0200
Message-Id: <20210914121036.3975026-6-ardb@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914121036.3975026-1-ardb@kernel.org>
References: <20210914121036.3975026-1-ardb@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_051116_799908_EEB693FB 
X-CRM114-Status: GOOD (  15.87  )
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

THREAD_INFO_IN_TASK moved the CPU field out of thread_info, but this
causes some issues on architectures that define raw_smp_processor_id()
in terms of this field, due to the fact that #include'ing linux/sched.h
to get at struct task_struct is problematic in terms of circular
dependencies.

Given that thread_info and task_struct are the same data structure
anyway when THREAD_INFO_IN_TASK=y, let's move it back so that having
access to the type definition of struct thread_info is sufficient to
reference the CPU number of the current task.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/asm-offsets.c   | 1 -
 arch/arm64/kernel/head.S          | 2 +-
 arch/powerpc/kernel/asm-offsets.c | 2 +-
 arch/powerpc/kernel/smp.c         | 2 +-
 include/linux/sched.h             | 6 +-----
 kernel/sched/sched.h              | 4 ----
 6 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index cee9f3e9f906..0bfc048221af 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -27,7 +27,6 @@
 int main(void)
 {
   DEFINE(TSK_ACTIVE_MM,		offsetof(struct task_struct, active_mm));
-  DEFINE(TSK_CPU,		offsetof(struct task_struct, cpu));
   BLANK();
   DEFINE(TSK_TI_CPU,		offsetof(struct task_struct, thread_info.cpu));
   DEFINE(TSK_TI_FLAGS,		offsetof(struct task_struct, thread_info.flags));
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 17962452e31d..6a98f1a38c29 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -412,7 +412,7 @@ SYM_FUNC_END(__create_page_tables)
 	scs_load \tsk
 
 	adr_l	\tmp1, __per_cpu_offset
-	ldr	w\tmp2, [\tsk, #TSK_CPU]
+	ldr	w\tmp2, [\tsk, #TSK_TI_CPU]
 	ldr	\tmp1, [\tmp1, \tmp2, lsl #3]
 	set_this_cpu_offset \tmp1
 	.endm
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index e563d3222d69..e37e4546034e 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -93,7 +93,7 @@ int main(void)
 #endif /* CONFIG_PPC64 */
 	OFFSET(TASK_STACK, task_struct, stack);
 #ifdef CONFIG_SMP
-	OFFSET(TASK_CPU, task_struct, cpu);
+	OFFSET(TASK_CPU, task_struct, thread_info.cpu);
 #endif
 
 #ifdef CONFIG_LIVEPATCH
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 9cc7d3dbf439..512d875b45e0 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1223,7 +1223,7 @@ static void cpu_idle_thread_init(unsigned int cpu, struct task_struct *idle)
 	paca_ptrs[cpu]->kstack = (unsigned long)task_stack_page(idle) +
 				 THREAD_SIZE - STACK_FRAME_OVERHEAD;
 #endif
-	idle->cpu = cpu;
+	task_thread_info(idle)->cpu = cpu;
 	secondary_current = current_set[cpu] = idle;
 }
 
diff --git a/include/linux/sched.h b/include/linux/sched.h
index e12b524426b0..37aa521078e7 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -750,10 +750,6 @@ struct task_struct {
 #ifdef CONFIG_SMP
 	int				on_cpu;
 	struct __call_single_node	wake_entry;
-#ifdef CONFIG_THREAD_INFO_IN_TASK
-	/* Current CPU: */
-	unsigned int			cpu;
-#endif
 	unsigned int			wakee_flips;
 	unsigned long			wakee_flip_decay_ts;
 	struct task_struct		*last_wakee;
@@ -2114,7 +2110,7 @@ static __always_inline bool need_resched(void)
 static inline unsigned int task_cpu(const struct task_struct *p)
 {
 #ifdef CONFIG_THREAD_INFO_IN_TASK
-	return READ_ONCE(p->cpu);
+	return READ_ONCE(p->thread_info.cpu);
 #else
 	return READ_ONCE(task_thread_info(p)->cpu);
 #endif
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 3d3e5793e117..79fcbad11450 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1926,11 +1926,7 @@ static inline void __set_task_cpu(struct task_struct *p, unsigned int cpu)
 	 * per-task data have been completed by this moment.
 	 */
 	smp_wmb();
-#ifdef CONFIG_THREAD_INFO_IN_TASK
-	WRITE_ONCE(p->cpu, cpu);
-#else
 	WRITE_ONCE(task_thread_info(p)->cpu, cpu);
-#endif
 	p->wake_cpu = cpu;
 #endif
 }
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
