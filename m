Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB71CDB485
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 16:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TUkt5P8FjGxMcqWBMk9SX/97beAif8oB8MWsiZVcSrU=; b=wlAvZIB25aPsZ1
	v7nezLBbW22zT54ODfX7N7KQ8a78L0bp6K6bGRAKz/KzIurbBwaiVsZPmJDsr0z8g5GzyPuzBEMpI
	SIwJthH/lAS6TSudzpg+a0lanFL5iPtGgm3fz6ojlRHDToNefmMIKjVFUbD6yD3DrU3IWGshM15zi
	dt9Nhg100FiPzbh0oJq+va4aS6m8DkiOIVoD4Xu/O4bmhnpDGdProKKRBKEk42y8iXlXeueQdat5V
	skX2Zol3n1ut625egwT7etcH6QcfG0MgO2cB2nUIFkHmPo7SaSJhquqqpk+HejSxyIT3h46DraBir
	BsHXPJLFf1Gob+amDMcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt9Mo-00FB3k-2P;
	Wed, 18 Oct 2023 16:25:54 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt9Mk-00FAzS-2l
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 16:25:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-408382da7f0so11810765e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 09:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697646347; x=1698251147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFOHFKmq1WrCMxE6F0StEJReCJz85aGc8CyzkJS5qLM=;
        b=GWAWflYOX75uVt0LwBPKzyMDllQAhg31DKnAd58xSO6S12Ss4SpzPoaIXfiuS1xUrq
         WjdQTSnDc92E/7La6nzaOpFGZBODadpYn9KrzVa3rN+Jil/7afCXf9M+ZBEgc7NJr0Ay
         4Xb2lvYb6jkvB84zwLXCjyqBtQu/zPU8SSCmGx5TKi85M89EkQvj1j5waby2Nc6glUt4
         iMvMuvtKJ9IswafgqCvu9hCc0SKpnrIZl0wmxyYSAAqvTg1YYzeEWC4BdypknziQ25C8
         W+bB3GeZnq2c5WhWRgHCzd7sxjWDgv5QUmgZf5BflnREBio5PE27UkdSZwhJPIKmWz+4
         Ap5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697646347; x=1698251147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFOHFKmq1WrCMxE6F0StEJReCJz85aGc8CyzkJS5qLM=;
        b=r4tZq68rVoZ8Hm6Jc4f1idkXOybHvAFyJwjshjToJPKW4q2LvSdq5mwWWsnGaxwYBG
         JkeF1gvXWIbD/orDZ8NNVUp0VJrYIEhOruPYjb0gGXZrdFCTiq6vIBFGlIyWiTir+hHW
         +Zofyb8xJlK8Sv//s4jYh+TWHJ/LOQkKZtia4/+hRJcTsMuNE2mY9D6DIbWhGLY21NFp
         igPJ7N+pYcvaMBAlTTFNez2CC2R3hlI27aA5WtA34NF3wRtEqBlw9ZUBOJmowQKnsqaE
         psrPS1v/JWNzkaGclVwE6Uu/5op4FGh7gvJfOD2g03culb7F3RuqJ0BUmdopb0dErsIw
         Vs4A==
X-Gm-Message-State: AOJu0YzvC+3VtfBpAIA6PsZkXJZcKTN4R1Ym1fND7pfd1uXYffs3ctbl
	t0IniaHlXUjqcvgBPPfgpWY7cQ==
X-Google-Smtp-Source: AGHT+IHdrUy8xhlO86VbC5nXqwVPgaalFOqEEBVM4ZkTdenY3u+UheyYht68WSN7cVY8gZVzBzT1kQ==
X-Received: by 2002:a05:600c:46c9:b0:405:36d7:4582 with SMTP id q9-20020a05600c46c900b0040536d74582mr4730324wmo.15.1697646346598;
        Wed, 18 Oct 2023 09:25:46 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:fcf4:9d83:8d0d:39aa])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c2e4c00b0040648217f4fsm2033503wmf.39.2023.10.18.09.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 09:25:46 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	sudeep.holla@arm.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	bristot@redhat.com,
	vschneid@redhat.com,
	viresh.kumar@linaro.org,
	lenb@kernel.org,
	robert.moore@intel.com,
	lukasz.luba@arm.com,
	ionela.voinescu@arm.com,
	pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linuxfoundation.org
