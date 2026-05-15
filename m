Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219BACD4F47
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 14:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HzOROoWZhE+rUOnUFiiEMX379XeyJsjrxpSjgP0zEeE=; b=mLbcq7Xc+wtcNz
	P096rzQRn3wBSalb+WZzj/mzsBvfBo8VCoT70W0XVglIBtdPWRb5LmoCbWD0KtldZGuq8cCCuY9SU
	OPxU+vCqsMUh/kQR/npvkK+O/us5HTLWHcZXjDgi7xn8os/2URmfXjGJIugW32FnVzDqjgACueXE5
	C8HGC8IcwFC8bCrSPWteI8WuOgZLJyi+urtHelCOfZbROHr2vynPcfR7swyK1SiPQus6zPQsY9YCQ
	JegUht/Z0B1oNcNN+OCgn5wC249GHexmC5QclgbyzSvispxuUKtnCeJpC9S0xmt353mfuPcfLL6pX
	LjqMNu4s6KfrE3QQ/u6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtFT-00000008XGc-311U;
	Fri, 15 May 2026 14:10:43 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtFR-00000008XF5-21bw
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 14:10:42 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-67c2d57a5ceso15874814a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 May 2026 07:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778854239; x=1779459039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbNpooQrEJs3yBi52eeAYr0gS+PTGlwWyV+EDa32Vg0=;
        b=h3iSQj5mxZa9sXlld9FhOlX/GZ0cQ4XFTEiG/gutg67sBWCxxWPTPjb/omV+dDOqdq
         ZjzI8WSalaqmVdH3r1uSUWej/Vd+K6jKHgqunroFLdlpuwJsh/8B1re3RMmZ52mBUpbe
         vVNrIiSTqtDzYrv09EPU9Y3Jqej3ABkVPe2mBid6K8akXC4qubTb7HtjLRbo298qsUvh
         LjNDN0tAmBsHTORmmMGr/ijJXdGwm44fAyPdmGtBfyxpMfPzgej65T/yddyiF0jUNH9e
         llOrgj5iqUlMHljM9fn9/7QUeNF7+axfwfKx6KEN0iLdh0LvNJYgny8Ez8o/rMGv4syV
         oH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778854239; x=1779459039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zbNpooQrEJs3yBi52eeAYr0gS+PTGlwWyV+EDa32Vg0=;
        b=DLjKtz3sFxlNINmGB5RUiFUMw1suclqrM6RqiLZiZ7DFza0y8w6s6IJVkGws84HdJu
         EVNST9r3DLd1hlHtkhBtsBOWf5kq7zqbYx6syYTUJD6ZPBuh9c4OVYrq1HF85Rsp+Isc
         WAAN4TCrRZfkJQp5qpsxEQCV/rGRSF7SOUr3t/ueIKH6EHXYpsIgU37SDrM5I2Zwfupt
         4FqnM4upEicnX4srNaj0J/UIgnsOD9gH6+dRSQS5JwZ48TyUkhwiwMFd248CRVVcO15s
         Ai7vAmzkGX4o/G8deSkpasCw/UD+k6IW118OREtztEnITOtadRNEiQUlJw1hIkznK3s1
         DBiw==
X-Forwarded-Encrypted: i=1; AFNElJ9FwI5aOAUiD3QILxtOzI9HHRVCHt/LdcDpHtvoxpGEPG2HBrpJN0m5enao5bwrr2KnBMvkMDiTXml7CA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXv41R5jmqhb8NZBXAyC9WWI7jnsYgdH2nUHqd6ZlUe5Nfvt2e
	iUSlY6Tv0ZWhVJz1UFBzFDMjQDcNRa41pK7hM54KtPOF4CCYdbKs4i9t
X-Gm-Gg: Acq92OEJQxlOmYAlyxFuUAFRAvU6++hvBPzRtamuIW0f9sYG8Rt9IwJPqDi707Vf08a
	YOq17Eug2jVETvX0oheFc7qvU2FvxuAiJAzTgHIXr/160z/DbAAsY5qAQCty/P1fm+Ug/dircNG
	Rwj0mZHgs8iuOp4UDW/Z6+2oWXysNWkoCP0g43i1tWWI4LbcEI4AjZaHDYC05Dcicl6zdBY6qZz
	rB1ZS9HJJeIgVyZM5kj8rGrI6iv+moxJwQStjos5nBZfHtSNTYGSYABRyKBnVyXsHe5f8d02Axf
	/IzRxGJfk7sf7iqu8bd7Ni+/kUUzXunM/q/8mC0dKGnc/N9thaZbA/GQx2sPELqM+w3ErM8GVYp
	C3BBQf2mDlPS8e/OR4I73x/BHdJtg/H9HTLfVlDbl0wzMyKnveBwAgIhwbT+0EJgl+2Zw/Vtr/L
	/TGt1uujeVcZCwPnDQJHxemQbp+THss1nz+baFffLu4A==
X-Received: by 2002:a05:6402:a256:10b0:683:2a7d:fb5 with SMTP id 4fb4d7f45d1cf-683bc4b344dmr1548414a12.8.1778854239328;
        Fri, 15 May 2026 07:10:39 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([77.243.23.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6831197bf00sm2115768a12.31.2026.05.15.07.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:10:38 -0700 (PDT)
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
Subject: [PATCH v3 2/2] lib/string_kunit: extend benchmarks and unit test to memcmp()
Date: Fri, 15 May 2026 16:10:19 +0200
Message-ID: <20260515141019.1234037-3-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515141019.1234037-1-milant2002@gmail.com>
References: <20260515141019.1234037-1-milant2002@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_071041_555072_3C14DCAB 
X-CRM114-Status: GOOD (  12.78  )
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
 lib/tests/string_kunit.c | 116 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 0819ace5b..95d65c25b 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -881,6 +881,120 @@ static void string_bench_strrchr(struct kunit *test)
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
+static void do_string_bench_memcmp(struct kunit *test)
+{
+	char *buf1 = NULL;
+	char *buf2 = NULL;
+	const u64 lengths[] = { 1, 7, 8, 16, 32, 64, 128, 512, 1024, 4096 };
+	const int offsets[] = { 0, 1, 3, 7 };
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
@@ -910,6 +1024,8 @@ static struct kunit_case string_test_cases[] = {
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
