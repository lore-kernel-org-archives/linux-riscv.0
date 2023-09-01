Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DB7CA0FE6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 13:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b3aqTC1TdVMHD3raoF6k3lQ4WNx6PC2NuTsKqi90XyA=; b=u5LXMPjGaJYWDs
	Aw5PbF0KEEbu0iiZMHubLthj5MqK3IaRRFHh1W7HR1mNuUaFt9bs+gipTbcZqUIc9eY29noMcUvf9
	MR8deGhNDkpFTy9IYZ9P8Lr39ncOSMQCJxVV1WDXY9X0PQJlOty/vk5mS2l77sjHLL/pt8tWTl2AI
	zdb3eUwHVKZmJzIN3KITugsI2w/LT7Y5tOkuDENGn4vQhFzQyyba0igeoc+Oc2brsrrROZVsCQ4Hp
	7zYD9l/uFgcwQV96AYD52r+XIpqIM846UfgN5WzktVHLrOHA+bTw22YSUkdqrSETUfI9ciueQeFhv
	n/ESbAJq9kjHEqpgHGzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3o9-00HXMH-2l;
	Fri, 01 Sep 2023 13:03:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3o4-00HXHB-1m
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 13:03:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3ff7d73a6feso18807705e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 06:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693573402; x=1694178202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBj2auLlUAXmJtm0JLBXBgA7sNg7bnkhJEMz0GdiTZI=;
        b=KrMZLf5Pe0ZDPTImpkcs2Ee+mo/Q6uGnW6sRYtOY6GhFP12PNQqsdSx2lZDI+nGA4q
         TRAr9wF5J1sUJ6aTvs409x+HAaXkmU5Fm7F6vl6wIzPV3YCJzWpGf//8Fc5WL77Fye65
         p0NaqTq9Up7XiR8fYTeH/eYupfshAqLuIhcQiqhjKwgIt8dArN90JuA93RZWgKDfytHm
         0LdyGQtqj69Bf2M42/EuIFFY648l00ybulNbL2qSaXbX0hOTbKnX+57ThHlcllvdHGfr
         e8HcYMAOr8Sg+zG3VjjTxvUcvRBw8tDlv4Txt9pp8xWIicYTcGBhUKVY/eGlQ9YVdUGU
         pnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693573402; x=1694178202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBj2auLlUAXmJtm0JLBXBgA7sNg7bnkhJEMz0GdiTZI=;
        b=M5qKLtn67uAJFWd/rLa2OQxHjQWUZZUwz7NYEFV0/g5QWiiatp7a34a1FHlDyH8T43
         jptksLlEn00Kgyb1/qk/3rv4cNzsBWlG+EWCvEe+KDSEx93T24bPkI2VxE9kc8i1Pbqn
         MB7uOGBj6wlGb3koCProKdaZPOBAPxrMyMX+wgFHxUdgc7d3f+Fa4MxJGRkSOr2tHSZz
         Xu01a01tbZrXp0WFWg/AaQIReB3Nt57gOmI/dNXbHZi23zMscR76r33nnURz6oATNxjj
         d3k/ztQ6BhWuXhr3/Ajy2DV6lnfQkV6ZCb8GUTUWd3SqMPH3/rQghInzP9kLC7dzxyta
         k0PQ==
X-Gm-Message-State: AOJu0YxCHL4gynaEV62dEbfRFGUDkKUsOaX8kRUtK1WQvR7smRomr4EJ
	4u3U2jltCokpz+PPlw2IL7JUZw==
X-Google-Smtp-Source: AGHT+IEQD39cpHWbAVr3Bfe0Bk2YZV7G5Wbn5InEVXtG214GUwMtcEYoELLPBmdXYyGWOssaBv1Vxw==
X-Received: by 2002:a05:600c:234a:b0:401:bd95:2e02 with SMTP id 10-20020a05600c234a00b00401bd952e02mr1551706wmq.39.1693573401777;
        Fri, 01 Sep 2023 06:03:21 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:e9bd:add1:d9ac:7b3e])
        by smtp.gmail.com with ESMTPSA id i14-20020adfdece000000b003142e438e8csm5167452wrn.26.2023.09.01.06.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 06:03:21 -0700 (PDT)
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
Subject: [PATCH 3/4] cpufreq/schedutil: use a fixed reference frequency
Date: Fri,  1 Sep 2023 15:03:11 +0200
Message-Id: <20230901130312.247719-4-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230901130312.247719-1-vincent.guittot@linaro.org>
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_060324_613656_A04E68A7 
X-CRM114-Status: GOOD (  14.76  )
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

cpuinfo_max_freq can change at runtime because of boost as example. This
implies that the value could not be the same than the one that has been
used when computing the capacity of a CPU.

The new arch_scale_freq_ref() returns a fixed and coherent frequency
reference that can be used when computing a frequency based on utilization.

Use this arch_scale_freq_ref() when available and fallback to
cpuinfo.max_freq otherwise.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/cpufreq_schedutil.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
index 4492608b7d7f..9996ef429e2b 100644
--- a/kernel/sched/cpufreq_schedutil.c
+++ b/kernel/sched/cpufreq_schedutil.c
@@ -114,6 +114,31 @@ static void sugov_deferred_update(struct sugov_policy *sg_policy)
 	}
 }
 
+#ifdef arch_scale_freq_ref
+/**
+ * arch_scale_freq_ref_policy - get the reference frequency of a given CPU that
+ * has been used to correlate frequency and compute capacity.
+ * @cpu: the CPU in question.
+ *
+ * Return: the reference CPU frequency.
+ */
+static __always_inline
+unsigned long  arch_scale_freq_ref_policy(struct cpufreq_policy *policy)
+{
+	return arch_scale_freq_ref(policy->cpu);
+}
+#else
+static __always_inline
+unsigned long  arch_scale_freq_ref_policy(struct cpufreq_policy *policy)
+{
+	if (arch_scale_freq_invariant())
+		return policy->cpuinfo.max_freq;
+
+
+	return policy->cur;
+}
+#endif
+
 /**
  * get_next_freq - Compute a new frequency for a given cpufreq policy.
  * @sg_policy: schedutil policy object to compute the new frequency for.
@@ -139,11 +164,11 @@ static void sugov_deferred_update(struct sugov_policy *sg_policy)
 static unsigned int get_next_freq(struct sugov_policy *sg_policy,
 				  unsigned long util, unsigned long max)
 {
+	unsigned int freq;
 	struct cpufreq_policy *policy = sg_policy->policy;
-	unsigned int freq = arch_scale_freq_invariant() ?
-				policy->cpuinfo.max_freq : policy->cur;
 
 	util = map_util_perf(util);
+	freq = arch_scale_freq_ref_policy(policy);
 	freq = map_util_freq(util, freq, max);
 
 	if (freq == sg_policy->cached_raw_freq && !sg_policy->need_freq_update)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
