Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BC7CD5BA4
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 12:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DD83kp1t07FRU8nWwgywb496wfQMU4IthUWDgDTHApc=; b=3lBXd+LrhwYQER
	sIPadtxcBtwNCMRlDE9OZpMxc9r9GyTyA9QR1tCakKvt56UCEPtTxrQm2kUe71WW76F/W63N9GCqz
	vhHM1a2DNKArhz77vzobuMBPAQu/2gccvogz6VfA/wg3M2RCAKN+t0UQkRW9N2Qtx20N7zpuXSpEn
	fZtmTnJHIKj1CLufcx2YMrcVEJLD9RW2tLTJv4XDCTaOnswvZ54wuHfUoi68pKEJ7z7PQRTlf8iQu
	ujwOr0hDZx+u00CqjreJqTEKtNH4bcGsC5TQ3nXoLlLvs0UW8oe9V7ouFQ4Af9e1kS/ZC/kj+ZaIC
	ygsB+59J1+zGlW3LlO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgDa-00000004aTs-0pzN;
	Wed, 20 May 2026 12:40:10 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgDY-00000004aST-0Nfs
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 12:40:09 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43d7e23defbso2672021f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 05:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779280806; x=1779885606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZF9TELI0fOJNnQQ0E3LX4ebM27p0Qx0XyBTx0DYfCok=;
        b=R0UNfGY20jwGscEv7QxqazN6vZy8KKXTPwg23fm1on1G/g0tB9HLsKuIw9J62Q8gfV
         JbO6MGbn37RbWg9TrPYDa533mfe53vi8QOgoeY/THAV6HPI9mWN2ErmoZFDoe/I0Uy17
         GzkrZVeUpTUANJK96fypt5BqNGK6sQh5ajJU0BFe45IDu6viFEuTh89xiCFRsW01TJqc
         fVHaT8ktzxaThGdGUX66uMXIUfp5RJo2zx1O3YoSNJppYPm/Q8IxMfxW/KSToU3RfTSe
         a+2qhDpzgu6qbk1gFOgWBdRMLBR7DPgf80O10zF8TbHwnoJo/p2yX6S26oYQSujPcKvf
         5d8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280806; x=1779885606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZF9TELI0fOJNnQQ0E3LX4ebM27p0Qx0XyBTx0DYfCok=;
        b=ZxdVdflF1sJqwNFycQYIBNX1Nh1qaH8xGdloMZ75dKIFbYTwqn/8x0EVsKDwHxCboM
         +aACp4D8XKsXNmsJSVvy50eBBZSvo7CiYE6Ta9NXQJ5DhtKtHYcGbaFpRG4PjOQBcR5j
         wLztbZyodCzrcj/KhWw/vjOL7kbnmD2ekTlgcmOT1QkTJ8xIvz7YPSXnpwrQRvOaxgO/
         o/ZBrAUOWT1TaJsucFisIxVkFrSGxkQ0MROeg6hyWsr+kfe+81cEo1jb3kVcbvxYkrha
         5yyiHhWFqDikYArMJN30PFDEykjZD9wB8pZ38ub1SJRRNOccnjttcjCTPi8RI4DHwPbE
         e3eg==
X-Forwarded-Encrypted: i=1; AFNElJ+oU1OfvKkSvQw0ipJOwqZFc1BhjA2pWerVBMeyiQsyn7hwJdyQyJwR0wHsKv8sDocL4dAKzhNGlOEOqA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1g5iSUwd5qoQBIINfPp23oHANxlRNHNUd0j68CxZ98j1Jg1ye
	3IzchTKBtCm0HFOhtggoN8QXq+9XS8Vpb+RO4r2eAzjO67H07Dkfe39p
X-Gm-Gg: Acq92OFlBz/LmF0KGY65b4ZTiEBTY8oh218HKKBioU+l+rQXF9Q2Idx7Jh/Wh5kUYSn
	DCMNw7rpXtueOZ/ZevJvAwJNIREF3dqjEZcCqieoRNe3n9nM47goUYCMfFTTfzxGHeoPHKNPiV7
	x45kxrMbH/qoLx48WHLSvL6NdQMjy1DubdWT8imgm+Y1VKgto/BG+Toz35jySLWxUH21IE8DI9j
	l4yWwmiq/EUQuMugzhaTU4wQlFiVrpPYO3nNHkHhPDkvZ3b4Aui3/MnpSTm7ejXrU4Jre9NPRNx
	LMYG/2g3qzRl4GbaPg81uWBMK3efJRZFvGSu6V0NL0l3fa/HRBRN8pBg8VeIiafnTgLNDygIGpl
	tesaCXrH8B0sVkpsEAUt4BfMFXBqhnNW3LiyfwHlcqK90WB2dwe4e3e3WgKQs8XdBFaVjcDRQYs
	FAJSaeyHfDVC6pCfdAjfvQruLC3fJLWUQRzeXSC9Lfl4w83+XEbL2A
X-Received: by 2002:a05:6000:4007:b0:456:ba09:3e64 with SMTP id ffacd0b85a97d-45e5c5b3669mr37757602f8f.1.1779280806221;
        Wed, 20 May 2026 05:40:06 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([89.216.37.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3acf7sm54460252f8f.12.2026.05.20.05.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:40:05 -0700 (PDT)
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
Subject: [PATCH v6 2/2] lib/string_kunit: extend benchmarks and unit test to memcmp()
Date: Wed, 20 May 2026 14:39:54 +0200
Message-ID: <20260520123954.379630-3-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520123954.379630-1-milant2002@gmail.com>
References: <20260520123954.379630-1-milant2002@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_054008_157157_20A4612F 
X-CRM114-Status: GOOD (  14.42  )
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
v6 changes:
    - Fixed build errors kernel test robot noticed. 
    - Link to v5: https://lore.kernel.org/all/20260519140029.1190381-1-milant2002@gmail.com/
    
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
    
 lib/tests/string_kunit.c | 106 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 0819ace5b..d395627f7 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -881,6 +881,110 @@ static void string_bench_strrchr(struct kunit *test)
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
+			iterations = (len < 512) ? 100000ULL : 10000ULL;
+			elapsed = STRING_BENCH(iterations, memcmp, buf1, buf2 + off, len);
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
@@ -910,6 +1014,8 @@ static struct kunit_case string_test_cases[] = {
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
