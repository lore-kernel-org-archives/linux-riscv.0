Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14C4C001DB
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 17:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPV759V1TCTkYEVwTs60iKgdvw3bEWR2ftJR1rINOXU=; b=Ym4zxQSQUgfOye
	RwVynsMOeB6qAwnKbdytO4ErdBFQAV0LcQCtkzeU7Ln4GaH6NWF3sd2WXWfCWy+WMd5xAn4OGlW58
	ovqwgjGzZkEs6DEtXtmIKdzb/2qyE2Q4bGG8/HGzRWNnqtb1DCn/3ZVpucAJn2XH5Mmk2K7533UYD
	jhqmGd6YGTIcHNMA4OHwDTpEvZDVOSriSIrmFiy/qHoeD8RNKoNsyDQzGZZOy32+1JeWbBzxFxf7i
	NvVjnm3O4nguYh5GF+g0s23ezu5Pa/2BQjfuxGzT9noTA/o9s4sCmzQ7LafJ/W6EuUoWudpGM0kfj
	ssJmYL3BHvEjdZwKqskw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRblq-00AP9b-2w;
	Thu, 03 Aug 2023 17:05:54 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbln-00AP8k-31
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 17:05:53 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99357737980so166306866b.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 10:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691082349; x=1691687149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gCXp7bnCQeJHembOcEQXDYLfhb8aJsvFXnOpWD7E2ZA=;
        b=nkbuVCky5eIYut5xJfnpTwEyqc7rBKJjKYsn6N3/A4qUDKOJ9tlAot8cNOq/SqrbOE
         bQ8cWWtVX56qnPCTpkOmEN58TXAcfFPqvLA6MDO4Kz9L5985cKntVWU4sTsaD3nB5d36
         aNkzGLVPOz8g0uVIRmfajzjCZZxv8uGw98ALm/GwDAkBVL9xkGKrYN0XLzcQm51xoCJY
         Vr0HvJu5qtSYxM02ER/JrWhjjf00aXiPPNsXpJHScL77h/eFgt/0O/3/prc3JwcOhUEx
         ieEsQx33jq0VSNoyRfC0uSBQw+qFbdZsFJcajFJRym4gM743qnBfuTO4PaULUeDTos4j
         dFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691082349; x=1691687149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCXp7bnCQeJHembOcEQXDYLfhb8aJsvFXnOpWD7E2ZA=;
        b=KEQppSy5EUTuSm36xvNiz+B01w11RdpSCc6dCgNG5q18ZGZqbn7OH5gPwXLXActqm4
         1wIXZIElozRpGGWm9kyRbWo2CPeGgX4I+L1eu982xJSgJn6EbNLh0THvl56vqXGSLK0m
         yBwSS9F55PIiaPzVMX0RW7zf1SdYkIMhEpKIoY0dfEOrSrHgmjMee0f5cBl3f3xw26ab
         8tjSOYZbOGRKoU4sOZhGCGLVK+g7d9oFQbU6yUtybRRN1pXpLdsDEfvVmJ+tS4IYHd6K
         b0mUVSRb83bQlfbP63KMr/hOyt7CXVh8lCBkW6e8+cbmq4H7ZZLxV5f3NOV99NfQ+IVM
         BUTw==
X-Gm-Message-State: ABy/qLbiur/4eryYZ/el/V1x4Mrd/eSubKIyzUz72tvQN7urxd4cSTs4
	vM4hHa19/BWgFsd/ZIp38N6iOMPx+m0OYAQ5E78bpw==
X-Google-Smtp-Source: APBJJlG+zs5JImt9tHG4hc3+8c7LBgiyeeRh3j9Z3j3hqFOE5to+atpc30mSVh/tLX/dKoTvmROn7Q==
X-Received: by 2002:a17:907:7841:b0:993:22a2:8158 with SMTP id lb1-20020a170907784100b0099322a28158mr8135032ejc.61.1691082348817;
        Thu, 03 Aug 2023 10:05:48 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
        by smtp.gmail.com with ESMTPSA id i14-20020a170906114e00b00992dcae806bsm84195eja.5.2023.08.03.10.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 10:05:48 -0700 (PDT)
Date: Thu, 3 Aug 2023 20:05:47 +0300
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, anup@brainfault.org, atishp@atishpatra.org
Subject: Re: [PATCH v4 09/10] RISC-V: KVM: Improve vector save/restore errors
Message-ID: <20230803-b656c44ee07d661600b8696a@orel>
References: <20230803163302.445167-1-dbarboza@ventanamicro.com>
 <20230803163302.445167-10-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803163302.445167-10-dbarboza@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_100551_977929_E50EA234 
X-CRM114-Status: GOOD (  20.84  )
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

