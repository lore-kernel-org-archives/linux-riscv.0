Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EEDC5AC7C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 08:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsJ4oRBwjdaFTgV/cSGp1Z5rFfbI1Ef9UZD+BVfqvZY=; b=JrYIao0/T1LifC
	e9z3YxVJsU0Cx/ZCnTnVHxup0f7FRVqtlXAKtM3BCAv5h7oy6szNj9ngW94KdRyCMO+vHIs4HrqLT
	Wqzhg4Rslw2WVaMNq9g1cYwbfyyzzLqZzM5nZp3q2up10ber+hpCiXkLXuBq5AlWeBSXNkVmR3xcv
	6/A4AWZL5d9cq3vhIbLSLRTGM7aqr5eVOzQwcVxIMeNRDaK9idj7e7g6QZXdofzRthBEbotArsNaC
	HxK8W7O64BVjTz/qzaWZQ7PgD5yt4UPcS77ZU7UCNO5Ow57s3IeBahwEp6wqHcpljtZNKFVpf6RgU
	Du15WvLqg7QDEN9hNBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFdo-00000007KvB-3zo0;
	Fri, 07 Aug 2026 08:09:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFdm-00000007KtO-3Qdu
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:09:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OLApd8O0C0ZNoJJX5e81sYqyCBasqXIso5bBazmCshc=; b=nzb4llWF7kb0IiswieNCKo1szr
	QsmU2sU+YNHKibd5AGRbR81nbSMl3sLNyYMbYOtdz1W4IUHVpAObQaTEq5I6vGJuvKenFVT0m27Jw
	sEtqM52Rz6PzhljdDdY1aS3cI+iHM+92Vq+52Txrkcz1dyQE31JOjTy8tw0K7ydZVW6NJG/mQ/igO
	v0uNA2emEad7Z4xEcy7CDQXcsPGe6sgo8TqguxAn6j3Q4QRBQCWSmwVPQpnyBjCBEvkn6mijxJEC3
	iAhWtUK7EtSb/OXkZARdWdZtQ7t8zmUxtwS3kEt7sWci2PNcTWVzfk/F/mJqGqJ1//4esbDBXSeqZ
	i8cvGpfQ==;
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFdi-0000000CAWX-33Ka
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 08:09:17 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786090152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLApd8O0C0ZNoJJX5e81sYqyCBasqXIso5bBazmCshc=;
	b=P3iy2IMGVL/hokyZ2bDPeg1E+gnPIamfQdlf1NUf3xOvhdWpoyrctMMCRJCirOEExBSkAn
	/LYv+RqHSzSSHPNfpM/VUTkXYC5L96SF2TOkPTYbKIGFqIibE0GonqtwhtsjnDrTiSPENC
	mRrGAroT+sV67lOOZsPc12JE63ih+6k=
From: Atish Patra <atish.patra@linux.dev>
Date: Fri, 07 Aug 2026 01:08:56 -0700
Subject: [PATCH v9 01/20] RISC-V: perf: fix resource cleanup on driver
 probe failure
MIME-Version: 1.0
Message-Id: <20260807-counter_delegation-v9-1-58658104e487@meta.com>
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
To: Will Deacon <will@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Ian Rogers <irogers@google.com>, 
 Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_090914_852375_FB041ED5 
X-CRM114-Status: GOOD (  14.61  )
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

From: Atish Patra <atishp@meta.com>

Sashiko pointed out various UAF and memory leak issues around
pmu_sbi_device_probe() error paths.

If the probe fails, here are list of cleanups needed.
a. Already registered pmu must be freed
b. per cpu IRQ must be released
c. pmu_ctr_list data structure must be freed
d. cpu hotplug state must be cleaned up only if added.

Fix the resource cleanup by reorganizing the code around probe failure.

Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Link: https://patch.msgid.link/20260701-counter_delegation-v8-1-7909f863a645@meta.com
Signed-off-by: Paul Walmsley <pjw@kernel.org>
Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Signed-off-by: Atish Patra <atishp@meta.com>
---
 drivers/perf/riscv_pmu_sbi.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index dfc886dee5ad..50220f7b46d9 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -1219,22 +1219,29 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 					  DOMAIN_BUS_ANY);
 	if (!domain) {
 		pr_err("Failed to find INTC IRQ root domain\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err;
 	}
 
 	riscv_pmu_irq = irq_create_mapping(domain, riscv_pmu_irq_num);
 	if (!riscv_pmu_irq) {
 		pr_err("Failed to map PMU interrupt for node\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err;
 	}
 
 	ret = request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_handler, "riscv-pmu", hw_events);
 	if (ret) {
 		pr_err("registering percpu irq failed [%d]\n", ret);
-		return ret;
+		irq_dispose_mapping(riscv_pmu_irq);
+		riscv_pmu_irq = 0;
+		goto err;
 	}
 
 	return 0;
+err:
+	riscv_pmu_use_irq = false;
+	return ret;
 }
 
 #ifdef CONFIG_CPU_PM
@@ -1301,7 +1308,8 @@ static void riscv_pmu_destroy(struct riscv_pmu *pmu)
 		}
 	}
 	riscv_pm_pmu_unregister(pmu);
-	cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
+	if (!hlist_unhashed(&pmu->node))
+		cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
 }
 
 static void pmu_sbi_event_init(struct perf_event *event)
@@ -1423,6 +1431,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	struct riscv_pmu *pmu = NULL;
 	int ret = -ENODEV;
 	int num_counters;
+	bool irq_requested = false;
 
 	pr_info("SBI PMU extension is available\n");
 	pmu = riscv_pmu_alloc();
@@ -1451,6 +1460,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
 	}
+	irq_requested = (ret == 0);
 
 	pmu->pmu.attr_groups = riscv_pmu_attr_groups;
 	pmu->pmu.parent = &pdev->dev;
@@ -1469,11 +1479,11 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 
 	ret = riscv_pm_pmu_register(pmu);
 	if (ret)
-		goto out_unregister;
+		goto out_destroy;
 
 	ret = perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
 	if (ret)
-		goto out_unregister;
+		goto out_destroy;
 
 	/* SBI PMU Snapsphot is only available in SBI v2.0 */
 	if (sbi_v2_available) {
@@ -1514,9 +1524,20 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	return 0;
 
 out_unregister:
+	perf_pmu_unregister(&pmu->pmu);
+
+out_destroy:
 	riscv_pmu_destroy(pmu);
+	if (irq_requested) {
+		free_percpu_irq(riscv_pmu_irq, pmu->hw_events);
+		irq_dispose_mapping(riscv_pmu_irq);
+		riscv_pmu_irq = 0;
+	}
 
 out_free:
+	free_percpu(pmu->hw_events);
+	kfree(pmu_ctr_list);
+	pmu_ctr_list = NULL;
 	kfree(pmu);
 	return ret;
 }

-- 
2.53.0-Meta


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
