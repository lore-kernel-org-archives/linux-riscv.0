Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F20DC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 16:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XvXfgqpteKS561cvU4tQ2897kCwibucMnvL8DpMOPUs=; b=hlHAcLr6fxgxoE
	XM26O6W1Gd1GUfhPPDUAJLsFyT2tHSaKHs6RWjQQ0t5qn0G6i3sIrKOYohEfEmpw0MmYbPfcDB2e3
	1Tj0/OQWkfAzeJZxJQ7DLHYVvGGGyXYybdtOxzDypJ+souan5C0B52F/L7uA7eYtKwhHR18XsSWCZ
	z2Cd73ZwqASNpNXlttr8nnSRvm+jNiJHYw4mR4zo/RcMq2iuLHXfEv+YTH4PIQCWp2eY4ifxnw8Fa
	zLqyR0VmsRrM3aTEuRSkgVU0uMemwZzWjKh1HmTjVP7Vx/qAFnSYHwFQBNuE0MOJp9DimOyN00qS7
	Euxh/uTZo2pDZiEXx/Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2un-00C3Vx-OO; Wed, 21 Sep 2022 16:49:37 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2uk-00C3TL-F9
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 16:49:36 +0000
Received: by mail-wr1-x432.google.com with SMTP id y5so10923663wrh.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 09:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=4K1uDO9M+U3uhs0pS3WI7ZtfRXH39QR/ccbpGWue5u8=;
        b=ZYUL8hKVRVwZHczz+pjLeA7hUvH88E6L/P8A1Q7z9NkC+ONfAoz7OALb3GTRVAjxoy
         u3PexYABDFopnpyyOPT7HcC4tNHy1t5E5OPTlr8HDYzY77lkf46HQ9E/k03ptjweuHfw
         F302cByhgGuDF203jKkdcAxaSdhvqQi27GzbV1Cv/NAwj6pOMqHtI14tA6Fu5SCil7xQ
         VUFgm7kDOMyGCboajL7lVmGeWYmcxRVYgDrB3igGYsruDAIhRvQJ6Oq+UsXXpLSx2v8C
         N/gIJAnd3AAjXfZFYWSnweEhInpiawpydaCM9CCTZsmX1zcM/1gpaWTDkBo04ZVjJovL
         0fHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=4K1uDO9M+U3uhs0pS3WI7ZtfRXH39QR/ccbpGWue5u8=;
        b=ooWK+k+zUpFNdejjObUG7u/Xm2jzjFVSL9mMHH/n/PBXMw0wdngJL0qiAF6+Zi5xL7
         AvPgiMsHCtfi8zMc0D1WaWKAiodtMhqn8miFBz1RS5e+XELPOL7KYY4zSaHHjcDEabzn
         Pf5xJi2nu3MDRnYnOumwHZH3OqECMomoA9TepvpWWtZhTztfKNkor/fC2BLnxEsrDa+t
         QHx2+da51A+EFS83U2nYBznHgAifLQ5gZ/Wi7fWKJRlz5qhXopI5zlOAdED2xSy1n08w
         PqtwXmYAEHElvpbFtzPTBmblj+S2rhuOnOpKySGcYdMWNRD07VKtAfpiGJC1bM2VcFXo
         kXbA==
X-Gm-Message-State: ACrzQf2IjA49rGGw73EHlvIL+LmwMkGLlGJ2qSJGMS3L17DLGbQbjfKQ
	unD2lvjTTCNeZGqpLc3OUgCei4Nn40fDZSQ5fTPE1lNPFNwZnQ==
X-Google-Smtp-Source: AMsMyM43Zr2+QEQqDJmmUhXf9yZ2Xc2hLk+VzDJSYQG1MqhQiipkN2DV4Ec/8ahNl6zfUZV97mjqnhRqYjwe+aaKoww=
X-Received: by 2002:a05:6000:1886:b0:22a:2944:a09 with SMTP id
 a6-20020a056000188600b0022a29440a09mr18104425wri.391.1663778971832; Wed, 21
 Sep 2022 09:49:31 -0700 (PDT)
MIME-Version: 1.0
From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 09:48:55 -0700
Message-ID: <CAM2SziWt9RdcEYvSU=e+599Q+ZF7yqCuh66tuzq89E1VqGq5dg@mail.gmail.com>
Subject: [PATCH 10/17] riscv: Add sigcontext save/restore for vector
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_094934_532466_4164CECF 
X-CRM114-Status: GOOD (  22.46  )
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

This patch adds sigcontext save/restore for vector. The vector registers
will be saved in datap pointer. The datap pointer will be allocated
dynamically when the task needs in kernel space. The datap pointer will
be set right after the __riscv_v_state data structure to save all the
vector registers in the signal handler stack.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/uapi/asm/sigcontext.h |  24 ++++
 arch/riscv/kernel/asm-offsets.c          |   2 +
 arch/riscv/kernel/signal.c               | 165 ++++++++++++++++++++++-
 3 files changed, 187 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/sigcontext.h
