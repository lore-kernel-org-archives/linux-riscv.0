Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB24C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 19:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V21zcZELXwNB4zrxujcIbRRkWQ5J6ob/8GPvqrxy5sE=; b=ewDpknR3959KfF
	A2YCaXkPJn5yfgWUjAZxfiMQNZ2F0Gi9tJIJfP7+ru3IRC8C+4EDKZz1nprMe1JG3430o87k5b/qw
	1URReauoi/z1vfTQQJ0KeMUvnzHmN4+snjwlIny832Clbhx8vzE0gWaiHvBbkHaPtEBwKtJomgDbR
	7i5vfmjwKKQYDf+Atsw5wb3Ra3uvOP0hryLTW7u12PwOp+FP/aoBqLmxY8adhqVTeWeNCowRcmXuY
	4SBF+bsHpvHLzM6wifkrRY5w+3mxLo9rAsJc5NUXtBraccM5SkoGfiEZwhw7hoD6P6GD7GMURhRuA
	8SLAAybSlUzjf92jKIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s04wv-00000009uzL-1CJ4;
	Thu, 25 Apr 2024 19:40:05 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s04wo-00000009uxH-3obN
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 19:40:00 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6ed627829e6so1673999b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 12:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714073998; x=1714678798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuEzACDgvxR/jlPdG6IpUjcsXiIpoPyyUaqA1tLQdL8=;
        b=DLb/zUHW7HiYaNpXTiLvLxlPTcR79IHszBI8FzZ30CRvh6HuCljtmNqRM7X3/HNLBT
         ttyN7jHVb5WY4+3Hglf/6NVUDhXXqZ/yRKiHq5gpWO6YEtpZUR6OuAYA1/ucBP8oOumO
         gJiIiP6+XWb1u9fJYWSltPeAUds/kU1bk75YtXEt6DAgXsGk7A/l1S1s8TnZ5VscROEp
         bxCSZOVzU4Qdnl/kkygK+2+CX28O3VlIVVh0Yyd75Cs24+c8cE73e2PW+jSIb0Rx53Sh
         tn5WBnmPnDgs9K98KJ8h0fDpWgXHJtCN3vGiHO6cPfmvqcdKNlsTwKPMdaA2AqaJ0zT2
         DB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714073998; x=1714678798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FuEzACDgvxR/jlPdG6IpUjcsXiIpoPyyUaqA1tLQdL8=;
        b=wcp/oKB0VJtAWC7ZDd0cIgdSoJmA4DQvLMQDHWlcZlP2aJdjfaQvN4M6caIX7xARlE
         w3e9TP+pUYsc8irHpZ6UHW5aH2vV1TYhdXaa+9d2suUxvY+8Ae3PLLtyY8xggoBSZhAa
         dsv9rT2r3DlEVCP4VLkly/Ex4rWIiHWa4sQTfq6N1aG2s8Jqmn61fqGncWxF2a0ZsjAM
         s1arceq8/B6MSllz+BCl9x/lmnLZ7IYcYD3LOgWc1ycHyeRJShZAzYTBX2CGcO0CqEpR
         6RhQjolIHxBTpgabv5HoZ/SdrJMRqIFzkLBand7Uh3SVrlptPKc+I+s5KDxPZYlAmNnQ
         Khcw==
X-Forwarded-Encrypted: i=1; AJvYcCUvPGC0T2a9xGXhOHblAfTMZQmX96hZmfjlmzI79aKtyvouUlVs0UymYG3NF5hRw6gjp6jCpLa/t7evWpFoxh8U8vXkOU9CXaa63mZQbcIk
X-Gm-Message-State: AOJu0YwQs96Nu4U6LjTlxeqc1e4+/DcUZeJVZCBMDafOSISP2mH+uldx
	8rbCkr7Gei1/5su1RIAduxVp7eKduJKDECrsHgMAHvHnHkEKNsBcRp6b7VPkJUc=
