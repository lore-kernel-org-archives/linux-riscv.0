Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EAAC7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgGMEqC64Fh4lJ43+qWdDPENwx1IEPCUuFGLE6vTu2I=; b=vIIWGJucdr8KcV
	cHeN4jgdApk9uClYZNMRgbPhOp4wzIj9A2UBgiEkbtxVKMvbZ+WntS143vR3oQUsZzFNPppX63Lm2
	1HMbYpgCAJNBiLUXOSUXsAQO453AiI/JKNI9IFGGZtYV/VCr5sAoN0tZyWkLlcF1MMf1HOcmh7uZr
	oGYJJiTjA+HKJvRwsG+lpoWRxLNSI+eLg83EIo3Wp+tC7c9YthgGDY8N6vVCIntjXA/vFVVH54HpO
	Pq5fAyTTLIbk9odTXuRvsfsVFJk+J725MxpTXudVO7c5ASW1w5NCIQuID4+aBpmaFSMU1WmaZ5Y0T
	CI35mjWEpRfX05VxcOvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbTN-003E7B-F1; Fri, 24 Feb 2023 17:03:05 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbTK-003E4o-9m
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:03:04 +0000
Received: by mail-pj1-x102f.google.com with SMTP id y2so12819115pjg.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 09:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=75Miv22SHBi8JrhnNBDl8uvRiMa4XJY5yqvFgU4WUC0=;
        b=VvGYaFWMwqLlAwIn3k7+lGC6lLGEoDkAlSwFmQ9kPQb7mJMrD7ItwzsmTbyRiAwU7Q
         OtNBWdqBQNjAX91b29aBj2HwBpbRSYl4vBDd62GmtjynSeV2SBlE/naW/DxUGVcaF2p5
         a65f51UcOauPdRg5jvo4/A6FEE9nqJgDwn8j1aM4ejUapDi+hto8R8AY0XCF9VEEiDTw
         snJsmb+fwpBZR+9AZ5pnvXf4Dpi8crU2l9TFuguIjno3oaZQ5MebJsI+p2S9oPQX3BmD
         shuVkSIjjT91elc7mjC9+XT6vl5xRDQulQJstfDM0PSThu++uNt+bwDwBaSkdeuhR6jB
         iCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=75Miv22SHBi8JrhnNBDl8uvRiMa4XJY5yqvFgU4WUC0=;
        b=Wz/EF6bIBxD2YZyAcWAnWVfwe5iQZb9X3p6WGVt5ywb2I7NPhQyc1MPNlMXgpaJZr/
         bChjUKsXoYaxGGno/MiVq3qoMgXAYrXkjrcp8EaEUAIi+67gE25h42bZqaOwqlUFmEHG
         Ka0H8d5j9+ruabydXr5UXMOM+Tu3DFZdz25cMzKPLUzsFmFEyGgTONxizmMCFlyovvZL
         +DHRBmHa7N4iRtbgjuQwXUzGEF4ubdHTzMBa0Gpk4RxwcqnJx03ofeOdsuPugO9D5CNF
         fFRA1oy1ASJQwa3/+qR2DT+lC65iKq3/5kS9ajgeIvpT3XrQHtLvC8C181E6VTrTajrK
         W+Xg==
X-Gm-Message-State: AO0yUKVR5ovByE6BJ/JVJLD+BnPTwYxOdsevm5a7+eW7tZcPqXHkjD9Q
	l6l8DkHlsYSJyze+Y3iqJLfCLTM5BoymWtmCA3u2Xyq6rmD+kKMOIpOjVsSpEB6sbGpcJ/QaFZI
	6DjCAM4nEpICAPfKyKNTRJiZAt+GsqG8q/MhF53SWsO62cXdPRc+FNbKnk9Gv95IR9/F5mhq3sY
	aFfyKXssPJxw==
X-Google-Smtp-Source: AK7set/smceFxzDkhVFwpYJq3XJGP6EDnexj0baDUX1a8YvKzWfu7LJFypAQnX5Brh/dAd9iuprYyw==
X-Received: by 2002:a17:902:e54f:b0:19a:89d4:802f with SMTP id n15-20020a170902e54f00b0019a89d4802fmr19683539plf.57.1677258181082;
        Fri, 24 Feb 2023 09:03:01 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9234731pls.251.2023.02.24.09.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:03:00 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Henderson <richard.henderson@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Wenting Zhang <zephray@outlook.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH -next v14 13/19] riscv: signal: Add sigcontext save/restore for vector
Date: Fri, 24 Feb 2023 17:01:12 +0000
Message-Id: <20230224170118.16766-14-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224170118.16766-1-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090302_379853_FF08BC91 
X-CRM114-Status: GOOD (  32.87  )
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