On Thu, Aug 03, 2023 at 01:33:01PM -0300, Daniel Henrique Barboza wrote:
> From: Andrew Jones <ajones@ventanamicro.com>
> 
> kvm_riscv_vcpu_(get/set)_reg_vector() now returns ENOENT if V is not
> available, EINVAL if reg type is not of VECTOR type, and any error that
> might be thrown by kvm_riscv_vcpu_vreg_addr().
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_vector.c | 60 ++++++++++++++++++++----------------
>  1 file changed, 33 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
> index edd2eecbddc2..39c5bceb4d1b 100644
> --- a/arch/riscv/kvm/vcpu_vector.c
> +++ b/arch/riscv/kvm/vcpu_vector.c
> @@ -91,44 +91,44 @@ void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
>  }
>  #endif
>  
> -static void *kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
> +static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
>  				      unsigned long reg_num,
> -				      size_t reg_size)
> +				      size_t reg_size,
> +				      void **reg_val)
>  {
>  	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
> -	void *reg_val;
>  	size_t vlenb = riscv_v_vsize / 32;
>  
>  	if (reg_num < KVM_REG_RISCV_VECTOR_REG(0)) {
>  		if (reg_size != sizeof(unsigned long))
> -			return NULL;
> +			return -EINVAL;
>  		switch (reg_num) {
>  		case KVM_REG_RISCV_VECTOR_CSR_REG(vstart):
> -			reg_val = &cntx->vector.vstart;
> +			*reg_val = &cntx->vector.vstart;
>  			break;
>  		case KVM_REG_RISCV_VECTOR_CSR_REG(vl):
> -			reg_val = &cntx->vector.vl;
> +			*reg_val = &cntx->vector.vl;
>  			break;
>  		case KVM_REG_RISCV_VECTOR_CSR_REG(vtype):
> -			reg_val = &cntx->vector.vtype;
> +			*reg_val = &cntx->vector.vtype;
>  			break;
>  		case KVM_REG_RISCV_VECTOR_CSR_REG(vcsr):
> -			reg_val = &cntx->vector.vcsr;
> +			*reg_val = &cntx->vector.vcsr;
>  			break;
>  		case KVM_REG_RISCV_VECTOR_CSR_REG(datap):
>  		default:
> -			return NULL;
> +			return -ENOENT;
>  		}
>  	} else if (reg_num <= KVM_REG_RISCV_VECTOR_REG(31)) {
>  		if (reg_size != vlenb)
> -			return NULL;
> -		reg_val = cntx->vector.datap
> +			return -EINVAL;
> +		*reg_val = cntx->vector.datap
>  			  + (reg_num - KVM_REG_RISCV_VECTOR_REG(0)) * vlenb;
>  	} else {
> -		return NULL;
> +		return -ENOENT;
>  	}
>  
> -	return reg_val;
> +	return 0;
>  }
>  
>  int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
> @@ -141,17 +141,20 @@ int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
>  	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
>  					    KVM_REG_SIZE_MASK |
>  					    rtype);
> -	void *reg_val = NULL;
>  	size_t reg_size = KVM_REG_SIZE(reg->id);
> +	void *reg_val;
> +	int rc;
>  
> -	if (rtype == KVM_REG_RISCV_VECTOR &&
> -	    riscv_isa_extension_available(isa, v)) {
> -		reg_val = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size);
> -	}
> -
> -	if (!reg_val)
> +	if (rtype != KVM_REG_RISCV_VECTOR)
>  		return -EINVAL;
>  
> +	if (!riscv_isa_extension_available(isa, v))
> +		return -ENOENT;
> +
> +	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_val);
> +	if (rc)
> +		return rc;
> +
>  	if (copy_to_user(uaddr, reg_val, reg_size))
>  		return -EFAULT;
>  
> @@ -168,17 +171,20 @@ int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
>  	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
>  					    KVM_REG_SIZE_MASK |
>  					    rtype);
> -	void *reg_val = NULL;
>  	size_t reg_size = KVM_REG_SIZE(reg->id);
> +	void *reg_val;
> +	int rc;
>  
> -	if (rtype == KVM_REG_RISCV_VECTOR &&
> -	    riscv_isa_extension_available(isa, v)) {
> -		reg_val = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size);
> -	}
> -
> -	if (!reg_val)
> +	if (rtype != KVM_REG_RISCV_VECTOR)
>  		return -EINVAL;
>  
> +	if (!riscv_isa_extension_available(isa, v))
> +		return -ENOENT;
> +
> +	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_val);
> +	if (rc)
> +		return rc;
> +
>  	if (copy_from_user(reg_val, uaddr, reg_size))
>  		return -EFAULT;

Ugh, this is totally wrong. We no longer set the register. I need to
rework this rework...


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
