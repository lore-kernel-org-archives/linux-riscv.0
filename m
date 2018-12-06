Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA29C65BAF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 15:02:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EDA120700
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 15:02:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mEBNo6ng";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YV0kAUlh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EDA120700
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M48E6J2b7G9jgwH8FtFskDwTCnF8fF3on4IB3SHt8ts=; b=mEBNo6ng/TvY/T
	ccOw0sk7QIFnTK7Sik0emS8gdBMGnRYxSixD5AHDsjsWD+Haw921ueGRCts5z/y+RcLhqQ11Xhu/e
	+dumPJwl1xl4Sa81Sjvoorza3bYSaLGy0Xp+e0TqaSKfDKbHlmoHZrSJEWy83OFmMVdp59hT1nVZs
	jMA6c+ol5uveXB8VUqRcC66fpj8ewsnVi3WLx8dViopXhHgaBTptYl1flwHbD91oXsblmaKE+yYoD
	qm+irTuSgTGvF4zPh3m8T7LHgSuYhwWXhRpFLFWrpf/K1uI4TsK9IudmvdEv0mHPyf3NHwZETqdMy
	IPl4/VCWixU4DwLldZjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUvAa-0000lo-Hf; Thu, 06 Dec 2018 15:02:28 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUvAW-0000iP-70
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 15:02:26 +0000
Received: by mail-wr1-x444.google.com with SMTP id c14so840206wrr.0
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 07:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uymB+aF3Tw4L2DXeZA9sUfLB7eetCMjtVdlmrZn8CYw=;
 b=YV0kAUlhA4d6E/c8W6W6ij+uB7OC9S1N+5T2FGJi3KrRpTUeNp2I9UCp8Las6beMym
 LTHIbn++LNfl3fpDNhIEO/w4puR7Ls6pfc4KdfPll7lUhfekVab3o2ChjE2hwTfgq63G
 bHt2w2PRGMNMlyPUjCl90dHzc3I8azEzm1YYxQxoKwEniTWqDhbVGgym+TuyVUeOUYA6
 2fp8VU+24hDHWHCn31nYS77X2g1qE42BRdpnzoMgDfp0nWJZ5RSBLd/DCaeb9+MeUU8b
 wXClzMo3ys6oYybMCsMj1GiXQO/H63MPg5vJKzN+ItGphC3XVl+sVFPqNH8w/an6P5px
 yxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uymB+aF3Tw4L2DXeZA9sUfLB7eetCMjtVdlmrZn8CYw=;
 b=mJwPzQ13riWRBft4JXjbEHVMviZOf5Op20uMLzFHV6jHLuYwiW2ihgc+bw1LDOm1Ih
 nQytW/TkDblN8Ud9jDWvvfSjms7kqbDMek3MUugUdPtClmQq9bLs1GOpI4db5/6B6EWj
 1BRtXzUW3Qwx1Iuy92yACLCBhSYTJaC1BOwOExiSjiKMMrs6M8EfxFnlbyma4IxVVd9x
 s8G7d0GbZ6ok1h6wsUnRC7E0XStREfbPOClCUe4/ewxZG43sncQvnDGUC1nYGUr8meTs
 8PuCu3Vwiq3buJ+jpfZK6bMN5NGgHB1ZW+XpeNVkuK89auRCPgaPHhMizr/1BLwCQnW3
 x0sw==
X-Gm-Message-State: AA+aEWZION5KVQYBg7wYClGxyT5/iPHKOvqySKc/99PxKbcE/4IrneBx
 ECnHof5Yf6JXsGrLGBuaKnm1nK7oEiQ=
X-Google-Smtp-Source: AFSGD/U9w1eNmei2xXFqrIQYZU6tgjvRwfUNaZwOiKOSf4zoxmn4QIFgsc5tSrdUaFkyHxIUEEBZnw==
X-Received: by 2002:a5d:4d46:: with SMTP id a6mr18736738wru.28.1544108532621; 
 Thu, 06 Dec 2018 07:02:12 -0800 (PST)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id 14sm1629981wmv.36.2018.12.06.07.02.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Dec 2018 07:02:12 -0800 (PST)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, keescook@chromium.org,
 luto@amacapital.net, wad@chromium.org, green.hu@gmail.com,
 deanbo422@gmail.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] riscv: add support for SECCOMP incl. filters
