Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240B4C7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=I6C8P/rEqq+nZ4xzjDI2vGcqnh3vOajMvD4cbDHmn6c=; b=LBpDKi+ZW2wp/hbT8nD17UsFIN
	O1QAC4kS1yz+xp+sYnegVfgtfFolZvfAbREFQUMYEy3/9HPs46LHajXZioZLwAcHr+YTXfal940el
	VHQDdbj/qSPh/aoHjT8jPR4cii5aHnHCel8bTqHs216Q/kbAwRyebnX9CWw35455YsE6M/ErgGHAu
	v48WlU1MneVIRXkUKT0amNsOjI7iT69NjRygcN1cX8rHguNWpRade2HFvOkHGJ8mUaZBi4WD8Dr1Q
	YS1bZuIUTFe0zRDI7EKyDBycJLUgv5woSLqen6cPP+8GWaxl8qNrVtb9Qy9YAC3bJDacXvQsROCBE
	RpqMK0Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbSv-003DnF-Au; Fri, 24 Feb 2023 17:02:37 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbSr-003DkZ-Gd
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:02:35 +0000
Received: by mail-pj1-x1033.google.com with SMTP id gi3-20020a17090b110300b0023762f642dcso3365480pjb.4
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 09:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cuVHwM8SAGoISZORc0pFtR8N61ah6dOlzZHoRJOSLIo=;
        b=YLJq0mLp+iQ+Vdr7xn4MIfa4VsG27uMObLT3tuc1EasV5G+NQ+79wengfpOI3VZ4dF
         Vv44pQ46QPD0Eak+Y4kb86nedFZs59tFUeeYY/PBGCGO7u5CgdLwadKz+tYVtgIfuWov
         0o/1rIrBE/tiR8QhoYTv2S3VGGnDpMuW9nvzpBBSI25Fxij+UmvaQhxA66iahVpMDxvx
         WCsntwA2t0dqMAWTLpiL58uVxq2WoT6DSxAb358omCo6owqfL69WuUNliAKUkBrshe8m
         ucbMZair0NvvbcLgG0CwGVddJEnTHHdYOYaZNAUY+2KOaMuX0eFb+4ow/oBB+/ExFz1+
         ggaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cuVHwM8SAGoISZORc0pFtR8N61ah6dOlzZHoRJOSLIo=;
        b=14CD2/PxypQguTe9rFVlWoA1GkAjyYWbad/B/oj3cSGT4Ms51BALAhj8zJUCu/gmjp
         yUlmstEhcXu22hbtKaORfWOOdpkT8byD4+1AiGPiGVdSyY2ucvBAeicli52donvkYxbz
         Jum3Ry9OnpLTCNF8PFnLic9zbQuH/kyraHhpcOYPKypEAyD28UxzMuhnyJUupa5XYm1N
         p3SuSiN8/vMaNtZ+ju0uuAgjg2mf/WEzC+GDLEvHZzlLI1VZIL7tgPnsvnslfyVBCnIS
         anEwGQsHdtNUCiHYTLxruE4D4HC2MTZyz9JemyuJDLQCLsEohc4plH+uz/SwnjB/lqNY
         SxUA==
X-Gm-Message-State: AO0yUKVTnwnqOeUckS5KvyniNm1J3ObapdImVDPTUWgZpytRKqhvKSf8
	bUMsj+BNGPowag4KUCC9zcSEjByHG2meBD0y8AperJ7OZ/AsIRsZHx2us4iRHUepYan4StRRO5l
	HoO5RCxaexjH5Q3l7RTnRlh1IkrmZCIF0ToQiQ7RQUynhZSkksLiUQdkFuQc1EpIKBv4wPuJwIr
	XlIUd0cBmlqA==
