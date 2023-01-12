Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB5DC54EBC
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 10:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1SPSb4q2ms1ONReEF+vlmRSZ9z9NPgiDe7G4j6rxGWA=; b=WJ7M7g8X+n3cjz
	RDMl6ESQA2r+GqGuDPyNPKvD+ndDCP7rwO9fAjeZJS355jp6pvFPCI4Ni4BuBwiBGsU5j3J7VvFcj
	ztttn6liheVJ+0REtl7XV+FdRR8rbKukpmMAtD9E8iiNt3zaAb8aA4EO6NIk/vNypm7d1LdGSyTBg
	lDPG5AU+jSVp4XcF8fGpkwJ+v3/CJNuMK4UxUbHmWMrzF0frzOMMKZgVIzEqwb6HNmNGDrm2mfkL6
	yotLIJgA0y32zqW9wRlW4DO1BbuyXttAkrE5DPYk+Eu2PJynCXOySFtFISg/szD8c2S+hyLODpKG3
	42M5ST6kcKQPI/c+O8/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFuTR-00EVy6-Ec; Thu, 12 Jan 2023 10:06:17 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFuTO-00EVwv-97
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 10:06:15 +0000
Received: by mail-ej1-x629.google.com with SMTP id v6so475577ejg.6
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jan 2023 02:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2FzLDjGkwbhuRQdpsg4AAAIh21LPvTEV60KRnfA4Jnk=;
        b=c8cyrMUfQkoP30ETg/O6NgjXEBCDgTHm8T8oKW9kELRVBL/fVwclVGkWLYOOFE2hge
         aXtDnYw7aVgBKltkKi8BdGvdct8z3iLb/4k5ip1Ldx25Pu9TOfy0fo02B4N8ELD/U4ZS
         OvysFV+RknEgOdumM2/7RP66BpLW+9pG8yNPwVx8QtgMqZFAbsaiwKU2Fq+qJsxnizi/
         1CYvmvm849kV87PoeOpSUUrxTET3UKjnGBjlxlQ60/P55iTiE0g+tFOQbYSb/2cdD093
         uToVbp68M7R/0GJJC0A1LarDFnJTatRrulYR7jECVQWACtb8HgMmmiMd/5vqbGWhl0Yh
         Vgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FzLDjGkwbhuRQdpsg4AAAIh21LPvTEV60KRnfA4Jnk=;
        b=DkzEvWNPp93eW6Gxr287w5GeMw26TpDoVlYWZLtH6jhFfwgJSIR43krpkk6IbHWcdY
         mOocoXm1z/dPrZ/8O639VdXKmarOubX8jsddqitwiVrxknNPM5vYNIUCQ7el+NcchpEX
         QOGPpekCXket/Vb9O4dU2tl9+Z3Gy1sn5tyxIZ2MlJs85N8+xC4AgPWx/QslgytS0bZz
         KFhS+oq1QBoKhzEhbkDyjaCmCld+HfIIYtTRIVEA/vsxR119XOrX7ihYweGA5nSJlqBA
         8nshYUmf1OLQEJChiKQWBg013BpmhD6r3/fKvwEox+VgTPkfq8g76MYFrIikxfzdM/IR
         vtXg==
X-Gm-Message-State: AFqh2kpcnTDqpfey4wT/Hflo6eWGQcl2NBNYAYMFn1UIiQJ0zEETTQOA
	Lz3xFcsRiBqZ4m/aVO75uf/jhA==
X-Google-Smtp-Source: AMrXdXs/WIUvWHYBGtlKjFpe5/QF+W/ylKh723CV4K5yq93k6pAAfRONTqMObmzHu4G+fNBxudjkiw==
X-Received: by 2002:a17:906:2a10:b0:854:956:1438 with SMTP id j16-20020a1709062a1000b0085409561438mr8720886eje.25.1673517969665;
        Thu, 12 Jan 2023 02:06:09 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id b21-20020a17090630d500b0084f7d38713esm3812925ejb.108.2023.01.12.02.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 02:06:09 -0800 (PST)
