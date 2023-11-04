Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCA6C4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Nov 2023 10:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4l05mh+v3KVdOAZPFOvQEbqQcJhMOPZvS/e6OQaPqr4=; b=4hjbI5IjrpX9As
	jV1P5kWdLGpQcCPmQOk+Uceuee23RiGHZRgNyqINyKfGZgMDOOpbGFFDnn0pjv6D8z2PU7I9gxzTD
	vHVuDmZd2pStdhKMuIsR6UWMd1EKgh/H0PLUSIseji+P3s1mHUxRhroe+iJGlcpZzV4Ew2o/Mrv96
	davemkk9k7sEDrgypW2pneaAKBpADFSZrYcs83Os5UikGU1dINsROV93967hlu7CbO1fGe8jEQNNW
	N9qRIs4gAOaETT+inXex0f4NU7cQ1IaF34WyPW+jiODxMmhogbnmBqMJhyhRbpm5YzPPX16ZsUd3f
	BV2/vG7TtHdAA1eStKJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzENH-00DH4y-0V;
	Sat, 04 Nov 2023 10:59:31 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzEN6-00DGtC-0h
	for linux-riscv@lists.infradead.org;
	Sat, 04 Nov 2023 10:59:26 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c50906f941so40985361fa.2
        for <linux-riscv@lists.infradead.org>; Sat, 04 Nov 2023 03:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699095559; x=1699700359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aduCSyHEYIhu+IO52anhhUtjmJcDS68d0TTkBLTxAgE=;
        b=ZXWq7SRz5NxufbrjOyUoD2OamqOrxrf6G/W9W+t3r03FQBMf9nPz9Gi7gDWX6Ko0FX
         BmjKzOyVnvJ00UYH+DwQATq/+BhlkpwpZlrtXOtOm8N9n+XqHXkwjobGR5WJNBroowr/
         0ei+cDLiizSGZVIDPgc9l0GOyO8DD06E5AF00rt1SWejK/dSC5FefpT7ljUq2jEZ1Pj5
         9DzDZHxxlEunPyzfal01tD38fawvl/9kOn9tPOAZ9UrNS86FuY2BvKcRYq0IkH7mtAze
         6yh9EwkMZ5zAIUEHczNIxPgFhuldFOsl0LZFMc5R3lOX8xqicx0dCS9I/TfTOBR+6s+M
         3+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699095559; x=1699700359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aduCSyHEYIhu+IO52anhhUtjmJcDS68d0TTkBLTxAgE=;
        b=e109yiemwmkmuqQA5j1xT7z5x/ZU2Z+q0CRF3cCBcSVgEWxdRyIrPhwizylj/u3XpB
         6KEHYaoTj3OPgGZ26DZa9IvSXb2Oo259CZZRpG5AExORndq16UCm8H9FV+Ur0ZultGHZ
         8J+WJioQr5GQnPcGswDmRi5yzjPqHB1R2+0s5gn3jlGFemaba50s2aLAXjGFQjvZTueV
         TCx4twJAAlsl71VMZc+kv6IkYU5B1SZ1qsqOghS5FY/+iFJ8sy50c6ooFTlWl47cwNHg
         qbPfdtitgWBlm5754Ii4LBw6RXkBhyEWLRGgL+SaDO2u4+k+azz6ITLpPlqpuQR2n+Dw
         JI7g==
X-Gm-Message-State: AOJu0YxoXZiCjeFjOAQXpSug2AFsL6vv4HjfiYQT6SAF9ZLDaRawqLmU
	eKy8k8XCB88miaiGwDvUTsT2qA==
X-Google-Smtp-Source: AGHT+IEKPOs60LYQNjgCF6O3RJzRkpTLUhSiH7KaHbkzBZx3/tQp4+sLFyShZ9/I8RYwzr2SsuMl7w==
X-Received: by 2002:a05:651c:1052:b0:2c5:1045:71cb with SMTP id x18-20020a05651c105200b002c5104571cbmr17415933ljm.32.1699095558043;
        Sat, 04 Nov 2023 03:59:18 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:3172:eb13:5bac:126a])
        by smtp.gmail.com with ESMTPSA id p6-20020a05600c358600b004053a6b8c41sm5315809wmq.12.2023.11.04.03.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 03:59:17 -0700 (PDT)
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
Subject: [PATCH v5 4/7] energy_model: Use a fixed reference frequency
Date: Sat,  4 Nov 2023 11:59:04 +0100
Message-Id: <20231104105907.1365392-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231104105907.1365392-1-vincent.guittot@linaro.org>
References: <20231104105907.1365392-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231104_035920_291725_7F8F5276 
X-CRM114-Status: GOOD (  12.86  )
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
 include/linux/energy_model.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
index b9caa01dfac4..c19e7effe764 100644
--- a/include/linux/energy_model.h
+++ b/include/linux/energy_model.h
@@ -224,7 +224,7 @@ static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
 				unsigned long max_util, unsigned long sum_util,
 				unsigned long allowed_cpu_cap)
 {
-	unsigned long freq, scale_cpu;
+	unsigned long freq, ref_freq, scale_cpu;
 	struct em_perf_state *ps;
 	int cpu;
 
@@ -241,11 +241,11 @@ static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
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
