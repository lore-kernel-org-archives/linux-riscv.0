Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC379C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 13:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOTAEaEA0s9K+OV0vnJyUkZfaqquyna7TmH7m+m+42U=; b=J2C55aaJuDb8Ao
	Sfte7/2qMekduvTyPgNr84n7XWxqjmrLuluOVhQtYYZYOKdtIEAS5NwL1bbUr7qMJ6b/4hw1YPpBG
	xs/rwyL9pKm/egv7gmxyScXIvxcHyS8Yva0Vsa38wMbDkvQFN2Fpo7Xhmtg3rJC5nWI4kTMpX92B7
	Wo9E+919/C3d0H3tOVWGzJ1mUTUaGB7PUYt7zYZ8HSfCnHVzsrw/w4ExVnvtwFbFu7f+kwccb7ZnT
	zev15mze64fjsRlag/ZcgK3gmBKxTrbBl5bW92YzSf+L53uwMgxAfn8dsVpmyifCARIqaTrqpbdSL
	QbonMYYlEwpE3ba9XnOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwNf4-003RZW-1G;
	Tue, 09 May 2023 13:45:50 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKeB-002tri-1B
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:32:45 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1aae46e62e9so40687545ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628362; x=1686220362;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZUzGFhvm0UcaxflcgjWv0Vpwl9g6jcVWZE3ozpjtnAU=;
        b=c8ZvwnFutAMPiL2BcXAbByanEozsdEBBDlEKAcJ34h2/kCW+0NIuy0Mu87Dwe7pWlH
         g0gd7Fk49WRPGiuoyqzHsdPkFkHo1VSn3sRXtpvQiycV/4CGfUMzh7kgvX4Giv2/Mhzs
         wnIa37gTv7OB0AXr5EEDgKjuqCwjB7qB9bKyj/cHx0lD7Hjva8kUpFkFnKeigttRCYdL
         J8JPXgv3P0aRtYotkccQt+KXPMgcOXVrEKZ/smm6ysx/rzaActMB6UbYtCZA7DZV7LkV
         UWyPEQwMLMLN4gmmzZ6BAy6zA8KEkpWSkajI6QbqXZwpiwq+yg7hUi3zVeAsSvvHCnc3
         /bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628362; x=1686220362;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUzGFhvm0UcaxflcgjWv0Vpwl9g6jcVWZE3ozpjtnAU=;
        b=a546mqlOqMYUMfWJ1m4rsonFC4C+ZLo94r5LkfR1eGXNimAAGEw9Any1qqNVfNmEir
         fAKZwBFOJqY1TAZ/hGkUsHAur7PXXtN9xaEiNIQE5ds4bLJAe299M7iopUmbnmdtHHbO
         NcFLoSTh1285BjzQlgNvA4YW60jBCwVVTLgOZSFJ+XM4uz1R59bcXksOXTw2fHrY6jSi
         e4BgNZMGRGGKyg0/oNUbBTkE0tu0M0N98H8d6s/oZg7y5JzBncvukPcAl8AWaSi9Idea
         KRsj0IkJWZau+Dyet4DzvUUYFyZ0o0o/qhRwzpycorsV0JYahuc7ZKh5PlApuDqG90eO
         XcPQ==
X-Gm-Message-State: AC+VfDze4uZRoPCiviX/dSR8VrHv2HOue4TRamf3PMbYx/1ehWlFmDkz
	M8VaZSWtdOJCwbsCQSRF81BLT4HNU9sRHrmq5mHxFwfPOhrJ08MaQGiojkDxrwNJh8VUmY6eiLH
	DqTD8IGCC6fhQJFw3VVU+PBlMrb0IhAFb88H37SC6WNrMmei/GXM9/ut8xD+tnhLlvmHpdWnoHF
	gHogpLHRs+JU4n
X-Google-Smtp-Source: ACHHUZ4dNzp0t7MjP9ivN9eojd53i39ZqjwRGOndiJGutyUOm1AspaCS+Hs5ONBXcWuz9cKt3YavUw==
X-Received: by 2002:a17:903:294d:b0:19d:1834:92b9 with SMTP id li13-20020a170903294d00b0019d183492b9mr12777266plb.56.1683628362159;
        Tue, 09 May 2023 03:32:42 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:32:41 -0700 (PDT)
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Wenting Zhang <zephray@outlook.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Mathis Salmen <mathis.salmen@matsal.de>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH -next v19 14/24] riscv: signal: Add sigcontext save/restore for vector
Date: Tue,  9 May 2023 10:30:23 +0000
Message-Id: <20230509103033.11285-15-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_033243_410698_45807FFB 
X-CRM114-Status: GOOD (  32.32  )
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
Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
Changelog V19:
 - Fix a conflict in signal.c due to commit 8d736482749f
   ("riscv: add icache flush for nommu sigreturn trampoline")

 arch/riscv/include/uapi/asm/ptrace.h     |  15 ++
 arch/riscv/include/uapi/asm/sigcontext.h |  16 ++-
 arch/riscv/kernel/setup.c                |   3 +
 arch/riscv/kernel/signal.c               | 174 +++++++++++++++++++++--
 4 files changed, 193 insertions(+), 15 deletions(-)

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
index 36b026057503..60ebe757ef20 100644
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
@@ -295,6 +297,7 @@ void __init setup_arch(char **cmdline_p)
 
 	riscv_init_cbo_blocksizes();
 	riscv_fill_hwcap();
+	init_rt_signal_env();
 	apply_boot_alternatives();
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
 	    riscv_isa_extension_available(NULL, ZICBOM))
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 6b4a5c90bd87..c46f3dc039bb 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -19,10 +19,12 @@
 #include <asm/signal.h>
 #include <asm/signal32.h>
 #include <asm/switch_to.h>