Date: Thu,  6 Dec 2018 16:01:55 +0100
Message-Id: <20181206150156.28210-2-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181206150156.28210-1-david.abdurachmanov@gmail.com>
References: <20181206150156.28210-1-david.abdurachmanov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_070224_343923_FCE67936 
X-CRM114-Status: GOOD (  16.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The patch adds support for SECCOMP and SECCOMP_FILTER (BPF).

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
 arch/riscv/Kconfig                   | 14 ++++++++++++++
 arch/riscv/include/asm/thread_info.h |  5 ++++-
 arch/riscv/kernel/entry.S            | 27 +++++++++++++++++++++++++--
 arch/riscv/kernel/ptrace.c           |  8 ++++++++
 4 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a4f48f757204..49cd8e251547 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -29,6 +29,7 @@ config RISCV
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
 	select HAVE_ARCH_AUDITSYSCALL
+	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_MEMBLOCK_NODE_MAP
 	select HAVE_DMA_CONTIGUOUS
 	select HAVE_FUTEX_CMPXCHG if FUTEX
@@ -228,6 +229,19 @@ menu "Kernel features"
 
 source "kernel/Kconfig.hz"
 
+config SECCOMP
+	bool "Enable seccomp to safely compute untrusted bytecode"
+	help
+	  This kernel feature is useful for number crunching applications
+	  that may need to compute untrusted bytecode during their
+	  execution. By using pipes or other transports made available to
+	  the process as file descriptors supporting the read/write
+	  syscalls, it's possible to isolate those applications in
+	  their own address space using seccomp. Once seccomp is
+	  enabled via prctl(PR_SET_SECCOMP), it cannot be disabled
+	  and the task is only allowed to execute a few safe syscalls
+	  defined by each seccomp mode.
+
 endmenu
 
 menu "Boot options"
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 1c9cc8389928..1fd6e4130cab 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -81,6 +81,7 @@ struct thread_info {
 #define TIF_MEMDIE		5	/* is terminating due to OOM killer */
 #define TIF_SYSCALL_TRACEPOINT  6       /* syscall tracepoint instrumentation */
 #define TIF_SYSCALL_AUDIT	7	/* syscall auditing */
+#define TIF_SECCOMP			8	/* syscall secure computing */
 
 #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
@@ -88,11 +89,13 @@ struct thread_info {
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
 #define _TIF_SYSCALL_TRACEPOINT	(1 << TIF_SYSCALL_TRACEPOINT)
 #define _TIF_SYSCALL_AUDIT	(1 << TIF_SYSCALL_AUDIT)
+#define _TIF_SECCOMP		(1 << TIF_SECCOMP)
 
 #define _TIF_WORK_MASK \
 	(_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED)
 
 #define _TIF_SYSCALL_WORK \
-	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_TRACEPOINT | _TIF_SYSCALL_AUDIT)
+	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_TRACEPOINT | _TIF_SYSCALL_AUDIT \
+	 _TIF_SECCOMP )
 
 #endif /* _ASM_RISCV_THREAD_INFO_H */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 355166f57205..e88ccbfa61ee 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -207,8 +207,25 @@ check_syscall_nr:
 	/* Check to make sure we don't jump to a bogus syscall number. */
 	li t0, __NR_syscalls
 	la s0, sys_ni_syscall
-	/* Syscall number held in a7 */
-	bgeu a7, t0, 1f
+	/*
+	 * The tracer can change syscall number to valid/invalid value.
+	 * We use syscall_set_nr helper in syscall_trace_enter thus we
+	 * cannot trust the current value in a7 and have to reload from
+	 * the current task pt_regs.
+	 */
+	REG_L a7, PT_A7(sp)
+	/*
+	 * Syscall number held in a7.
+	 * If syscall number is above allowed value, redirect to ni_syscall.
+	 */
+	bge a7, t0, 1f
+	/*
+	 * Check if syscall is rejected by tracer or seccomp, i.e., a7 == -1.
+	 * If yes, we pretend it was executed.
+	 */
+	li t1, -1
+	beq a7, t1, ret_from_syscall_rejected
+	/* Call syscall */
 	la s0, sys_call_table
 	slli t0, a7, RISCV_LGPTR
 	add s0, s0, t0
@@ -219,6 +236,12 @@ check_syscall_nr:
 ret_from_syscall:
 	/* Set user a0 to kernel a0 */
 	REG_S a0, PT_A0(sp)
+	/*
+	 * We didn't execute the actual syscall.
+	 * Seccomp already set return value for the current task pt_regs.
+	 * (If it was configured with SECCOMP_RET_ERRNO/TRACE)
+	 */
+ret_from_syscall_rejected:
 	/* Trace syscalls, but only if requested by the user. */
 	REG_L t0, TASK_TI_FLAGS(tp)
 	andi t0, t0, _TIF_SYSCALL_WORK
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index c1b51539c3e2..598e48b8ca2b 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -160,6 +160,14 @@ void do_syscall_trace_enter(struct pt_regs *regs)
 		if (tracehook_report_syscall_entry(regs))
 			syscall_set_nr(current, regs, -1);
 
+	/*
+	 * Do the secure computing after ptrace; failures should be fast.
+	 * If this fails we might have return value in a0 from seccomp
+	 * (via SECCOMP_RET_ERRNO/TRACE).
+	 */
+	if (secure_computing(NULL) == -1)
+		syscall_set_nr(current, regs, -1);
+
 #ifdef CONFIG_HAVE_SYSCALL_TRACEPOINTS
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
 		trace_sys_enter(regs, syscall_get_nr(current, regs));
-- 
2.19.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
