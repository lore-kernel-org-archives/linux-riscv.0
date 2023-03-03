Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A9AC678D4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YdBy8/2C7KkI+XEXLqjMjJQjglSbq9mQbMz9B/IB+wQ=; b=EGT3Ax0PE3fViH
	uB/Ln6cZ8ekrW5rk7CSHya8F+hUjcK/xHYs8EN0WzoMFuHvp/QQoieSYY+fCfDXnWZZKzTDnf1K/T
	7Eqkhrvdvmph9Y61ZKQOVpX4e0IvHb//1Mw2bu+uxjKbp0XVMU0FUj9HrUsq8tib6p1gMCyef1a5S
	RSGFrmAonOANwHi11H3brCB96CimJFTueJ+HXiYGbWYew83eEFIrVdePFJCaz/D9JLvwjV1ZJj3mY
	8vlA969iUL63+1kXBW++mcPC19qZa02BknfqzPctVDxqSXDdb16CrOCzgXXeoHUdoxpAWiM+1Z7WD
	hthjkuA8jLP2oSj4Tf/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY6YT-006cgm-LZ; Fri, 03 Mar 2023 14:38:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY6YP-006cg1-Mr
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 14:38:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677854318; x=1709390318;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wH/owjOxRlyHWE3uvkrIfn8ERk6g+L3JBKCJXgXfY3E=;
  b=WxFAs2oqs6dzTxgcd7l8WcIGM8sV23nnp9sW7xqlwKgFi7u0iNCMqVQQ
   djcJXeiVdxRZOojAVm3/MGD4+M0CB54dAOdWPD704oGjze9ocAdLsPAjU
   4DTKadMmRKcdTI5D26DuJdGK37qb6ie37ZSo5IN7W4BqRnbr/fc1iYBq9
   YL5MbSPtZIp1WHvt2GxVTHxYrVMKO3EWK6ixjSp5NvdJtQfQJVSrjns7G
   XvaEkA4f/91gJ6FMFVUU0HuKIOWj6a+EuZTLRFVYOQfd+N9COX+15le6x
   7eW2J/KcKCrqHFRtbC9Zqrj7NFoAvYAA7eOSupNTcLfwaFSjiWru09ZXc
   A==;
X-IronPort-AV: E=Sophos;i="5.98,230,1673938800"; 
   d="scan'208";a="203485311"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Mar 2023 07:38:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Mar 2023 07:38:33 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 3 Mar 2023 07:38:31 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: Palmer Dabbelt <palmerdabbelt@google.com>,
	<linux-riscv@lists.infradead.org>, <changbin.du@huawei.com>,
	<rostedt@goodmis.org>, Changbin Du <changbin.du@gmail.com>, Palmer Dabbelt
	<palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5] RISC-V: Don't check text_mutex during stop_machine
Date: Fri, 3 Mar 2023 14:37:55 +0000
Message-ID: <20230303143754.4005217-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6558; i=conor.dooley@microchip.com; h=from:subject; bh=2DNonQvs9jwOV2YpnFV2veRbEiyojuchq7Vuzq+CE/o=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClMbPZrfn3Q3XP+2Peztqmv+2R9WYKNN69rN/q/4t1JZb7O tPeGHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhIuj4jw4a7Od03t9QZxV359UA/yf 0XW0WYddP6fRPZ3q09ZNG76hvDXylV276JsyQ0bvDNtj51MaJrxoNP8vHH3yz19PX3N9rWxAIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_063837_841423_D103427C 
X-CRM114-Status: GOOD (  26.32  )
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
Changes since v4 [<20230301223853.1444332-1-conor@kernel.org>]:
* move riscv_patch_in_stop_machine to patch.c & always provide a "real"
  definition for it, to fix build issues w/ ftrace disabled.
* I intentionally omitted Changbin's reviewed-by.

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
 arch/riscv/include/asm/ftrace.h |  2 +-
 arch/riscv/include/asm/patch.h  |  2 ++
 arch/riscv/kernel/ftrace.c      | 13 +++++++++++--
 arch/riscv/kernel/patch.c       | 28 +++++++++++++++++++++++++---
 4 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 9e73922e1e2e5..d47d87c2d7e3d 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -109,6 +109,6 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
 #define ftrace_init_nop ftrace_init_nop
 #endif
 
-#endif
+#endif /* CONFIG_DYNAMIC_FTRACE */
 
 #endif /* _ASM_RISCV_FTRACE_H */
diff --git a/arch/riscv/include/asm/patch.h b/arch/riscv/include/asm/patch.h
index f433121774c01..63c98833d5105 100644
--- a/arch/riscv/include/asm/patch.h
+++ b/arch/riscv/include/asm/patch.h
@@ -9,4 +9,6 @@
 int patch_text_nosync(void *addr, const void *insns, size_t len);
 int patch_text(void *addr, u32 *insns, int ninsns);
 
+extern int riscv_patch_in_stop_machine;
+
 #endif /* _ASM_RISCV_PATCH_H */
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 5bff37af4770b..03a6434a8cdd0 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -15,10 +15,19 @@
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
 
@@ -107,9 +116,9 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
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
index 8086d1a281cd3..575e71d6c8ae2 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -11,6 +11,7 @@
 #include <asm/kprobes.h>
 #include <asm/cacheflush.h>
 #include <asm/fixmap.h>
+#include <asm/ftrace.h>
 #include <asm/patch.h>
 
 struct patch_insn {
@@ -20,6 +21,8 @@ struct patch_insn {
 	atomic_t cpu_count;
 };
 
+int riscv_patch_in_stop_machine = false;
+
 #ifdef CONFIG_MMU
 /*
  * The fix_to_virt(, idx) needs a const value (not a dynamic variable of
@@ -60,8 +63,15 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
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
@@ -125,6 +135,7 @@ NOKPROBE_SYMBOL(patch_text_cb);
 
 int patch_text(void *addr, u32 *insns, int ninsns)
 {
+	int ret;
 	struct patch_insn patch = {
 		.addr = addr,
 		.insns = insns,
@@ -132,7 +143,18 @@ int patch_text(void *addr, u32 *insns, int ninsns)
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