Cc: conor.dooley@microchip.com,
	suagrfillet@gmail.com,
	ajones@ventanamicro.com,
	lftan@kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v3 1/6] topology: add a new arch_scale_freq_reference
Date: Wed, 18 Oct 2023 18:25:35 +0200
Message-Id: <20231018162540.667646-2-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018162540.667646-1-vincent.guittot@linaro.org>
References: <20231018162540.667646-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_092550_892412_3C0364DE 
X-CRM114-Status: GOOD (  20.74  )
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

Create a new method to get a unique and fixed max frequency. Currently
cpuinfo.max_freq or the highest (or last) state of performance domain are
used as the max frequency when computing the frequency for a level of
utilization but:
- cpuinfo_max_freq can change at runtime. boost is one example of
  such change.
- cpuinfo.max_freq and last item of the PD can be different leading to
  different results between cpufreq and energy model.

We need to save the reference frequency that has been used when computing
the CPUs capacity and use this fixed and coherent value to convert between
frequency and CPU's capacity.

In fact, we already save the frequency that has been used when computing
the capacity of each CPU. We extend the precision to save khZ instead of
Mhz currently and we modify the type to be aligned with other variables
used when converting frequency to capacity and the other way.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Tested-by: Lukasz Luba <lukasz.luba@arm.com>

---
 arch/arm/include/asm/topology.h   |  1 +
 arch/arm64/include/asm/topology.h |  1 +
 arch/riscv/include/asm/topology.h |  1 +
 drivers/base/arch_topology.c      | 29 ++++++++++++++---------------
 include/linux/arch_topology.h     |  7 +++++++
 5 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/arch/arm/include/asm/topology.h b/arch/arm/include/asm/topology.h
index c7d2510e5a78..853c4f81ba4a 100644
--- a/arch/arm/include/asm/topology.h
+++ b/arch/arm/include/asm/topology.h
@@ -13,6 +13,7 @@
 #define arch_set_freq_scale topology_set_freq_scale
 #define arch_scale_freq_capacity topology_get_freq_scale
 #define arch_scale_freq_invariant topology_scale_freq_invariant
+#define arch_scale_freq_ref topology_get_freq_ref
 #endif
 
 /* Replace task scheduler's default cpu-invariant accounting */
diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
index 9fab663dd2de..a323b109b9c4 100644
--- a/arch/arm64/include/asm/topology.h
+++ b/arch/arm64/include/asm/topology.h
@@ -23,6 +23,7 @@ void update_freq_counters_refs(void);
 #define arch_set_freq_scale topology_set_freq_scale
 #define arch_scale_freq_capacity topology_get_freq_scale
 #define arch_scale_freq_invariant topology_scale_freq_invariant
+#define arch_scale_freq_ref topology_get_freq_ref
 
 #ifdef CONFIG_ACPI_CPPC_LIB
 #define arch_init_invariance_cppc topology_init_cpu_capacity_cppc
diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
index e316ab3b77f3..61183688bdd5 100644
--- a/arch/riscv/include/asm/topology.h
+++ b/arch/riscv/include/asm/topology.h
@@ -9,6 +9,7 @@
 #define arch_set_freq_scale		topology_set_freq_scale
 #define arch_scale_freq_capacity	topology_get_freq_scale
 #define arch_scale_freq_invariant	topology_scale_freq_invariant
+#define arch_scale_freq_ref		topology_get_freq_ref
 
 /* Replace task scheduler's default cpu-invariant accounting */
 #define arch_scale_cpu_capacity	topology_get_cpu_scale
diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index b741b5ba82bd..9a073c2d2086 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -19,6 +19,7 @@
 #include <linux/init.h>
 #include <linux/rcupdate.h>
 #include <linux/sched.h>
+#include <linux/units.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/thermal_pressure.h>
@@ -26,7 +27,8 @@
 static DEFINE_PER_CPU(struct scale_freq_data __rcu *, sft_data);
 static struct cpumask scale_freq_counters_mask;
 static bool scale_freq_invariant;