b/arch/riscv/include/uapi/asm/sigcontext.h
index 84f2dfcfdbce..b8a0fd7d7cfc 100644
--- a/arch/riscv/include/uapi/asm/sigcontext.h
+++ b/arch/riscv/include/uapi/asm/sigcontext.h
@@ -8,6 +8,23 @@

 #include <asm/ptrace.h>

+/* The Magic number for signal context frame header. */
+#define RVV_MAGIC      0x53465457
+#define END_MAGIC      0x0
+
+/* The size of END signal context header. */
+#define END_HDR_SIZE   0x0
+
+struct __riscv_ctx_hdr {
+       __u32 magic;
+       __u32 size;
+};
+
+struct __sc_riscv_v_state {
+       struct __riscv_ctx_hdr head;
+       struct __riscv_v_state v_state;
+} __attribute__((aligned(16)));
+
 /*
  * Signal context structure
  *
@@ -17,6 +34,13 @@
 struct sigcontext {
        struct user_regs_struct sc_regs;
        union __riscv_fp_state sc_fpregs;
+       /*
+        * 4K + 128 reserved for vector state and future expansion.
+        * This space is enough to store the vector context whose VLENB
+        * is less or equal to 128.
+        * (The size of the vector context is 4144 byte as VLENB is 128)
+        */
+       __u8 __reserved[4224] __attribute__((__aligned__(16)));
 };

 #endif /* _UAPI_ASM_RISCV_SIGCONTEXT_H */
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 37e3e6a8d877..80316ef7bb78 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -75,6 +75,8 @@ void asm_offsets(void)
        OFFSET(TSK_STACK_CANARY, task_struct, stack_canary);
 #endif

+       OFFSET(RISCV_V_STATE_MAGIC, __riscv_ctx_hdr, magic);
+       OFFSET(RISCV_V_STATE_SIZE, __riscv_ctx_hdr, size);
        OFFSET(RISCV_V_STATE_VSTART, __riscv_v_state, vstart);
        OFFSET(RISCV_V_STATE_VL, __riscv_v_state, vl);
        OFFSET(RISCV_V_STATE_VTYPE, __riscv_v_state, vtype);
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 38b05ca6fe66..41d9a02c7098 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -20,15 +20,16 @@
 #include <asm/csr.h>

 extern u32 __user_rt_sigreturn[2];
+static size_t rvv_sc_size;

 #define DEBUG_SIG 0

 struct rt_sigframe {
        struct siginfo info;
-       struct ucontext uc;
 #ifndef CONFIG_MMU
        u32 sigreturn_code[2];
 #endif
+       struct ucontext uc;
 };

 #ifdef CONFIG_FPU
