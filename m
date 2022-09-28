Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BDFC04A95
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Sep 2022 13:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5J1Yxeh/7JsxM24NSMJVNdeTLNUoiXtDSN0SL598pu8=; b=hOrMcYu1IPk88l
	bT8VlxPCdVmD8rY490bSXUsg36euMsmIRvy7c/vWAIplu72y3KdT4PyL76rRrduk9Fci/XXnambci
	QP2AWVKwejol8S+dKLeFSYHMxjQ6tPW9EqJ3tLsvi7hMgIA0d1caAa+prRvr5HcHMDNrofmO5sF04
	w6BYR+aCSyNp7Bo4QtcN/V64P2rp2DdaiH+sYQT1Yz9NcBJQsDv6+M+bj/iVhhYuKw8ttBcC3wvp2
	7mm0wVs4pPhm5mTHYtshrOa5/smAms9yRYbGfaim38KYW4AtD9aVbIAYfaqrXvxL4dmseYW/Ar8Od
	wmMy+HCicAWTgr7I/WhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odXI5-00GWJi-8S; Wed, 28 Sep 2022 13:39:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odXI1-00GWGR-6o
	for linux-riscv@lists.infradead.org; Wed, 28 Sep 2022 13:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664372393; x=1695908393;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nPBgDw5GllULIxoSbOQPsphSgT4rgypCVJDKl4NVcdY=;
  b=sq10279kJhQstuLMhpINuAiGKSDORtrDOyZnw4sjXeIqFhFqJl7VF7DH
   b7OgoZjsJorQDpvZKopwLfP4Pdpe3TgS9cKcudWYnjcMA8w3COUYtxHid
   PUkglHfSXfpZ7DOgAEb/mwZYIr+1Y34GtPGeWVywVaYFZlbUnWZ2+14tf
   WIveYhfGXw+BpEd59VkNA7suhraPgXiQRkIyt2zaAQTA5/G776H1yvuVr
   zs3vePFg74Mw2sEVXuTlJiuH65yIVpizX4NZfBHJayfqNqYQQvVtxOlNY
   7JQnO6pmIIaqlA6fpYjf/dcqBI0LeZLluyxUrxSYHuwcTg5sitfMWrQEF
   A==;
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; 
   d="scan'208";a="182335002"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Sep 2022 06:39:53 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 28 Sep 2022 06:39:52 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 28 Sep 2022 06:39:51 -0700
Date: Wed, 28 Sep 2022 14:39:15 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] RISC-V: Re-enable counter access from userspace
Message-ID: <YzROg3AKGVXH+2TB@wendy>
References: <20220928131807.30386-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220928131807.30386-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_063953_277107_A7ED617A 
X-CRM114-Status: GOOD (  17.74  )
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

On Wed, Sep 28, 2022 at 06:18:07AM -0700, Palmer Dabbelt wrote:
> These counters were part of the ISA when we froze the uABI, removing
> them breaks userspace.
> 
> Link: https://lore.kernel.org/all/YxEhC%2FmDW1lFt36J@aurel32.net/
> Fixes: e9991434596f ("RISC-V: Add perf platform driver based on SBI PMU extension")

At the risk of stating the obvious, I assume this will also be CC:stable
when you apply it since this goes back as far as (I think) 5.18?

Thanks,
Conor.

> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 6f6681bbfd36..e45daffbfb36 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -645,8 +645,11 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
>  	struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
>  	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
>  
> -	/* Enable the access for TIME csr only from the user mode now */
> -	csr_write(CSR_SCOUNTEREN, 0x2);
> +	/*
> +	 * Enable the access for CYCLE, TIME, and INSTRET CSRs from userspace,
> +	 * as is necessary to maintain uABI compatibility.
> +	 */
> +	csr_write(CSR_SCOUNTEREN, 0x7);
>  
>  	/* Stop all the counters so that they can be enabled from perf */
>  	pmu_sbi_stop_all(pmu);
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
