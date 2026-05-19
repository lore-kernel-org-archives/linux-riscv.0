Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF17DCD4F3C
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 14:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WiUca0fQiHg/AySNPVaPFQ5JYT4OLp4HPw+EKd5jDhM=; b=e9+XWv0Cod53ZU
	zXp26wpRTpvHWeUifWiae1fWRH/vm/3EB9bxqsAOU5ZxfdmsCPNsVCXv2aj0B0joi1YKsLPYDIPoU
	txoNdfPSX8ei5WbusAqvT0CQbhDOO5CwmwWfhYYikckVTVq+pgPBSpJmIihD+7l9vPdQBFlCz72q6
	hz96HpgLV8FMHSBqL3vV9++Q6WdNnR4pu4ofWxIAuAD9kCD9mSmfQk9OkUqEqzgZJQrKsyHaEOtyx
	Ksy7v2npSCYUWVf4kKfAtcl/hMLm4oLVFZazfBVYGWN6NXLgcuj81u6Hyv2jRb8hOV0Dgsm6qG2C7
	bH7R5nyMD6V6HtCVhz4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPL06-00000001km7-3D5U;
	Tue, 19 May 2026 14:00:50 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKzy-00000001khx-3mAh
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 14:00:44 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43fe62837baso2031133f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 07:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779199241; x=1779804041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzK6VYeUiVHSRFo0FZ0JhAzgzZD4BZVN0mP+XFPvz0c=;
        b=RSw5/GROW+ZuFOq5ALAH+o8EmkiwbkrJKr2/SKbdt3qSob8dEkys0FMzfhaHHLgzPo
         v1w14bok3Z6Hps69s/lKDoGNxEFkNlrQktRyPm7cUl4QjG5XfZUoiNgZYLpIbrm3vT/8
         vyRfAi6hGMSfTAQTgHVJZzVRX9X0qWFkcDiBSmlE2a1QzyQCnFB3uXtGDAO+OeogXJe2
         YSsKrkeLRib17MHfeYXOOl8dV86c752VBv5HwZMzGswM5AfvC49ltns8kJmgVpoGCNOG
         ULsKRKPYfUkc9vp8Sg5hDq8CHcPSVurAwfQpXEOZ4w6opDY/nmgE7spHZddwb17VBpEG
         Q5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779199241; x=1779804041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EzK6VYeUiVHSRFo0FZ0JhAzgzZD4BZVN0mP+XFPvz0c=;
        b=aKnS47HfFIEpEpbG1nkcwg/ZveF+LZXggOxP7TxHkVM59GpkBTf/0zNUw88bvNJKSp
         jDUAqBpVvaDu0hxnFjJTXr2LIH+WCWprNtx9iruALiGHoAl4pmtpqktmFfoCyRRxzxFM
         XoNMs7RUZJjyiJ+dijtiS0ATGYEEJjccxgfg4f0QcmHVC2y0bBRW7FZhDi1GNO9C7ddw
         K7U4Onj2fyZ2k9DJ3XhiExliF6w9e8fmPQtUmP3BlVnmcUXjS1aAU7HAqMT9xjofbS2V
         equ1kM0h4GNxqtdXi9rnrtfL25bgthQxZHmEU5dhXL3j1T5sN5dtxTFXfaguJDeqhE2D
         jPZw==
X-Forwarded-Encrypted: i=1; AFNElJ/gtQQjc8XtZtxq7HiQTCQIEvX1DC0NsJkwmMGuAu2sJhIj2+OsmXRQhWBo5HKOxQr3B+u7DNk0mZiRcg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxogWVVMgAGzWXIP2JkvGA6ZDXUsS9C1EBf4HIkKe81WPCcmm3
	PKTprO4rKig0svkwCxV7br+P/Dz01tZG0Dv4/L5cCmzinK2OE0s0w5uI
