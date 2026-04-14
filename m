Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF86ED7B9D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 10:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b3lfFxjj1QudHKX7NXJQAUKz3ND7mHK8/O87Qwvdji4=; b=hHPF870DiRaBgW
	EImXHv/yF9hv62X/6QBXQ28G+7j8j3uYsTxhtj749i34SH6YHNMpSRwooWePPD/bG2AzY62m8zAHL
	nKmv91+y8d0vltbNqdaQsLzNsF34F2bbHEgEh7J+koOAGKoT1kMTxBCAivVul9jXWXaRigivpfEo0
	fKR1oTNrA4n9QPsU6FVOsrdUGxuWzX5CtDah6JZUEYHjHWtZLpl29IANylplHq3nXOTCf2XVwWnkO
	TuT7OKk1T1Wagl/DHaPwRB9+tj7Qaw3yzeWp/MTEMmkXTHmLs+gM2Ly2ThmdKb9YpxDXoAmDATHgM
	qNtr9opR3tIWrFv/AOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCayV-0000000H8Xq-25mV;
	Tue, 14 Apr 2026 10:26:31 +0000
Received: from forward100b.mail.yandex.net ([178.154.239.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCayP-0000000H8V8-1OHu
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 10:26:29 +0000
Received: from mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:3d95:0:640:5c83:0])
	by forward100b.mail.yandex.net (Yandex) with ESMTPS id 6FBD180DA4;
	Tue, 14 Apr 2026 13:26:18 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id BQI23sTa1uQ0-lOAyVlnC;
	Tue, 14 Apr 2026 13:26:17 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1776162377; bh=av6jz9zhalCOhE7HtLx1Hb5xr5qs8mj/7328dNgO+I4=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=uSsQ73B1jZZ81H3q+PWl952UBwAmSfmSyqEvJAFFw1SUh0HuzjkgcDHBWZvw0iCrc
	 pykEI4KbkhUaP97mAXqwJ/tzs6xkPLI/Q4uKZ1uqXNpik7ckfIqDqjAaG9tZ7sqvrv
	 0EjZcSajwed0BzalafrVoHlB7TsS6Le0D1QN5R0w=
Authentication-Results: mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v4 2/3] lib: kunit: add tests for __ashldi3(), __ashrdi3(), and __lshrdi3()
Date: Tue, 14 Apr 2026 13:26:07 +0300
Message-ID: <20260414102608.573555-3-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414102608.573555-1-dmantipov@yandex.ru>
References: <20260414102608.573555-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_032625_592840_73D9CD83 
X-CRM114-Status: GOOD (  16.14  )
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

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v4: bump version to match the series
v3: more tests by Charlie Jenkins
v2: include test-specific headers rather than generic linux/kernel.h
---
 lib/Kconfig.debug       |  10 +++
 lib/tests/Makefile      |   1 +
 lib/tests/shdi3_kunit.c | 175 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 186 insertions(+)
 create mode 100644 lib/tests/shdi3_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 94eb2667b7e13..635c5f1c3d4ea 100644
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
index 05f74edbc62bf..db678ccdd8b15 100644
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
index 0000000000000..44f65e66512b5
--- /dev/null
+++ b/lib/tests/shdi3_kunit.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR Apache-2.0
+/*
+ * Test cases for __ashldi3(), __ashrdi3(), and __lshrdi3().
+ */
+
+#include <linux/array_size.h>
+#include <linux/module.h>
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
