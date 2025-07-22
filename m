Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E108C87FC5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 17:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjD4CB8M7juePWgLLQhy/vUfKy1xmgVrspfds1cLWes=; b=D6b9yJ53DmbcQS
	KE8OFybZ8YUM6V8eDTAXNI0tEWrJktQH6lJ4u0t93oNaE+ZtaKuyhD7gSdc3LmPp09+3YlsejtwCw
	Qeb8DOCIdBVhqWHnaIFfdMQjB7eD7KU9hIgw4KT7ZrzuXktl7OqGUFBWEqDM2cHve+vfeHD0EMeNe
	4Ne6XWmb2QFcygCRAQpl9JJ3TpAR29lzCsp+SZTrDPtQ88B6ILLON9EWdafIwWHqQyVncY4Fx8Vvi
	gYKx5BCsKzmRSgDmgPDLXqqb6iGmV0Ypo3dalhQc7s/I+r20G+7av3tQOivKwZAlIk9kTT0le9nCE
	O5sSx1QOjJlOi4Exur9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGwt-000000039cU-399n;
	Tue, 22 Jul 2025 17:38:43 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGwq-000000039aV-2zk6
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 17:38:41 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7e29616cc4fso556918485a.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Jul 2025 10:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753205919; x=1753810719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pehe5qahEzM3t46HZmGT5lx1CIRt9G4s5EVYhqPzIU=;
        b=2za85+PBnlKgfsFz8viXa8Y6xhWGrYvMo1TUUMy2JaFncukxVo47D2xJIcvyI6b7U9
         SBmn5KxHz6Xkoal+yvde1pAgMK5/S/ZGQsMF7xW5H1DvB+lXjm/M6sJNIeTfL6kNozyB
         aIzq0PB1Fz3WFBacp2PQ9m3VktRBvK6WZ8nRtHscLSdqFTLRm3KgSREK46fD3SaFzDXI
         S5ZJQEmArVE84G+l/YRrVQacIsUKAwjvLw3SXghcYSVVvNAjYio8SUpTf6m8KHkGYNOU
         gKlyKo8IrMRjpClgqk4z7RXEI8sQQLnnsaOO6KVEOoTQwwve9k0myyJgeHpCTyWUt+xt
         mSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753205919; x=1753810719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pehe5qahEzM3t46HZmGT5lx1CIRt9G4s5EVYhqPzIU=;
        b=PbzY5mNgWtwc9Nn6Zd0/4HKZvgf+reUpDwi09MD0Lh2MqxZvp9MQXRtdy1k1tl+bN0
         8wpRl77UXjE3lTX+dLGx59olh4ATseJlZqMhR5/vf4cUWnLFVuTHsShL2ffSuDc3pFtA
         i0jxPEAh3cexnUnrQAvlLS+XBjaXJ0oux2CHwpE0riBJY+qZeNZqAL5opx28bbxWbbVx
         MfPyafRYFIwGhjXzyVTqibuLPuV83AMGjd9jOKYoSBi3+xPs0cCdbgEdjTsVKaMpajQN
         hlpi2Gwb5+V5qOKmkxCcYxYwAhbwG/8krSjmIN4DynlegztF75IaHOR8g5UT1kJ07uoy
         YmKA==
X-Gm-Message-State: AOJu0YwxhJo84oGSOmm0dtqWadskzXVkcqDR0BLj7S3/lxRn+n5i7kHQ
	RrBitq+DOXmGlxzogoRymkPx1dy7+IKbkQNor4Kd6XI3K1K56J5yKl/DQV4LZ8W/v+N/jsy6eg9
	4ffne
X-Gm-Gg: ASbGnctOKbsyZ+8JUS0ViM2LVkYGP7zKcLyAn7tkWaEAwJU+6bZ82LudYNiDocy93CX
	fqiK7ZhPTyy3D+/PTinA4F+s5ZaJTbF01mjDc8COtDNRS83KhmU5YyFgvubZPPeYuXhXPTuoM7o
	GA+CjDeIAfrxS2TRikZRYIfVsaRfo+1BV5EGHgy9ZCgEJhHsbf9ZU8oaLsFlHMZWxk9dxCd1XOR
	Z8ZII8c2NQnZ3tC1KhNtYWzh5dx0CB0OJ/vK93O+rYd8eGvCR7trKnSvBW7xlh8m8z0MOg8yq2z
	2+Ku9hmVyuM1NYUD1E3La3k9hX+CCAdwtZdjq6XzouoGcJSQUx1DN/2P37bLtugxAd5bsbx0LWb
	9Xn6a9qHu4Gx3He28S1v3DGHp9/X6cp/OPI5CUiv152TquREnBDSKTElRDXuOXIGbqbFZP9hBYM
	9ZVxjs26gzlEo=
