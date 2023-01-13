Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8811C54EBE
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 11:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oIO4k4qUoIiiemR0Hl9yWya/znZmSrA3MWopvpMkKXo=; b=18HbnL3ZRiULMR
	EgGl1WdGIa7m3zFfKkDsoNawH7FQTdWKzFJitBobK2q0V5B/R4BqTQjR+drL4xIhc89YeNPeNPAnk
	Y+FHwdUIm14P6fa22DYQiSjDVqgP/iz24aAtuixkB7cdVKB8V+LbX9TLwnGwMzaNdXsN8WIagqsBt
	tWc7OWnpUuiWy9MEb0jByjQ5kcyiQW8Y4r7xwoAiPTzodcq8/fU/Ra7595G9VeyLxsGGPeFv4doL0
	Jqxd7YyiBGuIMS7mSwq/QIFu+bMpqxidv1BufhTPV7Gay832VzeYpjZ1rpO/srbJpw9fe7iDl//Eu
	QunMFaeAso7I2WVy0Hzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGIaP-002LNz-Pu; Fri, 13 Jan 2023 11:51:05 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGIXD-002Jeh-Jz
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 11:47:49 +0000
Received: by mail-ej1-x62e.google.com with SMTP id u9so51777018ejo.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jan 2023 03:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e7x5irO4rw3EaMagylDKZvKW4ovwwljibXZjczzaQGU=;
        b=e5BnbonbqNmxEV0/4PR4adQCwGsLTWzfLNkhxxStyP9FSeIp5x3GV6SxXy/cG2NVnh
         4FUSjCQWT4Ia0B/TBwvbZwOowwwDkU79huF3FCJAk+ulDIqp3TwdCAuvFSceXpmJLp/P
         0P4LpTsaLmiBII4p8DMahgkLkgyF3YrRmq8vUMs/QxEcHxLTEP6YgoSc9DuDdSEVah3/
         x2D2Iqf0h1+9CCoTp6yVmAAkJogclS1hvT9vTXCImh+eMMi+XT3NbhxUNAATzSjDnw7N
         jd/d1LZSHUzuKi/sR3jcxZTN7GQW00pqUnqYh6ics+aikPYDhaNo0rR+COPL8QPjpFNP
         cQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7x5irO4rw3EaMagylDKZvKW4ovwwljibXZjczzaQGU=;
        b=jWRv2YCxTZD1rrPnavChHbXqnmc4Leztd/cuabVbZlEPVKPb/Jcn9sMYv5/gKDWy7U
         MHXMaZivNL3SqADMBuEr6VKzluEt5DSV0TxLyw2kkLUR0GQs52X4UJR3Ilkubv8YFb1P
         HjHkGqhqU3NqUGQMT3zndmOf9gHWSqF6mjO8eF4Xt3Fo6Plov9je4I3tWsjJ8AlMLppw
         Z+zgPr17HTiRq5jgS6m3ShXmyK0WLbXIg+dpArPSFov429UxL1Gq+mfjG/28v19ugGd6
         ueSlFtVBG+46vYUrjtezRl7vl0N5AYsFegArVfJCf4MVVlfVoaqqhVZ2Cy6Z2a3E5xrq
         at/Q==
X-Gm-Message-State: AFqh2kpKWzkv1iotjaQIFVHXP46E7e/oBdgNRKMHZU9vtUDYgLQ4rIAx
	pSnWUYcYNVJPyHJvl/677oUI6A==
X-Google-Smtp-Source: AMrXdXvLfpbMKJIvjpyX4r1UqkfLgh2wYHnZKf4GTnW8FEpmpdQ07SUdKAuO+GCKpEhoIc7xaIrmFw==
X-Received: by 2002:a17:907:7e83:b0:7c0:f558:e518 with SMTP id qb3-20020a1709077e8300b007c0f558e518mr84590224ejc.51.1673610461450;
        Fri, 13 Jan 2023 03:47:41 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id lb14-20020a170907784e00b007c0fd177c0bsm8348795ejc.46.2023.01.13.03.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 03:47:41 -0800 (PST)
