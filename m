Return-Path: <SRS0=N0YM=NJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E957C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 10:51:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5CAB2082D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 10:51:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JvBAxSt4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yjjxb2YA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5CAB2082D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=H60Z50jKZ5SqatiUAgsZFvfNOcWWu2/CDjwMMPQ/B+c=; b=JvBAxSt4Rg4OIBLU9Ob0ZfgvOH
	HCJsoOo62LbQK3MBYWfA2pup/jAb9K3NuAb/V+0qfhgTsZJ6Joap8xqXmuEZKl6JrUYhYlJ+KI1GW
	PLGCpkYMbYjoo2z5GrtVH9VBf0JKraUt5ub672QIapvWvzjm0ySyhjbrsmdyPV+jM1hJ58voI8IcP
	v1fR4NczmPauuB7PCmhquzD6tqPFX3DUETHVrfNcTiKtre74/8QHM7mIKr30gbunbGYA0fBcZPbiF
	YrEqlkjq6nsUlByluDt8DmjqNPyai6WhiUQyIf03YmbGnx/9caRqC9Zz8SGhHc9rlgeMV9/mzzwl1
	nbb4W6RA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gH58x-0006N3-3G; Mon, 29 Oct 2018 10:51:35 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gH56x-00044p-Q1
 for linux-riscv@lists.infradead.org; Mon, 29 Oct 2018 10:51:32 +0000
Received: by mail-wm1-x341.google.com with SMTP id h2-v6so3899976wmb.0
 for <linux-riscv@lists.infradead.org>; Mon, 29 Oct 2018 03:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+c9fdXn0k/9YSXFnqXuzG8DyHJveP7cCSIpNxHle8KI=;
 b=Yjjxb2YAl8o4LhvkhK5JfVQNknCjSrF34vW7+ZnynASehYrI7py892n3sAKAyvn0VP
 ch+CSEDXC5rHPa+qjbQbWxAUv0oWg9ApnKiWCth96vhKXonzJuF31OTidMC/bIW4Lsni
 wxBKQ9gNgqE0y6j3y8ElqCj2a0xMshydbcG2tFFAm0iS0+BvBvXmYmOfKqxLOOGPBUrl
 sHKefNO0NmeKv9TxqB1BDWHB5/nLY6ff/v5dHX5R9vspwrdhEncVb7EGw9nklaWJ9usO
 AoM1OaEnkKxejrIV4ACBct0QfojOHgdzK/xqwunkzrKqEhK7lMTSVi+8GJ8dmWol6X+w
 QRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+c9fdXn0k/9YSXFnqXuzG8DyHJveP7cCSIpNxHle8KI=;
 b=mvhSAlTkjA8Mz6pdl3TdS1DPRE+Pg9/OmjVpHQIYZWsd06JQbv6/b3vK6toc3K50Te
 CffBwUnPwQ3zE1Efuy/X+ooy5XTOC0mfQ7tMKHv9iGtEKFJsxLpYwrI9tK1YpJazotMN
 mE0W8yjK7uGNJVmmuCdK9Ut8fvp8dWa9x0/uJg11u+4OPuO/382HVjccsgWKTcj/94E/
 Y273nuBKhairWPF6sGdHaMlnXx1xwFjuaCT9mD3wGiHUm5FlRk1Z9s5OsLU3fo042+57
 6pkwDBeLGr7fLovkwHNQoZiA/UGouRPz8H7BXygRUwTDvWg6KuXcijhfJQKNJ9tAMyQ1
 osYg==
X-Gm-Message-State: AGRZ1gLdeP1xTrxGmoqzqX2mYkZHzgmdW4fP8sG727iVhTcdHSdOXdk/
 WdjJnwvD2l/rzgeLtqR+0a8=
X-Google-Smtp-Source: AJdET5dtA6IhI4wX3Vs1RIgVvi4Jm8mVLGv2yeBjXlp0zR6h/5a3OyXNEMrRqysKxPCoyvvIV1Iouw==
X-Received: by 2002:a1c:2484:: with SMTP id
 k126-v6mr14096651wmk.63.1540810160048; 
 Mon, 29 Oct 2018 03:49:20 -0700 (PDT)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id l70-v6sm36360609wma.0.2018.10.29.03.49.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Oct 2018 03:49:19 -0700 (PDT)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-audit@redhat.com
