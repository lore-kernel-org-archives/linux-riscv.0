Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7739DC7114C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 23:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2bjVtqCVpLhwd0327kf8cP1qNInijjIDb8udJEidB5E=; b=vcX0th7o8/zkI8
	INsSecVt0HLnOQHnVZi1DbGfozi/ulwufIKvjj0Bt1XLWiRCpHAY2NAgep2KW2KqZjB8OreT4uNEX
	Vmf12TdM+KJln+jQJyiQQXhBK1mFmxTPIm9joS1h9rJC4ukdcHDXJIiDjdrAOe1FunO0yn/wssgGU
	ef7gh0tAApN/IT+HMHjA6OCQTcqs12f8c8YVIjgZqJ2pIyvX+T88LBcUMzVkg3FK0bmyBklU4Uy9l
	hI6fDpUZbqm7LqwNeYXZAT6vSER2G8Tir9imWmffsZqIns3D8aZJtsZ6Sx0XlayxoZ53EWkJuwMHy
	YE2d7SCGAd4BNh0K85sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjSY0-0000000HWEO-2jFG;
	Wed, 28 Aug 2024 23:57:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS9i-0000000HNkp-0YAx;
	Wed, 28 Aug 2024 23:32:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5CCBEA43770;
	Wed, 28 Aug 2024 23:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB1AC4CECA;
	Wed, 28 Aug 2024 23:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724887969;
	bh=/b4fLgBxrOG/LTGvqBDUXcUFQWiOWxSYArOHQoaOV+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B8sQUJUdJrIq3kDN7sUh3HHu0mhJ4Jd+UrRgHYpWc27Eed9Nh0hMsK9hSUY7W2vHy
	 1r/+Y1gJyV64pvptv1GSFq3NRHVO40J5KTaGFi6BODVolyQ3xt/bFoDyo3bBS2iEP5
	 zqldseG7AMiZSM0nqm5M73VBv91Zy5W9kAOphbTsAK85NmjicWVlNNdyqZiyGbpuSq
	 RMMmnBBi6nbbWOxJ3Q7iumoHiKOxoQlk1CNAXtlDYT834bgE3i4Bos6WTLhIg5knkb
	 kmbTkM36wW3DPbGuE1vb/rtaqTYYAuqTpcKDxDc7Y0knAul81SjC4O+ML7w7UeDhka
	 EYW6WtESbPUKQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2024 00:27:51 +0100
Subject: [PATCH v12 35/39] kselftest/arm64: Add test coverage for GCS mode
 locking
MIME-Version: 1.0
Message-Id: <20240829-arm64-gcs-v12-35-42fec947436a@kernel.org>
References: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
In-Reply-To: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=7382; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/b4fLgBxrOG/LTGvqBDUXcUFQWiOWxSYArOHQoaOV+E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmz7KTTBzejW12XGn0R8A/TgK+9iUS5Ghlf3XF2oy1
 1adAtFeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZs+ykwAKCRAk1otyXVSH0JJsB/
 0eM7WVMsUO+EFuPZkhQZskgNdND4fyOirkCOfMx+RFthoSK5U58rOgDeQQOWc+Zf6zTSltu90zvySL
 t+c3PWaUjfuFq/K8K4iH0y+nLkkPWEykIuJI4Dq0zq0fV9IPwOrnm5b4bvsIk7/torxDwqE2rowOKz
 FSv1uHI8g127V3cNTZuORqXY+4IOZiKJwnqHhkN8K76Pogl9D1En4SfJwZlgPNOjHWasevIr0xVQBj
 H+KeqtPacUHlBUREYmsaOb5n6MN8UGUDRavtrSETeuaPjhvi7EjUD4fqg3zErL8hdsfj/OkF/rMDaH
 7FUyA5Y9hSsggEtuli7QAylvK1ug2G
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_163250_441156_7E4B286F 
X-CRM114-Status: GOOD (  21.85  )
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
