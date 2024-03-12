Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DFEC54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 12:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5lbPnNZLFxDdeXKuJpu0rnF6acggDz+gilfuyBzNhXs=; b=w423RUp6Qv3TaBzFfAGtlghgJc
	14aL1hEvHznqE9c2X+7nKCLIbOZ9EcWLJNlgCSK36CU0ZpGJuW2mEx/Zj9ixlo4SCJpVagcCHP3EW
	eVMe0G0Xh0JfanWJo6TXIJo57bDgofV3OKP3mOmtv+PNKkF9uNSTDawZMclhmr3K4wHMnkK4xMFus
	sAoXEVN1CwrGvSH06Y0lwQzVyheWcBqh/32Io2+g7ghVmINdmY+a9epCApGrl3mwgMp3ga8wYwbA8
	1CTDyGP3ZbWn8eUaNITPev2dFVoI04mLqptk2JUoZwf5tV3Cxk2+PnMOcaxQih/OWYq7r0T2YoI5j
	KN6WyROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1Nr-00000005m2L-2PFW;
	Tue, 12 Mar 2024 12:37:31 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1Nh-00000005lvQ-1ZMs
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 12:37:29 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so4678925a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 05:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710247040; x=1710851840; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GZBUdKGVv3vGEH/neBqCyRzI6PVtS2Tssc3muavZUoM=;
        b=ho30RkQyrGqGA1dcaZqQlo5q7PNAPwLErFypYkhotpxSM2ltJXIA6nNNMhLVyR7lYu
         ZrkVcX3KMi0lXqqi1a00+4EsQid3jD38fnQwXWccncuzjKz7vBwtslKbxcfL/8nekfNm
         aqSlq+DJTmHiSzP8fZBDYm5jjhOHigSi41utrpA8nW9gbHO3NX3u4FzZ6AJyKgpT+wOe
         jJsSKn864ZQmCzUMl5+gFSQjEaUVZbnIRMN69Ys6TsUHE6lAiKy7huValA6z5k80KIbU
         B1uwt+NPv7iaFqheeJKjixNELfzyceoSFM8VrmvLqN1LH3zIEBPxzw+kPITMOyw4IrQY
         TyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710247040; x=1710851840;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GZBUdKGVv3vGEH/neBqCyRzI6PVtS2Tssc3muavZUoM=;
        b=MZmTtQ/oSTd+1l3y89Msll+GveTMymLK1tGFbhqd2472rZeyDjTjbMfe+eFXYjmeFx
         uCAdRbSui4qMXqCWfjE9JkszcjY3kg9NfVK/bNQSr2D5SxSPeiboIX+dEDb4k70G46Sj
         aYbnsOfT9mZxZonKFgyyxewPjonfjeBvv0W2bQVeGv+w4rXue8qYjrvFOCIulGhAs3+M
         RTr0zA1rYSmpjitQJQxxnItzNNR26FuwwJfifqwC/M6sVm6A7KYnZcXzooRGoBFNyYJw
         ESSobPtWm+INA6q8tjdquXZ7jAxF6KJ2unESQItEvK7Om2KAhXEFQ8qdgNSPS9aLWS7V
         bHDg==
X-Gm-Message-State: AOJu0YwwDgIzNMg0182/bFL/nriYHbUTUhNigu9pkxYgM0RuOw7n5FGu
	RDyXFisPwoUuTfURojLo+mZ7An8r3oBTl7aig6/+0VXd+Yq3QGPZ/nsY6jZaC3mjuosDkVaS6LN
	7NvL2ibuQldjvIi7/c7Wsgx4ZU6nczdIcyfEklX38bsfIclyAISew63r2PxbnURRjAri/iHFLIa
	dRVLlFm0bkSpySco8MZsObITsPUm7WBJwTyOg6dOQMqtK+gsrdnOa8
X-Google-Smtp-Source: AGHT+IHBOQ3Xt4GnlitFCSKgSFRL1J7drjgpTyeP1NFXF8RF4ycj0iv5h2QCXQfy193qi7o0y2n6CA==
X-Received: by 2002:a17:90b:4f4b:b0:29b:a149:2fed with SMTP id pj11-20020a17090b4f4b00b0029ba1492fedmr7324525pjb.10.1710247039753;
        Tue, 12 Mar 2024 05:37:19 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id hk13-20020a17090b224d00b0029c2794d3f7sm1804233pjb.7.2024.03.12.05.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 05:37:19 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Subject: [v1, 6/6] riscv: vector: adjust minimum Vector requirement to ZVE32X
Date: Tue, 12 Mar 2024 20:36:27 +0800
Message-Id: <20240312123627.9285-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240312123627.9285-1-andy.chiu@sifive.com>
References: <20240312123627.9285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_053723_185491_DABE428A 
X-CRM114-Status: GOOD (  23.71  )
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
Cc: Joel Granados <j.granados@samsung.com>, guoren@linux.alibaba.com, Heiko Stuebner <heiko@sntech.de>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, Haorong Lu <ancientmodern4@gmail.com>, Anup Patel <anup@brainfault.org>, Ben Dooks <ben.dooks@codethink.co.uk>, greentime.hu@sifive.com, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Jerry Shih <jerry.shih@sifive.com>, Charlie Jenkins <charlie@rivosinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Xiao Wang <xiao.w.wang@intel.com>, Al Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, Han-Kuan Chen <hankuan.chen@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, bjorn@kernel.org, Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, Aurelien Jarno <aurelien@aurel32.net>
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
---
 arch/riscv/include/asm/switch_to.h     |  2 +-
 arch/riscv/include/asm/vector.h        | 21 ++++++++++++++-------
 arch/riscv/include/asm/xor.h           |  2 +-
 arch/riscv/kernel/cpufeature.c         |  5 ++++-
 arch/riscv/kernel/kernel_mode_vector.c |  4 ++--
 arch/riscv/kernel/process.c            |  4 ++--
 arch/riscv/kernel/signal.c             |  6 +++---
 arch/riscv/kernel/smpboot.c            |  2 +-
 arch/riscv/kernel/sys_hwprobe.c        |  5 +++--
 arch/riscv/kernel/vector.c             | 15 +++++++++------
 arch/riscv/lib/uaccess.S               |  2 +-
 11 files changed, 41 insertions(+), 27 deletions(-)

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
index 3aa0df3f3b41..4879f88660cd 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -710,12 +710,15 @@ void __init riscv_fill_hwcap(void)
 		elf_hwcap &= ~COMPAT_HWCAP_ISA_F;
 	}
 
-	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ZVE32X)) {
 		/*
 		 * This callsite can't fail here. This is the first time we
 		 * call during boot, so riscv_v_vsize must be zero.
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
index 2500d175ed66..37c441489c7e 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -69,7 +69,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	if (riscv_isa_extension_available(NULL, c))
 		pair->value |= RISCV_HWPROBE_IMA_C;
 
-	if (has_vector())
+	if (has_vector(v))
 		pair->value |= RISCV_HWPROBE_IMA_V;
 
 	/*
@@ -117,7 +117,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZVE64F);
 		EXT_KEY(ZVE64D);
 
-		if (has_vector()) {
+		/*  Most Vector crypto extensions require at least ZVE32X */
+		if (has_vector(ZVE32X)) {
 			EXT_KEY(ZVBB);
 			EXT_KEY(ZVBC);
 			EXT_KEY(ZVKB);
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
