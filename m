Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C1ACDB476
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 08:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MGcK5ty4Ldle3DHwi2fKJiJPXxR5IDI0shyXMqphT9E=; b=36KwApXipCGbW3
	rulFvjkJcZR518ShP6uAG37qC8zfsGSLda7uM7CRYzHAAuahe7C+DK+5Xs5Gq8qYi+AvFoKc8yX4p
	3jTw270NqROdi3ipJudaA2ZS+pbYuwAVMZFqjNwKkzloaroedAZukf2kRv/MLal9H/6luHHbngLsl
	o5Z/UF8+k7TrqNcjlQVwr07TirFMe66xQoDHLdp+cyTO37quC+YFrXfo61JhIpL+YYq55iHBdN6Qt
	z70DSb8Tu8RbWXY2QycMP+r5gXzcUB+BgZIeUcUv/WpiOwSYgxu0ICDMgF03uLl9WFYnoRbwOasiq
	Wh0sqncYGLH9A0azvFfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZfW-00000004cQ4-4BtP;
	Mon, 22 Jun 2026 08:06:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZfW-00000004cO7-2VQP
	for linux-riscv@bombadil.infradead.org;
	Mon, 22 Jun 2026 08:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=oAtxv8GjmcFtFqxDou1ZS76JopDGVWlAHx2uOo1Xz+c=; b=KFstGJsSrGs7ou5GuCrofT58Fm
	1HRsVFrKaUzNndTIrJcDLW/6wmu5zzbLv8wQdlUPhUf69j9pFP9281MIlIgLCTK54OocG4WpBrb2u
	sNgZI6UYtS3XJ+I2bU94k5bKJ16dNHmUJO+IWmx5jh2ILcKAPMuQXKQjJ/GVQHh5nZZdKuvBr0/xa
	XcsZL7lPOhr1V5q+Rvprom8J7lcIoOzm88P6MNLEivHPkMlkgUqeBmHdQNzHH3917s+FUjIlEXOWZ
	hfrN7fHmBVnx0RztCVJPdE+p7SazoSZtdHSwltvLOIImHR7/IMzxMajZ8gcStg32njYdjFja22m5c
	ZGVj10Nw==;
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZfT-00000003rPd-0tWY
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 08:06:09 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782115565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oAtxv8GjmcFtFqxDou1ZS76JopDGVWlAHx2uOo1Xz+c=;
	b=KUAQeBDJfdVb9GdFzGOYNLfwSR1CfuWg7peKFf38oTapGuGYzN2WaGbLYQqptDYG3h05Ur
	p+vVr7Wxe+qAw3izEzcYVw1Azf/3bnAUnk2mG4KV5XQ11kE5wIUM9zm95UrZWat/A4pxcu
	O1Oj2CP0hXR2QwcuIJTtBHRJMYkrj6c=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 22 Jun 2026 01:04:27 -0700
Subject: [PATCH v7 15/22] RISC-V: perf: Skip PMU SBI extension when not
 implemented
MIME-Version: 1.0
Message-Id: <20260622-counter_delegation-v7-15-0ba2fd34614e@meta.com>
References: <20260622-counter_delegation-v7-0-0ba2fd34614e@meta.com>
In-Reply-To: <20260622-counter_delegation-v7-0-0ba2fd34614e@meta.com>
To: Jiri Olsa <jolsa@kernel.org>, James Clark <james.clark@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Rob Herring <robh@kernel.org>, 
 Ian Rogers <irogers@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, Namhyung Kim <namhyung@kernel.org>
Cc: devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_090607_845119_CD6BB9B9 
X-CRM114-Status: GOOD (  12.79  )
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

From: Charlie Jenkins <charlie@rivosinc.com>

When the PMU SBI extension is not implemented, sbi_v2_available should
not be set to true. The SBI implementation for counter config matching
and firmware counter read  should also be skipped when the SBI extension
is not implemented.

