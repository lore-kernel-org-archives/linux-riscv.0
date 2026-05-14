Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD7FCD4F3E
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 12:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOkoQuWnL6KNdiOYdkEJ4A8ArfuX7p6QG1L5uKab4Gc=; b=bORueMvhL1Umbm
	xMkSfDE6FUo+dx6pObfMSF9RUS1DHIki5Ud9SxLt2q+frx3eFgPriWjWOwwXpdTQzz+HguS1sjYP/
	3YZSRBDIWECS72GnwqO4/CaDK/A65k+cVgJ2My8ToNT9tAgyohlbS0WDVikGWLZhJgWKFSsXOy2Qf
	IqO8cyXqo8Ri8KpyGQiyALJ9Lu8TDS6d6smxzGXh3F+Dczdz4AiICpRoV/uDBrJYQUNHDRWM5YPKN
	/TPM4s0aAkD7+Gov1hk1swjQryXziC7DVyy1rI8jaduPqzIlN2qOkcQjO51UCIfUycnQxAQjz/5pu
	J3z+ESRhJ3TF6V6nqotg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUxO-00000005QTH-2qAh;
	Thu, 14 May 2026 12:14:26 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUxL-00000005QRk-1MBL
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 12:14:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488ad135063so64539715e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 May 2026 05:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778760861; x=1779365661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRooYCCfpJIXVfO+TbuD+FrPZ3PAKdcOterQ+HA71Ww=;
        b=Sac+Z5WrNcq8zQ1WVatW98G1euZSdpvvzI72jwJoE/HsySTXCjg/YvUAn4VRX9B6xr
         QGR4oqyCzMcqddBXpCA9P7JFaEd2FJiMSl+JCSVuhxdZzlhq266vG6xOz5W661drb+Hz
         1ntbnc7RintU5xirYYxPbIINocXyLU6in0ceBxVeapwiIkRyX9Gyy0eilXiRYubk+7Lh
         elkEsH9ZOUsk9eK1oGGbx0oaRSxRiG6nS8GZh6iv6mOk3BGN9bg+ugEQ/vU+ng8mRIlK
         VOzfx5nFfq/LGXS9s+OjKOmH4l8e6Tpg1pGmaXcSTeDN9656OVi8fO+3c5RSvWMnUti1
         qRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778760861; x=1779365661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VRooYCCfpJIXVfO+TbuD+FrPZ3PAKdcOterQ+HA71Ww=;
        b=oIl2gD2m9hgvGpp+WLZlC5mbJOpr30NmgP9xDKvFkNcWP7SUEOPlpDr4sl3KaywQPN
         4t1ejOK/3LG8LVHdNCfsomKx8i7RIF72bTTLS86jqF6thYqM7TsqMP9/sNV6wMAfKR+B
         xLgzcJv/BDDBzlkyPPnAuChakn+yE2titJ6JhPL77C2cyT8J+2OoYawwAv2Gfz+trv7D
         0dafhgIbrXmfnB96FlhaLD81iLAJFPyrDX+z8/gduIpvNSehnch3pzWvGAH9auxGH4lb
         +PUoq49lAipZ2AY7dCn3Cg2MuWGs4eOyJrHyJDoj3Ysu2VfEEhjxlKzldyh7Ss7YEu0+
         BonQ==
X-Forwarded-Encrypted: i=1; AFNElJ90jAwhZ3DddgHTzz14uBJMOdOp2zPqoaVAbSlgCh+JSmtdzoa7K90ZpF7b9nr202U2FiWSkENGJ1RzeA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxP22EkDYRQ1jOnm7Za2PEgdytkRfGtgKdGjR4SyEyvccQUCF8S
	29JtYtU18qopjoezF1G2Qu72mm2pxRfjz8yfxORmK0JntKj/jjAyNNPI
X-Gm-Gg: Acq92OGhSQjXwbabRwExLtBxFgR49gJ19RBvxRouF7NH6ub8tue3a9/q4aZn+XrVinO
	s0FRR9PpI/VX+zu7kO5sbrTI6Lk12OoNZTo01N6tYD9m1phy/1VJp9NPdb0HW/jPGPQKZRSrEeH
	FavwQAZzBlPDnnGvAj7NgymcwdtpT8RDw3Hgf0hlEc3AiccMc8qZI9f1uZuumFu+S0rHQ9QSuVm
	JOkVga60OHY7zkV5lpKdH90TMzC4/I0d+hcvKpjOcRf7AgeTjBF7LNLonFZ8bE3UrvAS9gxMpZg
	h8iv8gmYdK97kGyYimu9xdo1Mn3ZKbynAWudCSkhy9wncAiB7ablA1eKHLjJ7mUd9bjbPC67U6v
	Gl6EzAso/E3KVjvGxw9m8LLMyhfjB749sWQVlPEctWWQiWZNcatWsiQrHJ1UmmrKBXdZ2OztYQt
	afyefLwdWnSa9y0wf6aNIykGgk8pkU5UCPVA3ANIgtYxSmiQkysBFHPojut/5QPZA=
X-Received: by 2002:a05:600c:45c8:b0:48d:35e:84a0 with SMTP id 5b1f17b1804b1-48fcea151fbmr104364665e9.28.1778760861344;
        Thu, 14 May 2026 05:14:21 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([77.243.27.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767cb9sm6285630f8f.2.2026.05.14.05.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 05:14:20 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev,
	Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 2/2] lib/string_kunit: extend benchmarks and unit test to memcmp()
Date: Thu, 14 May 2026 14:13:58 +0200
Message-ID: <20260514121359.931999-3-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514121359.931999-1-milant2002@gmail.com>
References: <20260514121359.931999-1-milant2002@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_051423_387776_57960B2B 
X-CRM114-Status: GOOD (  13.01  )
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

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605140827.Qg1DZpcB-lkp@intel.com/
Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
---
 lib/tests/string_kunit.c | 106 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 0819ace5b027..d0bad40a719a 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -881,6 +881,110 @@ static void string_bench_strrchr(struct kunit *test)
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
+						    "Should be equal: i:%d j:%d len:%d", i, j, len);
+				for (k = 0; k < len; k++) {
+					memset(buf1, 'A', buf_size);
+					memset(buf2, 'A', buf_size);
+					buf2[j + k] = 'B';
+					int res = memcmp(buf1 + i, buf2 + j, len);
+
+					KUNIT_EXPECT_NE_MSG(test, res, 0,
+							    "Should detect difference at k:%d (i:%d j:%d len:%d)",
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
+
+#if IS_ENABLED(CONFIG_STRING_KUNIT_BENCH)
+static void string_bench_memcmp(struct kunit *test)
+{
+	char *buf1, *buf2;
+	size_t lengths[] = { 1, 7, 8, 16, 32, 64, 128, 512, 1024, 4096};
+	int offsets[] = {0, 1, 3, 7};
+	const size_t max_len = 4096 + 64;
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
+		(void)memcmp(buf1, buf2, 4096);
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
+				(void)memcmp(p1, p2, len);
+				barrier();
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
+#else
+static void string_bench_memcmp(struct kunit *test)
+{
+	kunit_skip(test, "not enabled");
+}
+#endif
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
