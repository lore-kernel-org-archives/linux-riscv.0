Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A5DC7EE23
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 22:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SxX84pGqa6NNSD2Bsu6Pn6Bgz+DddMRpE9IhCkdE2W0=; b=p4gFwHyNSN8Iy+
	YLAn+8Mt5wYM2sPIaion4cIJG6gHIooaN9NckiLZ/oPq4Xd/p+/bVZO/6enTbT6X7Q4h57/sZuQ9x
	FAoSQPfEaqRw/LFsCcKVl3bEsRG90USWWPUY1KRSJa0YNfmz5HKzF7lCEF9AUR60ukVkQzBAyIsxu
	3xFG6VuHY3dofnJp9CWJQE3JhCsZo7n5XFttNEhi4Fsu0appCi0T3HKaAAKg5ha1Nf3hXiaHVgCRQ
	gLYPOJ5T51nTxeC1zwHbLPCYA4foXVAc32fzY++T/iFmFRdulm769MYWWxe0wrqkLfI9N0m1Lbpw5
	rSHcl+Zy4Pl6x/pw/SmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXV6g-000CIV-I2; Wed, 01 Mar 2023 22:39:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXV6d-000CHy-Eq
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 22:39:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 02629B81178;
	Wed,  1 Mar 2023 22:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1690CC433D2;
	Wed,  1 Mar 2023 22:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677710364;
	bh=bVOTha/5FZGwNDfObZBUtzCQ0E5FcHiV5l1x/hNPAZc=;
	h=From:To:Cc:Subject:Date:From;
	b=INOLvCsxDfL+GyNeTU1jXNwpy+tBuorWmx88hkCoqoC5pIFZgELkl3YECR3WWc4ez
	 vsRzL1gqjNUOl7nxC5yzMK1NkMPTjigYtvWHxAbaV4wBvK+k9eQesw94ivNHOJ6VCH
	 /V6J17uy2veNNhLQV4zjAeiJm1esA+9cy18jZYBZEEnjETPlR+wVt8LcfM5Hp7qh5E
	 ApmOCnKEwnNtOzDovX7yekQuNDA5vdONG5JI+JO9AA87seQ+eBObgmdd9iBPZ8Zu9p
	 bDeaDT1uND860n4nHeJ3Wyqb0KvrK8J9z6W/mo5GDSTIeQABYfiMdKB8zSa8CA0SUG
	 UPQUyecOcWrGw==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Palmer Dabbelt <palmerdabbelt@google.com>,
	linux-riscv@lists.infradead.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Changbin Du <changbin.du@gmail.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4] RISC-V: Don't check text_mutex during stop_machine
Date: Wed,  1 Mar 2023 22:38:53 +0000
Message-Id: <20230301223853.1444332-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5854; i=conor.dooley@microchip.com; h=from:subject; bh=SJ05nN2Nzi0/xv73MFWwsbBRBzuLi8wuzmrgjz02YIE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMn/L/+ynMioe/zG0Vid94pK26/PeOPAIFbJt0XgLNeLm Q5/t5d2d5SyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiBhYM/6vcji2XUPG4rxxQ 2HVm3rNvh1/4sH84EHj4W5LV3zlBmrWMDE/Et97aqsX1rvlwWoxtgV3lxokda3ZOSRavvCDuuuK BPBsA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_143927_852933_5A9703CA 
X-CRM114-Status: GOOD (  27.10  )
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

From: Palmer Dabbelt <palmerdabbelt@google.com>

We're currently using stop_machine() to update ftrace & kprobes, which
means that the thread that takes text_mutex during may not be the same
as the thread that eventually patches the code.  This isn't actually a
race because the lock is still held (preventing any other concurrent
accesses) and there is only one thread running during stop_machine(),
but it does trigger a lockdep failure.

This patch just elides the lockdep check during stop_machine.

Fixes: c15ac4fd60d5 ("riscv/ftrace: Add dynamic function tracer support")
Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Reported-by: Changbin Du <changbin.du@gmail.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v3 [<20230215164317.727657-1-conor@kernel.org>]:
* rename the flag to riscv_patch_in_stop_machine as it is being used for
  kprobes & ftrace, and just looked a bit odd.
* implement Changbin's suggestion of checking the lock is held in
  patch_text(), rather than set the flag in callers of patch_text().

Changes since v2 [<20220322022331.32136-1-palmer@rivosinc.com>]:
* rebase on riscv/for-next as it as been a year.
* incorporate Changbin's suggestion that init_nop should take the lock
  rather than call prepare() & post_process().

