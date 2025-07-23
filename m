Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0D3C83F17
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 04:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1oMDXm54Fp9UgAj5F3Sdi4yQRh4UpLzbqTbeR96cFo=; b=Uod6DNRHlmJ0EuOAP9KDtaDXhY
	fcBbHy2t1U2qgYIBwqsjLDnV2XHZVMHbj/WY8gk/9Z74mGsltJa08YQ/B+80Sci3KGdYWZypejezJ
	5KfZQ3JEwxYjpAyAR704KRONX1PTUuYvjdkslA0mUG1tinGoxhShPCw/PbVX771/9+hX+2pNzJLJl
	qJIalbu8oqvu22b5otOM0VJN16Ruq2Al1RuIoa8Pe0jdyw02hpikxpLTp+kQRqM5qvTDJ066RoF95
	Utgk7JPUgV1G8BjmpJ7rZApV0lzBA8+LMFjD02iFJiXE2RxkyZtZ1HTeDS44ElwCDPeucinsOOISI
	+lc3i6JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueQw2-00000003yg7-15kY;
	Wed, 23 Jul 2025 04:18:30 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueQvz-00000003yfj-0gTH
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 04:18:28 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso5399911b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Jul 2025 21:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753244306; x=1753849106; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1TaPjoUJwv9Etp1fT/nKK3BG4ePkhHW+sFnAWEuxVio=;
        b=IGOWx1AQRXweu2yDRJi99+v8ZN4reLwKoenQxIZKMaUdVYMqs7PrQXHmnX6hqcP8JU
         ss0MqucSG1w9NKTnvgeDR6bZ8Ii/GYsyJ3xcNtNQtyvpScRicy+RBVaubyxM0BbMPdOo
         WQw28WSCyfVyE4qqvCY8++TNVgR8JxFwO5UajjkspiIOKEGlkERiPpUQXB8cJ6ygx1MU
         xrFEAdLze/OMLNWgUriSaf0+BWgMebHQAuZc+n2xUqPXxBMOeLY8sJPrIrQGfYvzzCia
         O/RFUWWl6m8RI4M61RoyscW5VQ4rEo6AyVI7h7hgFnMa5wKTn6geiJVLHbiVwvDw57x6
         l+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753244306; x=1753849106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TaPjoUJwv9Etp1fT/nKK3BG4ePkhHW+sFnAWEuxVio=;
        b=HjBjCUuKRE385mzZz7bEgc/ZbMKTqRaoTrYroC2qQWCO4nNRmJ0xKQMfKt5rxTO7Vi
         NaHW35yqMxIpSOSBuH3+HcPhVSOj6rfHTcH04U+PC0j7/Izfr10gSXKaRJZ+LCYzjvPD
         ++G0qJdfdiIvKxCJdDHEZzH3QXuPrnbcS3wPC53uLg77AWOgp+RSmdgLQcU79MSqk0rS
         WMK1XYhkwI+ThAJamWOpwOjzGRQzVdrZUWRJz87DrS9yjvdwz51aQ9KPcOWohhqBgs4r
         0tPJ502+GjUM0uL8qISW8sQnv1LVNZxRYBkASa//g1CquyUEGGSbJ42fs33xPelvnVHn
         HDag==
X-Gm-Message-State: AOJu0YxuPpAQjOePdsvtPH4Z8cDRwY1BrkLBRG1jkwBwsmXkam2hzmu0
	eU7Af350v6RFqREwtKOK+ZtZdChIkL5IDgO9gTnOFm25z4cSTaQXCX4ik8nkcvjLzqo=