X-Google-Smtp-Source: AGHT+IHNmIeff1tiB4Sc65YqOosgC6ntLXzFGJQ4ydDztiuS5x6ubxGzTt6eEnVnsJPxfjwF05Z/jw==
X-Received: by 2002:a05:6214:e86:b0:704:a91e:2874 with SMTP id 6a1803df08f44-707005646e7mr176096d6.19.1753205919317;
        Tue, 22 Jul 2025 10:38:39 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051ba6b783sm54184536d6.73.2025.07.22.10.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 10:38:39 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	WangYuli <wangyuli@uniontech.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Celeste Liu <coelacanthushex@gmail.com>,
	Evan Green <evan@rivosinc.com>,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [RFC PATCH 6/6] riscv: ptrace: Add hw breakpoint support
Date: Tue, 22 Jul 2025 10:38:29 -0700
Message-ID: <20250722173829.984082-7-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722173829.984082-1-jesse@rivosinc.com>
References: <20250722173829.984082-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_103840_761471_D85BC25B 
X-CRM114-Status: GOOD (  21.70  )
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

Add ability to setup hw breakpoints to ptrace. Call defines a new
structure of (ulong[3]){bp_addr, bp_len, bp_type} with
bp_type being one of HW_BREAKPOINT_LEN_X and
bp_len being one of HW_BREAKPOINT_X with a value of
zero dissabling the breakpoint.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 arch/riscv/include/asm/processor.h   |  4 ++
 arch/riscv/include/uapi/asm/ptrace.h |  3 +-
 arch/riscv/kernel/hw_breakpoint.c    | 14 ++++-
 arch/riscv/kernel/process.c          |  4 ++
 arch/riscv/kernel/ptrace.c           | 93 ++++++++++++++++++++++++++++
 5 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 5f56eb9d114a..488d956a951f 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -12,6 +12,7 @@
 
 #include <vdso/processor.h>
 
+#include <asm/hw_breakpoint.h>
 #include <asm/ptrace.h>
 
 #define arch_get_mmap_end(addr, len, flags)			\
