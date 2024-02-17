Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F46C48BF5
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 00:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7+FEfaEiBGSF/VTWnHiIlnK9D9pS+7HMlMfU+2M+3Y=; b=kM0bpDwz97uOLR
	anMBHElVAvqFCsEWSJ8Gq2sDeDvwXs9S6O4n54CVpGEdYj7L7A1w+RYsqYQ4P+iC1IXaX1upE8vKN
	WUpL3kF5571Lrsspayi9p19HYB1BPR8EIKCZBiK1k48ObrOTi1UUYJ8vOcu6dLi0fL/vEa7Qr3ZuV
	ksdC8nSpP3TtsrDc3E2bjcNNWaw6FPys4ZNsD0BDODY1JynrD6wClXgsNyXBf/eOSIpxYifUsZSYW
	Twt7l2Qb9tG+xrCHKJQ+drAXtL9v/v/rgGHgZYdDZdIaiMEr6XiYF/MI2YzG8ZVCtWCbnOmYsuIQj
	M3xMAmSVOLfsi2MF9Yxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb93Z-00000004JHZ-2NZr;
	Sat, 17 Feb 2024 00:59:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb930-00000004IkU-1TsQ
	for linux-riscv@bombadil.infradead.org;
	Sat, 17 Feb 2024 00:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JIGj4g715G6yohgyO/4Q0tCiDPX2tJrcO1/uwFaLqes=; b=QdvL7eHF5burAYAYl60MBGPFVQ
	jB71oC79oPVU51iSQDhGNZzmP83Ff1EFps50Sn1AirhrI//342Gqvcwznp/z8YkwZs063sjXLtnnj
	X6FYGFZghBho2qlWNO9lly3A9LVyyAAXLibi4PB+vO3n2ntkB56/XDgBKe5tng9fL3ud7ZxsqX5lu
	8IZ5XDnFrXEmWEnm4iXwkIcjGOJ2D26ryc7wCGA4WWJQ9sA4hDDlDnM2XpPOHAiBbBiLpr/gUctPr
	lfQPazF0jMksozh0Z0xa7xbam6kttTH8M3lrFjnzcMIwEXfRBqV79Udj6L4IpUC/9CpkrdeMtcf8/
	S1inCC3g==;
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92X-000000007JI-47Qi
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 00:59:12 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-364f791a428so8149035ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 16:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131525; x=1708736325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIGj4g715G6yohgyO/4Q0tCiDPX2tJrcO1/uwFaLqes=;
        b=pyGhu9P/ufBDPNOHnbMBCLQLuPKyv6oKeUAChtSot4T+hR8ur3d9EhgPGMDWNH7TII
         QORo6y18q5VdomKs/BRAWL6zJrr2wqS4Mos0vIlMW+vEXiLlNENgda5OrhaEhOMkTvEJ
         gAfd1unqp8GS0I84j0M3u2dYxC8iYALlWaFJkzn2ceH9DuhFLeEdBgSqMYoQGBKgXcZL
         MuQtFkVYmvZ8W/PilAtSw1PsC67dnBDlqJwQuMXOm85xavfyFyIGTpyM8zkYHXwtsOov
         gHaaqh3jyUOKqLfdB/BmrvfENhUYTTbdWLSSh6lkSXqhRhXZmkfumNkrwYywYCjf+Sm8
         Tjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131525; x=1708736325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JIGj4g715G6yohgyO/4Q0tCiDPX2tJrcO1/uwFaLqes=;
        b=uz7O0a1/c1l3xQ/epwZtnALkV9iOIT9pkKVgYpGxzfjnLDRmNtISVIOWjm8texvL+M
         PpTBGstFraWsokbCmskH0ueWVLd6GPDNWQEr1q2/7k3EyQu58ilaVOCS4YAmgsst3hrt
         nBL+q4TvQvvoEdIVupcqIX9USOeVSI5VggGVbtw1OuNR3qfDPccB+bZrDBdz8TFdmShg
         O2NFHfK7N7XnIHnJT1ogeQn7ewkCUEFljfvYEOnBv47IsNGpfcmTscpMMUARwxzF/WLI
         bcQNx/x2Qm4QHe2gJp6PMuIQ/bnwFbdL3VeNScI5rCf15A4IUwumOEy7BpAdh/u86wip
         iOXA==
X-Forwarded-Encrypted: i=1; AJvYcCV/4RQ3pDX4x0aVjzeebMAs5r2GY04s/yJkLzCjprakA7qi+CcQZt8GyJN2gFt5GGpLQLybvTv+uxls3a0tS/7LOcnH2qBgLjwKfed6RAd7
X-Gm-Message-State: AOJu0YwBS+n9cqlhiF1xVIfzdBu+f3O0HkqSMH1HTihj9alrHCGrD1VR
	uzbIxiJFiY3CzP1HkiOi8x2UHreObk7+M6B5h3L4bnkXqh3v30R2JAGiidtTn10=
