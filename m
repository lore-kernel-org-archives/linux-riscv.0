Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E74606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 19:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t5OXCMi7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=KjR/MHCP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3vU4cX3pn8uu+XhhHDUl9W3y1gP+SVZNwZwgYPOzVLM=; b=t5OXCMi7loq5inYvKqqdYNdqYi
	YcAd1n8c1aFNVaYyXcOhakDcdPQ57hN7j14GcX1h8y0TUT7rJuOpAg4MCRqcmS9FyII5P0XoEO9xQ
	ZhZHeJ4qchwxpekSQZrygBO9CYbvQ4sSzaPDkA3Q0EzJydRT19O69bPziEOql+5IdFbuP3uAt7OtQ
	r8KM5w63lw6cX7fRCxHraKbeei3bRAk/8EnSQzygRTH467ih1b6+jLJdTRywTFeXjtFaqmoEkSxVX
	eyilQ6Rm0H/pCniR0uMsZT0CFf9y7dPIMEB38HX3Hq8ucbAgUx4xvmWiv3GHCsGMxb19FsN6Du8Xl
	ykKD4dZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDZG-00000007Slo-3nd1;
	Wed, 11 Nov 2026 19:01:10 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDZD-00000007Sji-1vpZ
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 19:01:09 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-8b360828905so35561497b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 11:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1794423666; x=1795028466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B1oPuIWu7B9M1Uly5bqaDdGLLTriJbsjACORZORkqD4=;
        b=KjR/MHCPL/KI2OImk5cYHKI+Y+mb0pLvgCPl0DRb/aYPJalSQ9YYdjigkf5nNyhcKq
         KINVkfWKXJ0TwDJuwBEiQNnI0Ne7/T927pzCkEygyAsA/0X++3P1+OglItOy2Z9x29AS
         cpRUlyJ719GKk8xF+/q3vpEFSS9o8DhZqhASYetA+vai3YIqlrMml1zhN0OzJ4tr5uyG
         0bRmi+/lv2THxIQEc7mc4zz7XmdJ/403+fmXX9AeNXvDgnWz+Ohl0gjp94th6N7C8KKv
         moVXph3ArINdCDZg2ZOZAmKldRz9rJq1ky3VvEJncG6Ye57EeVE7H/2ukv86mtSut8Dx
         r+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423666; x=1795028466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B1oPuIWu7B9M1Uly5bqaDdGLLTriJbsjACORZORkqD4=;
        b=VTdoTRJs6VT3xFPNFxdRWv0+toezaqaXvBg46avSqBksBpr6yl15xc9Ek7xwLlmB34
         E8Wklwo7fBttRfDTxOxFypRsCjak2xh+DlM91ID4ZQyFFd2jCwcJhPLBTaldWfnvU7Zy
         g0WLfUO+JthxI7Mm65VH7sGtF+Z8hjl03WPQJ5tXyWAghRNHwjYb6rzG21mP8Iw5CKaF
         mEg8kXG0U0fWYh98ryG95fSHzKeJrDFE7kLGR/ipeqmGYAXwO+Y9U5P/Rk7quU5kdWZy
         QxKvmREwpJL+InNyyNu2B/N0yqLI4xwSCvm4zfcMGpRtHoYlOh29Oa7SuIYZbN8x7VTp
         5cOA==
X-Forwarded-Encrypted: i=1; AL+hErGQATKgMrdvfZwYOrN3DygoEGzQlHC/6fIIMDQupwxXEpr0i0IXotmyHjfp2YZl35Z+QVJ6z18kFFGn2w==@lists.infradead.org
X-Gm-Message-State: APuU4Z/mYQwz2bBmUr/jcUmkxWD7EHDLkb1Q4dSYagFfu4O4C97uBAXA
	tTkIjBg4l1YgxvzUa8ZElXvR4+glLCPaLGG//yGBbiYVzh5oLvVvED7G8jiQGOXjT7g=
