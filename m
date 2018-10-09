Return-Path: <SRS0=n4Ll=MV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374CCC00449
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 02:19:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E68CD2086D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 02:19:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oEY4CzNg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E68CD2086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhME4KqyUg7CaamQF8aCE7po7X6Y14uxHB6KnwiXX94=; b=oEY4CzNgn6lS9q
	1nmmKTMxKNx7wyhk1Ee8+E2ZJUupwbmo+PM8Gu0HOS/Gx93c34AJL+AQUKFeAjz6HwjPZvmW3te+U
	KnSQeb09kpuJBxXSQICwdSYE76vCKBuuNGmE1efoflXfHTrhZlKQWj9VfJZ37E/ql20XLA9j1HtPR
	3GCiAN6CCMqOvK1QwX+SnIlT5q4KvE4tiaX47mIQq7k+QiJD5CKL8Ps08ATeLGxM6+FhUBDRGTkQ/
	jc8Dw61DKg9O8J5W2BFsHUXMRa5hwAHfZpNPK5V6DAjv18aIgBCNwcaupzhdkghOW5r1vZu9V4Qdc
	ipcyYQ0FZgucOd0kIArQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g9hcr-0004CU-Gd; Tue, 09 Oct 2018 02:19:57 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9hcj-00043O-8K
 for linux-riscv@lists.infradead.org; Tue, 09 Oct 2018 02:19:54 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id w992M8jx032690;
 Tue, 9 Oct 2018 10:22:08 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Tue, 9 Oct 2018
 10:19:27 +0800
From: Alan Kao <alankao@andestech.com>
To: Palmer Dabbelt <palmer@sifive.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH v8 5/5] Auto-detect whether a FPU exists
Date: Tue, 9 Oct 2018 10:18:34 +0800
Message-ID: <1539051514-3658-6-git-send-email-alankao@andestech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539051514-3658-1-git-send-email-alankao@andestech.com>
References: <1539051514-3658-1-git-send-email-alankao@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com w992M8jx032690
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181008_191949_575163_4AC5EE31 
X-CRM114-Status: GOOD (  11.76  )
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
Message-ID: <20181009021834.PBpMb5yuPW6PeGpRqSscgb3b0E6yucEYZPBpp8SIMQ0@z>

We expect that a kernel with CONFIG_FPU=y can still support no-FPU
machines. To do so, the kernel should first examine the existence of a
FPU, then do nothing if a FPU does exist; otherwise, it should
disable/bypass all FPU-related functions.

In this patch, a new global variable, has_fpu, is created and determined
when parsing the hardware capability from device tree during booting.
This variable is used in those FPU-related functions.

Signed-off-by: Alan Kao <alankao@andestech.com>
Cc: Greentime Hu <greentime@andestech.com>
Cc: Vincent Chen <vincentc@andestech.com>
Cc: Zong Li <zong@andestech.com>
Cc: Nick Hu <nickhu@andestech.com>
---
 arch/riscv/include/asm/switch_to.h | 8 ++++----
 arch/riscv/kernel/cpufeature.c     | 8 ++++++++
 arch/riscv/kernel/process.c        | 4 +++-
 arch/riscv/kernel/signal.c         | 6 ++++--
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 093050b..7335590 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -56,13 +56,12 @@ static inline void __switch_to_aux(struct task_struct *prev,
 	fstate_restore(next, task_pt_regs(next));
 }
 
-#define DEFAULT_SSTATUS (SR_SPIE | SR_FS_INITIAL)
-
+extern bool has_fpu;
 #else
+#define has_fpu false
 #define fstate_save(task, regs) do { } while (0)
 #define fstate_restore(task, regs) do { } while (0)
 #define __switch_to_aux(__prev, __next) do { } while (0)
-#define DEFAULT_SSTATUS (SR_SPIE | SR_FS_OFF)
 #endif
 
 extern struct task_struct *__switch_to(struct task_struct *,
@@ -72,7 +71,8 @@ extern struct task_struct *__switch_to(struct task_struct *,
 do {							\
 	struct task_struct *__prev = (prev);		\
 	struct task_struct *__next = (next);		\
-	__switch_to_aux(__prev, __next);		\
+	if (has_fpu)					\
+		__switch_to_aux(__prev, __next);	\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 17011a8..46942e6 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -22,6 +22,9 @@
 #include <asm/hwcap.h>
 
 unsigned long elf_hwcap __read_mostly;
+#ifdef CONFIG_FPU
+bool has_fpu __read_mostly;
+#endif
 
 void riscv_fill_hwcap(void)
 {
@@ -58,4 +61,9 @@ void riscv_fill_hwcap(void)
 		elf_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
 
 	pr_info("elf_hwcap is 0x%lx", elf_hwcap);
+
+#ifdef CONFIG_FPU
+	if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))
+		has_fpu = true;
+#endif
 }
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 07d5156..bef1999 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -76,7 +76,9 @@ void show_regs(struct pt_regs *regs)
 void start_thread(struct pt_regs *regs, unsigned long pc,
 	unsigned long sp)
 {
-	regs->sstatus = DEFAULT_SSTATUS;
+	regs->sstatus = SR_SPIE;
+	if (has_fpu)
+		regs->sstatus |= SR_FS_INITIAL;
 	regs->sepc = pc;
 	regs->sp = sp;
 	set_fs(USER_DS);
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 2450b82..f9b5e7e 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -98,7 +98,8 @@ static long restore_sigcontext(struct pt_regs *regs,
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
 	/* Restore the floating-point state. */
-	err |= restore_fp_state(regs, &sc->sc_fpregs);
+	if (has_fpu)
+		err |= restore_fp_state(regs, &sc->sc_fpregs);
 	return err;
 }
 
@@ -150,7 +151,8 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
 	/* Save the floating-point state. */
-	err |= save_fp_state(regs, &sc->sc_fpregs);
+	if (has_fpu)
+		err |= save_fp_state(regs, &sc->sc_fpregs);
 	return err;
 }
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
