Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F9DC25B47
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 08:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNjRNiNNJ4V7Cz3O6jd6eJpenWUTonYpXBlyjjJ0cX8=; b=eSRBREEZcvDOvn
	m9bApmcCQnhFe94i+rIgD5C7VAbaMnw74BSmd/LLRnRhf6jpQIqX/EZkWP22CYQfjBzX7UyEotEY5
	UMehVf6H1x3/+4KXA7+fHJhTu7qiErGCzT5fQSx/BT4ayCAhEX+qq1j4ySCfFXirEp9QHM/WhGlwl
	9N22soNikAztAtyJ4hTgj0m6C9/zNTTNFhZuqpfrSxmDeYTJTsqLrU4ap55nd8uzris5ycsZ27u1u
	pgMxbhPdeW5WOMT/zP3PIewQmG6xWNlR0MzprPedpsnmFDfLwS16ezXnTtlc26ywYkkQNKpePUush
	N+r6QqtxIwLZ/yZSLAZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHpe-00FsXs-1T;
	Fri, 27 Oct 2023 08:04:38 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHpG-00FsIz-0x
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 08:04:15 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-407c3adef8eso14423075e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 01:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698393853; x=1698998653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdB4lDzOqWgKx+jcR+6XZlgYVoJSXQa0m+FGwW4RKJM=;
        b=MtmA3RrHqFWShE38LDNgBusojiEdOGnS+enxJ2p4CYPr1AfbxzBG82jL83+tmTEf2R
         4gH+OhF4Xmuny1VCWiiiQrfdDmlehFpm035zd53Lt8T8dHo7jRVS3anzC7efqhXWqkzd
         pRIGPAX+CK0EK57QIANK1SXq7QPI28Y7KGXsHdD4A3d8dX2syS64dIQzucphKcfOnlKr
         G6kHBfNhwB1MENwThwoxw5aQ8sPknnDDUpSlCsb+6bb4ZI1oTfM3RXb65u9ETSkpHHhx
         OEsAiRhpCNqSr8mzMQ7OixDUm3Y+L+RxwvveBsSa3AC/2w2mdiqP+vG5z8670LryRomA
         1U0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698393853; x=1698998653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdB4lDzOqWgKx+jcR+6XZlgYVoJSXQa0m+FGwW4RKJM=;
        b=cnhzhev186lPt6J/Lkp+q2tG+HfKlTZKMKDV1d40Z1hxI1OqpttM5VgaLayUN+XH41
         DgvtXmW8QXhUX/YUrQPu+wCjgoWzXQiPeUR5y2MH943SeHFs/kinYjglnfX0cF4GWX6B
         +2PhIUcxvuPKDvNWopXAnpx3hL10venUzp0v9XznfOKD0eZxh6c/uuiD+PQE5J7Nc/hy
         sTFmPNdZh4NLXBjTlhI6+bCCKf7w6t9ccECK8GxBE8RiPjR5X3mwqHpxhDqYdjb+9U19
         kmDLd9g7QsXwx7F2Ms52wtlblrXgN8H3ya024gO/84FXMW08DY3LBSINGtW9Twf+nYeC
         qcsQ==
X-Gm-Message-State: AOJu0YzXZZ3hb3TYo4WQ+U+sV8lEf5/3Dt+qrh+g6t1UqKa1XfNAElcY
	I7vsHP4T6qUPHUZ4zbWDUSP2hw==
X-Google-Smtp-Source: AGHT+IGrWV8Xk3kn8lNdugKW10Jxvl72LQpr+DY/ZkB+QIZGkVhbRfYWJpxErHANxVy9nJ2+gvLW9g==
X-Received: by 2002:a05:600c:2990:b0:402:ee71:29 with SMTP id r16-20020a05600c299000b00402ee710029mr1624044wmd.10.1698393852695;
        Fri, 27 Oct 2023 01:04:12 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:c5e:e24e:ad0b:58c6])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c025100b004083729fc14sm4397488wmj.20.2023.10.27.01.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 01:04:12 -0700 (PDT)
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
Subject: [PATCH v4 4/7] energy_model: use a fixed reference frequency
Date: Fri, 27 Oct 2023 10:03:57 +0200
Message-Id: <20231027080400.56703-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027080400.56703-1-vincent.guittot@linaro.org>
References: <20231027080400.56703-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_010414_363802_DBAAC791 
X-CRM114-Status: GOOD (  13.17  )
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

The last item of a performance domain is not always the performance point
that has been used to compute CPU's capacity. This can lead to different
target frequency compared with other part of the system like schedutil and
would result in wrong energy estimation.

A new arch_scale_freq_ref() is available to return a fixed and coherent
frequency reference that can be used when computing the CPU's frequency
for an level of utilization. Use this function to get this reference
frequency.

Energy model is never used without defining arch_scale_freq_ref() but
can be compiled. Define a default arch_scale_freq_ref() returning 0
in such case.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Tested-by: Lukasz Luba <lukasz.luba@arm.com>
---
 include/linux/energy_model.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
index b9caa01dfac4..1b0c8490d4bd 100644
--- a/include/linux/energy_model.h
+++ b/include/linux/energy_model.h
@@ -204,6 +204,14 @@ struct em_perf_state *em_pd_get_efficient_state(struct em_perf_domain *pd,
 	return ps;
 }
 
+#ifndef arch_scale_freq_ref
+static __always_inline
+unsigned int arch_scale_freq_ref(int cpu)
+{
+	return 0;
+}
+#endif
+
 /**
  * em_cpu_energy() - Estimates the energy consumed by the CPUs of a
  *		performance domain
@@ -224,7 +232,7 @@ static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
 				unsigned long max_util, unsigned long sum_util,
 				unsigned long allowed_cpu_cap)
 {
-	unsigned long freq, scale_cpu;
+	unsigned long freq, ref_freq, scale_cpu;
 	struct em_perf_state *ps;
 	int cpu;
 
@@ -241,11 +249,11 @@ static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
 	 */
 	cpu = cpumask_first(to_cpumask(pd->cpus));
 	scale_cpu = arch_scale_cpu_capacity(cpu);
-	ps = &pd->table[pd->nr_perf_states - 1];
+	ref_freq = arch_scale_freq_ref(cpu);
 
 	max_util = map_util_perf(max_util);
 	max_util = min(max_util, allowed_cpu_cap);
-	freq = map_util_freq(max_util, ps->frequency, scale_cpu);
+	freq = map_util_freq(max_util, ref_freq, scale_cpu);
 
 	/*
 	 * Find the lowest performance state of the Energy Model above the
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
