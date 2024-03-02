Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AECC5478C
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Mar 2024 10:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HS3Jl6w6Q3P/XhXZjyI/l0Q5iDCVyCz/cn5hguFyuPw=; b=W64RRvCHQNX++X
	IcRP4QI1MJ7Fmhiy01TWQtAP9KyPI2rW1ptDGqULkR3I0LsLOxyPy0Yr8dGklq9lTUysneo4QqtbM
	rDEYi5t7fcffqduaJnj5XCapOgb3S8zLvHn+AopIEbszxoaxlLct/9RJrBFRJ/hPcWc8/7mzx2/qu
	B40SXgTcl1Exx5oDcEXUpbkl+BaRg52DO8Yyrc8+VaCVJ44rf+YVushsbrCvweANeGw64Gq06Klwy
	mSlG3/B8znMsOFurJPtvP9LuNco/gsq4VOxGnr7xLnXHF+CrC+M2QoeXp5zRn9bnCugA/EQHsNZUw
	cfIhd8i+63D64z5lwldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgMyP-00000003Ls0-0SZg;
	Sat, 02 Mar 2024 10:52:09 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgMyL-00000003LqZ-2aCt
	for linux-riscv@lists.infradead.org;
	Sat, 02 Mar 2024 10:52:07 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-563b7b3e3ecso4757852a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 02 Mar 2024 02:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709376724; x=1709981524; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9EpHJ3vXoVYx3z3WiPBm0nq7L3LHn09T6f5KhziK9jw=;
        b=PoPlS6iZOPInECGwh8ZpJnfKo3uMMOjgfXiDfT4fDZCQVC+sZmuYBDyy5760OrpWSa
         SehHczIFvNGo8ug67TaPcKVauRHXcURNY6GWAzgsCOC+vL/M6j3KnwBvpHDjldaXBpZT
         fSaobCToKTuH+tbfrEYAzE4G1fUFZdLoBzarkBvQJKPUCiO4YrRFJRwWNOmFIaAGtPs2
         NnLl9ChkDVlg0SyXK3paRrNaJh2FoG2O563vnrnMTynXzeF+D9jpyunemjNpy8uKWUWs
         lUFwPulvRialx33jm7bYGT/6piAYaKhW5OKat3GnBh+wcZxKpoCpK7O9OREyPClEbU/5
         oqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709376724; x=1709981524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EpHJ3vXoVYx3z3WiPBm0nq7L3LHn09T6f5KhziK9jw=;
        b=aDsOprVlRsLKPrU/voP+88T98YYrKkHRp1UX7pwqabUceecgz00GBzFT0TW/i1rmYF
         vPl6yE5sohRyNhx3XOOgTQS1lkbqWh+zXBgQQrg/9LPBoD8EvWlDATnM9pkITBH1mUNO
         +5ZoE6jJ6JtQUZtBliwOjkB7To5XEVmxtzPI9IgndOgcQbC/JGGeqpCbRV6hcUjLmk80
         +G3fv6PLn/k0EOgLiyBwH63581FF0o7D8aNLSzTXJAWOsUs9nr1vjxxQ0lhUpKqrWXTd
         9/uAiryqsv1JIQA7HZV1fICvVh6ajTmIxHgiHhOEvkGADyFAxohgRRnqC2dTFzeSu1Qw
         LuUg==
X-Forwarded-Encrypted: i=1; AJvYcCUHwRUzPF6w2TdwM2H5FEy6yK9fjxkmAGZyU/ExebwIx3Ahhl0O61OPOgx0c2rW1hum8AblcDFuo0qAxxTRh5+RJ/4O1T3OjZNI4X82jhJa
X-Gm-Message-State: AOJu0YybsryHoIRXUezsLEe+EIpPtNQ9tVXx4oepb8Uc3sLoBzUEPmcj
	q5JFE25z9yGRZyzp7QYknDv1QDOz2bPOLEYzCORgGjC/K1vfNxwQ/G50qkAPjs0=
X-Google-Smtp-Source: AGHT+IHCev5tUtcI53kDoYHkl5lWdh3t/37ee1Ru+I9oZgloBvL0ICNc3Zq0ypsxSf+vVr5Y6SFE0Q==
X-Received: by 2002:a17:906:e211:b0:a3e:3a1d:f4b5 with SMTP id gf17-20020a170906e21100b00a3e3a1df4b5mr3140237ejb.65.1709376723783;
        Sat, 02 Mar 2024 02:52:03 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id h17-20020a1709063c1100b00a42da3b6518sm2609577ejg.18.2024.03.02.02.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 02:52:03 -0800 (PST)
Date: Sat, 2 Mar 2024 11:52:02 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 10/15] RISC-V: KVM: Support 64 bit firmware counters
 on RV32
