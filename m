Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88B7CDB483
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 16:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uelhBCBxa49U8MCoYzyQKVVX5PlJAe+YH+X8w9VWNWw=; b=CTBVCtzNo/cjT6
	8aBMptt3EwoWRRrUWf/7ecf4Chga5djMr/D+mLxvhp7hgNuTl2E5GcKjqEjyZt9RrC/zWdi2Vfb0j
	402mPejA/zYic6KzKAcqcZ1namzD6KdmN0tafxQvNLYex2fPFslCZ7pogf68CQrwRiyV2qOQgqWLd
	gN/xarSHd5U8Fi1r4VKpB1xqgNQSr4T8flk6FMoXPDMGjttD35UdQuGe0ZldmnU26qQgviZNYiwJ/
	+0HoNe0UBkGk+bpQtaTKzZx3A3Gye5Vp0k9oZzyR2yXTpKqZ5DA1uKbERYu3chG9/ziYHY00AZihB
	IqrBxVtzHvo6ywSE14bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt9Mw-00FB8m-00;
	Wed, 18 Oct 2023 16:26:02 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt9Mm-00FAzV-1F
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 16:25:53 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso5992295e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 09:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697646348; x=1698251148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Z47rGwNrqDmeGZQL2+O4h6n0CW6ulSbmPrUuoIVrkg=;
        b=c5KmFLINmTTLTlmqM+LhH6pCx8LORw8Qxucm0K1l0wZ9E36D5CNMiTLXlSHrbfPNzw
         epcPK0oHIiPUOAuyeei8hxM2MSzoEibl6SaFkxfvO27QHRltrvH4R+LmysapQft6wg/R
         gMelR/cLBGP3ahFbYA5wu7y3133cnWM8l8TZp9j1FtypYRD7Am+z4hUZlrqcpoOyq1Hu
         PFMty9682cMi5SLJzbVimS+LJ3Y3VkuSBAErcgkPOBHIhTqlKYgtQSoinW4MpnJZAzPD
         GeUY/9AXgAM9Ag6sRdyyx2HiGEsHQtK+x6pBNvkEDAeAHIp1zYAsEuYW1MbzGNeU7DAB
         ObYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697646348; x=1698251148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Z47rGwNrqDmeGZQL2+O4h6n0CW6ulSbmPrUuoIVrkg=;
        b=la9o1MFNC8N/84OiSPye7FOSnTCwytxqy4n9e5bQmu+TR/KZZfjc9HyA1prwojnYGc
         BN5L7Vx1A1ySx1FLWHmPAZf2d0iQ3Q4r+lbnuDVAnMoLH6weYe3vWfKkjAci1KLNHpp8
         IjqYTdg8CBcPyRAk2B5cAR2lr5LQdbpxi2XE8thPV8E+sTrFdtgHqq399c2VpJvRnZO9
         S6UQxAesZeGXgn/IE17NpiKibtJxTYh5dRLt/yLvBtT2qOeImWkdUyxqbperWlFRH0gi
         bTWGXK9KecMiix21szaSVckDWjdX/7psKdGPvbZShmgdCJ7zgSVILnKo6ZEv+BDhap/w
         C8GA==
X-Gm-Message-State: AOJu0Yx/syzYNjUxVtW92y7pk063ul27tsUuDKfs+aU1W8vLfDPRx1ug
	36X3GMZn06KCaVYeo+Fjzz5yMA==
X-Google-Smtp-Source: AGHT+IEFZf427eGHrOOELv98mOJEzuRAUylMVQKBwFbh9aeFtmb3e8o2V3eMOH20VJR0QjYnkJDkZQ==
X-Received: by 2002:a05:600c:4f15:b0:401:bdd7:49ae with SMTP id l21-20020a05600c4f1500b00401bdd749aemr4828030wmq.18.1697646348170;
        Wed, 18 Oct 2023 09:25:48 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:fcf4:9d83:8d0d:39aa])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c2e4c00b0040648217f4fsm2033503wmf.39.2023.10.18.09.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 09:25:47 -0700 (PDT)
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
Subject: [PATCH v3 2/6] cpufreq: use the fixed and coherent frequency for scaling capacity
Date: Wed, 18 Oct 2023 18:25:36 +0200
Message-Id: <20231018162540.667646-3-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018162540.667646-1-vincent.guittot@linaro.org>
References: <20231018162540.667646-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_092552_449768_6EE919BC 
X-CRM114-Status: GOOD (  12.39  )
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
