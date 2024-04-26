Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAF4C10F15
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 23:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4PXd2QByOobhZusg5zzcyttBi4SvVu/LdxSvNIi1JWk=; b=gidF/08MwRPP9f
	lB1BWoPI5fuH4vK7+y9hE9yn5zRnChmP5upTiDes0kzzQ1TT1H7JYaQyhGSpGFZXMZL0vb/TVST55
	WbE+LYlZ479dsNZd6xrsF7plJNeqP/N+Cxom8d2jmXVSfz4xlL0KxmZe8Yw3ok99nvoA6GEWMFS9l
	2ztIK75Z/L8GSDujEcviDDT5DWb0sw12bHb4d986CrAwEiEY3OpmhpM+U8IquyeXt4VVMExpah7A6
	P1n5q/Kk6wGclzYF9FO9bLCS4/P6WnfPAtW5ZrdXQYnmVB2Hq65HLbTWyblhaWCh+utbIR+8JgR1e
	k5w4eBHBH2Ma6kkHl9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s08pT-0000000Ae4p-0XsP;
	Thu, 25 Apr 2024 23:48:39 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s08pK-0000000Adye-2kDi
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 23:48:33 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1e4266673bbso14076995ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 16:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714088903; x=1714693703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZ7DvnuhtpSAdZVzlWSG9HvYdyHUjrzZHHo/ISn+uFM=;
        b=zENQztGZkeT0cjuIFYlyQUaI9aiupZ8JJoPyiKsjSyN+aBr7kiHjSU+8VLzt2/Fulx
         RsIw7uwIQ9eoS41rQQf88jAdXGZx/k5kHYlw40K9DzIpxg3+7rDn0FcHOUlqo50P1AHi
         IpVLtsmjNbQzfQQzisFvb09XmrIgRbYkfxDqDUju0ipxq38kNat6ten6l1qFB8/S++lO
         Ja/6fm6KEUu0T4q8fbPyi5zkk+d27kcBX2lF+Han3cQ68Yy2tDeLtABlQ6EWg560o89M
         egdxeAnyio4LsINWqDmZE+gwRUNfnv+6TwYSxRuUH5b4+B40uD6e2ks9ntHO8Ra/lVBe
         PeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714088903; x=1714693703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZ7DvnuhtpSAdZVzlWSG9HvYdyHUjrzZHHo/ISn+uFM=;
        b=I6lDHuAV8di4ukZafVgCB1wB2Sf5Rok7p1M4syC1RNBnbMH0SQSgrxPjB6ec8l5LzN
         aRpuNbW1QzO68R7YpWoBaNhJCLffiADBgq9vOjYiJgP/2uzKjwfz+S31qbAeaVuDphrw
         npFU/Ll8Zm61G/DvsR0vHLt0s6PzXKiBt8qdrnwHPf2bPZJ5TPcojv3mNG8fPaflSDwS
         WESeQNiLoTRfx/Ryc2qIl00AHPau4In2qTWWmJNRMrTYLIzflpTKqc2jbZGFcBheZPJC
         L5+T5hLyaRbi6lwXJAYubecklNHz/Jrup8FsbLHf/no4vsAOCAhJK9nUYtaPGkMyP61B
         p+dw==
X-Forwarded-Encrypted: i=1; AJvYcCX/fOrN95sfzGlz+Jq5Nl7LuwDye7qGf9V7Q1V8CeSgSV9SXT0LIYprviEqiioeuUDohWXAbMpHVL0ZOUzWRSqic5WCJP71T2ASE7+iviDR
X-Gm-Message-State: AOJu0YzJhD0SAiXLf24WdesDhmkvan4rgLRke1KZI9QesoMq8xdlVvfR
	TRGrBFPwuRh5PaGfvW5L62F+WFv3rEnjsV0L0gowrNmY/MpB6xKI+xE9SlGgx/4=
X-Google-Smtp-Source: AGHT+IGpkxpVvMWJQWbQvANCX7WQJuW5fyjePUy9yCGZseGfULFbWEJYzubnJIqYoSm63FBKJq95AA==
X-Received: by 2002:a17:903:1246:b0:1e4:31e9:83ba with SMTP id u6-20020a170903124600b001e431e983bamr1293736plh.1.1714088903558;
        Thu, 25 Apr 2024 16:48:23 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i17-20020a170902c95100b001e0b5eeee41sm14349281pla.38.2024.04.25.16.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 16:48:23 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 kvm-riscv/for-next 2/2] drivers/perf: riscv: Fix RV32 snapshot overflow use case
Date: Thu, 25 Apr 2024 20:16:37 -0700
Message-Id: <20240426031637.4135544-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426031637.4135544-1-atishp@rivosinc.com>
References: <20240426031637.4135544-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_164830_814689_DB8077AF 
X-CRM114-Status: GOOD (  24.13  )
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

Fixes: 22f5dac41004 ("drivers/perf: riscv: Implement SBI PMU snapshot function")

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c   | 45 +++++++++++++++++++---------------
 include/linux/perf/riscv_pmu.h |  2 ++
 2 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 2694110f1cff..5d699b06dcb6 100644
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
@@ -769,36 +770,36 @@ static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
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
+			for_each_set_bit(idx, &cpu_hw_evt->used_hw_ctrs[i], BITS_PER_LONG)
+				cpu_hw_evt->snapshot_cval_shcopy[i * BITS_PER_LONG + idx] =
+							sdata->ctr_values[idx];
 			/* Save the overflow mask to avoid clobbering */
-			if (BIT(i) & sdata->ctr_overflow_mask)
-				temp_ctr_overflow_mask |= BIT(i + i * BITS_PER_LONG);
+			temp_ctr_overflow_mask |= sdata->ctr_overflow_mask << (i * BITS_PER_LONG);
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
 
@@ -850,7 +851,7 @@ static inline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_hw_evt,
 static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_evt,
 						   u64 ctr_ovf_mask)
 {
-	int idx = 0;
+	int i, idx = 0;
 	struct perf_event *event;
 	unsigned long flag = SBI_PMU_START_FLAG_INIT_SNAPSHOT;
 	u64 max_period, init_val = 0;
@@ -863,7 +864,7 @@ static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_
 			hwc = &event->hw;
 			max_period = riscv_pmu_ctr_get_width_mask(event);
 			init_val = local64_read(&hwc->prev_count) & max_period;
-			sdata->ctr_values[idx] = init_val;
+			cpu_hw_evt->snapshot_cval_shcopy[idx] = init_val;
 		}
 		/*
 		 * We do not need to update the non-overflow counters the previous
@@ -871,10 +872,14 @@ static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_
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
 
@@ -898,7 +903,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
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
