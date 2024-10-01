Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E800CF318A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 23:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PL25IcjlZYgXKEV9wsgAnNFgFnijwegYLhCUVirmAL8=; b=IjAW9tJekM/4J7
	eIoUKZLAgvMO9fTXTEt9rMibPC3VQ1PL4NlO+gdAH/u2yBLjaPjWASP6SyFBhtUmZqx7OL8axZhC0
	82/qDuW9pXZCUU7YZ/s4i/ofT5pj/b6uDXDAX0+Fd0ToIln0o4mL4UZA2/QRCGPFwxnhpnNYpAp+1
	3fQv5Rnl6xD6mZPsCNW7SUNa6n9Et4is/s2wQFcirz0fu8GVZ8d4qTA18G6LkICLQ39TBsIAkW3bF
	ZQGV6P3VsPFwYqceAUKq5B2TOXDH82n4v30yWcvsTQ/UlPFbS4+OdWpX33eO/7zSNPSvc5dKa3aLx
	xQjTfRw1yx6igz/rSyQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svmZB-00000004Ow5-0Jfj;
	Tue, 01 Oct 2024 23:46:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlx1-00000004Ihn-3dvV;
	Tue, 01 Oct 2024 23:06:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 58603A43329;
	Tue,  1 Oct 2024 23:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 774DAC4CED2;
	Tue,  1 Oct 2024 23:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823998;
	bh=Keu8ANmZTdMHjv5XQqqLSm0bGXVuBnTuWvLw/oRshns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sF0vzapkZ6OWVZ0k/kSzj3dKXchXzPS8npUmWJm1MibYtXim0Q9mxZwMWt97Di6xU
	 yda6vZmOzJlaTRdQT2nxKlx9PcxcmeUxFRTv3juYtpJgOn1vaCcg1jaqPL1PPqxujd
	 7TuUsHctTr/bSf6uZlOYdv0qiVEXBHPousZcV8ZuvmzC10O3rKJQqPnnjo6ANTQbSq
	 oV5u++OT6okSC9IE/37dGxczAWt268dY6guvk/M0eAqQ9wDSMOLN53HqS5ZVAv20Dp
	 v9NkRpNaV2Bs19uxW+xQ4VJoATkfLh9VT9jvZwgQVU5xHwRdyg3XlTKeFsJ5OgwiAF
	 LO80OecjvMfQw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:59:15 +0100
Subject: [PATCH v13 36/40] kselftest/arm64: Add test coverage for GCS mode
 locking
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-36-222b78d87eee@kernel.org>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
In-Reply-To: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Ross Burton <ross.burton@arm.com>, David Spickett <david.spickett@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=7444; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Keu8ANmZTdMHjv5XQqqLSm0bGXVuBnTuWvLw/oRshns=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhrQ/dQ9seMOy9MQMBIJ+ba6S1nVc7f8h0+Ve3ik2vRO8cwRe
 Oe/sZDRmYWDkYpAVU2RZ+yxjVXq4xNb5j+a/ghnEygQyhYGLUwAmIhbG/r9AVzTE7VlHEu8a91ecHA
 f2KbDWB+VsursoMLVvTcYLlk+TfV4sU2EK2eZb+qFWYNlJhx1qW20EVdMUejhU2SyiF8/fPz/D9Zlx
 +34bz/r7F5TTAk3OyMwqbJHjeH805R3XSf4XORIiKYnbc5VVrXsy/x1qnOVUf9fS/9lxyat9/gsfrY
 6pD4r+7X1PQFL+Ma/MgpKjnSszynmzP1TKKoh4yMRsL1r0/XXChhtO8wUWCy9ybnwY1pzsPPe6SYpb
 xO7VO6RmC/5d8TbIu3+awIT5M9YZPinXiZYTm/67mPm6iGDzU3P+DU+rUzPL8459OGb06qyu0y+2Aj
 /NK9WPfTL53i+SePD25PyIo/McAQ==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_160640_113899_85A26B82 
X-CRM114-Status: GOOD (  21.78  )
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

Verify that we can lock individual GCS mode bits, that other modes
aren't affected and as a side effect also that every combination of
modes can be enabled.

