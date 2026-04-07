Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E84FB5191
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 05:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eaDqxxINhhTGmIR6kYSWLUwdQ8WvVziMFv7ZcyI45ok=; b=r0xQwnJzbKHQe7
	tCOmM39+2YE3GTsB3K4Pet5wtVs8YCgYTxLqB8R4hpvV8xreG9W9ivu8mP+vyEaoA5ld4qUk/nFLj
	FrKy4VuveOBL5Kd6eF/ZYiQ309z4efKq7Dq32ECJUBszxGf5yU78sjouGdDsXAEJMMo2EUDXqu4J7
	W3yCIr05qtTtj9+9hVRGTGQctt2hWM03ZN61iEedvEFaKBbiF5r0ZbmiNiPJYY9GPbu67q1xWoWoC
	ONr/pJoLSxOAMtcqPVIOubkbQkIcSD3XSgcKWQihASFx9K9JOwnqXmuJve6SOaqHYO/Zuenkc5KlB
	vb3LcQNIrScMMeSgKf4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9z0X-00000005vT4-1ux1;
	Tue, 07 Apr 2026 05:29:49 +0000
Received: from forward100b.mail.yandex.net ([178.154.239.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9z0S-00000005vRZ-2Ra3
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 05:29:48 +0000
Received: from mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:942:0:640:e3c0:0])
	by forward100b.mail.yandex.net (Yandex) with ESMTPS id 384A780429;
	Tue, 07 Apr 2026 08:29:37 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id WT6S93BRI8c0-BbuJXBJI;
	Tue, 07 Apr 2026 08:29:36 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1775539776; bh=ztj7RPAjIsvaluxMDGBxER5JDwXGgaxHAcPdeOVmwP8=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=vZMeb86dzR8DxiB2uyCAMMu3LwGNXf7zj/LuC/LcJG6kIU6A+gbYUuLR/CL2SVoRm
	 YILgUYU+m9fwpGiPXNSYy0WhAsaPe6mG0SCo5GHiivvi/fXawcdTa/y1he3Ok2w2zN
	 oiIlul08N/6VKZ+CiNga6vMBkSeIlqOaip9XZ58Q=
Authentication-Results: mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 2/2] lib: kunit: add tests for __ashldi3(), __ashrdi3(), and __lshrdi3()
Date: Tue,  7 Apr 2026 08:28:24 +0300
Message-ID: <20260407052824.1260071-3-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407052824.1260071-1-dmantipov@yandex.ru>
References: <20260407052824.1260071-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_222945_048342_1C5F7107 
X-CRM114-Status: GOOD (  15.55  )
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

Add KUnit tests for '__ashldi3()', '__ashrdi3()', and '__lshrdi3()'
helper functions used to implement 64-bit arithmetic shift left,
arithmetic shift right and logical shift right, respectively,
on a 32-bit CPUs.

Tested with 'qemu-system-riscv32 -M virt' and 'qemu-system-arm -M virt'.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 lib/Kconfig.debug       |  10 +++
 lib/tests/Makefile      |   1 +
 lib/tests/shdi3_kunit.c | 174 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 185 insertions(+)
 create mode 100644 lib/tests/shdi3_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 93f356d2b3d9..b68b1325379b 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2942,6 +2942,16 @@ config BITS_TEST
 
 	  If unsure, say N.
 
+config SHDI3_KUNIT_TEST
+	tristate "KUnit test for __ashldi3(), __ashrdi3(), and __lshrdi3()"
+	depends on KUNIT
+	depends on (32BIT || ARM)
+	help
+	  This builds the unit test for __ashldi3(), __ashrdi3(), and
+	  __lshrdi3() helper functions used to implement 64-bit arithmetic
+	  shift left, arithmetic shift right and logical shift right,
+	  respectively, on a 32-bit CPUs.
+
 config SLUB_KUNIT_TEST
 	tristate "KUnit test for SLUB cache error detection" if !KUNIT_ALL_TESTS
 	depends on SLUB_DEBUG && KUNIT
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index 05f74edbc62b..db678ccdd8b1 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_BASE64_KUNIT) += base64_kunit.o
 obj-$(CONFIG_BITOPS_KUNIT) += bitops_kunit.o
 obj-$(CONFIG_BITFIELD_KUNIT) += bitfield_kunit.o
 obj-$(CONFIG_BITS_TEST) += test_bits.o
