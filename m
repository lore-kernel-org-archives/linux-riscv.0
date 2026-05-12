Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095E6CD4F25
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 14:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VlzJb3zPSNfj/gmhlb7uiVG9jsyckPGOchv8moEWS1k=; b=nI2tHHwX0ZYGEV
	zZeAKS7S31WtcXxlFVoFoueeXFQ0d2ZV2D7EfuNmmPPaFvVVvNW0nhfGxEuvqwHVj/3DVe8C2/O0+
	lZsxmwrKJ63oj+vAzSdX3yte2hqx0mKgc5EnghPO8qSzICQZEBjvd2tMHCWtRxWXPaYLPK2gbHSR7
	cdOq3HxxMKuHTlidWmTkgVfG3KWCIItpKXMq5lm08CaYnlzysK6YL7O2BdRgjj6aJ9wU4uSW+Ea3e
	+AtisL/kJrsig8SQEC3bzvPZ8+1qHnyOki8uzKBi9TEKB7Jlt3Rz0SKmxAmGscttxEfG5tBgJqDET
	zejIOvbKektAFq7DrPrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnoY-0000000GyNW-3dNj;
	Tue, 12 May 2026 14:10:26 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnoV-0000000GyMO-3KDm
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 14:10:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso51437135e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 May 2026 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778595022; x=1779199822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QcDRa4FA3P0xEz4R3NFtiEh2UMv0DUcl8go6uXzNDQ=;
        b=N7yrP4nDVpIhVM6P7/ltMAStvxrpXezIE6UPq439s/ce/9LPhcDN9+Tfmez23rBA8v
         QlbZpdCRqvQltshbt6IZBV/MGBONVl1sNHj2yRxT0Ls/Dzhz2zP5fzsey3jYq9Yho9z4
         2CCodnH5anP8i4TnLQ8mKFoxdrtR3vdMqxjuyK26o8+0JikVc0jGKQMe10JeOFtt8FI3
         fEni/sFia3SrZuLMbIkjeOtCN1IMTKnP9vsd52MVm50hvoGHs1Zf/OlQ7QA2/ebB6HJB
         I4At38g4WatoEHEahrZH+P4W5rqHEUexT6TInvklCOxBb0xxbYR/O/PLXXfm7VGIUDZ2
         FYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778595022; x=1779199822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3QcDRa4FA3P0xEz4R3NFtiEh2UMv0DUcl8go6uXzNDQ=;
        b=IoUgCzbS3keX8HGfZ4Pbcc259u0hiUJG+MH38xhlbDt7x+SH+ew4CPKM8QuvU8pTeV
         6Zg1CErHVmbrrhhc3bOayNV8/6Dvy2mVqe7WvXVxVzmnS/7AgYDnaFVkgfSF+8aB42QD
         x7WrUpStLyVJkJ+xKltCQ2JqjOT3YiPocZ0MB9/SATH5WysJsTSQ7KkBB1nNaFsp4/Ll
         AALIepsu+eWpc46u1IR1BQ1qbvGOoGIdOtXbSsb4wK4K7CNwdVjmwc/2uQlbScLFr9yE
         Cm+nWW/J/JTVywcOSCqJ/ogUQekmt9YnpT72ff01dH8ZMWa6Uo0Ln3oc+1zcyy6ms0Ro
         xEqw==
X-Forwarded-Encrypted: i=1; AFNElJ/eMQnEM/ZNy9Hylm/Y28RwPpqDYEaOFBqhPQD5ZmIw3NHKy7qVxvF20OzgcpftKb3S3z+JGaRe0N+wCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE/vrMPRnfDhxkTrYwX2iAMLhcmLjwBdxlmWSORYnMRgW5zh15
	q/iiK/atCaRn0QZdzTBcliryXbXHZmPpIZ/Vt+TKQz5vap76SD3H8J6G
X-Gm-Gg: Acq92OFEa+9wO9HaOvZ//7JGeBUhLkUFXuU9h5NE47jzkcC1ET8oDmHgaNj3MAURDeU
	GkI18byAbH/U79QLGXul/YlZizfJMKdgKew2aLAGJiQnAdw6jexZTG5pAFTARqW2R3+T/by20Jh
	2CiTCY2ilpEiQU/Gw5AA7RoK0J4Ud2C4Z1/v8d1Xo4JIz2Vo59I36Utd+659o4ObAeKK7dM6pqp
	iW0xNva/KQ20dFJTHDPBQrUDd6N9uZ7Z+wFjJlRtD0bFCQNuPmr98PXNHn9dEw4MTdoovbSrG5p
	UdJ+/uxojiU589nphmoQ7WOdB5zBCXGKZAZTMHCNftnfbDlkY2AMKz83RpJ/oq1gBkZZUxFMdoK
	lRowcWM4qjLl+hKI1zAODXhx4pJTMuuGJ7ggJJQNMW2NPmfb/edFC9Ia3CXGboxDKV0dMHKZctW
	JJOvEgNS5D2XoWFulVTXGR03NUlvqlShlBKiSgSVGKrQ==
