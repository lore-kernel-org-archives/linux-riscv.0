Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C943C25B67
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 08:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZeFXSn9T4vDTh/TbqGvIV+7JFblz4ykHhEbAyfU6nq8=; b=OCKFWoAaKWnPOd
	iVD5PfBmcTjHis0YQbmIaMFOvUjpCAH2GPhLOJKwaaUKD61EmqgLA4rvxhmuE21bA5NKVj4PAgDZO
	xd7qwpdsWBC6bvdXwAZK5dYnlJcpBL969sblXwcQW6u9XbNbGByT8pC4rkpmBbS4WpQPF+XXkCoO2
	SphoYcnodzax/Ob5Z4+VsVCS9s23X74/SiKkWiyoYsq1RUUTAVEK/lwNqw9pFetKdoRP1/nRu9M4g
	DipbUk3kXUUXFv907aNAdum8wpuJIhaoc+EjxK68q0OmKRC/DIbPx81U7zWO+wRIOypWXpcKWZtQh
	0L7/dJqVJHdLvFk9gSzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHq6-00Fstv-2c;
	Fri, 27 Oct 2023 08:05:06 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHpM-00FsM0-1v
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 08:04:23 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5079f9675c6so2745465e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 01:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698393857; x=1698998657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c18WsKqkMLxlFb2kxy1TvqZw0mGllHhrI7E/VCZUkXM=;
        b=RJr/eWAE/xl+cwMkFoM8u+zDxUqSTqWEZRVj5AtHijmhiiC8w0xjZwkq0k0dVyt75X
         z8cDZkALoVMU/lzghUZKIjvhciuUAUxoSa/XVZOS9L57k+KVSe9dXWDho3h3hOxEyYs+
         kMPP9rTd4shOsTudLwNh/uYq6vHTH8AWmK0phabKf/AcUiPS0ARIb04yGqahQet8dX4o
         tUQiOP4yBXmyl8o/duMee7lonSxyz5F2lEY4LD+7iAP3LMD0eC2B5GLk/3lwAOLO1PLy
         FfwznfSqL5dIBlONQmsmuJ+9be39NMqdg39nroLHhpWjs6vyCT6nRaXjuzUSnp+5R6Sm
         rAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698393857; x=1698998657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c18WsKqkMLxlFb2kxy1TvqZw0mGllHhrI7E/VCZUkXM=;
        b=PZIw6hYGs6x5Pt6A8Sx8HW2EcKYf6KSlR2pXLUByfinJ/NzZadzrCVy73eMy9soIwF
         +gCzezxWkz01pxACtw9Xu3xTSMUal12+Nu47PaKV9X2kXYrrvMWR0jorXZoHrI7tbk1d
         sHpGkIeGtuz2LxsHEQimuhPHpSGJa/YOa+flxZjcsdG6Hnz78JopxYgzlhi3l/xgkrh7
         jJgi/OxNJRCeQfb5osMGCKYZT/l5pgvf4NudHKcEpqHoTzYFOmSnLet1/BUIBQSMNP2h
         Cl6SQa7fSroVhMZQsEStfLNgsMHdJQMbLdSTgFwIOnXFTSjAmNbk5qs4fq6mp9V58RG9
         enNw==
X-Gm-Message-State: AOJu0Yzn+1JyfOFm4eC9wBWIroOa0eKSYLXknmB8oGI1mVZx3AmgouF3
	m677x737BnRB+xyn2p53MuU8zw==
X-Google-Smtp-Source: AGHT+IHpcSQk7VGAghux/3WEwWVJDF1pL/epq9owFA/njCZANYAUuDKZLjuGtdumKBq3GHr3rbcd2A==
X-Received: by 2002:a05:6512:3287:b0:500:aed0:cb1b with SMTP id p7-20020a056512328700b00500aed0cb1bmr1288833lfe.24.1698393856230;
        Fri, 27 Oct 2023 01:04:16 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:c5e:e24e:ad0b:58c6])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c025100b004083729fc14sm4397488wmj.20.2023.10.27.01.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 01:04:15 -0700 (PDT)
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
Subject: [PATCH v4 6/7] cpufreq/cppc: set the frequency used for computing the capacity
Date: Fri, 27 Oct 2023 10:03:59 +0200
Message-Id: <20231027080400.56703-7-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027080400.56703-1-vincent.guittot@linaro.org>
References: <20231027080400.56703-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_010420_659518_B570B871 
X-CRM114-Status: GOOD (  10.09  )
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
index 9a073c2d2086..d4bef370feb3 100644
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
+			per_cpu(capacity_ref_freq, cpu) = cppc_perf_to_khz(&perf_caps, raw_capacity[cpu]);
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