Changes since v1 [<20210506071041.417854-1-palmer@dabbelt.com>]:
* Use ftrace_arch_ocde_modify_{prepare,post_process}() to set the flag.
  I remember having a reason I wanted the function when I wrote the v1,
  but it's been almost a year and I forget what that was -- maybe I was
  just crazy, the patch was sent at midnight.
* Fix DYNAMIC_FTRACE=n builds.
---
 arch/riscv/include/asm/ftrace.h |  7 +++++++
 arch/riscv/kernel/ftrace.c      | 15 +++++++++++++--
 arch/riscv/kernel/patch.c       | 26 +++++++++++++++++++++++---
 3 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 9e73922e1e2e..41e0f4aa5243 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -107,8 +107,15 @@ do {									\
 struct dyn_ftrace;
 int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
 #define ftrace_init_nop ftrace_init_nop
+extern int riscv_patch_in_stop_machine;
 #endif
 
+#else /* CONFIG_DYNAMIC_FTRACE */
+
+#ifndef __ASSEMBLY__
+#define riscv_patch_in_stop_machine 0
 #endif
 
+#endif /* CONFIG_DYNAMIC_FTRACE */
+
 #endif /* _ASM_RISCV_FTRACE_H */
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 5bff37af4770..00cb8d51a0ec 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -11,14 +11,25 @@
 #include <asm/cacheflush.h>
 #include <asm/patch.h>
 
+int riscv_patch_in_stop_machine;
+
 #ifdef CONFIG_DYNAMIC_FTRACE
 void ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
 {
 	mutex_lock(&text_mutex);
+
+	/*
+	 * The code sequences we use for ftrace can't be patched while the
+	 * kernel is running, so we need to use stop_machine() to modify them
+	 * for now.  This doesn't play nice with text_mutex, we use this flag
+	 * to elide the check.
+	 */
+	riscv_patch_in_stop_machine = true;
 }
 
 void ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
 {
+	riscv_patch_in_stop_machine = false;
 	mutex_unlock(&text_mutex);
 }
 
@@ -107,9 +118,9 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 {
 	int out;
 
-	ftrace_arch_code_modify_prepare();
+	mutex_lock(&text_mutex);
 	out = ftrace_make_nop(mod, rec, MCOUNT_ADDR);
-	ftrace_arch_code_modify_post_process();
+	mutex_unlock(&text_mutex);
 
 	return out;
 }
diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 765004b60513..eef1243f6844 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -11,6 +11,7 @@
 #include <asm/kprobes.h>
 #include <asm/cacheflush.h>
 #include <asm/fixmap.h>
+#include <asm/ftrace.h>
 #include <asm/patch.h>
 
 struct patch_insn {
@@ -59,8 +60,15 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
 	 * Before reaching here, it was expected to lock the text_mutex
 	 * already, so we don't need to give another lock here and could
 	 * ensure that it was safe between each cores.
+	 *
+	 * We're currently using stop_machine() for ftrace & kprobes, and while
+	 * that ensures text_mutex is held before installing the mappings it
+	 * does not ensure text_mutex is held by the calling thread.  That's
+	 * safe but triggers a lockdep failure, so just elide it for that
+	 * specific case.
 	 */
-	lockdep_assert_held(&text_mutex);
+	if (!riscv_patch_in_stop_machine)
+		lockdep_assert_held(&text_mutex);
 
 	if (across_pages)
 		patch_map(addr + len, FIX_TEXT_POKE1);
@@ -121,13 +129,25 @@ NOKPROBE_SYMBOL(patch_text_cb);
 
 int patch_text(void *addr, u32 insn)
 {
+	int ret;
 	struct patch_insn patch = {
 		.addr = addr,
 		.insn = insn,
 		.cpu_count = ATOMIC_INIT(0),
 	};
 
-	return stop_machine_cpuslocked(patch_text_cb,
-				       &patch, cpu_online_mask);
+	/*
+	 * kprobes takes text_mutex, before calling patch_text(), but as we call
+	 * calls stop_machine(), the lockdep assertion in patch_insn_write()
+	 * gets confused by the context in which the lock is taken.
+	 * Instead, ensure the lock is held before calling stop_machine(), and
+	 * set riscv_patch_in_stop_machine to skip the check in
+	 * patch_insn_write().
+	 */
+	lockdep_assert_held(&text_mutex);
+	riscv_patch_in_stop_machine = true;
+	ret = stop_machine_cpuslocked(patch_text_cb, &patch, cpu_online_mask);
+	riscv_patch_in_stop_machine = false;
+	return ret;
 }
 NOKPROBE_SYMBOL(patch_text);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
