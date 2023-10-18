Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A049CDB483
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 16:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fBCICL4RpfIsMjv+vQi3K6ozJB6TZfDjC661XOTGirg=; b=KfCW9rBcIFkHFJ
	F405/UsXmgheEHDgAygGPFIZpB9TJxKWr7wNPAXlyPFzf7KiQZF9YdBIKNQDxXW9NfDvJm2BjACFI
	W5jPRIJ6FZQ+wwU+vHGcydSSVW4nuDXobeAAELbsx4RGy1ufZMxQU6uBAB/CJotrLEBYrf6N0SnAS
	g35SIbtVzAWJGz3gV6788mCQ94SlYYIdkrEldJEBMjaVXNQ6OQDmizBLC3O2izZHXsl/MLe6GNryB
	7OJliRS3Xlq2XG7LZs8renibxpJ/p2dYPIYdIKaqImA3G3DL93DHeUbm3zXA14jYeXTLUUhSYpiBd
	93IQdRvQWkaz0BwR0cdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt9NO-00FBQ3-1y;
	Wed, 18 Oct 2023 16:26:30 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt9Mq-00FB4w-1i
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 16:25:58 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-405497850dbso65977515e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 09:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697646355; x=1698251155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eArmcx/3FLROUNKiplu862Py9rk3Ajq2JK2reW61wO4=;
        b=hT/8QzRb/EvnU/10IxDubEqj/o8cl1Kjdnc49QpkfWM13T0PK/6mvS1lH7s8NdfUQo
         VkWLhUlkM0hSxwRzJtpPNI80iBt1IBsbeyOUIfKJxP/Q0ZD6PAGRID/b9KdZMFCQnaMt
         jUtU3DS3LY+zPoRLy6Hx/+tg+iaN1B6gAUAKpUHB8UCWrnMKOSDFH/sDcAKV8OY7R7ns
         D9CQblS+b7zRCx+Q6Ds6kN6LBItFr9K9SWKKD5PwG72Bt7U1Yn3Z+KKBw99kIaMHrI8R
         H6j5eVpeY4vycSPZ1c/Io1HXUaX3xVqHDkVL3syWEfYM6kvecxuCmya/R4LTH3poz/N1
         xfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697646355; x=1698251155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eArmcx/3FLROUNKiplu862Py9rk3Ajq2JK2reW61wO4=;
        b=U8pE3Y01pEIvbW6pWgBHJEsozPL4XMvX4LKU8iiWPPv7ortnDXT5W+G+auMk2yWHvV
         cO2pkNAY+ls/4x6plx5HwD6Twi0VEp5HgfCKMs9aL5jUvX1OqZ6EM0genE2Lb4VtKR2o
         2WHLHlftxP+u6fggD+BYU3UOigbDhVMHKEKmfP8sY97iBDi5s0GGmf4+kZHdOmbr2IJ0
         PPx9X0rYffTsKVoqslnKPoXDGdobyInb06sS+lv5aiFw/0TlMHFwOwnZRslzrFZ8BoCw
         VeERxG/mhqrhmy/N5WGAGMawxx1NDTlVXmh/IKyuyjTR8SakbYENUvgjvuIlrxPIL+pu
         Plgw==
X-Gm-Message-State: AOJu0Ywoj9CJZ6rTOZj5Ht9veV7Gb4EQj2PmmexzFgRTaQLsq169stP8
	+2H4P7JLPRUMwr4BAA9jPLkNuQ==
X-Google-Smtp-Source: AGHT+IHH1bVKQkcxpQpcPOoV/O1pBJJD4yJy2dQNFZQDh2nUUXXHgkf49JAtvSqW4FBs4vqcEmXUnA==
X-Received: by 2002:a05:600c:4686:b0:401:be5a:989 with SMTP id p6-20020a05600c468600b00401be5a0989mr4309734wmo.23.1697646355120;
        Wed, 18 Oct 2023 09:25:55 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:fcf4:9d83:8d0d:39aa])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c2e4c00b0040648217f4fsm2033503wmf.39.2023.10.18.09.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 09:25:54 -0700 (PDT)
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
Subject: [RFC v3 6/6] arm64/amu: use capacity_ref_freq to set AMU ratio
Date: Wed, 18 Oct 2023 18:25:40 +0200
Message-Id: <20231018162540.667646-7-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018162540.667646-1-vincent.guittot@linaro.org>
References: <20231018162540.667646-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_092556_592370_3A2E249B 
X-CRM114-Status: GOOD (  14.39  )
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

