Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B665C52D11
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 17:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=397GZRIsLONH7Trz2yW8B7yX5c2RoZz3nCE0qezZhWM=; b=M4AJcGlaT3GZw3
	hJeVWGa8GWGPuIBwJHNkNr9ggtNBKMIHmf+Jq2engJ0Bts5UMg2GvViDKJ/6OvCXIme7nkPd7qiFJ
	FpedME09cu9wyid2ch4E58kuRtOt/dQqEFRag+ZIg6DNjsVHLyVuVA4a2xCR9trU5pSvsYMuh0ZRM
	KX19jH603kuJLwwYRwJMp3z0hJqz1LRMyjRwHp3RXdXuIbRLAEBvySUBtlFqwiwUEF7h1Ki3vCxrz
	SNM4d5JludQ0k2VUvt/3fLH6A9F0HWAz+i/iFoLsKEMEoXqiqyhdvDbGdx0hZ/UhLghO7trXMx68M
	uklUPFvxzX7fvwCKX5YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL5ue-00BzR5-V9; Thu, 26 Jan 2023 17:19:48 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL5ub-00BzPB-7h
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 17:19:47 +0000
Received: by mail-ed1-x529.google.com with SMTP id g11so2473730eda.12
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jan 2023 09:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=01osTMBd75dRpakFi+4b9Q8z4AgCSWYPv3lvZC0TYjM=;
        b=lrO89/jqwvDxECL40SawzLb3nkxUOLRNmH+WH6HvtVummxi4esYTR3oUbmDt78ozlj
         +vUvCoPnxaPazamIRsBkU9zwF9jwV1WV3aznQ/qJI7LNUxxlS+yL0HhNoetEetNSxiFY
         gg80cTixAwH15DyhrpY3T47S5dm5+5zxv1L4ExLLcVlZ/HFR6XfsZNUHerfjUa3Ll55S
         WGdjFxu5CnhgAqlWFiRaG8IvLITUwkrHs0oDJ2qfJZtRcAi0BsNAYny1IyLGjzW4GSJZ
         W1r4FoKyQzBU+Gqw/UKZXoPqziN6F25sqLhuBaWNfLh4MTMn2DHdkeoKLNs4Av1XaStH
         2i0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01osTMBd75dRpakFi+4b9Q8z4AgCSWYPv3lvZC0TYjM=;
        b=zasShtfgg/ORkWMo0o1iRMxbTYA1wI4KvERNVKiwWwV4g318KpSfJvfNevXHZoR1FL
         FE4lc5tE+ZyNLsSOdBFKoj2ZkkNW5ZPCDCgVb9ZRkUNfcQQzVdDMNd9FtcQ23h8Qbn5V
         yXcpkMxo2ZhKOPEVDG9WJhdHtBcHKamQCo4YMPEbHJV6bvJdjqkxBF7YPiV4g6WNLOuh
         bBmvbqC+0rRfsh/hRXXJZGxKySDYxcv57WhUYn0nhtxITfkI6dPYJxxuj+kZag0PeGyf
         +jlM85mdh6t0b0E+JDmXgv27cHom5lJhaGizXekD9gaq6wyJhjmsUMNT7/HcQnHASKDu
         pfFQ==
X-Gm-Message-State: AFqh2kpGHIO3iAlkcv6HblZm8Ybkzr4gTqfPiDZ3pXkQoLJYpj31iExN
	aWFB1PaBFmLymIB37qfr8P3xNQ==
X-Google-Smtp-Source: AMrXdXtfKMYV3jATA6WLS4xpNKiethm1csHaCV2lOHmRMOi/M8Hk0+YWGFwOy/AhSPDS/Hp9yZrV+A==
X-Received: by 2002:a05:6402:5299:b0:49c:5a27:c1fa with SMTP id en25-20020a056402529900b0049c5a27c1famr39368799edb.24.1674753579952;
        Thu, 26 Jan 2023 09:19:39 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id s22-20020a056402037600b0049c4e3d4139sm1009026edw.89.2023.01.26.09.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 09:19:39 -0800 (PST)
Date: Thu, 26 Jan 2023 18:19:38 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
Message-ID: <20230126171938.la5jswt6gr4qanl5@orel>
References: <20230112140304.1830648-1-apatel@ventanamicro.com>
 <20230112140304.1830648-6-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230112140304.1830648-6-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_091945_307529_08D3A6F9 