X-Gm-Gg: AYBFou0YL85M5GeWRD3s1e17i6DBMRzdPxBqUs6I9OFLb+jrOlwV31YYDWjfeRJAA7f
	tuNseOrVwY2jU1epzI49q6T8ap44FXTBMJLhOwd9P4+U17B6Yto6hVVPDuuKojySBjoW03inqBp
	ds63kZMaGFYOhPUNVoLFBy1wf3Tmq5g1lpSqA8k3ri+xDsgECb5H9RkUd4x7BJmi/9Ujywi8hBO
	al4fNH7UQLVO/kGuvw4tqfl6I5M75sePMSf//ExEMBmDp1UTt6IRXdVDSEe7TXVVNMn4vgNgmZ4
	S/VMxXR54dAn+YlT//YugJ83IG4ZU6RI00c70yCNL+AEDgjjqij9TOxk+3uwZ6ze2OEQ8N4Sp6v
	9qWkoImwJbH3hYh+DGZXPcN58qAtm9DHNLoTcL0fdejxC3VIkqrnLGHOUH/BmdqaGgv/zvl/d9z
	o/YCRa8EUznUwKbGLajgoVJgpUFpJcULO5TiwBHP/jwED8C03ju0Uyr7XYwAByHUDqhHk6/t5uk
	iarqXma8ymh3QHsGcoidWVITIYdn0+HpeDRlf7N+kOYHtz/hzZy7UcZIBnvGjBPBN2ODM3qKwN4
	WoVUqS1Isw60DtUQkYokB5+N7nPTiV2KAoU5owoFctPkHH0EjIJCA0x8AxKH9jX+30WIs/H9+3z
	isxngcuMAUakyQ0CqsqXx2ge/VEku2DzGJRv6Q8ArPnLaX0c=
X-Received: by 2002:a05:690c:e1c2:10b0:8b3:47ec:b20a with SMTP id 00721157ae682-8b3a80c2e4emr15072607b3.43.1794423665829;
        Wed, 11 Nov 2026 11:01:05 -0800 (PST)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a2354sm5209197d50.6.2026.11.11.11.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:01:05 -0800 (PST)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	daichengrong <daichengrong@iscas.ac.cn>,
	gdb@sourceware.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Anup Patel <anup@brainfault.org>,
	Guobin Zhang <guobin.zhang@intel.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Deepak Gupta <debug@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v7 3/6] riscv: clarify vector state semantics on syscall and context switch
Date: Wed, 11 Nov 2026 12:43:25 -0600
Message-ID: <20261111184359.1239821-4-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111184359.1239821-1-tchiu@tenstorrent.com>
References: <20261111184359.1239821-1-tchiu@tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_110107_535227_7F2A261A 
X-CRM114-Status: GOOD (  28.32  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: daichengrong <daichengrong@iscas.ac.cn>

The RISC-V vector specification states that executing a system call
causes all caller-saved vector registers (v0-v31, vl, vtype) and vstart
to become unspecified.

Currently, after calling riscv_v_vstate_discard(), the vector state
may still be marked as DIRTY, which can mislead the context switch
logic into treating the registers as containing valid user data.

This patch clarifies and tightens the kernel-side semantics:

1. On syscall entry, the kernel checks the vector state via sstatus
   and set it to INIT if not already, indicating that the vector
   registers no longer contain meaningful user data. Context
   invalidation is required on restore.

   If the state is already set to INIT, it means that the user has not
   touched vector since the last invalidation. So no further action is
   required on restore.

2. During context switch, the vector state is saved only if the state is
   DIRTY. (no change)

3. On restore, if invalidation is required, the vector registers are
   overwritten with a known initial value and the state is set to INIT.

4. Ptrace writes (PTRACE_SETREGSET) during a syscall stop are silently
   dropped (returning 0). Returning an error like EINVAL would break
   debbugers like GDB, which disables the optional regset on receiving
   such error. On the otherhand, ptrace reads at a syscall stop always
   returns the nulled context.

Performance improvements on Blackhole x280:

Latency of getpid() with different status.VS upon syscall entry in ns:
status.VS	Before Patch	After Patch	Improvement
DIRTY		235.9		242.4		+6.5 (+2.7%) # regress
INIT		234.8		174.4		-60.4 (-25.7%)
OFF		178.2		174.5		-3.7 (-2.1%)

Context switch latencies in us:
Metric		Before Patch	After Patch	Improvement
Mean Latency	14.19		11.62		-2.57 (-18.1%)
Median Latency	13.51		11.01		-2.50 (-18.5%)
Max Latency	27.76		21.92		-5.84 (-21.0%)
Min Latency	8.99		8.12		-0.87 (-9.7%)

The metrics on context switch latencies are obtained by running the
following command 100 times:
$ taskset 0x2 ./lat_ctx_v -N 10000 -s 512 2

The program lat_ctx_v is a modified lat_ctx where benchmark processes
(parent/child) do a `vsetvli` to dirtify VS before making each write
syscall.

CC: gdb@sourceware.org
Signed-off-by: daichengrong <daichengrong@iscas.ac.cn>
Co-developed-by: Andy Chiu <tchiu@tenstorrent.com>
Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v7:
 - Fold the next patch from v6 into this to prevent exposing breaks in
   signal and ptrace.
Changelog v4:
 - Provide performance meassurement (Olof)
 - Aggregate riscv_v_{enable,disable} for better performance (reduces to
   ~240 ns/call when the user touches vector)
 - Do not invalidate again if user doesn't touch vector
Changelog v3:
 - rename vstate_on to vstate_init to prevent confusion
 - set context as clean at first-use trap to return zero'ed context
 - reduce context nulling operations by defering __vstate_discard to
   exit_to_user_mode_prepare.
---
 arch/riscv/include/asm/vector.h | 45 ++++++++++++++++++---------------
 arch/riscv/kernel/ptrace.c      |  7 ++++-
 arch/riscv/kernel/signal.c      |  7 ++++-
 arch/riscv/kernel/vector.c      | 29 +++++++++++++++++++--
 4 files changed, 64 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 7cd20f661596..e83f9e0046a9 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -40,6 +40,15 @@
 	_res;								\
 })
 
