Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F49CC25B67
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 08:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sEgmEh0ijPJxrpGXaE/9seqt9+z8yFlNAOVffCEgNaU=; b=nvNhXlAhO1VwRY
	UsdescyKrFfmFgUztNVSVEqvH4bimoAKyD8wWqiO8vOS4eCZGJImiolWrd+ORx52vrnZxIx3q2RP9
	xWb7wWwjDXLepZAJBCV7A40s1TKgw4n+xC7F/UObDwUehmHJEU5/uefnPhOjDxkLoCal4++WE772Q
	Mn874TZS06albbVqzir4/TYSgwJFa6s6q4O1Jl0KSQqys5ynE9gpk1xFIqYvzElDnzKc1Bw/N9bOH
	vr6jg8DJueQ1PWZ2cxF+qHrg60vMqaHDryvxWwfJcc3F7vohn1SK9/skgqpbSly0ri5rWCR54sxSX
	JL/u6GlWXoLQmkwsPkNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHpU-00FsSm-1b;
	Fri, 27 Oct 2023 08:04:28 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHpF-00FsH9-0i
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 08:04:15 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c5720a321aso23638101fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 01:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698393849; x=1698998649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/qdhwYexgC4eelalZMREFYWDVhGmAVpyIy4h5YJd+Y=;
        b=LpRf4q3OmugHSFk071GMl5LMLgGj6sCf67q0ZlGups+8MnyLih4dl4AEnUHMWFS2+U
         stFh+UkOcyCT10Blp5XIo0I0y31Vjm6BhPnd4cQduQXCtdeWPWM/qEbg7xHc4dkb77VQ
         2t9OKwuECap6xWSG7xE5xpMvSD7JuOEaTsNFjkDzsY/rqdaoeKKNhF5nHS+9ZOsIoB0k
         qy4Y7M78UvAmhg3LqSfvZzL0HHjClC4PwaeLB+juQV3D3aQUdh2afhVttHvI/9OnF97t
         vsQEDHTBBmkKr4xM/wbrUpywCjFeXsm732rlQ3yDmlVStxy4+b892S5lMC93P1+FJ9A4
         YkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698393849; x=1698998649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/qdhwYexgC4eelalZMREFYWDVhGmAVpyIy4h5YJd+Y=;
        b=kmitnUYmv0a8VqpiX7Cgb+5pw+WBEWu8Nc/u799MXMFV/OUQZ4uoV5prNq0ngNNXKr
         vWCjY/4x9THR1Rjcy0xNPa4aJKzJahOLL1h0hzaxDGwmM9ccFbI+HvoMavJlmhvE3KBP
         ECM7kAB0mDPxc4F8cN9jooPZOxR/2ozyheKL3DpcWXD3avyj9+iZKwkEvLHqMP6IXVkp
         SpEX+OppMhxvqyVjwtWsBHrf30hhSLcCfVmez4Ku+7VWPEr3bokC4NlnQ2FG33mWFMJ+
         BvLr7YEWbc0EsZyFYtjHwdS8309K9RJVngwLEImYApY6WkHvgPq2B3jiu+cMD5rUSvMe
         7tkw==
X-Gm-Message-State: AOJu0YxyfINUZ4j9yJAyqTFA8yT4KZwrM0Pc24wmMHih/FprdRTTxRQT
	7pfPrMX1BuAVm+3pXz3VEo8kWQ==
X-Google-Smtp-Source: AGHT+IGXugARg3H3+vIzNim0kJhoC4UBCl4/dUe/XX18rWVm78ZhMKD3Vu64iuuup/7qbp3srdsKEQ==
X-Received: by 2002:a2e:8217:0:b0:2c5:1eb6:bd1e with SMTP id w23-20020a2e8217000000b002c51eb6bd1emr1414040ljg.43.1698393849239;
        Fri, 27 Oct 2023 01:04:09 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:c5e:e24e:ad0b:58c6])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c025100b004083729fc14sm4397488wmj.20.2023.10.27.01.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 01:04:08 -0700 (PDT)
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
Subject: [PATCH v2 2/7] cpufreq: use the fixed and coherent frequency for scaling capacity
Date: Fri, 27 Oct 2023 10:03:55 +0200
Message-Id: <20231027080400.56703-3-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027080400.56703-1-vincent.guittot@linaro.org>
References: <20231027080400.56703-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_010413_268289_96E864E6 
X-CRM114-Status: GOOD (  11.87  )
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
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Tested-by: Lukasz Luba <lukasz.luba@arm.com>
Acked-by: Rafael J. Wysocki <rafael@kernel.org>
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
