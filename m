Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19007EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 11:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0YiCps47gGMqsAsh6gmrFN1N3pyS4WMUnCfWDxJG5Yg=; b=Ledj9t4IrOrG11
	vMgSa9DIy9IxI/7lMpv+xiBqt+clk6Awch86MQ1c71rJnZy/6ouNg1ov5UhOj4U/ukLnQm4K9BY0c
	pjmojHmsP5xQOpLhBsx2/pWHtnyXvcbwRlMNZdsQwH6lPeOoMQ38+NdwDDTBJ6/WYZoGcivqIVxVS
	wa/rC+EMBPAcWvmIyGwqqRRa4KssjBlRm7qAavE8NG6NuAMDBSkjzshxrkBtSqq9yYCa5kKxBE0/A
	65vH28ntnMMc9ZULLyqfaddnOAFNJOW8Q2kLNOphZ0A8/0tidZ1MWyjZlgdKoIExRPe1/cVdOdMtp
	H5X43fUPsuNVeiXNGxdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoJy-00Dvbe-29;
	Fri, 21 Jul 2023 11:29:18 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoJv-00Dvas-1m
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 11:29:17 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b8b2886364so11613615ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 04:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689938954; x=1690543754;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pIlcMjCWX1E0dFpG7PlIot+p0pb5aBIdeoNALbljqW8=;
        b=mxUqp0waZbf7mSdX1yT6sea/FPoIo3mnePwNGairdKsS4g9sEslGJkTIUmdNfW7r/b
         ttmA5uPyp3a0L43JqmKKaD4bxibLS2SVdAn0bZdPaK9P4mxvUIquUxzW5Lr1fGsop2P6
         gWhzHgsa8zlzsYft+gBhB14Lq4uIOLICsNigyFpmvKUqHF6jzvpfXRKdvPQkr5RQH7zT
         H8rQgpP/bXXLWH90behHa7a3ltLwcAeh4p6Jfr6tHYl+h+G9z1hl7l5v2RVkWu/hzwo0
         Ie+z/Qz6X2xFzj2kGng+nM9HLhmjHbVwapxsbZgwcS05cdz3dnMwBIMgQis+4htVv5GA
         oEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689938954; x=1690543754;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pIlcMjCWX1E0dFpG7PlIot+p0pb5aBIdeoNALbljqW8=;
        b=XTemt+68k0KCTFB+6/btXwfySh40q14nGUyPkEOBiQ57fkeb/BeJAI6f6ZW8VkAB40
         WusNF4iXP+vpAMfClQX0TLG0xcxyEunvC3I+z6MbAvvm39aIPby9ECSSNTy/bwOrLh4+
         nPJnzlzMqaB4zOBoC+VLOzSFHxgm+MMvy6TVLAwt2fWDkmPqjr8ydUWtOL/z4cicdjWv
         W72FB5id+MA2xs2gUwMunvTTtD9nTNrTHgKKhVCAw8Sh0i9UNE7P6INjeiLdCwrlGvRk
         rMS/xkESny86pjNgMnIkxClA9AXOWC07/OBy2piHexDdqvYYO7Gi+m6zBx18Z2vRjt/m
         VC3w==
X-Gm-Message-State: ABy/qLaiHY+BVnncGOmAMxShmyQhqciiPGTyRZDJOO0A6hxQ0ImCes57
	SHz19IJmgXINKJWiBNdkgLGSmBmYLOC/mvdHURvI8JJzQ3iIF5izwlH2dImx0JXrhFKxYtVwiLb
	WQBvmB1hrC40KF/OQaoqPm9voz42uC4cB/ljdvn1pWSVJZcAtd0gjyDy+9E9p7MYId9Qxde2rOc
	wHAJi/B2SYhNiJ
X-Google-Smtp-Source: APBJJlFNHSxnpeC7NP25M4tGkB/cid/MNXzsabfkLVmehACLopNpmCNeb1fN/hYkSt23X6kEFWrz+A==
X-Received: by 2002:a17:902:d352:b0:1b7:d0b3:1678 with SMTP id l18-20020a170902d35200b001b7d0b31678mr1199110plk.17.1689938953653;
        Fri, 21 Jul 2023 04:29:13 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id c1-20020a170903234100b001b8953365aesm3243121plh.22.2023.07.21.04.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 04:29:12 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: vineetg@rivosinc.com,
	bjorn@kernel.org,
	greentime.hu@sifive.com,
	paul.walmsley@sifive.com,
	guoren@linux.alibaba.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	heiko.stuebner@vrull.eu,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yipeng Zou <zouyipeng@huawei.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Mathis Salmen <mathis.salmen@matsal.de>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [v2, 1/5] riscv: sched: defer restoring Vector context for user
