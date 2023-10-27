Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08EBC25B6E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 08:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rRXO2VtT6vmkgLhqbKBh4MsdpHOfj7NWDNPHnDPww0=; b=aigRa0AgwSpE2D
	8zhSzDx1JWrpNKt6bOIcMFIZxpbQ73ffGYSPt8Vp0XgojIoWW5iq/h2duDWLAc1qIZoGXV7c2Z8Ii
	6lg8B350EhduRn5NgwPd37xbvPaU/EiRGQhjehpa+0ygrZE5EEDd/jKuE7+jbXKPYkNU9fCZsH2Uo
	EzcekMBNMXnoLkQZMow8mybKbPMQ+YrYgtCbWxXSde2erRtPKlHgyQ8lN51c9D9W7Fp+9JxltXnUW
	fctldj/lrqO8aoJmtoXLyba92h7sN/KCiPwzmCKeeDhqb5UVp8kqNbz5wyQgMs9fyo+LnqgkzmhDb
	2d9VryW0eX0HZbEAoYRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHpf-00FsYf-0R;
	Fri, 27 Oct 2023 08:04:39 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHpG-00FsHx-0B
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 08:04:15 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40837ebba42so12336825e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 01:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698393851; x=1698998651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8u+U/9u4ohr5MnGNG/ipD+T+tLh/PNcKnY6Yu8ixWw=;
        b=dSBNSdhUUZqc2Qsa/vWUie4JzPq1MZxdRrVYaDQGW4IwtWzM5aaatlUH8hY5IcG9p1
         mjAF5MFWMwiI8RZqQkaqWA18KMmLz1MQEX9rFhY2OT5IdWsJyChnE9B+XJvSJ5yEBOym
         eLYPxvdiBgR8n4uFy1ZoGep/FrHuN0S7O6EVtaMF00Q8z7uAD4cvUtsoQjTdItiUynj6
         9fg8iIQYcxRYi5rbX8oh0TxZmjb2TiqAjetlQWTTfI/QjlGnjywWZ/62DN0LKVDAEv5l
         LJhabx9u8ZWmAzjJG+FEdE7d+P1CWo/n6Q8s9fXrqns3n+RViMRLIsv+ksOqh00cwEK9
         2p8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698393851; x=1698998651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8u+U/9u4ohr5MnGNG/ipD+T+tLh/PNcKnY6Yu8ixWw=;
        b=fpRuUfwgkgKnkt37AUtCSDU3cq5Oq/RJ9BBfzjQPaq0gck4u5F16SOKM/WlEYNyzq8
         0FxpFg95JTxW42jCsuQTVT9DR6OlPwreivg59n9BKWf7oF1L6y5yHkonKiaAtbaCTQXn
         bTV1gK3ebaTXFMIUrTTBP6e1H8Py0psW9M/IOo4AuSfnp+uhrUOoaXnJjWNO1E3gmTkY
         lqe8iiCwd013Mi81WAgPiXskvvHm+0pdMmfMD/V4YaWsr6TE791ou+vSRn+n49whJVR9
         hSe3Lv4J4IBxl3GOVXHoF6Im8KzujRkBEUKP48A9GkL9HPbhJWYc1GY4lrnNMdPR7stF
         HLJQ==
X-Gm-Message-State: AOJu0YxKh00qyATz/f4AA977jAwZR8c+R5XfjZaHQim4FrBr6NGLaA0W
	IsLjicc41itDUbvWgKRyUypXHA==
X-Google-Smtp-Source: AGHT+IHHJHw9trOJbFgvgeyKGPFkJl88ylA+IM/8RiCtB8m/EeKXjTdIKw4FH7YnjB4Tz158dwBttg==
X-Received: by 2002:a05:600c:3594:b0:405:4daa:6e3d with SMTP id p20-20020a05600c359400b004054daa6e3dmr1555522wmq.39.1698393851126;
        Fri, 27 Oct 2023 01:04:11 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:c5e:e24e:ad0b:58c6])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c025100b004083729fc14sm4397488wmj.20.2023.10.27.01.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 01:04:10 -0700 (PDT)
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
Subject: [PATCH v4 3/7] cpufreq/schedutil: use a fixed reference frequency
Date: Fri, 27 Oct 2023 10:03:56 +0200
Message-Id: <20231027080400.56703-4-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027080400.56703-1-vincent.guittot@linaro.org>
References: <20231027080400.56703-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_010414_093877_435F0C33 
X-CRM114-Status: GOOD (  13.73  )
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