@@ -108,6 +109,9 @@ struct thread_struct {
 	struct __riscv_v_ext_state vstate;
 	unsigned long align_ctl;
 	struct __riscv_v_ext_state kernel_vstate;
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	struct perf_event *ptrace_bps[RV_MAX_TRIGGERS];
+#endif
 #ifdef CONFIG_SMP
 	/* Flush the icache on migration */
 	bool force_icache_flush;
diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index a38268b19c3d..a7998ed41913 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -14,7 +14,8 @@
 
 #define PTRACE_GETFDPIC_EXEC	0
 #define PTRACE_GETFDPIC_INTERP	1
-
+#define PTRACE_GETHBPREGS	2
+#define PTRACE_SETHBPREGS	3
 /*
  * User-mode register state for core dumps, ptrace, sigcontext
  *
diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
index 437fd82b9590..c58145464539 100644
--- a/arch/riscv/kernel/hw_breakpoint.c
+++ b/arch/riscv/kernel/hw_breakpoint.c
@@ -633,7 +633,19 @@ void arch_uninstall_hw_breakpoint(struct perf_event *event)
 		pr_warn("%s: Failed to uninstall trigger %d. error: %ld\n", __func__, i, ret.error);
 }
 
-void flush_ptrace_hw_breakpoint(struct task_struct *tsk) { }
+/*
+ * Release the user breakpoints used by ptrace
+ */
+void flush_ptrace_hw_breakpoint(struct task_struct *tsk)
+{
+	int i;
+	struct thread_struct *t = &tsk->thread;
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		unregister_hw_breakpoint(t->ptrace_bps[i]);
+		t->ptrace_bps[i] = NULL;
+	}
+}
 
 void hw_breakpoint_pmu_read(struct perf_event *bp) { }
 
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 15d8f75902f8..9cf07ecfb523 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -9,6 +9,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/cpu.h>
+#include <linux/hw_breakpoint.h>
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
@@ -164,6 +165,7 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 
 void flush_thread(void)
 {
+	flush_ptrace_hw_breakpoint(current);
 #ifdef CONFIG_FPU
 	/*
 	 * Reset FPU state and context
@@ -218,6 +220,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		set_bit(MM_CONTEXT_LOCK_PMLEN, &p->mm->context.flags);
 
 	memset(&p->thread.s, 0, sizeof(p->thread.s));
+	if (IS_ENABLED(CONFIG_HAVE_HW_BREAKPOINT))
+		memset(p->thread.ptrace_bps, 0, sizeof(p->thread.ptrace_bps));
 
 	/* p->thread holds context to be restored by __switch_to() */
 	if (unlikely(args->fn)) {
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index ea67e9fb7a58..b78cfb0f1c0e 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -9,11 +9,13 @@
 
 #include <asm/vector.h>
 #include <asm/ptrace.h>
+#include <asm/hw_breakpoint.h>
 #include <asm/syscall.h>
 #include <asm/thread_info.h>
 #include <asm/switch_to.h>
 #include <linux/audit.h>
 #include <linux/compat.h>
+#include <linux/hw_breakpoint.h>
 #include <linux/ptrace.h>
 #include <linux/elf.h>
 #include <linux/regset.h>
@@ -336,12 +338,103 @@ void ptrace_disable(struct task_struct *child)
 {
 }
 
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+static void ptrace_hbptriggered(struct perf_event *bp,
+				struct perf_sample_data *data,
+				struct pt_regs *regs)
+{
+	struct arch_hw_breakpoint *bkpt = counter_arch_bp(bp);
+	int num = 0;
+
+	force_sig_ptrace_errno_trap(num, (void __user *)bkpt->address);
+}
+
+/*
+ * idx selects the breakpoint index.
+ * Both PTRACE_GETHBPREGS and PTRACE_SETHBPREGS transfer three 32-bit words:
+ * address (0), length (1), type (2).
+ * Instruction breakpoint length is one of HW_BREAKPOINT_LEN_X or 0. 0 will
+ * disable the breakpoint.
+ * Instruction breakpoint type is one of HW_BREAKPOINT_X.
+ */
+
+static long ptrace_gethbpregs(struct task_struct *child, unsigned long idx,
+			      unsigned long __user *datap)
+{
+	struct perf_event *bp;
+	unsigned long user_data[3] = {0};
+
+	if (idx >= RV_MAX_TRIGGERS)
+		return -EINVAL;
+
+	bp = child->thread.ptrace_bps[idx];
+
+	if (!IS_ERR_OR_NULL(bp)) {
+		user_data[0] = bp->attr.bp_addr;
+		user_data[1] = bp->attr.disabled ? 0 : bp->attr.bp_len;
+		user_data[2] = bp->attr.bp_type;
+	}
+
+	if (copy_to_user(datap, user_data, sizeof(user_data)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long ptrace_sethbpregs(struct task_struct *child, unsigned long idx,
+			      unsigned long __user *datap)
+{
+	struct perf_event *bp;
+	struct perf_event_attr attr;
+	unsigned long user_data[3];
+
+	if (idx >= RV_MAX_TRIGGERS)
+		return -EINVAL;
+
+	if (copy_from_user(user_data, datap, sizeof(user_data)))
+		return -EFAULT;
+
+	bp = child->thread.ptrace_bps[idx];
+	if (IS_ERR_OR_NULL(bp))
+		attr = bp->attr;
+	else
+		ptrace_breakpoint_init(&attr);
+
+	attr.bp_addr = user_data[0];
+	attr.bp_len = user_data[1];
+	attr.bp_type = user_data[2];
+	attr.disabled = !attr.bp_len;
+
+	if (IS_ERR_OR_NULL(bp)) {
+		bp = register_user_hw_breakpoint(&attr, ptrace_hbptriggered, NULL,
+					   child);
+		if (IS_ERR(bp))
+			return PTR_ERR(bp);
+
+		child->thread.ptrace_bps[idx] = bp;
+		return 0;
+	} else {
+		return modify_user_hw_breakpoint(bp, &attr);
+	}
+}
+#endif
+
 long arch_ptrace(struct task_struct *child, long request,
 		 unsigned long addr, unsigned long data)
 {
 	long ret = -EIO;
+	unsigned long __user *datap = (unsigned long __user *) data;
 
 	switch (request) {
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	case PTRACE_GETHBPREGS:
+		ret = ptrace_gethbpregs(child, addr, datap);
+		break;
+
+	case PTRACE_SETHBPREGS:
+		ret = ptrace_sethbpregs(child, addr, datap);
+		break;
+#endif
 	default:
 		ret = ptrace_request(child, request, addr, data);
 		break;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
