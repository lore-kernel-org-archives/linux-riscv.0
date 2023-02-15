Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D1FC636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 16:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XE2QqKhNrew/eFKbmifaVpAw7Q0hDKIfo6Iy6sP246I=; b=B/Z0HLUNdC/KK7
	grvS97EuJc0baq9wFINpzdB+1kEPq8BDZgFMPqVQUogkJE7yy5bflWSB6VZxghvIuA5LmKn3oLakM
	Qp8SSiHElxap4gCFEdGVyzb6GaLvCS9K967UPCFdD6G/KDg82wB8NDe4ojbxSOVPvOm8Fu0vS7mHK
	sXAPf3MMPKtsgfp1N0tUmpEM4WKbScdSddKHx1+EFji8gW96r1n//hNlPUqW6tSofRpYThUJ0BM74
	e06aPHg2XlwR7z/DNe6d6bDNHjfbKeJYtXX67+Rl8AvgUWbGRJm068TQIoZeR++pT/vckJCuoe23e
	pUgwYL7c5JzAg+ghS7yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSKse-006YbY-VW; Wed, 15 Feb 2023 16:43:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSKsb-006Yb9-IO
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 16:43:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E2EC961CCD;
	Wed, 15 Feb 2023 16:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9EFC433D2;
	Wed, 15 Feb 2023 16:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676479416;
	bh=syW8+fkj5AmwTUUD9fsYDLCkldI41kN7KhUAj8wbR9M=;
	h=From:To:Cc:Subject:Date:From;
	b=ojLK5wE1YqHWsd59O6pQ6xbqSfiCShXihAP32AYiQsyCfwgsgtS4WisD8VBrGZu7r
	 4kvL7tAD50WR7af3s/ibZbckxFDTkamIpVx9cRc8/3rLIFTKkh+u15fiNquT0tc+N1
	 2y8TJCjP+WcPo+Q6EZN+4PL3J/5MqjR503okRVnxsru0p2H1pBGuk2nCaAxdT/QZxV
	 TX70XG/WKYsdhH16O1uvOhvw7dlwTamh3mow0E3AtroPKe/C624EthYnIvtaWF0T/V
	 1j4OO77GvYEHmPd+NV2L05fP9QRGBsB94D62dJD0asy/tWuhDI0E40Stz+LELGuLYo
	 w+khUGWrAVY5A==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Palmer Dabbelt <palmerdabbelt@google.com>,
	linux-riscv@lists.infradead.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Changbin Du <changbin.du@gmail.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3] RISC-V: Don't check text_mutex during stop_machine
Date: Wed, 15 Feb 2023 16:43:17 +0000
Message-Id: <20230215164317.727657-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4655; i=conor.dooley@microchip.com; h=from:subject; bh=taPCaNzbHmTm73332p14+oa++tInc9T1x0CqxWEaB/Y=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMlvuVurdG+EXZgx//x1eQm2csasLfsuTvjWkNz//iTzBaNe +Ri3jlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEykgJGR4Yp/tsrkai/betscbs19HJ pnHW+e4JpxY85x08jPj6o+TmRkeNvIzRS08ujRfx3NWqa2Fk9udfMW3jO5HbRtDdvbO3dluAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_084337_729290_816B15FA 
X-CRM114-Status: GOOD (  24.45  )
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

We're currently using stop_machine() to update ftrace, which means that
the thread that takes text_mutex during ftrace_prepare() may not be the
same as the thread that eventually patches the code.  This isn't
actually a race because the lock is still held (preventing any other
concurrent accesses) and there is only one thread running during
stop_machine(), but it does trigger a lockdep failure.

This patch just elides the lockdep check during stop_machine.

Fixes: c15ac4fd60d5 ("riscv/ftrace: Add dynamic function tracer support")
Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Reported-by: Changbin Du <changbin.du@gmail.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Resending this version as I am quite averse to deleting the assertion!

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
 arch/riscv/kernel/patch.c       | 10 +++++++++-
 3 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 04dad3380041..3ac7609f4ee9 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -81,8 +81,15 @@ do {									\
 struct dyn_ftrace;
 int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
 #define ftrace_init_nop ftrace_init_nop
+extern int riscv_ftrace_in_stop_machine;
 #endif
 
+#else /* CONFIG_DYNAMIC_FTRACE */
+
+#ifndef __ASSEMBLY__
+#define riscv_ftrace_in_stop_machine 0
 #endif
 
+#endif /* CONFIG_DYNAMIC_FTRACE */
+
 #endif /* _ASM_RISCV_FTRACE_H */
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 2086f6585773..661bfa72f359 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -11,14 +11,25 @@
 #include <asm/cacheflush.h>
 #include <asm/patch.h>
 
+int riscv_ftrace_in_stop_machine;
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
+	riscv_ftrace_in_stop_machine = true;
 }
 
 void ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
 {
+	riscv_ftrace_in_stop_machine = false;
 	mutex_unlock(&text_mutex);
 }
 
@@ -134,9 +145,9 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
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
index 765004b60513..56b70271518d 100644
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
+	 * We're currently using stop_machine() for ftrace, and while that
+	 * ensures text_mutex is held before installing the mappings it does
+	 * not ensure text_mutex is held by the calling thread.  That's safe
+	 * but triggers a lockdep failure, so just elide it for that specific
+	 * case.
 	 */
-	lockdep_assert_held(&text_mutex);
+	if (!riscv_ftrace_in_stop_machine)
+		lockdep_assert_held(&text_mutex);
 
 	if (across_pages)
 		patch_map(addr + len, FIX_TEXT_POKE1);
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
