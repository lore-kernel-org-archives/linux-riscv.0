Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED5AC7EE2A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 17:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SzOjzXjhLXBoVyGDx3GDNxkEn5zEgrB0U6obuWbpY/c=; b=JTYKIx0uxVwV7xO2xC5MRGuuQ+
	fhekKzV3uFgiBaLpABusd540Ud/VpS1W2lXF5WMCpXi/Aeb1u3Lyux1sqx7JAI6Z07U95cUa21UFG
	7W5vGhomRdT7FqYBxaxySqZE8R66OBxsjMHfM29zO2vjIIDeRNGXM7VGlVXjlvYFLNXdbTVVFcYsU
	vbuJ/O5GW/ffFYNz7ba30pMzUsbi17LwR307UPg0RWQJtAzkoji1Wf6y3MGGrIvZ+9q8EVBG012AM
	/pLB+TuSmbKncFGHFezL8ua20KgIYUkMegQN3AK+oXnDOrRgxlUIrYwW4CG2cON/MFGyBsIyAap81
	xHROT7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhSj-00De3Z-02;
	Thu, 18 May 2023 17:30:49 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgOP-00DRlA-2V
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:22:21 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-64d247a023aso479484b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426937; x=1687018937;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ncTIQezxeKc2e5vuyalJDNkk7vKyJY85lFnJByk0alw=;
        b=kdxiy5ubQuYBUhBUsiVfJzzn1mfGp7DL3g9c8BoGvJdtZNuRZvoF2I0mFfFTwQ8cuB
         QkOoE4IZMls7xAzj5erjd89AQVWAz5V5JghcDc7Vehl3oQgqqj1nvRimCL/IBHbFx3N5
         S/Zk0V09/lAyf3y2qMG/5Y8vMBPOUfa1xcibOXEgVgRXg/0O03hB3bBAeMkar+qybiVh
         RKZL7xkMtmduyl6cR4Soxz/YtPlxsWmg4aWkz+R73EjIesutGJDDJw5lWRvMbOHaq6rQ
         5Mi9rLVzRxyi6pPTVezD1sL6s342Ndi5nEIU3poNxYKSncsj9gbSo8vwubDtaHHBT5zs
         liLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426937; x=1687018937;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ncTIQezxeKc2e5vuyalJDNkk7vKyJY85lFnJByk0alw=;
        b=dGOjqrgqS+suGY6X/92LuEs0wrHL/+KCCq4RxBO3GTLAt6F6PZfpiCDsu31CPzndix
         6cAn19Krd6e8fsGkh2BVEHyn+imyyNUgIcRZOzJCXKry4dOuuH0kr27EZrCFl6umSQ8q
         Qgqu5dMbgvk2NWUtF5MUjOaXJyFqlRO9dEsz9WMuC25zOldIE227iwl5hwBcIkq0t311
         riTgbfgSEHEZaGxsLBEqFEPQygdD6q20NMp+IG/5QWp5rkbc4u7qdSH76hars0Y1eY0W
         sZNwaNC7aFeKw6zkbWbd5xYqR3ExNH6OhhzJh/Ixt3ysOEH+oSTkexzfkTvfWnjgCig3
         cxeQ==
X-Gm-Message-State: AC+VfDxKHiSAsQhb8udAgqjeV13sg8sJNA7frYYACLotrNxU7S9PvqJo
	wwWBNV0N43J5/8aQ3PUYRXNmwO3zBW8bFD9X8ImtTrBZ8a7yde6ykJCg+uqtYndooRGUaErLvRo
	wfu4e9uSY5O4NYhF40gHhhEp8/4nvmwMjvLPcBvToluGsn4x0A6GFjf8QOR9x63EnclDacZBDNP
	UcN3JKviZ0/aETik8=
X-Google-Smtp-Source: ACHHUZ4TGhqqgD6f5M/yFjzXk6qf/ooHc8yuIkCYiSwA5MT+jm/9oIwXT7hkdUqrzepv0p7PbxrEoQ==
X-Received: by 2002:a05:6a20:734e:b0:f0:dedb:83b8 with SMTP id v14-20020a056a20734e00b000f0dedb83b8mr341518pzc.19.1684426936354;
        Thu, 18 May 2023 09:22:16 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:22:15 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [PATCH -next v20 20/26] riscv: Add prctl controls for userspace vector management
