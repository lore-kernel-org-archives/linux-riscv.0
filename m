Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96670C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 14:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sSo/I80Z4W/9QZvJL67Lkri/VARTPrLIxYlcrDdWmFs=; b=ZIs61zR1Bokzeeyhqr+TYX6Nd+
	oc7ydPFWPkXmEvu3KnITHWvmLYfzJbdSrJQibTIQSygMDboJ3arC/Bue++P1YLV+zvfPPmIV+aND7
	yQeXVI7hGBp1mJF6jyxuEHKbVgizU/ju1AaoCKLJZCdiGSv2PHjcHUqj9snvzI+smR7lpaCBjBazs
	mp/fqXFxVvT8JHBVDpVlvk0Q9LUo439nK5pJZHktT+190rawjpq5VMUzczR0+0yZP9yd13z/8LkEc
	fiag2jameT3JkKKbBqrPQhLWUySa45UJFl5oLjhCkkwSQW95oMhdB8j7rFPpasjB2Y1UwEcRaPW7u
	u8FSFdjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm2q-0000000EdHZ-0TGk;
	Thu, 14 Mar 2024 14:26:56 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm2n-0000000EdGH-0TnB
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 14:26:54 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6e5760eeb7aso627429b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 07:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710426412; x=1711031212; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gxLoMsvrvurxzXXR4ekXFOWXX/r3snX3lpf/hVVAhlA=;
        b=KpIbwVdSD2uc5/5rGUSwh//bLkxOOVROK5xJGmtGLKghjHrHCizRkQaKO4JehI41Mr
         wBq5OXaFbWqNZX76MwULc6eBJj/dXWtqL+x+4j8J11LGZsB6QEVdAStPCwVzhxxSaWp0
         tujDB2idne33LJmMqmb1vekObPhXkgXPXUMsH8g/nu4atLjPWfEo5LcmrCnUwUTvOr6j
         lTG1e3tk4u/L1FBHcXjcbPnsDFNSre3qH3RqEUepM/Aa52pMUCAAbCEODQILEvbOLjUz
         kNyysxcn2yMMAYNS7QigmIDEGI3NEDbCQMfyX1wxdrYHT6l7nknd6yxuKO1B9k3xtr4p
         puoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710426412; x=1711031212;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gxLoMsvrvurxzXXR4ekXFOWXX/r3snX3lpf/hVVAhlA=;
        b=RQi2KmtnX2qEGCnu6E4t4xNFh1FmHsWB1/HpwTXA3MD5dU7bTYdqdav8iRO8wcFTQL
         5p4IahdjQwOPil7VUUzzrXmx6nxz3ttH/I7MbGkY+02XuPVuflHvH4hKVOst5e0qEkJ7
         s8j9u+9qtgYmPzV6d5gCel1lXK66ixlsYOlQwN1Y2VFSUTAE9sup/jns2LjhAk5VaFz0
         MNSgCfzw1+0T4wRhdfF/Lci/uZKJ20xHsKyR3QMwUlvV2pVhHWnIgnFl9Bwlhtf1yOZ0
         R47z/SdAZKayRTofa7BQTeoEbqwXuSHPl5SBQOu7dVCBKj9sH/O94PMlEg+tOlk6DidW
         scbw==
X-Gm-Message-State: AOJu0YzXStpF1YOZ0jfSHVGheyVvxAN4p0JJ0mlGlwTSpLpw18guwGdj
	+6KYFW12Gcr50d4fx5E76S82ehXZHiyomdO75k3SfD6pdwxudrxrKTlLmM6lDffaNC5ebnGH49e
	EQgDYuT5A1wnsygj42W2ALzVeUFKK9a1XjjDaz/7wgHwiJd3uEHFDH3eqz5w+bmgCk+++0u+8/H
	HlAR+5qH3d1zNTAWZ5LbC5Gphic+qPak4swNeuFPLc5CiKLFYUqDvB
X-Google-Smtp-Source: AGHT+IEbCxg0zapYNkKN4yVHKNTTQw42j120YHILQPPSsbbTPW2r3Pyms7BrA+NSQJzk7H5+6zgf3g==
X-Received: by 2002:a05:6a00:8683:b0:6e6:e587:3c11 with SMTP id hh3-20020a056a00868300b006e6e5873c11mr1037160pfb.22.1710426412119;
        Thu, 14 Mar 2024 07:26:52 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y9-20020a62f249000000b006e6854d45afsm1556435pfl.97.2024.03.14.07.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 07:26:51 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Subject: [v2, 7/7] riscv: vector: adjust minimum Vector requirement to ZVE32X