Signed-off-by: Atish Patra <atishp@meta.com>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 49 ++++++++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 6407e229c2c3..4f3a30143db1 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -495,27 +495,32 @@ static void rvpmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 	}
 }
 
-static void rvpmu_sbi_check_std_events(struct work_struct *work)
+static void rvpmu_check_std_events(struct work_struct *work)
 {
 	int ret;
 
-	if (sbi_v3_available) {
-		ret = pmu_sbi_check_event_info();
-		if (ret)
-			pr_err("pmu_sbi_check_event_info failed with error %d\n", ret);
-		return;
-	}
+	if (riscv_pmu_sbi_available()) {
+		if (sbi_v3_available) {
+			ret = pmu_sbi_check_event_info();
+			if (ret)
+				pr_err("pmu_sbi_check_event_info failed with error %d\n", ret);
+			return;
+		}
 
-	for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_sbi_map); i++)
-		rvpmu_sbi_check_event(&pmu_hw_event_sbi_map[i]);
+		for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_sbi_map); i++)
+			rvpmu_sbi_check_event(&pmu_hw_event_sbi_map[i]);
 
-	for (int i = 0; i < ARRAY_SIZE(pmu_cache_event_sbi_map); i++)
-		for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_sbi_map[i]); j++)
-			for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_sbi_map[i][j]); k++)
-				rvpmu_sbi_check_event(&pmu_cache_event_sbi_map[i][j][k]);
+		for (int i = 0; i < ARRAY_SIZE(pmu_cache_event_sbi_map); i++)
+			for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_sbi_map[i]); j++)
+				for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_sbi_map[i][j]); k++)
+					rvpmu_sbi_check_event(&pmu_cache_event_sbi_map[i][j][k]);
+	} else {
+		DO_ONCE_LITE_IF(1, pr_info,
+				"Boot time config matching not required for smcdeleg\n");
+	}
 }
 
-static DECLARE_WORK(check_std_events_work, rvpmu_sbi_check_std_events);
+static DECLARE_WORK(check_std_events_work, rvpmu_check_std_events);
 
 static ssize_t rvpmu_format_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
@@ -708,6 +713,9 @@ static int rvpmu_sbi_ctr_get_idx(struct perf_event *event)
 
 	cflags = rvpmu_sbi_get_filter_flags(event);
 
+	if (!riscv_pmu_sbi_available())
+		return -ENOENT;
+
 	/*
 	 * In legacy mode, we have to force the fixed counters for those events
 	 * but not in the user access mode as we want to use the other counters
@@ -985,7 +993,7 @@ static u64 rvpmu_ctr_read(struct perf_event *event)
 		return val;
 	}
 
-	if (pmu_sbi_is_fw_event(event)) {
+	if (pmu_sbi_is_fw_event(event) && riscv_pmu_sbi_available()) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
 				hwc->idx, 0, 0, 0, 0, 0);
 		if (ret.error)
@@ -2084,12 +2092,13 @@ static int __init rvpmu_devinit(void)
 	int ret;
 	struct platform_device *pdev;
 
-	if (sbi_spec_version >= sbi_mk_version(0, 3) &&
-	    sbi_probe_extension(SBI_EXT_PMU))
-		static_branch_enable(&riscv_pmu_sbi_available);
+	if (sbi_probe_extension(SBI_EXT_PMU)) {
+		if (sbi_spec_version >= sbi_mk_version(0, 3))
+			static_branch_enable(&riscv_pmu_sbi_available);
+		if (sbi_spec_version >= sbi_mk_version(2, 0))
+			sbi_v2_available = true;
+	}
 
-	if (sbi_spec_version >= sbi_mk_version(2, 0))
-		sbi_v2_available = true;
 	/*
 	 * We need all three extensions to be present to access the counters
 	 * in S-mode via Supervisor Counter delegation.

-- 
2.53.0-Meta


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