X-Gm-Gg: ASbGnctMfUtFwdaQ5r+CMltlBvQvBQmv+qTwmz5gG0HoLrtdE6RQfFrYN4E8v4IL1IA
	cvuczZ6U8XPYWOV3SfibLT2CgfkKlGyXyuyhcwKtK3hSIUq7UIpDx4xff/USq+E/RFbYMg1MgrA
	x0j8FVJxUW74R6a1g3HeTyVCx544yd7x/QVj61bow5Sqgiyl9Q1dSO1j/kvARny8ODjUW28DnwL
	kw199jmy7HdjY04L/OWwYxZKOpfWxHfSruNY8j5SpwASh15wo0L4rr5lnzvDgww8KATOjgjQndF
	DhMqds88mSkkzlrlK1jhWMze/VUBaWL5J90W3IMVMAvuyVExTWwL+bYeRHiKSCCz1FY9Dsc21lQ
	g+kI3EPcAV1IzzzZFfLnJqCfoNYwHF98C
X-Google-Smtp-Source: AGHT+IFA0YBcJMnJhHP3FPjc3REPEkZAG5QXhqFnyh6OJFA1c0QUKVHohKaPiDE95kjr2eXjEimzkQ==
X-Received: by 2002:a05:6a00:4614:b0:740:a023:5d60 with SMTP id d2e1a72fcca58-760353db72fmr2543842b3a.19.1753244306301;
        Tue, 22 Jul 2025 21:18:26 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e2a88sm8770962b3a.23.2025.07.22.21.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 21:18:25 -0700 (PDT)
Date: Tue, 22 Jul 2025 21:18:23 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	WangYuli <wangyuli@uniontech.com>,
	Huacai Chen <chenhuacai@kernel.org>, Nam Cao <namcao@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Joel Granados <joel.granados@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Celeste Liu <coelacanthushex@gmail.com>,
	Evan Green <evan@rivosinc.com>, Nylon Chen <nylon.chen@sifive.com>
Subject: Re: [RFC PATCH 6/6] riscv: ptrace: Add hw breakpoint support
Message-ID: <aIBij4hr3Jna8OjV@debug.ba.rivosinc.com>
References: <20250722173829.984082-1-jesse@rivosinc.com>
 <20250722173829.984082-7-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250722173829.984082-7-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_211827_445256_87412532 