X-Google-Smtp-Source: AGHT+IHWwmGuvBVQMoylwvzXz3CnnNRk0Jt2cal/7gbWtOpzPMnzFmO8NffRKGYa6qFriuIqRhnFMA==
X-Received: by 2002:a05:6a20:dc95:b0:1aa:9595:4261 with SMTP id ky21-20020a056a20dc9500b001aa95954261mr722289pzb.22.1714073998176;
        Thu, 25 Apr 2024 12:39:58 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fk12-20020a056a003a8c00b006e6a684a6ddsm13525487pfb.220.2024.04.25.12.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 12:39:57 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [kvm-riscv/for-next 2/2] drivers/perf: riscv: Fix RV32 snapshot overflow use case
Date: Thu, 25 Apr 2024 16:29:32 -0700
Message-Id: <20240425232933.4111680-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425232933.4111680-1-atishp@rivosinc.com>
References: <20240425232933.4111680-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_123958_990663_8993D6C2 
X-CRM114-Status: GOOD (  24.21  )
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

The shadow copy alogirthm is implemented incorrectly. This patch fixes
the behavior by keeping a per cpu shadow copy of the counter values to
avoid clobbering for the cases where system more than XLEN counters and
the overflown counter index are beyond XLEN. This issue can only be
observed only in RV32 if an SBI implementation assigns logical counters
ids greater than XLEN or firmware counter overflow is supported in the
future.

Fixes : commit 22f5dac41004d ("drivers/perf: riscv: Implement SBI PMU snapshot function")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c   | 49 +++++++++++++++++++---------------
 include/linux/perf/riscv_pmu.h |  2 ++
 2 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 2694110f1cff..98aaeb13e9db 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -588,6 +588,7 @@ static int pmu_sbi_snapshot_setup(struct riscv_pmu *pmu, int cpu)
 		return sbi_err_map_linux_errno(ret.error);
 	}
 
+	memset(cpu_hw_evt->snapshot_cval_shcopy, 0, sizeof(u64) * RISCV_MAX_COUNTERS);
 	cpu_hw_evt->snapshot_set_done = true;
 
 	return 0;
@@ -605,7 +606,7 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
 	union sbi_pmu_ctr_info info = pmu_ctr_list[idx];
 
 	/* Read the value from the shared memory directly only if counter is stopped */
-	if (sbi_pmu_snapshot_available() & (hwc->state & PERF_HES_STOPPED)) {
+	if (sbi_pmu_snapshot_available() && (hwc->state & PERF_HES_STOPPED)) {
 		val = sdata->ctr_values[idx];
 		return val;
 	}
@@ -769,36 +770,38 @@ static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
 	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
 	struct riscv_pmu_snapshot_data *sdata = cpu_hw_evt->snapshot_addr;
 	unsigned long flag = 0;
-	int i;
+	int i, idx;
 	struct sbiret ret;
-	unsigned long temp_ctr_values[64] = {0};
-	unsigned long ctr_val, temp_ctr_overflow_mask = 0;
+	u64 temp_ctr_overflow_mask = 0;
 
 	if (sbi_pmu_snapshot_available())
 		flag = SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT;
 
+	/* Reset the shadow copy to avoid save/restore any value from previous overflow */
+	memset(cpu_hw_evt->snapshot_cval_shcopy, 0, sizeof(u64) * RISCV_MAX_COUNTERS);
+
 	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
 		/* No need to check the error here as we can't do anything about the error */
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, i * BITS_PER_LONG,
 				cpu_hw_evt->used_hw_ctrs[i], flag, 0, 0, 0);
 		if (!ret.error && sbi_pmu_snapshot_available()) {
 			/* Save the counter values to avoid clobbering */
-			temp_ctr_values[i * BITS_PER_LONG + i] = sdata->ctr_values[i];
-			/* Save the overflow mask to avoid clobbering */
-			if (BIT(i) & sdata->ctr_overflow_mask)
-				temp_ctr_overflow_mask |= BIT(i + i * BITS_PER_LONG);
+			for_each_set_bit(idx, &cpu_hw_evt->used_hw_ctrs[i], BITS_PER_LONG) {
+				cpu_hw_evt->snapshot_cval_shcopy[i * BITS_PER_LONG + idx] =
+							sdata->ctr_values[idx];
+				/* Save the overflow mask to avoid clobbering */
+				if (BIT(idx) & sdata->ctr_overflow_mask)
+					temp_ctr_overflow_mask |= BIT(idx + i * BITS_PER_LONG);
+			}
 		}
 	}
 