@@ -85,16 +86,155 @@ static long save_fp_state(struct pt_regs *regs,
 #define restore_fp_state(task, regs) (0)
 #endif

+#ifdef CONFIG_VECTOR
+static long restore_v_state(struct pt_regs *regs, void **sc_reserved_ptr)
+{
+       long err;
+       struct __sc_riscv_v_state __user *state = (struct
__sc_riscv_v_state *)(*sc_reserved_ptr);
+       void *datap;
+       __u32 magic;
+       __u32 size;
+
+       /* Get magic number and check it. */
+       err = __get_user(magic, &state->head.magic);
+       err = __get_user(size, &state->head.size);
+       if (unlikely(err))
+               return err;
+
+       if (magic != RVV_MAGIC || size != rvv_sc_size)
+               return -EINVAL;
+
+       /* Copy everything of __sc_riscv_v_state except datap. */
+       err = __copy_from_user(&current->thread.vstate, &state->v_state,
+                              RISCV_V_STATE_DATAP);
+       if (unlikely(err))
+               return err;
+
+       /* Copy the pointer datap itself. */
+       err = __get_user(datap, &state->v_state.datap);
+       if (unlikely(err))
+               return err;
+
+
+       /* Copy the whole vector content from user space datap. */
+       err = __copy_from_user(current->thread.vstate.datap, datap,
riscv_vsize);
+       if (unlikely(err))
+               return err;
+
+       vstate_restore(current, regs);
+
+       /* Move sc_reserved_ptr to point the next signal context frame. */
+       *sc_reserved_ptr += size;
+
+       return err;
+}
+
+static long save_v_state(struct pt_regs *regs, void **sc_reserved_free_ptr)
+{
+       /*
+        * Put __sc_riscv_v_state to the user's signal context space pointed
+        * by sc_reserved_free_ptr and the datap point the address right
+        * after __sc_riscv_v_state.
+        */
+       struct __sc_riscv_v_state __user *state = (struct __sc_riscv_v_state *)
+               (*sc_reserved_free_ptr);
+       void *datap = state + 1;
+       long err;
+
+       *sc_reserved_free_ptr += rvv_sc_size;
+
+       err = __put_user(RVV_MAGIC, &state->head.magic);
+       err = __put_user(rvv_sc_size, &state->head.size);
+
+       vstate_save(current, regs);
+       /* Copy everything of vstate but datap. */
+       err = __copy_to_user(&state->v_state, &current->thread.vstate,
+                            RISCV_V_STATE_DATAP);
+       if (unlikely(err))
+               return err;
+
+       /* Copy the pointer datap itself. */
+       err = __put_user(datap, &state->v_state.datap);
+       if (unlikely(err))
+               return err;
+
+       /* Copy the whole vector content to user space datap. */
+       err = __copy_to_user(datap, current->thread.vstate.datap, riscv_vsize);
+
+       return err;
+}
+#else
+#define save_v_state(task, regs) (0)
+#define restore_v_state(task, regs) (0)
+#endif
+
 static long restore_sigcontext(struct pt_regs *regs,
        struct sigcontext __user *sc)
 {
        long err;
+       void *sc_reserved_ptr = sc->__reserved;
        /* sc_regs is structured the same as the start of pt_regs */
        err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
        /* Restore the floating-point state. */
        if (has_fpu())
                err |= restore_fp_state(regs, &sc->sc_fpregs);
+
+       while (1 && !err) {
+               __u32 magic, size;
+               struct __riscv_ctx_hdr *head = (struct __riscv_ctx_hdr
*)sc_reserved_ptr;
+
+               err |= __get_user(magic, &head->magic);
+               err |= __get_user(size, &head->size);
+               if (err)
+                       goto done;
+
+               switch (magic) {
+               case 0:
+                       if (size)
+                               goto invalid;
+                       goto done;
+               case RVV_MAGIC:
+                       if (!has_vector())
+                               goto invalid;
+                       if (size != rvv_sc_size)
+                               goto invalid;
+                       err |= restore_v_state(regs, &sc_reserved_ptr);
+                       break;
+               default:
+                       goto invalid;
+               }
+       }
+done:
        return err;
+
+invalid:
+       return -EINVAL;
+}
+
+static size_t cal_rt_frame_size(void)
+{
+       struct rt_sigframe __user *frame;
+       static size_t frame_size;
+       size_t total_context_size = 0;
+       size_t sc_reserved_size = sizeof(frame->uc.uc_mcontext.__reserved);
+
+       if (frame_size)
+               goto done;
+
+       frame_size = sizeof(*frame);
+
+       if (has_vector())
+               total_context_size += rvv_sc_size;
+       /* Preserved a __riscv_ctx_hdr for END signal context header. */
+       total_context_size += sizeof(struct __riscv_ctx_hdr);
+
+       if (total_context_size > sc_reserved_size)
+               frame_size += (total_context_size - sc_reserved_size);
+
+       frame_size = round_up(frame_size, 16);
+done:
+       return frame_size;
+
 }

 SYSCALL_DEFINE0(rt_sigreturn)
@@ -103,13 +243,14 @@ SYSCALL_DEFINE0(rt_sigreturn)
        struct rt_sigframe __user *frame;
        struct task_struct *task;
        sigset_t set;
+       size_t frame_size = cal_rt_frame_size();

        /* Always make any pending restarted system calls return -EINTR */
        current->restart_block.fn = do_no_restart_syscall;

        frame = (struct rt_sigframe __user *)regs->sp;

-       if (!access_ok(frame, sizeof(*frame)))
+       if (!access_ok(frame, frame_size))
                goto badframe;

        if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
@@ -142,11 +283,20 @@ static long setup_sigcontext(struct rt_sigframe
__user *frame,
 {
        struct sigcontext __user *sc = &frame->uc.uc_mcontext;
        long err;
+       void *sc_reserved_free_ptr = sc->__reserved;
+
        /* sc_regs is structured the same as the start of pt_regs */
        err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
        /* Save the floating-point state. */
        if (has_fpu())
                err |= save_fp_state(regs, &sc->sc_fpregs);
+       /* Save the vector state. */
+       if (has_vector())
+               err |= save_v_state(regs, &sc_reserved_free_ptr);
+
+       /* Put END __riscv_ctx_hdr at the end. */
+       err = __put_user(END_MAGIC, &((struct __riscv_ctx_hdr
*)sc_reserved_free_ptr)->magic);
+       err = __put_user(END_HDR_SIZE, &((struct __riscv_ctx_hdr
*)sc_reserved_free_ptr)->size);
        return err;
 }

@@ -178,9 +328,10 @@ static int setup_rt_frame(struct ksignal *ksig,
sigset_t *set,
 {
        struct rt_sigframe __user *frame;
        long err = 0;
+       size_t frame_size = cal_rt_frame_size();

-       frame = get_sigframe(ksig, regs, sizeof(*frame));
-       if (!access_ok(frame, sizeof(*frame)))
+       frame = get_sigframe(ksig, regs, frame_size);
+       if (!access_ok(frame, frame_size))
                return -EFAULT;

        err |= copy_siginfo_to_user(&frame->info, &ksig->info);
@@ -326,3 +477,9 @@ asmlinkage __visible void do_notify_resume(struct
pt_regs *regs,
        if (thread_info_flags & _TIF_NOTIFY_RESUME)
                resume_user_mode_work(regs);
 }
+
+void init_rt_signal_env(void);
+void __init init_rt_signal_env(void)
+{
+       rvv_sc_size = sizeof(struct __sc_riscv_v_state) + riscv_vsize;
+}
--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