+#define __riscv_v_vstate_check_gt(_val, TYPE) ({			\
+	bool _res;							\
+	if (has_xtheadvector())						\
+		_res = ((_val) & SR_VS_THEAD) > SR_VS_##TYPE##_THEAD;	\
+	else								\
+		_res = ((_val) & SR_VS) > SR_VS_##TYPE;			\
+	_res;								\
+})
+
 extern unsigned long riscv_v_vsize;
 int riscv_v_setup_vsize(void);
 bool insn_is_vector(u32 insn_buf);
@@ -101,7 +110,7 @@ static inline void riscv_v_vstate_off(struct pt_regs *regs)
 	regs->status = __riscv_v_vstate_or(regs->status, OFF);
 }
 
-static inline void riscv_v_vstate_on(struct pt_regs *regs)
+static inline void riscv_v_vstate_init(struct pt_regs *regs)
 {
 	regs->status = __riscv_v_vstate_or(regs->status, INITIAL);
 }
@@ -294,16 +303,6 @@ static inline void __riscv_v_vstate_discard(void)
 		: "=&r" (vl) : "r" (vtype_inval));
 }
 
-static inline void riscv_v_vstate_discard(struct pt_regs *regs)
-{
-	if (riscv_v_vstate_query(regs)) {
-		riscv_v_enable();
-		__riscv_v_vstate_discard();
-		riscv_v_disable();
-		__riscv_v_vstate_dirty(regs);
-	}
-}
-
 static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 				       struct pt_regs *regs)
 {
@@ -319,21 +318,26 @@ static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
 					  struct pt_regs *regs)
 {
 	WARN_ON_ONCE(preemptible());
-
-	if (riscv_v_vstate_query(regs)) {
-		riscv_v_enable();
+	riscv_v_enable();
+	if (__riscv_v_vstate_check(regs->status, INITIAL))
+		__riscv_v_vstate_discard();
+	else if (__riscv_v_vstate_check(regs->status, CLEAN))
 		__riscv_v_vstate_restore(vstate, vstate->datap);
-		riscv_v_disable();
-		__riscv_v_vstate_clean(regs);
-	}
+	riscv_v_disable();
 }
 
 static inline void riscv_v_vstate_set_restore(struct task_struct *task,
 					      struct pt_regs *regs)
 {
-	if (riscv_v_vstate_query(regs)) {
+	if (riscv_v_vstate_query(regs))
 		set_tsk_thread_flag(task, TIF_RISCV_V_DEFER_RESTORE);
-		riscv_v_vstate_on(regs);
+}
+
+static inline void riscv_v_vstate_discard(struct pt_regs *regs)
+{
+	if (__riscv_v_vstate_check_gt(regs->status, INITIAL)) {
+		riscv_v_vstate_set_restore(current, regs);
+		riscv_v_vstate_init(regs);
 	}
 }
 
@@ -404,6 +408,7 @@ static inline void __switch_to_vector(struct task_struct *prev,
 			riscv_preempt_v_set_restore(next);
 		}
 	} else {
+		/* VS is never DIRTY at this point, there's no need to alter vstate here */
 		riscv_v_vstate_set_restore(next, task_pt_regs(next));
 	}
 }
