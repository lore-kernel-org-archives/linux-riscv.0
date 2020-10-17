Return-Path: <SRS0=ZqiR=DY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77784C433E7
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2020 07:07:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 233982074A
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2020 07:07:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HGm6BLqC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BuGT97ed"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 233982074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFvHFw7ePjJQhXbdrJjLv5NTjdH8Q/dK4+vHAe0Ex+E=; b=HGm6BLqCBeoaYZUB9ZhtnJ5L+r
	NJaB//KCv/HeMRo4/snswOB6aLgSJytnAb+1yMIr/X+ww2D1ytpZyHFNp9aPkQipI1BtT5EElWWDm
	5MgqKl+hs2e9Iou2ezymXVb5d7hsegUNB9hPukZHQoqe0rdV6Q+756vKxKENF/8L2xMVLGzrDZkav
	zqXwb34Cn+MEqO9NnJwx0W/BwhE2wCl9QbrgKXGCUmubc13Jwkx9oMTodWv93YKSsaEN5srUacNlu
	TBoD3SGWU4QuxwrWvTnvEuousBzl+LMj4aD7WblDcTYCK1pUEf+BMSetQohKoMqbGVLV22aLKUXB8
	0Ns3lpsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTgJa-0001qT-6T; Sat, 17 Oct 2020 07:07:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTgJX-0001oe-Gl
 for linux-riscv@lists.infradead.org; Sat, 17 Oct 2020 07:07:40 +0000
Received: from localhost.localdomain (89.208.247.74.16clouds.com
 [89.208.247.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 541C820780;
 Sat, 17 Oct 2020 07:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602918458;
 bh=cnrTuRuyF661UaIqGnTRsOmgOyysiciU8maSZIvVeyk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BuGT97edZaDOn9C7tZhcrYqX9mJDEmgsJojVtKr/VO2GlOjJMPAXwECNQh0HiUiuA
 SVmMkFmG2eaYvsi76HKNZx+4vDt1Ao3IgoFlY5vsgrPTNnzSyHSyTbE7JFOu9qoqhL
 egzzisy2F3iucLcXvL4LoTW1yxkt3wHfZjL1xdM0=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, mhiramat@kernel.org,
 alankao@andestech.com, rostedt@goodmis.org
Subject: [PATCH v4 8/9] riscv: Add support for function error injection
Date: Sat, 17 Oct 2020 07:06:16 +0000
Message-Id: <1602918377-23573-9-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602918377-23573-1-git-send-email-guoren@kernel.org>
References: <1602918377-23573-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201017_030739_668006_196C1A29 
X-CRM114-Status: GOOD (  18.70  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: me@packi.ch, Guo Ren <guoren@linux.alibaba.com>, anup@brainfault.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, guoren@kernel.org,
 zong.li@sifive.com, greentime.hu@sifive.com, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Inspired by the commit 42d038c4fb00 ("arm64: Add support for function
error injection"), this patch supports function error injection for
riscv.

This patch mainly support two functions: one is regs_set_return_value()
which is used to overwrite the return value; the another function is
override_function_with_return() which is to override the probed
function returning and jump to its caller.

Test log:
 cd /sys/kernel/debug/fail_function
 echo sys_clone > inject
 echo 100 > probability
 echo 1 > interval
 ls /
[  313.176875] FAULT_INJECTION: forcing a failure.
[  313.176875] name fail_function, interval 1, probability 100, space 0, times 1
[  313.184357] CPU: 0 PID: 87 Comm: sh Not tainted 5.8.0-rc5-00007-g6a758cc #117
[  313.187616] Call Trace:
[  313.189100] [<ffffffe0002036b6>] walk_stackframe+0x0/0xc2
[  313.191626] [<ffffffe00020395c>] show_stack+0x40/0x4c
[  313.193927] [<ffffffe000556c60>] dump_stack+0x7c/0x96
[  313.194795] [<ffffffe0005522e8>] should_fail+0x140/0x142
[  313.195923] [<ffffffe000299ffc>] fei_kprobe_handler+0x2c/0x5a
[  313.197687] [<ffffffe0009e2ec4>] kprobe_breakpoint_handler+0xb4/0x18a
[  313.200054] [<ffffffe00020357e>] do_trap_break+0x36/0xca
[  313.202147] [<ffffffe000201bca>] ret_from_exception+0x0/0xc
[  313.204556] [<ffffffe000201bbc>] ret_from_syscall+0x0/0x2
-sh: can't fork: Invalid argument

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
---
 arch/riscv/Kconfig              |  1 +
 arch/riscv/include/asm/ptrace.h |  6 ++++++
 arch/riscv/lib/Makefile         |  2 ++
 arch/riscv/lib/error-inject.c   | 10 ++++++++++
 4 files changed, 19 insertions(+)
 create mode 100644 arch/riscv/lib/error-inject.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4081ecf..3d094fd 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -66,6 +66,7 @@ config RISCV
 	select HAVE_EBPF_JIT if MMU
 	select HAVE_FUTEX_CMPXCHG if FUTEX
 	select HAVE_GCC_PLUGINS
+	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_GENERIC_VDSO if MMU && 64BIT
 	select HAVE_KPROBES
 	select HAVE_KPROBES_ON_FTRACE
diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index 23372bb..cb4abb6 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -109,6 +109,12 @@ static inline unsigned long regs_return_value(struct pt_regs *regs)
 	return regs->a0;
 }
 
+static inline void regs_set_return_value(struct pt_regs *regs,
+					 unsigned long val)
+{
+	regs->a0 = val;
+}
+
 extern int regs_query_register_offset(const char *name);
 extern unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs,
 					       unsigned int n);
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 0d0db80..04baa93 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -4,3 +4,5 @@ lib-y			+= memcpy.o
 lib-y			+= memset.o
 lib-y			+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
+
+obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
diff --git a/arch/riscv/lib/error-inject.c b/arch/riscv/lib/error-inject.c
new file mode 100644
index 00000000..d667ade
--- /dev/null
+++ b/arch/riscv/lib/error-inject.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/error-injection.h>
+#include <linux/kprobes.h>
+
+void override_function_with_return(struct pt_regs *regs)
+{
+	instruction_pointer_set(regs, regs->ra);
+}
+NOKPROBE_SYMBOL(override_function_with_return);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
