Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BA8C4450B
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 15:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2ghT+eXzoG8lia6WK2HnuJgphzyRsSOn6MLIvcDLjA=; b=QWY/SWh6yzMuel
	zMODolW3450ZX6oOusAb8avmvx/9k2eAZtA0ub7BIz5c/uAl2Gq0duQC53bdwkJf5wwcO2H1kFSzv
	fHTvkhHDnUUB4u4gfMYIrxcPySfDvAf0pS4Bd2cOXkJ6ro02PVQEkcIXCxi+4nCp4wtSbLXd6EEHR
	U0PBwgTnQ0mZn5n4pkMMFAj3qi1VywsJ4fSLDfPhR8wpUuvZz7puXo97A7RjPlG3SL2LjnoC/UnfG
	igOUIwg+E/YoOgs4mrh2L+maA2V0dw+Iu9/Rh/4r9JgfXvPEBJVUC+hbBqif7mxcvFQdCFg7N0fW7
	vL7LRRr9zWmZw0RjoxnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfMp-0000000CaVA-3t7d;
	Tue, 14 Jul 2026 15:48:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfMn-0000000CaTB-0DJl
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 15:48:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9907114BF;
	Tue, 14 Jul 2026 08:48:09 -0700 (PDT)
Received: from fedora (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A25A3F915;
	Tue, 14 Jul 2026 08:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784044093; bh=9/YWlV5TSXUMBp/ymIq49v2XGDkawLw3WU86wtMXh0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ck+tRRDbAqBVC1L8QCIe83oQY+1ui9WeuVVQ0qk0yr8ZlucPKImLO304IwpSi3Pnc
	 BgfFpp7Irsx3JDlsYz7NnzmHTrX6V+bMg17rTtlp2S02WSfBxEtUTt2uwyusNKBciV
	 WzjuHmCP/QcWQL8OKlbhqfxw6lLD66KvwRe88BH0=
From: Bill Roberts <bill.roberts@arm.com>
To: "H. Peter Anvin" <hpa@zytor.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Bill Roberts <bill.roberts@arm.com>
Subject: [PATCH 2/2] selftests/x86: add generic prctl shadow stack test
Date: Tue, 14 Jul 2026 10:47:40 -0500
Message-ID: <20260714154740.140431-3-bill.roberts@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714154740.140431-1-bill.roberts@arm.com>
References: <20260714154740.140431-1-bill.roberts@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_084817_198975_CEA1345D 
X-CRM114-Status: GOOD (  17.97  )
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

Run the same test suite for arch_prctl, against prctl, to ensure
consisteny and correctness between the interfaces.

Signed-off-by: Bill Roberts <bill.roberts@arm.com>
---
 tools/testing/selftests/x86/Makefile          |  3 +-
 .../testing/selftests/x86/test_shadow_stack.c | 55 +++++++++++++++----
 .../selftests/x86/test_shadow_stack_prctl.c   |  3 +
 3 files changed, 50 insertions(+), 11 deletions(-)
 create mode 100644 tools/testing/selftests/x86/test_shadow_stack_prctl.c

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 434065215d12..6a505b42ff66 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -19,7 +19,8 @@ TARGETS_C_32BIT_ONLY := entry_from_vm86 test_syscall_vdso unwind_vdso \
 			test_FCMOV test_FCOMI test_FISTTP \
 			vdso_restorer
 TARGETS_C_64BIT_ONLY := fsgsbase sysret_rip syscall_numbering \
-			corrupt_xstate_header amx lam test_shadow_stack avx apx
+			corrupt_xstate_header amx lam test_shadow_stack avx apx \
+			test_shadow_stack_prctl
 # Some selftests require 32bit support enabled also on 64bit systems
 TARGETS_C_32BIT_NEEDED := ldt_gdt ptrace_syscall
 
diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
index 3d6ca33edba4..0d14a7f444aa 100644
--- a/tools/testing/selftests/x86/test_shadow_stack.c
+++ b/tools/testing/selftests/x86/test_shadow_stack.c
@@ -92,6 +92,7 @@ static inline unsigned long __attribute__((always_inline)) get_ssp(void)
  * Based on code from nolibc.h. Keep a copy here because this can't pull in all
  * of nolibc.h.
  */
+ #ifndef BUILD_PRCTL
 #define ARCH_PRCTL(arg1, arg2)					\
 ({								\
 	long _ret;						\
@@ -109,6 +110,40 @@ static inline unsigned long __attribute__((always_inline)) get_ssp(void)
 	_ret;							\
 })
 
+#define SHADOW_STACK_DISABLE() ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK)
+#define SHADOW_STACK_ENABLE() ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)
+#define SHADOW_STACK_ENABLE_WRITE() ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_WRSS)
+
+#else
+
+#define PRCTL(option, arg2, arg3, arg4, arg5)             \
+({                                                        \
+	long _ret;                                        \
+	register long _num  asm("rax") = __NR_prctl;      \
+	register long _arg1 asm("rdi") = (long)(option);  \
+	register long _arg2 asm("rsi") = (long)(arg2);    \
+	register long _arg3 asm("rdx") = (long)(arg3);    \
+	register long _arg4 asm("r10") = (long)(arg4);    \
+	register long _arg5 asm("r8")  = (long)(arg5);    \
+							  \
+	asm volatile (                                    \
+		"syscall"                                 \
+		: "=a"(_ret)                              \
+		: "0"(_num),                              \
+		  "r"(_arg1), "r"(_arg2), "r"(_arg3),     \
+		  "r"(_arg4), "r"(_arg5)                  \
+		: "rcx", "r11", "memory", "cc"            \
+	);                                                \
+	_ret;                                             \
+})
+
+#define SHADOW_STACK_DISABLE() PRCTL(PR_SET_SHADOW_STACK_STATUS, 0, 0, 0, 0)
+#define SHADOW_STACK_ENABLE() PRCTL(PR_SET_SHADOW_STACK_STATUS, PR_SHADOW_STACK_ENABLE, 0, 0, 0)
+#define SHADOW_STACK_ENABLE_WRITE() \
+	PRCTL(PR_SET_SHADOW_STACK_STATUS, PR_SHADOW_STACK_ENABLE|PR_SHADOW_STACK_WRITE, 0, 0, 0)
+
+#endif
+
 void *create_shstk(void *addr)
 {
 	return (void *)syscall(__NR_map_shadow_stack, addr, SS_SIZE, SHADOW_STACK_SET_TOKEN);
@@ -691,7 +726,7 @@ void segv_gp_handler(int signum, siginfo_t *si, void *uc)
 	 * To work with old glibc, this can't rely on siglongjmp working with
 	 * shadow stack enabled, so disable shadow stack before siglongjmp().
 	 */
-	ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK);
+	SHADOW_STACK_DISABLE();
 	siglongjmp(jmp_buffer, -1);
 }
 