+#include <asm/vector.h>
 #include <asm/csr.h>
 #include <asm/cacheflush.h>
 
 extern u32 __user_rt_sigreturn[2];
+static size_t riscv_v_sc_size __ro_after_init;
 
 #define DEBUG_SIG 0
 
@@ -64,12 +66,87 @@ static long save_fp_state(struct pt_regs *regs,
 #define restore_fp_state(task, regs) (0)
 #endif
 
+#ifdef CONFIG_RISCV_ISA_V
+
+static long save_v_state(struct pt_regs *regs, void __user **sc_vec)
+{
+	struct __riscv_ctx_hdr __user *hdr;
+	struct __sc_riscv_v_state __user *state;
+	void __user *datap;
+	long err;
+
+	hdr = *sc_vec;
+	/* Place state to the user's signal context space after the hdr */
+	state = (struct __sc_riscv_v_state __user *)(hdr + 1);
+	/* Point datap right after the end of __sc_riscv_v_state */
+	datap = state + 1;
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
+static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
+{
+	long err;
+	struct __sc_riscv_v_state __user *state = sc_vec;
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
+	void __user *sc_ext_ptr = &sc->sc_extdesc.hdr;
+	__u32 rsvd;
 	long err;
-	size_t i;
-
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
 	if (unlikely(err))
@@ -82,32 +159,81 @@ static long restore_sigcontext(struct pt_regs *regs,
 			return err;
 	}
 
-	/* We support no other extension state at this time. */
-	for (i = 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++) {
-		u32 value;
+	/* Check the reserved word before extensions parsing */
+	err = __get_user(rsvd, &sc->sc_extdesc.reserved);
+	if (unlikely(err))
+		return err;
+	if (unlikely(rsvd))
+		return -EINVAL;
+
+	while (!err) {
+		__u32 magic, size;
+		struct __riscv_ctx_hdr __user *head = sc_ext_ptr;
 
-		err = __get_user(value, &sc->sc_fpregs.q.reserved[i]);
+		err |= __get_user(magic, &head->magic);
+		err |= __get_user(size, &head->size);
 		if (unlikely(err))
+			return err;
+
+		sc_ext_ptr += sizeof(*head);
+		switch (magic) {
+		case END_MAGIC:
+			if (size != END_HDR_SIZE)
+				return -EINVAL;
+
+			return 0;
+		case RISCV_V_MAGIC:
+			if (!has_vector() || !riscv_v_vstate_query(regs) ||
+			    size != riscv_v_sc_size)
+				return -EINVAL;
+
+			err = __restore_v_state(regs, sc_ext_ptr);
 			break;
-		if (value != 0)
+		default:
 			return -EINVAL;
+		}
+		sc_ext_ptr = (void __user *)head + size;
 	}
 	return err;
 }
 
+static size_t get_rt_frame_size(void)
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
+	frame_size += total_context_size;
+
+	frame_size = round_up(frame_size, 16);
+	return frame_size;
+}
+
 SYSCALL_DEFINE0(rt_sigreturn)
 {
 	struct pt_regs *regs = current_pt_regs();
 	struct rt_sigframe __user *frame;
 	struct task_struct *task;
 	sigset_t set;
+	size_t frame_size = get_rt_frame_size();
 
 	/* Always make any pending restarted system calls return -EINTR */
 	current->restart_block.fn = do_no_restart_syscall;
 
 	frame = (struct rt_sigframe __user *)regs->sp;
 
-	if (!access_ok(frame, sizeof(*frame)))
+	if (!access_ok(frame, frame_size))
 		goto badframe;
 
 	if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
@@ -141,17 +267,22 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 	struct pt_regs *regs)
 {
 	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
+	struct __riscv_ctx_hdr __user *sc_ext_ptr = &sc->sc_extdesc.hdr;
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
+		err |= save_v_state(regs, (void __user **)&sc_ext_ptr);
+	/* Write zero to fp-reserved space and check it on restore_sigcontext */
+	err |= __put_user(0, &sc->sc_extdesc.reserved);
+	/* And put END __riscv_ctx_hdr at the end. */
+	err |= __put_user(END_MAGIC, &sc_ext_ptr->magic);
+	err |= __put_user(END_HDR_SIZE, &sc_ext_ptr->size);
 
 	return err;
 }
@@ -176,6 +307,13 @@ static inline void __user *get_sigframe(struct ksignal *ksig,
 	/* Align the stack frame. */
 	sp &= ~0xfUL;
 
+	/*
+	 * Fail if the size of the altstack is not large enough for the
+	 * sigframe construction.
+	 */
+	if (current->sas_ss_size && sp < current->sas_ss_sp)
+		return (void __user __force *)-1UL;
+
 	return (void __user *)sp;
 }
 
@@ -185,9 +323,10 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 	struct rt_sigframe __user *frame;
 	long err = 0;
 	unsigned long __maybe_unused addr;
+	size_t frame_size = get_rt_frame_size();
 
-	frame = get_sigframe(ksig, regs, sizeof(*frame));
-	if (!access_ok(frame, sizeof(*frame)))
+	frame = get_sigframe(ksig, regs, frame_size);
+	if (!access_ok(frame, frame_size))
 		return -EFAULT;
 
 	err |= copy_siginfo_to_user(&frame->info, &ksig->info);
@@ -320,3 +459,10 @@ void arch_do_signal_or_restart(struct pt_regs *regs)
 	 */
 	restore_saved_sigmask();
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
