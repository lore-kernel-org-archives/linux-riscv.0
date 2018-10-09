Return-Path: <SRS0=n4Ll=MV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26EE9C00449
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 02:19:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E36752086D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 02:19:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FOS7clM1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E36752086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LNnJGHMAt5n/QClY2EZJWLxfx3tKrNYkcTf04dRWsH0=; b=FOS7clM1kWtMEI
	AMsbT1UIAvcY01W4JCG/XZOymJX/EIrdjjxAMW7ugQ4kYbHPd6hNuxdolFdYvOp/4M4qMiVEt80q2
	WhbrTrOXBfuSkF8HIijvGa96CRKiFzxHn1YVnufQT5SPl6QIt75j8u3t3YN2J12X5WBtf2wpEms00
	5ZF72jlJVo82SXkMZFJOni0Xd12oMW7M15mFNRJi6Jyp3tNPsfqpiiYA/uskAq8TNJHKvz7a/uZPq
	0xYPoLZC59t1ukCMJFmpeGqSxTszfH/fDftpIs/PIHp2sbj7vqkIbQ3OPlUG8YQ4IsbP5kh7+slWG
	2OeJkk/cVjpSesWTV95g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g9hcc-000452-Ls; Tue, 09 Oct 2018 02:19:42 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9hcW-00042m-UB
 for linux-riscv@lists.infradead.org; Tue, 09 Oct 2018 02:19:40 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id w992M3xj032673;
 Tue, 9 Oct 2018 10:22:03 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Tue, 9 Oct 2018
 10:19:22 +0800
From: Alan Kao <alankao@andestech.com>
To: Palmer Dabbelt <palmer@sifive.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH v8 4/5] Allow to disable FPU support
Date: Tue, 9 Oct 2018 10:18:33 +0800
Message-ID: <1539051514-3658-5-git-send-email-alankao@andestech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539051514-3658-1-git-send-email-alankao@andestech.com>
References: <1539051514-3658-1-git-send-email-alankao@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com w992M3xj032673
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181008_191937_248565_7E389922 
X-CRM114-Status: GOOD (  11.29  )
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
Cc: Vincent Chen <vincentc@andestech.com>, Zong Li <zong@andestech.com>,
 Alan Kao <alankao@andestech.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <greentime@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181009021833.UjMeOT6GhIAKJN6D6lleRRVNlUhicHQelyNFR4gY6f4@z>

FPU codes have been separated from common part in previous patches.
This patch add the CONFIG_FPU option and some stubs, so that a no-FPU
configuration is allowed.

Signed-off-by: Alan Kao <alankao@andestech.com>
Cc: Greentime Hu <greentime@andestech.com>
Cc: Vincent Chen <vincentc@andestech.com>
Cc: Zong Li <zong@andestech.com>
Cc: Nick Hu <nickhu@andestech.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/Kconfig                 |  9 +++++++++
 arch/riscv/Makefile                |  2 +-
 arch/riscv/include/asm/switch_to.h | 10 ++++++++++
 arch/riscv/kernel/Makefile         |  2 +-
 arch/riscv/kernel/process.c        |  4 +++-
 arch/riscv/kernel/signal.c         |  5 +++++
 6 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a344980..a63f9db 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -208,6 +208,15 @@ config RISCV_BASE_PMU
 
 endmenu
 
+config FPU
+	bool "FPU support"
+	default y
+	help
+	  Say N here if you want to disable all floating-point related procedure
+	  in the kernel.
+
+	  If you don't know what to do here, say Y.
+
 endmenu
 
 menu "Kernel type"
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 01393e1..901770f 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -44,7 +44,7 @@ KBUILD_CFLAGS += -Wall
 riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32im
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64im
 riscv-march-$(CONFIG_RISCV_ISA_A)	:= $(riscv-march-y)a
-riscv-march-y				:= $(riscv-march-y)fd
+riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
 KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
 KBUILD_AFLAGS += -march=$(riscv-march-y)
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index dd6b05b..093050b 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -18,6 +18,7 @@
 #include <asm/ptrace.h>
 #include <asm/csr.h>
 
+#ifdef CONFIG_FPU
 extern void __fstate_save(struct task_struct *save_to);
 extern void __fstate_restore(struct task_struct *restore_from);
 
@@ -55,6 +56,15 @@ static inline void __switch_to_aux(struct task_struct *prev,
 	fstate_restore(next, task_pt_regs(next));
 }
 
+#define DEFAULT_SSTATUS (SR_SPIE | SR_FS_INITIAL)
+
+#else
+#define fstate_save(task, regs) do { } while (0)
+#define fstate_restore(task, regs) do { } while (0)
+#define __switch_to_aux(__prev, __next) do { } while (0)
+#define DEFAULT_SSTATUS (SR_SPIE | SR_FS_OFF)
+#endif
+
 extern struct task_struct *__switch_to(struct task_struct *,
 				       struct task_struct *);
 
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index bd433efd..f13f7f2 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -13,7 +13,6 @@ extra-y += vmlinux.lds
 obj-y	+= cpu.o
 obj-y	+= cpufeature.o
 obj-y	+= entry.o
-obj-y	+= fpu.o
 obj-y	+= irq.o
 obj-y	+= process.o
 obj-y	+= ptrace.o
@@ -32,6 +31,7 @@ obj-y	+= vdso/
 
 CFLAGS_setup.o := -mcmodel=medany
 
+obj-$(CONFIG_FPU)		+= fpu.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
 obj-$(CONFIG_MODULES)		+= module.o
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index d7c6ca7..07d5156 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -76,7 +76,7 @@ void show_regs(struct pt_regs *regs)
 void start_thread(struct pt_regs *regs, unsigned long pc,
 	unsigned long sp)
 {
-	regs->sstatus = SR_SPIE /* User mode, irqs on */ | SR_FS_INITIAL;
+	regs->sstatus = DEFAULT_SSTATUS;
 	regs->sepc = pc;
 	regs->sp = sp;
 	set_fs(USER_DS);
@@ -84,12 +84,14 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 
 void flush_thread(void)
 {
+#ifdef CONFIG_FPU
 	/*
 	 * Reset FPU context
 	 *	frm: round to nearest, ties to even (IEEE default)
 	 *	fflags: accrued exceptions cleared
 	 */
 	memset(&current->thread.fstate, 0, sizeof(current->thread.fstate));
+#endif
 }
 
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 6a18b98..2450b82 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -37,6 +37,7 @@ struct rt_sigframe {
 	struct ucontext uc;
 };
 
+#ifdef CONFIG_FPU
 static long restore_fp_state(struct pt_regs *regs,
 			     union __riscv_fp_state *sc_fpregs)
 {
@@ -85,6 +86,10 @@ static long save_fp_state(struct pt_regs *regs,
 
 	return err;
 }
+#else
+#define save_fp_state(task, regs) (0)
+#define restore_fp_state(task, regs) (0)
+#endif
 
 static long restore_sigcontext(struct pt_regs *regs,
 	struct sigcontext __user *sc)
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