@@ -854,7 +889,7 @@ static int test_uretprobe(void)
 	if (sigsetjmp(jmp_buffer, 1))
 		goto out;
 
-	ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK);
+	SHADOW_STACK_ENABLE();
 
 	/*
 	 * This either segfaults and goes through sigsetjmp above
@@ -866,7 +901,7 @@ static int test_uretprobe(void)
 	err = 0;
 
 out:
-	ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK);
+	SHADOW_STACK_DISABLE();
 	signal(SIGSEGV, SIG_DFL);
 	if (fd)
 		close(fd);
@@ -933,7 +968,7 @@ static int test_uprobe_call(void)
 	if (sigsetjmp(jmp_buffer, 1))
 		goto out;
 
-	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK))
+	if (SHADOW_STACK_ENABLE())
 		goto out;
 
 	/*
@@ -946,7 +981,7 @@ static int test_uprobe_call(void)
 	err = 0;
 
 out:
-	ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK);
+	SHADOW_STACK_DISABLE();
 	signal(SIGSEGV, SIG_DFL);
 	if (fd >= 0)
 		close(fd);
@@ -1059,22 +1094,22 @@ int main(int argc, char *argv[])
 {
 	int ret = 0;
 
-	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
+	if (SHADOW_STACK_ENABLE()) {
 		printf("[SKIP]\tCould not enable Shadow stack\n");
 		return 1;
 	}
 
-	if (ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK)) {
+	if (SHADOW_STACK_DISABLE()) {
 		ret = 1;
 		printf("[FAIL]\tDisabling shadow stack failed\n");
 	}
 
-	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
+	if (SHADOW_STACK_ENABLE()) {
 		printf("[SKIP]\tCould not re-enable Shadow stack\n");
 		return 1;
 	}
 
-	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_WRSS)) {
+	if (SHADOW_STACK_ENABLE_WRITE()) {
 		printf("[SKIP]\tCould not enable WRSS\n");
 		ret = 1;
 		goto out;
@@ -1164,7 +1199,7 @@ int main(int argc, char *argv[])
 	 * Disable shadow stack before the function returns, or there will be a
 	 * shadow stack violation.
 	 */
-	if (ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK)) {
+	if (SHADOW_STACK_DISABLE()) {
 		ret = 1;
 		printf("[FAIL]\tDisabling shadow stack failed\n");
 	}
diff --git a/tools/testing/selftests/x86/test_shadow_stack_prctl.c b/tools/testing/selftests/x86/test_shadow_stack_prctl.c
new file mode 100644
index 000000000000..9c9e2728a9f9
--- /dev/null
+++ b/tools/testing/selftests/x86/test_shadow_stack_prctl.c
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+#define BUILD_PRCTL 1
+#include "test_shadow_stack.c"
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