Date: Fri, 21 Jul 2023 11:28:51 +0000
Message-Id: <20230721112855.1006-2-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230721112855.1006-1-andy.chiu@sifive.com>
References: <20230721112855.1006-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_042915_591023_5EAA7FD6 
X-CRM114-Status: GOOD (  16.68  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

User will use its Vector registers only after the kernel really returns
to the userspace. So we can delay restoring Vector registers as long as
we are still running in kernel mode. So, add a thread flag to indicates
the need of restoring Vector and do the restore at the last
arch-specific exit-to-user hook. This save the context restoring cost
when we switch over multiple processes that run V in kernel mode. For
example, if the kernel performs a context swicth from A->B->C, and
returns to C's userspace, then there is no need to restore B's
V-register.

Besides, this also prevents us from repeatedly restoring V context when
executing kernel-mode Vector multiple times for the upcoming kenel-mode
Vector patches.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changelog v2:
 - rename and add comment for the new thread flag (Conor)
---
 arch/riscv/include/asm/entry-common.h | 13 +++++++++++++
 arch/riscv/include/asm/thread_info.h  |  2 ++
 arch/riscv/include/asm/vector.h       | 11 ++++++++++-
 arch/riscv/kernel/process.c           |  2 ++
 arch/riscv/kernel/signal.c            |  2 +-
 arch/riscv/kernel/vector.c            |  2 +-
 6 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
index 6e4dee49d84b..52926f4d8d7c 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -4,6 +4,19 @@
 #define _ASM_RISCV_ENTRY_COMMON_H
 
 #include <asm/stacktrace.h>
+#include <asm/thread_info.h>
+#include <asm/vector.h>
+
+static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
+						  unsigned long ti_work)
+{
+	if (ti_work & _TIF_RISCV_V_DEFER_RESTORE) {
+		clear_thread_flag(TIF_RISCV_V_DEFER_RESTORE);
+		riscv_v_vstate_restore(current, regs);
+	}
+}
+
+#define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
 
 void handle_page_fault(struct pt_regs *regs);
 void handle_break(struct pt_regs *regs);
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 1833beb00489..b182f2d03e25 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -93,12 +93,14 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 #define TIF_NOTIFY_SIGNAL	9	/* signal notifications exist */
 #define TIF_UPROBE		10	/* uprobe breakpoint or singlestep */
 #define TIF_32BIT		11	/* compat-mode 32bit process */
+#define TIF_RISCV_V_DEFER_RESTORE	12 /* restore Vector before returing to user */
 
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
 #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 #define _TIF_UPROBE		(1 << TIF_UPROBE)
+#define _TIF_RISCV_V_DEFER_RESTORE	(1 << TIF_RISCV_V_DEFER_RESTORE)
 
 #define _TIF_WORK_MASK \
 	(_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED | \
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 3d78930cab51..a4f3705fd144 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -183,6 +183,15 @@ static inline void riscv_v_vstate_restore(struct task_struct *task,
 	}
 }
 
+static inline void riscv_v_vstate_set_restore(struct task_struct *task,
+					      struct pt_regs *regs)
+{
+	if ((regs->status & SR_VS) != SR_VS_OFF) {
+		set_tsk_thread_flag(task, TIF_RISCV_V_DEFER_RESTORE);
+		riscv_v_vstate_on(regs);
+	}
+}
+
 static inline void __switch_to_vector(struct task_struct *prev,
 				      struct task_struct *next)
 {
@@ -190,7 +199,7 @@ static inline void __switch_to_vector(struct task_struct *prev,
 
 	regs = task_pt_regs(prev);
 	riscv_v_vstate_save(prev, regs);
-	riscv_v_vstate_restore(next, task_pt_regs(next));
+	riscv_v_vstate_set_restore(next, task_pt_regs(next));
 }
 
 void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index e32d737e039f..ec89e7edb6fd 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -153,6 +153,7 @@ void flush_thread(void)
 	riscv_v_vstate_off(task_pt_regs(current));
 	kfree(current->thread.vstate.datap);
 	memset(&current->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
+	clear_tsk_thread_flag(current, TIF_RISCV_V_DEFER_RESTORE);
 #endif
 }
 
@@ -169,6 +170,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	*dst = *src;
 	/* clear entire V context, including datap for a new task */
 	memset(&dst->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
+	clear_tsk_thread_flag(dst, TIF_RISCV_V_DEFER_RESTORE);
 
 	return 0;
 }
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 180d951d3624..0fca2c128b5f 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -134,7 +134,7 @@ static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
 	if (unlikely(err))
 		return err;
 
-	riscv_v_vstate_restore(current, regs);
+	riscv_v_vstate_set_restore(current, regs);
 
 	return err;
 }
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 8d92fb6c522c..9d583b760db4 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -167,7 +167,7 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
 		return true;
 	}
 	riscv_v_vstate_on(regs);
-	riscv_v_vstate_restore(current, regs);
+	riscv_v_vstate_set_restore(current, regs);
 	return true;
 }
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
