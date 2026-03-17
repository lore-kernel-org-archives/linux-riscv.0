Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071F9FB5EA6
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 02:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kqk19Vj0/Cotzcqc9SYN6HVpgTlMYrX0DOg7KVdVIPk=; b=30Dc/aj+hzOutP
	KgOArxlC6duAttwbeJ8/VbwHhb1E/hbdmO6Li3JhRPB4+jRqIX73TsOM0t18gMI/289/Uzpqb6KVm
	JwmeT6aez1Be0L94dcNiF7OBGdAN0qnLRO/aQ3ULqKq/YV0C4L6+UDn0IU4qvsCXqsPDb2YIYrSBc
	tLLR0j9+fbdhOLXb5LMVXfEpbDyizt6ymfEyjATGUbD7Ji3Fglrs25nSWxdmEB0UCKHN8NlQ3EkUw
	/S9UanVegiHQGN/jvN1vOMgcljN12tmOKfGgnOy07FR8qYepzka0dB3u84sjXgbgzjAGJfM7bEtce
	LbsdPiDh73oV8SMqhoFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2K55-00000005FNZ-2L9l;
	Tue, 17 Mar 2026 02:22:51 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2K50-00000005FMn-3T6V
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 02:22:50 +0000
Received: from localhost.localdomain (unknown [121.237.245.153])
	by APP-05 (Coremail) with SMTP id zQCowACHFQnturhpsbunCg--.37111S2;
	Tue, 17 Mar 2026 10:22:37 +0800 (CST)
From: daichengrong <daichengrong@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	daichengrong <daichengrong@iscas.ac.cn>
Subject: [RFC PATCH] riscv: add userspace interface to voluntarily release vector state
Date: Tue, 17 Mar 2026 10:22:32 +0800
Message-Id: <20260317022232.11022-1-daichengrong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowACHFQnturhpsbunCg--.37111S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuFykCr1xJFWDZr1xXFW8JFb_yoW7WF13pF
	s8CrWfJrWrCr1xur9Iy3ykWr4rGas5Ww4akr47Wa43A3W3KrW5Xr93Ka4DZF4UJFyY9a4j
	9ayYkrykCw4UAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AF
	wI0_JF0_Jw1lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
	73UjIFyTuYvjfU0YFCUUUUU
X-Originating-IP: [121.237.245.153]
X-CM-SenderInfo: pgdluxxhqj201qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_192247_953576_3641F66E 
X-CRM114-Status: GOOD (  16.28  )
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

Vector registers in RVV can be large, and saving/restoring them on
context switches introduces overhead. Some workloads only use
vector instructions in short phases, after which the vector state
does not need to be preserved.

This patch introduces a userspace-controlled mechanism:

- Userspace can declare that it no longer needs the vector state.
- Kernel will skip saving/restoring vector registers during context
  switch while the declaration is active.
- If the thread executes vector instructions after releasing its
  vector state, the kernel will revoke the declaration automatically.

This reduces unnecessary vector context switch overhead and improves
performance in workloads with intermittent vector usage.

This is an RFC patch to solicit feedback on the API design and
implementation approach.

Signed-off-by: daichengrong <daichengrong@iscas.ac.cn>
---
 arch/riscv/include/asm/processor.h |  1 +
 arch/riscv/include/asm/syscall.h   |  2 ++
 arch/riscv/include/asm/vector.h    |  7 +++++--
 arch/riscv/kernel/process.c        |  1 +
 arch/riscv/kernel/sys_riscv.c      | 12 ++++++++++++
 scripts/syscall.tbl                |  1 +
 6 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 4c3dd94d0f63..b59f1456918b 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -113,6 +113,7 @@ struct thread_struct {
 	unsigned long envcfg;
 	unsigned long sum;
 	u32 riscv_v_flags;
+	unsigned long riscv_v_release_flags;
 	u32 vstate_ctrl;
 	struct __riscv_v_ext_state vstate;
 	unsigned long align_ctl;
diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index 8067e666a4ca..f6be37b01a67 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -121,4 +121,6 @@ asmlinkage long sys_riscv_flush_icache(uintptr_t, uintptr_t, uintptr_t);
 
 asmlinkage long sys_riscv_hwprobe(struct riscv_hwprobe *, size_t, size_t,
 				  unsigned long *, unsigned int);
+// asmlinkage long sys_riscv_release_vector_register(uintptr_t);
+asmlinkage long sys_riscv_release_vector_register(void);
 #endif	/* _ASM_RISCV_SYSCALL_H */
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 00cb9c0982b1..4bccccc20cc3 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -309,6 +309,7 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 	if (__riscv_v_vstate_check(regs->status, DIRTY)) {
 		__riscv_v_vstate_save(vstate, vstate->datap);
 		__riscv_v_vstate_clean(regs);
+		WRITE_ONCE(current->thread.riscv_v_release_flags, 0);
 	}
 }
 
@@ -325,8 +326,10 @@ static inline void riscv_v_vstate_set_restore(struct task_struct *task,
 					      struct pt_regs *regs)
 {
 	if (riscv_v_vstate_query(regs)) {
-		set_tsk_thread_flag(task, TIF_RISCV_V_DEFER_RESTORE);
-		riscv_v_vstate_on(regs);
+		if (!READ_ONCE(current->thread.riscv_v_release_flags)) {
+			set_tsk_thread_flag(task, TIF_RISCV_V_DEFER_RESTORE);
+			riscv_v_vstate_on(regs);
+		}
 	}
 }
 
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index aacb23978f93..f1f36a3c7914 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -279,6 +279,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.ra = (unsigned long)ret_from_fork_user_asm;
 	}
 	p->thread.riscv_v_flags = 0;
+	p->thread.riscv_v_release_flags = 0;
 	if (has_vector() || has_xtheadvector())
 		riscv_v_thread_alloc(p);
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 22fc9b3268be..934ddc06858d 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -8,6 +8,7 @@
 #include <linux/syscalls.h>
 #include <asm/cacheflush.h>
 #include <asm-generic/mman-common.h>
+#include <asm/vector.h>
 
 static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 			   unsigned long prot, unsigned long flags,
@@ -78,6 +79,17 @@ SYSCALL_DEFINE3(riscv_flush_icache, uintptr_t, start, uintptr_t, end,
 	return 0;
 }
 
+SYSCALL_DEFINE0(riscv_release_vector_register)
+{
+	struct pt_regs *regs = task_pt_regs(current);
+
+	if (__riscv_v_vstate_check(regs->status, DIRTY))
+		__riscv_v_vstate_clean(regs);
+
+	WRITE_ONCE(current->thread.riscv_v_release_flags, 1);
+	return 0;
+}
+
 /* Not defined using SYSCALL_DEFINE0 to avoid error injection */
 asmlinkage long __riscv_sys_ni_syscall(const struct pt_regs *__unused)
 {
diff --git a/scripts/syscall.tbl b/scripts/syscall.tbl
index 7a42b32b6577..1d0a493b87c3 100644
--- a/scripts/syscall.tbl
+++ b/scripts/syscall.tbl
@@ -302,6 +302,7 @@
 
 244	or1k	or1k_atomic			sys_or1k_atomic
 
+257	riscv	riscv_release_vector_register	sys_riscv_release_vector_register
 258	riscv	riscv_hwprobe			sys_riscv_hwprobe
 259	riscv	riscv_flush_icache		sys_riscv_flush_icache
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
