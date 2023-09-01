Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1900CCA0FE9
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 13:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9ZV1/CcBVHffgvghE4KwCr91lrbd6r6AfBFEHpwlAk=; b=XzUfykrhkO/hCf
	yIe8iKnlrwjdhdp/gW1ockNjX0K0YeZA7U3CiZquPZ0YN/VeZE+8sgxEwySm8rxDS7Gg3CAu++p2z
	nITPMaXPx8Z0WY7I1Aywwi4kwX6k64SEOLToAt3X3a5sf2xZk61IHWv2J+ObXCc0EDW8PAYdrcpWF
	G+Bo9YSNbZUI0fVdD1lgHl3EpTd21NOzcTebQzhIxMo3/Cx7fKalmehTL9xVYjBTqGRR+g+AQf44B
	2C98GhfvRBLY6zWiXSmlcvkS+/p46LPJ/vGpu1FEXGU+YxpNB3vUXP6SU8NIgA14/jkNVN84CW/k3
	J4QMDYODa8SbJFe0mXFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3oA-00HXMZ-1k;
	Fri, 01 Sep 2023 13:03:30 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3o4-00HXGD-0m
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 13:03:26 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-31c4d5bd69cso1659691f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 06:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693573400; x=1694178200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lc2/PThdglNLGfS0qJb++8JNKia8ENWEPE++6QMdKJg=;
        b=yozUIrLAXtANux2vtJ+1VBTXyeQBPftJiJQtRH+2BlONu7QRw8/rY9uQdyVx5bmRCJ
         obn7yuZXVcXz08riLjJxzxvnn9+aLiNs/2sotqomYg4UE5s+SHgq1qmAmD+sbu95KdQN
         lk7leAyjpOOqp+qRRodlNkx9Jxk3D/rEMmFRiaxq8yoyf76/AIOpzU6sv1KWyyp6FATI
         uwtfqoAELsYP+/iLUp2Bsy3HaSFVc7YcZ+qsfVOy/SFU9XYyDebRvgczUxD658YHzvYs
         3SmS8OMDDOwfNW7sxAFZF6gEHyDgdKORGQ9vbtPhloMrX29SRXFLh33zs343sOTdjTY3
         /5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693573400; x=1694178200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lc2/PThdglNLGfS0qJb++8JNKia8ENWEPE++6QMdKJg=;
        b=D4qJwD/6AI00dHzenxN/WwWv1aeqHQmdRJhOI085V4txCnsANP9oXmq1Ed6IJocPH+
         NVW9pnAFPnmQSXO93QatBHVnaIRMY8J354fETGMsWbyl5/YMGdd0Uj5FMow0ervOVIJM
         6O51pxywt+S2YVRyOwzFADvvWJ2KHCCKtBFi5uBpf8VadSmkzbTpfQT2y6RGMZTAnVYp
         Kvj154lC9mUXpcX5N0WsNrLFhW2IseguvGdTRXw8Xpj1FB8coZ2Oio0PGef6klenaD5X
         drRU76hK3ppe9ZCp/VS6ATUGV81+SFTveVAH/JZMnIfuW//0ipIeADHbiBPKQMAtGeFy
         n3MA==
X-Gm-Message-State: AOJu0YziGbXqiLvXomBGsd+p9wwlmhVzrGqQFEc5Bd2guepsz2yOh0lt
	NTNCwMnMHxr6+8kMjpeQmxkTDw==
X-Google-Smtp-Source: AGHT+IFhopL0OmPezFJfjy60UyNhSKg8ZqbBwJgAZmOJYjwD1j0DD1QYHLDKXKPgXXRmJOa5y8JoMw==
X-Received: by 2002:adf:ecc6:0:b0:317:58e4:e941 with SMTP id s6-20020adfecc6000000b0031758e4e941mr1608494wro.33.1693573400353;
        Fri, 01 Sep 2023 06:03:20 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:e9bd:add1:d9ac:7b3e])
        by smtp.gmail.com with ESMTPSA id i14-20020adfdece000000b003142e438e8csm5167452wrn.26.2023.09.01.06.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 06:03:19 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org
Cc: conor.dooley@microchip.com,
	suagrfillet@gmail.com,
	ajones@ventanamicro.com,
	lftan@kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 2/4] topology: add a new arch_scale_freq_reference
Date: Fri,  1 Sep 2023 15:03:10 +0200
Message-Id: <20230901130312.247719-3-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230901130312.247719-1-vincent.guittot@linaro.org>
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_060324_284902_39F855C4 
X-CRM114-Status: GOOD (  17.08  )
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
cpuinfo.max_freq or last item of performance domain are used as the max
frequency when computing the frequency for a level of utilization but:
- cpuinfo_max_freq can change at runtime. boost is one example of
  such change.
- cpuinfo.max_freq and last item of the PD can be different leading to
  different results betwen cpufreq and energy model.

We need to save the max frequency that has been used when computing the
CPUs capacity and use this fixed and coherent value to convert between
frequency and CPU's capacity.

In fact, we already save the frequency that has been used when computing
the capacity of each CPU. We extend the precision to save khZ instead of
Mhz currently and we modify the type to be aligned with other variables
used when converting frequency to capacity and the other way.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 arch/arm/include/asm/topology.h   | 1 +
 arch/arm64/include/asm/topology.h | 1 +
 arch/riscv/include/asm/topology.h | 1 +
 drivers/base/arch_topology.c      | 9 +++------
 include/linux/arch_topology.h     | 7 +++++++
 5 files changed, 13 insertions(+), 6 deletions(-)

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
index b741b5ba82bd..75fa67477a9d 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -26,7 +26,7 @@
 static DEFINE_PER_CPU(struct scale_freq_data __rcu *, sft_data);
 static struct cpumask scale_freq_counters_mask;
 static bool scale_freq_invariant;
-static DEFINE_PER_CPU(u32, freq_factor) = 1;
+DEFINE_PER_CPU(unsigned long, freq_factor) = 1;
 
 static bool supports_scale_freq_counters(const struct cpumask *cpus)
 {
@@ -183,10 +183,7 @@ void topology_update_thermal_pressure(const struct cpumask *cpus,
 
 	cpu = cpumask_first(cpus);
 	max_capacity = arch_scale_cpu_capacity(cpu);
-	max_freq = per_cpu(freq_factor, cpu);
-
-	/* Convert to MHz scale which is used in 'freq_factor' */
-	capped_freq /= 1000;
+	max_freq = arch_scale_freq_ref(cpu);
 
 	/*
 	 * Handle properly the boost frequencies, which should simply clean
@@ -411,7 +408,7 @@ init_cpu_capacity_callback(struct notifier_block *nb,
 	cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
 
 	for_each_cpu(cpu, policy->related_cpus)
-		per_cpu(freq_factor, cpu) = policy->cpuinfo.max_freq / 1000;
+		per_cpu(freq_factor, cpu) = policy->cpuinfo.max_freq;
 
 	if (cpumask_empty(cpus_to_visit)) {
 		topology_normalize_cpu_scale();
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index a07b510e7dc5..7a2dba9c3dc0 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -27,6 +27,13 @@ static inline unsigned long topology_get_cpu_scale(int cpu)
 
 void topology_set_cpu_scale(unsigned int cpu, unsigned long capacity);
 
+DECLARE_PER_CPU(unsigned long, freq_factor);
+
+static inline unsigned long topology_get_freq_ref(int cpu)
+{
+	return per_cpu(freq_factor, cpu);
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
