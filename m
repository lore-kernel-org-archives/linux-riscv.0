Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B14C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ir6gU3avR8C86iOZJNDh9gg9Hi+b22UUftbvpvDK0T4=; b=XRMBhX6Htiod8z
	9Yxy9T5vGW5OZvjBT3aM9vgwDdIcDIwkSWECneET2cB07Uh0BLauRCwPl2QUHvludIZeoWXxEnkDu
	bWU1qMROeBUolMsjz/XZUAxZNnJGXtuSR8dgeij8e0Unnjsd4e8ZlU3NZ8dtdB4a1uLns1JrbhSla
	KUPZvQrz+2KX1Q9WpZnan52ANDpKua9bUKVX5i6DBLwffJggNyDwUlRj33AdxV+JP9TqNI7/Et7Qj
	vcvN7JJTFNdNyJxwNQSHKCFKwPegrnVX6luwUARsU6rJScztadCDLAXRQ8NZ0kMh7CZSFCCnOzJCI
	MBQ9pSAutZcQLPf+IHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ej6-00GcU6-4r; Tue, 05 Jul 2022 09:20:12 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8eik-00GcGC-Rn
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 09:19:52 +0000
Received: by mail-pl1-x62a.google.com with SMTP id z1so4705438plb.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 02:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2HblNoq4ry1fuefQI4LMCZ1P+uAb2OLT67Tkqkx39qc=;
        b=mIHkD0cb0SUnRvk4YyT/znUupRHg9Ps/NOsLdcrQBcVFRi60ay0YWqFuiJ3nEiU2lu
         GJu8bN42gJ75BQ32rAffXLtWYG7Nn8HhQ3+5zjQTAKf8qp/ZY81+bwxLuABlGO6GUGRE
         el6k7/z+/TpmYDrxOt6SDOmtpeSk3QZyufys9rdQGBLpMlPSfA7oyzDSK89t5ghV7HIm
         zXkacfnPwLKX2IKf4mvuPKoGemvYMjTTJ/mP2SBe3OXMOdR2AAse8Jw4izPhn4cUoRUY
         JGObySJtfutXVGG/gJFXCHHRwqmvTVhH4HROy5Ahx1SDhDo7T96OirVkFJmTbOqulC47
         FAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2HblNoq4ry1fuefQI4LMCZ1P+uAb2OLT67Tkqkx39qc=;
        b=XdzeIE5xlGm6NSu+T696FWXWo1iEy5dRfWMPs5DVtByFabuXv2q5rZlm/Lwh9I17PG
         EzxowQQLySRcK1cGq+dpeF1NDQAv2Ejsf6yHIAdAP8st97nxu/5+kK2wWcHzpiT01hHC
         t0MXaXc0uzTnDAqyFFI9EwcGoLGiXEF8eAyysFA8hn7IO7B4SJbd2vtLYX8bcWPaplif
         OmJ+TBz1Z9orIk2xqRuB5VrIGX1Wa9sczKQ4RCxZF0nlQT0BG5vWBDW+/Sb5DdK79Btq
         Fj+wj7OqkhEGxI9Cqc/jUEwZjEQVqKmRcSJ/b4ZlEO1faNPSauo1HMXpUbwzNf/SSn5P
         C9yg==
X-Gm-Message-State: AJIora/+GvY3R6ZjzeP0RXIQqyjt3T0VLha56aJeXchkm8yt5OtNk+Oa
	bWrIamNhwsxjjd7aunh8ltiqOg==
X-Google-Smtp-Source: AGRyM1tLmnVjoelCyWL3HIJ+JQ8REqXkGU82oDJxicpySFpGjGTW1h3HimF/HKKzAdvTl/j3a55LYA==
X-Received: by 2002:a17:90b:4a07:b0:1ef:5a15:6f6 with SMTP id kk7-20020a17090b4a0700b001ef5a1506f6mr26578843pjb.80.1657012788621;
        Tue, 05 Jul 2022 02:19:48 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n19-20020a635913000000b0040df0c9a1aasm16812472pgb.14.2022.07.05.02.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:19:47 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
To: atishp@atishpatra.org,
	atishp@rivosinc.com,
	anup@brainfault.org,
	will@kernel.org,
	mark.rutland@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: greentime.hu@sifive.com,
	Eric Lin <eric.lin@sifive.com>
Subject: [PATCH] drivers/perf: riscv_pmu: Add riscv pmu pm notifier
Date: Tue,  5 Jul 2022 17:19:20 +0800
Message-Id: <20220705091920.27432-1-eric.lin@sifive.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_021950_947316_3028851C 
X-CRM114-Status: GOOD (  19.48  )
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

Currently, when the CPU is doing suspend to ram, we don't
save pmu counter register and its content will be lost.

