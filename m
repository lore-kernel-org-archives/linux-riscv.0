Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4F6C04A94
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+sAEK8LsifIVdaMnhSeIC+9kLxNZOXgHV+u+zyt+URw=; b=ubMkZOcur/tebw
	7El7RB/4miAygViT1uJi4xwpTIaO/9k7S+bMTSEr2guM3iCwiU+SsmZiIENVx2lWxEFXz41CUksZP
	2fiWd58ZGGU7T9ZNr4WBTgE+w3U1Fc0pbN9Cad4GV08hzdgykMaIxQxyPGZ8EsUz5CA403sfAUUsL
	RGxatAcmN6C0Q6xeqQ8mnmZJKoSwMh9RITRygRRZHKjKnUqWODX3jSlimEGOS+uWEWeoOAiqJvXZJ
	SDbRmHkziGYuQd5d7AvjAdJi+L+RmgzJome8Xhm9HFReXIG1IZ7K7rs6UMBz+m83XtX5TTSaRPMm5
	A9R+0TXAwJStN/eLzQUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRwZO-00CgI4-0v;
	Fri, 04 Aug 2023 15:18:26 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRwZK-00CgH4-0T
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 15:18:24 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-56ca9a337caso1402412eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 08:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691162298; x=1691767098;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kmSaHOl9UHrIIfhxkCMi8jOuppUAv69UVRKlolERwaE=;
        b=ZEueiNnR9V6J4UPj8LAMOeQyZFDpeeyjnG11oioYJfQa6G3k0fefTgFjyo7kQBFd3q
         4rGTvOPKi/ytqoDoMRLWJOYuUbcQ9T75Y9G54qnqYBC+eGNhOTBMkbQL8FE9UO2QKQZr
         gGR2YYpSf8rsu83MQsTL5fcReh7enRcn/VIdzxXKsr9CASUXkcOSP6aMZawXXqQzH0H6
         1lW5Wv5uV0yMxlvMm5Rgdxrj9ID6UBXMKi1EWPZ0a/IKx6afzsZ1ZFHyloFKmVNUSrsS
         4fXkVdc+2Hgqu4sKeyqvQ+Zc7LHArbJkoRwTBTIuDn9hu5/Z8IVSMPVq6vyIIHGC/RmM
         mRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691162298; x=1691767098;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kmSaHOl9UHrIIfhxkCMi8jOuppUAv69UVRKlolERwaE=;
        b=cWf7IgQxHpAYnLcW67L96m6dKfYTrwsefOA+dXtDWQDr1/uFz8pLHoomNVEL//diML
         npSDgdJQKvO1N+rq2xTgwMy/s6mWnw2extuWgKwdHQHdg+5ZSNbiCeTktBjwYAf6Z3IY
         c0Lunk8lUv3rkGx2+2HekoievZ3NCB5FUMC+RtwFGJb2pHxYYyqSjHa45E9iThnnQHwo
         Im7WH6u/sSIuJ6YVtx3GbeGmmti/AVrgIsod6qvuWK/XgKj8/30H/J6PBA/zxxAkMHY3
         nOtYvcXLidO9p88ETjR74srFG9lwSbccNfp7uzQhcEdLUHVZWrqGas2MF8FSXPnOfQxQ
         1Imw==
X-Gm-Message-State: AOJu0Yw7XEAZ9LLtnACHq93dB0N1tBQkVHo+q/0OgnKUFkWWgPADnkLc
	4mPcXxkjSE6tI3SBqDFemxLKKw==
X-Google-Smtp-Source: AGHT+IFL2X1cme3sphpkFDUrpsasmaaOvgkYdP91gt38JYbe5Cj2MPLUIDqk1q94vRNOxcYsrvnVlQ==
X-Received: by 2002:a4a:300d:0:b0:56c:812a:924c with SMTP id q13-20020a4a300d000000b0056c812a924cmr2008005oof.1.1691162298076;
        Fri, 04 Aug 2023 08:18:18 -0700 (PDT)