Date: Thu, 14 Mar 2024 22:25:42 +0800
Message-Id: <20240314142542.19957-8-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240314142542.19957-1-andy.chiu@sifive.com>
References: <20240314142542.19957-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_072653_238091_47B0B086 
X-CRM114-Status: GOOD (  24.67  )
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
Cc: Joel Granados <j.granados@samsung.com>, guoren@linux.alibaba.com, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, Eric Biggers <ebiggers@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, conor.dooley@microchip.com, Guo Ren <guoren@kernel.org>, Mathis Salmen <mathis.salmen@matsal.de>, Haorong Lu <ancientmodern4@gmail.com>, Nick Knight <nick.knight@sifive.com>, Anup Patel <anup@brainfault.org>, greentime.hu@sifive.com, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Jerry Shih <jerry.shih@sifive.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Xiao Wang <xiao.w.wang@intel.com>, Al Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, Han-Kuan Chen <hankuan.chen@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, bjorn@kernel.org, Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, Aurelien Jarno <aurelien@aurel32.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Make has_vector take one argument. This argument represents the minimum
Vector subextension that the following Vector actions assume.

Also, change riscv_v_first_use_handler(), and boot code that calls
riscv_v_setup_vsize() to accept the minimum Vector sub-extension,
ZVE32X.

Most kernel/user interfaces requires minimum of ZVE32X. Thus, programs
compiled and run with ZVE32X should be supported by the kernel on most
aspects. This includes context-switch, signal, ptrace, prctl, and
hwprobe.

One exception is that ELF_HWCAP returns 'V' only if full V is supported
on the platform. This means that the system without a full V must not
rely on ELF_HWCAP to tell whether it is allowable to execute Vector
without first invoking a prctl() check.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Acked-by: Joel Granados <j.granados@samsung.com>
---
Changelog v2:
 - update the comment in hwprobe.
---
 arch/riscv/include/asm/switch_to.h     |  2 +-
 arch/riscv/include/asm/vector.h        | 21 ++++++++++++++-------
 arch/riscv/include/asm/xor.h           |  2 +-
 arch/riscv/kernel/cpufeature.c         |  5 ++++-
 arch/riscv/kernel/kernel_mode_vector.c |  4 ++--
 arch/riscv/kernel/process.c            |  4 ++--
 arch/riscv/kernel/signal.c             |  6 +++---
 arch/riscv/kernel/smpboot.c            |  2 +-
 arch/riscv/kernel/sys_hwprobe.c        |  8 ++++++--
 arch/riscv/kernel/vector.c             | 15 +++++++++------
 arch/riscv/lib/uaccess.S               |  2 +-
 11 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 7efdb0584d47..df1adf196c4f 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -78,7 +78,7 @@ do {							\
 	struct task_struct *__next = (next);		\
 	if (has_fpu())					\
 		__switch_to_fpu(__prev, __next);	\
-	if (has_vector())					\
+	if (has_vector(ZVE32X))			\
 		__switch_to_vector(__prev, __next);	\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 731dcd0ed4de..b96750493dfb 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -18,6 +18,7 @@
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/asm.h>
+#include <asm/bug.h>
 
 extern unsigned long riscv_v_vsize;
 int riscv_v_setup_vsize(void);
@@ -35,10 +36,16 @@ static inline u32 riscv_v_flags(void)
 	return READ_ONCE(current->thread.riscv_v_flags);
 }
 