X-Google-Smtp-Source: AK7set/iEoKSIyULmeDYOrjpIv5td8+55ORgojii3FjvyrzjZRbRGpCctznPLg4f2d43QLaRVqysnQ==
X-Received: by 2002:a17:902:e543:b0:19c:d932:f063 with SMTP id n3-20020a170902e54300b0019cd932f063mr2255172plf.67.1677258152778;
        Fri, 24 Feb 2023 09:02:32 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9234731pls.251.2023.02.24.09.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:02:30 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [PATCH -next v14 09/19] riscv: Add task switch support for vector
Date: Fri, 24 Feb 2023 17:01:08 +0000
Message-Id: <20230224170118.16766-10-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224170118.16766-1-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090233_570790_9D0743E1 
X-CRM114-Status: GOOD (  19.51  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, Jisheng Zhang <jszhang@kernel.org>, Nick Knight <nick.knight@sifive.com>, vineetg@rivosinc.com, "Eric W. Biederman" <ebiederm@xmission.com>, Vincent Chen <vincent.chen@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Ruinland Tsai <ruinland.tsai@sifive.com>, Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Dmitry Vyukov <dvyukov@google.com>, Heiko Stuebner <heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

This patch adds task switch support for vector. It also supports all
lengths of vlen.

[guoren@linux.alibaba.com: First available porting to support vector
context switching]
[nick.knight@sifive.com: Rewrite vector.S to support dynamic vlen, xlen and
code refine]
[vincent.chen@sifive.com: Fix the might_sleep issue in riscv_v_vstate_save,
riscv_v_vstate_restore]
[andrew@sifive.com: Optimize task switch codes of vector]
[ruinland.tsai@sifive.com: Fix the arch_release_task_struct free wrong
datap issue]
[vineetg: Fixed lkp warning with W=1 build]
[andy.chiu: Use inline asm for task switches]

Suggested-by: Andrew Waterman <andrew@sifive.com>
Co-developed-by: Nick Knight <nick.knight@sifive.com>
Signed-off-by: Nick Knight <nick.knight@sifive.com>
Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Co-developed-by: Ruinland Tsai <ruinland.tsai@sifive.com>
Signed-off-by: Ruinland Tsai <ruinland.tsai@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/processor.h   |  1 +
 arch/riscv/include/asm/switch_to.h   |  3 ++
 arch/riscv/include/asm/thread_info.h |  3 ++
 arch/riscv/include/asm/vector.h      | 43 ++++++++++++++++++++++++++--
 arch/riscv/kernel/process.c          | 18 ++++++++++++
 5 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 94a0590c6971..f0ddf691ac5e 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -39,6 +39,7 @@ struct thread_struct {
 	unsigned long s[12];	/* s[0]: frame pointer */
 	struct __riscv_d_ext_state fstate;
 	unsigned long bad_cause;
+	struct __riscv_v_ext_state vstate;
 };
 
 /* Whitelist the fstate from the task_struct for hardened usercopy */
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 4b96b13dee27..a727be723c56 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -8,6 +8,7 @@
 
 #include <linux/jump_label.h>
 #include <linux/sched/task_stack.h>
+#include <asm/vector.h>
 #include <asm/hwcap.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
@@ -78,6 +79,8 @@ do {							\
 	struct task_struct *__next = (next);		\
 	if (has_fpu())					\
 		__switch_to_fpu(__prev, __next);	\
+	if (has_vector())					\
+		__switch_to_vector(__prev, __next);	\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index f704c8dd57e0..9e28c0199030 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -80,6 +80,9 @@ struct thread_info {
 	.preempt_count	= INIT_PREEMPT_COUNT,	\
 }
 
+void arch_release_task_struct(struct task_struct *tsk);
+int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
+
 #endif /* !__ASSEMBLY__ */
 
 /*
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 9c025f2efdc3..830f9d3c356b 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -10,6 +10,9 @@
 
 #ifdef CONFIG_RISCV_ISA_V
 
+#include <linux/sched.h>
+#include <linux/sched/task_stack.h>
+#include <asm/ptrace.h>
 #include <asm/hwcap.h>
 #include <asm/csr.h>
 #include <asm/asm.h>
@@ -75,7 +78,8 @@ static __always_inline void __vstate_csr_restore(struct __riscv_v_ext_state *src
 		    "r" (src->vcsr) :);
 }
 
-static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to, void *datap)
+static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
+					 void *datap)
 {
 	riscv_v_enable();
 	__vstate_csr_save(save_to);
@@ -93,7 +97,7 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to, vo
 }
 
 static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_from,
-				    void *datap)
+					    void *datap)
 {
 	riscv_v_enable();
 	asm volatile (
@@ -110,6 +114,38 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
 	riscv_v_disable();
 }
 
+static inline void riscv_v_vstate_save(struct task_struct *task,
+				       struct pt_regs *regs)
+{
+	if ((regs->status & SR_VS) == SR_VS_DIRTY) {
+		struct __riscv_v_ext_state *vstate = &task->thread.vstate;
+
+		__riscv_v_vstate_save(vstate, vstate->datap);
+		__riscv_v_vstate_clean(regs);
+	}
+}
+
+static inline void riscv_v_vstate_restore(struct task_struct *task,
+					  struct pt_regs *regs)
+{
+	if ((regs->status & SR_VS) != SR_VS_OFF) {
+		struct __riscv_v_ext_state *vstate = &task->thread.vstate;
+
+		__riscv_v_vstate_restore(vstate, vstate->datap);
+		__riscv_v_vstate_clean(regs);
+	}
+}
+
+static inline void __switch_to_vector(struct task_struct *prev,
+				      struct task_struct *next)
+{
+	struct pt_regs *regs;
+
+	regs = task_pt_regs(prev);
+	riscv_v_vstate_save(prev, regs);
+	riscv_v_vstate_restore(next, task_pt_regs(next));
+}
+
 #else /* ! CONFIG_RISCV_ISA_V  */
 
 struct pt_regs;
@@ -118,6 +154,9 @@ static __always_inline bool has_vector(void) { return false; }
 static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
 #define riscv_v_vsize (0)
 #define riscv_v_setup_vsize()	 do {} while (0)
+#define riscv_v_vstate_save(task, regs)		do {} while (0)
+#define riscv_v_vstate_restore(task, regs)	do {} while (0)
+#define __switch_to_vector(__prev, __next)	do {} while (0)
 #define riscv_v_vstate_off(regs)		do {} while (0)
 #define riscv_v_vstate_on(regs)			do {} while (0)
 
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 8955f2432c2d..5e9506a32fbe 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -24,6 +24,7 @@
 #include <asm/switch_to.h>
 #include <asm/thread_info.h>
 #include <asm/cpuidle.h>
+#include <asm/vector.h>
 
 register unsigned long gp_in_global __asm__("gp");
 
@@ -148,12 +149,28 @@ void flush_thread(void)
 	fstate_off(current, task_pt_regs(current));
 	memset(&current->thread.fstate, 0, sizeof(current->thread.fstate));
 #endif
+#ifdef CONFIG_RISCV_ISA_V
+	/* Reset vector state */
+	riscv_v_vstate_off(task_pt_regs(current));
+	kfree(current->thread.vstate.datap);
+	memset(&current->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
+#endif
+}
+
+void arch_release_task_struct(struct task_struct *tsk)
+{
+	/* Free the vector context of datap. */
+	if (has_vector() && tsk->thread.vstate.datap)
+		kfree(tsk->thread.vstate.datap);
 }
 
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 {
 	fstate_save(src, task_pt_regs(src));
 	*dst = *src;
+	/* clear entire V context, including datap for a new task */
+	memset(&dst->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
+
 	return 0;
 }
 
@@ -186,6 +203,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		childregs->a0 = 0; /* Return value of fork() */
 		p->thread.ra = (unsigned long)ret_from_fork;
 	}
+	riscv_v_vstate_off(childregs);
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