X-Google-Smtp-Source: AGHT+IF+X2u5pVrDfJiSLKIz3PkBfnEp1Eo29CwD/FNCbs9zzOknJEUhVT4g49rCOyNlyB3Z65pvKw==
X-Received: by 2002:a92:d081:0:b0:365:156:bb86 with SMTP id h1-20020a92d081000000b003650156bb86mr4612456ilh.2.1708131525473;
        Fri, 16 Feb 2024 16:58:45 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:58:45 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	Evan Green <evan@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	John Garry <john.g.garry@oracle.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kan Liang <kan.liang@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Weilin Wang <weilin.wang@intel.com>,
	Will Deacon <will@kernel.org>,
	kaiwenxue1@gmail.com,
	Yang Jihong <yangjihong1@huawei.com>
Subject: [PATCH RFC 12/20] RISC-V: perf: Modify the counter discovery mechanism
Date: Fri, 16 Feb 2024 16:57:30 -0800
Message-Id: <20240217005738.3744121-13-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_005853_670078_8B05B945 
X-CRM114-Status: GOOD (  27.17  )
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

If both counter delegation and SBI PMU is present, the counter
delegation will be used for hardware pmu counters while the SBI PMU
will be used for firmware counters. Thus, the driver has to probe
the counters info via SBI PMU to distinguish the firmware counters.

The hybrid scheme also requires improvements of the informational
logging messages to indicate the user about underlying interface
used for each use case.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_dev.c | 120 ++++++++++++++++++++++++++---------
 1 file changed, 90 insertions(+), 30 deletions(-)

diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 3d27bd65f140..dfc0ddee9da4 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -35,6 +35,11 @@
 PMU_FORMAT_ATTR(event, "config:0-47");
 PMU_FORMAT_ATTR(firmware, "config:63");
 