-	/* Restore the counter values to the shared memory */
+	/* Restore the counter values to the shared memory for used hw counters */
 	if (sbi_pmu_snapshot_available()) {
-		for (i = 0; i < 64; i++) {
-			ctr_val = temp_ctr_values[i];
-			if (ctr_val)
-				sdata->ctr_values[i] = ctr_val;
-			if (temp_ctr_overflow_mask)
-				sdata->ctr_overflow_mask = temp_ctr_overflow_mask;
-		}
+		for_each_set_bit(idx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS)
+			sdata->ctr_values[idx] = cpu_hw_evt->snapshot_cval_shcopy[idx];
+		if (temp_ctr_overflow_mask)
+			sdata->ctr_overflow_mask = temp_ctr_overflow_mask;
 	}
 }
 
@@ -850,7 +853,7 @@ static inline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_hw_evt,
 static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_evt,
 						   u64 ctr_ovf_mask)
 {
-	int idx = 0;
+	int i, idx = 0;
 	struct perf_event *event;
 	unsigned long flag = SBI_PMU_START_FLAG_INIT_SNAPSHOT;
 	u64 max_period, init_val = 0;
@@ -863,7 +866,7 @@ static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_
 			hwc = &event->hw;
 			max_period = riscv_pmu_ctr_get_width_mask(event);
 			init_val = local64_read(&hwc->prev_count) & max_period;
-			sdata->ctr_values[idx] = init_val;
+			cpu_hw_evt->snapshot_cval_shcopy[idx] = init_val;
 		}
 		/*
 		 * We do not need to update the non-overflow counters the previous
@@ -871,10 +874,14 @@ static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_
 		 */
 	}
 
-	for (idx = 0; idx < BITS_TO_LONGS(RISCV_MAX_COUNTERS); idx++) {
+	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
+		/* Restore the counter values to relative indices for used hw counters */
+		for_each_set_bit(idx, &cpu_hw_evt->used_hw_ctrs[i], BITS_PER_LONG)
+			sdata->ctr_values[idx] =
+					cpu_hw_evt->snapshot_cval_shcopy[idx + i * BITS_PER_LONG];
 		/* Start all the counters in a single shot */
 		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx * BITS_PER_LONG,
-			  cpu_hw_evt->used_hw_ctrs[idx], flag, 0, 0, 0);
+			  cpu_hw_evt->used_hw_ctrs[i], flag, 0, 0, 0);
 	}
 }
 
@@ -898,7 +905,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	int lidx, hidx, fidx;
 	struct riscv_pmu *pmu;
 	struct perf_event *event;
-	unsigned long overflow;
+	u64 overflow;
 	u64 overflowed_ctrs = 0;
 	struct cpu_hw_events *cpu_hw_evt = dev;
 	u64 start_clock = sched_clock();
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index c3fa90970042..701974639ff2 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -45,6 +45,8 @@ struct cpu_hw_events {
 	phys_addr_t snapshot_addr_phys;
 	/* Boolean flag to indicate setup is already done */
 	bool snapshot_set_done;
+	/* A shadow copy of the counter values to avoid clobbering during multiple SBI calls */
+	u64 snapshot_cval_shcopy[RISCV_MAX_COUNTERS];
 };
 
 struct riscv_pmu {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
