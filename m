Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4486C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 13 May 2022 02:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7zXUsldHK9wW/nfUbO0Kmp1Q82g1VrenB44OU3pCJk=; b=COfB//M/+Ozo7E
	znY72tiDfPqi6gwarc6OZ8aS+UBDo/m+P2NFASuCqKxwUMhm51CYdvJqOf0QSpXTCddRdDmaQhB/5
	Uw6i1k0x24EcM/mghNImBTEue+BVdlsHy9izZ8BROlAvzV8cV3DryHwEXmb+fmEhIasJlLZg41/15
	mOPMyafScD8IH/3eUmG8ppj/e8BA96ScDO0r6wbVoniucuntL1GKl0b+FK7TzbHWArSRsVNpx78v6
	sMPwtE/GL5vEYdZuro7SzQDB2pmlMw6ebDNiph3qjg0Z3jeHobPRbxqq/scpheXQiNrFJVHs3sVcB
	AyvpOiZZ0asm3hr+UlRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npKoY-00E9uZ-Ed; Fri, 13 May 2022 02:13:58 +0000
Received: from [2400:dd01:100f:2:72e2:84ff:fe10:5f45] (helo=mail.nfschina.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npKoK-00E9sh-OY; Fri, 13 May 2022 02:13:48 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id F0AF51E80C82;
 Fri, 13 May 2022 10:07:58 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ipRy1WLhqHg; Fri, 13 May 2022 10:07:56 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
 (Authenticated sender: kunyu@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id B62C81E80C80;
 Fri, 13 May 2022 10:07:54 +0800 (CST)
From: Li kunyu <kunyu@nfschina.com>
To: rostedt@goodmis.org
Cc: mingo@redhat.com, linux@armlinux.org.uk, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, tglx@linutronix.de, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 liqiong@nfschina.com, Li kunyu <kunyu@nfschina.com>
Subject: [PATCH] kernel: Ftrace seems to have functions to improve performance
 through optimization through optimization
Date: Fri, 13 May 2022 10:13:14 +0800
Message-Id: <20220513021314.59480-1-kunyu@nfschina.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20220512110725.22e69e3c@gandalf.local.home>
References: <20220512110725.22e69e3c@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_191346_691550_5FC691F2 
X-CRM114-Status: GOOD (  10.47  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

such as ftrace_ARCH_code_*, return 0, so the FTRACE_* check is not required

Signed-off-by: Li kunyu <kunyu@nfschina.com>
---
 arch/arm/kernel/ftrace.c   |  6 ++----
 arch/riscv/kernel/ftrace.c |  6 ++----
 arch/s390/kernel/ftrace.c  |  3 +--
 arch/x86/kernel/ftrace.c   |  6 ++----
 include/linux/ftrace.h     |  4 ++--
 kernel/trace/ftrace.c      | 16 ++++------------
 6 files changed, 13 insertions(+), 28 deletions(-)

diff --git a/arch/arm/kernel/ftrace.c b/arch/arm/kernel/ftrace.c
index 83cc068586bc..a0b6d1e3812f 100644
--- a/arch/arm/kernel/ftrace.c
+++ b/arch/arm/kernel/ftrace.c
@@ -79,16 +79,14 @@ static unsigned long __ref adjust_address(struct dyn_ftrace *rec,
 	return (unsigned long)&ftrace_regs_caller_from_init;
 }
 
-int ftrace_arch_code_modify_prepare(void)
+void ftrace_arch_code_modify_prepare(void)
 {
-	return 0;
 }
 
-int ftrace_arch_code_modify_post_process(void)
+void ftrace_arch_code_modify_post_process(void)
 {
 	/* Make sure any TLB misses during machine stop are cleared. */
 	flush_tlb_all();
-	return 0;
 }
 
 static unsigned long ftrace_call_replace(unsigned long pc, unsigned long addr,
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 4716f4cdc038..2086f6585773 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -12,16 +12,14 @@
 #include <asm/patch.h>
 
 #ifdef CONFIG_DYNAMIC_FTRACE
-int ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
+void ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
 {
 	mutex_lock(&text_mutex);
-	return 0;
 }
 
-int ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
+void ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
 {
 	mutex_unlock(&text_mutex);
-	return 0;
 }
 
 static int ftrace_check_current_call(unsigned long hook_pos,
diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
index 1852d46babb1..416b5a94353d 100644
--- a/arch/s390/kernel/ftrace.c
+++ b/arch/s390/kernel/ftrace.c
@@ -225,14 +225,13 @@ void arch_ftrace_update_code(int command)
 	ftrace_modify_all_code(command);
 }
 
-int ftrace_arch_code_modify_post_process(void)
+void ftrace_arch_code_modify_post_process(void)
 {
 	/*
 	 * Flush any pre-fetched instructions on all
 	 * CPUs to make the new code visible.
 	 */
 	text_poke_sync_lock();
-	return 0;
 }
 
 #ifdef CONFIG_MODULES
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 1e31c7d21597..73d2719ed12c 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -37,7 +37,7 @@
 
 static int ftrace_poke_late = 0;
 
-int ftrace_arch_code_modify_prepare(void)
+void ftrace_arch_code_modify_prepare(void)
     __acquires(&text_mutex)
 {
 	/*
@@ -47,10 +47,9 @@ int ftrace_arch_code_modify_prepare(void)
 	 */
 	mutex_lock(&text_mutex);
 	ftrace_poke_late = 1;
-	return 0;
 }
 
-int ftrace_arch_code_modify_post_process(void)
+void ftrace_arch_code_modify_post_process(void)
     __releases(&text_mutex)
 {
 	/*
@@ -61,7 +60,6 @@ int ftrace_arch_code_modify_post_process(void)
 	text_poke_finish();
 	ftrace_poke_late = 0;
 	mutex_unlock(&text_mutex);
-	return 0;
 }
 
 static const char *ftrace_nop_replace(void)
diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 4816b7e11047..a5f74f6e7e4e 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -449,8 +449,8 @@ static inline void stack_tracer_enable(void) { }
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 
-int ftrace_arch_code_modify_prepare(void);
-int ftrace_arch_code_modify_post_process(void);
+void ftrace_arch_code_modify_prepare(void);
+void ftrace_arch_code_modify_post_process(void);
 
 enum ftrace_bug_type {
 	FTRACE_BUG_UNKNOWN,
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 4f1d2f5e7263..35a899f136fe 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -2707,18 +2707,16 @@ ftrace_nop_initialize(struct module *mod, struct dyn_ftrace *rec)
  * archs can override this function if they must do something
  * before the modifying code is performed.
  */
-int __weak ftrace_arch_code_modify_prepare(void)
+void __weak ftrace_arch_code_modify_prepare(void)
 {
-	return 0;
 }
 
 /*
  * archs can override this function if they must do something
  * after the modifying code is performed.
  */
-int __weak ftrace_arch_code_modify_post_process(void)
+void __weak ftrace_arch_code_modify_post_process(void)
 {
-	return 0;
 }
 
 void ftrace_modify_all_code(int command)
@@ -2804,12 +2802,7 @@ void __weak arch_ftrace_update_code(int command)
 
 static void ftrace_run_update_code(int command)
 {
-	int ret;
-
-	ret = ftrace_arch_code_modify_prepare();
-	FTRACE_WARN_ON(ret);
-	if (ret)
-		return;
+	ftrace_arch_code_modify_prepare();
 
 	/*
 	 * By default we use stop_machine() to modify the code.
@@ -2819,8 +2812,7 @@ static void ftrace_run_update_code(int command)
 	 */
 	arch_ftrace_update_code(command);
 
-	ret = ftrace_arch_code_modify_post_process();
-	FTRACE_WARN_ON(ret);
+	ftrace_arch_code_modify_post_process();
 }
 
 static void ftrace_run_modify_code(struct ftrace_ops *ops, int command,
-- 
2.18.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
