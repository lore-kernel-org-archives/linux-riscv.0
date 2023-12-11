Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99314C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 10:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kvzDzvjs1oCg80yFTyni1PxrA6nwesc/hma1FNTbehA=; b=YLPsJ+RrPkp91W
	bgByBsOMhKLctMO1A4eVAncLRACjmUwOf83J+vKbHhPBAW2tqMUPWmT9PiE/5iqhh1qPWWJcE5wMd
	STCm9JfVi9KM/y6P4klH2VhgNYcJsbSd26MvjlCfTsMFvzN8pJWdWorZn8rqg596RJTA8HIqT2EJR
	HKNQlijp966IgBcW6akSjbVabbFrKPEL3+de6UjEhbqcfDhR1VlIOd2+rjGQ/x5lK1UiP5joxRcz+
	pqg1WxNjkYtWcUMjyzFoRRBzx7ISLBj5O2pOP/XPwNOr01/y9VB5IjVJLYVo1isY57D8813/+bxtq
	nrbgTPZZX3ODXMgmZfBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCdqo-004e8H-1o;
	Mon, 11 Dec 2023 10:49:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCdqh-004e4P-0f
	for linux-riscv@bombadil.infradead.org;
	Mon, 11 Dec 2023 10:49:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+sZ8kiVgSDpOUyXf2RtOeDFCi7Cs5gC6EpwhZGADvk4=; b=cHOTpl4FdHqDmnJadlZLIvRptD
	Ceoid9/VT0NuawDG2J0lr3NoAP+pvtyFdiYlc+X9kmwBeq9jDBajvZ4XyN0MuN8nFLtv7sHUr1Ji2
	6JIGmvhDvPytniM2JpFlJ5h5EVjtJb0pbcTkWLtWlgW6HuaDmsyjqQFf+XMlJpDHXTWgLPfl4CqoN
	Q39e+RLKNCY9MZqFt446zKZip8pqFLcxEifJuwmx5tUwHog5qhYcqnYOjDsEcVhOWcCSxSQlEKtJV
	zYmFxX6Ch3WrRmhdo8Rq7sfvOpS6q1RJTCoQICfDh04yE1GRwWnIZyiqvGEy6TQNTyIZMQprWQ8CS
	Pnb2XPAw==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCdqa-0082cv-2A
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 10:49:17 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3333131e08dso4894336f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 02:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702291749; x=1702896549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sZ8kiVgSDpOUyXf2RtOeDFCi7Cs5gC6EpwhZGADvk4=;
        b=ui2qmuk/b6Yprx65/HYeR4USocovwiJKXCdFSOJ3xuu39eX6qK2QXWjHpSvzNmxLS1
         soSLjEQJaKaPUH5iRgIXGlJeKUv67WxVNGh4MAdZnL+tqRREFv7n2K+HscYI5iGWiCa0
         P0ZVWx72YDfwdWtlijOhgZha09nzwhxggZL3T/yK8qAvIbGtdKKzNfjpm3JFwze6te+e
         cj2OTV2JjUoSmATLwtEfSjBN70sq+ZGAvMtZzzlcPZhiJ2pIilLz+KFB5RclTmbXFCLX
         CcRvHK35bJcMWPsFlRTKXsNDJJB9m12bja44eaJT3VGMVnTWOuqlF2ESh9mXt/goeaKT
         xPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702291749; x=1702896549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+sZ8kiVgSDpOUyXf2RtOeDFCi7Cs5gC6EpwhZGADvk4=;
        b=dgcvSLw07NVxC7eJ/ZgNMdBb543kgzpPJ9BvbcbOf4cylBzH/T+LdapBXe36Hia2GO
         51A0k4a0rLI8thEzWk5wHu9FqymTjSYF0X3Wt0yj08PH9QG57Y+adgX+I9ZBtXK8hqW6
         aJq2shQeYP+dortyo+J1bOvs38ora2BZcyEVCYo4IBc49gg+ItWWDvEBIa/7iZoqrDFu
         gY1hCSNb2Mm+hF2BZcA07dTd1GTqNrSrSRlJOrBi0PCpOMuoexYHsjQMCwWYJWQ/Wz85
         WaSinu7jTM4U+OvUdlxex9sDNp8v/fY7XRBFILEwy5SamzVL20mMwEF3r3qbwWVt6nDf
         HIxQ==
