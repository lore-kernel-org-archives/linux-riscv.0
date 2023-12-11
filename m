Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AB0C10F13
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 10:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rcNN1P+WaF3YzyYS1ByNhQA6KGYyxWXzu2kj1aSddO4=; b=F5R7TCqEdgx3/W
	1iO/P+szXHhQrU+OxL1X2oaulxKQBBW/sRf9ImGRVtb973uUihN+CM3oCiQj0B7HkVL0stcTfIeVi
	+YCSKjx8Y9AAe4tSfc01NDFvpodJ+HS34cRBcFmM+PjFieoDPZSNvdxtxKcIU9ImwFD9/v+uplkx0
	JA3AVbvpQ4N+Cl5ymwVszZMUcfyQXcQiu9jkyPDKz+OvniRY8EbU4XvrEQuCwQaRpb6ikt9vLCLIi
	7XNW2tI3EcSHHZUD0edhXl7mcWhbOdjuwQUvHnTMHxK44vVSUit4Ot9y11yzEOPdfSH2YhrN3oFKc
	EFNNO2tn+ClO9h+wFBCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCdqy-004eD5-0J;
	Mon, 11 Dec 2023 10:49:36 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCdqb-004dzI-0t
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 10:49:23 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-333630e9e43so4464308f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 02:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702291744; x=1702896544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RP/GniFhlk8mpJf3Vw6rSOsMkhpCi/hEV2/F0s2ZGQ=;
        b=XLWs3hV5V65KNvq2DKhm3iDEOFnjk1a0+ovDpxM3FsNUBUUx59g3vp6ZSWQvdTnnFA
         BKMYNkbGNpqcZeSxvXVo70rNFw8RckrjbW3DvLbRUw1qWSC+ER7EYehDdrw2E+yMkzTP
         w1a3MkdeQrw0gG9fP6Ri2oa/xD93yG9+ewX//gMkx3bc+Ibr5yvSG7DzyJD3ggT4fAF6
         rzGhZo+Efy1MxdVvWgLyfzQ7JIP35ssmtloHR9KI1m966LbZYsBBibO7aSikfM1622V+
         XajTaVacdCfYaHFWtRj46TppazTZKL+5iK3ngnAfiDHZIv2+FuZ//O7jnmt0x8EYtxJC
         /DXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702291744; x=1702896544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RP/GniFhlk8mpJf3Vw6rSOsMkhpCi/hEV2/F0s2ZGQ=;
        b=lxJP8+zTeuDpqhuZyEAvPJLLQ9jnl9DFAU+WCuiWedv1hvxSmOsAfxnWzrg7jB1y5K
         i1G3yAYSaANCggc2s1llncbrjfV32BD81MaPaPnad45Yuh9bCuHYUr2aQnVAUadYe1Pd
         J6l/J/s2CNt4baG/DGlGdvGlOeZoPw6Mt/3P4ipfTWLAf5lr4PZwuORbR6Q2GNV1UKEj
         Tv2gAC+UKheEAAEfQzicKmMsNL+u0Qo0PTiRZrXpmQhL2p36rrIp5fBnQMytLlpg1KRS
         wYwdggo7KaO71kNO1JkjyUapylSEhRb2OktGla4NnCpIFSfyckkgnd+FCbfEzkfhobLW
         BLtA==
X-Gm-Message-State: AOJu0Yz6KNziv+rUlUFrzmBFiTPUw3D5da1uO4K6+IqGkHZPo0y7h5Wm
	YyKzYFpBBHlvQ+yiXI4R+MydhQ==
X-Google-Smtp-Source: AGHT+IF4eR0dSmCOZr8X8sS8Dj4KfNlP6x21UczztX823PG+ip/O5DiWO/XLFap24V6etMilxZ5itA==
X-Received: by 2002:adf:eed1:0:b0:333:2fd2:3bd4 with SMTP id a17-20020adfeed1000000b003332fd23bd4mr1400970wrp.141.1702291744711;
        Mon, 11 Dec 2023 02:49:04 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:a8d:abc:f0ae:3066])
        by smtp.gmail.com with ESMTPSA id e16-20020adffd10000000b003346db01263sm8232579wrr.104.2023.12.11.02.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 02:49:04 -0800 (PST)
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
	linux-acpi@vger.kernel.org
Cc: conor.dooley@microchip.com,
	suagrfillet@gmail.com,
	ajones@ventanamicro.com,
	lftan@kernel.org,
	beata.michalska@arm.com,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v7 3/7] cpufreq/schedutil: Use a fixed reference frequency
Date: Mon, 11 Dec 2023 11:48:51 +0100
Message-Id: <20231211104855.558096-4-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211104855.558096-1-vincent.guittot@linaro.org>
References: <20231211104855.558096-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_024913_530198_4CBD80DB 
X-CRM114-Status: GOOD (  13.22  )
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
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 kernel/sched/cpufreq_schedutil.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
index 4ee8ad70be99..95c3c097083e 100644
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
@@ -140,9 +162,9 @@ static unsigned int get_next_freq(struct sugov_policy *sg_policy,
 				  unsigned long util, unsigned long max)
 {
 	struct cpufreq_policy *policy = sg_policy->policy;
-	unsigned int freq = arch_scale_freq_invariant() ?
-				policy->cpuinfo.max_freq : policy->cur;
+	unsigned int freq;
 
+	freq = get_capacity_ref_freq(policy);
 	freq = map_util_freq(util, freq, max);
 
 	if (freq == sg_policy->cached_raw_freq && !sg_policy->need_freq_update)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
