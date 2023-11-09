Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F81EC4167D
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 10:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PdVoaqUDXAKiTHSI95ygsTc8CBt+1k2HelmFV0jqwN0=; b=JoJDU0cUasBPDe
	xajobhsFIF6d9lxxdWTBfNVw5jj3ja+de4VcbnEGwVM9Fm3yMTRopDDZxJg550bMjwm1aow+hyO1/
	rjk11ZAmApK2bFxpJ32t60k8x/iG4yfJNgxlQDJ0Lp2BptajRQyiJMc8CxFByv3JIg01u/iFQwa9o
	0RTlAGq49UsxD7TcbWly00cbR4rEOL0hAcNjCSQNUiUP80gG64+fJPADCcJA0lLKqtm+qnkdG5bRi
	MKrS0M7HvkquC8Rz6lXkP6GdV9LHSm8JUAaD+C5X2w8dRbJaeD0xlcgkBTWqcZeErO1XKjWAOn6XQ
	qu3dlsJfs536rep/zpTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1246-005txh-2p;
	Thu, 09 Nov 2023 10:15:10 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r123v-005tmB-36
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 10:15:03 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-407c3adef8eso4723875e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 02:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699524897; x=1700129697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRZuGgttIdjMzTtOY1KLieaDHjYgH97fC7jzr+fvVqo=;
        b=b1BRQJdL4WkMU6LljC8+cG+FkFP8pOu2qlQ/OT61vM6FxuLveYyb/bYeyJIXKBISEJ
         EHcn2AGOOGWlPSbP5wZbuEaW8ieP4VZpbnsWxvGlHOyfjX7jANiJTx+Bk5fAfqaxxQEZ
         GgAHyLAWByFmRz02Lh+WnfvMqcNG7S+3op0GLWptYvU4GTukxhj26IlWoloL4tzIRh9p
         SyZcyZT4oZFRPWbMy+3Adi8VCUeBrbbydFNLmjHAN5h7Ayv3eFaVxR8V2iXYGXMIoIc5
         l2P1Ft2gA8VPWiSIvffA9B7+gU4z4n3iYY1YItMld89FbAmv+t8snSAk3GQKFvsTBcff
         XLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699524897; x=1700129697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PRZuGgttIdjMzTtOY1KLieaDHjYgH97fC7jzr+fvVqo=;
        b=hYhBbMdf52ubnoyoFB9YerMURvgI/UfilWQjdBQ1XhUI8jFpQdU8EbsYjbZx91Rle4
         Jgi+PBFLtXAFaaW3KmRDipt76isQpy8lFMJBUAvREraBOiMfM0ppGsOCoMV0qL/mxZmZ
         2VpCIk1vN+UPRJVDx5zJbbfjXnEypom6Pf6EwhFW6HhbkIlnoMy57zSLng6fwEx2A4Wu
         c/erSlmKhBSLumGo6ZQbVtOSPTuoKNS1h1hpzvOsM0Cfil5gHISyOKomwnCDNi9GP1j6
         FLGrwyd7WouL9HSvmb4h/MWEP5+9+OKnRHij/mkF26T42CpF7tgWMMuBtOjpW62oCHih
         zIcQ==
X-Gm-Message-State: AOJu0Ywbz3vsNQ0sLFthQJHo1BCK/cqruvl77D1nN10hJFEbIAyWeQky
	+T+C7pg0qS4oLkTFGdjJ2kfVAg==
X-Google-Smtp-Source: AGHT+IFErHhK3dv93vXA3skdZjBc12KSv8yFV05cQNNZGn5wIgqPMa1zCHFgcuaqbLUWzLMBHHtZSA==
X-Received: by 2002:a05:600c:138b:b0:407:5b7c:2f6a with SMTP id u11-20020a05600c138b00b004075b7c2f6amr3739930wmf.0.1699524897543;
        Thu, 09 Nov 2023 02:14:57 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:26e5:c6da:63bc:dd99])
        by smtp.gmail.com with ESMTPSA id m17-20020a05600c4f5100b003fefb94ccc9sm1611816wmq.11.2023.11.09.02.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 02:14:57 -0800 (PST)
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
Subject: [PATCH v6 6/7] cpufreq/cppc: Set the frequency used for computing the capacity
Date: Thu,  9 Nov 2023 11:14:37 +0100
Message-Id: <20231109101438.1139696-7-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109101438.1139696-1-vincent.guittot@linaro.org>
References: <20231109101438.1139696-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_021500_009988_70F0B0DB 
X-CRM114-Status: GOOD (  10.26  )
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
