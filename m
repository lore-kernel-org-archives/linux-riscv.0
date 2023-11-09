Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59471C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 10:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rRXO2VtT6vmkgLhqbKBh4MsdpHOfj7NWDNPHnDPww0=; b=q8m+W/4U0XYgai
	oA9c7chjn0FSniFr9CO0PA8eAXynUoIPCBhxhBHyHpz7dYpaBcAaDqHh3ARopbUq4qWy0Lo0V3N03
	+o3iVkZzSYFcs/Xw5Jp1ibdK0vJMIDdrpdXwZoFz00YIV3KFMhPQJ4xSUqeSQmBhO/gx/c9Zl3BCy
	LpiADcNUjnM813j/2wL1N6/m43d3y1jvg42p2Pd65BoP6X4YnmSUV6gMQp50KE9RAR2aYXFAIJ+Eh
	a+yfRSG+GkDSvbeTzuFh/9ePcfMxgNFekGJ5tvwj/IxSt6/Vect+yr+UCSqvximn3jNzqORFgVKXi
	SzzSl32828CFpX3ja0RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r123w-005tpD-2f;
	Thu, 09 Nov 2023 10:15:00 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r123q-005th0-0G
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 10:14:56 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32fb1c35fe0so368327f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 02:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699524892; x=1700129692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8u+U/9u4ohr5MnGNG/ipD+T+tLh/PNcKnY6Yu8ixWw=;
        b=rGZM9Om1l2TcRIEvZjaJtHvVkz8njR594zJEJ8ESR9KILNxE29mUtFXMR1vAwOuxN+
         wIDDzZCfFfrvQ6Xp1v1WPrOPsZRIlKB7LOWsyek6sCkokxffdTOpserOgQ6xA2mpg9jk
         JN42OXZsBYUFzn0jztQm8U7eNDkCE/JOujAigOyRi78AvYr6XnbBzobMN1hvZYcvxqCm
         Qee/xc3krJgZDhFklaN49sHOmYWJJuaTmD0pTIf2Qaqmu+Aj6cUT9Iw0Ul+sw8BROfB0
         /oIVIjUq9++ZFwKFdETCQ5w7Sr3yA3wc6kSFCML56p2LC3Js7CuLL41oc650ZBb1ewtt
         6oAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699524892; x=1700129692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8u+U/9u4ohr5MnGNG/ipD+T+tLh/PNcKnY6Yu8ixWw=;
        b=lPy7xfbQNxhhj/wqZzwTO5mwXtHFoMppEg3b8r8+ZDv8rVT4DuXKDn+Id+aAic9APK
         /aUsU2e/klfqcJoBeOzvbHrypfUsowb0OMDFswqaSsi+kIABMIZCq1zovpuvegoxWJWv
         iwVuPEg985XeuemZKE2OPyCbFiPKoNBGUujWx49rKfcNFhH355fwNGvSNAC12Ny77ija
         gGt7p3F4rm8h6AmmKAemwP8xlxZBvqa1RjOi18y4WXd8AdVOxlEy2+/gJoK+8pgXnmXV
         GsqStw9Txdson/6cP/rKq8ubocDaMqBwZU7qvDjoeHrZ8pnkfLkB2aFx8cP4a8QcBNot
         Kjbw==
X-Gm-Message-State: AOJu0YyJC+AH34sIA0bNppSwhW9yJDaFFYcgy68A9kJHvdMY98ZcVzkH
	lOc7E7IYxlc7frqJSOSLRz8EQg==
X-Google-Smtp-Source: AGHT+IHnOiUcy8JXKcoEvGEFJjBuKV8KQLk7xv3UY4lyz6ACLBnBr+ZIXmzvc3YVmB2uAO7FfkCoEw==
X-Received: by 2002:a05:600c:a49:b0:409:5d7d:b26d with SMTP id c9-20020a05600c0a4900b004095d7db26dmr3556372wmq.15.1699524892326;
        Thu, 09 Nov 2023 02:14:52 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:26e5:c6da:63bc:dd99])
        by smtp.gmail.com with ESMTPSA id m17-20020a05600c4f5100b003fefb94ccc9sm1611816wmq.11.2023.11.09.02.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 02:14:51 -0800 (PST)
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
Subject: [PATCH v6 3/7] cpufreq/schedutil: Use a fixed reference frequency
Date: Thu,  9 Nov 2023 11:14:34 +0100
Message-Id: <20231109101438.1139696-4-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109101438.1139696-1-vincent.guittot@linaro.org>
References: <20231109101438.1139696-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_021454_133560_D0E3B118 
X-CRM114-Status: GOOD (  13.90  )
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
