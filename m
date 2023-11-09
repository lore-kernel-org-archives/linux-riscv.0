Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DBFC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 10:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkuXneLk1GPT5hsfNicgUBXmQ8ymC5ZIzjddje5EQis=; b=jdolr9zqaWxW/D
	9YcmsPFYH6Q3zhstX7NBEJp88bqtqOJFOgHu+Aq4UteS7uLPKFbZx+z3AwIrsn4gFXDTTiPLIGgZN
	hXA4doFTIAa0F3xDr7JMV/jOcCSboft4SkpCHxOOnS/ujOx/RVkSujUEXvxqcBypMg+QP5NS581mC
	gqeOCjRwr/HUUMc+Txe4cI5CPmPcYsFGk/vcoi21QmDYPxLyJaYqxNQUOOI642KvfcqV+zfhO9tDn
	k6UmCHNOJLvklA47zhJH7oAStgCMq5INHp8rQpJhC6UOSfn+bcEKIdDz40CRLRBBGlvhuJ3Av41/R
	M8Z5RS2NUItGadQyrUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r124A-005u2u-3A;
	Thu, 09 Nov 2023 10:15:14 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r123w-005toQ-23
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 10:15:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40839807e82so4048535e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 02:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699524899; x=1700129699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yeh/ejHIslK7GUpigz7eOxRJ5nIZNkForzOfukaDKm0=;
        b=vKqR2lI9TT8TBksLqBXGaDt6nXooj/oYqFQX+lYjyx9mTboWYd4pvU7dc4GXMbsQh/
         f/BW3Ip/sScuD10sArPGMmABspz8P2bA4e5cBTcHdMPdE2WDKmY93H8aDl/xbvCowmlF
         rW2ZHPt30uvdZY7xyWwBpFfD8OjfOWjXCPOiZlE2/jyoAd+qL30nVz61+8YGLO1zTXAf
         qngQBoMkcnF29UwyygHeseRU/iXVGps1Uq2ReOZak5d3cDxgTDb5AeOQgdvWGixpPUam
         XNcq2L5EJ91qe2LpWGavDNOosFHnRkm+UDBxgKQ7lOA6BMLJuGGiXI6gG/jDRIpsqEqP
         bUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699524899; x=1700129699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yeh/ejHIslK7GUpigz7eOxRJ5nIZNkForzOfukaDKm0=;
        b=OuRxPhlIGfBYN+u2JBVCypj7yk/aA/zWDHjcDQRN6sfR2mtHW04xennxRdvw03ssZS
         EyB0J9nfXbkBkT6qyj6F4MunJpfWgj0Oztdf1O4g3WV8Qc/6sw2j6UZ5xScYUsQ2t/dy
         BQUjtZF1sEAN88ANhXNWq0TX5if6OT12E4eTFmWX/bnE94pGa09u1iqKmOFw5azsi0wT
         NH18Mgrd/e43VOWTGrUbLWOy7Bx7FM7mKJzD0LHPcO9VFiUIKqzsfwLycjpdt5wK1rLE
         4kAiwwa8ttElK6xU77pmvSm//MKVQavZlYeaCrjZuUHDgXc+JzIGOvRLmzkeCoElEMg3
         GaRw==
X-Gm-Message-State: AOJu0Yye8yg7Yd7hFiIt/sXL0AX6Xx9EFOPm1DWO9JmnsnacTRwv29MX
	ZObxiDzKd+kOb65569ZkmoxKgg==
X-Google-Smtp-Source: AGHT+IGlIQP4ExpYKEcJPouG3NAgRbcbvugwDfKHk5La7RKyXTFl7Z52+KMescuL7ihHOYDKBftYUA==
X-Received: by 2002:a05:600c:3c97:b0:406:5a14:5c1e with SMTP id bg23-20020a05600c3c9700b004065a145c1emr10570874wmb.1.1699524899315;
        Thu, 09 Nov 2023 02:14:59 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:26e5:c6da:63bc:dd99])
        by smtp.gmail.com with ESMTPSA id m17-20020a05600c4f5100b003fefb94ccc9sm1611816wmq.11.2023.11.09.02.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 02:14:58 -0800 (PST)
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
	beata.michalska@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: conor.dooley@microchip.com,
	suagrfillet@gmail.com,
	ajones@ventanamicro.com,
	lftan@kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v6 7/7] arm64/amu: Use capacity_ref_freq to set AMU ratio
Date: Thu,  9 Nov 2023 11:14:38 +0100
Message-Id: <20231109101438.1139696-8-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109101438.1139696-1-vincent.guittot@linaro.org>
References: <20231109101438.1139696-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_021500_746773_8E647E48 
X-CRM114-Status: GOOD (  14.96  )
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

Use the new capacity_ref_freq to set the ratio that is used by AMU for
computing the arch_scale_freq_capacity().
This helps to keep everything aligned using the same reference for
computing CPUs capacity.

