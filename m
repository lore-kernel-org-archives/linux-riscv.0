Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D56C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Nov 2022 14:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/u5MzyQU9Wzz1PgJQr4g1MpU4fbPRzHp/4Cx3ocXTU=; b=T7C1WbkxOjKLcE
	e5CsDEfebr144ABCw9UDnQcUq9u3U1V1JY51C51TV5D2CGN7MLLbM3xGuksBJAAWlHCvFjW/6Zm3q
	nSHFHTMDWOxaUQ6F0qqJMorGiWcNnr90lt9+zmW/W0yBFlzFSilmt49KyaehNmOa8M12T63ihwe2q
	iu+xTT7nXUWI2Zyl7CAKyxmlu/zrnQnKvtv7GLCVTktHXJXZhlZS/mGPMC1it3vzN+jDtxcEU0FC3
	rovI3eY6q5nmXM606guzV8WFleOY5tVUBSo8nZ+hDFcn9xOBgtiIvRJZXxfOztUKkf8GJuvsGaerl
	rSxIfJr4mfUrNvtNWHRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opsMs-005VrU-NQ; Tue, 01 Nov 2022 14:35:54 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opsMq-005Vpd-8t
	for linux-riscv@lists.infradead.org; Tue, 01 Nov 2022 14:35:53 +0000
Received: by mail-ej1-x633.google.com with SMTP id sc25so37452381ejc.12
        for <linux-riscv@lists.infradead.org>; Tue, 01 Nov 2022 07:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JYPB288t3Efstem95rPO+YdVhZEmDwnMRaqEEG/LRfc=;
        b=FgSzhWqwYbV9oo9K4oYeSnfnR7vD9i3Bo6sxoGhp7IiYzoxbuNbloOaeVKhvQJCE+3
         kHax4jT2UFvyhLC5+y6ryWuXzsHClK3qwxclxrQhf8+ZT1vGO5RrHuYXU559b8TRm8qe
         2TT3oKvGXJw/eJZJlMqU6SCjJqhbYc96FmXPS1IAEUhl3DoCWVRVar6K8XKqVqOfB5W3
         dy4Tz/5JfyrSTIHu39fZM4Nk8ZsAsBM3pAQ8V8lAPbkefW7YWb+Z2FW9Zg62ZRRX3yl+
         iJWWDYSxeK0rp0UQkkY02SCudm3McNPWuJ6is8xEC3WLwDwkfttRdIaB+Rt/6XPkcnZf
         KVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYPB288t3Efstem95rPO+YdVhZEmDwnMRaqEEG/LRfc=;
        b=4b6HA/5rNNEQGLgjcIZnu/E6ftxP7K0JzpSlnI1Cimib3Brv9N0Av3W3ckF+gtcMxJ
         b7Ku1021La6JcQRldTiGXrgnkyr1OjhF3se76fMhXK2yZSvlMQ2iNw3vMU5mnajz3kId
         dZfuq70xs1URMRJIKglV7cQmpPkg1VtB4TOlm0cHLj5svvdmsUFMIHJ3DPRyRbhNh6jh
         cFjng4pRJHwTvql/TAeR+/dyLuj5AnBBxpt2j+jSk+uY0pYMzaHuCQ8aX8MGGh6kp5kb
         AadZOIq2wsdkQSP5Git0fxuchJG8SJzpQrF/S04P0MSAKqadWrWMWojJ/qJ0lzNfv1il
         n1jA==
X-Gm-Message-State: ACrzQf0y8YkIlHshDPScSeiB1TlQ3TXW231dOKvBr2p9HKIMwhxQ0pdH
	dp1q6RnDHwd1Csh6uPw1Z8OEVg==
X-Google-Smtp-Source: AMsMyM7EX+j90ZoHRKgqfXGs78hwQNNbX8fumBaOW8R2gLNs5oMsANxHEyyD3k64b09MuAf//jzV1g==
X-Received: by 2002:a17:906:dc8c:b0:7ad:a030:c305 with SMTP id cs12-20020a170906dc8c00b007ada030c305mr18221724ejc.132.1667313350061;
        Tue, 01 Nov 2022 07:35:50 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id eh22-20020a0564020f9600b00461bacee867sm4584688edb.25.2022.11.01.07.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 07:35:49 -0700 (PDT)
Date: Tue, 1 Nov 2022 15:35:48 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC  7/9] RISC-V: KVM: Implement trap & emulate for hpmcounters
Message-ID: <20221101143548.plvlhedzt3oifa3u@kamzik>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-8-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220718170205.2972215-8-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_073552_333307_44D55248 
X-CRM114-Status: GOOD (  24.99  )
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

On Mon, Jul 18, 2022 at 10:02:03AM -0700, Atish Patra wrote:
> As the KVM guests only see the virtual PMU counters, all hpmcounter
> access should trap and KVM emulates the read access on behalf of guests.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_pmu.h | 16 +++++++++
>  arch/riscv/kvm/vcpu_insn.c            |  1 +
>  arch/riscv/kvm/vcpu_pmu.c             | 47 +++++++++++++++++++++++----
>  3 files changed, 57 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> index bffee052f2ae..5410236b62a8 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> @@ -39,6 +39,19 @@ struct kvm_pmu {
>  #define pmu_to_vcpu(pmu)  (container_of((pmu), struct kvm_vcpu, arch.pmu))
>  #define pmc_to_pmu(pmc)   (&(pmc)->vcpu->arch.pmu)
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
>  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, unsigned long *out_val);
>  int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
>  				unsigned long *ctr_info);
> @@ -59,6 +72,9 @@ void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
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
> index 0aa334f853c8..7c2a4b1a69f7 100644
> --- a/arch/riscv/kvm/vcpu_insn.c
> +++ b/arch/riscv/kvm/vcpu_insn.c
> @@ -215,6 +215,7 @@ struct csr_func {
>  };
>  
>  static const struct csr_func csr_funcs[] = {
> +	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
>  };
>  
>  /**
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 3168ed740bdd..5434051f495d 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -14,6 +14,46 @@
>  #include <asm/kvm_vcpu_pmu.h>
>  #include <linux/kvm_host.h>
>  
> +int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> +				unsigned long *out_val)
> +{
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +	struct kvm_pmc *pmc;
> +	u64 enabled, running;
> +
> +	if (!kvpmu)
> +		return -EINVAL;
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
> +	if (!kvpmu)
> +		return KVM_INSN_EXIT_TO_USER_SPACE;
> +	//TODO: Should we check if vcpu pmu is initialized or not!

I guess it depends on the path to this call. It'd be best to keep the
checks to the minimum, so if this isn't a top level call then I'd say
no, but we need to check in the top level.

> +	if (wr_mask)
> +		return KVM_INSN_ILLEGAL_TRAP;
> +	cidx = csr_num - CSR_CYCLE;
> +
> +	if (kvm_riscv_vcpu_pmu_ctr_read(vcpu, cidx, val) < 0)
> +		return KVM_INSN_EXIT_TO_USER_SPACE;
> +
> +	return ret;
> +}
> +
>  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, unsigned long *out_val)
>  {
>  	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> @@ -60,13 +100,6 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>  	return 0;
>  }
>  
> -int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> -				unsigned long *out_val)
> -{
> -	/* TODO */
> -	return 0;
> -}
> -
>  int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>  {
>  	int i = 0, num_hw_ctrs, num_fw_ctrs, hpm_width;
> -- 
> 2.25.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