+obj-$(CONFIG_SHDI3_KUNIT_TEST) += shdi3_kunit.o
 obj-$(CONFIG_BLACKHOLE_DEV_KUNIT_TEST) += blackhole_dev_kunit.o
 obj-$(CONFIG_CHECKSUM_KUNIT) += checksum_kunit.o
 obj-$(CONFIG_CMDLINE_KUNIT_TEST) += cmdline_kunit.o
diff --git a/lib/tests/shdi3_kunit.c b/lib/tests/shdi3_kunit.c
new file mode 100644
index 000000000000..6fa411554d6c
--- /dev/null
+++ b/lib/tests/shdi3_kunit.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR Apache-2.0
+/*
+ * Test cases for __ashldi3(), __ashrdi3(), and __lshrdi3().
+ */
+
+#include <linux/kernel.h>
+#include <linux/libgcc.h>
+#include <kunit/test.h>
+
+struct shdi3_test_entry {
+	long long input;
+	int shift;
+	long long result;
+};
+
+static const struct shdi3_test_entry ashldi3_testdata[] = {
+	/* https://github.com/llvm/llvm-project/compiler-rt/test/builtins/Unit/ashldi3_test.c */
+	{ 0x0123456789ABCDEFLL, 0, 0x123456789ABCDEFLL },
+	{ 0x0123456789ABCDEFLL, 1, 0x2468ACF13579BDELL },
+	{ 0x0123456789ABCDEFLL, 2, 0x48D159E26AF37BCLL },
+	{ 0x0123456789ABCDEFLL, 3, 0x91A2B3C4D5E6F78LL },
+	{ 0x0123456789ABCDEFLL, 4, 0x123456789ABCDEF0LL },
+	{ 0x0123456789ABCDEFLL, 28, 0x789ABCDEF0000000LL },
+	{ 0x0123456789ABCDEFLL, 29, 0xF13579BDE0000000LL },
+	{ 0x0123456789ABCDEFLL, 30, 0xE26AF37BC0000000LL },
+	{ 0x0123456789ABCDEFLL, 31, 0xC4D5E6F780000000LL },
+	{ 0x0123456789ABCDEFLL, 32, 0x89ABCDEF00000000LL },
+	{ 0x0123456789ABCDEFLL, 33, 0x13579BDE00000000LL },
+	{ 0x0123456789ABCDEFLL, 34, 0x26AF37BC00000000LL },
+	{ 0x0123456789ABCDEFLL, 35, 0x4D5E6F7800000000LL },
+	{ 0x0123456789ABCDEFLL, 36, 0x9ABCDEF000000000LL },
+	{ 0x0123456789ABCDEFLL, 60, 0xF000000000000000LL },
+	{ 0x0123456789ABCDEFLL, 61, 0xE000000000000000LL },
+	{ 0x0123456789ABCDEFLL, 62, 0xC000000000000000LL },
+	{ 0x0123456789ABCDEFLL, 63, 0x8000000000000000LL },
+};
+
+static void shdi3_test_ashldi3(struct kunit *test)
+{
+	const struct shdi3_test_entry *e;
+	long long ret;
+
+	for (e = ashldi3_testdata;
+	     e < ashldi3_testdata + ARRAY_SIZE(ashldi3_testdata); e++) {
+		ret = __ashldi3(e->input, e->shift);
+		KUNIT_EXPECT_EQ_MSG(test, ret, e->result,
+				    "    when evaluating __ashldi3(%lld, %d)",
+				    e->input, e->shift);
+	}
+}
+
+static const struct shdi3_test_entry ashrdi3_testdata[] = {
+	/* https://github.com/llvm/llvm-project/compiler-rt/test/builtins/Unit/ashrdi3_test.c */
+	{ 0x0123456789ABCDEFLL, 0, 0x123456789ABCDEFLL },
+	{ 0x0123456789ABCDEFLL, 1, 0x91A2B3C4D5E6F7LL },
+	{ 0x0123456789ABCDEFLL, 2, 0x48D159E26AF37BLL },
+	{ 0x0123456789ABCDEFLL, 3, 0x2468ACF13579BDLL },
+	{ 0x0123456789ABCDEFLL, 4, 0x123456789ABCDELL },
+	{ 0x0123456789ABCDEFLL, 28, 0x12345678LL },
+	{ 0x0123456789ABCDEFLL, 29, 0x91A2B3CLL },
+	{ 0x0123456789ABCDEFLL, 30, 0x48D159ELL },
+	{ 0x0123456789ABCDEFLL, 31, 0x2468ACFLL },
+	{ 0x0123456789ABCDEFLL, 32, 0x1234567LL },
+	{ 0x0123456789ABCDEFLL, 33, 0x91A2B3LL },
+	{ 0x0123456789ABCDEFLL, 34, 0x48D159LL },
+	{ 0x0123456789ABCDEFLL, 35, 0x2468ACLL },
+	{ 0x0123456789ABCDEFLL, 36, 0x123456LL },
+	{ 0x0123456789ABCDEFLL, 60, 0 },
+	{ 0x0123456789ABCDEFLL, 61, 0 },
+	{ 0x0123456789ABCDEFLL, 62, 0 },
+	{ 0x0123456789ABCDEFLL, 63, 0 },
+	{ 0xFEDCBA9876543210LL, 0, 0xFEDCBA9876543210LL },
+	{ 0xFEDCBA9876543210LL, 1, 0xFF6E5D4C3B2A1908LL },
+	{ 0xFEDCBA9876543210LL, 2, 0xFFB72EA61D950C84LL },
+	{ 0xFEDCBA9876543210LL, 3, 0xFFDB97530ECA8642LL },
+	{ 0xFEDCBA9876543210LL, 4, 0xFFEDCBA987654321LL },
+	{ 0xFEDCBA9876543210LL, 28, 0xFFFFFFFFEDCBA987LL },
+	{ 0xFEDCBA9876543210LL, 29, 0xFFFFFFFFF6E5D4C3LL },
+	{ 0xFEDCBA9876543210LL, 30, 0xFFFFFFFFFB72EA61LL },
+	{ 0xFEDCBA9876543210LL, 31, 0xFFFFFFFFFDB97530LL },
+	{ 0xFEDCBA9876543210LL, 32, 0xFFFFFFFFFEDCBA98LL },
+	{ 0xFEDCBA9876543210LL, 33, 0xFFFFFFFFFF6E5D4CLL },
+	{ 0xFEDCBA9876543210LL, 34, 0xFFFFFFFFFFB72EA6LL },
+	{ 0xFEDCBA9876543210LL, 35, 0xFFFFFFFFFFDB9753LL },
+	{ 0xFEDCBA9876543210LL, 36, 0xFFFFFFFFFFEDCBA9LL },
+	{ 0xAEDCBA9876543210LL, 60, 0xFFFFFFFFFFFFFFFALL },
+	{ 0xAEDCBA9876543210LL, 61, 0xFFFFFFFFFFFFFFFDLL },
+	{ 0xAEDCBA9876543210LL, 62, 0xFFFFFFFFFFFFFFFELL },
+	{ 0xAEDCBA9876543210LL, 63, 0xFFFFFFFFFFFFFFFFLL },
+};
+
+static void shdi3_test_ashrdi3(struct kunit *test)
+{
+	const struct shdi3_test_entry *e;
+	long long ret;
+
+	for (e = ashrdi3_testdata;
+	     e < ashrdi3_testdata + ARRAY_SIZE(ashrdi3_testdata); e++) {
+		ret = __ashrdi3(e->input, e->shift);
+		KUNIT_EXPECT_EQ_MSG(test, ret, e->result,
+				    "    when evaluating __ashrdi3(%lld, %d)",
+				    e->input, e->shift);
+	}
+}
+
+static const struct shdi3_test_entry lshrdi3_testdata[] = {
+	/* https://github.com/llvm/llvm-project/compiler-rt/test/builtins/Unit/lshrdi3_test.c */
+	{ 0x0123456789ABCDEFLL, 0, 0x123456789ABCDEFLL },
+	{ 0x0123456789ABCDEFLL, 1, 0x91A2B3C4D5E6F7LL },
+	{ 0x0123456789ABCDEFLL, 2, 0x48D159E26AF37BLL },
+	{ 0x0123456789ABCDEFLL, 3, 0x2468ACF13579BDLL },
+	{ 0x0123456789ABCDEFLL, 4, 0x123456789ABCDELL },
+	{ 0x0123456789ABCDEFLL, 28, 0x12345678LL },
+	{ 0x0123456789ABCDEFLL, 29, 0x91A2B3CLL },
+	{ 0x0123456789ABCDEFLL, 30, 0x48D159ELL },
+	{ 0x0123456789ABCDEFLL, 31, 0x2468ACFLL },
+	{ 0x0123456789ABCDEFLL, 32, 0x1234567LL },
+	{ 0x0123456789ABCDEFLL, 33, 0x91A2B3LL },
+	{ 0x0123456789ABCDEFLL, 34, 0x48D159LL },
+	{ 0x0123456789ABCDEFLL, 35, 0x2468ACLL },
+	{ 0x0123456789ABCDEFLL, 36, 0x123456LL },
+	{ 0x0123456789ABCDEFLL, 60, 0 },
+	{ 0x0123456789ABCDEFLL, 61, 0 },
+	{ 0x0123456789ABCDEFLL, 62, 0 },
+	{ 0x0123456789ABCDEFLL, 63, 0 },
+	{ 0xFEDCBA9876543210LL, 0, 0xFEDCBA9876543210LL },
+	{ 0xFEDCBA9876543210LL, 1, 0x7F6E5D4C3B2A1908LL },
+	{ 0xFEDCBA9876543210LL, 2, 0x3FB72EA61D950C84LL },
+	{ 0xFEDCBA9876543210LL, 3, 0x1FDB97530ECA8642LL },
+	{ 0xFEDCBA9876543210LL, 4, 0xFEDCBA987654321LL },
+	{ 0xFEDCBA9876543210LL, 28, 0xFEDCBA987LL },
+	{ 0xFEDCBA9876543210LL, 29, 0x7F6E5D4C3LL },
+	{ 0xFEDCBA9876543210LL, 30, 0x3FB72EA61LL },
+	{ 0xFEDCBA9876543210LL, 31, 0x1FDB97530LL },
+	{ 0xFEDCBA9876543210LL, 32, 0xFEDCBA98LL },
+	{ 0xFEDCBA9876543210LL, 33, 0x7F6E5D4CLL },
+	{ 0xFEDCBA9876543210LL, 34, 0x3FB72EA6LL },
+	{ 0xFEDCBA9876543210LL, 35, 0x1FDB9753LL },
+	{ 0xFEDCBA9876543210LL, 36, 0xFEDCBA9LL },
+	{ 0xAEDCBA9876543210LL, 60, 0xALL },
+	{ 0xAEDCBA9876543210LL, 61, 0x5LL },
+	{ 0xAEDCBA9876543210LL, 62, 0x2LL },
+	{ 0xAEDCBA9876543210LL, 63, 0x1LL },
+};
+
+static void shdi3_test_lshrdi3(struct kunit *test)
+{
+	const struct shdi3_test_entry *e;
+	long long ret;
+
+	for (e = lshrdi3_testdata;
+	     e < lshrdi3_testdata + ARRAY_SIZE(lshrdi3_testdata); e++) {
+		ret = __lshrdi3(e->input, e->shift);
+		KUNIT_EXPECT_EQ_MSG(test, ret, e->result,
+				    "    when evaluating __lshrdi3(%lld, %d)",
+				    e->input, e->shift);
+	}
+}
+
+static struct kunit_case shdi3_test_cases[] = {
+	KUNIT_CASE(shdi3_test_ashldi3),
+	KUNIT_CASE(shdi3_test_ashrdi3),
+	KUNIT_CASE(shdi3_test_lshrdi3),
+	{}
+};
+
+static struct kunit_suite shdi3_test_suite = {
+	.name = "shdi3",
+	.test_cases = shdi3_test_cases,
+};
+kunit_test_suite(shdi3_test_suite);
+
+MODULE_DESCRIPTION("Test cases for __ashldi3(), __ashrdi3(), and __lshrdi3()");
+MODULE_LICENSE("GPL");
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