Date: Thu, 12 Jan 2023 11:06:08 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Eric Lin <eric.lin@sifive.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 01/11] RISC-V: Define helper functions expose hpm
 counter width and count
Message-ID: <20230112100608.d7tnvhbotjfctlgk@orel>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
 <20221215170046.2010255-2-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221215170046.2010255-2-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_020614_367996_151FC0F7 
X-CRM114-Status: GOOD (  31.78  )
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

On Thu, Dec 15, 2022 at 09:00:36AM -0800, Atish Patra wrote:
> KVM module needs to know how many hardware counters and the counter
> width that the platform supports. Otherwise, it will not be able to show
> optimal value of virtual counters to the guest. The virtual hardware
> counters also need to have the same width as the logical hardware
> counters for simplicity. However, there shouldn't be mapping between
> virtual hardware counters and logical hardware counters. As we don't
> support hetergeneous harts or counters with different width as of now,
> the implementation relies on the counter width of the first available
> programmable counter.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c   | 35 +++++++++++++++++++++++++++++++++-
>  include/linux/perf/riscv_pmu.h |  3 +++
>  2 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 3852c18..65d4aa4 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -49,6 +49,9 @@ static const struct attribute_group *riscv_pmu_attr_groups[] = {
>  static union sbi_pmu_ctr_info *pmu_ctr_list;
>  static unsigned int riscv_pmu_irq;
>  
> +/* Cache the available counters in a bitmask */
> +unsigned long cmask;

I presume this can be static since it's not getting added to the header.
And don't we need this to be a long long for rv32? We should probably
just use u64.

> +
>  struct sbi_pmu_event_data {
>  	union {
>  		union {
> @@ -264,6 +267,37 @@ static bool pmu_sbi_ctr_is_fw(int cidx)
>  	return (info->type == SBI_PMU_CTR_TYPE_FW) ? true : false;
>  }
>  
> +/*
> + * Returns the counter width of a programmable counter and number of hardware
> + * counters. As we don't support heterneous CPUs yet, it is okay to just

heterogeneous

> + * return the counter width of the first programmable counter.
> + */
> +int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr)
> +{
> +	int i;
> +	union sbi_pmu_ctr_info *info;
> +	u32 hpm_width = 0, hpm_count = 0;
> +
> +	if (!cmask)
> +		return -EINVAL;
> +
> +	for_each_set_bit(i, &cmask, RISCV_MAX_COUNTERS) {
> +		info = &pmu_ctr_list[i];
> +		if (!info)
> +			continue;
> +		if (!hpm_width && (info->csr != CSR_CYCLE) && (info->csr != CSR_INSTRET))

nit: No need for () around the != expressions

> +			hpm_width = info->width;
> +		if (info->type == SBI_PMU_CTR_TYPE_HW)
> +			hpm_count++;
> +	}
> +
> +	*hw_ctr_width = hpm_width;
> +	*num_hw_ctr = hpm_count;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(riscv_pmu_get_hpm_info);

EXPORT_SYMBOL_GPL ?

> +
>  static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>  {
>  	struct hw_perf_event *hwc = &event->hw;
> @@ -798,7 +832,6 @@ static void riscv_pmu_destroy(struct riscv_pmu *pmu)
>  static int pmu_sbi_device_probe(struct platform_device *pdev)
>  {
>  	struct riscv_pmu *pmu = NULL;
> -	unsigned long cmask = 0;
>  	int ret = -ENODEV;
>  	int num_counters;
>  
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
> index e17e86a..a1c3f77 100644
> --- a/include/linux/perf/riscv_pmu.h
> +++ b/include/linux/perf/riscv_pmu.h
> @@ -73,6 +73,9 @@ void riscv_pmu_legacy_skip_init(void);
>  static inline void riscv_pmu_legacy_skip_init(void) {};
>  #endif
>  struct riscv_pmu *riscv_pmu_alloc(void);
> +#ifdef CONFIG_RISCV_PMU_SBI
> +int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr);
> +#endif
>  
>  #endif /* CONFIG_RISCV_PMU */
>  
> -- 
> 2.25.1
> 

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
