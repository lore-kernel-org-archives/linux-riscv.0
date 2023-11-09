Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA5DC4167D
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 10:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QG9g4dbBoJC5K4edE9WESEH8Bpr2f75BT1ulEVHRbLU=; b=y2yJdqJedxqarL
	K7dSZD3YcGfcdddFWfBR2vkcH4dLchY8uRXsRoTXHEh4oR0C62OVD8WrYiAPTld8VQconsSHi6j17
	bJhUGZJBVSkFpSbKa1y3dOm3hgwqtf0WoJz7WFgi0Yil74vdomhupKr1eL5jKFAH3Cqmx2lGYSopm
	Ajig7f2bebFv5aubGn6MhzmHWjnUiX9hzCivWyRLZUnIX5SYF+3HnUXJfkLbMAnqbQ8LHaz6GZHuC
	WLN6wiJulqHERiBjY2FFNvSoDu4+NYjYfBglzvNoxI5syeSAdHuPz85MWDDdilVSwVUdJOgdWpYDr
	nRG9FePlTpi/rF7T8YqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r123v-005toL-2s;
	Thu, 09 Nov 2023 10:14:59 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r123o-005tf6-2Y
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 10:14:54 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5094727fa67so902057e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 02:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699524890; x=1700129690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkZaHixUrwPrJIZcMAT2UI1CVMoJazwhG5L/qYNHDpM=;
        b=Qn1L+cDZ0L8wO/AkaOtXJHFBX0XOJ3uzaYZXilLt+KOQcDurmfulxVPCXMj0GTqiJk
         mTXzc4rjSJi7ZKJ45fvfzSRPZbA1YZ8D7/YBVEtS8BVcjtrLiNflRs2qHm8hOSZ+LaLh
         LBgBdOvMfdOJ3gsTYtvf5I4CXFRd7PSf+jWnKwsWUAHoW1AevOwcnUfgnZXrrInMaa+E
         PrJjWyvchCislRM9o4Wtey9zDPSZwGMxFBKPxpvd6GTzVa64XRh/NjF6e7WSIbZoNcTG
         15bIdqV7K/cheKP/iFYt8Vafn9B8pd4BnrZ0ADIxskw1QMW21Zxh6huldZaGtvjpG8Pa
         1HBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699524890; x=1700129690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkZaHixUrwPrJIZcMAT2UI1CVMoJazwhG5L/qYNHDpM=;
        b=a5zdaFUXXqXqYN2CGh1ACOCE1TSlw1P5ErH6z8FAN+knk/tNNGCBhzc+jheyrgymrp
         NhL8p/7f2B5ZDicgJ316ce5PspGfQtTLk3E5m+EJmbuVSXnGFhAAL/8ANCzqYJnX9keX
         DzZgCmf4g2az9r5ZB9Lo3Trbr4Wc4R0F9SiyHewF6ZOjyH6vDx8nyAqPCebnf1odm7jF
         Jur3J/7uBDW+/E+Q+lK5+Xlr9JPTDZLfbPZBNhEba2XWtDuW3SguGJkSIeWeiF9rltRx
         /CogUG5z5hh79I61TfsGy2rTOWKVbpNSjHIULulrPFjR8yupwwFJ7mSAwQBAE0BNADx9
         yocw==
X-Gm-Message-State: AOJu0Yxhz+CyuyZcFB1g0NwJZ6jMThMtecpCNpgGz0xrxM+SoYIvhzmT
	EsAWsC0wOYUN/Pwa/8UlND5z2A==
X-Google-Smtp-Source: AGHT+IEqILPvUko85d9wgnJYU7Vruxwgnn1FhQ0YwiIKlK4c+JNlTI9/ER4u8xuUQ0y1qhtyeTmH+g==
X-Received: by 2002:a05:6512:70d:b0:509:47b9:63d0 with SMTP id b13-20020a056512070d00b0050947b963d0mr880323lfs.61.1699524890509;
        Thu, 09 Nov 2023 02:14:50 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:26e5:c6da:63bc:dd99])
        by smtp.gmail.com with ESMTPSA id m17-20020a05600c4f5100b003fefb94ccc9sm1611816wmq.11.2023.11.09.02.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 02:14:49 -0800 (PST)
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
Subject: [PATCH v6 2/7] cpufreq: Use the fixed and coherent frequency for scaling capacity
Date: Thu,  9 Nov 2023 11:14:33 +0100
Message-Id: <20231109101438.1139696-3-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109101438.1139696-1-vincent.guittot@linaro.org>
References: <20231109101438.1139696-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_021452_870511_0F9DD530 
X-CRM114-Status: GOOD (  12.52  )
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