X-Gm-Message-State: AOJu0YwnvOlkcTrDAhx4iTZuI51i+ElSgbULXBhfhENrkq+EgXRIZ+lR
	eFNG1uUT7b6tBj5UVbPJTHTITw==
X-Google-Smtp-Source: AGHT+IFSoCtcskpBZxIV6K9X1cjaO7KURWoJMi3lTZ9pqegf+liCRlmjJACZcZ0sjG+wrMj3VN7d2w==
X-Received: by 2002:a5d:650e:0:b0:332:ffcc:861b with SMTP id x14-20020a5d650e000000b00332ffcc861bmr2109663wru.1.1702291748938;
        Mon, 11 Dec 2023 02:49:08 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:a8d:abc:f0ae:3066])
        by smtp.gmail.com with ESMTPSA id e16-20020adffd10000000b003346db01263sm8232579wrr.104.2023.12.11.02.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 02:49:08 -0800 (PST)
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
Subject: [PATCH v7 6/7] cpufreq/cppc: Set the frequency used for computing the capacity
Date: Mon, 11 Dec 2023 11:48:54 +0100
Message-Id: <20231211104855.558096-7-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211104855.558096-1-vincent.guittot@linaro.org>
References: <20231211104855.558096-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_104912_892516_8B84EF4B 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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

Save the frequency associated to the performance that has been used when
initializing the capacity of CPUs.
Also, cppc cpufreq driver can register an artificial energy model. In such
case, it needs the frequency for this compute capacity.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Acked-by: Sudeep Holla <sudeep.holla@arm.com>
Tested-by: Pierre Gondois <pierre.gondois@arm.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/base/arch_topology.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index e8d1cdf1f761..0a2e43728286 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -349,6 +349,7 @@ bool __init topology_parse_cpu_capacity(struct device_node *cpu_node, int cpu)
 
 void topology_init_cpu_capacity_cppc(void)
 {
+	u64 capacity, capacity_scale = 0;
 	struct cppc_perf_caps perf_caps;
 	int cpu;
 
@@ -365,6 +366,10 @@ void topology_init_cpu_capacity_cppc(void)
 		    (perf_caps.highest_perf >= perf_caps.nominal_perf) &&
 		    (perf_caps.highest_perf >= perf_caps.lowest_perf)) {
 			raw_capacity[cpu] = perf_caps.highest_perf;
+			capacity_scale = max_t(u64, capacity_scale, raw_capacity[cpu]);
+
+			per_cpu(capacity_freq_ref, cpu) = cppc_perf_to_khz(&perf_caps, raw_capacity[cpu]);
+
 			pr_debug("cpu_capacity: CPU%d cpu_capacity=%u (raw).\n",
 				 cpu, raw_capacity[cpu]);
 			continue;
@@ -375,7 +380,15 @@ void topology_init_cpu_capacity_cppc(void)
 		goto exit;
 	}
 
-	topology_normalize_cpu_scale();
+	for_each_possible_cpu(cpu) {
+		capacity = raw_capacity[cpu];
+		capacity = div64_u64(capacity << SCHED_CAPACITY_SHIFT,
+				     capacity_scale);
+		topology_set_cpu_scale(cpu, capacity);
+		pr_debug("cpu_capacity: CPU%d cpu_capacity=%lu\n",
+			cpu, topology_get_cpu_scale(cpu));
+	}
+
 	schedule_work(&update_topology_flags_work);
 	pr_debug("cpu_capacity: cpu_capacity initialization done\n");
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
