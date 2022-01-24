Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F9CC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jan 2022 13:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0AUNvzAvtUWkwJE9zgDdgk2JXc7k1WD2Hm5wLFGSK0A=; b=aVdiDfWBdlS2jC
	g6z/Q47rswaXBypQRTxbttA9e+tq2sM3T3PXthpUJOC94aMdF+XdgZiwqJBgXUyNjgaRywnE6HmpL
	AxxjM9DuOM63maPPCuscwCRlXM8TNwb2YPKL6/jqONScP4h0SwMOdgaPoEB+7tCGxnsGf7Fh0KK/U
	0DYnJrmR3AS7IIa4JTjTuMWMcFcgbHQr3A3ipCRGH3fsdqVNnpqzYBlfUzxkdJDaNfkfOZ8KYSDsu
	AgnoxcZkUgnJSpc91OrfPdedtg0fE9UkddDwkvWfsXziXQ99aV8abtYKGy9gsOK5caaNx9JmLOP5V
	vILpWHjIDrq+feSBe4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBzD7-003R9v-Md; Mon, 24 Jan 2022 13:16:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBz9c-003PR5-KT
 for linux-riscv@lists.infradead.org; Mon, 24 Jan 2022 13:13:06 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nBz9V-00036x-42; Mon, 24 Jan 2022 14:12:57 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Atish Patra <atishp@atishpatra.org>
Subject: Re: [v5 6/9] RISC-V: Add perf platform driver based on SBI PMU
 extension
Date: Mon, 24 Jan 2022 14:12:56 +0100
Message-ID: <13483045.gklhn8uf4L@diego>
In-Reply-To: <20211225054647.1750577-7-atishp@rivosinc.com>
References: <20211225054647.1750577-1-atishp@rivosinc.com>
 <20211225054647.1750577-7-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_051304_754083_210EB5F7 
X-CRM114-Status: GOOD (  24.86  )
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

Am Samstag, 25. Dezember 2021, 06:46:44 CET schrieb Atish Patra:
> From: Atish Patra <atish.patra@wdc.com>
> 
> RISC-V SBI specification added a PMU extension that allows to configure
> start/stop any pmu counter. The RISC-V perf can use most of the generic
> perf features except interrupt overflow and event filtering based on
> privilege mode which will be added in future.
> 
> It also allows to monitor a handful of firmware counters that can provide
> insights into firmware activity during a performance analysis.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---

[...]

> +static int pmu_sbi_device_probe(struct platform_device *pdev)
> +{
> +	struct riscv_pmu *pmu = NULL;
> +	int num_counters;
> +	int ret;
> +
> +	pr_info("SBI PMU extension is available\n");
> +	/* Notify legacy implementation that SBI pmu is available*/
> +	riscv_pmu_legacy_init(true);

Just wondering, shouldn't the riscv_pmu_legacy_init() call live in
pmu_sbi_devinit) below?

I.e. when you detected the presence of the PMU sbi extension you already
know that you don't want the legacy one and you have less control over
probe-ordering (when the driver actually probes) than the initcall itself.


Also, I think a better naming for the function might be good.
Right now just reading

	riscv_pmu_legacy_init(true);

suggests that you _want_ the legacy-init to be enabled, while
in reality the function means the opposite, disabling the legacy init.

So maybe something like
	riscv_pmu_disable_legacy(true); ?


Heiko

> +	pmu = riscv_pmu_alloc();
> +	if (!pmu)
> +		return -ENOMEM;
> +
> +	num_counters = pmu_sbi_find_num_ctrs();
> +	if (num_counters < 0) {
> +		pr_err("SBI PMU extension doesn't provide any counters\n");
> +		return -ENODEV;
> +	}
> +
> +	/* cache all the information about counters now */
> +	if (pmu_sbi_get_ctrinfo(num_counters))
> +		return -ENODEV;
> +
> +	pmu->num_counters = num_counters;
> +	pmu->ctr_start = pmu_sbi_ctr_start;
> +	pmu->ctr_stop = pmu_sbi_ctr_stop;
> +	pmu->event_map = pmu_sbi_event_map;
> +	pmu->ctr_get_idx = pmu_sbi_ctr_get_idx;
> +	pmu->ctr_get_width = pmu_sbi_ctr_get_width;
> +	pmu->ctr_clear_idx = pmu_sbi_ctr_clear_idx;
> +	pmu->ctr_read = pmu_sbi_ctr_read;
> +
> +	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
> +	if (ret)
> +		return ret;
> +
> +	ret = perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
> +	if (ret) {
> +		cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver pmu_sbi_driver = {
> +	.probe		= pmu_sbi_device_probe,
> +	.driver		= {
> +		.name	= RISCV_PMU_PDEV_NAME,
> +	},
> +};
> +
> +static int __init pmu_sbi_devinit(void)
> +{
> +	int ret;
> +	struct platform_device *pdev;
> +
> +	if (((sbi_major_version() == 0) && (sbi_minor_version() < 3)) ||
> +		sbi_probe_extension(SBI_EXT_PMU) <= 0) {
> +		return 0;
> +	}
> +
> +	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
> +				      "perf/riscv/pmu:starting",
> +				      pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);
> +	if (ret) {
> +		pr_err("CPU hotplug notifier for RISC-V PMU could not be registered: %d\n",
> +		       ret);
> +		return ret;
> +	}
> +
> +	ret = platform_driver_register(&pmu_sbi_driver);
> +	if (ret)
> +		return ret;
> +
> +	pdev = platform_device_register_simple(RISCV_PMU_PDEV_NAME, -1, NULL, 0);
> +	if (IS_ERR(pdev)) {
> +		platform_driver_unregister(&pmu_sbi_driver);
> +		return PTR_ERR(pdev);
> +	}
> +
> +	return ret;
> +}
> +device_initcall(pmu_sbi_devinit)
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
