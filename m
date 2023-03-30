Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924BAC6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 07:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZrZt6oUWMfnmTx49W9Jmya4hpPP5fTKS3lEZKbzJDkU=; b=dca1nke9dg1u3r
	PtCjIor+h1DhemhP15O3+WjIxBBLWNHQz8SbIyTC6ggp6kI4T+IRZ9V0H3DayNrTv9hJwpcXlUPPI
	8bAPmVhJr/TeaqQpzzs1QQ2vEy9crqvNhc+RbSIwqnyxpp0X30JgPVS0IA79bBAC2y9cM62LECAaP
	Rech4AGBi4kQnEuC2hIcZXw8Ioa6T18rpPJ7pG4/ALKWlsv8CxE0XNGkBMiOoidz63E6heaoM4fR0
	GFg0juLilKPt6gP3Bpq+XME+P7CaNEOForiu2uJ7oE8+SOF3c5fAWb5f9ko/btBd7sDANqMMEypjf
	Wffimubzbbg0rVaS2KnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phmKk-002qiv-1L;
	Thu, 30 Mar 2023 07:04:30 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phmKf-002qhS-0o
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 07:04:29 +0000
Received: by mail-wm1-x32a.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so7487370wmq.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Mar 2023 00:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680159861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nRGiYGWRgIJrDplYiJC4OiBTDpjb4NhXXJybivPhzkU=;
        b=G5Z6DmgR420dgC0k7KbGQW2vFAwxyBVgh4e5fs4et3PuZ4Ex8/MujEnrcXDSSzsKpb
         uAIRBudKdy5FDt8SF5RSvwilIuvBzCiUEAJQQRNkDIMo6KvRZ5vl9Zc+JQPcaU2EofAK
         c/RW2LHVjix3T1nKHVrtsmhHciU+cgax9vqTk4994C3Mxp4AuyB7KlePtKvxIfVMZVG/
         2Juzs9sbXTqbDYRgVb0gTRsPxFimEIFPb5srSPJjSMSeb5b22cDbupxeWqizJzjsnFu7
         JRvwIPZ3ZaTt2rr5TwOr9tU9Av9xNMBOuq+RZeCshQxjLId2kF8vKvQB3OCM6+W5QVds
         vN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680159861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRGiYGWRgIJrDplYiJC4OiBTDpjb4NhXXJybivPhzkU=;
        b=iHFpvLm53FDmCESsxBwR2yaMYPl/5XFc4KQPZmzLdhm80hF8ABcCOFG4TqkECMyrmD
         FHNBDQfxrjVDjEXkB1RiLf4UjWwocJALD+21I+0W1LTL2iru7rEDXVS/NAMrXtT3FEaI
         F+FamvhMud6n+ptvC72hsmhGWUJW4hgM3hqZAntlh9GNVFB1P9a+BUymXBo7Xup47tlA
         lGqFnr5G0epftLA+dAo3KSD4bTUDrFtHT1NBCTQUumht0NQ8akfckvFAZUmHP04Ts1aR
         iw73lcBo2QodOnYIEp4ta24q8jtvGsKHbV5z7wRNvULRKo6orAeEIv2km/xG2k652A5z
         MHQA==
X-Gm-Message-State: AAQBX9c8/XedCnwWspm1Pf+qzcIeoe9azn16mk2l/9b8HDQYJPmofueT
	QH2mR0OyVedHF/IpNIM1uSRXYQ==
X-Google-Smtp-Source: AKy350Y9dd/w3dLzY2picTM4Z/c+Qx2PWAavqOB3PR4TxjvReyxdswF+WuyQBNgLPl7Z+/oanWuEug==
X-Received: by 2002:a7b:c8c5:0:b0:3ef:62cd:1ef with SMTP id f5-20020a7bc8c5000000b003ef62cd01efmr12918593wml.25.1680159861145;
        Thu, 30 Mar 2023 00:04:21 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id i22-20020a05600c355600b003ede6540190sm5122800wmq.0.2023.03.30.00.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 00:04:20 -0700 (PDT)
