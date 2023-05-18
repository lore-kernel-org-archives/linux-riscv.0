Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE1AC7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 16:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxG/lvSGnazsO+XCkZn1RHjB6mTYltD0+GXNTzyxkzE=; b=vhP8Y7iafxnE32
	b0ci9Wf/uAeRw1T4rqzlPkJxX6q87ef1oTVAakUrGzIDcINFmk7TCDmJxZYJYyucjuOSvdJrKrNLT
	4zIq5ujk3hWhKihwfvgACqMPLxC2TVk7p3t7MhpIog0tp88OrSswAELvArNHeZfVlZiThkHy3yO8i
	5pjTwhNQOoXqg3uWZTCX3/AyOhbPcBFNuiiwX4E1+TMd6d2dLNgRIRrBYdxncWqYwZ+ZJz/h53x5F
	piAPbuXhXpK4oF3QaoWoZZLabFFxX8ADRwI4ShcyTAzqnwX3B//35WuR7L3j3Xg5zD61dCMdlESq7
	zzY+kDMSQxDNDFA79csw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzggB-00DV6f-1d;
	Thu, 18 May 2023 16:40:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzggA-00DV5Q-0j
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 May 2023 16:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MdADAAcqMqw/ern4VfZKqbSeESM813gLnUOdgVy5HP8=; b=pXawSlyW3gjxf3y4kpsXVJNBRP
	Ncp/KQmAmObgmH5EDPVWC3gAjyQYrMIHr+tCSHjOxZ9HpdbmoGtZX+YJ64fAuD25BOuBw+QfgwJmK
	yq40SlT2slcKYhyAvpZdEIt+uT8nbb99mHxLysUyZK/Da7S6dUUt3g7XZw9uYZNf1krvdDwmLITxV
	wC2WEKHGIlG3emE8f3f2qi5uF7yvGd1JjRNAKyxCkufokDOI+1kFRogfq8tbVzI8Lj3RXIvOnYveS
	N8NG+fpJe2znWNaFjk/njOsxqptoLd0GmddnYxKK2et1CNn8QgkzgFipSuL9/XItSC6GFyO+yDZA4
	tKOuJcag==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgNq-00ErLT-0a
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:21:44 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64d2981e3abso287586b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426901; x=1687018901;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MdADAAcqMqw/ern4VfZKqbSeESM813gLnUOdgVy5HP8=;
        b=DsD4bfuQ0ck0Mu9xk6ELw2lMsNx98Fo8tuHMtKU/AurmkwMgZxjQquwRiD4Vixkacd
         JWEp/I3QbfM9hIwjheoagkuouiVjrpts3JyiCL+YGwLf5FPBq/JaEklinCOupQtUoaDC
         raLbhFqhBaLRsHUB2tO7iK28Bguyvke+nuRoNYn4aZ7AESnBek0SEsxIjFVxixhl1MD9
         v6SyyGI8ETCa7jf2gwWpYPHtsN3xIHuntY1/2v0FVfzRmxRSxYoKR369QJ1JlYRpPbtA
         X4ROgWlBpLcIT2LOidC37rn/fI/XROlI5E0s4msnzzbYheSAcVH3J0MqDyC3AsbS7SoG
         80xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426901; x=1687018901;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MdADAAcqMqw/ern4VfZKqbSeESM813gLnUOdgVy5HP8=;
        b=EyjWhwRmPTds3rAblHz3k2s+/P7B3EUGRPrjzvRUJOJMfR+2pdsErXo28U5LAzhJ2W
         t9yA05GkzyyHd5diPvRfGqvzFLhpYDTqXYS+9dkgPS82Z9XMfeTvPjA9rEyTG6geiLgt
         ghZ9zc4Aevntw1l1sH4rrrA/JdOvCst2v87M4oiaVNEFmCq0QVPjRlgflVDXB9q/JVxQ
         Oif/WwGz3yUSQ3kxC2Wm4WLUyVpWx+nHPOUTovZm3MuM4Bw3MsSxzB76kSQ70csQWqMA
         HrnWOmED9+D7c3oDSdXaknXkj45YODKEyIfukDAU8HO70iJBvfxUi/LUpzvd5GVAWS4F
         LIyA==
X-Gm-Message-State: AC+VfDwgG+LubhGNm3Px/JMVuhYPoj37F+9DFYxAS1t7szBRb0hT2FuP
	JUTiv79V35mMRo5rv8JKvJ6u9uiLwLpP6jsg6cNwCtsE95jFE6z+VbL3KHlhrJsl9j8qQqJOuVU
	gYJOy8v3Zk9oXtFqK5bBKgjKhAjtWOIE4k7Lmu2Tk6JADtVscze/oQljCztvbQ8R83ipXbfN707
	sjayt4/Wi3y0RXxLc=
X-Google-Smtp-Source: ACHHUZ7QiVaag4rNNZLH+44L+w+ar03lTDTdo4OwXTqB8nbNeXyPsARBYf0hZdM2vL7+xOGI3q/kXw==
X-Received: by 2002:a05:6a00:1a08:b0:64d:1185:2414 with SMTP id g8-20020a056a001a0800b0064d11852414mr4494399pfv.4.1684426901007;
        Thu, 18 May 2023 09:21:41 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:21:40 -0700 (PDT)
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
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Wenting Zhang <zephray@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Mathis Salmen <mathis.salmen@matsal.de>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH -next v20 14/26] riscv: signal: Add sigcontext save/restore for vector
Date: Thu, 18 May 2023 16:19:37 +0000
Message-Id: <20230518161949.11203-15-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_172142_337847_21F1DC71 
X-CRM114-Status: GOOD (  32.04  )
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
---
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