+static DEFINE_STATIC_KEY_FALSE(riscv_pmu_sbi_available);
+static DEFINE_STATIC_KEY_FALSE(riscv_pmu_cdeleg_available);
+static bool cdeleg_available;
+static bool sbi_available;
+
 static struct attribute *riscv_arch_formats_attr[] = {
 	&format_attr_event.attr,
 	&format_attr_firmware.attr,
@@ -56,7 +61,8 @@ static int sysctl_perf_user_access __read_mostly = SYSCTL_USER_ACCESS;
 
 /*
  * This structure is SBI specific but counter delegation also require counter
- * width, csr mapping. Reuse it for now.
+ * width, csr mapping. Reuse it for now we can have firmware counters for
+ * platfroms with counter delegation support.
  * RISC-V doesn't have heterogeneous harts yet. This need to be part of
  * per_cpu in case of harts with different pmu counters
  */
@@ -67,6 +73,8 @@ static unsigned int riscv_pmu_irq;
 
 /* Cache the available counters in a bitmask */
 static unsigned long cmask;
+/* Cache the available firmware counters in another bitmask */
+static unsigned long firmware_cmask;
 
 struct sbi_pmu_event_data {
 	union {
@@ -575,35 +583,49 @@ static int rvpmu_sbi_find_num_ctrs(void)
 		return sbi_err_map_linux_errno(ret.error);
 }
 
-static int rvpmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
+static int rvpmu_deleg_find_ctrs(void)
+{
+	/* TODO */
+	return -1;
+}
+
+static int rvpmu_sbi_get_ctrinfo(int nsbi_ctr, int ndeleg_ctr)
 {
 	struct sbiret ret;
-	int i, num_hw_ctr = 0, num_fw_ctr = 0;
+	int i, num_hw_ctr = 0, num_fw_ctr = 0, num_ctr = 0;
 	union sbi_pmu_ctr_info cinfo;
 
-	pmu_ctr_list = kcalloc(nctr, sizeof(*pmu_ctr_list), GFP_KERNEL);
-	if (!pmu_ctr_list)
-		return -ENOMEM;
-
-	for (i = 0; i < nctr; i++) {
+	for (i = 0; i < nsbi_ctr; i++) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
 		if (ret.error)
 			/* The logical counter ids are not expected to be contiguous */
 			continue;
 
-		*mask |= BIT(i);
-
 		cinfo.value = ret.value;
 		if (cinfo.type == SBI_PMU_CTR_TYPE_FW)
 			num_fw_ctr++;
-		else
+
+		if (!cdeleg_available) {
 			num_hw_ctr++;
-		pmu_ctr_list[i].value = cinfo.value;
+			cmask |= BIT(i);
+			pmu_ctr_list[i].value = cinfo.value;
+		} else if (cinfo.type == SBI_PMU_CTR_TYPE_FW) {
+			/* Track firmware counters in a different mask */
+			firmware_cmask |= BIT(i);
+			pmu_ctr_list[i].value = cinfo.value;
+		}
+
 	}
 
-	pr_info("%d firmware and %d hardware counters\n", num_fw_ctr, num_hw_ctr);
+	if (cdeleg_available) {
+		pr_info("%d firmware and %d hardware counters\n", num_fw_ctr, ndeleg_ctr);
+		num_ctr = num_fw_ctr + ndeleg_ctr;
+	} else {
+		pr_info("%d firmware and %d hardware counters\n", num_fw_ctr, num_hw_ctr);
+		num_ctr = nsbi_ctr;
+	}
 
-	return 0;
+	return num_ctr;
 }
 
 static inline void rvpmu_sbi_stop_all(struct riscv_pmu *pmu)
@@ -775,16 +797,33 @@ static void rvpmu_ctr_stop(struct perf_event *event, unsigned long flag)
 	/* TODO: Counter delegation implementation */
 }
 
-static int rvpmu_find_num_ctrs(void)
+static int rvpmu_find_ctrs(void)
 {
-	return rvpmu_sbi_find_num_ctrs();
-	/* TODO: Counter delegation implementation */
-}
+	int num_sbi_counters = 0, num_deleg_counters = 0, num_counters = 0;
 
-static int rvpmu_get_ctrinfo(int nctr, unsigned long *mask)
-{
-	return rvpmu_sbi_get_ctrinfo(nctr, mask);
-	/* TODO: Counter delegation implementation */
+	/*
+	 * We don't know how many firmware counters available. Just allocate
+	 * for maximum counters driver can support. The default is 64 anyways.
+	 */
+	pmu_ctr_list = kcalloc(RISCV_MAX_COUNTERS, sizeof(*pmu_ctr_list),
+			       GFP_KERNEL);
+	if (!pmu_ctr_list)
+		return -ENOMEM;
+
+	if (cdeleg_available)
+		num_deleg_counters = rvpmu_deleg_find_ctrs();
+
+	/* This is required for firmware counters even if the above is true */
+	if (sbi_available)
+		num_sbi_counters = rvpmu_sbi_find_num_ctrs();
+
+	if (num_sbi_counters >= RISCV_MAX_COUNTERS || num_deleg_counters >= RISCV_MAX_COUNTERS)
+		return -ENOSPC;
+
+	/* cache all the information about counters now */
+	num_counters = rvpmu_sbi_get_ctrinfo(num_sbi_counters, num_deleg_counters);
+
+	return num_counters;
 }
 
 static int rvpmu_event_map(struct perf_event *event, u64 *econfig)
@@ -1069,12 +1108,21 @@ static int rvpmu_device_probe(struct platform_device *pdev)
 	int ret = -ENODEV;
 	int num_counters;
 
-	pr_info("SBI PMU extension is available\n");
+	if (cdeleg_available) {
+		pr_info("hpmcounters will use the counter delegation ISA extension\n");
+		if (sbi_available)
+			pr_info("Firmware counters will be use SBI PMU extension\n");
+		else
+			pr_info("Firmware counters will be not available as SBI PMU extension is not present\n");
+	} else if (sbi_available) {
+		pr_info("Both hpmcounters and firmware counters will use SBI PMU extension\n");
+	}
+
 	pmu = riscv_pmu_alloc();
 	if (!pmu)
 		return -ENOMEM;
 
-	num_counters = rvpmu_find_num_ctrs();
+	num_counters = rvpmu_find_ctrs();
 	if (num_counters < 0) {
 		pr_err("SBI PMU extension doesn't provide any counters\n");
 		goto out_free;
@@ -1086,9 +1134,6 @@ static int rvpmu_device_probe(struct platform_device *pdev)
 		pr_info("SBI returned more than maximum number of counters. Limiting the number of counters to %d\n", num_counters);
 	}
 
-	/* cache all the information about counters now */
-	if (rvpmu_get_ctrinfo(num_counters, &cmask))
-		goto out_free;
 
 	ret = rvpmu_setup_irqs(pmu, pdev);
 	if (ret < 0) {
@@ -1147,11 +1192,26 @@ static int __init rvpmu_devinit(void)
 	int ret;
 	struct platform_device *pdev;
 
-	if (sbi_spec_version < sbi_mk_version(0, 3) ||
-	    !sbi_probe_extension(SBI_EXT_PMU)) {
-		return 0;
+	if (sbi_spec_version >= sbi_mk_version(0, 3) &&
+	    sbi_probe_extension(SBI_EXT_PMU)) {
+		static_branch_enable(&riscv_pmu_sbi_available);
+		sbi_available = true;
+	}
+
+	/*
+	 * We need all three extensions to be present to access the counters
+	 * in S-mode via Supervisor Counter delegation.
+	 */
+	if (riscv_isa_extension_available(NULL, SSCCFG) &&
+	    riscv_isa_extension_available(NULL, SMCDELEG) &&
+	    riscv_isa_extension_available(NULL, SSCSRIND)) {
+		static_branch_enable(&riscv_pmu_cdeleg_available);
+		cdeleg_available = true;
 	}
 
+	if (!(sbi_available || cdeleg_available))
+		return 0;
+
 	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
 				      "perf/riscv/pmu:starting",
 				      rvpmu_starting_cpu, rvpmu_dying_cpu);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
