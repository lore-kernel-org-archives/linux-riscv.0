Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4981D60A262E
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 01:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WLFFgum3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=FO2QElYr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dsN55TJVYeQwHt6jVpzMX6c//Z7/im5RToISy6BrW8k=; b=WLFFgum3zTtOljr7DcKnZSrKAM
	b8WVgvpEU5ZcUPEXrRljtzPZpZFXB51JN++/408B7k8AAD9wtIn2fOGkyjWVAHYjsL9wFbeGHwQRo
	+5EdhN1xAAIl7cBJCHH75DVPp4iADA95RANEQ0pJrLLJXXvgE2P301MnNFTOVC3tVuthbrdhs7+IE
	em3215jXESYoKQUUhaDBNy1X0yTkt3Dtzrv0uuShv7l+ixWPS+EvTkycAp0XAM5SIq8LvZ0+HXgi0
	NmaBy78AN8UjR26KYSzLZ5yQweE7Lp1/Fb3UbUfORaM0nZK/dRto8sIlAdswrQoe0hmW7LE9+4UVj
	rtzOve3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaoL-000000026EM-0RUz;
	Tue, 10 Nov 2026 01:38:09 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaoH-000000026Cd-2iYo
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 01:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794274681; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=2lXFw1f0Ppp5uzaKVcq1AeJt0CkAy+22ycxxqcd1H3E=;
	b=FO2QElYrYgNRjjEXqayh8+ifDrd2hMxAWkNovN7wuPyaPKeEvja4wVVtWomms7wopPxyrL9Iz5NTg6dsHPQn59m46eLI0Ju1TLCIzmb6hMLNN8OkWGizBz/pdfqU8sCZygxNdf/meAK1VBVFmrvwk6wetARAXFgfq4uwPFiK5Ls=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=36;SR=0;TI=SMTPD_---0XETOX2B_1794274677;
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XETOX2B_1794274677 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 10 Nov 2026 09:37:59 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	oleg@redhat.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	shuah@kernel.org,
	mpdesouza@suse.com,
	martin@kaiser.cx,
	kmehltretter@gmail.com,
	oliver.yang@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	xueshuai@linux.alibaba.com,
	jkchen@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v7 02/10] riscv: Add KUnit test for stack trace start frames
Date: Tue, 10 Nov 2026 09:37:42 +0800
Message-Id: <20261110013750.36800-3-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261110013750.36800-1-xueshuai@linux.alibaba.com>
References: <20260914092648.51254-1-xueshuai@linux.alibaba.com>
 <20261110013750.36800-1-xueshuai@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_173805_929916_57F22B01 
X-CRM114-Status: GOOD (  15.85  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Karl Mehltretter <kmehltretter@gmail.com>

stack_trace_save() and return_address() depend on the first frame reported
by arch_stack_walk(), but no test checks their frame numbering.

Add a test that calls both through a chain of three noinline functions
and compares the symbol of the result with the function expected for
each skip count or level.

Require FRAME_POINTER because the stack-scanning walker cannot provide an
exact start frame.

Link: https://lore.kernel.org/r/20261010132712.46931-2-kmehltretter@gmail.com
Tested-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
 arch/riscv/kernel/tests/Kconfig.debug     |  12 ++
 arch/riscv/kernel/tests/Makefile          |   1 +
 arch/riscv/kernel/tests/stacktrace_test.c | 142 ++++++++++++++++++++++
 3 files changed, 155 insertions(+)
 create mode 100644 arch/riscv/kernel/tests/stacktrace_test.c

diff --git a/arch/riscv/kernel/tests/Kconfig.debug b/arch/riscv/kernel/tests/Kconfig.debug
index 40f8dafffa0a..eb79df5b2c5a 100644
--- a/arch/riscv/kernel/tests/Kconfig.debug
+++ b/arch/riscv/kernel/tests/Kconfig.debug
@@ -42,6 +42,18 @@ config RISCV_KPROBES_KUNIT
 
          If unsure, say N.
 
+config RISCV_STACKTRACE_KUNIT_TEST
+	bool "KUnit tests for RISC-V stack trace start frames"
+	depends on KUNIT && STACKTRACE && FRAME_POINTER && KALLSYMS
+	help
+	  Check that stack_trace_save() starts at its caller and skips exactly
+	  the requested number of frames through a known call chain, and that
+	  ftrace_return_address(), which CALLER_ADDR1 and up are built on,
+	  returns the caller it was asked for. This catches a stack walker
+	  that exposes its own implementation frames to its users.
+
+	  If unsure, say N.
+
 endif # RUNTIME_TESTING_MENU
 
 endmenu # "arch/riscv/kernel runtime Testing"
diff --git a/arch/riscv/kernel/tests/Makefile b/arch/riscv/kernel/tests/Makefile
index 407e7e6c28dc..9ca4135bffb5 100644
--- a/arch/riscv/kernel/tests/Makefile
+++ b/arch/riscv/kernel/tests/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_RISCV_MODULE_LINKING_KUNIT)	+= module_test/
 obj-$(CONFIG_RISCV_KPROBES_KUNIT)		+= kprobes/
