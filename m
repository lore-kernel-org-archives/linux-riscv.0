Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB54AC4167D
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Nov 2023 10:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pp0AaJ6a4reC/xeiiXerDzBQeInm86D1nFoYedV/kd4=; b=EZY8fc0gGZVWDr
	4YjrR3QPR67zw01yeXMZsKH37+/etbBiiDGsTEtx6wHxAuxImKKnTcXgV+rlEmfIB2BWPgbbUlA8n
	Z00ediqzLNv8lA7B/raCaRSA2usZXNw6Xyiu3gIgVFwPzEfyUaIdYNks/9Wy+AC7ugXlHfoZaAeCv
	+0qtbKZyx54Vs4nl1+6cKj9YH5564fAEoOrA/8QiVNjcBoCle4k/T4GlAAi0eG2YrJyaCulMsXB3t
	m3eAJr+uhDC9pLfcU40ZDrbLS+aH0SVzDpDjmEae1U3gISDJH7ioPSBMiTiHzmrSZsohs1TOVejBH
	f2P7IIka/nOkpM+UO7TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzENN-00DHBc-2p;
	Sat, 04 Nov 2023 10:59:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzENI-00DH5N-1L
	for linux-riscv@bombadil.infradead.org;
	Sat, 04 Nov 2023 10:59:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FNdrvAHCbO2wQsDLrmhD3VbPXqYqz7H1z5WaId9LHu4=; b=C3cdqs8yzgHGOqZ/GX8GGSnnn6
	9RW3feQsjz066OspMaGUy6tzVzwEINVbmTuCzXC6vV9pjLSj4uA/0srSKh6KzMbU7YEXcYYvhq3o/
	4tkG5k08oafFdmpUaPDdrF0Ket35R7oTC8ltvDuSTO7OoR/9hrXGBLMKMDurX1Utmk7qlz5gn2R/7
	M9cf0og2GXhiiNZ1lXwh4eOy0OkJ79V394uczMVH0FYHrDFHzkfCf5xyBT8MK2to7AQOw1AjVFei9
	ccWAJqRux+d9KiqN5AUOWY1597fafVOwT1tYvdToBUia2XugoY4nCn202UXACvmoQS8hS1Ekk2yD8
	cuMUtU6w==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzENC-008UFM-1k
	for linux-riscv@lists.infradead.org;
	Sat, 04 Nov 2023 10:59:30 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-408425c7c10so21771455e9.0
        for <linux-riscv@lists.infradead.org>; Sat, 04 Nov 2023 03:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699095561; x=1699700361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNdrvAHCbO2wQsDLrmhD3VbPXqYqz7H1z5WaId9LHu4=;
        b=mCgSGB4zUxvX4rph+MRn2vSnLoSZavaPV0vbgcCCefcW03KifCHoe0xoWivHspwIvM
         tlQD4+aNCGMfK6RtQMPhV1QKcxDtSOpALDhDZNs14Z9FKULD/klk1gQLlT5wDfDmALgE
         /867TZ2Axs3AZH83PH5fat9IUpIkjRZIWYZBYAa2aqpU//py2oP5MapR+ycFbtPdUgHv
         /ZQAlJVk7D4r+FrjL4Uk/IWeuF1QK838ik8ayVnf3tLhzjA23Qs5CprPX3JFEpYjKj4p
         tXlzRGSofmkHvK5eG7ah+kuyUXVtcgTYI8zpW7KYO2HVCpK9s4o6X0fYbVIm0mnIaFEQ
         bx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699095561; x=1699700361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNdrvAHCbO2wQsDLrmhD3VbPXqYqz7H1z5WaId9LHu4=;
        b=PGcMy0b0zOM7fArVwX3md2eynhYNbuTZyipmpkF8jcXqv9k6uVjivuH/zq2Tjo/dps
         0YLguSAkla1Uz5552na2Df1M4v99xq8z1gxzWCC9ADubojJNFXwKv+VSY+cwEJaQiMPp
         HHF6Zt37xFQzumF7Sz5nbNC9nNlfdzGejiqg/zZ7vNYjUzG9iW6HwrMAVdvuDcDoDczP
         EreaO0BagBDYqOBVNGAqmXdSzfnyLI0BLyJ70695XEVDaE6cdw5HsSmxWkZWasQCi4Ds
         AkVZyroNm9SnvQlsOfSqczje81gsn8hqUKycybFs1xuCEy3zcQtMyJxxBF/8nFhM2Xmu
         YHEQ==
X-Gm-Message-State: AOJu0YxXUsPc9fMAcUcRru8UCuT9vE88Nwg7XkNqv8koc0wdTLNHFeNZ
	glS9qGZPhbIKdCeaPMUkq3gKhA==
X-Google-Smtp-Source: AGHT+IFX16YhZelR5u+tsWZEytwlfNm9bcz/1jZWey4m+2AubxcFs07r1OkJ/I/fD8ISwKzggZU9oA==
X-Received: by 2002:a05:600c:19d1:b0:405:82c0:d9d9 with SMTP id u17-20020a05600c19d100b0040582c0d9d9mr21377359wmq.41.1699095561154;
        Sat, 04 Nov 2023 03:59:21 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:3172:eb13:5bac:126a])
        by smtp.gmail.com with ESMTPSA id p6-20020a05600c358600b004053a6b8c41sm5315809wmq.12.2023.11.04.03.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 03:59:20 -0700 (PDT)
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
Subject: [PATCH v5 6/7] cpufreq/cppc: Set the frequency used for computing the capacity
Date: Sat,  4 Nov 2023 11:59:06 +0100
Message-Id: <20231104105907.1365392-7-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231104105907.1365392-1-vincent.guittot@linaro.org>
References: <20231104105907.1365392-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231104_105926_858600_6BBB79DB 
X-CRM114-Status: GOOD (  10.32  )
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