Subject: [PATCH 1/2] riscv: add audit support
Date: Mon, 29 Oct 2018 11:48:53 +0100
Message-Id: <20181029104854.17432-2-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181029104854.17432-1-david.abdurachmanov@gmail.com>
References: <20181029104854.17432-1-david.abdurachmanov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181029_034931_914442_CA8AFEB5 
X-CRM114-Status: GOOD (  16.42  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181029104853.19RwpzY8vt1Fo6N3rE2mvTLf_QcFTnrQVFlX4t6dGeU@z>

On RISC-V (riscv) audit is supported through generic lib/audit.c.
The patch adds required arch specific definitions.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
 arch/riscv/Kconfig                   |  1 +
 arch/riscv/include/asm/ptrace.h      |  5 +++++
 arch/riscv/include/asm/syscall.h     | 10 ++++++++++
 arch/riscv/include/asm/thread_info.h |  6 ++++++
 arch/riscv/kernel/entry.S            |  4 ++--
 include/uapi/linux/audit.h           |  2 ++
 6 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a344980287a5..8e6d404a4ed0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -28,6 +28,7 @@ config RISCV
 	select GENERIC_STRNLEN_USER
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
+	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_MEMBLOCK
 	select HAVE_MEMBLOCK_NODE_MAP
 	select HAVE_DMA_CONTIGUOUS
diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index 2c5df945d43c..62c5e9d35596 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -113,6 +113,11 @@ static inline void frame_pointer_set(struct pt_regs *regs,
 	SET_FP(regs, val);
 }
 
+static inline unsigned long regs_return_value(struct pt_regs *regs)
+{
+	return regs->a0;
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PTRACE_H */
diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index 8d25f8904c00..bba3da6ef157 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -18,6 +18,7 @@
 #ifndef _ASM_RISCV_SYSCALL_H
 #define _ASM_RISCV_SYSCALL_H
 
+#include <uapi/linux/audit.h>
 #include <linux/sched.h>
 #include <linux/err.h>
 
@@ -99,4 +100,13 @@ static inline void syscall_set_arguments(struct task_struct *task,
 	memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
 }
 
+static inline int syscall_get_arch(void)
+{
+#ifdef CONFIG_64BIT
+	return AUDIT_ARCH_RISCV64;
+#else
+	return AUDIT_ARCH_RISCV32;
+#endif
+}
+
 #endif	/* _ASM_RISCV_SYSCALL_H */
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index f8fa1cd2dad9..1c9cc8389928 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -80,13 +80,19 @@ struct thread_info {
 #define TIF_RESTORE_SIGMASK	4	/* restore signal mask in do_signal() */
 #define TIF_MEMDIE		5	/* is terminating due to OOM killer */
 #define TIF_SYSCALL_TRACEPOINT  6       /* syscall tracepoint instrumentation */
+#define TIF_SYSCALL_AUDIT	7	/* syscall auditing */
 
 #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
+#define _TIF_SYSCALL_TRACEPOINT	(1 << TIF_SYSCALL_TRACEPOINT)
+#define _TIF_SYSCALL_AUDIT	(1 << TIF_SYSCALL_AUDIT)
 
 #define _TIF_WORK_MASK \
 	(_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED)
 
+#define _TIF_SYSCALL_WORK \
+	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_TRACEPOINT | _TIF_SYSCALL_AUDIT)
+
 #endif /* _ASM_RISCV_THREAD_INFO_H */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index fa2c08e3c05e..2a6c2e7aaff3 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -202,7 +202,7 @@ handle_syscall:
 	REG_S s2, PT_SEPC(sp)
 	/* Trace syscalls, but only if requested by the user. */
 	REG_L t0, TASK_TI_FLAGS(tp)
-	andi t0, t0, _TIF_SYSCALL_TRACE
+	andi t0, t0, _TIF_SYSCALL_WORK
 	bnez t0, handle_syscall_trace_enter
 check_syscall_nr:
 	/* Check to make sure we don't jump to a bogus syscall number. */
@@ -222,7 +222,7 @@ ret_from_syscall:
 	REG_S a0, PT_A0(sp)
 	/* Trace syscalls, but only if requested by the user. */
 	REG_L t0, TASK_TI_FLAGS(tp)
-	andi t0, t0, _TIF_SYSCALL_TRACE
+	andi t0, t0, _TIF_SYSCALL_WORK
 	bnez t0, handle_syscall_trace_exit
 
 ret_from_exception:
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index 818ae690ab79..d0e037a96a7b 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -399,6 +399,8 @@ enum {
 /* do not define AUDIT_ARCH_PPCLE since it is not supported by audit */
 #define AUDIT_ARCH_PPC64	(EM_PPC64|__AUDIT_ARCH_64BIT)
 #define AUDIT_ARCH_PPC64LE	(EM_PPC64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
+#define AUDIT_ARCH_RISCV32	(EM_RISCV|__AUDIT_ARCH_LE)
+#define AUDIT_ARCH_RISCV64	(EM_RISCV|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
 #define AUDIT_ARCH_S390		(EM_S390)
 #define AUDIT_ARCH_S390X	(EM_S390|__AUDIT_ARCH_64BIT)
 #define AUDIT_ARCH_SH		(EM_SH)
-- 
2.17.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
