Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981E7D2ECF9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 06:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kIYnmE4ZbmhMJ5vsqDCYxWssB8tsS5x8DJY+eMUbJv8=; b=LYhbZWhuqTER5G
	pP6WywprmK3LR/wb9+Lpg9CkcSK0LDVX/mWCO5XT20pt1HN/sLQ6OpzstHTDwBXgrbnC93yIDg7pg
	3Zsc6uzM58vzI7La4GDvjrHsiR/YPFTYHNE7Y8BGfiMtAT/45VgSuJMdxMzPTo4BVdD238y0SX1tk
	RQrWhxmDhKCUgYi8uCPqp60poCgQP7/UmtyBgQXsB3vfTC0tL7ZRBQ2bC2gy/lqYZCjCDrvba0AHg
	c5AG7q5u4BAnhZlX0E7O14Hj9NG42+1leZmDqxcTq1x8tTeElq7OTfiBB8lBE/FuWOZMO+ynjXjjG
	t8+Z7fWa4qFcESp+iX8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5iH-00000003JKh-3cNn;
	Tue, 20 Jan 2026 06:59:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5iG-00000003JJA-25Lb
	for linux-riscv@bombadil.infradead.org;
	Tue, 20 Jan 2026 06:59:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LMsB8YHSwf2xsXX9+UZnb8h/AkoY7m8TVW25I3FAbDk=; b=a6i0C+e/oXC+m2oQngW4858Jpm
	oVHfbHnEn8dpPciXJHhCFyhmbkflZoE9hx5tADivfRv03LEELAQGrwe6gp4L+gU9/6I6B1CmFBMF8
	JS3QdmZ/Eh4/Qk6/robP2OKfyfWWLdG+PnWHUCk7hDwvZz1R6s2uHCgyHTgF6W/13Sme19caSMlq4
	bHw2CpXuM2GKP7YMZHyLR65IAkSQpPLi4r16obGYrM/8B75IdJ5ASQRshHivJ/DkqSljIcTked7DB
	uA5qeeTnNNM5kOLpjA8tSVXpn7eO1QdQ9WkBrj7qypO0wtHTSWdD5uZw7/n1ifjyl/g6ksUvyMIHW
	uofIulwA==;
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5iD-0000000DRl7-10Sr
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 06:59:39 +0000
X-UUID: 7f779af4f5cd11f0b0f03b4cfa9209d1-20260120
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:0ce710d8-dd33-4617-be18-b53201a1f140,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:8ee1a22fec7a92a4a5b841f6a89d7dcc,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7f779af4f5cd11f0b0f03b4cfa9209d1-20260120
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 863038979; Tue, 20 Jan 2026 14:59:00 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	kees@kernel.org,
	andy@kernel.org,
	jiangfeng@kylinos.cn,
	ebiggers@kernel.org,
	martin.petersen@oracle.com,
	ardb@kernel.org,
	charlie@rivosinc.com,
	conor.dooley@microchip.com,
	ajones@ventanamicro.com,
	linus.walleij@linaro.org,
	nathan@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH v3 4/8] lib/string_kunit: add performance benchmarks for strlen
Date: Tue, 20 Jan 2026 14:58:48 +0800
Message-Id: <20260120065852.166857-5-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260120065852.166857-1-jiangfeng@kylinos.cn>
References: <20260120065852.166857-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_065937_951702_CB37204D 
X-CRM114-Status: GOOD (  18.28  )
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

Introduce a benchmarking framework to the string_kunit test suite to
measure the execution efficiency of string functions.

The implementation is inspired by crc_benchmark(), measuring throughput
(MB/s) and latency (ns/call) across a range of string lengths. It
includes a warm-up phase, disables preemption during measurement, and
uses a fixed seed for reproducible results.

This allows for comparing different implementations (e.g., generic C vs.
architecture-optimized assembly) within the KUnit environment.

Initially, provide benchmarks for strlen().

