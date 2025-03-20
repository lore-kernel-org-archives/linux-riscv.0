Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2A2C28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 17:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KajZ0uKaAIPMuWa7eY4fkPNYihYxBhFJpUkxQYy95a8=; b=pg+IsI6MKiIUoR
	3l1rq44aLyPllYpkMUsFPomOBv1KRtqCmQtOEaAw1OVCY/ONGL4EaGPyUOWDwAWRaSz/G1JCrhE2Y
	MPt+OVPiK7Ksq7ISQLIgudT62Uqmk+Kuh1Pcm3t+pksFEejBK8TdpqKBHYaVKO3Sce+heMyEmfrd4
	Z/Himc+IvSsA5L98vt/DCu/SZOJ/GsfRAn3l54L3Dgq+0HqpdQJku0xwDHOmsIcNEb1oBamvah5Z6
	bmIc3BnXqmZZFKsDIiICsdid2rOdxM4aCVluWhGSY/EXguLlM6xOsOtZEgfF8H3H5tYsOFjoJRPOR
	0n4i4L/RbXF/kkf/Xiyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJjg-0000000CoFn-19jQ;
	Thu, 20 Mar 2025 17:31:16 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJi4-0000000Cnxz-1VY9
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 17:29:37 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-223594b3c6dso25739045ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 10:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742491775; x=1743096575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3jS1rl0NyPiPtBrV6gbvaKvWtHD4LTe2LvNMOIdkhU=;
        b=CpZ6qZHW7+Jg91fq6aeWAkmtvN32XrBoRvcNEw4RqiVDwGKD+HNcH7bGKSJkIjlJKn
         xjmrEa7Yo9IKfXmBBS8fdGirB38tmpYglhyovwkjkIcBiC7bHSzDeWkIGmmTfyGYKkz8
         9R4ca9+4Xn2TJzsMtylptVn2X4Uhd3JK3Eo/jYAICT5CcEeLZrBA8HC4TagfBzIF3QMg
         ghQ/ARo6+zOdjLKuY7jpdFQCKEtmouARYgzMnIbMzijz0AjJFwIDZf34XLcLax8Mk94x
         axNuqAQ5CFmJFjMiTiTUqzYUpAwgdM7P4qfd0nRYoZCMuF2oEerIIy18KFwdqD1jiS95
         OjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742491775; x=1743096575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3jS1rl0NyPiPtBrV6gbvaKvWtHD4LTe2LvNMOIdkhU=;
        b=FgC5xyRn8A8Gpc4O30MHofGxCNJOwXcFGmQSm7M7WWPfab1biP8qXqgguSzcA5Q7Iw
         lkWttxxPOCTyOmFHn6Kbys2wH5e8DQcE3EM94Mz9MQK/V8iRhB3XLkcQaXCluk+Y/UbG
         nhiQe6pjPwGisUb1Qg3mqts36FYLhTfmGUX6gKe0d8Cup0h/c73hkQ2Wlji/5kDjoAdP
         vNeT78tsbWGg4+r6TF5ZiyUiqb6bHXW6vDo2y9ljsLwxtd/UJj3Ds2JEwRpXrdpEnK0P
         QwZlgdHQ02iF11XjKuMZZBLCFhFjiAibKazsXIadX/ezFYJpW3twLHowStDsST/ELucr
         xcug==
X-Gm-Message-State: AOJu0Yxu+96E4Ly4u8ThlaG1dcw6HLTVpgDHSLGBphc/0dmxQQXYCYqL
	d1HcymnQYCkZA0rEt+8hcFx2/IQxd53y19g440/R9d4kHHMZ1KjO649iiCcSrC8=
X-Gm-Gg: ASbGncsXQEWWog1HsmbYruQ/vl0I5UEYKtaStfs8RCc8a83FmbXcCq+jLoMtioTSSnZ
	r7Z/Tgi2JkjSx2MSkRvzCL7j4MBVcwsqfehFedp570b/FLHNSEKQm3ZE7Ehm5ShOKPvZCqyyeNX
	8lUj7tQwxKQdjK2UdxfrxoMVvz/YoSeYaePS9QrlNfY6AIiuFcEowWZm/diT+EbpH/OEIAhkMlx
	pAtajFuc6KA5ibVKiiZptb5lz7mI80JQxB//ittiZIb2gT7NPvG0EJGsWAA1XvYytKy86iw5NxO
	HH5pLaASJYIDX0TBKqIkDlbljKAqHeV8Y8toTP+dSWtmGu/ArNuZDQjBEqqY
