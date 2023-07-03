Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29816EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 12:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+s68XCbt1J1h6ZnhWiiZTS74NePi1C9CLMyZJFHRXuU=; b=K7FhoY8njJMKPZ
	LpYcb3WPWQn8isvnhH/LsKq3+56cw5vvXfpiPwDzoKLyJ6GwlnHLczBAQPB+N1a7OPLqoEowxo5T0
	Ia+5jZJ23IjcRpzTyNU/5kWjIgCPTRVjMy/qst6Pwf/0CXadjBlONjBJYOIzLx3AG7ohJlixlnFMc
	OAJjslEAtkM6OvDkQjlN+uGCQhOt2L+2vUzXTeIgnRi3V1n9udp3fCbTMPgd2lkd8mSKl0ZGrhW8S
	xF2XivPxY+urx461HEKxs62UYSEs79amJC8a1QZruRtmTJYesDuZk+nQbeEvVG4MQie1/Q6No2S5I
	yvESTs01CKJuWUaxPVyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJ3A-00AY0P-2Z;
	Mon, 03 Jul 2023 12:53:04 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJ36-00AXy8-1J
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 12:53:02 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so30336275e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 05:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688388776; x=1690980776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvJvx6RMtbDuAT1323RkBbGas4rmn6vZDZsiVVfiSsE=;
        b=PA+jkEZCdU8bP2asSDqM7jl8NBccZT3rOEByYZxW/9b3uvGCB0ZWF4YffiSuyw0990
         vxeUWOiKn5NZ2SVNEz6EHwjQqlFga+PervFhkiLs/yYBlzOqy6ohMdkmYuOmUOHWHVvL
         HB7e2yX6KT/y7WWc9ruJqcV7/nvPeWmNNlhHMIkMszBp5a7xVRL0Ge3ALhlhKRHBAXlt
         ysEOkjQaWciE5gpg3F1VYBVLsMACoeQmBxPbQLjRJOcozzgDv9fmHEy22M+9eX4YIfI+
         +7qc3lRX+dQNpdt+ihDhL/UV/JvIGHFO3rAJbfJdR3p2KWrmvV7OC883mPT7uROnN5nY
         IGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688388776; x=1690980776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvJvx6RMtbDuAT1323RkBbGas4rmn6vZDZsiVVfiSsE=;
        b=WYHlAtISNOm2D/o5edfXSdjef1OFM/AJ/BogDG6JQIMjGcouXPZjy1pz1eKKj8R/R2
         d7RZ16EnQB2q7OXdCfymKPXBfhRK9HKiKf/iLq+bKss5HrRHtwBEH7+Ov+hGMmVbexV7
         bVWRh2nQeNM/p1Ied95TdeGng54fCKRPRi7kNIw6+DQISxspUiW//0dPxwZe5bo7pAM7
         0nxUVt8VAxMz+8A69yjUQQtnxM8jZIeeRy+RNz+hz7qtP4iMAgXJTLHFLgt5QSlowMoo
         06KgHBbkFzidekA3ZIszL3jsxpBbJdHgxL2MvaCQVLjmP6KNI9VLocHLXep4InZamrqo
         DTBg==
X-Gm-Message-State: AC+VfDxk6vBd+DaNx4qL97ZoVjkFIhRsQS0fchX3Ek0N/w9ebwE3rftd
	w1ddQoWW+SnQb9wr83yy23oO6w==
X-Google-Smtp-Source: ACHHUZ5HA8KDH2QJSQViiIkBg1NELVnzyjafnotWcuYa2YPHjr5O+aKLbytRZh1EJVbsoaERYly4pA==
X-Received: by 2002:a7b:c445:0:b0:3fb:adc0:c37d with SMTP id l5-20020a7bc445000000b003fbadc0c37dmr13187228wmi.38.1688388776479;
        Mon, 03 Jul 2023 05:52:56 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id y17-20020a1c4b11000000b003f90a604885sm26981297wma.34.2023.07.03.05.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 05:52:56 -0700 (PDT)
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
Subject: [PATCH v4 06/10] drivers: perf: Implement perf event mmap support in the legacy backend
Date: Mon,  3 Jul 2023 14:46:43 +0200
Message-Id: <20230703124647.215952-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703124647.215952-1-alexghiti@rivosinc.com>
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_055300_447071_A2603EBA 
X-CRM114-Status: GOOD (  12.37  )
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