X-CRM114-Status: GOOD (  26.68  )
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

On Thu, Jan 12, 2023 at 07:33:02PM +0530, Anup Patel wrote:
> We extend the CSR ONE_REG interface to access both general CSRs and
> AIA CSRs. To achieve this, we introduce "subtype" field in the ONE_REG
> id which can be used for grouping registers within a particular "type"
> of ONE_REG registers.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 15 ++++-
>  arch/riscv/kvm/vcpu.c             | 96 ++++++++++++++++++++++++-------
>  2 files changed, 89 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 71992ff1f9dd..d0704eff0121 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -64,7 +64,7 @@ struct kvm_riscv_core {
>  #define KVM_RISCV_MODE_S	1
>  #define KVM_RISCV_MODE_U	0
>  
> -/* CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> +/* General CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
>  struct kvm_riscv_csr {
>  	unsigned long sstatus;
>  	unsigned long sie;
> @@ -78,6 +78,10 @@ struct kvm_riscv_csr {
>  	unsigned long scounteren;
>  };
>  
> +/* AIA CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> +struct kvm_riscv_aia_csr {
> +};
> +
>  /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
>  struct kvm_riscv_timer {
>  	__u64 frequency;
> @@ -105,6 +109,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_SVINVAL,
>  	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
>  	KVM_RISCV_ISA_EXT_ZICBOM,
> +	KVM_RISCV_ISA_EXT_SSAIA,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> @@ -134,6 +139,8 @@ enum KVM_RISCV_SBI_EXT_ID {
>  /* If you need to interpret the index values, here is the key: */
>  #define KVM_REG_RISCV_TYPE_MASK		0x00000000FF000000
>  #define KVM_REG_RISCV_TYPE_SHIFT	24
> +#define KVM_REG_RISCV_SUBTYPE_MASK	0x0000000000FF0000
> +#define KVM_REG_RISCV_SUBTYPE_SHIFT	16

We could just define a new AIA_CSR type, rather than introduce CSR
subtypes. While grouping all CSRs together under the CSR type also
makes sense, having to teach all userspaces about subtypes may not
be worth the organizational benefits.

>  
>  /* Config registers are mapped as type 1 */
>  #define KVM_REG_RISCV_CONFIG		(0x01 << KVM_REG_RISCV_TYPE_SHIFT)
> @@ -147,8 +154,12 @@ enum KVM_RISCV_SBI_EXT_ID {
>  
>  /* Control and status registers are mapped as type 3 */
>  #define KVM_REG_RISCV_CSR		(0x03 << KVM_REG_RISCV_TYPE_SHIFT)
> +#define KVM_REG_RISCV_CSR_GENERAL	0x0
> +#define KVM_REG_RISCV_CSR_AIA		0x1
>  #define KVM_REG_RISCV_CSR_REG(name)	\
> -		(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
> +	(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
> +#define KVM_REG_RISCV_CSR_AIA_REG(name)	\
> +	(offsetof(struct kvm_riscv_aia_csr, name) / sizeof(unsigned long))
>  
>  /* Timer registers are mapped as type 4 */
>  #define KVM_REG_RISCV_TIMER		(0x04 << KVM_REG_RISCV_TYPE_SHIFT)
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 3cf50eadc8ce..37933ea20274 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -58,6 +58,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	[KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
>  	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
>  
> +	KVM_ISA_EXT_ARR(SSAIA),
>  	KVM_ISA_EXT_ARR(SSTC),
>  	KVM_ISA_EXT_ARR(SVINVAL),
>  	KVM_ISA_EXT_ARR(SVPBMT),
> @@ -96,6 +97,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_C:
>  	case KVM_RISCV_ISA_EXT_I:
>  	case KVM_RISCV_ISA_EXT_M:
> +	case KVM_RISCV_ISA_EXT_SSAIA:
>  	case KVM_RISCV_ISA_EXT_SSTC:
>  	case KVM_RISCV_ISA_EXT_SVINVAL:
>  	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
> @@ -451,30 +453,79 @@ static int kvm_riscv_vcpu_set_reg_core(struct kvm_vcpu *vcpu,
>  	return 0;
>  }
>  
> +static int kvm_riscv_vcpu_general_get_csr(struct kvm_vcpu *vcpu,
> +					  unsigned long reg_num,
> +					  unsigned long *out_val)
> +{
> +	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
> +
> +	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
> +		return -EINVAL;
> +
> +	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
> +		kvm_riscv_vcpu_flush_interrupts(vcpu);
> +		*out_val = (csr->hvip >> VSIP_TO_HVIP_SHIFT) & VSIP_VALID_MASK;
> +	} else
> +		*out_val = ((unsigned long *)csr)[reg_num];
> +
> +	return 0;
> +}
> +
>  static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
>  				      const struct kvm_one_reg *reg)
>  {
> -	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
> +	int rc;
>  	unsigned long __user *uaddr =
>  			(unsigned long __user *)(unsigned long)reg->addr;
>  	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
>  					    KVM_REG_SIZE_MASK |
>  					    KVM_REG_RISCV_CSR);
> -	unsigned long reg_val;
> +	unsigned long reg_val, reg_subtype;
>  
>  	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
>  		return -EINVAL;
> +
> +	reg_subtype = (reg_num & KVM_REG_RISCV_SUBTYPE_MASK)
> +			>> KVM_REG_RISCV_SUBTYPE_SHIFT;
> +	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
> +	switch (reg_subtype) {
> +	case KVM_REG_RISCV_CSR_GENERAL:
> +		rc = kvm_riscv_vcpu_general_get_csr(vcpu, reg_num, &reg_val);
> +		break;
> +	case KVM_REG_RISCV_CSR_AIA:
> +		rc = kvm_riscv_vcpu_aia_get_csr(vcpu, reg_num, &reg_val);
> +		break;
> +	default:
> +		rc = -EINVAL;
> +		break;
> +	}
> +	if (rc)
> +		return rc;
> +
> +	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +static inline int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
> +						 unsigned long reg_num,
> +						 unsigned long reg_val)
> +{
> +	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
> +
>  	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
>  		return -EINVAL;
>  
>  	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
> -		kvm_riscv_vcpu_flush_interrupts(vcpu);
> -		reg_val = (csr->hvip >> VSIP_TO_HVIP_SHIFT) & VSIP_VALID_MASK;
> -	} else
> -		reg_val = ((unsigned long *)csr)[reg_num];
> +		reg_val &= VSIP_VALID_MASK;
> +		reg_val <<= VSIP_TO_HVIP_SHIFT;
> +	}
>  
> -	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
> -		return -EFAULT;
> +	((unsigned long *)csr)[reg_num] = reg_val;
> +
> +	if (reg_num == KVM_REG_RISCV_CSR_REG(sip))
> +		WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
>  
>  	return 0;
>  }
> @@ -482,31 +533,36 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
>  static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
>  				      const struct kvm_one_reg *reg)
>  {
> -	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
> +	int rc;
>  	unsigned long __user *uaddr =
>  			(unsigned long __user *)(unsigned long)reg->addr;
>  	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
>  					    KVM_REG_SIZE_MASK |
>  					    KVM_REG_RISCV_CSR);
> -	unsigned long reg_val;
> +	unsigned long reg_val, reg_subtype;
>  
>  	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
>  		return -EINVAL;
> -	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
> -		return -EINVAL;
>  
>  	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
>  		return -EFAULT;
>  
> -	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
> -		reg_val &= VSIP_VALID_MASK;
> -		reg_val <<= VSIP_TO_HVIP_SHIFT;
> +	reg_subtype = (reg_num & KVM_REG_RISCV_SUBTYPE_MASK)
> +			>> KVM_REG_RISCV_SUBTYPE_SHIFT;
> +	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
> +	switch (reg_subtype) {
> +	case KVM_REG_RISCV_CSR_GENERAL:
> +		rc = kvm_riscv_vcpu_general_set_csr(vcpu, reg_num, reg_val);
> +		break;
> +	case KVM_REG_RISCV_CSR_AIA:
> +		rc = kvm_riscv_vcpu_aia_set_csr(vcpu, reg_num, reg_val);
> +		break;
> +	default:
> +		rc = -EINVAL;
> +		break;
>  	}
> -
> -	((unsigned long *)csr)[reg_num] = reg_val;
> -
> -	if (reg_num == KVM_REG_RISCV_CSR_REG(sip))
> -		WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
> +	if (rc)
> +		return rc;
>  
>  	return 0;
>  }
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
