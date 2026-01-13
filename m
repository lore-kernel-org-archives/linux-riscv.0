Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8B8D29DEE
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 08:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ornK6UljGX9ppUtoIP2hWNDfVXwLCTtt4N0KIJUH69k=; b=ZVKq1IIg2yLOAQ
	GNapxR+5BNHM0Qpk2/U+YalIXX64ejVnjbt2yUnwrer98/kXBFdE+t1JVfK02B3MHSIOofLEhdXHa
	Oe//1rTtnYsoRUuML6IEqo0bDHKnjgAoNHJGoL2rG668SuVDGyWPUBr/8hdt42GQD3qpEi+mRy9AS
	HAW5uQJNGZGJziEZ+ml30pPp6tkUZxd64RaSAz2PAZe6WZ+k8lxDUnQsAzcgQ7Lyf8Zz9yj1fy6wp
	eK3vtYJnKlC64xmQ1NLeHxuRCYJ07BvAGb19o3TQ4ggId9LadEPSJFnNGzvs3JO7bwT+F6CE3fSEz
	fNfdfy8jJhGoLpIkFxnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZlU-00000006jmk-3ICl;
	Tue, 13 Jan 2026 08:28:36 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZlR-00000006jjj-22ms
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 08:28:34 +0000
X-UUID: d5918680f05911f0a38c85956e01ac42-20260113
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:50dd73d7-9d29-46a9-882c-f5c7f518d278,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:2bf60e9b387b1767bb21e51aed26440f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d5918680f05911f0a38c85956e01ac42-20260113
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2104796398; Tue, 13 Jan 2026 16:28:27 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kees@kernel.org,
	andy@kernel.org,
	akpm@linux-foundation.org,
	jiangfeng@kylinos.cn,
	ebiggers@kernel.org,
	martin.petersen@oracle.com,
	ardb@kernel.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	samuel.holland@sifive.com,
	linus.walleij@linaro.org,
	nathan@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 08/14] lib/string_kunit: add performance benchmark for strlen()
Date: Tue, 13 Jan 2026 16:27:42 +0800
Message-Id: <20260113082748.250916-9-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260113082748.250916-1-jiangfeng@kylinos.cn>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_002833_873716_3B4C3CC7 
X-CRM114-Status: GOOD (  14.05  )
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

Introduce a benchmark to compare the architecture-optimized strlen()
implementation against the generic C version (__generic_strlen).

The benchmark uses a table-driven approach to evaluate performance
across different string lengths (short, medium, and long). It employs
ktime_get() for timing and get_random_bytes() followed by null-byte
filtering to generate test data that prevents early termination.

This helps in quantifying the performance gains of architecture-specific
optimizations on various platforms.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 lib/tests/string_kunit.c | 117 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 8eb095404b95..2266954ae5e0 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -20,6 +20,77 @@
 #define STRING_TEST_MAX_LEN	128
 #define STRING_TEST_MAX_OFFSET	16
 
+#if defined(__HAVE_ARCH_STRLEN)
+#define STRING_BENCH_ENABLED
+#endif
+
+#ifdef STRING_BENCH_ENABLED
+/* Configuration for string benchmark scenarios */
+struct string_bench_case {
+	const char *name;
+	size_t len;
+	unsigned int iterations;
+};
+
+static const struct string_bench_case bench_cases[] = {
+	{"short", 8, 100000},
+	{"medium", 64, 100000},
+	{"long", 2048, 10000},
+};
+
+/**
+ * get_max_bench_len() - Get the maximum length from benchmark cases
+ * @cases: array of test cases
+ * @count: number of cases
+ */
+static size_t get_max_bench_len(const struct string_bench_case *cases, size_t count)
+{
+	size_t i, max_len = 0;
+
+	for (i = 0; i < count; i++) {
+		if (cases[i].len > max_len)
+			max_len = cases[i].len;
+	}
+
+	return max_len;
+}
+
+/**
+ * get_random_nonzero_bytes() - Fill buffer with random non-null bytes
+ * @buf: buffer to fill
+ * @len: number of bytes to fill
+ */
+static void get_random_nonzero_bytes(void *buf, size_t len)
+{
+	u8 *s = (u8 *)buf;
+
+	get_random_bytes(buf, len);
+
+	/* Replace null bytes to avoid early string termination */
+	for (size_t i = 0; i < len; i++) {
+		if (s[i] == '\0')
+			s[i] = 0x01;
+	}
+}
+
+static void string_bench_report(struct kunit *test, const char *func,
+		const struct string_bench_case *bc,
+		u64 time_arch, u64 time_generic)
+{
+	u64 ratio_int, ratio_frac;
+
+	/* Calculate speedup ratio with 2 decimal places. */
+	ratio_int = div64_u64(time_generic, time_arch);
+	ratio_frac = div64_u64((time_generic % time_arch) * 100, time_arch);
+
+	kunit_info(test, "%s performance (%s, len: %zu, iters: %u):\n",
+		func, bc->name, bc->len, bc->iterations);
+	kunit_info(test, "  arch-optimized: %llu ns\n", time_arch);
+	kunit_info(test, "  generic C:      %llu ns\n", time_generic);
+	kunit_info(test, "  speedup:        %llu.%02llux\n", ratio_int, ratio_frac);
+}
+#endif /* STRING_BENCH_ENABLED */
+
 static void string_test_memset16(struct kunit *test)
 {
 	unsigned i, j, k;
@@ -129,6 +200,49 @@ static void string_test_strlen(struct kunit *test)
 	}
 }
 
+#ifdef __HAVE_ARCH_STRLEN
+static void string_test_strlen_bench(struct kunit *test)
+{
+	char *buf;
+	size_t buf_len, iters;
+	ktime_t start, end;
+	u64 time_arch, time_generic;
+
+	buf_len = get_max_bench_len(bench_cases, ARRAY_SIZE(bench_cases)) + 1;
+
+	buf = kunit_kzalloc(test, buf_len, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+
+	for (size_t i = 0; i < ARRAY_SIZE(bench_cases); i++) {
+		get_random_nonzero_bytes(buf, bench_cases[i].len);
+		buf[bench_cases[i].len] = '\0';
+
+		iters = bench_cases[i].iterations;
+
+		/* 1. Benchmark the architecture-optimized version */
+		start = ktime_get();
+		for (unsigned int j = 0; j < iters; j++) {
+			OPTIMIZER_HIDE_VAR(buf);
+			(void)strlen(buf);
+		}
+		end = ktime_get();
+		time_arch = ktime_to_ns(ktime_sub(end, start));
+
+		/* 2. Benchmark the generic C version */
+		start = ktime_get();
+		for (unsigned int j = 0; j < iters; j++) {
+			OPTIMIZER_HIDE_VAR(buf);
+			(void)__generic_strlen(buf);
+		}
+		end = ktime_get();
+		time_generic = ktime_to_ns(ktime_sub(end, start));
+
+		string_bench_report(test, "strlen", &bench_cases[i],
+				time_arch, time_generic);
+	}
+}
+#endif
+
 static void string_test_strnlen(struct kunit *test)
 {
 	char *s;
@@ -702,6 +816,9 @@ static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_memset32),
 	KUNIT_CASE(string_test_memset64),
 	KUNIT_CASE(string_test_strlen),
+#ifdef __HAVE_ARCH_STRLEN
+	KUNIT_CASE(string_test_strlen_bench),
+#endif
 	KUNIT_CASE(string_test_strnlen),
 	KUNIT_CASE(string_test_strchr),
 	KUNIT_CASE(string_test_strnchr),
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