Normally the inability to reenable GCS after disabling it would be an
issue with testing but fortunately the kselftest_harness runs each test
within a fork()ed child.  This can be inconvenient for some kinds of
testing but here it means that each test is in a separate thread and
therefore won't be affected by other tests in the suite.

Once we get toolchains with support for enabling GCS by default we will
need to take care to not do that in the build system but there are no
such toolchains yet so it is not yet an issue.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Tested-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/gcs/.gitignore    |   1 +
 tools/testing/selftests/arm64/gcs/Makefile      |   2 +-
 tools/testing/selftests/arm64/gcs/gcs-locking.c | 200 ++++++++++++++++++++++++
 3 files changed, 202 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/gcs/.gitignore b/tools/testing/selftests/arm64/gcs/.gitignore
index 5810c4a163d4..0c86f53f68ad 100644
--- a/tools/testing/selftests/arm64/gcs/.gitignore
+++ b/tools/testing/selftests/arm64/gcs/.gitignore
@@ -1,2 +1,3 @@
 basic-gcs
 libc-gcs
+gcs-locking
diff --git a/tools/testing/selftests/arm64/gcs/Makefile b/tools/testing/selftests/arm64/gcs/Makefile
index a8fdf21e9a47..2173d6275956 100644
--- a/tools/testing/selftests/arm64/gcs/Makefile
+++ b/tools/testing/selftests/arm64/gcs/Makefile
@@ -6,7 +6,7 @@
 # nolibc.
 #
 
-TEST_GEN_PROGS := basic-gcs libc-gcs
+TEST_GEN_PROGS := basic-gcs libc-gcs gcs-locking
 
 LDLIBS+=-lpthread
 
