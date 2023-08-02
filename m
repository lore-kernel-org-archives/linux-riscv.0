Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4145C00528
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 08:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S39Qu0xQGApbdxirLc5/bsgBznehg746vSvdErjl/RM=; b=yNv6wIQH3GaHvu
	rNcqhaM6jrbQlBSgwVM3uuBJaNDgCanoNkCMDNNqH5Z559pbceck9tDsf8n2FmdqmPSWyPT1ygp9b
	aSZgFp3OsqySKdXu3FTTaUW+AT2A9RYyWcJagboP9ZXAqSXSqQMkToBw2CNLFPucYtiNkJFESe2UM
	iM6lmiaLK/gYmR2RmLpBNvqtausjTiaTf9gxvIuX1DnVrGGHpdNq7BAq0vAyaRtk684vIeNDZdXog
	EzJqmkJPvOcuO1EDE76L+vXiDUQ6bkvBUxTY400/IIn5S8k2R4ag33Hc/FfcOHmE9F38OZtRA6GT2
	O/VUfPIHH3rfaqoWxL/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6zr-004LfW-1h;
	Wed, 02 Aug 2023 08:14:19 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6zn-004LeL-2e
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 08:14:17 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbc12181b6so69946245e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 01:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690964054; x=1691568854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjQVCQzw/foc3dsQkAiySfY58yT/va7beD4yh0w30/c=;
        b=LVFQ2dZGP21fC/kUACk7CYGiwQnTmTdEMNpsVOwilpWSU+otD0Tl3tdGDllj7tXr1W
         jhKu7YfUMIsWFCxb+4ETnF5P6/3sgg3A8MZYT7Q9MQPJDOZDjk8/0XpWOjlQJpGFGSxn
         rcYkG6fylsTc+/K5y38AtKdbl/emEf0U9Jzni7oIVRNeq4OSYQnuEaK3bZU/4qMEESW0
         PwrTdMeseO38VBX2C4ycjFvlxVegWLgWpMQkROEpwdsUzl2Yrhzufa8Oc76mYFKCFdwo
         +7al1faTYq/Z4RNiHU+SgKQQJVzCV2A97XGxIZam5EIhhXwTzkvb71s8vWM97pDy60+Y
         t09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690964054; x=1691568854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjQVCQzw/foc3dsQkAiySfY58yT/va7beD4yh0w30/c=;
        b=fByNMLY70wwQGIp02nOWH4KQ3UhUXGri8z4Mv53VaN79RPUtTpR1F4+A87yqeAs2i/
         c++t8s/Ms/CMgOKU/1PYpUxkdDWDOLMM2qN4FDOjgCOtoIHUWKZZmsZ7AWYV+6YegHiK
         ax0BznWMn9/syCj1/k32uTZRKgAf0H5SZLPg8WPKebhwKeohrCJoN1sQ3uTdP2b3NwpG
         QMy2DBeaJtZhibSbHkmNFObKGP6kAPhIf5Eoj5DUiWHsLQ/ed07l7fBarAdsiOfltFFm
         ANnuTA4rdrexmhiJE0Jo8CQQAaI4k4XI33CjtRPZW8r/GnHa3aOWomgg+AO7M2KB3qjs
         VLyA==
X-Gm-Message-State: ABy/qLYWl0DlyPqx5oj3HmB0wdKrfLq2GxB2DJxMueJjHaVI9lvShBOE
	hpEFNJrdoYUNk/nY6B8R4mZ8eA==
X-Google-Smtp-Source: APBJJlErLwgoDP8iDix/tr5UDLAhtyf8g2R724EpAdETX/89BVYhEkQwSGG2X1rV+vouEBYxHEJVHg==
X-Received: by 2002:a05:600c:214d:b0:3fe:20b6:41b2 with SMTP id v13-20020a05600c214d00b003fe20b641b2mr4228012wml.4.1690964054306;
        Wed, 02 Aug 2023 01:14:14 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003fe2f3a89d4sm1040419wmc.7.2023.08.02.01.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:14:14 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v6 10/10] perf: tests: Adapt mmap-basic.c for riscv
Date: Wed,  2 Aug 2023 10:03:28 +0200
Message-Id: <20230802080328.1213905-11-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802080328.1213905-1-alexghiti@rivosinc.com>
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_011415_857248_4D8CA22E 
X-CRM114-Status: GOOD (  10.91  )
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

riscv now supports mmaping hardware counters to userspace so adapt the test
to run on this architecture.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/tests/mmap-basic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
index e68ca6229756..886a13a77a16 100644
--- a/tools/perf/tests/mmap-basic.c
+++ b/tools/perf/tests/mmap-basic.c
@@ -284,7 +284,8 @@ static struct test_case tests__basic_mmap[] = {
 			 "permissions"),
 	TEST_CASE_REASON("User space counter reading of instructions",
 			 mmap_user_read_instr,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
+			 (defined(__riscv) && __riscv_xlen == 64)
 			 "permissions"
 #else
 			 "unsupported"
@@ -292,7 +293,8 @@ static struct test_case tests__basic_mmap[] = {
 		),
 	TEST_CASE_REASON("User space counter reading of cycles",
 			 mmap_user_read_cycles,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
+			 (defined(__riscv) && __riscv_xlen == 64)
 			 "permissions"
 #else
 			 "unsupported"
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