X-Google-Smtp-Source: AGHT+IEQ1hA26C98UYsq0v49utf4d+ujVyRXt/fsHRytInopHwMDFgd1YulOL9OtsGProEAKKBvvhw==
X-Received: by 2002:a17:902:ea07:b0:224:76f:9e59 with SMTP id d9443c01a7336-22780c54d2cmr4749885ad.10.1742491775625;
        Thu, 20 Mar 2025 10:29:35 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f45994sm554075ad.81.2025.03.20.10.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 10:29:34 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 20 Mar 2025 10:29:21 -0700
Subject: [PATCH v6 1/4] riscv: entry: Convert ret_from_fork() to C
MIME-Version: 1.0
Message-Id: <20250320-riscv_optimize_entry-v6-1-63e187e26041@rivosinc.com>
References: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com>
In-Reply-To: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3515; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=gaq/v9YuAdYAHAPq6G2li6XLwEhlQb1rcc0R86FQKSc=;
 b=kA0DAAoWjgFid219CPYByyZiAGfcUHrImYiZNCS0BmPPKWSpiEX0ghY/Of3RasTrPX9qN5AB8
 4h1BAAWCgAdFiEEDNaAA4XcL3bFFXaQjgFid219CPYFAmfcUHoACgkQjgFid219CPbRkwEAtPKv
 Ku03MbxplfH795hgrIKj97bZxGVqLUQ7QpkrN6QBAMINRMdaKpxJoDyr+sPeH8RagpPD/EteNBB
 ZeabOyrgN
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_102936_402015_254657F4 
X-CRM114-Status: GOOD (  12.18  )
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

Move the main section of ret_from_fork() to C to allow inlining of
syscall_exit_to_user_mode().

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  1 +
 arch/riscv/kernel/entry.S               | 15 ++++++---------
 arch/riscv/kernel/process.c             | 14 ++++++++++++--
 3 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index cd627ec289f163a630b73dd03dd52a6b28692997..733ff609778797001006c33bba9e3cc5b1f15387 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -52,6 +52,7 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
 DECLARE_DO_ERROR_INFO(do_trap_break);
 
+asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
 asmlinkage void handle_bad_stack(struct pt_regs *regs);
 asmlinkage void do_page_fault(struct pt_regs *regs);
 asmlinkage void do_irq(struct pt_regs *regs);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 33a5a9f2a0d4e1eeccfb3621b9e518b88e1b0704..b2dc5e7c7b3a843fa4aa02eba2a911eb3ce31d1f 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -319,17 +319,14 @@ SYM_CODE_END(handle_kernel_stack_overflow)
 ASM_NOKPROBE(handle_kernel_stack_overflow)
 #endif
 
-SYM_CODE_START(ret_from_fork)
+SYM_CODE_START(ret_from_fork_asm)
 	call schedule_tail
-	beqz s0, 1f	/* not from kernel thread */
-	/* Call fn(arg) */
-	move a0, s1
-	jalr s0
-1:
-	move a0, sp /* pt_regs */
-	call syscall_exit_to_user_mode
+	move a0, s1 /* fn_arg */
+	move a1, s0 /* fn */
+	move a2, sp /* pt_regs */
+	call ret_from_fork
 	j ret_from_exception
-SYM_CODE_END(ret_from_fork)
+SYM_CODE_END(ret_from_fork_asm)
 
 #ifdef CONFIG_IRQ_STACKS
 /*
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 7c244de7718008947075357ea4502d56419d507c..7b0a0bfe29aec896c2bdd8976d855dd390de88d7 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -17,7 +17,9 @@
 #include <linux/ptrace.h>
 #include <linux/uaccess.h>
 #include <linux/personality.h>
+#include <linux/entry-common.h>
 
+#include <asm/asm-prototypes.h>
 #include <asm/unistd.h>
 #include <asm/processor.h>
 #include <asm/csr.h>
@@ -36,7 +38,7 @@ unsigned long __stack_chk_guard __read_mostly;
 EXPORT_SYMBOL(__stack_chk_guard);
 #endif
 
-extern asmlinkage void ret_from_fork(void);
+extern asmlinkage void ret_from_fork_asm(void);
 
 void noinstr arch_cpu_idle(void)
 {
@@ -206,6 +208,14 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
+asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
+{
+	if (unlikely(fn))
+		fn(fn_arg);
+
+	syscall_exit_to_user_mode(regs);
+}
+
 int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 {
 	unsigned long clone_flags = args->flags;
@@ -242,7 +252,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	p->thread.riscv_v_flags = 0;
 	if (has_vector() || has_xtheadvector())
 		riscv_v_thread_alloc(p);
-	p->thread.ra = (unsigned long)ret_from_fork;
+	p->thread.ra = (unsigned long)ret_from_fork_asm;
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
