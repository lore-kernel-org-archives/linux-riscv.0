Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548ADCD4F50
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 13:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQJu42IuXTCAbqRou0gtXj2heSCm08YAw2UCb4j/Nxo=; b=Zizw9YRH3hqtfM
	4FyUrbOVMtd65sYgAtb0M9RBiLKYQLbreG58Gi1+s9eGDm8EsL/E663SY9/m7M9eFTPVEgkQm0zXe
	CDajpOJnQO/i+WZDKBsn4d36IJAfBp16mWysa9odlpWdFdIqnJbiu0GPmeCq2+y7eoeQdrNSwIPb9
	mgpkQy4XRtMqajZ1qwwOzTxoG7j0jwrhqFs6mrHMTOiM/r7EcQ6Sb3SRYjtPJovM3MT/72orpUfIq
	zRqvYvROQLp57Fldh4qwZD5yavo2czTBjvVnKqC4Lc1W65ISNjLqPYZH7sjQy2cH7Wz6LqS81C0qk
	ktXPyYgr/AZWoMZcHyDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxo1-0000000FmM0-2hRX;
	Mon, 18 May 2026 13:14:49 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxnz-0000000FmKo-2cGv
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 13:14:48 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-44c350a5b87so1294312f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 06:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779110086; x=1779714886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNKDREEZdQovW0REhCmZGfTK1N5DJlg6DXHt9BuUT0Y=;
        b=eOtXsacIQUwwUCmnpw/GRCLlVmShw5lOnUlN2Ca36MQhUF4L7+qpJbphw8YyIeV7L6
         iEx7cpweR2GN/VK4/aUwjMpMxRAdya8BG9CgtZtKaoSF/tYE8j/5CDjZo0tSo/nddIEg
         Ku4cTMCsYDtZjV1LT7T+Q0ic9Ut1kfuuveY+aRt+2VWAt/aOWWpIQX6/vFE0kCjCCz3a
         gCnqEONrWyUWHhHHUzEtv2bSYAgJexMVAZtkjTxjSx2sAeGRbBAMLWmbWCwfsWscfXmz
         PQwK/Y/RffKSBtX0tKGJdgcm3MXlDw3jOHVwpPcLr7dtCheuLSfklLZFUdZLPJRPXIsu
         tBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779110086; x=1779714886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dNKDREEZdQovW0REhCmZGfTK1N5DJlg6DXHt9BuUT0Y=;
        b=k5zwQT9lVg3arNc5burIk7BRXbZ8FsclBq8uFlmRy18Vj0s4ki5RMQGC+j0RjK8ahI
         uOqX65lSwtLDIvi8Il39zMx/qyTPGyb0A01r9AYFcFHgnhSvEsSWz+j8CdVrW2CSgqJB
         5wDThsisH5aa9zr9lkZfvdjovTJPbxoNkbOAGRvKLl6AnZxU7XMN1E6L3URnNXIkv1/v
         EnshhkRrHA6lX4/uO1P8zNuT5vsKWEVp11JT/F5YOqE7bshehqg+ALqdsHkWO2TvHam+
         dKt6n1B6UXdB4JfDNfdgJnsdk6/L0fyCETNAlNBgCVQ6jikPVWhKXZ0PbXrS38E2O9IM
         kF1Q==
X-Gm-Message-State: AOJu0Ywgm13V1xzk2sCAJseU1pI/+EH9F7bWJorPoT3W2q5T2SA7mlch
	sx09BbNvK/IDiuJa0l4o43jGuR1YOVhMmSLIoV4R76wB2T02wlsj9JpzUE54Mg0H
X-Gm-Gg: Acq92OH+17vyN2u2aZ8t5vjjYT13tK0QZ/DEsJECHmJLJPqF+gLP2UCzA/ELgZ/6cLp
	GxKo2ao4abcOXD8eGtXAWa/QH2eAOI0Cvg/p2wkoeyDjM0ZIzbJUFITs9AvLecrB43XD8BgxV3S
	soWgLrhVm9E2D+RUMXBB9rtgu6fMYCZh/fpcgP/LAHOgdYB7jpCYvB6acRPOszane7SGLi7OSVK
	aUckS1cJY0Opi0mV33hd8J3jKuPWqCG3yTCX/MwI5EHHWFi8gaSFl4cgwvrm2GupxHDL3KkGsFn
	BAmvqXqmOCJH97SOH9crou9XJxWxb9eT+wrddx82IK8nNLl8lXtIYuWO17XUHZWGWd6hd3PY7Iz
	S56rfQYXcd1uAyUpmTenDuoplgbQFDMqg9BocQyKd9XOgqQYpziS5Bkrxp5kb5IbCVVSsvzUaYo
	DwxHpx/ILRHN1mNkjZNtgU+FhtMa+IHWrX2Ru2MEME
X-Received: by 2002:a05:600c:3e1b:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-48fe60eccc3mr223047365e9.13.1779110085224;
        Mon, 18 May 2026 06:14:45 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([95.86.49.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fffb9aac4sm249619265e9.9.2026.05.18.06.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:14:44 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kees@kernel.org,
	andy@kernel.org,
	linux-hardening@vger.kernel.org,
	Dusan.Stojkovic@rt-rk.com,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: [PATCH v4 2/2] lib/string_kunit: extend benchmarks and unit test to memcmp()
Date: Mon, 18 May 2026 15:14:07 +0200
Message-ID: <20260518131407.1026049-3-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518131407.1026049-1-milant2002@gmail.com>
References: <20260518131407.1026049-1-milant2002@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_061447_703279_6CEF0A7C 
X-CRM114-Status: GOOD (  12.86  )
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
 lib/tests/string_kunit.c | 120 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 0819ace5b..48b1fd068 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -881,6 +881,124 @@ static void string_bench_strrchr(struct kunit *test)
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
+	unsigned int w, o, i;
+	unsigned int off;
+	u64 len;
+	char *p1;
+	char *p2;
+	u64 iterations;
+	u64 elapsed;
+	u64 ns_per_call;
+	u64 mbps;
+	u64 j;
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
+	for (w = 0; w < 100000U; w++)
+		(void)memcmp(buf1, buf2, 4096);
+
+	for (o = 0; o < ARRAY_SIZE(offsets); o++) {
+		off = offsets[o];
+
+		for (i = 0; i < ARRAY_SIZE(lengths); i++) {
+			len = lengths[i];
+			p1 = buf1;
+			p2 = buf2 + off;
+			iterations = (len < 512) ? 100000ULL : 10000ULL;
+
+			for (j = 0; j < iterations; j++) {
+				(void)memcmp(p1, p2, len);
+				barrier();
+			}
+
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
@@ -910,6 +1028,8 @@ static struct kunit_case string_test_cases[] = {
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
