Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C3E606A325
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 08:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MDQDnzlP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HvDfT6uS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xLTQ8nPXm75ES90H2oOurMYZHHMGNiH4KhC7UuHExZc=; b=MDQDnzlPwL4LznaJi9uOq/qyt0
	g62Sq9leaCdnKp7bfJBziPSzDS9e8bS+yApisxDpLAoNfg8bFRCf5HuFKD+8Th1AxYzySeNJVShiq
	MWxTKSC1HNGZeBgtBSU/A3jC+603SGpqdKSMwKEAnaZbDXHakWjOGmES7shY5U+8pNK8Xw9pP7Mgm
	lP8cZTz6S1pQFUbAtX/6jBCwboeo75s25EtRyZbxtkzvkWA3k3K0p+gGCfNR7CWrR/Evo7sUVMCa6
	KQeS6hew1oW801TaxScgTox5RB7yx8/1c12/LTwxUIeKOUHV20p0Fmeud6GLa1U2kUjCCxkPWk2+F
	AVig56KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaoF-000000087BR-1uqw;
	Wed, 18 Nov 2026 08:14:27 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaoD-000000087AH-12l5
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 08:14:26 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cc751eddf25so552378a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 00:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794989665; x=1795594465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APhQwYNmSvby3GRg2cLabLmHneke0qepZv2cjCRyDwg=;
        b=HvDfT6uSKDnDM0UXouKwU8ykTVl7RBZjOvEaUt3zn+YeOSfqRSG7WT5gmsz0qucES9
         EHkMYUIOfv3sImG03PTbamQkwwsvi257kek0SL7KqsLs47r5O8M0LMppF0EMUFhKedwz
         n4VRGH0zPs7n2yNWfhZQbRE+A3g1lSId/nWfImWDaNviMQOExESVjzfBDhBtSNMZsEnD
         uhvIAsOHKNptf949hUmbgSjMoS/PovBYWAZHs6AqL3PrM3MwjsI3UOyVYlpi38zgUxAN
         QIcaZt9EfWBx8YSSasjsy6Yef7im/sRAeDmMlua64XtCscKJVdBEjU/w3UAEm8x+F+qW
         Ro0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989665; x=1795594465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=APhQwYNmSvby3GRg2cLabLmHneke0qepZv2cjCRyDwg=;
        b=yaQns8YyWfwwatz9xdMD7/rBONlJOZcM4VaQ9/TXqQfKlwJuWd5c2VM90l4zm+uys3
         nyFT04nI54HAaMBkrbwza2FEFc4tpeWid10gYu5pcQzeXomszO6W+OKgTk/1D65X0IUt
         Mgxif92H3vbHhKOpkh2rsyhsIenqrb0nOaU5ZnqYit8r/maJeXcR7sh0P4Pp9JwfMTLj
         1JEqulu51HKwhYTSumAAcclQB3iWKd8EC+ayglNVZv5QcnrdFOKMRNWZ7O8ozu4C2XBh
         vG7cBPXgBeIjXvTasb9tVs3tRpoQlgGEGx7JFvn/K8jHWVQWi5+pcoOqVHCNd6OZMmLa
         pafQ==
X-Gm-Message-State: APuU4Z/ou/DQoRKvIQFcgBg9cQQQjxTrKs9icm1g+/9iIpYfteCqgro5
	UD1v6I9cXCay5w9rl5S6SGxfEu4O25UWwizXiZzBzVxeMbxw1kGpGQPLJCvvn1xSQzkIDagYYbu
	UR3Nj
X-Gm-Gg: AZFdTZezSIgQ4nl9RPkuGxC7Bxyrzl9CkCw3YewVhesTfczbkRdoS7pg/5oSeBArzYA
	mP+IajsknDkR2jPA/WTQb6rR0bbmKb+QyyAuNDcap0rJEf1ahCA7jZtE4OHtGocmo8lpC5gSOGr
	SE0vCQ0mfsJxXrpd76fM+o2cRfrb/JBQHaSlZbjkESfXHkQd9/TbI104NxiOPmdIJlGdMFQrnn7
	1XoQgCbEDP46/Lc8nS/NzhVopOyaNXjYo/raMiH4EGkLtGZK5H69lwJ8ETunRRwzsI8XJmwEl1d
	oztLCV3B7F9ky201fA+4isbrdkkdemfofvHul8UVS/gLDPiI0x7MBtPebhR9/TZwligD1mlBIY/
	kHG7jZEB/sEEXW7yr+D4MJiuvTKHXQYk0yF8EoB+dQPAizjfL0w8HkeXyJgsNAH9HYpmxgogEQa
	Uwi+pcnVBES7s1zcaSKVtmoehbgfGTrPXsrRAi9RGRyCBYYmPgv1nh776hQFBAScrJT3hvHBqyD
	RPqCYeqJeQzWw6TcYaz+zP3VM4IssbNsJIv2yQN1aV0dl+QBrZBWdM2oAuamGoMjYyri1z17Gtd
	YIhmiOzxLpx7UYPtag7W7pAKnC6pwI1erYpQ32BS5DlFXZznq1lB2aL93hb5UIzvck63kiG0ONr
	No7k2yZQ=
