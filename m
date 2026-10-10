Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B2DCA9EC5
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 13:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TSuhTxns/TSjFcipWjC7r/EQHmrIfhNDIpkD/Lpu6Qs=; b=1eChdlhqquvqle
	9v6vtfV5926qxT0Rt+v+CL37Enlp30e9REEdEHntTRAGkTWmzPtZQ8e0hdu1hVPFtayiVOJF80ifq
	8WMVS/kLZA6dbJA6apTpWRcczfiL26IUo6r2TnhRJ9U/1iC8hvoYhgTG0u7B0eWSPV120EKk21sOb
	hD/A7flA1pXVfpDRfcu+7ElqiuaJOjcRiphNH/n3+JHkQfZGdZgvdxuFr2O8WWvJkp+Rwh6lV2NqY
	ibAN32ru1lJB8BEavZG7zDeAhmyCaCCNYJwWTmY+XbZpMQN+fRM3m7oEn8IwlZNJCBwXN8qyi777x
	aJxm90621MdPFRZYOwNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFX6l-000000086kE-2lUQ;
	Sat, 10 Oct 2026 13:27:27 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFX6i-000000086j9-3kGX
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 13:27:26 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a02718da81so4525995e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 10 Oct 2026 06:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791638843; x=1792243643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Go18brKNkouX7jNlWtPlkQMMHplwnR2FFa56h0dzp9I=;
        b=LN/w4bodWWAZR2LE4TUOc0I5yDfnJLHnWLrUJ3OgHfJb+lOJRWtU9Szi31Bxz5o/20
         +TA6qd4QDMO2e/UetFbCi8kC1VdXqOVH5q9fVMg3rl+ZJXZduo6N7Wb5T7f9dHDCIOZ/
         sbhC7JewvVYVfZPwYx8Lfx3dq9ziQ36VTaOLdIKscp4lrQ+WqSSWysQMOh9kj3VfhCLC
         lfs6X5IVsYbTM3mbrVoxSGLnl4DxA4XTB2EBZHHCyVueKXZ0/IH+mLfhMPElP0/ZVgv1
         qYVS3FVFnV0RxroYBihUwCE/nyNnbo2+uqT76nRdIkNDfBS7mSC1EfrZHK8vzV0krJT0
         Nn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791638843; x=1792243643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Go18brKNkouX7jNlWtPlkQMMHplwnR2FFa56h0dzp9I=;
        b=M4dXAn3iM1yhh0rtCd0ctjY4VOAmCb8NWcqZ3eRytycXcQtnkYiyHw6zfppeLzO8a6
         o13sRFMppjyJCY2q60JrzyteHNF7EHXUr11sp0UZAcQknVnG+Ca4TbaO+vRgqHLNOrE7
         zEqBumjJfpvSOJ4M4AfTozYKQLPQpWK/ohLVF5f2TrPSui3QFyWOZdGuhpzbaYqxpBo6
         NIkpiTGX0b+f1i0VPSjcI5CrJ7n82bcGBcY/WRlsxDHQEFOJwLGvxHwlLpFHiPxTUVDg
         NyGkWSqXJHDgVpz9oCQR9jYFSUV5Tdg4liDrtvHDQ6Is3/z7XMNY1wYuwXUM9gTxn7C2
         iP5g==
X-Forwarded-Encrypted: i=1; AKwUvBxu4PfzVeMCr0BrzwyQ7aBI3alLU2afRYEespYbibgBlrPPvkJ2rL3kjkafqcsfQfbOgl/C0fe0Bb69GQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLvIWbFb/OQFJgkO0LOVGzBO3h/OeW+zATceEdzcT4HZpK6uZeC
	Tk3MO4cHA/ALWYQsR2BaqWxssu1gRBC9zYPfA/P1qEaURgJ8h8VB9pg5
X-Gm-Gg: AYBFou0EsObeNrIeb6pbSGGcxDuo+3J3hs5EQOdW9nEfvYYm2gHgM0Dczs0YYROPHVW
	hyk1KhrLOLaYJeGAMjLg45RowoVKZs7RyR/4mIwBsqJL5zpwaLjgbZl76fqi9jGaJVee2jpnY7v
	kwr8FsCnzC8/R7kPDmUpd/5aIOg8plDTfLHILgsmLEaqSu6n2ax0kTS7o8XGQHYjfCOTJpG1nl7
	V9lVbrV0bT8g5cDurACgtx9jWvgnMu5ycFlrZXEiWlbBny+0rGcJD6se/6hLjHgEyZnPEbxWxyV
	WFcsYAAB+xdlADydcKaaPJyJEGtBJfezdl8H3nCNR71LeBYdeu2z/5IO9QVUbpunwOvKEvE2M7U
	FLTD6nM+zXz+wIZrjG7Jhc26gw1Prgb87kDhFnfsaxFWZCdFwVHFOloaLQ5RExCp6eLHWi5SFsp
	rrP0ximIg791i3wshV69juYvGExRkqlluHke4XfWufYtpLeZsoGGHG1Xn0nS9LqtxC/pr+tuEVD
	gfga+Gb5lJICCpMcwVuIxntps6pljd0SayXDHcehe/a/P5P2TvH7iUlcJ0o9QyTudcgr81rpRIa
	mCI/76P6p9Zzhje7iAFocgUaumOwwplPxDs5ieZbKNi9qggBu/qGFXIZdQgPnBWBdvri+7MoQ1U
	=
X-Received: by 2002:a05:600c:46c5:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4a18e4d6b28mr90315085e9.33.1791638842905;
        Sat, 10 Oct 2026 06:27:22 -0700 (PDT)
Received: from imx93-evk.localdomain (dynamic-2a02-3100-9d3f-0d01-48c7-5d76-0ec6-9dac.310.pool.telefonica.de. [2a02:3100:9d3f:d01:48c7:5d76:ec6:9dac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm215410405e9.8.2026.10.10.06.27.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 06:27:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Changbin Du <changbin.du@intel.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: [PATCH 2/2] riscv: Add KUnit test for stack trace start frames
Date: Sat, 10 Oct 2026 15:27:12 +0200
Message-Id: <20261010132712.46931-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261010132712.46931-1-kmehltretter@gmail.com>
References: <20261010132712.46931-1-kmehltretter@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_062724_967517_E8EDA0B7 
X-CRM114-Status: GOOD (  17.72  )
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

stack_trace_save() and return_address() depend on the first frame reported
by arch_stack_walk(), but no test checks their frame numbering.

Add a test that calls both through a chain of three noinline functions
and compares the symbol of the result with the function expected for
each skip count or level.

Require FRAME_POINTER because the stack-scanning walker cannot provide an
exact start frame.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/riscv/kernel/tests/Kconfig.debug     |  12 ++
 arch/riscv/kernel/tests/Makefile          |   1 +
 arch/riscv/kernel/tests/stacktrace_test.c | 142 ++++++++++++++++++++++
 3 files changed, 155 insertions(+)

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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
