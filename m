Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C5FC001DF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 08:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QrK0T6CM631czTQurhCcysLNi30nT02qb46RNWDhxxw=; b=v20u8YAa0gUpKr
	40oNu1mM8FHqZElYJFK0FwiJFvWKIYfoBvjUDchMzmLH4urFgGHEajOWh0YPupfYIGbX/BsKeyPto
	mjxd+Rzn/LS9+YCAr7aNnSiQ2tZ/R3VrXbQH6DfRJngX2eBgdXhLYz5F0K4SJCF36qQqplJsEFhkZ
	rIwW9VZ/4iciFbhIJXzWLLzqTEVFzwino6/3zYAfx4PWePMmTheKzyxeBOWppN0IQ/qeNJqxuB5e6
	DUfjivMwd4bgdTCfMP4v8pMjEStrjl4Hta9zlAYKcoAO9ACsqNZ3UshaNlGs2FzXtLyE7EYvVmdqu
	61wG4LE+DY0AD5HI/VTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6vv-004KtW-1r;
	Wed, 02 Aug 2023 08:10:15 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6vt-004KrY-03
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 08:10:14 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fbc63c2e84so69603205e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 01:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690963809; x=1691568609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7afbVzdz7i3XV0LSy+5KsI/iNIynDErY3gG58bPEFNo=;
        b=qifnnd1mKlQIbmFMQtnxa9WqcewBxOF1/ulkKZ0PlwvTFCAGuQxSgo1kcwBebXtHjM
         rpmSpxRKelVFPrBiLJFe6TQ/HsCgwCo4mpuiYtYIYNnDyIOebL6tMHLAyw9pigfIdHHi
         xWN6KuEvcE6ua4CybzZrL4imUKgHHO9F7J6YzHT1QIOUgi1nqmPKRxp2h0G8Sofwog8U
         gU3grY1tQXjUv6WVst3cwIliB/fUUp/K0iLvsma3syDq4RkO9KvWY5Ve6RUBV0YkrSuf
         7rRQGfdNGtkkGsEX0dcr4Wp00mu9hOiOsCxFOWmXWX6hTlpNnA8n4hoeTtME5dj7noaR
         p8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690963809; x=1691568609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7afbVzdz7i3XV0LSy+5KsI/iNIynDErY3gG58bPEFNo=;
        b=TUHNG0z7fvjlbyGSyqVpdA57vrc/EdjrrvKFUugZB9iVMtOYZksmmz3F2/sANsDHdL
         E66Vtb9mO+UJL3Jf3+13e3S6ZZsgHzujXLY8rpmbh9jZ1QVNbiXKTJVyKc840k/Ok+7n
         iqDFOLv6gMsfZ7VQQ+uCF5YkmfYAn5QW7X1SJj/EvIwCOc/q4/O7mtD1BFzvNMnI9Kx8
         HCFjh1o79uwa8qLAHpUQRQTaOmWM6b3Xd8QEkP4LR9cRS+KiJA6dCCjLHvaBda/BQzaR
         5Xnsne3S2ka9tkd4ynEdEDRC3svnv8N4N56tV720yx1pZ7RM4Tbi6ZxxLKaj/7aPagiy
         fbig==
X-Gm-Message-State: ABy/qLYm4LhyuQL6e/1sR1xFLe3I34618roCcVnRL/TW6woFOIykCzMD
	yBbkBd6/e92kTSjNiVFRdOdGqw==
X-Google-Smtp-Source: APBJJlEKKkdTF9AhlPpANXIgbR1ENnZC75oX6YWqdfd3WINkVA6hfQ7Vkr1i/Nh2jbZi+6ixrXiGYg==
X-Received: by 2002:a7b:c855:0:b0:3fc:616:b0db with SMTP id c21-20020a7bc855000000b003fc0616b0dbmr4218529wml.9.1690963809354;
        Wed, 02 Aug 2023 01:10:09 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id w12-20020a5d404c000000b0031411b7087dsm18316163wrp.20.2023.08.02.01.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:10:09 -0700 (PDT)
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
Subject: [PATCH v6 06/10] drivers: perf: Implement perf event mmap support in the legacy backend
Date: Wed,  2 Aug 2023 10:03:24 +0200
Message-Id: <20230802080328.1213905-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802080328.1213905-1-alexghiti@rivosinc.com>
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_011013_052652_3AF7BD90 
X-CRM114-Status: GOOD (  12.66  )
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

Implement the needed callbacks in the legacy driver so that we can
directly access the counters through perf in userspace.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_legacy.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index 6a000abc28bb..79fdd667922e 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -71,6 +71,29 @@ static void pmu_legacy_ctr_start(struct perf_event *event, u64 ival)
 	local64_set(&hwc->prev_count, initial_val);
 }
 
+static uint8_t pmu_legacy_csr_index(struct perf_event *event)
+{
+	return event->hw.idx;
+}
+
+static void pmu_legacy_event_mapped(struct perf_event *event, struct mm_struct *mm)
+{
+	if (event->attr.config != PERF_COUNT_HW_CPU_CYCLES &&
+	    event->attr.config != PERF_COUNT_HW_INSTRUCTIONS)
+		return;
+
+	event->hw.flags |= PERF_EVENT_FLAG_USER_READ_CNT;
+}
+
+static void pmu_legacy_event_unmapped(struct perf_event *event, struct mm_struct *mm)
+{
+	if (event->attr.config != PERF_COUNT_HW_CPU_CYCLES &&
+	    event->attr.config != PERF_COUNT_HW_INSTRUCTIONS)
+		return;
+
+	event->hw.flags &= ~PERF_EVENT_FLAG_USER_READ_CNT;
+}
+
 /*
  * This is just a simple implementation to allow legacy implementations
  * compatible with new RISC-V PMU driver framework.
@@ -91,6 +114,9 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
 	pmu->ctr_get_width = NULL;
 	pmu->ctr_clear_idx = NULL;
 	pmu->ctr_read = pmu_legacy_read_ctr;
+	pmu->event_mapped = pmu_legacy_event_mapped;
+	pmu->event_unmapped = pmu_legacy_event_unmapped;
+	pmu->csr_index = pmu_legacy_csr_index;
 
 	perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