diff --git a/tools/testing/selftests/arm64/gcs/gcs-locking.c b/tools/testing/selftests/arm64/gcs/gcs-locking.c
new file mode 100644
index 000000000000..989f75a491b7
--- /dev/null
+++ b/tools/testing/selftests/arm64/gcs/gcs-locking.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 ARM Limited.
+ *
+ * Tests for GCS mode locking.  These tests rely on both having GCS
+ * unconfigured on entry and on the kselftest harness running each
+ * test in a fork()ed process which will have it's own mode.
+ */
+
+#include <limits.h>
+
+#include <sys/auxv.h>
+#include <sys/prctl.h>
+
+#include <asm/hwcap.h>
+
+#include "kselftest_harness.h"
+
+#include "gcs-util.h"
+
+#define my_syscall2(num, arg1, arg2)                                          \
+({                                                                            \
+	register long _num  __asm__ ("x8") = (num);                           \
+	register long _arg1 __asm__ ("x0") = (long)(arg1);                    \
+	register long _arg2 __asm__ ("x1") = (long)(arg2);                    \
+	register long _arg3 __asm__ ("x2") = 0;                               \
+	register long _arg4 __asm__ ("x3") = 0;                               \
+	register long _arg5 __asm__ ("x4") = 0;                               \
+	                                                                      \
+	__asm__  volatile (                                                   \
+		"svc #0\n"                                                    \
+		: "=r"(_arg1)                                                 \
+		: "r"(_arg1), "r"(_arg2),                                     \
+		  "r"(_arg3), "r"(_arg4),                                     \
+		  "r"(_arg5), "r"(_num)					      \
+		: "memory", "cc"                                              \
+	);                                                                    \
+	_arg1;                                                                \
+})
+
+/* No mode bits are rejected for locking */
+TEST(lock_all_modes)
+{
+	int ret;
+
+	ret = prctl(PR_LOCK_SHADOW_STACK_STATUS, ULONG_MAX, 0, 0, 0);
+	ASSERT_EQ(ret, 0);
+}
+
+FIXTURE(valid_modes)
+{
+};
+
+FIXTURE_VARIANT(valid_modes)
+{
+	unsigned long mode;
+};
+
+FIXTURE_VARIANT_ADD(valid_modes, enable)
+{
+	.mode = PR_SHADOW_STACK_ENABLE,
+};
+
+FIXTURE_VARIANT_ADD(valid_modes, enable_write)
+{
+	.mode = PR_SHADOW_STACK_ENABLE | PR_SHADOW_STACK_WRITE,
+};
+
+FIXTURE_VARIANT_ADD(valid_modes, enable_push)
+{
+	.mode = PR_SHADOW_STACK_ENABLE | PR_SHADOW_STACK_PUSH,
+};
+
+FIXTURE_VARIANT_ADD(valid_modes, enable_write_push)
+{
+	.mode = PR_SHADOW_STACK_ENABLE | PR_SHADOW_STACK_WRITE |
+		PR_SHADOW_STACK_PUSH,
+};
+
+FIXTURE_SETUP(valid_modes)
+{
+}
+
+FIXTURE_TEARDOWN(valid_modes)
+{
+}
+
+/* We can set the mode at all */
+TEST_F(valid_modes, set)
+{
+	int ret;
+
+	ret = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
+			  variant->mode);
+	ASSERT_EQ(ret, 0);
+
+	_exit(0);
+}
+
+/* Enabling, locking then disabling is rejected */
+TEST_F(valid_modes, enable_lock_disable)
+{
+	unsigned long mode;
+	int ret;
+
+	ret = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
+			  variant->mode);
+	ASSERT_EQ(ret, 0);
+
+	ret = prctl(PR_GET_SHADOW_STACK_STATUS, &mode, 0, 0, 0);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(mode, variant->mode);
+
+	ret = prctl(PR_LOCK_SHADOW_STACK_STATUS, variant->mode, 0, 0, 0);
+	ASSERT_EQ(ret, 0);
+
+	ret = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS, 0);
+	ASSERT_EQ(ret, -EBUSY);
+
+	_exit(0);
+}
+
+/* Locking then enabling is rejected */
+TEST_F(valid_modes, lock_enable)
+{
+	unsigned long mode;
+	int ret;
+
+	ret = prctl(PR_LOCK_SHADOW_STACK_STATUS, variant->mode, 0, 0, 0);
+	ASSERT_EQ(ret, 0);
+
+	ret = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
+			  variant->mode);
+	ASSERT_EQ(ret, -EBUSY);
+
+	ret = prctl(PR_GET_SHADOW_STACK_STATUS, &mode, 0, 0, 0);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(mode, 0);
+
+	_exit(0);
+}
+
+/* Locking then changing other modes is fine */
+TEST_F(valid_modes, lock_enable_disable_others)
+{
+	unsigned long mode;
+	int ret;
+
+	ret = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
+			  variant->mode);
+	ASSERT_EQ(ret, 0);
+
+	ret = prctl(PR_GET_SHADOW_STACK_STATUS, &mode, 0, 0, 0);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(mode, variant->mode);
+
+	ret = prctl(PR_LOCK_SHADOW_STACK_STATUS, variant->mode, 0, 0, 0);
+	ASSERT_EQ(ret, 0);
+
+	ret = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
+			  PR_SHADOW_STACK_ALL_MODES);
+	ASSERT_EQ(ret, 0);
+
+	ret = prctl(PR_GET_SHADOW_STACK_STATUS, &mode, 0, 0, 0);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(mode, PR_SHADOW_STACK_ALL_MODES);
+
+
+	ret = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
+			  variant->mode);
+	ASSERT_EQ(ret, 0);
+
+	ret = prctl(PR_GET_SHADOW_STACK_STATUS, &mode, 0, 0, 0);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(mode, variant->mode);
+
+	_exit(0);
+}
+
+int main(int argc, char **argv)
+{
+	unsigned long mode;
+	int ret;
+
+	if (!(getauxval(AT_HWCAP) & HWCAP_GCS))
+		ksft_exit_skip("SKIP GCS not supported\n");
+
+	ret = prctl(PR_GET_SHADOW_STACK_STATUS, &mode, 0, 0, 0);
+	if (ret) {
+		ksft_print_msg("Failed to read GCS state: %d\n", ret);
+		return EXIT_FAILURE;
+	}
+
+	if (mode & PR_SHADOW_STACK_ENABLE) {
+		ksft_print_msg("GCS was enabled, test unsupported\n");
+		return KSFT_SKIP;
+	}
+
+	return test_harness_run(argc, argv);
+}

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