X-Gm-Gg: Acq92OGZDlKVUL0e+IqPAlQtW8wilE8tpFOqXMMEvKu7BPCkt9x/VeOD5L2iTfOE06F
	53wl1AmbS+F1EmK4I+srTsA4zUcAeLR9UtOgsuH5B5OBVFlPFKGbxmrMj0rLzRUwQRfRpmA3/RD
	O4Y2Qe+bklWXHkg6KrYBEHKzhUHr2JPieMS77SbdOBjYpsQ6yYX/8RSbSue4gn8iUhRqEc9ZNYU
	/LLXuk4aATNd9DtbY7M0gGZM3X2QLuTwgUocXTdlpwOOMvmwSyds67SI6ofh4nZ3nVv5lEx8Iqw
	Qk5JtSKz2qtQQL0ig5pw9FaDMgxLlkiPNA354ShTUD8mr5RYT+znAKYtIADEc+Obe78KHN76fBy
	2XZquQzd83ILO4KQFgczfgXgUMUXVVv/N+upBHPvyKicu6oFG7+RJd5QpGNfC8UI3CfNRM1kvjW
	AfMr9h/ujpFOjd4yYygbe2Wf1sYRtGRvKkSqcgNV/v
X-Received: by 2002:a05:6000:2482:b0:45d:8c16:5566 with SMTP id ffacd0b85a97d-45e5c3728d1mr31602074f8f.18.1779199240823;
        Tue, 19 May 2026 07:00:40 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([95.86.49.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767d0bsm44065144f8f.3.2026.05.19.07.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:00:40 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	kees@kernel.org
Cc: alex@ghiti.fr,
	andy@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Dusan.Stojkovic@rt-rk.com,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: [PATCH v5 2/2] lib/string_kunit: extend benchmarks and unit test to memcmp()
Date: Tue, 19 May 2026 16:00:29 +0200
Message-ID: <20260519140029.1190381-3-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519140029.1190381-1-milant2002@gmail.com>
References: <20260519140029.1190381-1-milant2002@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_070042_964636_F3B1B8D0 
X-CRM114-Status: GOOD (  14.01  )
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

From: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>

Extend the string benchmarking suite to include memcmp().
Extend the string unit test to include memcmp().

Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
---
v5 changes:
    - Removed redundant warm-up from test case
    - Link to v4: https://lore.kernel.org/all/20260518131407.1026049-2-milant2002@gmail.com/

v4 changes:
    - Fixed build error: call to undeclared function 'STRING_BENCH'
    - Link to v3: https://lore.kernel.org/all/20260515141019.1234037-1-milant2002@gmail.com/

v3 changes:
    - Split memcmp benchmark into wrapper (string_bench_memcmp) and worker
      function (do_string_bench_memcmp).
    - Removed all C99 mixed declarations; moved all variable declarations
      to the top of each function.
    - Converted len, iterations and loop counters in the benchmark to u64
      to avoid implicit casts.
    - Cleaned up spacing, indentation and minor style issues.
    - Added #if defined(CONFIG_RISCV_ISA_ZBB)... in  memcmp.S
    - Link to v2: https://lore.kernel.org/all/20260514121359.931999-1-milant2002@gmail.com/

v2 changes:
    - Fixed KUnit build failures for Clang and non-benchmark configs.
    - Link to v1: https://lore.kernel.org/all/20260512141007.1193033-1-milant2002@gmail.com/

 lib/tests/string_kunit.c | 110 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 0819ace5b..7b14c0052 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -881,6 +881,114 @@ static void string_bench_strrchr(struct kunit *test)
 	STRING_BENCH_BUF(test, buf, len, strrchr, buf, '\0');
 }
 
+static void string_test_memcmp(struct kunit *test)
+{
+	const unsigned int max_offset = 16;
+	const unsigned int max_len = 32;
+	const unsigned int buf_size = max_offset + max_len + 32;
+	u8 *buf1, *buf2;
+	unsigned int i, j, len, k;
+	int res;
+
+	buf1 = kunit_kzalloc(test, buf_size, GFP_KERNEL);
+	buf2 = kunit_kzalloc(test, buf_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf1);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf2);
+
+	for (i = 0; i < max_offset; i++) {
+		for (j = 0; j < max_offset; j++) {
+			for (len = 0; len <= max_len; len++) {
+				memset(buf1, 'A', buf_size);
+				memset(buf2, 'A', buf_size);
+				KUNIT_EXPECT_EQ_MSG(test, memcmp(buf1 + i, buf2 + j, len), 0,
+						    "Should be equal: i:%u j:%u len:%u", i, j, len);
+				for (k = 0; k < len; k++) {
+					memset(buf1, 'A', buf_size);
+					memset(buf2, 'A', buf_size);
+					buf2[j + k] = 'B';
+					res = memcmp(buf1 + i, buf2 + j, len);
+					KUNIT_EXPECT_NE_MSG(test, res, 0,
+							    "Should detect difference at k:%u (i:%u j:%u len:%u)",
+						k, i, j, len);
+					if (buf1[i + k] < buf2[j + k])
+						KUNIT_EXPECT_LT(test, res, 0);
+					else
+						KUNIT_EXPECT_GT(test, res, 0);
+				}
+			}
+		}
+	}
+}
+
+#ifndef STRING_BENCH
+#define STRING_BENCH(...) 0
+#endif
+
+static void do_string_bench_memcmp(struct kunit *test)
+{
+	char *buf1 = NULL;
+	char *buf2 = NULL;
+	const u64 lengths[] = { 1, 7, 8, 16, 32, 64, 128, 512, 1024, 4096};
+	const int offsets[] = { 0, 1, 3, 7};
+	const u64 max_len = 4096 + 64;
+	unsigned int o, i;
+	unsigned int off;
+	u64 len;
+	char *p1;
+	char *p2;
+	u64 iterations;
+	u64 elapsed;
+	u64 ns_per_call;
+	u64 mbps;
+
+	buf1 = vmalloc(max_len);
+	buf2 = vmalloc(max_len);
+
+	if (!buf1 || !buf2) {
+		vfree(buf1);
+		vfree(buf2);
+		kunit_err(test, "vmalloc failed\n");
+		return;
+	}
+
+	memset(buf1, 'A', max_len);
+	memset(buf2, 'A', max_len);
+
+	for (o = 0; o < ARRAY_SIZE(offsets); o++) {
+		off = offsets[o];
+
+		for (i = 0; i < ARRAY_SIZE(lengths); i++) {
+			len = lengths[i];
+			p1 = buf1;
+			p2 = buf2 + off;
+			iterations = (len < 512) ? 100000ULL : 10000ULL;
+			elapsed = STRING_BENCH(iterations, memcmp, p1, p2, len);
+			ns_per_call = div_u64(elapsed, iterations);
+			mbps = len ? div_u64(iterations * len * (NSEC_PER_SEC / MEGA), elapsed) : 0;
+
+			if (off == 0) {
+				kunit_info(test, "bench_memcmp_aligned: len=%-4llu: %llu MB/s (%llu ns/call)\n",
+					   len, mbps, ns_per_call);
+			} else {
+				kunit_info(test, "bench_memcmp_unaligned(off=%u): len=%-4llu: %llu MB/s (%llu ns/call)\n",
+					   off, len, mbps, ns_per_call);
+			}
+		}
+	}
+
+	vfree(buf1);
+	vfree(buf2);
+}
+
+static void string_bench_memcmp(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_STRING_KUNIT_BENCH)) {
+		kunit_skip(test, "CONFIG_STRING_KUNIT_BENCH not enabled");
+		return;
+	}
+	do_string_bench_memcmp(test);
+}
+
 static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_memset16),
 	KUNIT_CASE(string_test_memset32),
@@ -910,6 +1018,8 @@ static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_bench_strnlen),
 	KUNIT_CASE(string_bench_strchr),
 	KUNIT_CASE(string_bench_strrchr),
+	KUNIT_CASE(string_test_memcmp),
+	KUNIT_CASE_SLOW(string_bench_memcmp),
 	{}
 };
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