Date: Thu, 18 May 2023 16:19:43 +0000
Message-Id: <20230518161949.11203-21-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_092217_815719_0C16B4BC 
X-CRM114-Status: GOOD (  23.58  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Joey Gouly <joey.gouly@arm.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, greentime.hu@sifive.com, Albert Ou <aou@eecs.berkeley.edu>, Stefan Roesch <shr@devkernel.io>, vineetg@rivosinc.com, Josh Triplett <josh@joshtriplett.org>, Paul Walmsley <paul.walmsley@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, Jordy Zomer <jordyzomer@google.com>, Ondrej Mosnacek <omosnace@redhat.com>, Vincent Chen <vincent.chen@sifive.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Andy Chiu <andy.chiu@sifive.com>, Andrew Morton <akpm@linux-foundation.org>, Alexey Gladkov <legion@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch add two riscv-specific prctls, to allow usespace control the
use of vector unit:

 * PR_RISCV_V_SET_CONTROL: control the permission to use Vector at next,
   or all following execve for a thread. Turning off a thread's Vector
   live is not possible since libraries may have registered ifunc that
   may execute Vector instructions.
 * PR_RISCV_V_GET_CONTROL: get the same permission setting for the
   current thread, and the setting for following execve(s).

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
---
Changelog v20:
 - address build issue when KVM is compile as a module (Heiko)
 - s/RISCV_V_DISABLE/RISCV_ISA_V_DEFAULT_ENABLE/ (Conor)
 - change function names to have better scoping
 - check has_vector() before accessing vstate_ctrl
 - use proper return type for prctl calls (long instead of uint)
---
 arch/riscv/include/asm/processor.h |  13 ++++
 arch/riscv/include/asm/vector.h    |   4 +
 arch/riscv/kernel/process.c        |   1 +
 arch/riscv/kernel/vector.c         | 118 +++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c              |   2 +
 include/uapi/linux/prctl.h         |  11 +++
 kernel/sys.c                       |  12 +++
 7 files changed, 161 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 38ded8c5f207..17829c3003c8 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -40,6 +40,7 @@ struct thread_struct {
 	unsigned long s[12];	/* s[0]: frame pointer */
 	struct __riscv_d_ext_state fstate;
 	unsigned long bad_cause;
+	unsigned long vstate_ctrl;
 	struct __riscv_v_ext_state vstate;
 };
 
@@ -83,6 +84,18 @@ extern void riscv_fill_hwcap(void);
 extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 
 extern unsigned long signal_minsigstksz __ro_after_init;
+
+#ifdef CONFIG_RISCV_ISA_V
+/* Userspace interface for PR_RISCV_V_{SET,GET}_VS prctl()s: */
+#define RISCV_V_SET_CONTROL(arg)	riscv_v_vstate_ctrl_set_current(arg)
+#define RISCV_V_GET_CONTROL()		riscv_v_vstate_ctrl_get_current()
+extern long riscv_v_vstate_ctrl_set_current(unsigned long arg);
+extern long riscv_v_vstate_ctrl_get_current(void);
+#else /* !CONFIG_RISCV_ISA_V */
+#define RISCV_V_SET_CONTROL(arg)	(-EINVAL)
+#define RISCV_V_GET_CONTROL()		(-EINVAL)
+#endif /* CONFIG_RISCV_ISA_V */
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PROCESSOR_H */
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 8e56da67b5cf..04c0b07bf6cd 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -160,6 +160,9 @@ static inline void __switch_to_vector(struct task_struct *prev,
 	riscv_v_vstate_restore(next, task_pt_regs(next));
 }
 
+void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
+bool riscv_v_vstate_ctrl_user_allowed(void);
+
 #else /* ! CONFIG_RISCV_ISA_V  */
 
 struct pt_regs;
@@ -168,6 +171,7 @@ static inline int riscv_v_setup_vsize(void) { return -EOPNOTSUPP; }
 static __always_inline bool has_vector(void) { return false; }
 static inline bool riscv_v_first_use_handler(struct pt_regs *regs) { return false; }
 static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
+static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_vsize (0)
 #define riscv_v_vstate_save(task, regs)		do {} while (0)
 #define riscv_v_vstate_restore(task, regs)	do {} while (0)
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b7a10361ddc6..60278233926c 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -149,6 +149,7 @@ void flush_thread(void)
 #endif
 #ifdef CONFIG_RISCV_ISA_V
 	/* Reset vector state */
+	riscv_v_vstate_ctrl_init(current);
 	riscv_v_vstate_off(task_pt_regs(current));
 	kfree(current->thread.vstate.datap);
 	memset(&current->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 0080798e8d2e..9bee7a201106 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/uaccess.h>
+#include <linux/prctl.h>
 
 #include <asm/thread_info.h>
 #include <asm/processor.h>
@@ -19,6 +20,8 @@
 #include <asm/ptrace.h>
 #include <asm/bug.h>
 
+static bool riscv_v_implicit_uacc = IS_ENABLED(CONFIG_RISCV_ISA_V_DEFAULT_ENABLE);
+
 unsigned long riscv_v_vsize __read_mostly;
 EXPORT_SYMBOL_GPL(riscv_v_vsize);
 
@@ -91,6 +94,43 @@ static int riscv_v_thread_zalloc(void)
 	return 0;
 }
 
+#define VSTATE_CTRL_GET_CUR(x) ((x) & PR_RISCV_V_VSTATE_CTRL_CUR_MASK)
+#define VSTATE_CTRL_GET_NEXT(x) (((x) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK) >> 2)
+#define VSTATE_CTRL_MAKE_NEXT(x) (((x) << 2) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK)
+#define VSTATE_CTRL_GET_INHERIT(x) (!!((x) & PR_RISCV_V_VSTATE_CTRL_INHERIT))
+static inline int riscv_v_ctrl_get_cur(struct task_struct *tsk)
+{
+	return VSTATE_CTRL_GET_CUR(tsk->thread.vstate_ctrl);
+}
+
+static inline int riscv_v_ctrl_get_next(struct task_struct *tsk)
+{
+	return VSTATE_CTRL_GET_NEXT(tsk->thread.vstate_ctrl);
+}
+
+static inline bool riscv_v_ctrl_test_inherit(struct task_struct *tsk)
+{
+	return VSTATE_CTRL_GET_INHERIT(tsk->thread.vstate_ctrl);
+}
+
+static inline void riscv_v_ctrl_set(struct task_struct *tsk, int cur, int nxt,
+				    bool inherit)
+{
+	unsigned long ctrl;
+
+	ctrl = cur & PR_RISCV_V_VSTATE_CTRL_CUR_MASK;
+	ctrl |= VSTATE_CTRL_MAKE_NEXT(nxt);
+	if (inherit)
+		ctrl |= PR_RISCV_V_VSTATE_CTRL_INHERIT;
+	tsk->thread.vstate_ctrl = ctrl;
+}
+
+bool riscv_v_vstate_ctrl_user_allowed(void)
+{
+	return riscv_v_ctrl_get_cur(current) == PR_RISCV_V_VSTATE_CTRL_ON;
+}
+EXPORT_SYMBOL_GPL(riscv_v_vstate_ctrl_user_allowed);
+
 bool riscv_v_first_use_handler(struct pt_regs *regs)
 {
 	u32 __user *epc = (u32 __user *)regs->epc;
@@ -100,6 +140,10 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
 	if (!has_vector() || !(elf_hwcap & COMPAT_HWCAP_ISA_V))
 		return false;
 
+	/* Do not handle the trap if V is not allowed for this process*/
+	if (!riscv_v_vstate_ctrl_user_allowed())
+		return false;
+
 	/* If V has been enabled then it is not the first-use trap */
 	if (riscv_v_vstate_query(regs))
 		return false;
@@ -129,3 +173,77 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
 	riscv_v_vstate_on(regs);
 	return true;
 }
+
+void riscv_v_vstate_ctrl_init(struct task_struct *tsk)
+{
+	bool inherit;
+	int cur, next;
+
+	if (!has_vector())
+		return;
+
+	next = riscv_v_ctrl_get_next(tsk);
+	if (!next) {
+		if (riscv_v_implicit_uacc)
+			cur = PR_RISCV_V_VSTATE_CTRL_ON;
+		else
+			cur = PR_RISCV_V_VSTATE_CTRL_OFF;
+	} else {
+		cur = next;
+	}
+	/* Clear next mask if inherit-bit is not set */
+	inherit = riscv_v_ctrl_test_inherit(tsk);
+	if (!inherit)
+		next = PR_RISCV_V_VSTATE_CTRL_DEFAULT;
+
+	riscv_v_ctrl_set(tsk, cur, next, inherit);
+}
+
+long riscv_v_vstate_ctrl_get_current(void)
+{
+	if (!has_vector())
+		return -EINVAL;
+
+	return current->thread.vstate_ctrl & PR_RISCV_V_VSTATE_CTRL_MASK;
+}
+
+long riscv_v_vstate_ctrl_set_current(unsigned long arg)
+{
+	bool inherit;
+	int cur, next;
+
+	if (!has_vector())
+		return -EINVAL;
+
+	if (arg & ~PR_RISCV_V_VSTATE_CTRL_MASK)
+		return -EINVAL;
+
+	cur = VSTATE_CTRL_GET_CUR(arg);
+	switch (cur) {
+	case PR_RISCV_V_VSTATE_CTRL_OFF:
+		/* Do not allow user to turn off V if current is not off */
+		if (riscv_v_ctrl_get_cur(current) != PR_RISCV_V_VSTATE_CTRL_OFF)
+			return -EPERM;
+
+		break;
+	case PR_RISCV_V_VSTATE_CTRL_ON:
+		break;
+	case PR_RISCV_V_VSTATE_CTRL_DEFAULT:
+		cur = riscv_v_ctrl_get_cur(current);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	next = VSTATE_CTRL_GET_NEXT(arg);
+	inherit = VSTATE_CTRL_GET_INHERIT(arg);
+	switch (next) {
+	case PR_RISCV_V_VSTATE_CTRL_DEFAULT:
+	case PR_RISCV_V_VSTATE_CTRL_OFF:
+	case PR_RISCV_V_VSTATE_CTRL_ON:
+		riscv_v_ctrl_set(current, cur, next, inherit);
+		return 0;
+	}
+
+	return -EINVAL;
+}
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e5e045852e6a..de24127e7e93 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -88,6 +88,8 @@ static bool kvm_riscv_vcpu_isa_enable_allowed(unsigned long ext)
 	switch (ext) {
 	case KVM_RISCV_ISA_EXT_H:
 		return false;
+	case KVM_RISCV_ISA_EXT_V:
+		return riscv_v_vstate_ctrl_user_allowed();
 	default:
 		break;
 	}
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index f23d9a16507f..3c36aeade991 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -294,4 +294,15 @@ struct prctl_mm_map {
 
 #define PR_SET_MEMORY_MERGE		67
 #define PR_GET_MEMORY_MERGE		68
+
+#define PR_RISCV_V_SET_CONTROL		69
+#define PR_RISCV_V_GET_CONTROL		70
+# define PR_RISCV_V_VSTATE_CTRL_DEFAULT		0
+# define PR_RISCV_V_VSTATE_CTRL_OFF		1
+# define PR_RISCV_V_VSTATE_CTRL_ON		2
+# define PR_RISCV_V_VSTATE_CTRL_INHERIT		(1 << 4)
+# define PR_RISCV_V_VSTATE_CTRL_CUR_MASK	0x3
+# define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
+# define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 339fee3eff6a..d0d3106698a1 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -140,6 +140,12 @@
 #ifndef GET_TAGGED_ADDR_CTRL
 # define GET_TAGGED_ADDR_CTRL()		(-EINVAL)
 #endif
+#ifndef PR_RISCV_V_SET_CONTROL
+# define RISCV_V_SET_CONTROL(a)		(-EINVAL)
+#endif
+#ifndef PR_RISCV_V_GET_CONTROL
+# define RISCV_V_GET_CONTROL()		(-EINVAL)
+#endif
 
 /*
  * this is where the system-wide overflow UID and GID are defined, for
@@ -2708,6 +2714,12 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 		error = !!test_bit(MMF_VM_MERGE_ANY, &me->mm->flags);
 		break;
 #endif
+	case PR_RISCV_V_SET_CONTROL:
+		error = RISCV_V_SET_CONTROL(arg2);
+		break;
+	case PR_RISCV_V_GET_CONTROL:
+		error = RISCV_V_GET_CONTROL();
+		break;
 	default:
 		error = -EINVAL;
 		break;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