-static DEFINE_PER_CPU(u32, freq_factor) = 1;
+DEFINE_PER_CPU(unsigned long, capacity_ref_freq) = 1;
+EXPORT_PER_CPU_SYMBOL_GPL(capacity_ref_freq);
 
 static bool supports_scale_freq_counters(const struct cpumask *cpus)
 {
@@ -170,9 +172,9 @@ DEFINE_PER_CPU(unsigned long, thermal_pressure);
  * operating on stale data when hot-plug is used for some CPUs. The
  * @capped_freq reflects the currently allowed max CPUs frequency due to
  * thermal capping. It might be also a boost frequency value, which is bigger
- * than the internal 'freq_factor' max frequency. In such case the pressure
- * value should simply be removed, since this is an indication that there is
- * no thermal throttling. The @capped_freq must be provided in kHz.
+ * than the internal 'capacity_ref_freq' max frequency. In such case the
+ * pressure value should simply be removed, since this is an indication that
+ * there is no thermal throttling. The @capped_freq must be provided in kHz.
  */
 void topology_update_thermal_pressure(const struct cpumask *cpus,
 				      unsigned long capped_freq)
@@ -183,10 +185,7 @@ void topology_update_thermal_pressure(const struct cpumask *cpus,
 
 	cpu = cpumask_first(cpus);
 	max_capacity = arch_scale_cpu_capacity(cpu);
-	max_freq = per_cpu(freq_factor, cpu);
-
-	/* Convert to MHz scale which is used in 'freq_factor' */
-	capped_freq /= 1000;
+	max_freq = arch_scale_freq_ref(cpu);
 
 	/*
 	 * Handle properly the boost frequencies, which should simply clean
@@ -279,13 +278,13 @@ void topology_normalize_cpu_scale(void)
 
 	capacity_scale = 1;
 	for_each_possible_cpu(cpu) {
-		capacity = raw_capacity[cpu] * per_cpu(freq_factor, cpu);
+		capacity = raw_capacity[cpu] * per_cpu(capacity_ref_freq, cpu);
 		capacity_scale = max(capacity, capacity_scale);
 	}
 
 	pr_debug("cpu_capacity: capacity_scale=%llu\n", capacity_scale);
 	for_each_possible_cpu(cpu) {
-		capacity = raw_capacity[cpu] * per_cpu(freq_factor, cpu);
+		capacity = raw_capacity[cpu] * per_cpu(capacity_ref_freq, cpu);
 		capacity = div64_u64(capacity << SCHED_CAPACITY_SHIFT,
 			capacity_scale);
 		topology_set_cpu_scale(cpu, capacity);
@@ -321,15 +320,15 @@ bool __init topology_parse_cpu_capacity(struct device_node *cpu_node, int cpu)
 			cpu_node, raw_capacity[cpu]);
 
 		/*
-		 * Update freq_factor for calculating early boot cpu capacities.
+		 * Update capacity_ref_freq for calculating early boot cpu capacities.
 		 * For non-clk CPU DVFS mechanism, there's no way to get the
 		 * frequency value now, assuming they are running at the same
-		 * frequency (by keeping the initial freq_factor value).
+		 * frequency (by keeping the initial capacity_ref_freq value).
 		 */
 		cpu_clk = of_clk_get(cpu_node, 0);
 		if (!PTR_ERR_OR_ZERO(cpu_clk)) {
-			per_cpu(freq_factor, cpu) =
-				clk_get_rate(cpu_clk) / 1000;
+			per_cpu(capacity_ref_freq, cpu) =
+				clk_get_rate(cpu_clk) / HZ_PER_KHZ;
 			clk_put(cpu_clk);
 		}
 	} else {
@@ -411,7 +410,7 @@ init_cpu_capacity_callback(struct notifier_block *nb,
 	cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
 
 	for_each_cpu(cpu, policy->related_cpus)
-		per_cpu(freq_factor, cpu) = policy->cpuinfo.max_freq / 1000;
+		per_cpu(capacity_ref_freq, cpu) = policy->cpuinfo.max_freq;
 
 	if (cpumask_empty(cpus_to_visit)) {
 		topology_normalize_cpu_scale();
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index a07b510e7dc5..38ca6c76af56 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -27,6 +27,13 @@ static inline unsigned long topology_get_cpu_scale(int cpu)
 
 void topology_set_cpu_scale(unsigned int cpu, unsigned long capacity);
 
+DECLARE_PER_CPU(unsigned long, capacity_ref_freq);
+
+static inline unsigned long topology_get_freq_ref(int cpu)
+{
+	return per_cpu(capacity_ref_freq, cpu);
+}
+
 DECLARE_PER_CPU(unsigned long, arch_freq_scale);
 
 static inline unsigned long topology_get_freq_scale(int cpu)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
