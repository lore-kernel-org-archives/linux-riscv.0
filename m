Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCE5C0018A
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Nov 2023 10:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QG9g4dbBoJC5K4edE9WESEH8Bpr2f75BT1ulEVHRbLU=; b=0uUi42C5cfyXwo
	CUmTuzjfWS1yw9rjNvJdzspsiqwC7tZTPxXTUhiJmIgTxkLjg124RDkHU7c3i1xVCR6iPlXtJoBcX
	eLOTIC+ybSdDkwuTt0qbrVb0gJfPW8Mc3nGVkggZfYMH7ZmOWHnLmkJ7Qkk5lj0L2MaXAyna5r2wn
	D+IP2cOk8kPIwlVKxf35LKFXNi5ojUODYrv664g5AHVm7WJiJTTQTWS1Jexi1IAFGpawV004xPdXd
	O1rIL35EbMeWTsFUOEYmb3rCXf74DAo1aODnl/6wkajRQJcd8Uf0PZ+bdEe3CConv1/mZiK0nHzNF
	gloH1zpsCI7rTRnpfaig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzENF-00DH39-1A;
	Sat, 04 Nov 2023 10:59:29 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzEN4-00DGo2-1H
	for linux-riscv@lists.infradead.org;
	Sat, 04 Nov 2023 10:59:24 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c59a4dd14cso38533951fa.2
        for <linux-riscv@lists.infradead.org>; Sat, 04 Nov 2023 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699095555; x=1699700355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkZaHixUrwPrJIZcMAT2UI1CVMoJazwhG5L/qYNHDpM=;
        b=B+mb6WCvzWl+n9xSX6fGpU5uHinxH00yDIzsv5k+AJvHjCg9vh8FGQAGa+5XrPlKnb
         tRTfSXNTeXyoDG+Rs9q/ex3qGmtj0QCTt8KUNDTmpZcfYClC6adlRWcJwNXk/KQTTlx8
         quDM9uU75R8XxfiI8pargmUoyQ5ksISOPXuqluARN3F0Fgj0LXQLz503vm6FohrvWrol
         Kb/a8E/aGynxuOcZp44wJcJ07x/K8XGftN9sZpblUQHlvzEPOZUefhLXy5PwCmbm59Y9
         4umi5DqCKYeePOGWH5o34xgIJpqQWZDFMDXSioacy5eIW6/qH3EMZs/WjCzsbkGnXlAZ
         5f0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699095555; x=1699700355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkZaHixUrwPrJIZcMAT2UI1CVMoJazwhG5L/qYNHDpM=;
        b=HBjg5HfB7r9/Ks9APDLO30gBCNPX0d84udZbeAQzZH/n9gL+QJrEyLunle5XTTaDz3
         7etWO2pKdfDlPxBVli73nSF0eNBNgtG9cmEbaIUJdiSYKqlYYqrRqABltsAX0cZyvmnx
         4vkHr+nMsaFgt0m97Mx7oF00O++R/VIW8WLXYjfHc9AVfnRsm62nuGTn51jIg5Bozr1T
         mvX8b+Pn9/6eYA/yNEiGOjYYvLHhMdZ95Q26tf3w8mYOsamNo8TrOxtqcR41rRejLAab
         RhVFViT9I4OZtb5bmNCLuWyNf5yS0GtbdjHYvA6/Cb6y1QW0F9fAN+k4e9Ee0OaxVP4i
         +lqg==
X-Gm-Message-State: AOJu0YwyGry2hLE/5i90iJtSb2FPvB0tsc3ttRSQP9M/sXJFjKmxY2ip
	dMIsx8OIIZUUMuUhQvz4bLe4iQ==
X-Google-Smtp-Source: AGHT+IGatMiVkHBmtEgXSS+pWzzTWU/5QphnZgu+ruqZQUWWzvRdCWO28Yzol+5QNvFneAB53ahKPA==
X-Received: by 2002:a2e:7a17:0:b0:2c2:a337:5ea with SMTP id v23-20020a2e7a17000000b002c2a33705eamr19234202ljc.27.1699095555017;
        Sat, 04 Nov 2023 03:59:15 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:3172:eb13:5bac:126a])
        by smtp.gmail.com with ESMTPSA id p6-20020a05600c358600b004053a6b8c41sm5315809wmq.12.2023.11.04.03.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 03:59:14 -0700 (PDT)
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
Subject: [PATCH v5 2/7] cpufreq: Use the fixed and coherent frequency for scaling capacity
Date: Sat,  4 Nov 2023 11:59:02 +0100
Message-Id: <20231104105907.1365392-3-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231104105907.1365392-1-vincent.guittot@linaro.org>
References: <20231104105907.1365392-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231104_035918_489149_6C201997 
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
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Tested-by: Lukasz Luba <lukasz.luba@arm.com>
Acked-by: Rafael J. Wysocki <rafael@kernel.org>
---
 drivers/cpufreq/cpufreq.c | 4 ++--
 include/linux/cpufreq.h   | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

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
index 71d186d6933a..738dcddf3cfe 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -1211,6 +1211,7 @@ void arch_set_freq_scale(const struct cpumask *cpus,
 {
 }
 #endif
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