Date: Fri, 13 Jan 2023 12:47:40 +0100
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
Subject: Re: [PATCH v2 09/11] RISC-V: KVM: Implement trap & emulate for
 hpmcounters
Message-ID: <20230113114740.6eophcwagnm6mw7o@orel>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
 <20221215170046.2010255-10-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221215170046.2010255-10-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_034747_669551_DE914918 
X-CRM114-Status: GOOD (  22.62  )
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

On Thu, Dec 15, 2022 at 09:00:44AM -0800, Atish Patra wrote:
> As the KVM guests only see the virtual PMU counters, all hpmcounter
> access should trap and KVM emulates the read access on behalf of guests.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_pmu.h | 16 ++++++++++
>  arch/riscv/kvm/vcpu_insn.c            |  4 ++-
>  arch/riscv/kvm/vcpu_pmu.c             | 44 ++++++++++++++++++++++++++-
>  3 files changed, 62 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> index 6a8c0f7..7a9a8e6 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> @@ -43,6 +43,19 @@ struct kvm_pmu {
>  #define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu)
>  #define pmu_to_vcpu(pmu)  (container_of((pmu), struct kvm_vcpu, arch.pmu))
>  
> +#if defined(CONFIG_32BIT)
> +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> +{ .base = CSR_CYCLEH,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm }, \
> +{ .base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
> +#else
> +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> +{ .base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
> +#endif
> +
> +int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
> +				unsigned long *val, unsigned long new_val,
> +				unsigned long wr_mask);
> +
>  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_ext_data *edata);
>  int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
>  				struct kvm_vcpu_sbi_ext_data *edata);
> @@ -65,6 +78,9 @@ void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
>  #else
>  struct kvm_pmu {
>  };
> +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> +{ .base = 0,      .count = 0, .func = NULL },
> +
>  
>  static inline int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>  {
> diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> index 1ff2649..f689337 100644
> --- a/arch/riscv/kvm/vcpu_insn.c
> +++ b/arch/riscv/kvm/vcpu_insn.c
> @@ -213,7 +213,9 @@ struct csr_func {
>  		    unsigned long wr_mask);
>  };
>  
> -static const struct csr_func csr_funcs[] = {};
> +static const struct csr_func csr_funcs[] = {
> +	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
> +};
>  
>  /**
>   * kvm_riscv_vcpu_csr_return -- Handle CSR read/write after user space
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 0f0748f1..53c4163 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -17,6 +17,43 @@
>  
>  #define kvm_pmu_num_counters(pmu) ((pmu)->num_hw_ctrs + (pmu)->num_fw_ctrs)
>  
> +static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> +			unsigned long *out_val)
> +{
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +	struct kvm_pmc *pmc;
> +	u64 enabled, running;
> +
> +	pmc = &kvpmu->pmc[cidx];
> +	if (!pmc->perf_event)
> +		return -EINVAL;
> +
> +	pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
> +	*out_val = pmc->counter_val;
> +
> +	return 0;
> +}
> +
> +int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
> +				unsigned long *val, unsigned long new_val,
> +				unsigned long wr_mask)
> +{
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +	int cidx, ret = KVM_INSN_CONTINUE_NEXT_SEPC;
> +
> +	if (!kvpmu || !kvpmu->init_done)
> +		return KVM_INSN_EXIT_TO_USER_SPACE;
> +
> +	if (wr_mask)
> +		return KVM_INSN_ILLEGAL_TRAP;

nit: add blank line here

> +	cidx = csr_num - CSR_CYCLE;
> +
> +	if (pmu_ctr_read(vcpu, cidx, val) < 0)
> +		return KVM_INSN_EXIT_TO_USER_SPACE;
> +
> +	return ret;
> +}
> +
>  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_ext_data *edata)
>  {
>  	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> @@ -69,7 +106,12 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>  int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  				struct kvm_vcpu_sbi_ext_data *edata)
>  {
> -	/* TODO */
> +	int ret;
> +
> +	ret = pmu_ctr_read(vcpu, cidx, &edata->out_val);
> +	if (ret == -EINVAL)
> +		edata->err_val = SBI_ERR_INVALID_PARAM;
> +
>  	return 0;
>  }
>  
> -- 
> 2.25.1
>

Otherwise

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