-static __always_inline bool has_vector(void)
-{
-	return riscv_has_extension_unlikely(RISCV_ISA_EXT_v);
-}
+#define has_vector(VEXT)						\
+({									\
+	static_assert(RISCV_ISA_EXT_##VEXT == RISCV_ISA_EXT_ZVE32X ||	\
+		      RISCV_ISA_EXT_##VEXT == RISCV_ISA_EXT_ZVE32F ||	\
+		      RISCV_ISA_EXT_##VEXT == RISCV_ISA_EXT_ZVE64X ||	\
+		      RISCV_ISA_EXT_##VEXT == RISCV_ISA_EXT_ZVE64F ||	\
+		      RISCV_ISA_EXT_##VEXT == RISCV_ISA_EXT_ZVE64D ||	\
+		      RISCV_ISA_EXT_##VEXT == RISCV_ISA_EXT_v);		\
+	riscv_has_extension_unlikely(RISCV_ISA_EXT_##VEXT);		\
+})
 
 static inline void __riscv_v_vstate_clean(struct pt_regs *regs)
 {
@@ -131,7 +138,7 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
 	riscv_v_enable();
 	asm volatile (
 		".option push\n\t"
-		".option arch, +v\n\t"
+		".option arch, +zve32x\n\t"
 		"vsetvli	%0, x0, e8, m8, ta, ma\n\t"
 		"vle8.v		v0, (%1)\n\t"
 		"add		%1, %1, %0\n\t"
@@ -153,7 +160,7 @@ static inline void __riscv_v_vstate_discard(void)
 	riscv_v_enable();
 	asm volatile (
 		".option push\n\t"
-		".option arch, +v\n\t"
+		".option arch, +zve32x\n\t"
 		"vsetvli	%0, x0, e8, m8, ta, ma\n\t"
 		"vmv.v.i	v0, -1\n\t"
 		"vmv.v.i	v8, -1\n\t"
@@ -267,7 +274,7 @@ bool riscv_v_vstate_ctrl_user_allowed(void);
 struct pt_regs;
 
 static inline int riscv_v_setup_vsize(void) { return -EOPNOTSUPP; }
-static __always_inline bool has_vector(void) { return false; }
+static __always_inline bool has_vector(unsigned long min_sub_ext) { return false; }
 static inline bool riscv_v_first_use_handler(struct pt_regs *regs) { return false; }
 static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
 static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
diff --git a/arch/riscv/include/asm/xor.h b/arch/riscv/include/asm/xor.h
index 96011861e46b..46042ef5a2f7 100644
--- a/arch/riscv/include/asm/xor.h
+++ b/arch/riscv/include/asm/xor.h
@@ -61,7 +61,7 @@ static struct xor_block_template xor_block_rvv = {
 	do {        \
 		xor_speed(&xor_block_8regs);    \
 		xor_speed(&xor_block_32regs);    \
-		if (has_vector()) { \
+		if (has_vector(ZVE32X)) { \
 			xor_speed(&xor_block_rvv);\
 		} \
 	} while (0)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index ddac25a5fe3e..475de9efb185 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -705,12 +705,15 @@ void __init riscv_fill_hwcap(void)
 		elf_hwcap &= ~COMPAT_HWCAP_ISA_F;
 	}
 
-	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ZVE32X)) {
 		/*
 		 * This callsite can't fail here. It cannot fail when called on
 		 * the boot hart.
 		 */
 		riscv_v_setup_vsize();
+	}
+
+	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
 		/*
 		 * ISA string in device tree might have 'v' flag, but
 		 * CONFIG_RISCV_ISA_V is disabled in kernel.
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 6afe80c7f03a..0d4d1a03d1c7 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -208,7 +208,7 @@ void kernel_vector_begin(void)
 {
 	bool nested = false;
 
-	if (WARN_ON(!has_vector()))
+	if (WARN_ON(!has_vector(ZVE32X)))
 		return;
 
 	BUG_ON(!may_use_simd());
@@ -236,7 +236,7 @@ EXPORT_SYMBOL_GPL(kernel_vector_begin);
  */
 void kernel_vector_end(void)
 {
-	if (WARN_ON(!has_vector()))
+	if (WARN_ON(!has_vector(ZVE32X)))
 		return;
 
 	riscv_v_disable();
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 92922dbd5b5c..919e72f9fff6 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -178,7 +178,7 @@ void flush_thread(void)
 void arch_release_task_struct(struct task_struct *tsk)
 {
 	/* Free the vector context of datap. */
-	if (has_vector())
+	if (has_vector(ZVE32X))
 		riscv_v_thread_free(tsk);
 }
 
@@ -225,7 +225,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.s[0] = 0;
 	}
 	p->thread.riscv_v_flags = 0;
-	if (has_vector())
+	if (has_vector(ZVE32X))
 		riscv_v_thread_alloc(p);
 	p->thread.ra = (unsigned long)ret_from_fork;
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 501e66debf69..a96e6e969a3f 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -188,7 +188,7 @@ static long restore_sigcontext(struct pt_regs *regs,
 
 			return 0;
 		case RISCV_V_MAGIC:
-			if (!has_vector() || !riscv_v_vstate_query(regs) ||
+			if (!has_vector(ZVE32X) || !riscv_v_vstate_query(regs) ||
 			    size != riscv_v_sc_size)
 				return -EINVAL;
 
@@ -210,7 +210,7 @@ static size_t get_rt_frame_size(bool cal_all)
 
 	frame_size = sizeof(*frame);
 
-	if (has_vector()) {
+	if (has_vector(ZVE32X)) {
 		if (cal_all || riscv_v_vstate_query(task_pt_regs(current)))
 			total_context_size += riscv_v_sc_size;
 	}
@@ -283,7 +283,7 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 	if (has_fpu())
 		err |= save_fp_state(regs, &sc->sc_fpregs);
 	/* Save the vector state. */
-	if (has_vector() && riscv_v_vstate_query(regs))
+	if (has_vector(ZVE32X) && riscv_v_vstate_query(regs))
 		err |= save_v_state(regs, (void __user **)&sc_ext_ptr);
 	/* Write zero to fp-reserved space and check it on restore_sigcontext */
 	err |= __put_user(0, &sc->sc_extdesc.reserved);
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 1f86ee10192f..4eb36d75f091 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -218,7 +218,7 @@ asmlinkage __visible void smp_callin(void)
 	struct mm_struct *mm = &init_mm;
 	unsigned int curr_cpuid = smp_processor_id();
 
-	if (has_vector()) {
+	if (has_vector(ZVE32X)) {
 		/*
 		 * Return as early as possible so the hart with a mismatching
 		 * vlen won't boot.
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index db7495001f27..839f912a2cfd 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -69,7 +69,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	if (riscv_isa_extension_available(NULL, c))
 		pair->value |= RISCV_HWPROBE_IMA_C;
 
-	if (has_vector())
+	if (has_vector(v))
 		pair->value |= RISCV_HWPROBE_IMA_V;
 
 	/*
@@ -112,7 +112,11 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZACAS);
 		EXT_KEY(ZICOND);
 
-		if (has_vector()) {
+		/*
+		 *  Vector crypto and ZVE* extensions are supported only if
+		 *  kernel has minimum V support of ZVE32X.
+		 */
+		if (has_vector(ZVE32X)) {
 			EXT_KEY(ZVE32X);
 			EXT_KEY(ZVE32F);
 			EXT_KEY(ZVE64X);
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 6727d1d3b8f2..e8a47fa72351 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -53,7 +53,7 @@ int riscv_v_setup_vsize(void)
 
 void __init riscv_v_setup_ctx_cache(void)
 {
-	if (!has_vector())
+	if (!has_vector(ZVE32X))
 		return;
 
 	riscv_v_user_cachep = kmem_cache_create_usercopy("riscv_vector_ctx",
@@ -173,8 +173,11 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
 	u32 __user *epc = (u32 __user *)regs->epc;
 	u32 insn = (u32)regs->badaddr;
 
+	if (!has_vector(ZVE32X))
+		return false;
+
 	/* Do not handle if V is not supported, or disabled */
-	if (!(ELF_HWCAP & COMPAT_HWCAP_ISA_V))
+	if (!riscv_v_vstate_ctrl_user_allowed())
 		return false;
 
 	/* If V has been enabled then it is not the first-use trap */
@@ -213,7 +216,7 @@ void riscv_v_vstate_ctrl_init(struct task_struct *tsk)
 	bool inherit;
 	int cur, next;
 
-	if (!has_vector())
+	if (!has_vector(ZVE32X))
 		return;
 
 	next = riscv_v_ctrl_get_next(tsk);
@@ -235,7 +238,7 @@ void riscv_v_vstate_ctrl_init(struct task_struct *tsk)
 
 long riscv_v_vstate_ctrl_get_current(void)
 {
-	if (!has_vector())
+	if (!has_vector(ZVE32X))
 		return -EINVAL;
 
 	return current->thread.vstate_ctrl & PR_RISCV_V_VSTATE_CTRL_MASK;
@@ -246,7 +249,7 @@ long riscv_v_vstate_ctrl_set_current(unsigned long arg)
 	bool inherit;
 	int cur, next;
 
-	if (!has_vector())
+	if (!has_vector(ZVE32X))
 		return -EINVAL;
 
 	if (arg & ~PR_RISCV_V_VSTATE_CTRL_MASK)
@@ -296,7 +299,7 @@ static struct ctl_table riscv_v_default_vstate_table[] = {
 
 static int __init riscv_v_sysctl_init(void)
 {
-	if (has_vector())
+	if (has_vector(ZVE32X))
 		if (!register_sysctl("abi", riscv_v_default_vstate_table))
 			return -EINVAL;
 	return 0;
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index bc22c078aba8..bbe143bb32a0 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -14,7 +14,7 @@
 
 SYM_FUNC_START(__asm_copy_to_user)
 #ifdef CONFIG_RISCV_ISA_V
-	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_v, CONFIG_RISCV_ISA_V)
+	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_ZVE32X, CONFIG_RISCV_ISA_V)
 	REG_L	t0, riscv_v_usercopy_threshold
 	bltu	a2, t0, fallback_scalar_usercopy
 	tail enter_vector_usercopy
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
