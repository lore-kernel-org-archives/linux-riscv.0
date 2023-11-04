Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5586C4167D
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Nov 2023 10:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rRXO2VtT6vmkgLhqbKBh4MsdpHOfj7NWDNPHnDPww0=; b=LhkjhXOU2DjVMt
	+P3zbUq1+FvCXj3OuDI3w4+AIom002sE727WNqrHAfWHWo8KNIh45tkCZk1SehQKYHyBpP/z1bWbT
	Aixk226aVidksb2gSvK5jfkE3EC/Bgz75n89/w6vTGFVZfwrRQeEnUmXoiogAOy6Fvu8QwX+jT2X7
	G9EffqLEJ7N2j3c8SbdWkp0lPOXrlOcF2mqkGon6ZSxmujCwb+Ne1uWGqNzqRi/87ZCNFA/8FHw59
	PK6EWakEYrUmlrW/chcFwOj1BSVb0pwBgD0YZrRcfGyYIjij7tLV1XtFn1AuT8rjFNlBB9Un/Wpxk
	Yufqss76O/GWUzEWcP5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzEND-00DH1W-2E;
	Sat, 04 Nov 2023 10:59:27 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzEN4-00DGop-11
	for linux-riscv@lists.infradead.org;
	Sat, 04 Nov 2023 10:59:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40891d38e3fso20866695e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 04 Nov 2023 03:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699095556; x=1699700356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8u+U/9u4ohr5MnGNG/ipD+T+tLh/PNcKnY6Yu8ixWw=;
        b=yDcr53N9ty4FKyl88hYtbLMbK32vBGOOtC9AlofGX8FF8D3S5zT9SMZlNr+QA61Xkh
         VQ1Mf0ihOMI7O31CZyPQnoAJYo2sk5bQwUkORQPOlvpW08ITeEipJmdWBTb2AeHkLA1Q
         uxOJ3YwhDWLxAiYFeTDUC7ISs8DGsdXMK595/8P0yIzTXG8OFOoXxuJY0JVb2zWP49/W
         xbNx225ZpPhsBW6EGQB3r7SkhSyouUwznxTEuySOnXIcgY4/BGwOW1NSu7DydeBeaXVn
         hN77GRaY7r5ubWH6gr6x5svayvDmIhgg3GEauEWNAfj0JClbzjHLaoE1/9sb4V58GT5G
         //UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699095556; x=1699700356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8u+U/9u4ohr5MnGNG/ipD+T+tLh/PNcKnY6Yu8ixWw=;
        b=w2fdIIS3aigFHJbka4AUm0PrpK/hy1tGQMEv/qW9qkLJL93B8UMUuyq5qFJaFUNQx1
         OkEUmnC+lbMaD6+Bh33eQYolcBT78QtiK8bMbbQB69hUah+gZLdU2PD6dgKyUW6PtC1R
         aEjkMzSWv1tMXiQ+OjBIq1VPjvx/NB3eU8rftFKSxjnHCoQqEVEgROKKyz0qUex6XOF3
         RpTxQtw/zJ7YryH0/WzJWSO0DgVg4mqXXTgnVAB92IpwmyxgQp8aP0Ks75pMh8phqpcJ
         SPBg7bDYLsPXUC7Lo4tgtazq5lkA3Ol3ITL9uIQo8K3mVVVkkjC1MEh2TzfhzP8tyOOD
         jihA==
X-Gm-Message-State: AOJu0Yy2nFIB066Id8mxNsXKNk865stPOPJj69kiDbhzwRA9Z0UrRL9R
	sp1EN0UQ3MxJ7T7EUKN3aFSW+w==
X-Google-Smtp-Source: AGHT+IEgFd8wiaeekgZUTxuh/vIlcgbfrV0M4wBl+RauyhFwAF2dZX/wW+3/dVZ2wNb5vfBPQCe4tw==
X-Received: by 2002:a05:600c:470e:b0:408:4f50:9602 with SMTP id v14-20020a05600c470e00b004084f509602mr20968669wmo.12.1699095556439;
        Sat, 04 Nov 2023 03:59:16 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:3172:eb13:5bac:126a])
        by smtp.gmail.com with ESMTPSA id p6-20020a05600c358600b004053a6b8c41sm5315809wmq.12.2023.11.04.03.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 03:59:15 -0700 (PDT)
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
Subject: [PATCH v5 3/7] cpufreq/schedutil: Use a fixed reference frequency
Date: Sat,  4 Nov 2023 11:59:03 +0100
Message-Id: <20231104105907.1365392-4-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231104105907.1365392-1-vincent.guittot@linaro.org>
References: <20231104105907.1365392-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231104_035918_376150_03D01378 
X-CRM114-Status: GOOD (  13.91  )
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

cpuinfo.max_freq can change at runtime because of boost as an example. This
implies that the value could be different than the one that has been
used when computing the capacity of a CPU.

The new arch_scale_freq_ref() returns a fixed and coherent reference
frequency that can be used when computing a frequency based on utilization.

Use this arch_scale_freq_ref() when available and fallback to
policy otherwise.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Tested-by: Lukasz Luba <lukasz.luba@arm.com>
Acked-by: Rafael J. Wysocki <rafael@kernel.org>
Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
---
 kernel/sched/cpufreq_schedutil.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
index 458d359f5991..f3a87fa16332 100644
--- a/kernel/sched/cpufreq_schedutil.c
+++ b/kernel/sched/cpufreq_schedutil.c
@@ -114,6 +114,28 @@ static void sugov_deferred_update(struct sugov_policy *sg_policy)
 	}
 }
 
+/**
+ * get_capacity_ref_freq - get the reference frequency that has been used to
+ * correlate frequency and compute capacity for a given cpufreq policy. We use
+ * the CPU managing it for the arch_scale_freq_ref() call in the function.
+ * @policy: the cpufreq policy of the CPU in question.
+ *
+ * Return: the reference CPU frequency to compute a capacity.
+ */
+static __always_inline
+unsigned long get_capacity_ref_freq(struct cpufreq_policy *policy)
+{
+	unsigned int freq = arch_scale_freq_ref(policy->cpu);
+
+	if (freq)
+		return freq;
+
+	if (arch_scale_freq_invariant())
+		return policy->cpuinfo.max_freq;
+
+	return policy->cur;
+}
+
 /**
  * get_next_freq - Compute a new frequency for a given cpufreq policy.
  * @sg_policy: schedutil policy object to compute the new frequency for.
@@ -140,10 +162,10 @@ static unsigned int get_next_freq(struct sugov_policy *sg_policy,
 				  unsigned long util, unsigned long max)
 {
 	struct cpufreq_policy *policy = sg_policy->policy;
-	unsigned int freq = arch_scale_freq_invariant() ?
-				policy->cpuinfo.max_freq : policy->cur;
+	unsigned int freq;
 
 	util = map_util_perf(util);
+	freq = get_capacity_ref_freq(policy);
 	freq = map_util_freq(util, freq, max);
 
 	if (freq == sg_policy->cached_raw_freq && !sg_policy->need_freq_update)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
