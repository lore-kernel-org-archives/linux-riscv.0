Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D629BC61D9C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 09:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDlsVJE2aeV/hr3ER1i4WhYtPh14WqiVY+68cdRbAyM=; b=kDRTES/GjN9GlJ
	mBu6JN5xBOHQ6WaPEE3TFqdyVSMUJveXH1YV7TnrupmHTFBtXtKj5iOVi/sJoQYNpY2HFeA2lEkCZ
	sexojkfTsK0JSC1TMsBHRV1xlLmnzLcZBgrdNk/dDN+7j99KHxeWd8LzSj+zzYrz8gk7LE7wtMmIW
	5nSL/w/qQ4tEQYWDjCZXX2l5ylStwCnvBY6fHMjEec6cystoT8wEyvLofNf6hfPLrhWZRNobG8c+p
	Oh2St8jm8WmHcYkJDbA4DbS0NonvHF/bD2S7G3tyvnByXKvlceXTACyKoo2rY16DNjqiaBe9fUNSQ
	tATg1pjpfHwi/g1sBTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jqP-001Kg7-1B;
	Wed, 22 Nov 2023 09:48:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jpZ-001Jlt-1O;
	Wed, 22 Nov 2023 09:47:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E9F10B811A1;
	Wed, 22 Nov 2023 09:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F21C433CA;
	Wed, 22 Nov 2023 09:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700646455;
	bh=IY5iS/oB2kmvzWci1tpDsay+5IRKl4+rZruMuksVAkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LB7SgNo6RWsd/lBKNFyJagX+3r7PWPvlIJ5G3FMo2sllE01HAa9PKVh2iTUQC1Rb0
	 yJO3uvkYJBQLOOKiPyugzUzRJOTqPRpAXQEHDVNvJz+dmwM9loA2xCVU0eBxB3Adhk
	 4eSvxd0/5uB+sqB75puTFV1XqKmTd3U0Gw31hE0HN6Hm27frLA/QcTSwmZEi+tgcDJ
	 CrMhDqL4E66FQF+J95ojydeB9TeDY71OMglxa5YAcKrxIFSz3hAI+zVA8FGHv8xGjH
	 Y5hgS/ewIyrkErkAXzLwEgeiwm9G3lgz4rDYZhyOrYs6lKfIfkWGMCC+hbucH9LeSw
	 3D7zj3rB2jY2Q==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 22 Nov 2023 09:42:45 +0000
Subject: [PATCH v7 35/39] kselftest/arm64: Add test coverage for GCS mode
 locking
MIME-Version: 1.0
Message-Id: <20231122-arm64-gcs-v7-35-201c483bd775@kernel.org>
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
In-Reply-To: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=7316; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IY5iS/oB2kmvzWci1tpDsay+5IRKl4+rZruMuksVAkE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlXc0R4LQ2MwbVplKl/x3FSskzznneCR0XUHsAY
 ynLlIjNK3GJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZV3NEQAKCRAk1otyXVSH
 0E0WB/9tkEX9bs6tnZMZkzAOlUq8oTeqBNNURyadraQK2/RhxR4Sy+dX4QUAjn/b45ZksrLYaWY
 bcOelN06l97omQdTH6MJ4L/6kUTEafS/Ev4AUAQNjnyWSNkqgunuuq9dwz004R3UXCTWQYNkYQX
 HG2Ivmx378wXBBzq9LcKWfObX4bk9rAmTOp+RwzKVQwavq9+YIZ7u7TrjibaNUyb4vYYWoDDpmT
 smMy1dPOM/qExaIIV8j/HbHFNDKkfhLqt8Wsw0PR8c/smnGUz3BHs8VKklqSDgxE0CGIkKN6mKP
 pyaZ1dWc8QfLKzLZZMEUhb5Xt4ZvlwpIIHbYlm1gvInEP27j
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_014737_794872_0184213A 
X-CRM114-Status: GOOD (  21.52  )
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
index 000000000000..f6a73254317e
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
+	if (!(getauxval(AT_HWCAP2) & HWCAP2_GCS))
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