+obj-$(CONFIG_RISCV_STACKTRACE_KUNIT_TEST)	+= stacktrace_test.o
diff --git a/arch/riscv/kernel/tests/stacktrace_test.c b/arch/riscv/kernel/tests/stacktrace_test.c
new file mode 100644
index 000000000000..bb299a106773
--- /dev/null
+++ b/arch/riscv/kernel/tests/stacktrace_test.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Check where stack_trace_save() and ftrace_return_address() start. */
+#include <kunit/test.h>
+#include <linux/ftrace.h>
+#include <linux/kallsyms.h>
+#include <linux/module.h>
+#include <linux/stacktrace.h>
+
+#define RISCV_STACKTRACE_DEPTH 16
+
+static noinline unsigned int
+riscv_stacktrace_leaf(unsigned long *entries, unsigned int skip)
+{
+	unsigned int count = stack_trace_save(entries, RISCV_STACKTRACE_DEPTH, skip);
+
+	barrier();
+	return count;
+}
+
+static noinline unsigned int
+riscv_stacktrace_middle(unsigned long *entries, unsigned int skip)
+{
+	unsigned int count = riscv_stacktrace_leaf(entries, skip);
+
+	barrier();
+	return count;
+}
+
+static noinline unsigned int
+riscv_stacktrace_outer(unsigned long *entries, unsigned int skip)
+{
+	unsigned int count = riscv_stacktrace_middle(entries, skip);
+
+	barrier();
+	return count;
+}
+
+static void riscv_stacktrace_check_skip(struct kunit *test, unsigned int skip)
+{
+	static const char * const expected[] = {
+		"riscv_stacktrace_leaf",
+		"riscv_stacktrace_middle",
+		"riscv_stacktrace_outer",
+	};
+	unsigned long entries[RISCV_STACKTRACE_DEPTH];
+	char symbol[KSYM_SYMBOL_LEN];
+	unsigned int count;
+
+	count = riscv_stacktrace_outer(entries, skip);
+	KUNIT_ASSERT_GT(test, count, 0U);
+	sprint_symbol_no_offset(symbol, entries[0]);
+	kunit_info(test, "skip=%u first=%s count=%u\n", skip, symbol, count);
+	KUNIT_EXPECT_STREQ(test, symbol, expected[skip]);
+}
+
+static void riscv_stacktrace_skip_zero(struct kunit *test)
+{
+	riscv_stacktrace_check_skip(test, 0);
+}
+
+static void riscv_stacktrace_skip_one(struct kunit *test)
+{
+	riscv_stacktrace_check_skip(test, 1);
+}
+
+static void riscv_stacktrace_skip_two(struct kunit *test)
+{
+	riscv_stacktrace_check_skip(test, 2);
+}
+
+static noinline void *riscv_return_address_leaf(unsigned int level)
+{
+	void *addr = (void *)ftrace_return_address(level);
+
+	barrier();
+	return addr;
+}
+
+static noinline void *riscv_return_address_middle(unsigned int level)
+{
+	void *addr = riscv_return_address_leaf(level);
+
+	barrier();
+	return addr;
+}
+
+static noinline void *riscv_return_address_outer(unsigned int level)
+{
+	void *addr = riscv_return_address_middle(level);
+
+	barrier();
+	return addr;
+}
+
+/*
+ * ftrace_return_address(n) is what CALLER_ADDRn expands to. Like
+ * __builtin_return_address(n), level 0 is the caller of the function that
+ * uses it.
+ */
+static void riscv_return_address_check(struct kunit *test, unsigned int level)
+{
+	static const char * const expected[] = {
+		"riscv_return_address_middle",
+		"riscv_return_address_outer",
+	};
+	char symbol[KSYM_SYMBOL_LEN];
+	void *addr;
+
+	addr = riscv_return_address_outer(level);
+	KUNIT_ASSERT_NOT_NULL(test, addr);
+	sprint_symbol_no_offset(symbol, (unsigned long)addr);
+	kunit_info(test, "level=%u caller=%s\n", level, symbol);
+	KUNIT_EXPECT_STREQ(test, symbol, expected[level]);
+}
+
+static void riscv_return_address_level_zero(struct kunit *test)
+{
+	riscv_return_address_check(test, 0);
+}
+
+static void riscv_return_address_level_one(struct kunit *test)
+{
+	riscv_return_address_check(test, 1);
+}
+
+static struct kunit_case riscv_stacktrace_cases[] = {
+	KUNIT_CASE(riscv_stacktrace_skip_zero),
+	KUNIT_CASE(riscv_stacktrace_skip_one),
+	KUNIT_CASE(riscv_stacktrace_skip_two),
+	KUNIT_CASE(riscv_return_address_level_zero),
+	KUNIT_CASE(riscv_return_address_level_one),
+	{}
+};
+
+static struct kunit_suite riscv_stacktrace_suite = {
+	.name = "riscv-stacktrace-skip",
+	.test_cases = riscv_stacktrace_cases,
+};
+
+kunit_test_suite(riscv_stacktrace_suite);
+
+MODULE_LICENSE("GPL");
-- 
2.39.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
