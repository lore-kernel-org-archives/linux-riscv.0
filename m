Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3C9E95A99
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 10:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GumGo3bP4rjswLbrmHI22BeptoQWtEbJKYv2c+cvQzU=; b=GkLPGoxDSGzRiY
	Qo3NH/Ox9UEQ5o9PQHWYfFDTNgx6Yc5c522s7ODTtNqa6mP5zDjhuUFDSkwXHrun9vDGEb9YLNxBh
	AZ0Edj/MXRSuLmqqXQBNCzWyLWNHylOAW81Xbe4fKz5DJ6u+Tphq86hUbxMSQCU2CyoYdvZC8u0IA
	UDcCHq20ObLkbNSeO2dBJ7Bm1XBMdiERhj5lAUQMvUCyYCpl2j4tDS23zeF5KlchuX3U3s5qqz5n/
	5nQdfxpPa/gTB//25GZs9Yk94+KFgX2kEYImH60mPom96/JSXAWMT9N3on/8HYmf6SVH2Badwb5wW
	u2DElc2I4RgawtDdjhAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpncv-00AFcn-0s;
	Mon, 09 Oct 2023 10:36:41 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpncm-00AFSM-0H
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 10:36:34 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3296b49c546so2468751f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 03:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696847791; x=1697452591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmtdGUvSawQ4q9KDGPlbeId1/iTLhEjjDMVIwSogQm4=;
        b=vRd2l2xDOutOSvMlsfJP4VTrYCE4uXv1W7P1pbhrJEwXIFu8Bqo6wwd+eV44Q4JVR1
         q1J6u7exm5UGQu35ILJmNiJN3Faw15s/XT+WhQgxJ3nevq/Eg37ItCc6DGzCItr3OQB6
         cUhv4eLZVld7A7chozt6I2QxBqbXv3gpVV+MoLQSZjamc/hCYqeIOwg89XQJ4tcJT0vC
         XQpHH1Y8fuIM5KrORoXNw0CWLWJ+vNfEVNLy3xvhONBSSda3pzJUMt+pN9bj4bJS5uqV
         CR9gNJARIXbp14grko0C2kudWBUlYBvLJfcWU2TABaVSFT2uhRs3FalrnE1uewW9WQ52
         2XuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696847791; x=1697452591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmtdGUvSawQ4q9KDGPlbeId1/iTLhEjjDMVIwSogQm4=;
        b=VySnaiXxHH0xui8r5xznHgIAnJfsksj8fulR89C3/VuJGp1TfSJWSJEW/Rrj7PaXa8
         To11wTcafYBtiZOcuF+euzVb3zhWfdbYfCoVVPBQyHTEKeGbZ6TifabOsArYWXJtd0sH
         lGgowcZRphPL2K6AumcCGJL9RRNvnKBJy+YWAhPwypsH35sj1Y/FAM+bcBoLn3q/GSpP
         i5WNRke6L5Y2fXpiS1x7Pa2J9SL8tgHFUtdE1QDhgEcVIcMY91TPse3Gz2X18fUlEIJn
         mBkBBd3lOkOUI0G7zNixV2wIINEboOgMTN/RJQo8ADvwosBM7SyaGnJJUlsYsJJXhAgd
         Z8SQ==
X-Gm-Message-State: AOJu0YxcgY40AJGjlTcjFrbazB46X3fz447Ll00IZoRbkXd45+/JCqDW
	2TSkGo8Dp5wN7P+pjay/TO02mw==
X-Google-Smtp-Source: AGHT+IFsDHg/Rs8MQPYQNA1a7DXBKSokGpRKvXSJgz2PNurvi4j34eIaCQtgEUCXe0uK4YQzK2pDKA==
X-Received: by 2002:a05:6000:91:b0:320:67:5580 with SMTP id m17-20020a056000009100b0032000675580mr12443168wrx.5.1696847790816;
        Mon, 09 Oct 2023 03:36:30 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:53f1:24bc:5e47:821d])
        by smtp.gmail.com with ESMTPSA id f16-20020adfdb50000000b0031ff89af0e4sm9226722wrj.99.2023.10.09.03.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 03:36:30 -0700 (PDT)
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
Subject: [PATCH v2 4/6] cpufreq/schedutil: use a fixed reference frequency
Date: Mon,  9 Oct 2023 12:36:19 +0200
Message-Id: <20231009103621.374412-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231009103621.374412-1-vincent.guittot@linaro.org>
References: <20231009103621.374412-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_033632_166489_13072BF0 
X-CRM114-Status: GOOD (  14.51  )
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
---
 kernel/sched/cpufreq_schedutil.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
index 4492608b7d7f..1fa7e74add8f 100644
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
