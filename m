Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF292D29DEB
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBeIfRKtDRV+bV9PN7GBhs5YMOicFVWDthy+yRSB6Qs=; b=Xhj/RrvOdphmEa
	eBqWGs0xNTYK7LmUYeQSsSyyMQZ/ho4l6zN1jRLSEXAmcZqWsuQ/SxIgjbCW3Bu1m82qABFrEgjmm
	H/1RpOm+zDEb+EO1ghUyuixZWvPWxGYZA5wFCf5vmDSeLnmboct+0TSoHzs5WiqNqczylystWn/0C
	Sx9WuLrrjIeAyvhGd8DBRgRajapNdYZRDUumJL0qv+zqYf5sJGjl/+FlBmYGFPFgZwRiOEDe4lAWK
	WKMVG9gSUfbq6pzmfC7zelZc1DdssFLx3KaalkqpKFIdWpy0EomQCcH68nT3+BAIEWwnT2ZkWedv+
	boLlcl1NasAidWJ6puKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZlX-00000006jp5-28jP;
	Tue, 13 Jan 2026 08:28:39 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZlT-00000006jko-1jYG
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 08:28:37 +0000
X-UUID: d6ae1ddaf05911f0a38c85956e01ac42-20260113
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:0e4d3c4f-a374-47d5-9fb6-8c45f2790522,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:d528e2ec9eed477e95c28352806b8da3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d6ae1ddaf05911f0a38c85956e01ac42-20260113
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1386593411; Tue, 13 Jan 2026 16:28:29 +0800
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
Subject: [PATCH v2 10/14] lib/string_kunit: add performance benchmark for strchr()
Date: Tue, 13 Jan 2026 16:27:44 +0800
Message-Id: <20260113082748.250916-11-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260113082748.250916-1-jiangfeng@kylinos.cn>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_002835_774059_AA34F0DE 
X-CRM114-Status: GOOD (  11.29  )
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

Introduce a benchmark to compare the architecture-optimized strchr()
implementation against the generic C version (__generic_strchr).

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 lib/tests/string_kunit.c | 49 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 6578b36213bc..e8d527336030 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -20,7 +20,8 @@
 #define STRING_TEST_MAX_LEN	128
 #define STRING_TEST_MAX_OFFSET	16
 
-#if defined(__HAVE_ARCH_STRLEN) || defined(__HAVE_ARCH_STRNLEN)
+#if defined(__HAVE_ARCH_STRLEN) || defined(__HAVE_ARCH_STRNLEN) || \
+	defined(__HAVE_ARCH_STRCHR)
 #define STRING_BENCH_ENABLED
 #endif
 
@@ -367,6 +368,49 @@ static void string_test_strrchr(struct kunit *test)
 	}
 }
 
+#ifdef __HAVE_ARCH_STRCHR
+static void string_test_strchr_bench(struct kunit *test)
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
+			(void)strchr(buf, '\0');
+		}
+		end = ktime_get();
+		time_arch = ktime_to_ns(ktime_sub(end, start));
+
+		/* 2. Benchmark the generic C version */
+		start = ktime_get();
+		for (unsigned int j = 0; j < iters; j++) {
+			OPTIMIZER_HIDE_VAR(buf);
+			(void)__generic_strchr(buf, '\0');
+		}
+		end = ktime_get();
+		time_generic = ktime_to_ns(ktime_sub(end, start));
+
+		string_bench_report(test, "strchr", &bench_cases[i],
+				time_arch, time_generic);
+	}
+}
+#endif
+
 static void string_test_strnchr(struct kunit *test)
 {
 	const char *test_string = "abcdefghijkl";
@@ -867,6 +911,9 @@ static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_strnlen_bench),
 #endif
 	KUNIT_CASE(string_test_strchr),
+#ifdef __HAVE_ARCH_STRCHR
+	KUNIT_CASE(string_test_strchr_bench),
+#endif
 	KUNIT_CASE(string_test_strnchr),
 	KUNIT_CASE(string_test_strrchr),
 	KUNIT_CASE(string_test_strspn),
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
