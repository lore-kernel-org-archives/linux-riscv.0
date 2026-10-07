Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155F3CA5FFC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 10:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LGiSlpoyPLG+SUgtc8pI4nQH0XsiscKNcCT5p2p8KE=; b=h4+d55QXySnKL4
	CQB0xS6zBaK2AkobdX8p3AWyt/6Ik2HKvc2HE0L2mp+EGccTiBnFZZtttUQzntVGutn3yqpWDY9Pr
	kEdlyhgVKugEA/NUlsOWF3kWI3Sz1m0W7/W9yIFi1qOsF1r3N13qkbdrGjQDgJIgzq1g+QQQqLPLS
	X1WjHpXd0Yf3vUU3pRLNKmQxSvB+s2l6d56ro03QgXfRNywKKctp3cLKfP0DNJU3PxliR9heZWqz8
	+40YjeqgJyfYhL/bdisDXbT7xlg7kidmER2/tU+jKkS5plKnZYkXFO8oy/jvnVZ6nb3cRxR8lyhiQ
	6QV3jbCFv5PfBoUpPiRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPGT-00000002EZp-23ZH;
	Wed, 07 Oct 2026 10:52:49 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPGR-00000002EYB-10d2
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 10:52:48 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so3254589f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 03:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791370365; x=1791975165; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRTKpE752UBxEVvsukPxz0g+FDjlA3TSMkGVEa1/WS8=;
        b=ibQdkGvxXwZ2xkz0c3cz4aJkBoIJ03LLKkOkYlUc7ZuO2PQvvsp+QHQEkPZBnBjFoW
         P9ajvnZL3BJ+GkjUFSNoUJSklUTHtr0a2vreRaSmSMOv4U2StNW/3Pr7elX4Nua7J7sM
         ucZMoE94k+V5JaiIPpLHorR7w8h2SKaZrQpOrPZwFYzZQuc+fmOm+aN6shWqnccx84PY
         C/cpoeWF7ncMrRhentWAGYoasROsIrn+luOarOX4IutjZNpp2hPTtG37wlZvpA6MIa+e
         U3c+emzPyvRYI5MpnR7pOZQmwaJBxLiulAHiuP5sll6d4psowr2laKP5BIGozBDRZqBg
         85dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370365; x=1791975165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRTKpE752UBxEVvsukPxz0g+FDjlA3TSMkGVEa1/WS8=;
        b=NoYnMtqSSFEgChiV5/E4zPhLSmbgxlTDiazoZ4QUNXaqBpv7jx65bInYdTPs8uRIsz
         6+tuIVZENNpLJ21sWOQaoIIqX12iD5/BxAXmG0F/57LxkuEvhcjExIdc4p4sDRiIMwKR
         po8uRNMdo0AUvP1g3xS8JIxqkCutFoMVW/jKCSwK76U0hRr99bdMVTzfTj/vf2sNy8cK
         wSwNIfxPWiNL94lSZsyA9Zw0D2v4a5AAOWeJJMT07e8fTNLd4+bhPoxnfABYNRltQbjI
         4koEGD9xxAmetmAFNQIiCwpqcUQteMyP7IRCJikTle0zWwkDuTA9gfpqF+B09Aa+1Rwd
         UXWw==
X-Forwarded-Encrypted: i=1; AKwUvBxByhId93E3t4lP/IkmgpcDyHofNOXOcRa+0AUd62hXyQkk/ULVTo2/xUBzUSSpTI18c8Xrt/vqTrBmOA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIglyPRd5fTyR7iUVr5xUYoxag9uFO/jzE8aHK9CxdRF7uQ28KI
	7BPWZBdJk67yuQG2LpwDdfsjZ8Cqx9uetBrvm04wWxzIB8+TdUiigsJFc+IBVTRxpp8=
X-Gm-Gg: AYBFou3Jb23tvKtfbepqo4s4G/cSnD4FZ8WWh61wkkcbnr6dV3NKw2pHbrTYWmja0GC
	apIsRDDn4ovaB9AHCZuFntBuIfQ/6y0dAFFMaxDv/cctNhJbx//mrWOSeLqRVSoWpJYjiE/IMtR
	sNQyaYXsjhlB+TZ1ywUEX34NPYe0B3Ne+Mazm8En7Udp90KBiAwMmPm52lJIdbI4iB810tCNxp8
	Tqm9crV4ME7V7hS5PRTrQSezaLrhNWhLc9xncZZvDF1XHVrmNcx3fXylUHEbxVdSrXMpbAMa+gP
	MZ6jRvLWMSvhOkq00Kc5MC0Ldf4Xjwia41GTV5L5SOsR0ZqZv8zz2kBDKlXUqaV3vcwIXK6uqRz
	Z0mQvX9DAyp5zFO0y4dnZk/z0aukdATvBjLZSPvPBxE/cqRe4ZviIAff9ijWgmW6tKYfxN40BT+
	yIgVKXSxmp9XJOs1qdrCjvzjkEKQGCePFU5TxJCJ5IEl3L2Sf041QjCoC2dHirtbbd79Hdrh4Uw
	h+0JQpDhzIJ
