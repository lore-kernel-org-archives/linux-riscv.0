Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38D1ED7B99
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 03:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cOemrxatR8ESEIl9Sjes5h93IdZGEhLAjHBUfQ54PKM=; b=4B9GxpMhiSygfZ
	RlkZKiocBozMQCTjhcb98Np6KjOCAld4Ad2U2VoACSPbRheGNGYxobeOFmKNQ1cZtV86SQZarg6Am
	CVdfvDN8pMaBbLEEmxXfl/Sd5HbjemVTw3yikubdrqVhkDNFJEUo3oa/WUjjVg80gIDtu1i6EK/dV
	qJxhSRu+nkdM0EKQVHEe8ZaVVmQvZdh6AnSu3aFeckdQZPXHQVmVI1bttkaUX5AK/ur1dLk9JlyMz
	pE1Xxckdjixgrpl4ZHab0AgILXvzHRXSaz1ncV9ThUbVM7cWIZhJka4MykxeaIWkancx3Bvlf2Y3l
	aTWrgM3kJrPsnTGjWmew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCqo4-00000000Vxo-1EiY;
	Wed, 15 Apr 2026 03:20:48 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCqo1-00000000Vx2-0Tuh
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 03:20:46 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-35fb166b0c6so1452907a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Apr 2026 20:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1776223240; x=1776828040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=McgM1ed/7uKct8MrTaZt/faoB6VvbROugN9eTgcOxBM=;
        b=hkeNLF15XTf6zXTL/eK4+1UFk4z97U2voobgcLYTY029H4jeOd9CwFyRtevVuyUYMN
         qAWFvBezrW21NJXkDHvn7d/SDuH9UP/MuRgSQNPebjlNhA8N2RvJbkJ/cX/HtbdznS7t
         5OZ35/9qAjUPA8YiMd+Fsg5lvFLflksecPgVEtYhX80gv203RtQtUVUwTYDDw8paVikx
         Yph92Xzq2hSzfwj4MpN/ohYpm/cWpCXGWqizhGJFOGIEI+HaKXTtoRFr6bTuABNg28uu
         9h9pGeVpRO4+MQPZ5hPcKLOkOwIdB9x2TwKS2y22L19lUXw/exLsUhY9GQQowIbglF3j
         sX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776223240; x=1776828040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McgM1ed/7uKct8MrTaZt/faoB6VvbROugN9eTgcOxBM=;
        b=n5nQTp1sQljmyy+Q52yIkvYXhdm6C3d0kulVUAjdJ425D1wZHdaZKF9XAz4kDFg7xW
         NEUx2zKC+zT5SeZJY63sHGgiOMT580XVjTEbr75ITJcZbeFLiMvC8BsDiUwM18x9SsI8
         7yEwSW8Y6eC2TpdvxlZqGqCacUr9FP2KrtoLhvRvDqQNC06CzOxxO7S2PEeHjhvOY5v3
         xA01+f/kptyR/JfnTMAHKMDA4XzaeoY5VERQmlFyfAdaZrZbSsW33sInfT7QCpi3PLjz
         oYsze3d6zks+zB6P8BkGtPxJcaBy9VKHj+FuhSgH7VxxzXx31mNO4kHBBCFKgUuHw5lI
         5rag==
X-Gm-Message-State: AOJu0YwgyAhBQ+HxT4KovLBd77YyoaXvB3EvkYzAE+Ew3NVErXbh4+3h
	gmn4qDoKijD1GG/NN58pLB4w6TxuqcZf8dqP47e/+e3cepGFxAliATr/f5/aGiW0ZPY=
X-Gm-Gg: AeBDieuD5hOOZXtmaLr+MEQmY1TqpOrgIAk099HUnY9xop7zqNNeYPWJSybiKYehBBh
	RbbheKe2I8X+2Pxi8fkc03Sbo/owaMTSeY52GSvNiVQvOMaK6JCnynjgFgilEtjZY2Amj8Jidz3
	nICtLPHj95mj/Jp6bo62+t0vdR2zdhZcHlOf/l/Ie42//W8czzsPOEu7990g9zN0i9oNlr8DuIO
	/8YviUzCBk/8XFn2PQN2z1/5lQE5ncHgvQA4A9s1Dbc/ooajFAysXrlA+u2d2zVRdHIyT1UJFH3
	d1C865icKGWszowkDI4u8FNxyt4xlJHC+DvDXS4I2Q06LxLeBgLdTTR3+r3Un4H4bXRT4S4WrxH
	D9DRGaG/ky6u3lOhB+Ymr2lXIytIAOPu//om0i04bK5BONeHDMpeJpRvsqyRR75xhZveEvyaAnO
	SmGmLqtOGFR1SZ46C+zKae9zt/WVHeKU5u2ECJa3Zly4l/7PwZjGqmLPuVMq43X0LKZ7SLPQrBy
	ytB+Vf9Wg==
