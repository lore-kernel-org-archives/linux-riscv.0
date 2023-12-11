Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918ECC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 10:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gKm4lMzYfpfi8jQ2cWvGtOyFi4QJeWLMpRV+ZUKm380=; b=jNJAmiRqIU6He9
	FMDbz+NMwr4RXpWDwzZEZlXdh6/RAJRDehvgolzqwiYXaj8gzvjex6lWNkIcuOIw2mEC4L3lavxMw
	J32SFtutmRYzF7X9Ezy+gmMIXOWZLA6e02yYp+wn5OKwd/zZs5mADExdZ0Ry6blv+vQzxW4U1FwBW
	tjALBmomgQ4IetiKVFz942NOf2oHo8eUGrwSzXkadv5C9DAXyL0TiiFH5JMcHIrc0v/XF0/jbc8oW
	m7yBkO5ZQfbSPQp2mjk6xiFeY1O7taC3MPj/086YomMRZbhws8hKjnnJj63oubjJ/O1rCyEuYqCSG
	sTpHF5LkdJxXCP1nBTdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCdr1-004eFK-0E;
	Mon, 11 Dec 2023 10:49:39 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCdqb-004dzQ-0t
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 10:49:25 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3334254cfa3so2342252f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 02:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702291746; x=1702896546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19YdKXep2h2XKs9tI+n1uE2b2ri9zL5T7djiTxR5FZs=;
        b=eR47ecjzFMgSvhxLbTqxil+SBlHjFKaUd5UJeRKjYCf8pgjZ7sFOm0HCmGsqsN9wkh
         UIQyNhNiyHsXLwPP41Uyzp3GjnIouv8BZtmBtLacLk3A0Pmy1kIKHzYqk4ytLJtTy/ds
         0So/rJXz3Lz2P3dQm2u3YYMP9eEVhrbPuqMM2il3M0jT+34pk6wDcldk258SaSm9lhWQ
         gb5Oy2HUR0nZh68dIgLbTCSvMLosPTAwijFlidnvj3QFlk+urr1adkIOpUg1Rs2HSpz1
         l2wb7nZjA6SVXsTyb9M1jq/t2EGt3o9dJ4UKcSQGqAVJyJorKDXC+vttiPQQQ0GdvOtt
         B4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702291746; x=1702896546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19YdKXep2h2XKs9tI+n1uE2b2ri9zL5T7djiTxR5FZs=;
        b=mq2Z+2YOrgfHRuwxUm1qsTnA3fypb7CsLe3W+acZDF7Z0T63g9hARA6LMr6xbePGLK
         1No7Dz12153Z6b/dmJSG/7Da+pTj6sDZGme0Vr99qdlmibSHOB+2gqzOHnOxC1M4dt3e
         fA/qvBAbnKolPFR5+O0P9fJ9ni6vzFCUmxA7+5kW5/7XUVqTeYs9nfp1abp1yE2afffc
         Z/al9UxKz4yrtJuZoc3JsSAe4Uu/4EV3O9fVDaWSO9Ga3ohqq5GoRzWG6S1c+8F1fFKY
         gzdExKHrhDGbGUq7cQ4+STA/6OAhdUCN2R2gqGBk2GZrYMZh1O9DISxlvXUCjjv047NK
         swGA==
X-Gm-Message-State: AOJu0YzXxZ4PVZRlKh6GIG0E36vPpRAwybGJ3fXnZPe72WMr2xFIAGO2
	hf7XXsCKDKtElmMXZlcBzVIWog==
X-Google-Smtp-Source: AGHT+IE6XqYGAPzyGfJojSMGYv4TCKNLa8KTkknwn96//z5+sFb+KJ1vbQvECdNkL4zdYu7uN7TYyg==
X-Received: by 2002:adf:f3cf:0:b0:333:3d26:7b01 with SMTP id g15-20020adff3cf000000b003333d267b01mr3106219wrp.13.1702291745981;
        Mon, 11 Dec 2023 02:49:05 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:a8d:abc:f0ae:3066])
        by smtp.gmail.com with ESMTPSA id e16-20020adffd10000000b003346db01263sm8232579wrr.104.2023.12.11.02.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 02:49:05 -0800 (PST)
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
Subject: [PATCH v7 4/7] energy_model: Use a fixed reference frequency
Date: Mon, 11 Dec 2023 11:48:52 +0100
Message-Id: <20231211104855.558096-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211104855.558096-1-vincent.guittot@linaro.org>
References: <20231211104855.558096-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_024913_529091_D6D83D67 
X-CRM114-Status: GOOD (  12.10  )
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
index adec808b371a..88d91e087471 100644
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
 
@@ -241,10 +241,10 @@ static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
 	 */
 	cpu = cpumask_first(to_cpumask(pd->cpus));
 	scale_cpu = arch_scale_cpu_capacity(cpu);
-	ps = &pd->table[pd->nr_perf_states - 1];
+	ref_freq = arch_scale_freq_ref(cpu);
 
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
