Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B151EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 12:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRapQ2VrOMsv1m8rzZ5j4hs90pG37ujIMk3any2upIM=; b=EihnlnJGy4yJQs
	Jequ28EoBAC07D/c+C+CaavhepHL+3xx+JtPS6HxLSg8sIhpFzKSfdTWXIr7TXBMubQjoW+btTB6+
	CxhTJXKpdGjzq9DC1imFKnr2q6yeblGOZjRKZ33W+6VlDyDaJzkKljh7NIi2xGy21/kR3V4jdIsWu
	ijiT2d1zc2bgb7XNl9GrFF07mfLu0B1EY5Vnuz45j2sCBta2wPga7sgJK3Xm5hMArUXTmsrlkMCYT
	au5WMDpO7AMKIRtG1K56oIv7FEX28D7722Z4ReL+nWKj1M6q3reUZQurGfip14E9DMBcGtygYTatN
	uDlBJIEFl7hScL3X0aYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJ74-00AYwH-2I;
	Mon, 03 Jul 2023 12:57:06 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJ70-00AYuX-2a
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 12:57:05 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fa9850bfebso45104105e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 05:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688389021; x=1690981021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDd0P6Z6Y37kRPaqqHaNAC3kQrjxk6Pu8HaK2zooeKg=;
        b=Sphcz5qq3+buhzDZsZI3W4+b4HigOS5WU6NMwnUZs/kQbxA9PrbT3K+5o0p+1ABhil
         HZO2QoS68J/YmOLK5ud3i4DoQp3AMTM6ENbWuC5bwUi/1iBU4Y7Thgw0OpAcSzia3XxW
         7ItXaRtwC4HMKc98rtOe9L0V9SB0/dx1QQxnKIUPI8IngESdeojydIjryy66+xXmuhzc
         ipRs+hTSO4xt7oghX+frCZ6A4RWNmu6JY+Hu8WATZZCJX9xr7YrtzPbTUOzLthmSKHpS
         ZCGbCIxrnPm7pyUceyeOfFItc/CioLz+WWoy7ghuQL0R8TiNKRjrg+yuNZ8zvmejwvLm
         Efow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688389021; x=1690981021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDd0P6Z6Y37kRPaqqHaNAC3kQrjxk6Pu8HaK2zooeKg=;
        b=CoWCvRCFNCd9g6M7dUQEaSptcbxG6g4Jq41Z+/Ar+KF0XINdah9sU8B1qyaqGi6G37
         JhE28N+ZL1piOlLhK3MMJ/7oMuYnhUP4c3mzFb/7M2p9SussiPrwaEAIqkzuK4isijBm
         q/I+HkongiZWOsbANrX+dt2wVnOI+wQNohzBWxVKVhgkYBe805/wwxAsA1/qLQiHdDpb
         X2++0TKtJWhT7bmSjPiuVjBsvi/FEdSbNKNj/9ZHbycZiHg8J+nWtgH8LQaRlzU9oOgD
         RcTtpJS8PjDkmowjte8tBSZiWtnvY3svhROyi/AlDEtK24ke7JQLFYqK6I3QZWhGY9JG
         pt2A==
X-Gm-Message-State: AC+VfDyUIUfH95gN0lQ/Gty5WFQqXyjwHhB/BxPWJFllm/M0oz9APd6i
	TfaIRnFh917oUOPyJbXAkqse/g==
X-Google-Smtp-Source: ACHHUZ6/fBeiAWwj87e60iBk0jsshSg/HXNuUNYk789KVMfnmQErAN4M02VvuTIO86TKRIqfowM8+g==
X-Received: by 2002:a05:600c:2049:b0:3f9:b31d:5689 with SMTP id p9-20020a05600c204900b003f9b31d5689mr7826755wmg.36.1688389021142;
        Mon, 03 Jul 2023 05:57:01 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id n20-20020a7bcbd4000000b003fb739d27aesm18799546wmi.35.2023.07.03.05.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 05:57:00 -0700 (PDT)
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
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 10/10] perf: tests: Adapt mmap-basic.c for riscv
Date: Mon,  3 Jul 2023 14:46:47 +0200
Message-Id: <20230703124647.215952-11-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703124647.215952-1-alexghiti@rivosinc.com>
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_055702_838613_B8AC73CF 
X-CRM114-Status: GOOD (  11.20  )
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
---
 tools/perf/tests/mmap-basic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
index e68ca6229756..f5075ca774f8 100644
--- a/tools/perf/tests/mmap-basic.c
+++ b/tools/perf/tests/mmap-basic.c
@@ -284,7 +284,7 @@ static struct test_case tests__basic_mmap[] = {
 			 "permissions"),
 	TEST_CASE_REASON("User space counter reading of instructions",
 			 mmap_user_read_instr,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || __riscv_xlen == 64
 			 "permissions"
 #else
 			 "unsupported"
@@ -292,7 +292,7 @@ static struct test_case tests__basic_mmap[] = {
 		),
 	TEST_CASE_REASON("User space counter reading of cycles",
 			 mmap_user_read_cycles,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || __riscv_xlen == 64
 			 "permissions"
 #else
 			 "unsupported"
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