X-Received: by 2002:a17:90b:5283:b0:35f:c5b8:ef6d with SMTP id 98e67ed59e1d1-35fc5b8f328mr4090582a91.3.1776223239924;
        Tue, 14 Apr 2026 20:20:39 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fd3203a76sm372188a91.13.2026.04.14.20.20.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Apr 2026 20:20:39 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: atish.patra@linux.dev,
	anup@brainfault.org,
	will@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	cuiyunhui@bytedance.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	yuanzhu@bytedance.com,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH] drivers/perf: riscv: do not restart throttled events after overflow
Date: Wed, 15 Apr 2026 11:20:17 +0800
Message-ID: <20260415032017.10712-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_202045_444295_417FBA87 
X-CRM114-Status: GOOD (  13.63  )
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

Perf core uses `event->hw.interrupts == MAX_INTERRUPTS` to keep
throttled events stopped until it explicitly unthrottles them later.

However, current RISC-V Perf/PMU system unconditionally restarts all the
counters at the end of overflow handler, which bypasses the perf core's
throttle mechanism. Therefore, an unreasonable small sampling period
such as `perf top -c 20` may cause an IRQ storm and eventually leads to
soft lockup.

Fix this by filtering the counter start/restart mask: do not restart
counters for events already marked as throttled by the perf core. This
retains the throttle effect and prevents interrupt storms in such
workloads.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 drivers/perf/riscv_pmu_sbi.c | 45 ++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 385af5e6e6d0..664f9b86c468 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -60,6 +60,33 @@ asm volatile(ALTERNATIVE(						\
 #define PERF_EVENT_FLAG_LEGACY		BIT(SYSCTL_LEGACY)
 
 PMU_FORMAT_ATTR(event, "config:0-55");
+static inline bool rvpmu_perf_event_is_throttled(struct perf_event *event)
+{
+	return event->hw.interrupts == MAX_INTERRUPTS;
+}
+
+/*
+ * Return a mask of counters that must not be restarted.
+ * `base` is the starting bit index to limit the mask to this long word.
+ */
+static inline unsigned long rvpmu_get_throttled_mask(struct perf_event **events,
+						     unsigned long mask,
+						     int base)
+{
+	unsigned long tmp = mask, throttled = 0;
+	int bit = -1;
+	int nr_bits = min_t(int, BITS_PER_LONG, RISCV_MAX_COUNTERS - base);
+
+	for_each_set_bit(bit, &tmp, nr_bits) {
+		struct perf_event *event = events[bit];
+
+		if (!event || rvpmu_perf_event_is_throttled(event))
+			throttled |= BIT(bit);
+	}
+
+	return throttled;
+}
+
 PMU_FORMAT_ATTR(firmware, "config:62-63");
 
 static bool sbi_v2_available;
@@ -1005,6 +1032,8 @@ static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_
 	for_each_set_bit(idx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS) {
 		if (ctr_ovf_mask & BIT(idx)) {
 			event = cpu_hw_evt->events[idx];
+			if (!event || rvpmu_perf_event_is_throttled(event))
+				continue;
 			hwc = &event->hw;
 			max_period = riscv_pmu_ctr_get_width_mask(event);
 			init_val = local64_read(&hwc->prev_count) & max_period;
@@ -1017,13 +1046,25 @@ static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_
 	}
 
 	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
+		int base = i * BITS_PER_LONG;
+		unsigned long throttled;
+		unsigned long used;
+		unsigned long start_mask;
+
+		used = cpu_hw_evt->used_hw_ctrs[i];
+		throttled = rvpmu_get_throttled_mask(cpu_hw_evt->events + base,
+						     used, base);
+		start_mask = used & ~throttled;
+		if (!start_mask)
+			continue;
+
 		/* Restore the counter values to relative indices for used hw counters */
 		for_each_set_bit(idx, &cpu_hw_evt->used_hw_ctrs[i], BITS_PER_LONG)
 			sdata->ctr_values[idx] =
 					cpu_hw_evt->snapshot_cval_shcopy[idx + i * BITS_PER_LONG];
 		/* Start all the counters in a single shot */
-		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx * BITS_PER_LONG,
-			  cpu_hw_evt->used_hw_ctrs[i], flag, 0, 0, 0);
+		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, i * BITS_PER_LONG,
+			  start_mask, flag, 0, 0, 0);
 	}
 }
 
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