Suggested-by: Andy Shevchenko <andy@kernel.org>
Suggested-by: Eric Biggers <ebiggers@kernel.org>
Tested-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 lib/Kconfig.debug        |  11 +++
 lib/tests/string_kunit.c | 151 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 162 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ba36939fda79..21b058ae815f 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2475,6 +2475,17 @@ config STRING_HELPERS_KUNIT_TEST
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
 
+config STRING_KUNIT_BENCH
+       bool "Benchmark string functions at runtime"
+       depends on STRING_KUNIT_TEST
+       help
+         Enable performance measurement for string functions.
+
+         This measures the execution efficiency of string functions
+         during the KUnit test run.
+
+         If unsure, say N.
+
 config FFS_KUNIT_TEST
 	tristate "KUnit test ffs-family functions at runtime" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 8f836847a80e..e20e924d1c67 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -6,7 +6,9 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <kunit/test.h>
+#include <linux/math64.h>
 #include <linux/module.h>
+#include <linux/prandom.h>
 #include <linux/printk.h>
 #include <linux/slab.h>
 #include <linux/string.h>
@@ -20,6 +22,9 @@
 #define STRING_TEST_MAX_LEN	128
 #define STRING_TEST_MAX_OFFSET	16
 
+#define STRING_BENCH_SEED	888
+#define STRING_BENCH_WORKLOAD	1000000UL
+
 static void string_test_memset16(struct kunit *test)
 {
 	unsigned i, j, k;
@@ -700,6 +705,151 @@ static void string_test_strends(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, strends("", ""));
 }
 