From: Greentime Hu <greentime.hu@sifive.com>

This patch facilitates the existing fp-reserved words for placement of
the first extension's context header on the user's sigframe. A context
header consists of a distinct magic word and the size, including the
header itself, of an extension on the stack. Then, the frame is followed
by the context of that extension, and then a header + context body for
another extension if exists. If there is no more extension to come, then
the frame must be ended with a null context header. A special case is
rv64gc, where the kernel support no extensions requiring to expose
additional regfile to the user. In such case the kernel would place the
null context header right after the first reserved word of
__riscv_q_ext_state when saving sigframe. And the kernel would check if
all reserved words are zeros when a signal handler returns.

__riscv_q_ext_state---->|	|<-__riscv_extra_ext_header
			~	~
	.reserved[0]--->|0	|<-	.reserved
		<-------|magic	|<-	.hdr
		|	|size	|_______ end of sc_fpregs
		|	|ext-bdy|
		|	~	~
	+)size	------->|magic	|<- another context header
			|size	|
			|ext-bdy|
			~	~
			|magic:0|<- null context header
			|size:0	|

The vector registers will be saved in datap pointer. The datap pointer
will be allocated dynamically when the task needs in kernel space. On
the other hand, datap pointer on the sigframe will be set right after
the __riscv_v_ext_state data structure.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/uapi/asm/ptrace.h     |  15 ++
 arch/riscv/include/uapi/asm/sigcontext.h |  16 +-
 arch/riscv/kernel/setup.c                |   3 +
 arch/riscv/kernel/signal.c               | 186 ++++++++++++++++++++---
 4 files changed, 200 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index e8d127ec5cf7..e17c550986a6 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -71,6 +71,21 @@ struct __riscv_q_ext_state {
 	__u32 reserved[3];
 };
 
+struct __riscv_ctx_hdr {
+	__u32 magic;
+	__u32 size;
+};
+
+struct __riscv_extra_ext_header {
+	__u32 __padding[129] __attribute__((aligned(16)));
+	/*
+	 * Reserved for expansion of sigcontext structure.  Currently zeroed
+	 * upon signal, and must be zero upon sigreturn.
+	 */
+	__u32 reserved;
+	struct __riscv_ctx_hdr hdr;
+};
+
 union __riscv_fp_state {
 	struct __riscv_f_ext_state f;
 	struct __riscv_d_ext_state d;
diff --git a/arch/riscv/include/uapi/asm/sigcontext.h b/arch/riscv/include/uapi/asm/sigcontext.h
index 84f2dfcfdbce..8b8a8541673a 100644
--- a/arch/riscv/include/uapi/asm/sigcontext.h
+++ b/arch/riscv/include/uapi/asm/sigcontext.h
@@ -8,6 +8,17 @@
 
 #include <asm/ptrace.h>
 
+/* The Magic number for signal context frame header. */
+#define RISCV_V_MAGIC	0x53465457
+#define END_MAGIC	0x0
+
+/* The size of END signal context header. */
+#define END_HDR_SIZE	0x0
+
+struct __sc_riscv_v_state {
+	struct __riscv_v_ext_state v_state;
+} __attribute__((aligned(16)));
+
 /*
  * Signal context structure
  *
@@ -16,7 +27,10 @@
  */
 struct sigcontext {
 	struct user_regs_struct sc_regs;
-	union __riscv_fp_state sc_fpregs;
+	union {
+		union __riscv_fp_state sc_fpregs;
+		struct __riscv_extra_ext_header sc_extdesc;
+	};
 };
 
 #endif /* _UAPI_ASM_RISCV_SIGCONTEXT_H */
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 376d2827e736..b9b3e03b2564 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -262,6 +262,8 @@ static void __init parse_dtb(void)
 #endif
 }
 
+extern void __init init_rt_signal_env(void);
+
 void __init setup_arch(char **cmdline_p)
 {
 	parse_dtb();
@@ -299,6 +301,7 @@ void __init setup_arch(char **cmdline_p)
 
 	riscv_init_cbom_blocksize();
 	riscv_fill_hwcap();
+	init_rt_signal_env();
 	apply_boot_alternatives();
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
 	    riscv_isa_extension_available(NULL, ZICBOM))
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 0c8be5404a73..76c0480ee4cd 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -18,9 +18,11 @@
 #include <asm/signal.h>
 #include <asm/signal32.h>
 #include <asm/switch_to.h>
+#include <asm/vector.h>
 #include <asm/csr.h>
 
 extern u32 __user_rt_sigreturn[2];
