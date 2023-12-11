Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F905C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 10:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cA/Fre+T5fTdEZoJPrFDhi4CDxiji3hJ2XE1fDbpg+k=; b=yc+lg5bqw5miLP
	2PuhLe4/X3ntaYxWiA8zrgsZU7ysYZWav3ks7eJpNVzVBfrkLIS6HDyjSbMR+QEnSrxcp6WuwtPZ/
	l3ZA8NDI9QBaBADnzKpTGo+P+LaxnR5KpsYc2CSXKFfsOr4UjLryXmikRvS7l344Tq/5tgZgw8Bga
	+Xog2zJJ4MiNA04JKE9PbN2gDPCB+ZulAHxlcmNAoB5JfEekdQGsar5N6po+s5BYP50//OClMxOCy
	+NfMZnLgFLqoGOveN6eLUkGxTFayW8efTHdYks4T5FdOwTL/wvmy5585UpX3MQJUbh1nxTete58dM
	j7U9HE9q5lwxI0w7+N5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCdqw-004eBi-0j;
	Mon, 11 Dec 2023 10:49:34 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCdqc-004dz2-0p
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 10:49:23 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-33330a5617fso4541429f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 02:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702291743; x=1702896543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2OL2mfLvFGb56Ql/fhP2tnzudrp50Fv5hQ+16D3uLU=;
        b=ntsS81FKKW35klgIR5kgdukfzeaPywPQw9HZ7u1hxTz0P7rxzqq9I2h7ebb0HQez9D
         OuwgjuxujsNwXos9z6MjD0VV1NXY3UoinR9gOo3820isMjhm9Df4KxZkAJ3GnOjUSJM5
         m8auG+3mWEiGApeTC5r2rzjXCDZWxHOsSxY11ii0K/PNezdFSbEv01kH1yZhH8Ykv+YO
         w45g3jxdni4fDAUSVsNKSvXogAUgH3P/FAthayb08OeI7ZuJdKq5wFH/2AnQTogXdby9
         i9gbWsk3mAz+/hwo/TwbIZwb8DA5ZujxN0MC56Uu3uo9ggqOXPNCjBUW6LlKNEBcEfrd
         2DPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702291743; x=1702896543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2OL2mfLvFGb56Ql/fhP2tnzudrp50Fv5hQ+16D3uLU=;
        b=UsQxVJi+ctNRB2cbYzLdNUj6Os4QanWItao95rD7zn0N+3TuXPNWAhiq3JmZrnwno0
         cax3QBddXKOvjk2bi9EMgKsjvxxocrpozTLsWAlgD4U+HvQNJu8Kp2IxOmj3mw0T/EnH
         INVXStIZboD3uaz083WfDkzXdCHgb3Dnk8+KLZ9EVeBOPNzjX9ViZZsQBDEdvnlgOnI4
         jWg+2c129oHBVf91JEYCx3hG+SBJ1WtdEX+tCu0gai2zxklQN2+6ovXhjuGoxwkWdSj9
         NIWz7bK5kj555vw+SYR/ZVZ932z0Q3rrBvNQdWgIOlGD0Cyz5Dx4RXgrBc4FrfYt5wTd
         O4jw==
X-Gm-Message-State: AOJu0YzQoOwiB3dOmVAlPgEu977lCMpNiWVdoHw5BIvWFF0FHRPW/FBX
	DHi1jJKwe1jTmjO7Rqbi3k9LMw==
X-Google-Smtp-Source: AGHT+IFG62g0i8MGKgRKqwDFZc4qwAP2pdIhI1VgTkLwdCILDtRtHj7jr7ZHCbn3cvj3/NVslT5gpQ==
X-Received: by 2002:a5d:49c1:0:b0:333:2fd2:5d1b with SMTP id t1-20020a5d49c1000000b003332fd25d1bmr2313046wrs.77.1702291743253;
        Mon, 11 Dec 2023 02:49:03 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:a8d:abc:f0ae:3066])
        by smtp.gmail.com with ESMTPSA id e16-20020adffd10000000b003346db01263sm8232579wrr.104.2023.12.11.02.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 02:49:02 -0800 (PST)
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
Subject: [PATCH v7 2/7] cpufreq: Use the fixed and coherent frequency for scaling capacity
Date: Mon, 11 Dec 2023 11:48:50 +0100
Message-Id: <20231211104855.558096-3-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211104855.558096-1-vincent.guittot@linaro.org>
References: <20231211104855.558096-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_024914_466943_A0AF5051 
X-CRM114-Status: GOOD (  11.78  )
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
index 934d35f570b7..44db4f59c4cc 100644
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
index 1c5ca92a0555..afda5f24d3dd 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -1203,6 +1203,7 @@ void arch_set_freq_scale(const struct cpumask *cpus,
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