The default value of the ratio ensures that arch_scale_freq_capacity()
returns max capacity until it is set to its correct value with the
cpu capacity and capacity_ref_freq.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 arch/arm64/kernel/topology.c  | 18 ++++++++++--------
 drivers/base/arch_topology.c  | 14 ++++++++++++--
 include/linux/arch_topology.h |  1 +
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 817d788cd866..0f8f6e90c46d 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -82,7 +82,12 @@ int __init parse_acpi_topology(void)
 #undef pr_fmt
 #define pr_fmt(fmt) "AMU: " fmt
 
-static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale);
+/*
+ * Ensure that amu_scale_freq_tick() will return SCHED_CAPACITY_SHIFT until
+ * the CPU capacity and its assosciated frequency have been correctly
+ * initialized.
+ */
+static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale) = (2 * SCHED_CAPACITY_SHIFT);
 static DEFINE_PER_CPU(u64, arch_const_cycles_prev);
 static DEFINE_PER_CPU(u64, arch_core_cycles_prev);
 static cpumask_var_t amu_fie_cpus;
@@ -112,9 +117,9 @@ static inline bool freq_counters_valid(int cpu)
 	return true;
 }
 
-static int freq_inv_set_max_ratio(int cpu, u64 max_rate, u64 ref_rate)
+int freq_inv_set_max_ratio(int cpu, u64 max_rate)
 {
-	u64 ratio;
+	u64 ratio, ref_rate = arch_timer_get_rate();
 
 	if (unlikely(!max_rate || !ref_rate)) {
 		pr_debug("CPU%d: invalid maximum or reference frequency.\n",
@@ -142,7 +147,7 @@ static int freq_inv_set_max_ratio(int cpu, u64 max_rate, u64 ref_rate)
 		return -EINVAL;
 	}
 
-	per_cpu(arch_max_freq_scale, cpu) = (unsigned long)ratio;
+	WRITE_ONCE(per_cpu(arch_max_freq_scale, cpu), (unsigned long)ratio);
 
 	return 0;
 }
@@ -195,10 +200,7 @@ static void amu_fie_setup(const struct cpumask *cpus)
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
index 2372ce791bb4..3a604b77b12d 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -344,6 +344,11 @@ bool __init topology_parse_cpu_capacity(struct device_node *cpu_node, int cpu)
 	return !ret;
 }
 
+int __weak freq_inv_set_max_ratio(int cpu, u64 max_rate)
+{
+	return 0;
+}
+
 #ifdef CONFIG_ACPI_CPPC_LIB
 #include <acpi/cppc_acpi.h>
 
@@ -369,7 +374,6 @@ void topology_init_cpu_capacity_cppc(void)
 			capacity_scale = max_t(u64, capacity_scale, raw_capacity[cpu]);
 
 			per_cpu(capacity_ref_freq, cpu) = cppc_perf_to_khz(&perf_caps, raw_capacity[cpu]);
-
 			pr_debug("cpu_capacity: CPU%d cpu_capacity=%u (raw).\n",
 				 cpu, raw_capacity[cpu]);
 			continue;
@@ -381,6 +385,9 @@ void topology_init_cpu_capacity_cppc(void)
 	}
 
 	for_each_possible_cpu(cpu) {
+		freq_inv_set_max_ratio(cpu,
+				       per_cpu(capacity_ref_freq, cpu));
+
 		capacity = raw_capacity[cpu];
 		capacity = div64_u64(capacity << SCHED_CAPACITY_SHIFT,
 				     capacity_scale);
@@ -422,8 +429,11 @@ init_cpu_capacity_callback(struct notifier_block *nb,
 
 	cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
 
-	for_each_cpu(cpu, policy->related_cpus)
+	for_each_cpu(cpu, policy->related_cpus) {
 		per_cpu(capacity_ref_freq, cpu) = policy->cpuinfo.max_freq;
+		freq_inv_set_max_ratio(cpu,
+				       per_cpu(capacity_ref_freq, cpu));
+	}
 
 	if (cpumask_empty(cpus_to_visit)) {
 		topology_normalize_cpu_scale();
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index 38ca6c76af56..b6e95d763279 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -99,6 +99,7 @@ void update_siblings_masks(unsigned int cpu);
 void remove_cpu_topology(unsigned int cpuid);
 void reset_cpu_topology(void);
 int parse_acpi_topology(void);
+int freq_inv_set_max_ratio(int cpu, u64 max_rate);
 #endif
 
 #endif /* _LINUX_ARCH_TOPOLOGY_H_ */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
