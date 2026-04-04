Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5A1E88D6E
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 01:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/8t+Ay+iOiR9xnYYnHqokrSktzDPkEWB+P7yGc4Abk=; b=apB5TBovoNiSw/
	4Bhvbcwj91/CtjSBiYyJz0j1y6jnELQT9tVTd4I5MsNxk0288rJvZZxEOfkBABedRMDcunPXK/qoh
	Uz/A04zBKqNE0YXuSS72FjyoOkVQC/DW9Pzsds6jR6ZKJyCa456hhZx769tk8Fox68cklvT0Awf1o
	6SD2JRG/0tGtQn0lyhbi9DQCcr7LeAkuWnWdzuwQsaPPgaAAubNczRqF8RGLS436JsutOGTQ5e2n9
	iMrcdkcJ4/9CMxs461Pp6VTVoOrY67s9Mb8Kvr01J4E184vr2gDrAHMLZEJrz7wJ/TrNtmk+vby2i
	3Rf1JvgTh2cxgWrzdEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8q0m-00000002oTh-19b8;
	Sat, 04 Apr 2026 01:41:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8q0l-00000002oSz-42aj
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 01:41:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B2F160120;
	Sat,  4 Apr 2026 01:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2501CC19421;
	Sat,  4 Apr 2026 01:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775266878;
	bh=kD0cBryoX96eTC9pjebCqZ06QzmZhNx+YAqODHoei9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EkP7UGOEVxVR9dM76uHNWOjvhfNntjbqDVAG8DWuCSRsvMUWyvvvPkMwHsxEsLbp6
	 /yIX1QGSH67lKGg4O8Mt1NLBAGwPMdQw9NaKcEwpbevjzAjTQXR/cVYp6vyccHHviE
	 PgfdiKKSVmChVSm6a3MnC62nLbd4sEpUxNwMQzUxLqvL2zyLJxs6up094qpPAJBo2X
	 oKBuxTQ00L8PRw04ROvL6oswldIpDxv4dXecIsuM/vA0CvTdRSV77R6tcitqOhzObY
	 GDm5PX+/NX8WAXxfsmj/V2+LOky/8UfJhF0uiiVrfNKJSSXwnSlY7lrJcM+PLxrQX9
	 csFeAgeG74lGg==
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org,
	tglx@linutronix.de,
	peterz@infradead.org,
	broonie@kernel.org,
	Zong Li <zong.li@sifive.com>
Subject: [PATCH 2/6] riscv: cfi: clear CFI lock status in start_thread()
Date: Fri,  3 Apr 2026 19:41:16 -0600
Message-ID: <177526687341.878386.10443898249816468850.stgit@seppa>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <177526680875.878386.16551569883089050686.stgit@seppa>
References: <177526680875.878386.16551569883089050686.stgit@seppa>
User-Agent: StGit/0.19
MIME-Version: 1.0
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

From: Zong Li <zong.li@sifive.com>

When libc locks the CFI status through the following prctl:
 - PR_LOCK_SHADOW_STACK_STATUS
 - PR_LOCK_INDIR_BR_LP_STATUS

A newly execd address space will inherit the lock status
if it does not clear the lock bits. Since the lock bits
remain set, libc will later fail to enable the landing
pad and shadow stack.

Signed-off-by: Zong Li <zong.li@sifive.com>
Link: https://patch.msgid.link/20260323065640.4045713-1-zong.li@sifive.com
[pjw@kernel.org: ensure we unlock before changing state; cleaned up subject line]
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/include/asm/usercfi.h |    8 ++++----
 arch/riscv/kernel/process.c      |    2 ++
 arch/riscv/kernel/usercfi.c      |   12 ++++++------
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
index 7495baae1e3c..f56966edbf5c 100644
--- a/arch/riscv/include/asm/usercfi.h
+++ b/arch/riscv/include/asm/usercfi.h
@@ -39,7 +39,7 @@ void set_active_shstk(struct task_struct *task, unsigned long shstk_addr);
 bool is_shstk_enabled(struct task_struct *task);
 bool is_shstk_locked(struct task_struct *task);
 bool is_shstk_allocated(struct task_struct *task);