+/* Target string lengths for benchmarking */
+static const size_t bench_lens[] = {
+	0, 1, 7, 8, 16, 31, 64, 127, 512, 1024, 3173, 4096
+};
+
+/**
+ * alloc_max_bench_buffer() - Allocate buffer for the max test case.
+ * @test: KUnit context for managed allocation.
+ * @lens: Array of lengths used in the benchmark cases.
+ * @count: Number of elements in the @lens array.
+ * @buf_len: [out] Pointer to store the actually allocated buffer
+ * size (including null).
+ *
+ * Return: Pointer to the allocated memory, or NULL on failure.
+ */
+static void *alloc_max_bench_buffer(struct kunit *test,
+		const size_t *lens, size_t count, size_t *buf_len)
+{
+	void *buf;
+	size_t i, max_len = 0;
+
+	for (i = 0; i < count; i++) {
+		if (max_len < lens[i])
+			max_len = lens[i];
+	}
+
+	/* Add space for NUL terminator */
+	max_len += 1;
+
+	buf = kunit_kzalloc(test, max_len, GFP_KERNEL);
+	if (buf && buf_len)
+		*buf_len = max_len;
+
+	return buf;
+}
+
+/**
+ * fill_random_string() - Fill buffer with random non-null bytes.
+ * @buf: Buffer to fill.
+ * @len: Number of bytes to fill.
+ */
+static void fill_random_string(char *buf, size_t len)
+{
+	size_t i;
+	struct rnd_state state;
+
+	if (!buf || !len)
+		return;
+
+	/* Use a fixed seed to ensure deterministic benchmark results */
+	prandom_seed_state(&state, 888);
+	prandom_bytes_state(&state, buf, len);
+
+	/* Replace null bytes to avoid early string termination */
+	for (i = 0; i < len; i++) {
+		if (buf[i] == '\0')
+			buf[i] = 0x01;
+	}
+
+	buf[len - 1] = '\0';
+}
+
+/**
+ * STRING_BENCH() - Benchmark string functions.
+ * @iters: Number of iterations to run.
+ * @func: Function to benchmark.
+ * @...: Variable arguments passed to @func.
+ *
+ * Disables preemption and measures the total time in nanoseconds to execute
+ * @func(@__VA_ARGS__) for @iters times, including a small warm-up phase.
+ *
+ * Context: Disables preemption during measurement.
+ * Return: Total execution time in nanoseconds (u64).
+ */
+#define STRING_BENCH(iters, func, ...)					\
+({									\
+	u64 __bn_t;							\
+	size_t __bn_i;							\
+	size_t __bn_iters = (iters);					\
+	size_t __bn_warm_iters = max_t(size_t, __bn_iters / 10, 50U);	\
+	/* Volatile function pointer prevents dead code elimination */	\
+	typeof(func) (* volatile __func) = (func);			\
+									\
+	for (__bn_i = 0; __bn_i < __bn_warm_iters; __bn_i++)		\
+		(void)__func(__VA_ARGS__);				\
+									\
+	preempt_disable();						\
+	__bn_t = ktime_get_ns();					\
+	for (__bn_i = 0; __bn_i < __bn_iters; __bn_i++)			\
+		(void)__func(__VA_ARGS__);				\
+	__bn_t = ktime_get_ns() - __bn_t;				\
+	preempt_enable();						\
+	__bn_t;								\
+})
+
+/**
+ * STRING_BENCH_BUF() - Benchmark harness for single-buffer functions.
+ * @test: KUnit context.
+ * @buf_name: Local char * variable name to be defined.
+ * @buf_size: Local size_t variable name to be defined.
+ * @func: Function to benchmark.
+ * @...: Extra arguments for @func.
+ *
+ * Prepares a randomized, null-terminated buffer and iterates through lengths
+ * in bench_lens, defining @buf_name and @buf_size in each loop.
+ */
+#define STRING_BENCH_BUF(test, buf_name, buf_size, func, ...)		\
+do {									\
+	char *buf_name, *_bn_buf;					\
+	size_t buf_size, _bn_i, _bn_iters, _bn_size = 0;		\
+	u64 _bn_t, _bn_mbps = 0, _bn_lat = 0;				\
+									\
+	if (!IS_ENABLED(CONFIG_STRING_KUNIT_BENCH))			\
+		kunit_skip(test, "not enabled");			\
+									\
+	_bn_buf = alloc_max_bench_buffer(test, bench_lens,		\
+			ARRAY_SIZE(bench_lens), &_bn_size);		\
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, _bn_buf);			\
+									\
+	fill_random_string(_bn_buf, _bn_size);				\
+	_bn_buf[_bn_size - 1] = '\0';					\
+									\
+	for (_bn_i = 0; _bn_i < ARRAY_SIZE(bench_lens); _bn_i++) {	\
+		buf_size = bench_lens[_bn_i];				\
+		buf_name = _bn_buf + _bn_size - buf_size - 1;		\
+		_bn_iters = STRING_BENCH_WORKLOAD /			\
+				max_t(size_t, buf_size, 1U);		\
+									\
+		_bn_t = STRING_BENCH(_bn_iters, func, ##__VA_ARGS__);	\
+									\
+		if (_bn_t > 0) {					\
+			_bn_mbps = (u64)(buf_size) * _bn_iters * 1000;	\
+			_bn_mbps = div64_u64(_bn_mbps, _bn_t);		\
+			_bn_lat = div64_u64(_bn_t, _bn_iters);		\
+		}							\
+		kunit_info(test, "len=%zu: %llu MB/s (%llu ns/call)\n",	\
+				buf_size, _bn_mbps, _bn_lat);		\
+	}								\
+} while (0)
+
+static void string_bench_strlen(struct kunit *test)
+{
+	STRING_BENCH_BUF(test, buf, len, strlen, buf);
+}
+
 static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_memset16),
 	KUNIT_CASE(string_test_memset32),
@@ -725,6 +875,7 @@ static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_strtomem),
 	KUNIT_CASE(string_test_memtostr),
 	KUNIT_CASE(string_test_strends),
+	KUNIT_CASE(string_bench_strlen),
 	{}
 };
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