Date: Thu, 30 Mar 2023 09:04:19 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] RISC-V: KVM: Add ONE_REG interface to
 enable/disable SBI extensions
Message-ID: <7gtvgdxjwa662kfafnd5xrgugjt3w6iwv4w7rbrfeooviq2cnb@dqplsikshpzw>
References: <20230330053135.1686577-1-apatel@ventanamicro.com>
 <20230330053135.1686577-2-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230330053135.1686577-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_000425_289763_D6D52A4A 
X-CRM114-Status: GOOD (  31.15  )
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

On Thu, Mar 30, 2023 at 11:01:35AM +0530, Anup Patel wrote:
> We add ONE_REG interface to enable/disable SBI extensions (just
> like the ONE_REG interface for ISA extensions). This allows KVM
> user-space to decide the set of SBI extension enabled for a Guest
> and by default all SBI extensions are enabled.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |   8 +-
>  arch/riscv/include/uapi/asm/kvm.h     |  20 ++++
>  arch/riscv/kvm/vcpu.c                 |   2 +
>  arch/riscv/kvm/vcpu_sbi.c             | 150 +++++++++++++++++++++++---
>  arch/riscv/kvm/vcpu_sbi_base.c        |   2 +-
>  5 files changed, 163 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index 8425556af7d1..4278125a38a5 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -16,6 +16,7 @@
>  
>  struct kvm_vcpu_sbi_context {
>  	int return_handled;
> +	bool extension_disabled[KVM_RISCV_SBI_EXT_MAX];
>  };
>  
>  struct kvm_vcpu_sbi_return {
> @@ -45,7 +46,12 @@ void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
>  				     struct kvm_run *run,
>  				     u32 type, u64 flags);
>  int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
> -const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid);
> +int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
> +				   const struct kvm_one_reg *reg);
> +int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
> +				   const struct kvm_one_reg *reg);
> +const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
> +				struct kvm_vcpu *vcpu, unsigned long extid);
>  int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
>  
>  #ifdef CONFIG_RISCV_SBI_V01
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 92af6f3f057c..33c3457b94e7 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -108,6 +108,23 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> +/*
> + * SBI extension IDs specific to KVM. This is not the same as the SBI
> + * extension IDs defined by the RISC-V SBI specification.
> + */
> +enum KVM_RISCV_SBI_EXT_ID {
> +	KVM_RISCV_SBI_EXT_V01 = 0,
> +	KVM_RISCV_SBI_EXT_TIME,
> +	KVM_RISCV_SBI_EXT_IPI,
> +	KVM_RISCV_SBI_EXT_RFENCE,
> +	KVM_RISCV_SBI_EXT_SRST,
> +	KVM_RISCV_SBI_EXT_HSM,
> +	KVM_RISCV_SBI_EXT_PMU,
> +	KVM_RISCV_SBI_EXT_EXPERIMENTAL,
> +	KVM_RISCV_SBI_EXT_VENDOR,
> +	KVM_RISCV_SBI_EXT_MAX,
> +};
> +
>  /* Possible states for kvm_riscv_timer */
>  #define KVM_RISCV_TIMER_STATE_OFF	0
>  #define KVM_RISCV_TIMER_STATE_ON	1
> @@ -152,6 +169,9 @@ enum KVM_RISCV_ISA_EXT_ID {
>  /* ISA Extension registers are mapped as type 7 */
>  #define KVM_REG_RISCV_ISA_EXT		(0x07 << KVM_REG_RISCV_TYPE_SHIFT)
>  
> +/* SBI extension registers are mapped as type 8 */
> +#define KVM_REG_RISCV_SBI_EXT		(0x08 << KVM_REG_RISCV_TYPE_SHIFT)
> +
>  #endif
>  
>  #endif /* __LINUX_KVM_RISCV_H */
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 7d010b0be54e..311fd347c5a8 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -601,6 +601,8 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
>  						 KVM_REG_RISCV_FP_D);
>  	case KVM_REG_RISCV_ISA_EXT:
>  		return kvm_riscv_vcpu_set_reg_isa_ext(vcpu, reg);
> +	case KVM_REG_RISCV_SBI_EXT:
> +		return kvm_riscv_vcpu_set_reg_sbi_ext(vcpu, reg);
>  	default:
>  		break;
>  	}
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 15fde15f9fb8..bedd7d78a5f0 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -30,17 +30,52 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
>  };
>  #endif
>  
> -static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
> -	&vcpu_sbi_ext_v01,
> -	&vcpu_sbi_ext_base,
> -	&vcpu_sbi_ext_time,
> -	&vcpu_sbi_ext_ipi,
> -	&vcpu_sbi_ext_rfence,
> -	&vcpu_sbi_ext_srst,
> -	&vcpu_sbi_ext_hsm,
> -	&vcpu_sbi_ext_pmu,
> -	&vcpu_sbi_ext_experimental,
> -	&vcpu_sbi_ext_vendor,
> +struct kvm_riscv_sbi_extension_entry {
> +	enum KVM_RISCV_SBI_EXT_ID dis_idx;
> +	const struct kvm_vcpu_sbi_extension *ext_ptr;
> +};
> +
> +static const struct kvm_riscv_sbi_extension_entry sbi_ext[] = {
> +	{
> +		.dis_idx = KVM_RISCV_SBI_EXT_V01,
> +		.ext_ptr = &vcpu_sbi_ext_v01,
> +	},
> +	{
> +		.dis_idx = KVM_RISCV_SBI_EXT_MAX, /* Can't be disabled */
> +		.ext_ptr = &vcpu_sbi_ext_base,
> +	},
> +	{
> +		.dis_idx = KVM_RISCV_SBI_EXT_TIME,
> +		.ext_ptr = &vcpu_sbi_ext_time,
> +	},
> +	{
> +		.dis_idx = KVM_RISCV_SBI_EXT_IPI,
> +		.ext_ptr = &vcpu_sbi_ext_ipi,
> +	},
> +	{
> +		.dis_idx = KVM_RISCV_SBI_EXT_RFENCE,
> +		.ext_ptr = &vcpu_sbi_ext_rfence,
> +	},
> +	{
> +		.dis_idx = KVM_RISCV_SBI_EXT_SRST,
> +		.ext_ptr = &vcpu_sbi_ext_srst,
> +	},
> +	{
> +		.dis_idx = KVM_RISCV_SBI_EXT_HSM,
> +		.ext_ptr = &vcpu_sbi_ext_hsm,
> +	},
> +	{
> +		.dis_idx = KVM_RISCV_SBI_EXT_PMU,
> +		.ext_ptr = &vcpu_sbi_ext_pmu,
> +	},
> +	{
> +		.dis_idx = KVM_RISCV_SBI_EXT_EXPERIMENTAL,
> +		.ext_ptr = &vcpu_sbi_ext_experimental,
> +	},
> +	{
> +		.dis_idx = KVM_RISCV_SBI_EXT_VENDOR,
> +		.ext_ptr = &vcpu_sbi_ext_vendor,
> +	},
>  };
>  
>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
> @@ -99,14 +134,95 @@ int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
>  	return 0;
>  }
>  
> -const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid)
> +int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
> +				   const struct kvm_one_reg *reg)
> +{
> +	unsigned long __user *uaddr =
> +			(unsigned long __user *)(unsigned long)reg->addr;
> +	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
> +					    KVM_REG_SIZE_MASK |
> +					    KVM_REG_RISCV_SBI_EXT);
> +	unsigned long i, reg_val;
> +	const struct kvm_riscv_sbi_extension_entry *sext = NULL;
> +	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
> +
> +	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
> +		return -EINVAL;
> +
> +	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
> +		return -EFAULT;
> +
> +	if (reg_num >= KVM_RISCV_SBI_EXT_MAX ||
> +	    (reg_val != 1 && reg_val != 0))
> +		return -EINVAL;
> +
> +	if (vcpu->arch.ran_atleast_once)
> +		return -EBUSY;
> +
> +	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
> +		if (sbi_ext[i].dis_idx == reg_num) {
> +			sext = &sbi_ext[i];
> +			break;
> +		}
> +	}
> +	if (!sext)
> +		return -ENOENT;
> +
> +	scontext->extension_disabled[sext->dis_idx] = !reg_val;
> +
> +	return 0;
> +}
> +
> +int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
> +				   const struct kvm_one_reg *reg)
> +{
> +	unsigned long __user *uaddr =
> +			(unsigned long __user *)(unsigned long)reg->addr;
> +	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
> +					    KVM_REG_SIZE_MASK |
> +					    KVM_REG_RISCV_SBI_EXT);
> +	unsigned long i, reg_val;
> +	const struct kvm_riscv_sbi_extension_entry *sext = NULL;
> +	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
> +
> +	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
> +		return -EINVAL;
> +
> +	if (reg_num >= KVM_RISCV_SBI_EXT_MAX)
> +		return -EINVAL;
> +
> +	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
> +		if (sbi_ext[i].dis_idx == reg_num) {
> +			sext = &sbi_ext[i];
> +			break;
> +		}
> +	}
> +	if (!sext)
> +		return -ENOENT;
> +
> +	reg_val = !scontext->extension_disabled[sext->dis_idx];
> +	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
> +				struct kvm_vcpu *vcpu, unsigned long extid)
>  {
> -	int i = 0;
> +	int i;
> +	const struct kvm_riscv_sbi_extension_entry *sext;
> +	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
>  
>  	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
> -		if (sbi_ext[i]->extid_start <= extid &&
> -		    sbi_ext[i]->extid_end >= extid)
> -			return sbi_ext[i];
> +		sext = &sbi_ext[i];
> +		if (sext->ext_ptr->extid_start <= extid &&
> +		    sext->ext_ptr->extid_end >= extid) {
> +			if (sext->dis_idx < KVM_RISCV_SBI_EXT_MAX &&
> +			    scontext->extension_disabled[sext->dis_idx])
> +				return NULL;
> +			return sbi_ext[i].ext_ptr;
> +		}
>  	}
>  
>  	return NULL;
> @@ -126,7 +242,7 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
>  	};
>  	bool ext_is_v01 = false;
>  
> -	sbi_ext = kvm_vcpu_sbi_find_ext(cp->a7);
> +	sbi_ext = kvm_vcpu_sbi_find_ext(vcpu, cp->a7);
>  	if (sbi_ext && sbi_ext->handler) {
>  #ifdef CONFIG_RISCV_SBI_V01
>  		if (cp->a7 >= SBI_EXT_0_1_SET_TIMER &&
> diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> index 9945aff34c14..5bc570b984f4 100644
> --- a/arch/riscv/kvm/vcpu_sbi_base.c
> +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> @@ -44,7 +44,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  			kvm_riscv_vcpu_sbi_forward(vcpu, run);
>  			retdata->uexit = true;
>  		} else {
> -			sbi_ext = kvm_vcpu_sbi_find_ext(cp->a0);
> +			sbi_ext = kvm_vcpu_sbi_find_ext(vcpu, cp->a0);
>  			*out_val = sbi_ext && sbi_ext->probe ?
>  					   sbi_ext->probe(vcpu) : !!sbi_ext;
>  		}
> -- 
> 2.34.1
>

This looks good, but I wonder if we shouldn't instead get/set a bitmap of
all SBI extension enables at once for scalability.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