X-Received: by 2002:a17:90b:57cb:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b3d0762904mr1796608a91.30.1794989664256;
        Wed, 18 Nov 2026 00:14:24 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde50sm3254680a91.14.2026.11.18.00.14.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 00:14:23 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andrew.jones@linux.dev,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	atish.patra@linux.dev,
	anup@brainfault.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	yuanzhu@bytedance.com,
	cuiyunhui@bytedance.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	will@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: [RFC PATCH v1 5/5] perf: riscv: Deliver PDIS samples through the SBI PMU interrupt
Date: Wed, 18 Nov 2026 16:13:33 +0800
Message-ID: <20261118081327.10684-12-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261118081327.10684-7-zhangzhanpeng.jasper@bytedance.com>
References: <20261118081327.10684-7-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_001425_316927_4492D896 
X-CRM114-Status: GOOD (  24.24  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_PH_BODY_ACCOUNTS_PRE,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use the recorded PC and the single enabled host privilege to construct
perf samples. Only read the record header and PC from the indirect
window. Account for rejected records when applying perf throttling.

Collect PDIS before acknowledging the shared pending interrupt. Restart
ordinary counters even on a PDIS-only interrupt, then re-enable PDIS
if perf has kept the event running.

Register the PMU after probing and installing the interrupt handler.
Save the remaining period on CPU PM entry and restore it on resume.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 drivers/perf/riscv_pdis.c    | 112 +++++++++++++++++++++++++++++++++++
 drivers/perf/riscv_pdis.h    |  10 ++++
 drivers/perf/riscv_pmu_sbi.c |  38 ++++++++----
 3 files changed, 148 insertions(+), 12 deletions(-)

diff --git a/drivers/perf/riscv_pdis.c b/drivers/perf/riscv_pdis.c
index 9a8fe5e4ab82..60c9ece22dfc 100644
--- a/drivers/perf/riscv_pdis.c
+++ b/drivers/perf/riscv_pdis.c
@@ -3,6 +3,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/cpu.h>
+#include <linux/cpu_pm.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/init.h>
@@ -13,10 +14,12 @@
 #include <asm/asm-extable.h>
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
+#include <asm/ptrace.h>
 
 #include "riscv_pdis.h"
 
 /* Draft spdis.adoc at 2de60e18118ce78e2da82ec33296345c94d8560c. */
+#define RISCV_PDIS_ISELECT		0x60
 #define RISCV_PDIS_COUNTER_BIT		BIT(1)
 /* Local experimental encodings, not architectural CSR allocations. */
 #define RISCV_PDIS_CSR_CTL		0x5e0
@@ -26,6 +29,7 @@
 #define RISCV_PDIS_CSR_FILTER		0x5e4
 #define RISCV_PDIS_CSR_VSCTL		0x6d0
 #define RISCV_PDIS_STATEEN		BIT_ULL(55)
+#define RISCV_PDIS_CTL_OF		BIT_ULL(63)
 #define RISCV_PDIS_CTL_SEL		GENMASK_ULL(2, 0)
 #define RISCV_PDIS_CTL_ACC		BIT_ULL(33)
 #define RISCV_PDIS_CTL_U		BIT_ULL(60)
@@ -39,6 +43,9 @@ enum riscv_pdis_select {
 	RISCV_PDIS_SELECT_CONTROL,
 };
 
+#define RISCV_PDIS_HDR_TYPE		GENMASK_ULL(2, 0)
+#define RISCV_PDIS_HDR_FMT		GENMASK_ULL(63, 61)
+
 #define RISCV_PDIS_SAMPLE_TYPES (PERF_SAMPLE_IP | PERF_SAMPLE_TID | \
 				 PERF_SAMPLE_TIME | PERF_SAMPLE_ID | \
 				 PERF_SAMPLE_STREAM_ID | PERF_SAMPLE_CPU | \
@@ -54,7 +61,9 @@ struct pdis_cpu {
 	struct perf_event *event;
 	bool ready;
 	bool counter_valid;
+	bool irq_running;
 	bool switching;
+	bool pm_resume;
 };
 
 static DEFINE_PER_CPU(struct pdis_cpu, pdis_cpu);
@@ -399,6 +408,64 @@ static void pdis_sched_task(struct perf_event_pmu_context *ctx,
 		csr_clear(CSR_SCOUNTINHIBIT, RISCV_PDIS_COUNTER_BIT);
 }
 
+/* Called with local IRQs disabled and the PDIS counter inhibited. */
+static int pdis_overflow(struct perf_event *event)
+{
+	struct perf_sample_data data;
+	struct pt_regs regs = {};
+	unsigned long selector, header, pc;
+
+	selector = csr_swap(CSR_SISELECT, RISCV_PDIS_ISELECT);
+	header = csr_read(CSR_SIREG);
+	pc = csr_read(CSR_SIREG2);
+	csr_write(CSR_SISELECT, selector);
+
+	if (FIELD_GET(RISCV_PDIS_HDR_FMT, header) ||
+	    FIELD_GET(RISCV_PDIS_HDR_TYPE, header) > 4)
+		return perf_event_account_interrupt(event);
+
+	/* The draft record has no privilege field. Only one mode is enabled. */
+	regs.epc = pc;
+	if (event->hw.config & RISCV_PDIS_CTL_S)
+		regs.status = SR_SPP;
+	perf_sample_data_init(&data, 0, event->hw.last_period);
+	data.ip = pc;
+	data.sample_flags |= PERF_SAMPLE_IP;
+	return perf_event_overflow(event, &data, &regs);
+}
+
+bool riscv_pdis_irq_prepare(void)
+{
+	struct pdis_cpu *pcpu = this_cpu_ptr(&pdis_cpu);
+	struct perf_event *event = pcpu->event;
+	bool pending;
+
+	if (!pcpu->ready)
+		return false;
+	pcpu->irq_running = event && !(event->hw.state & PERF_HES_STOPPED);
+	csr_set(CSR_SCOUNTINHIBIT, RISCV_PDIS_COUNTER_BIT);
+	pending = csr_read(CSR_SCOUNTOVF) & RISCV_PDIS_COUNTER_BIT;
+	if (pending && pcpu->irq_running && !pcpu->switching) {
+		pdis_event_update(event);
+		if (pdis_overflow(event))
+			pdis_stop(event, PERF_EF_UPDATE);
+	}
+	csr_clear(RISCV_PDIS_CSR_CTL, RISCV_PDIS_CTL_OF);
+	if (pending)
+		pdis_clear_accounted(event);
+	return pending;
+}
+
+void riscv_pdis_irq_finish(void)
+{
+	struct pdis_cpu *pcpu = this_cpu_ptr(&pdis_cpu);
+
+	if (pcpu->ready && pcpu->irq_running && pcpu->event &&
+	    !pcpu->switching && !(pcpu->event->hw.state & PERF_HES_STOPPED))
+		csr_clear(CSR_SCOUNTINHIBIT, RISCV_PDIS_COUNTER_BIT);
+	pcpu->irq_running = false;
+}
+
 void riscv_pdis_cpu_dying(void)
 {
 	struct pdis_cpu *pcpu = this_cpu_ptr(&pdis_cpu);
@@ -413,6 +480,32 @@ void riscv_pdis_cpu_dying(void)
 	cpumask_clear_cpu(smp_processor_id(), &pdis_cpus);
 }
 
+static int pdis_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd, void *v)
+{
+	struct pdis_cpu *pcpu = this_cpu_ptr(&pdis_cpu);
+	struct perf_event *event = pcpu->event;
+
+	if (!pcpu->ready)
+		return NOTIFY_DONE;
+	if (cmd == CPU_PM_ENTER) {
+		pcpu->pm_resume = event && !(event->hw.state & PERF_HES_STOPPED);
+		if (event)
+			pdis_stop(event, PERF_EF_UPDATE);
+		else
+			pdis_quiesce();
+	} else if (cmd == CPU_PM_EXIT || cmd == CPU_PM_ENTER_FAILED) {
+		riscv_pdis_cpu_starting();
+		if (pcpu->pm_resume && pcpu->ready && event)
+			pdis_start(event, PERF_EF_RELOAD);
+		pcpu->pm_resume = false;
+	}
+	return NOTIFY_OK;
+}
+
+static struct notifier_block pdis_cpu_pm_nb = {
+	.notifier_call = pdis_cpu_pm_notify,
+};
+
 PMU_FORMAT_ATTR(select, "config:0-2");
 static struct attribute *pdis_format_attrs[] = { &format_attr_select.attr, NULL };
 static const struct attribute_group pdis_format_group = {
@@ -444,3 +537,22 @@ static struct pmu pdis_pmu = {
 	.check_period = pdis_check_period,
 	.sched_task = pdis_sched_task,
 };
+
+int riscv_pdis_register(struct device *parent)
+{
+	int ret;
+
+	if (cpumask_empty(&pdis_cpus)) {
+		if (pdis_test)
+			dev_info(parent, "PDIS test PMU unavailable on all online CPUs\n");
+		return -ENODEV;
+	}
+	ret = cpu_pm_register_notifier(&pdis_cpu_pm_nb);
+	if (ret)
+		return ret;
+	pdis_pmu.parent = parent;
+	ret = perf_pmu_register(&pdis_pmu, "riscv_pdis_test", -1);
+	if (ret)
+		cpu_pm_unregister_notifier(&pdis_cpu_pm_nb);
+	return ret;
+}
diff --git a/drivers/perf/riscv_pdis.h b/drivers/perf/riscv_pdis.h
index b1ffe7d16ce0..8a9cf7afe51e 100644
--- a/drivers/perf/riscv_pdis.h
+++ b/drivers/perf/riscv_pdis.h
@@ -2,12 +2,22 @@
 #ifndef __RISCV_PDIS_H
 #define __RISCV_PDIS_H
 
+#include <linux/types.h>
+
+struct device;
+
 #ifdef CONFIG_RISCV_PDIS_CSR
 void riscv_pdis_cpu_starting(void);
 void riscv_pdis_cpu_dying(void);
+bool riscv_pdis_irq_prepare(void);
+void riscv_pdis_irq_finish(void);
+int riscv_pdis_register(struct device *parent);
 #else
 static inline void riscv_pdis_cpu_starting(void) { }
 static inline void riscv_pdis_cpu_dying(void) { }
+static inline bool riscv_pdis_irq_prepare(void) { return false; }
+static inline void riscv_pdis_irq_finish(void) { }
+static inline int riscv_pdis_register(struct device *parent) { return 0; }
 #endif
 
 #endif /* __RISCV_PDIS_H */
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 545b8becf90a..af86a30aae83 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -1092,24 +1092,23 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	struct cpu_hw_events *cpu_hw_evt = dev;
 	u64 start_clock = sched_clock();
 	struct riscv_pmu_snapshot_data *sdata;
+	bool handled;
 
 	if (WARN_ON_ONCE(!cpu_hw_evt))
 		return IRQ_NONE;
 
 	sdata = cpu_hw_evt->snapshot_addr;
+	/* Inhibit and collect PDIS before any shared pending bit is cleared. */
+	handled = riscv_pdis_irq_prepare();
 
 	/* Firmware counter don't support overflow yet */
 	fidx = find_first_bit(cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS);
-	if (fidx == RISCV_MAX_COUNTERS) {
-		csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
-		return IRQ_NONE;
-	}
+	if (fidx == RISCV_MAX_COUNTERS)
+		goto out_clear;
 
 	event = cpu_hw_evt->events[fidx];
-	if (!event) {
-		ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
-		return IRQ_NONE;
-	}
+	if (!event)
+		goto out_clear;
 
 	pmu = to_riscv_pmu(event->pmu);
 	pmu_sbi_stop_hw_ctrs(pmu);
@@ -1128,7 +1127,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 
 	/* No overflow bit is set */
 	if (!overflow)
-		return IRQ_NONE;
+		goto restart;
 
 	regs = get_irq_regs();
 
@@ -1181,10 +1180,20 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 		hw_evt->state = 0;
 	}
 
-	pmu_sbi_start_overflow_mask(pmu, overflowed_ctrs);
-	perf_sample_event_took(sched_clock() - start_clock);
+	handled = true;
 
-	return IRQ_HANDLED;
+restart:
+	/* A PDIS-only interrupt must also resume the ordinary HPM counters. */
+	pmu_sbi_start_overflow_mask(pmu, overflowed_ctrs);
+out:
+	/* PDIS can restart only after all sources and shared pending are serviced. */
+	riscv_pdis_irq_finish();
+	if (handled)
+		perf_sample_event_took(sched_clock() - start_clock);
+	return handled ? IRQ_HANDLED : IRQ_NONE;
+out_clear:
+	ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
+	goto out;
 }
 
 static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
@@ -1563,6 +1572,11 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
 	if (ret)
 		goto out_unregister;
+	if (irq_requested && riscv_pmu_irq_num == RV_IRQ_PMU) {
+		ret = riscv_pdis_register(&pdev->dev);
+		if (ret && ret != -ENODEV)
+			pr_warn("PDIS test PMU registration failed: %d\n", ret);
+	}
 
 	/* Asynchronously check which standard events are available */
 	schedule_work(&check_std_events_work);
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