X-Received: by 2002:a05:6000:46d6:b0:488:83b1:16a1 with SMTP id ffacd0b85a97d-48c727288b1mr2055193f8f.7.1791370365226;
        Wed, 07 Oct 2026 03:52:45 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d31767sm5182781f8f.51.2026.10.07.03.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:52:44 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 07 Oct 2026 11:52:12 +0100
Subject: [PATCH v6 1/2] perf tests: mmap-basic: Only test userspace reading
 on supported platforms
MIME-Version: 1.0
Message-Id: <20261007-rdpmc-detection-logic-v6-1-d7ed6a85f864@linaro.org>
References: <20261007-rdpmc-detection-logic-v6-0-d7ed6a85f864@linaro.org>
In-Reply-To: <20261007-rdpmc-detection-logic-v6-0-d7ed6a85f864@linaro.org>
To: Ian Rogers <irogers@google.com>, Michael Petlan <mpetlan@redhat.com>, 
 Qiao Zhao <qzhao@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_035247_321964_A4A31D04 
X-CRM114-Status: GOOD (  14.43  )
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

mmap_user_read_instr() and mmap_user_read_instr_disabled() are the same
test for platforms that libperf doesn't support userspace counter
reading for. Only run the 'enabled' test for platforms that do support
it in order to simplify it in the next commit and not run the same test
twice. The test can then assert stronger guarantees and have fewer edge
cases to handle as we know it only runs in places where
'rdmpc_supported' will be true.

"unsupported" hasn't been a relevant skip reason since
commit 588d22b40480 ("perf test: Expand user space event reading (rdpmc)
tests") added the UNKNOWN fallback for unsupported platforms. Remove it
and leave only "permissions".

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/mmap-basic.c | 51 ++++++++++++++++---------------------------
 1 file changed, 19 insertions(+), 32 deletions(-)

diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
index 5cec7644952c..208cd889f23d 100644
--- a/tools/perf/tests/mmap-basic.c
+++ b/tools/perf/tests/mmap-basic.c
@@ -378,13 +378,13 @@ static int test_stat_user_read(u64 event, enum user_read_state enabled)
 	return ret;
 }
 
-static int test__mmap_user_read_instr(struct test_suite *test __maybe_unused,
+static int __maybe_unused test__mmap_user_read_instr(struct test_suite *test __maybe_unused,
 				      int subtest __maybe_unused)
 {
 	return test_stat_user_read(PERF_COUNT_HW_INSTRUCTIONS, USER_READ_ENABLED);
 }
 
-static int test__mmap_user_read_cycles(struct test_suite *test __maybe_unused,
+static int __maybe_unused test__mmap_user_read_cycles(struct test_suite *test __maybe_unused,
 				       int subtest __maybe_unused)
 {
 	return test_stat_user_read(PERF_COUNT_HW_CPU_CYCLES, USER_READ_ENABLED);
@@ -406,42 +406,29 @@ static struct test_case tests__basic_mmap[] = {
 	TEST_CASE_REASON("Read samples using the mmap interface",
 			 basic_mmap,
 			 "permissions"),
-	TEST_CASE_REASON_EXCLUSIVE("User space counter reading of instructions",
-			 mmap_user_read_instr,
+
 #if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
 			 (defined(__riscv) && __riscv_xlen == 64)
-			 "permissions"
-#else
-			 "unsupported"
-#endif
-		),
+	/*
+	 * libperf only supports userspace read for these platforms, see
+	 * tools/lib/perf/mmap.c
+	 */
+	TEST_CASE_REASON_EXCLUSIVE("User space counter reading of instructions",
+				   mmap_user_read_instr,
+				   "permissions"),
 	TEST_CASE_REASON_EXCLUSIVE("User space counter reading of cycles",
-			 mmap_user_read_cycles,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
-			 (defined(__riscv) && __riscv_xlen == 64)
-			 "permissions"
-#else
-			 "unsupported"
+				   mmap_user_read_cycles,
+				   "permissions"),
 #endif
-		),
+
+	/* Counter read via userpage fallback is supported on all platforms */
 	TEST_CASE_REASON_EXCLUSIVE("User space counter disabling instructions",
-			 mmap_user_read_instr_disabled,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
-			 (defined(__riscv) && __riscv_xlen == 64)
-			 "permissions"
-#else
-			 "unsupported"
-#endif
-		),
+				   mmap_user_read_instr_disabled,
+				   "permissions"),
 	TEST_CASE_REASON_EXCLUSIVE("User space counter disabling cycles",
-			 mmap_user_read_cycles_disabled,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
-			 (defined(__riscv) && __riscv_xlen == 64)
-			 "permissions"
-#else
-			 "unsupported"
-#endif
-		),
+				   mmap_user_read_cycles_disabled,
+				   "permissions"),
+
 	{	.name = NULL, }
 };
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