X-CRM114-Status: GOOD (  18.29  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 22, 2025 at 10:38:29AM -0700, Jesse Taube wrote:
>Add ability to setup hw breakpoints to ptrace. Call defines a new
>structure of (ulong[3]){bp_addr, bp_len, bp_type} with
>bp_type being one of HW_BREAKPOINT_LEN_X and
>bp_len being one of HW_BREAKPOINT_X with a value of
>zero dissabling the breakpoint.
>
>Signed-off-by: Jesse Taube <jesse@rivosinc.com>
>---
> arch/riscv/include/asm/processor.h   |  4 ++
> arch/riscv/include/uapi/asm/ptrace.h |  3 +-
> arch/riscv/kernel/hw_breakpoint.c    | 14 ++++-
> arch/riscv/kernel/process.c          |  4 ++
> arch/riscv/kernel/ptrace.c           | 93 ++++++++++++++++++++++++++++
> 5 files changed, 116 insertions(+), 2 deletions(-)
>
>diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
>index 5f56eb9d114a..488d956a951f 100644
>--- a/arch/riscv/include/asm/processor.h
>+++ b/arch/riscv/include/asm/processor.h
>@@ -12,6 +12,7 @@
>
> #include <vdso/processor.h>
>
>+#include <asm/hw_breakpoint.h>
> #include <asm/ptrace.h>
>
> #define arch_get_mmap_end(addr, len, flags)			\
>@@ -108,6 +109,9 @@ struct thread_struct {
> 	struct __riscv_v_ext_state vstate;
> 	unsigned long align_ctl;
> 	struct __riscv_v_ext_state kernel_vstate;
>+#ifdef CONFIG_HAVE_HW_BREAKPOINT
>+	struct perf_event *ptrace_bps[RV_MAX_TRIGGERS];
>+#endif
> #ifdef CONFIG_SMP
> 	/* Flush the icache on migration */
> 	bool force_icache_flush;
>diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
>index a38268b19c3d..a7998ed41913 100644
>--- a/arch/riscv/include/uapi/asm/ptrace.h
>+++ b/arch/riscv/include/uapi/asm/ptrace.h
>@@ -14,7 +14,8 @@
>
> #define PTRACE_GETFDPIC_EXEC	0
> #define PTRACE_GETFDPIC_INTERP	1
>-
>+#define PTRACE_GETHBPREGS	2
>+#define PTRACE_SETHBPREGS	3

Why not use `PTRACE_GETREGSET` `PTRACE_SETREGSET` ?

> /*
>  * User-mode register state for core dumps, ptrace, sigcontext
>  *
>diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
>index 437fd82b9590..c58145464539 100644
>--- a/arch/riscv/kernel/hw_breakpoint.c
>+++ b/arch/riscv/kernel/hw_breakpoint.c
>@@ -633,7 +633,19 @@ void arch_uninstall_hw_breakpoint(struct perf_event *event)
> 		pr_warn("%s: Failed to uninstall trigger %d. error: %ld\n", __func__, i, ret.error);
> }
>
>-void flush_ptrace_hw_breakpoint(struct task_struct *tsk) { }
>+/*
>+ * Release the user breakpoints used by ptrace
>+ */
>+void flush_ptrace_hw_breakpoint(struct task_struct *tsk)
>+{
>+	int i;
>+	struct thread_struct *t = &tsk->thread;
>+
>+	for (i = 0; i < dbtr_total_num; i++) {
>+		unregister_hw_breakpoint(t->ptrace_bps[i]);
>+		t->ptrace_bps[i] = NULL;
>+	}
>+}
>
> void hw_breakpoint_pmu_read(struct perf_event *bp) { }
>
>diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
>index 15d8f75902f8..9cf07ecfb523 100644
>--- a/arch/riscv/kernel/process.c
>+++ b/arch/riscv/kernel/process.c
>@@ -9,6 +9,7 @@
>
> #include <linux/bitfield.h>
> #include <linux/cpu.h>
>+#include <linux/hw_breakpoint.h>
> #include <linux/kernel.h>
> #include <linux/sched.h>
> #include <linux/sched/debug.h>
>@@ -164,6 +165,7 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
>
> void flush_thread(void)
> {
>+	flush_ptrace_hw_breakpoint(current);
> #ifdef CONFIG_FPU
> 	/*
> 	 * Reset FPU state and context
>@@ -218,6 +220,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> 		set_bit(MM_CONTEXT_LOCK_PMLEN, &p->mm->context.flags);
>
> 	memset(&p->thread.s, 0, sizeof(p->thread.s));
>+	if (IS_ENABLED(CONFIG_HAVE_HW_BREAKPOINT))
>+		memset(p->thread.ptrace_bps, 0, sizeof(p->thread.ptrace_bps));
>
> 	/* p->thread holds context to be restored by __switch_to() */
> 	if (unlikely(args->fn)) {
>diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
>index ea67e9fb7a58..b78cfb0f1c0e 100644
>--- a/arch/riscv/kernel/ptrace.c
>+++ b/arch/riscv/kernel/ptrace.c
>@@ -9,11 +9,13 @@
>
> #include <asm/vector.h>
> #include <asm/ptrace.h>
>+#include <asm/hw_breakpoint.h>
> #include <asm/syscall.h>
> #include <asm/thread_info.h>
> #include <asm/switch_to.h>
> #include <linux/audit.h>
> #include <linux/compat.h>
>+#include <linux/hw_breakpoint.h>
> #include <linux/ptrace.h>
> #include <linux/elf.h>
> #include <linux/regset.h>
>@@ -336,12 +338,103 @@ void ptrace_disable(struct task_struct *child)
> {
> }
>
>+#ifdef CONFIG_HAVE_HW_BREAKPOINT
>+static void ptrace_hbptriggered(struct perf_event *bp,
>+				struct perf_sample_data *data,
>+				struct pt_regs *regs)
>+{
>+	struct arch_hw_breakpoint *bkpt = counter_arch_bp(bp);
>+	int num = 0;
>+
>+	force_sig_ptrace_errno_trap(num, (void __user *)bkpt->address);
>+}
>+
>+/*
>+ * idx selects the breakpoint index.
>+ * Both PTRACE_GETHBPREGS and PTRACE_SETHBPREGS transfer three 32-bit words:
>+ * address (0), length (1), type (2).
>+ * Instruction breakpoint length is one of HW_BREAKPOINT_LEN_X or 0. 0 will
>+ * disable the breakpoint.
>+ * Instruction breakpoint type is one of HW_BREAKPOINT_X.
>+ */
>+
>+static long ptrace_gethbpregs(struct task_struct *child, unsigned long idx,
>+			      unsigned long __user *datap)
>+{
>+	struct perf_event *bp;
>+	unsigned long user_data[3] = {0};
>+
>+	if (idx >= RV_MAX_TRIGGERS)
>+		return -EINVAL;
>+
>+	bp = child->thread.ptrace_bps[idx];
>+
>+	if (!IS_ERR_OR_NULL(bp)) {
>+		user_data[0] = bp->attr.bp_addr;
>+		user_data[1] = bp->attr.disabled ? 0 : bp->attr.bp_len;
>+		user_data[2] = bp->attr.bp_type;
>+	}
>+
>+	if (copy_to_user(datap, user_data, sizeof(user_data)))
>+		return -EFAULT;
>+
>+	return 0;
>+}
>+
>+static long ptrace_sethbpregs(struct task_struct *child, unsigned long idx,
>+			      unsigned long __user *datap)
>+{
>+	struct perf_event *bp;
>+	struct perf_event_attr attr;
>+	unsigned long user_data[3];
>+
>+	if (idx >= RV_MAX_TRIGGERS)
>+		return -EINVAL;
>+
>+	if (copy_from_user(user_data, datap, sizeof(user_data)))
>+		return -EFAULT;
>+
>+	bp = child->thread.ptrace_bps[idx];
>+	if (IS_ERR_OR_NULL(bp))

Why not only check for NULL?
IS_ERR_VALUE will always expand to be true. right?

>+		attr = bp->attr;
>+	else
>+		ptrace_breakpoint_init(&attr);
>+
>+	attr.bp_addr = user_data[0];
>+	attr.bp_len = user_data[1];
>+	attr.bp_type = user_data[2];
>+	attr.disabled = !attr.bp_len;

Is it okay to not have any sanitization on inputs?

Can these inputs be controlled by user to give kernel address and kernel
breakpoint?

>+
>+	if (IS_ERR_OR_NULL(bp)) {
>+		bp = register_user_hw_breakpoint(&attr, ptrace_hbptriggered, NULL,
>+					   child);
>+		if (IS_ERR(bp))
>+			return PTR_ERR(bp);
>+
>+		child->thread.ptrace_bps[idx] = bp;
>+		return 0;
>+	} else {
>+		return modify_user_hw_breakpoint(bp, &attr);
>+	}
>+}
>+#endif
>+
> long arch_ptrace(struct task_struct *child, long request,
> 		 unsigned long addr, unsigned long data)
> {
> 	long ret = -EIO;
>+	unsigned long __user *datap = (unsigned long __user *) data;
>
> 	switch (request) {
>+#ifdef CONFIG_HAVE_HW_BREAKPOINT
>+	case PTRACE_GETHBPREGS:
>+		ret = ptrace_gethbpregs(child, addr, datap);
>+		break;
>+
>+	case PTRACE_SETHBPREGS:
>+		ret = ptrace_sethbpregs(child, addr, datap);
>+		break;
>+#endif
> 	default:
> 		ret = ptrace_request(child, request, addr, data);
> 		break;
>-- 
>2.43.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
