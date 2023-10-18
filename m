Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B623CDB484
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 16:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OFDvR04weW9RZNsFR7huxgwbEo7PhUGHXhWVRT4g28w=; b=lPZCz0BuC1HzjX
	rVkEEijClyVcYAHTqg7uE5GQX7o5mTveBnBxoLTYD2h29i/G7lrtADKcW1ZX1YzAFcGqGOUHtV04i
	t667/zqe/tUBRtp/g8GDNzBJ4j2blVdIRKe2FVsN1avYx6AHgURrqIbgBAtlEdKP/XcB7B7PxIsKU
	QpblCd25e/PIg52IrjjIj+RR9RCK3PmsCBqX5P4nZVJZFGGizsdB11O+PFFgr7UKnwoo2qp4fds+8
	ewBiN4P6LcykCMH0mmnm+UzXxn6Tg1AyC6CXsMx62yY0WFiRkB0wkvVYVwZH63dBcAzXMVVVBIZEa
	y+Wu3soyl4RZi2UXu9VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt9N7-00FBE5-2Z;
	Wed, 18 Oct 2023 16:26:13 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt9Mn-00FAzs-24
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 16:25:55 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4083f61322fso5443285e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 09:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697646350; x=1698251150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nf9NNvnyBz0qVw4ihr1xxMPaiT6voh2eHkh7WwYLcYs=;
        b=q7l7+cXDSVdMDohYiHd8sbE6sBJ7z+1DjLz+iNZA9iNmWWIncyBX8f8396qQwWbvI5
         Kz03Ozl+uuNJ1fEXk0K8fM3OpxPYKo28gmA1D4qz5O4DhzPb1JhV7Pr4tvgDUJ7CxWl7
         eMIOGII3lmEC+FY9LHJy3mmjeyqe+JY4JYO/d6Qh9cSAprVDKuSk1cEmz8M7amMp6smu
         lvO0z6mOzkdi1DpeSPA3/PGtXAHtPEHQoeRvrWXvqMjqfyFebW64LP3EI+mxLUg70rjX
         nzwF4YvtLpWZlIAAcp2+EE82joR8hPUalfxRqKPg9pp4K2+D9hzNhgiPOSlHKkBWUjNL
         rLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697646350; x=1698251150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nf9NNvnyBz0qVw4ihr1xxMPaiT6voh2eHkh7WwYLcYs=;
        b=tepOh3L41IFmv28Wl8Jd2LBNRsveSyyeOXjZE9Z6JUXKJ3Qdlv4M4XCCWMy8UJuA6d
         171Uc9IKlBTAazWmJdhnM/J85cZWpgOo4DKqxovjB5aV3pWVUoq6hzdsOpUCopbaDfcA
         Rxfsss6rLMQigSE8fNMay6o45AuOA4ttgyTjyZ6Uu3zk+UdmzZCWZuPwh/lldx240OdB
         3KhwbofCIsRFGhSWqjHeNpbw7fWkr5mg1gw4lV2PZ7jPkhdupmJ/7oOQT5gVT/is4++m
         Cbygte8s3GkfUs+UZVF4Rp4B+e31jkVcTdijD7yntYMlZsQiMcXDrsOUJCu09ilC1FAf
         BgHg==
X-Gm-Message-State: AOJu0YwHtfLm8EuQYRtwr3SV0PDkBmHShWnS8Dr0scPepfWPQp/PIfx6
	ndnaB+m5uLtKG9Y80FPgfPhgOQ==
X-Google-Smtp-Source: AGHT+IFHq6gIgq9/fcdzlz7KWlERZAdzsq5hjSa77y4MZr6K71BH6ckGJqEW3amqmHnP0VNk6KQh3A==
X-Received: by 2002:a05:600c:1990:b0:406:177e:5df7 with SMTP id t16-20020a05600c199000b00406177e5df7mr4970619wmq.29.1697646349667;
        Wed, 18 Oct 2023 09:25:49 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:fcf4:9d83:8d0d:39aa])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c2e4c00b0040648217f4fsm2033503wmf.39.2023.10.18.09.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 09:25:49 -0700 (PDT)
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
Subject: [PATCH v3 3/6] cpufreq/schedutil: use a fixed reference frequency
Date: Wed, 18 Oct 2023 18:25:37 +0200
Message-Id: <20231018162540.667646-4-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018162540.667646-1-vincent.guittot@linaro.org>
References: <20231018162540.667646-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_092553_701731_CE642426 
X-CRM114-Status: GOOD (  14.29  )
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

---
 kernel/sched/cpufreq_schedutil.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
index 458d359f5991..6e4030482ae8 100644
--- a/kernel/sched/cpufreq_schedutil.c
+++ b/kernel/sched/cpufreq_schedutil.c
@@ -114,6 +114,28 @@ static void sugov_deferred_update(struct sugov_policy *sg_policy)
 	}
 }
 
+/**
+ * cpufreq_get_capacity_ref_freq - get the reference frequency of a given CPU that
+ * has been used to correlate frequency and compute capacity.
+ * @policy: the cpufreq policy of the CPU in question.
+ * @use_current: Fallback to current freq instead of policy->cpuinfo.max_freq.
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
