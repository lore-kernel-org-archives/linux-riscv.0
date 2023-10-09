Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8C5E95A8E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 10:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VElyfrcYeOweakioawbYKKPDyXhaY2GzOGngp+WLrOU=; b=OL2WllJQyCER96
	QqB30wwQCoVwMj2R/WBue5k6i3age3xy+8+K0EHDPCpuIrLDPLX6SHGRLVrM4i3FrLTfOIe29yGf9
	J05WGRK2p7OOoDne2+RzWT6bFnJN1Hb3l5y55WeRtXlER6iyyvtKHm+hp0xzl5xS5tW+mRwe2kQTq
	zd/GLPGtfhismYZ/b5mmxFVIlZ1l1JRUXMGN4Q2DLfUs8UliclJ0ii5dIUoH2oX2RouoyuCfLKWgq
	OlOEt0l28SbwnnliAs8y7v4wD2i88n6mpPfhL2xQIrZ6dsI1mPHQI7TMtqKgZOSreySOcXRi1i0AE
	IeqnqT3VVAjHX9mGI3/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpncv-00AFdL-30;
	Mon, 09 Oct 2023 10:36:41 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpncm-00AFQr-2Q
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 10:36:35 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31f71b25a99so4358162f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 03:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696847789; x=1697452589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNKKT3nz1YObI5oerkbE50Couf3/jlljKZ/fkPRsfb8=;
        b=gPc08vcY9r26P5KrGGQzdJrRxX78S2rgWPzurQwWN7wa/bAb27HBw6A4kt4hEO4jh7
         IOrBUJMLWr4FKqD5hnLvV+BTreukM1OhuL/dbt1k6PtPDCusTjkKlacroT1zodYISHHM
         WLYJijELCA5RZ/rTBYHi0mkBDciIfuf76awHFfiucv7lYPhHc2MTh6BQ31lxbGNw88cF
         PyhGiXmyhL+rnSXac/6nhYwECzRnl9eWY4mdGTFseunzyfQJM0EfTAuBEsWSeNwyMDWk
         YClYe1vWE571StxaWrD0VOEOF098gTdkrxs9mDHbdqaholVOyJ9+lDOycMOEdu3JZs6a
         kzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696847789; x=1697452589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNKKT3nz1YObI5oerkbE50Couf3/jlljKZ/fkPRsfb8=;
        b=Yl0iV/Bsj1SIv5QXMJvgBfmq+HyMfUnWf3uCFEXn3boYgtjeECGm/2YrVZ3NGCk7s9
         hoWaWYPzh4E/UpdnIwUhmQ/QjzMoMs69MW1PHasAJbxCix93D1aldGMJepsnD/Ryjjai
         17fEx2vmsi8HJQIsRH380JMovkel1Ph/ri1Yl5lTBk0gsclH1yr0wvmty/EIdh8bEEaD
         yxjPBnwi3xVBajvDDQc5wPzmxwPqX1gtKaTzCZnGKk6286hwlsvHUNpkFrmBwAh0oMx9
         T2YZ6r02qqbujohTVnY6JaDJEkS7+5DLuoD2o33uO8brZgqAm+IgLcKxRsDNA9LT86aM
         J0Ug==
X-Gm-Message-State: AOJu0YwqBeHP4TJgv5oJkNlPgIK5RGLVJ7GF/7rT7J0viogGxlVaR1pv
	IxYJvRgabdXClNPFr7UigS797g==
X-Google-Smtp-Source: AGHT+IG26Qla65j//2waJk5p+C3Wp1IkFGp+wjCfVC7nMqMP8R+PELrHfGujdUavK8O0HgXO8xjo4Q==
X-Received: by 2002:a5d:4586:0:b0:321:5e2f:37e1 with SMTP id p6-20020a5d4586000000b003215e2f37e1mr13248647wrq.19.1696847789459;
        Mon, 09 Oct 2023 03:36:29 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:53f1:24bc:5e47:821d])
        by smtp.gmail.com with ESMTPSA id f16-20020adfdb50000000b0031ff89af0e4sm9226722wrj.99.2023.10.09.03.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 03:36:28 -0700 (PDT)
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
	lukasz.luba@arm.com,
	ionela.voinescu@arm.com,
	pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org
Cc: conor.dooley@microchip.com,
	suagrfillet@gmail.com,
	ajones@ventanamicro.com,
	lftan@kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2 3/6] cpufreq: use the fixed and coherent frequency for scaling capacity
Date: Mon,  9 Oct 2023 12:36:18 +0200
Message-Id: <20231009103621.374412-4-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231009103621.374412-1-vincent.guittot@linaro.org>
References: <20231009103621.374412-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_033632_845047_BEEFE84B 
X-CRM114-Status: GOOD (  12.43  )
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
implies that the value could be different from the frequency that has been
used to compute the capacity of a CPU.

The new arch_scale_freq_ref() returns a fixed and coherent frequency
that can be used to compute the capacity for a given frequency.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 drivers/cpufreq/cpufreq.c | 4 ++--
 include/linux/cpufreq.h   | 9 +++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 60ed89000e82..8c4f9c2f9c44 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -454,7 +454,7 @@ void cpufreq_freq_transition_end(struct cpufreq_policy *policy,
 
 	arch_set_freq_scale(policy->related_cpus,
 			    policy->cur,
-			    policy->cpuinfo.max_freq);
+			    arch_scale_freq_ref(policy->cpu));
 
 	spin_lock(&policy->transition_lock);
 	policy->transition_ongoing = false;
@@ -2174,7 +2174,7 @@ unsigned int cpufreq_driver_fast_switch(struct cpufreq_policy *policy,
 
 	policy->cur = freq;
 	arch_set_freq_scale(policy->related_cpus, freq,
-			    policy->cpuinfo.max_freq);
+			    arch_scale_freq_ref(policy->cpu));
 	cpufreq_stats_record_transition(policy, freq);
 
 	if (trace_cpu_frequency_enabled()) {
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 71d186d6933a..bbc483b4b6e5 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -1211,6 +1211,15 @@ void arch_set_freq_scale(const struct cpumask *cpus,
 {
 }
 #endif
+
+#ifndef arch_scale_freq_ref
+static __always_inline
+unsigned int arch_scale_freq_ref(int cpu)
+{
+	return 0;
+}
+#endif
+
 /* the following are really really optional */
 extern struct freq_attr cpufreq_freq_attr_scaling_available_freqs;
 extern struct freq_attr cpufreq_freq_attr_scaling_boost_freqs;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