@@ -429,7 +434,7 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_vstate_restore(vstate, regs)	do {} while (0)
 #define __switch_to_vector(__prev, __next)	do {} while (0)
 #define riscv_v_vstate_off(regs)		do {} while (0)
-#define riscv_v_vstate_on(regs)			do {} while (0)
+#define riscv_v_vstate_init(regs)		do {} while (0)
 #define riscv_v_thread_free(tsk)		do {} while (0)
 #define  riscv_v_setup_ctx_cache()		do {} while (0)
 #define riscv_v_thread_alloc(tsk)		do {} while (0)
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 88442ac4f6ae..d329518cceb6 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -218,13 +218,18 @@ static int riscv_vr_set(struct task_struct *target,
 	int ret;
 	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
 	struct __riscv_v_regset_state ptrace_vstate;
+	struct pt_regs *regs = task_pt_regs(target);
 
 	if (!(has_vector() || has_xtheadvector()))
 		return -EINVAL;
 
-	if (!riscv_v_vstate_query(task_pt_regs(target)))
+	if (!riscv_v_vstate_query(regs))
 		return -ENODATA;
 
+	/* Silently drop the modification to tracee as no vreg lives across a syscall */
+	if (__riscv_v_vstate_check(regs->status, INITIAL))
+		return 0;
+
 	/* Copy rest of the vstate except datap */
 	memset(&ptrace_vstate, 0, sizeof(ptrace_vstate));
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ptrace_vstate, 0,
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 50c77bcf2b09..dc785aca1cc4 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -119,10 +119,15 @@ static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
 	/*
 	 * Mark the vstate as clean prior performing the actual copy,
 	 * to avoid getting the vstate incorrectly clobbered by the
-	 *  discarded vector state.
+	 * discarded vector state.
+	 *
+	 * This also allows user to modify vregs through the signal
+	 * interface at a syscall stop. e.g. to support user space
+	 * context switching.
 	 */
 	preempt_disable();
 	riscv_v_vstate_set_restore(current, regs);
+	__riscv_v_vstate_clean(regs);
 	preempt_enable();
 
 	/* Copy everything of __sc_riscv_v_state except datap. */
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 924baa71af7e..6fd541f5d5cb 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -29,15 +29,40 @@ static struct kmem_cache *riscv_v_kernel_cachep;
 unsigned long riscv_v_vsize __read_mostly;
 EXPORT_SYMBOL_GPL(riscv_v_vsize);
 
+/*
+ * Context memory is not coherent to register when sstatus.vs is set to INITIAL. This function
+ * take the INITIAL state into consideration and reflect the nulled state into context memory.
+ * Assume the target task is not actively running when tsk != current
+ */
 void riscv_v_ucontext_save(struct task_struct *tsk)
 {
 	struct __riscv_v_ext_state *vstate = &tsk->thread.vstate;
 	struct pt_regs *regs = task_pt_regs(tsk);
 
+	/*
+	 * Do not set vstate as clean when it is INITIAL, otherwise we lose track of the nulled
+	 * state in ptrace.
+	 */
 	if (tsk == current) {
 		get_cpu_vector_context();
-		riscv_v_vstate_save(vstate, regs);
+		if (__riscv_v_vstate_check(regs->status, INITIAL)) {
+			riscv_v_enable();
+			__riscv_v_vstate_discard();
+			__riscv_v_vstate_save(vstate, vstate->datap);
+			riscv_v_disable();
+		} else {
+			riscv_v_vstate_save(vstate, regs);
+		}
 		put_cpu_vector_context();
+	} else if (__riscv_v_vstate_check(regs->status, INITIAL)) {
+		/*
+		 * If we are not current and VS == INITIAL, null out the context memory for tsk
+		 * using kernel mode vector.
+		 */
+		kernel_vector_begin();
+		__riscv_v_vstate_discard();
+		__riscv_v_vstate_save(vstate, vstate->datap);
+		kernel_vector_end();
 	}
 }
 
@@ -233,7 +258,7 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
 		return true;
 	}
 
-	riscv_v_vstate_on(regs);
+	__riscv_v_vstate_clean(regs);
 	riscv_v_vstate_set_restore(current, regs);
 
 	return true;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