Received: from [192.168.68.108] ([177.197.108.190])
        by smtp.gmail.com with ESMTPSA id c24-20020a4a2858000000b0054fcc25de1fsm1113423oof.2.2023.08.04.08.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 08:18:17 -0700 (PDT)
Message-ID: <aa71b2b2-1265-acc6-ab51-848c5b495f62@ventanamicro.com>
Date: Fri, 4 Aug 2023 12:17:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] RISC-V: KVM: Improve vector save/restore functions
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>, kvm-riscv@lists.infradead.org
Cc: anup@brainfault.org, atishp@atishpatra.org,
 linux-riscv@lists.infradead.org
References: <20230804135617.46188-2-ajones@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230804135617.46188-2-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_081822_181722_CF724FFF 
X-CRM114-Status: GOOD (  22.23  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 8/4/23 10:56, Andrew Jones wrote:
> Make two nonfunctional changes to the vector get/set vector reg
> functions and their supporting function for simplification and
> readability. The first is to not pass KVM_REG_RISCV_VECTOR, but
> rather integrate it directly into the masking. The second is to
> rename reg_val to reg_addr where and address is used instead of
> a value.
> 
> Also opportunistically touch up some of the code formatting for
> a third nonfunctional change.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

> 
> This is based on "[PATCH v4 00/10] RISC-V: KVM: change get_reg/set_reg
> error code"[1]
> [1] https://lore.kernel.org/all/20230803163302.445167-1-dbarboza@ventanamicro.com/
> 
>   arch/riscv/include/asm/kvm_vcpu_vector.h |  6 ++--
>   arch/riscv/kvm/vcpu_onereg.c             |  6 ++--
>   arch/riscv/kvm/vcpu_vector.c             | 46 ++++++++++--------------
>   3 files changed, 23 insertions(+), 35 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
> index ff994fdd6d0d..27f5bccdd8b0 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_vector.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
> @@ -74,9 +74,7 @@ static inline void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
>   #endif
>   
>   int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
> -				  const struct kvm_one_reg *reg,
> -				  unsigned long rtype);
> +				  const struct kvm_one_reg *reg);
>   int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
> -				  const struct kvm_one_reg *reg,
> -				  unsigned long rtype);
> +				  const struct kvm_one_reg *reg);
>   #endif
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 989ea32dbcbe..9fee1c176fbb 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -645,8 +645,7 @@ int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
>   	case KVM_REG_RISCV_SBI_EXT:
>   		return kvm_riscv_vcpu_set_reg_sbi_ext(vcpu, reg);
>   	case KVM_REG_RISCV_VECTOR:
> -		return kvm_riscv_vcpu_set_reg_vector(vcpu, reg,
> -						 KVM_REG_RISCV_VECTOR);
> +		return kvm_riscv_vcpu_set_reg_vector(vcpu, reg);
>   	default:
>   		break;
>   	}
> @@ -677,8 +676,7 @@ int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
>   	case KVM_REG_RISCV_SBI_EXT:
>   		return kvm_riscv_vcpu_get_reg_sbi_ext(vcpu, reg);
>   	case KVM_REG_RISCV_VECTOR:
> -		return kvm_riscv_vcpu_get_reg_vector(vcpu, reg,
> -						 KVM_REG_RISCV_VECTOR);
> +		return kvm_riscv_vcpu_get_reg_vector(vcpu, reg);
>   	default:
>   		break;
>   	}
> diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
> index 39c5bceb4d1b..b430cbb69521 100644
> --- a/arch/riscv/kvm/vcpu_vector.c
> +++ b/arch/riscv/kvm/vcpu_vector.c
> @@ -92,9 +92,9 @@ void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
>   #endif
>   
>   static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
> -				      unsigned long reg_num,
> -				      size_t reg_size,
> -				      void **reg_val)
> +				    unsigned long reg_num,
> +				    size_t reg_size,
> +				    void **reg_addr)
>   {
>   	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
>   	size_t vlenb = riscv_v_vsize / 32;
> @@ -104,16 +104,16 @@ static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
>   			return -EINVAL;
>   		switch (reg_num) {
>   		case KVM_REG_RISCV_VECTOR_CSR_REG(vstart):
> -			*reg_val = &cntx->vector.vstart;
> +			*reg_addr = &cntx->vector.vstart;
>   			break;
>   		case KVM_REG_RISCV_VECTOR_CSR_REG(vl):
> -			*reg_val = &cntx->vector.vl;
> +			*reg_addr = &cntx->vector.vl;
>   			break;
>   		case KVM_REG_RISCV_VECTOR_CSR_REG(vtype):
> -			*reg_val = &cntx->vector.vtype;
> +			*reg_addr = &cntx->vector.vtype;
>   			break;
>   		case KVM_REG_RISCV_VECTOR_CSR_REG(vcsr):
> -			*reg_val = &cntx->vector.vcsr;
> +			*reg_addr = &cntx->vector.vcsr;
>   			break;
>   		case KVM_REG_RISCV_VECTOR_CSR_REG(datap):
>   		default:
> @@ -122,8 +122,8 @@ static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
>   	} else if (reg_num <= KVM_REG_RISCV_VECTOR_REG(31)) {
>   		if (reg_size != vlenb)
>   			return -EINVAL;
> -		*reg_val = cntx->vector.datap
> -			  + (reg_num - KVM_REG_RISCV_VECTOR_REG(0)) * vlenb;
> +		*reg_addr = cntx->vector.datap +
> +			    (reg_num - KVM_REG_RISCV_VECTOR_REG(0)) * vlenb;
>   	} else {
>   		return -ENOENT;
>   	}
> @@ -132,60 +132,52 @@ static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
>   }
>   
>   int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
> -				  const struct kvm_one_reg *reg,
> -				  unsigned long rtype)
> +				  const struct kvm_one_reg *reg)
>   {
>   	unsigned long *isa = vcpu->arch.isa;
>   	unsigned long __user *uaddr =
>   			(unsigned long __user *)(unsigned long)reg->addr;
>   	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
>   					    KVM_REG_SIZE_MASK |
> -					    rtype);
> +					    KVM_REG_RISCV_VECTOR);
>   	size_t reg_size = KVM_REG_SIZE(reg->id);
> -	void *reg_val;
> +	void *reg_addr;
>   	int rc;
>   
> -	if (rtype != KVM_REG_RISCV_VECTOR)
> -		return -EINVAL;
> -
>   	if (!riscv_isa_extension_available(isa, v))
>   		return -ENOENT;
>   
> -	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_val);
> +	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_addr);
>   	if (rc)
>   		return rc;
>   
> -	if (copy_to_user(uaddr, reg_val, reg_size))
> +	if (copy_to_user(uaddr, reg_addr, reg_size))
>   		return -EFAULT;
>   
>   	return 0;
>   }
>   
>   int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
> -				  const struct kvm_one_reg *reg,
> -				  unsigned long rtype)
> +				  const struct kvm_one_reg *reg)
>   {
>   	unsigned long *isa = vcpu->arch.isa;
>   	unsigned long __user *uaddr =
>   			(unsigned long __user *)(unsigned long)reg->addr;
>   	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
>   					    KVM_REG_SIZE_MASK |
> -					    rtype);
> +					    KVM_REG_RISCV_VECTOR);
>   	size_t reg_size = KVM_REG_SIZE(reg->id);
> -	void *reg_val;
> +	void *reg_addr;
>   	int rc;
>   
> -	if (rtype != KVM_REG_RISCV_VECTOR)
> -		return -EINVAL;
> -
>   	if (!riscv_isa_extension_available(isa, v))
>   		return -ENOENT;
>   
> -	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_val);
> +	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_addr);
>   	if (rc)
>   		return rc;
>   
> -	if (copy_from_user(reg_val, uaddr, reg_size))
> +	if (copy_from_user(reg_addr, uaddr, reg_size))
>   		return -EFAULT;
>   
>   	return 0;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
