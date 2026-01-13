Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEFBD29DE2
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 08:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGSERax+2TV/mFiwnrBnjA1f1AqSJrdrkHDQnCKRJNA=; b=mFHm7peWa0qcQF
	F79fpWrZpYTTe684G+2kyBojjNqM2/XfuEdQCVEjgKHl7k1207TMZi1iDrkWbOqMB5m4vr+1TWc1l
	z4xBQIZhXJUl3j5VkgRKlOHBjx1amqDhU0csrAE4TuGnTTc0y2cc+N8sqLXDogflFaG7GTsYrKx+4
	T3k8eQNTvc0QS5urHkRKdnTVVrVV8GyfgaIU0itmE/+jlPhZjApuNcoMcCMeQDMXds9e6WUz4QXTk
	3FrC25cz/eEkuAOlBpHxP8PNuujwnVK0UQt2IyRBDMeVIytMw4qJVnvBebFlYJc1zzSA0uDAKv7LO
	DqVIP1NqRf6ayl2wyeSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZlT-00000006jlM-0X6h;
	Tue, 13 Jan 2026 08:28:35 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZlP-00000006jik-1jQA
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 08:28:32 +0000
X-UUID: d61ef7b8f05911f0a38c85956e01ac42-20260113
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:20aca996-3ffb-4c7c-936d-54af30a3665c,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:30b8f83c4b3fdd7a718fa5b9b3b72304,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d61ef7b8f05911f0a38c85956e01ac42-20260113
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 307928599; Tue, 13 Jan 2026 16:28:28 +0800
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
Subject: [PATCH v2 09/14] lib/string_kunit: add performance benchmark for strnlen()
Date: Tue, 13 Jan 2026 16:27:43 +0800
Message-Id: <20260113082748.250916-10-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260113082748.250916-1-jiangfeng@kylinos.cn>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_002831_757623_AB988F8E 
X-CRM114-Status: GOOD (  11.00  )
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

Introduce a benchmark to compare the architecture-optimized strnlen()
implementation against the generic C version (__generic_strnlen).

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 lib/tests/string_kunit.c | 48 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 2266954ae5e0..6578b36213bc 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -20,7 +20,7 @@
 #define STRING_TEST_MAX_LEN	128
 #define STRING_TEST_MAX_OFFSET	16
 
-#if defined(__HAVE_ARCH_STRLEN)
+#if defined(__HAVE_ARCH_STRLEN) || defined(__HAVE_ARCH_STRNLEN)
 #define STRING_BENCH_ENABLED
 #endif
 
@@ -272,6 +272,49 @@ static void string_test_strnlen(struct kunit *test)
 	}
 }
 
+#ifdef __HAVE_ARCH_STRNLEN
+static void string_test_strnlen_bench(struct kunit *test)
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
+			(void)strnlen(buf, buf_len);
+		}
+		end = ktime_get();
+		time_arch = ktime_to_ns(ktime_sub(end, start));
+
+		/* 2. Benchmark the generic C version */
+		start = ktime_get();
+		for (unsigned int j = 0; j < iters; j++) {
+			OPTIMIZER_HIDE_VAR(buf);
+			(void)__generic_strnlen(buf, buf_len);
+		}
+		end = ktime_get();
+		time_generic = ktime_to_ns(ktime_sub(end, start));
+
+		string_bench_report(test, "strnlen", &bench_cases[i],
+				time_arch, time_generic);
+	}
+}
+#endif
+
 static void string_test_strchr(struct kunit *test)
 {
 	const char *test_string = "abcdefghijkl";
@@ -820,6 +863,9 @@ static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_strlen_bench),
 #endif
 	KUNIT_CASE(string_test_strnlen),
+#ifdef __HAVE_ARCH_STRNLEN
+	KUNIT_CASE(string_test_strnlen_bench),
+#endif
 	KUNIT_CASE(string_test_strchr),
 	KUNIT_CASE(string_test_strnchr),
 	KUNIT_CASE(string_test_strrchr),
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