The default value of the ratio (stored in per_cpu(arch_max_freq_scale))
ensures that arch_scale_freq_capacity() returns max capacity until it is
set to its correct value with the cpu capacity and capacity_ref_freq.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Acked-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm64/kernel/topology.c  | 26 +++++++++++++-------------
 drivers/base/arch_topology.c  | 12 +++++++++++-
 include/linux/arch_topology.h |  1 +
 3 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 817d788cd866..1a2c72f3e7f8 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -82,7 +82,12 @@ int __init parse_acpi_topology(void)
 #undef pr_fmt
 #define pr_fmt(fmt) "AMU: " fmt
 
-static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale);
+/*
+ * Ensure that amu_scale_freq_tick() will return SCHED_CAPACITY_SCALE until
+ * the CPU capacity and its associated frequency have been correctly
+ * initialized.
+ */
+static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale) =  1UL << (2 * SCHED_CAPACITY_SHIFT);
 static DEFINE_PER_CPU(u64, arch_const_cycles_prev);
 static DEFINE_PER_CPU(u64, arch_core_cycles_prev);
 static cpumask_var_t amu_fie_cpus;
@@ -112,14 +117,14 @@ static inline bool freq_counters_valid(int cpu)
 	return true;
 }
 
-static int freq_inv_set_max_ratio(int cpu, u64 max_rate, u64 ref_rate)
+void freq_inv_set_max_ratio(int cpu, u64 max_rate)
 {
-	u64 ratio;
+	u64 ratio, ref_rate = arch_timer_get_rate();
 
 	if (unlikely(!max_rate || !ref_rate)) {
-		pr_debug("CPU%d: invalid maximum or reference frequency.\n",
+		WARN_ONCE(1, "CPU%d: invalid maximum or reference frequency.\n",
 			 cpu);
-		return -EINVAL;
+		return;
 	}
 
 	/*
@@ -139,12 +144,10 @@ static int freq_inv_set_max_ratio(int cpu, u64 max_rate, u64 ref_rate)
 	ratio = div64_u64(ratio, max_rate);
 	if (!ratio) {
 		WARN_ONCE(1, "Reference frequency too low.\n");
-		return -EINVAL;
+		return;
 	}
 
-	per_cpu(arch_max_freq_scale, cpu) = (unsigned long)ratio;
-
-	return 0;
+	WRITE_ONCE(per_cpu(arch_max_freq_scale, cpu), (unsigned long)ratio);
 }
 
 static void amu_scale_freq_tick(void)
@@ -195,10 +198,7 @@ static void amu_fie_setup(const struct cpumask *cpus)
 		return;
 
 	for_each_cpu(cpu, cpus) {
-		if (!freq_counters_valid(cpu) ||
-		    freq_inv_set_max_ratio(cpu,
-					   cpufreq_get_hw_max_freq(cpu) * 1000ULL,
-					   arch_timer_get_rate()))
+		if (!freq_counters_valid(cpu))
 			return;
 	}
 
diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 0a2e43728286..0906114963ff 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -344,6 +344,10 @@ bool __init topology_parse_cpu_capacity(struct device_node *cpu_node, int cpu)
 	return !ret;
 }
 
+void __weak freq_inv_set_max_ratio(int cpu, u64 max_rate)
+{
+}
+
 #ifdef CONFIG_ACPI_CPPC_LIB
 #include <acpi/cppc_acpi.h>
 
@@ -381,6 +385,9 @@ void topology_init_cpu_capacity_cppc(void)
 	}
 
 	for_each_possible_cpu(cpu) {
+		freq_inv_set_max_ratio(cpu,
+				       per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ);
+
 		capacity = raw_capacity[cpu];
 		capacity = div64_u64(capacity << SCHED_CAPACITY_SHIFT,
 				     capacity_scale);
@@ -422,8 +429,11 @@ init_cpu_capacity_callback(struct notifier_block *nb,
 
 	cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
 
-	for_each_cpu(cpu, policy->related_cpus)
+	for_each_cpu(cpu, policy->related_cpus) {
 		per_cpu(capacity_freq_ref, cpu) = policy->cpuinfo.max_freq;
+		freq_inv_set_max_ratio(cpu,
+				       per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ);
+	}
 
 	if (cpumask_empty(cpus_to_visit)) {
 		topology_normalize_cpu_scale();
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index 32c24ff4f2a8..a63d61ca55af 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -99,6 +99,7 @@ void update_siblings_masks(unsigned int cpu);
 void remove_cpu_topology(unsigned int cpuid);
 void reset_cpu_topology(void);
 int parse_acpi_topology(void);
+void freq_inv_set_max_ratio(int cpu, u64 max_rate);
 #endif
 
 #endif /* _LINUX_ARCH_TOPOLOGY_H_ */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