+static size_t riscv_v_sc_size;
 
 #define DEBUG_SIG 0
 
@@ -62,34 +64,159 @@ static long save_fp_state(struct pt_regs *regs,
 #define restore_fp_state(task, regs) (0)
 #endif
 
+#ifdef CONFIG_RISCV_ISA_V
+
+static long save_v_state(struct pt_regs *regs, void **sc_vec)
+{
+	/*
+	 * Put __sc_riscv_v_state to the user's signal context space pointed
+	 * by sc_vec and the datap point the address right
+	 * after __sc_riscv_v_state.
+	 */
+	struct __riscv_ctx_hdr __user *hdr = (struct __riscv_ctx_hdr *)(*sc_vec);
+	struct __sc_riscv_v_state __user *state = (struct __sc_riscv_v_state *)(hdr + 1);
+	void __user *datap = state + 1;
+	long err;
+
+	/* datap is designed to be 16 byte aligned for better performance */
+	WARN_ON(unlikely(!IS_ALIGNED((unsigned long)datap, 16)));
+
+	riscv_v_vstate_save(current, regs);
+	/* Copy everything of vstate but datap. */
+	err = __copy_to_user(&state->v_state, &current->thread.vstate,
+			     offsetof(struct __riscv_v_ext_state, datap));
+	/* Copy the pointer datap itself. */
+	err |= __put_user(datap, &state->v_state.datap);
+	/* Copy the whole vector content to user space datap. */
+	err |= __copy_to_user(datap, current->thread.vstate.datap, riscv_v_vsize);
+	/* Copy magic to the user space after saving  all vector conetext */
+	err |= __put_user(RISCV_V_MAGIC, &hdr->magic);
+	err |= __put_user(riscv_v_sc_size, &hdr->size);
+	if (unlikely(err))
+		return err;
+
+	/* Only progress the sv_vec if everything has done successfully  */
+	*sc_vec += riscv_v_sc_size;
+	return 0;
+}
+
+/*
+ * Restore Vector extension context from the user's signal frame. This function
+ * assumes a valid extension header. So magic and size checking must be done by
+ * the caller.
+ */
+static long __restore_v_state(struct pt_regs *regs, void *sc_vec)
+{
+	long err;
+	struct __sc_riscv_v_state __user *state = (struct __sc_riscv_v_state *)(sc_vec);
+	void __user *datap;
+
+	/* Copy everything of __sc_riscv_v_state except datap. */
+	err = __copy_from_user(&current->thread.vstate, &state->v_state,
+			       offsetof(struct __riscv_v_ext_state, datap));
+	if (unlikely(err))
+		return err;
+
+	/* Copy the pointer datap itself. */
+	err = __get_user(datap, &state->v_state.datap);
+	if (unlikely(err))
+		return err;
+	/*
+	 * Copy the whole vector content from user space datap. Use
+	 * copy_from_user to prevent information leak.
+	 */
+	err = copy_from_user(current->thread.vstate.datap, datap, riscv_v_vsize);
+	if (unlikely(err))
+		return err;
+
+	riscv_v_vstate_restore(current, regs);
+
+	return err;
+}
+#else
+#define save_v_state(task, regs) (0)
+#define __restore_v_state(task, regs) (0)
+#endif
+
 static long restore_sigcontext(struct pt_regs *regs,
 	struct sigcontext __user *sc)
 {
+	void *sc_ext_ptr = &sc->sc_extdesc.hdr;
+	__u32 rsvd;
 	long err;
-	size_t i;
-
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
 	if (unlikely(err))
-		return err;
+		goto done;
 	/* Restore the floating-point state. */
 	if (has_fpu()) {
 		err = restore_fp_state(regs, &sc->sc_fpregs);
 		if (unlikely(err))
-			return err;
+			goto done;
 	}
 
-	/* We support no other extension state at this time. */
-	for (i = 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++) {
-		u32 value;
-
-		err = __get_user(value, &sc->sc_fpregs.q.reserved[i]);
-		if (unlikely(err))
+	/* Check the reserved word before extensions parsing */
+	err = __get_user(rsvd, &sc->sc_extdesc.reserved);
+	if (unlikely(err))
+		goto done;
+	if (unlikely(rsvd))
+		goto invalid;
+
+	while (1 && !err) {
+		__u32 magic, size;
+		struct __riscv_ctx_hdr *head = (struct __riscv_ctx_hdr *)sc_ext_ptr;
+
+		err |= __get_user(magic, &head->magic);
+		err |= __get_user(size, &head->size);
+		if (err)
+			goto done;
+
+		sc_ext_ptr += sizeof(struct __riscv_ctx_hdr);
+		switch (magic) {
+		case END_MAGIC:
+			if (size != END_HDR_SIZE)
+				goto invalid;
+			goto done;
+		case RISCV_V_MAGIC:
+			if (!has_vector() || !riscv_v_vstate_query(regs))
+				goto invalid;
+			if (size != riscv_v_sc_size)
+				goto invalid;
+			err = __restore_v_state(regs, sc_ext_ptr);
 			break;
-		if (value != 0)
-			return -EINVAL;
+		default:
+			goto invalid;
+		}
+		sc_ext_ptr = ((void *)(head) + size);
 	}
+done:
 	return err;
+invalid:
+	return -EINVAL;
+}
+
+static size_t cal_rt_frame_size(void)
+{
+	struct rt_sigframe __user *frame;
+	size_t frame_size;
+	size_t total_context_size = 0;
+
+	frame_size = sizeof(*frame);
+
+	if (has_vector() && riscv_v_vstate_query(task_pt_regs(current)))
+		total_context_size += riscv_v_sc_size;
+	/*
+	 * Preserved a __riscv_ctx_hdr for END signal context header if an
+	 * extension uses __riscv_extra_ext_header
+	 */
+	if (total_context_size)
+		total_context_size += sizeof(struct __riscv_ctx_hdr);
+
+	frame_size += (total_context_size);
+
+	frame_size = round_up(frame_size, 16);
+	return frame_size;
+
 }
 
 SYSCALL_DEFINE0(rt_sigreturn)
@@ -98,13 +225,14 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	struct rt_sigframe __user *frame;
 	struct task_struct *task;
 	sigset_t set;
+	size_t frame_size = cal_rt_frame_size();
 
 	/* Always make any pending restarted system calls return -EINTR */
 	current->restart_block.fn = do_no_restart_syscall;
 
 	frame = (struct rt_sigframe __user *)regs->sp;
 
-	if (!access_ok(frame, sizeof(*frame)))
+	if (!access_ok(frame, frame_size))
 		goto badframe;
 
 	if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
@@ -138,17 +266,22 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 	struct pt_regs *regs)
 {
 	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
+	void *sc_ext_ptr = &sc->sc_extdesc.hdr;
 	long err;
-	size_t i;
 
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
 	/* Save the floating-point state. */
 	if (has_fpu())
 		err |= save_fp_state(regs, &sc->sc_fpregs);
-	/* We support no other extension state at this time. */
-	for (i = 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++)
-		err |= __put_user(0, &sc->sc_fpregs.q.reserved[i]);
+	/* Save the vector state. */
+	if (has_vector() && riscv_v_vstate_query(regs))
+		err |= save_v_state(regs, &sc_ext_ptr);
+	/* Write zero to fp-reserved space and check it on restore_sigcontext */
+	err |= __put_user(0, &sc->sc_extdesc.reserved);
+	/* And put END __riscv_ctx_hdr at the end. */
+	err |= __put_user(END_MAGIC, &((struct __riscv_ctx_hdr *)sc_ext_ptr)->magic);
+	err |= __put_user(END_HDR_SIZE, &((struct __riscv_ctx_hdr *)sc_ext_ptr)->size);
 	return err;
 }
 
@@ -172,6 +305,13 @@ static inline void __user *get_sigframe(struct ksignal *ksig,
 	/* Align the stack frame. */
 	sp &= ~0xfUL;
 
+	/*
+	 * Fail if the size of the altstack is not large enough for the
+	 * sigframe construction.
+	 */
+	if (current->sas_ss_size && sp < current->sas_ss_sp)
+		return (void __user __force *)(-1UL);
+
 	return (void __user *)sp;
 }
 
@@ -180,9 +320,10 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 {
 	struct rt_sigframe __user *frame;
 	long err = 0;
+	size_t frame_size = cal_rt_frame_size();
 
-	frame = get_sigframe(ksig, regs, sizeof(*frame));
-	if (!access_ok(frame, sizeof(*frame)))
+	frame = get_sigframe(ksig, regs, frame_size);
+	if (!access_ok(frame, frame_size))
 		return -EFAULT;
 
 	err |= copy_siginfo_to_user(&frame->info, &ksig->info);
@@ -336,3 +477,10 @@ asmlinkage __visible void do_work_pending(struct pt_regs *regs,
 		thread_info_flags = read_thread_flags();
 	} while (thread_info_flags & _TIF_WORK_MASK);
 }
+
+void init_rt_signal_env(void);
+void __init init_rt_signal_env(void)
+{
+	riscv_v_sc_size = sizeof(struct __riscv_ctx_hdr) +
+			  sizeof(struct __sc_riscv_v_state) + riscv_v_vsize;
+}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