-void set_shstk_lock(struct task_struct *task);
+void set_shstk_lock(struct task_struct *task, bool lock);
 void set_shstk_status(struct task_struct *task, bool enable);
 unsigned long get_active_shstk(struct task_struct *task);
 int restore_user_shstk(struct task_struct *tsk, unsigned long shstk_ptr);
@@ -47,7 +47,7 @@ int save_user_shstk(struct task_struct *tsk, unsigned long *saved_shstk_ptr);
 bool is_indir_lp_enabled(struct task_struct *task);
 bool is_indir_lp_locked(struct task_struct *task);
 void set_indir_lp_status(struct task_struct *task, bool enable);
-void set_indir_lp_lock(struct task_struct *task);
+void set_indir_lp_lock(struct task_struct *task, bool lock);
 
 #define PR_SHADOW_STACK_SUPPORTED_STATUS_MASK (PR_SHADOW_STACK_ENABLE)
 
@@ -69,7 +69,7 @@ void set_indir_lp_lock(struct task_struct *task);
 
 #define is_shstk_allocated(task) false
 
-#define set_shstk_lock(task) do {} while (0)
+#define set_shstk_lock(task, lock) do {} while (0)
 
 #define set_shstk_status(task, enable) do {} while (0)
 
@@ -79,7 +79,7 @@ void set_indir_lp_lock(struct task_struct *task);
 
 #define set_indir_lp_status(task, enable) do {} while (0)
 
-#define set_indir_lp_lock(task) do {} while (0)
+#define set_indir_lp_lock(task, lock) do {} while (0)
 
 #define restore_user_shstk(tsk, shstk_ptr) -EINVAL
 
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 5957effab57c..b2df7f72241a 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -160,6 +160,7 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	 * clear shadow stack state on exec.
 	 * libc will set it later via prctl.
 	 */
+	set_shstk_lock(current, false);
 	set_shstk_status(current, false);
 	set_shstk_base(current, 0, 0);
 	set_active_shstk(current, 0);
@@ -167,6 +168,7 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	 * disable indirect branch tracking on exec.
 	 * libc will enable it later via prctl.
 	 */
+	set_indir_lp_lock(current, false);
 	set_indir_lp_status(current, false);
 
 #ifdef CONFIG_64BIT
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 1adba746f164..9052171c1a8c 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -74,9 +74,9 @@ void set_shstk_status(struct task_struct *task, bool enable)
 	csr_write(CSR_ENVCFG, task->thread.envcfg);
 }
 
-void set_shstk_lock(struct task_struct *task)
+void set_shstk_lock(struct task_struct *task, bool lock)
 {
-	task->thread_info.user_cfi_state.ubcfi_locked = 1;
+	task->thread_info.user_cfi_state.ubcfi_locked = lock;
 }
 
 bool is_indir_lp_enabled(struct task_struct *task)
@@ -104,9 +104,9 @@ void set_indir_lp_status(struct task_struct *task, bool enable)
 	csr_write(CSR_ENVCFG, task->thread.envcfg);
 }
 
-void set_indir_lp_lock(struct task_struct *task)
+void set_indir_lp_lock(struct task_struct *task, bool lock)
 {
-	task->thread_info.user_cfi_state.ufcfi_locked = 1;
+	task->thread_info.user_cfi_state.ufcfi_locked = lock;
 }
 /*
  * If size is 0, then to be compatible with regular stack we want it to be as big as
@@ -452,7 +452,7 @@ int arch_lock_shadow_stack_status(struct task_struct *task,
 	    !is_shstk_enabled(task) || arg != 0)
 		return -EINVAL;
 
-	set_shstk_lock(task);
+	set_shstk_lock(task, true);
 
 	return 0;
 }
@@ -502,7 +502,7 @@ int arch_lock_indir_br_lp_status(struct task_struct *task,
 	    !is_indir_lp_enabled(task) || arg != 0)
 		return -EINVAL;
 
-	set_indir_lp_lock(task);
+	set_indir_lp_lock(task, true);
 
 	return 0;
 }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
