Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D5FCA5FFC
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 16:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LGiSlpoyPLG+SUgtc8pI4nQH0XsiscKNcCT5p2p8KE=; b=ysAcsV5Gy6LCKY
	qfHcDAyPf16dkxnpFENzm2JXl6KkIh7XS1+5K8RvcaKL1uigXgvAiKBPk4D4VKnn8lJPOsaM6ISYt
	6Q9pwn/D+nbcKvaIlJsJkUdg4YZhZ74+TP8mCdvFBPNWr/Z3oJvXv4jvBDDgWav0kh6Weh4s3oA4R
	upxcUDEqZnREBGNekXI0m3J4AgydvwXtTXPhVsCKz005W2ioyyuaZ8UZRAnRL6aP4geRa/Pcnkz4r
	VNgGht9jw2YDCcrWN07lhrDjTft9JWCHclK66VqZdICHtSPP6dzUPYq8YwoDT/KzU40FeH/2MIZ7X
	tagCTkuZFrBokSApFDzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE87o-000000019UO-2w3a;
	Tue, 06 Oct 2026 16:34:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE87k-000000019T8-3RcW
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 16:34:41 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a17baef589so6108555e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 09:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791304479; x=1791909279; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRTKpE752UBxEVvsukPxz0g+FDjlA3TSMkGVEa1/WS8=;
        b=Rg6ywhh6Qq6wALYU6sV6bgvzD/4D0tIjFuCVHBRmVEaeHRCVwtdM8m54b0GP4x/ntI
         1yhzIVQD10l8mV4xYI3lEJDQ7Xt9QhzsQ4lX5ndelXGqqNP1KEAFyUoIS6kQEVsgGPe3
         VistIBq+gIvehRewiQ2JO8L6Pqoabm0aIeiHU3h8/VBVNhNlFTH9NFIP1q+zprs10UM7
         dFERRXMfuMCx11J5BsPCVFCtwILAdoR1/uIbd6as2N+0lQmsyWiCtwREfdOv40mKrN+h
         guO2D+w7Q1FrEGvLSVVHUvesnpXqlBXG/UmjAfYDJzTcHkZ5GJpOp2CUEFvcGyii3Fel
         7z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304479; x=1791909279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRTKpE752UBxEVvsukPxz0g+FDjlA3TSMkGVEa1/WS8=;
        b=qYSLobflAxlivQfqLSaXEcsYHWG2/68IUzahFQXmayyuw/x8dJe3cij2TGV8c9Cb10
         cSqLh/AiRMSaWj/oAcnYxuAFbn0SL1Cev6XGcP45FQkid5nkBDqq0BAJpa+qb1qDADkq
         msghYd6qmWJPg6jxx+AfcTytpQbUBpD/Zkd4eTVM5X6Q2UdLPdYm2RUHw3s71v6FcW/L
         8O5ZcROmb08wO1W7dCAZ9bkZkQ0lTqCY9MWeTp8LsgaWh1dtxeEDdWw7JJIv73YFby6k
         TQ66IIODzRnyZ5S7FIIY47xUk2fOhj4DmnH2TFPF6oG3QkiGo5wT52bzrauQ5P9OoRlA
         qQ4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwFT37YwhwZa52jOpijwm6y5gLV25U+WJ1an/Bdc3ZnzZPtRq9ZatjtSVxVz8zq7VqrXEwJi+quFqM7hw==@lists.infradead.org
X-Gm-Message-State: AFuF++n/BkfcegybtCGBHQew64DREjuaBNonP7Po5XzYV0w1gfoADEkG
	yl7TFqpm0NKut6h4A3aDW6pyfaoyplvO3z+M9MNxpMG/EqIIuJm5kGYHsIkLv5eUaXA=
X-Gm-Gg: AYBFou0tOEs9hBwI3Jsv3mTefscGHcrm9L0z8fgcGqmhVCGg6dkEfLuMtHKJk5z76D7
	t0gvPjzb2OWfqWEm4nFLWcPUJhnJIu7vmAW39u/NUCS32xZYVYCdpA/jh6StPafpQcygDuhJsnn
	QatFhuLd6jE4oqG4h4KFCk4I+TdKivT2KwTICJoGXMVHXZ8EzHoiT5XUfzJfsop7G1NDo1l/8P2
	/y7aiLPMpkGv2C7Mh1B8lM4L4HDFlYdn4NGvB+MMYIDsPzsjOePkF/uneXfMQZ4yzo6tkrPGr07
	eNBQBD9FFHKSnUDyRdIdGwauhBKGexN8czqxg1g6MJlBs6oIjzmfQ/fX0AMU95I7MmPoSGHYcUb
	L3bdPCQjm6JG7KVPtp7x/7jNVaxfLTW2UUbDVCkS/Vw0LsJ053+gJDNM12Q9Jo78S2Ssqrd0i3L
	Me//ugD+vigwqMgas9KqN4tSXlYf2IGx7v+fLyXGYE3iHwQGQYx1AiWFAaH/gB54iX4DMtBgz+3
	ztXw3njnLWT
X-Received: by 2002:a05:600c:3b1a:b0:4a0:251f:dabd with SMTP id 5b1f17b1804b1-4a1680f17f8mr174885775e9.16.1791304479057;
        Tue, 06 Oct 2026 09:34:39 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17a0fc2e4sm78918555e9.3.2026.10.06.09.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:34:38 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 Oct 2026 17:34:12 +0100
Subject: [PATCH v5 1/2] perf tests: mmap-basic: Only test userspace reading
 on supported platforms
MIME-Version: 1.0
Message-Id: <20261006-rdpmc-detection-logic-v5-1-b25c9d49baa1@linaro.org>
References: <20261006-rdpmc-detection-logic-v5-0-b25c9d49baa1@linaro.org>
In-Reply-To: <20261006-rdpmc-detection-logic-v5-0-b25c9d49baa1@linaro.org>
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
X-CRM114-CacheID: sfid-20261006_093440_890003_68774BF8 
X-CRM114-Status: GOOD (  14.30  )
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