Message-ID: <20240302-7679c8f67984ccae734926ba@orel>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-11-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240229010130.1380926-11-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240302_025205_692762_2696B5B6 
X-CRM114-Status: GOOD (  28.33  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 28, 2024 at 05:01:25PM -0800, Atish Patra wrote:
> The SBI v2.0 introduced a fw_read_hi function to read 64 bit firmware
> counters for RV32 based systems.
> 
> Add infrastructure to support that.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |  4 ++-
>  arch/riscv/kvm/vcpu_pmu.c             | 37 ++++++++++++++++++++++++++-
>  arch/riscv/kvm/vcpu_sbi_pmu.c         |  6 +++++
>  3 files changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> index 8cb21a4f862c..e0ad27dea46c 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> @@ -20,7 +20,7 @@ static_assert(RISCV_KVM_MAX_COUNTERS <= 64);
>  
>  struct kvm_fw_event {
>  	/* Current value of the event */
> -	unsigned long value;
> +	u64 value;
>  
>  	/* Event monitoring status */
>  	bool started;
> @@ -91,6 +91,8 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>  				     struct kvm_vcpu_sbi_return *retdata);
>  int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  				struct kvm_vcpu_sbi_return *retdata);
> +int kvm_riscv_vcpu_pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
> +				      struct kvm_vcpu_sbi_return *retdata);
>  void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
>  int kvm_riscv_vcpu_pmu_setup_snapshot(struct kvm_vcpu *vcpu, unsigned long saddr_low,
>  				      unsigned long saddr_high, unsigned long flags,
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index a02f7b981005..469bb430cf97 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -196,6 +196,29 @@ static int pmu_get_pmc_index(struct kvm_pmu *pmu, unsigned long eidx,
>  	return kvm_pmu_get_programmable_pmc_index(pmu, eidx, cbase, cmask);
>  }
>  
> +static int pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
> +			      unsigned long *out_val)
> +{
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +	struct kvm_pmc *pmc;
> +	int fevent_code;
> +
> +	if (!IS_ENABLED(CONFIG_32BIT))

Let's remove the CONFIG_32BIT check in kvm_sbi_ext_pmu_handler() and then
set *out_val to zero here and return success. Either that, or we should
WARN or something here since it's a KVM bug to get here with
!CONFIG_32BIT.

> +		return -EINVAL;
> +
> +	pmc = &kvpmu->pmc[cidx];

Uh oh! We're missing range validation of cidx! And I see we're missing it
in pmu_ctr_read() too. We need the same check we have in
kvm_riscv_vcpu_pmu_ctr_info(). I think the other SBI functions are OK,
but it's worth a triple check.

> +
> +	if (pmc->cinfo.type != SBI_PMU_CTR_TYPE_FW)
> +		return -EINVAL;
> +
> +	fevent_code = get_event_code(pmc->event_idx);
> +	pmc->counter_val = kvpmu->fw_event[fevent_code].value;
> +
> +	*out_val = pmc->counter_val >> 32;
> +
> +	return 0;
> +}
> +
>  static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  			unsigned long *out_val)
>  {
> @@ -702,6 +725,18 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>  	return 0;
>  }
>  
> +int kvm_riscv_vcpu_pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
> +				      struct kvm_vcpu_sbi_return *retdata)
> +{
> +	int ret;
> +
> +	ret = pmu_fw_ctr_read_hi(vcpu, cidx, &retdata->out_val);
> +	if (ret == -EINVAL)
> +		retdata->err_val = SBI_ERR_INVALID_PARAM;
> +
> +	return 0;

I see this follows the pattern we have with kvm_riscv_vcpu_pmu_ctr_read
and pmu_ctr_read, but I wonder if we really need the
kvm_riscv_vcpu_pmu_ctr_read() and kvm_riscv_vcpu_pmu_fw_ctr_read_hi()
wrapper functions?

> +}
> +
>  int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  				struct kvm_vcpu_sbi_return *retdata)
>  {
> @@ -775,7 +810,7 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>  			pmc->cinfo.csr = CSR_CYCLE + i;
>  		} else {
>  			pmc->cinfo.type = SBI_PMU_CTR_TYPE_FW;
> -			pmc->cinfo.width = BITS_PER_LONG - 1;
> +			pmc->cinfo.width = 63;
>  		}
>  	}
>  
> diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
> index 9f61136e4bb1..58a0e5587e2a 100644
> --- a/arch/riscv/kvm/vcpu_sbi_pmu.c
> +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> @@ -64,6 +64,12 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  	case SBI_EXT_PMU_COUNTER_FW_READ:
>  		ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
>  		break;
> +	case SBI_EXT_PMU_COUNTER_FW_READ_HI:
> +		if (IS_ENABLED(CONFIG_32BIT))
> +			ret = kvm_riscv_vcpu_pmu_fw_ctr_read_hi(vcpu, cp->a0, retdata);
> +		else
> +			retdata->out_val = 0;
> +		break;
>  	case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
>  		ret = kvm_riscv_vcpu_pmu_setup_snapshot(vcpu, cp->a0, cp->a1, cp->a2, retdata);
>  		break;
> -- 
> 2.34.1
> 

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