To ensure perf profiling is not affected by suspend to ram,
this patch is based on arm_pmu CPU_PM notifier and implements riscv
pmu pm notifier. In the pm notifier, we stop the counter and update
the counter value before suspend and start the counter after resume.

Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/perf/riscv_pmu.c       |  4 +-
 drivers/perf/riscv_pmu_sbi.c   | 81 ++++++++++++++++++++++++++++++++--
 include/linux/perf/riscv_pmu.h |  4 ++
 3 files changed, 83 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index b2b8d2074ed0..2c961839903d 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -121,7 +121,7 @@ u64 riscv_pmu_event_update(struct perf_event *event)
 	return delta;
 }
 
-static void riscv_pmu_stop(struct perf_event *event, int flags)
+void riscv_pmu_stop(struct perf_event *event, int flags)
 {
 	struct hw_perf_event *hwc = &event->hw;
 	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
@@ -175,7 +175,7 @@ int riscv_pmu_event_set_period(struct perf_event *event)
 	return overflow;
 }
 
-static void riscv_pmu_start(struct perf_event *event, int flags)
+void riscv_pmu_start(struct perf_event *event, int flags)
 {
 	struct hw_perf_event *hwc = &event->hw;
 	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index dca3537a8dcc..adc910e0f1e2 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -17,6 +17,7 @@
 #include <linux/irqdomain.h>
 #include <linux/of_irq.h>
 #include <linux/of.h>
+#include <linux/cpu_pm.h>
 
 #include <asm/sbi.h>
 #include <asm/hwcap.h>
@@ -693,6 +694,73 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 	return 0;
 }
 
+#ifdef CONFIG_CPU_PM
+static int riscv_pm_pmu_notify(struct notifier_block *b, unsigned long cmd,
+				void *v)
+{
+	struct riscv_pmu *rvpmu = container_of(b, struct riscv_pmu, riscv_pm_nb);
+	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
+	int enabled = bitmap_weight(cpuc->used_hw_ctrs, RISCV_MAX_COUNTERS);
+	struct perf_event *event;
+	int idx;
+
+	if (!enabled)
+		return NOTIFY_OK;
+
+	for (idx = 0; idx < RISCV_MAX_COUNTERS; idx++) {
+		event = cpuc->events[idx];
+		if (!event)
+			continue;
+
+		switch (cmd) {
+		case CPU_PM_ENTER:
+			/*
+			 * Stop and update the counter
+			 */
+			riscv_pmu_stop(event, PERF_EF_UPDATE);
+			break;
+		case CPU_PM_EXIT:
+		case CPU_PM_ENTER_FAILED:
+			/*
+			 * Restore and enable the counter.
+			 *
+			 * Requires RCU read locking to be functional,
+			 * wrap the call within RCU_NONIDLE to make the
+			 * RCU subsystem aware this cpu is not idle from
+			 * an RCU perspective for the riscv_pmu_start() call
+			 * duration.
+			 */
+			RCU_NONIDLE(riscv_pmu_start(event, PERF_EF_RELOAD));
+			break;
+		default:
+			break;
+		}
+	}
+
+	return NOTIFY_OK;
+}
+
+static int riscv_pm_pmu_register(struct riscv_pmu *pmu)
+{
+	pmu->riscv_pm_nb.notifier_call = riscv_pm_pmu_notify;
+	return cpu_pm_register_notifier(&pmu->riscv_pm_nb);
+}
+
+static void riscv_pm_pmu_unregister(struct riscv_pmu *pmu)
+{
+	cpu_pm_unregister_notifier(&pmu->riscv_pm_nb);
+}
+#else
+static inline int riscv_pm_pmu_register(struct riscv_pmu *pmu) { return 0; }
+static inline void riscv_pm_pmu_unregister(struct riscv_pmu *pmu) { }
+#endif
+
+static void riscv_pmu_destroy(struct riscv_pmu *pmu)
+{
+	riscv_pm_pmu_unregister(pmu);
+	cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
+}
+
 static int pmu_sbi_device_probe(struct platform_device *pdev)
 {
 	struct riscv_pmu *pmu = NULL;
@@ -733,14 +801,19 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = riscv_pm_pmu_register(pmu);
+	if (ret)
+		goto out_unregister;
+
 	ret = perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
-	if (ret) {
-		cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
-		return ret;
-	}
+	if (ret)
+		goto out_unregister;
 
 	return 0;
 
+out_unregister:
+	riscv_pmu_destroy(pmu);
+
 out_free:
 	kfree(pmu);
 	return ret;
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 46f9b6fe306e..bf66fe011fa8 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -56,9 +56,13 @@ struct riscv_pmu {
 
 	struct cpu_hw_events	__percpu *hw_events;
 	struct hlist_node	node;
+	struct notifier_block   riscv_pm_nb;
 };
 
 #define to_riscv_pmu(p) (container_of(p, struct riscv_pmu, pmu))
+
+void riscv_pmu_start(struct perf_event *event, int flags);
+void riscv_pmu_stop(struct perf_event *event, int flags);
 unsigned long riscv_pmu_ctr_read_csr(unsigned long csr);
 int riscv_pmu_event_set_period(struct perf_event *event);
 uint64_t riscv_pmu_ctr_get_width_mask(struct perf_event *event);
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