X-Received: by 2002:a05:600c:4c94:b0:48a:58ae:9933 with SMTP id 5b1f17b1804b1-48e96e69168mr21884325e9.18.1778595021278;
        Tue, 12 May 2026 07:10:21 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([77.243.27.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e568b04sm40557965e9.0.2026.05.12.07.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:10:20 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Dusan Stojkovic <dusan.stojkovic@rt-rk.com>,
	Milan Tripkovic <milan.tripkovic@rt-rk.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: [PATCH 2/2] lib/string_kunit: extend benchmarks and unit test to memcmp()
Date: Tue, 12 May 2026 16:10:07 +0200
Message-ID: <20260512141007.1193033-2-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512141007.1193033-1-milant2002@gmail.com>
References: <20260512141007.1193033-1-milant2002@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_071023_858239_F52B490C 
X-CRM114-Status: GOOD (  13.02  )
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
 lib/tests/string_kunit.c | 102 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 0819ace5b..7b4aa6eee 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -880,6 +880,106 @@ static void string_bench_strrchr(struct kunit *test)
 {
 	STRING_BENCH_BUF(test, buf, len, strrchr, buf, '\0');
 }
+static void string_test_memcmp(struct kunit *test)
+{
+	const int max_offset = 16;
+	const int max_len = 32;
+	const int buf_size = max_offset + max_len + 32;
+	u8 *buf1, *buf2;
+	int i, j, len, k;
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
+					"Should be equal: i:%d j:%d len:%d", i, j, len);
+				for (k = 0; k < len; k++) {
+					memset(buf1, 'A', buf_size);
+					memset(buf2, 'A', buf_size);
+					buf2[j + k] = 'B';
+					int res = memcmp(buf1 + i, buf2 + j, len);
+
+					KUNIT_EXPECT_NE_MSG(test, res, 0,
+						"Should detect difference at k:%d (i:%d j:%d len:%d)",
+						k, i, j, len);
+
+					if (buf1[i + k] < buf2[j + k])
+						KUNIT_EXPECT_LT(test, res, 0);
+					else
+						KUNIT_EXPECT_GT(test, res, 0);
+				}
+			}
+		}
+	}
+}
+#if IS_ENABLED(CONFIG_STRING_KUNIT_BENCH)
+static void string_bench_memcmp(struct kunit *test)
+{
+	char *buf1, *buf2;
+	size_t lengths[] = { 1, 7, 8, 16, 32, 64, 128, 512, 1024, 4096};
+	int offsets[] = {0, 1, 3, 7};
+	const size_t max_len = 4096 + 64;
+	int res = 0;
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
+	for (int i = 0; i < 100000; i++)
+		res += memcmp(buf1, buf2, 4096);
+
+	for (int o = 0; o < ARRAY_SIZE(offsets); o++) {
+		int off = offsets[o];
+
+		for (int i = 0; i < ARRAY_SIZE(lengths); i++) {
+			size_t len = lengths[i];
+			char *p1 = buf1;
+			char *p2 = buf2 + off;
+
+			u32 iterations = (len < 512) ? 100000 : 10000;
+
+			for (u32 j = 0; j < iterations; j++) {
+				asm volatile("" : : "g"(p1), "g"(p2), "g"(len) : "memory");
+				int res = memcmp(p1, p2, len);
+
+				asm volatile("" : : "g"(res) : "memory");
+			}
+
+			u64 elapsed = STRING_BENCH(iterations, memcmp, p1, p2, len);
+			u64 ns_per_call = div_u64(elapsed, iterations);
+			u64 mbps = len ? div_u64((u64)len * iterations * 1000,
+									 elapsed) : 0;
+
+			if (off == 0) {
+				kunit_info(test, "bench_memcmp_aligned: len=%-4zu: %llu MB/s (%llu ns/call)\n",
+					   len, mbps, ns_per_call);
+			} else {
+				kunit_info(test, "bench_memcmp_unaligned(off=%d): len=%-4zu: %llu MB/s (%llu ns/call)\n",
+					   off, len, mbps, ns_per_call);
+			}
+		}
+	}
+
+	vfree(buf1);
+	vfree(buf2);
+}
+#endif
 
 static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_memset16),
@@ -910,6 +1010,8 @@ static struct kunit_case string_test_cases[] = {
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
