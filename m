Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A7FEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 17:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zo07j+yx/KnhzUY7f4Zz8ne9HF3lSXJS2xR2De6229E=; b=W4G4/erYd+OCjx
	hoKFL0JhD7a+Hi/w9CUHCszwPWu6EXnKTOKmRFKO8zlfK4uwtejykcrISdLNdrVa1Lb5kNAXtcsXR
	fJPfI5qbhAqu5NyQzrCIu8EvmzO9DoY7WxHJbI8iRJQPQ8qAQ5eNz3reYGkm+Rl6hzzGUpLJT9b2D
	hvzgG+8clD0QDfRvhgujn7zqOYfnGx4tjTW8Z9NEpnE/NpI8PmzyEyrMiaTvH5bYYNmvlXhyyUGqd
	39dmUr9py0b14nd8TEmkfhRj8b6e1hZRdPQDUq0eJLliZIaxfdol6o32I0KWNgod+qEL1p1iMFXgk
	CbYib6b0qz6lP8ovFtPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbvv-00AQLL-0v;
	Thu, 03 Aug 2023 17:16:19 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbvs-00AQJk-0c
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 17:16:17 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99c4923195dso166963566b.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 10:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691082971; x=1691687771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7IoQdLbhMo2crjuIaYzn7Fz25WZvYm//2mDLSxRNcxY=;
        b=ULM2/1zpfCBBd13bwqhau0rv8Xp8YDcKnXQ7LU8BxYkzbyZBcFW/WrScrGqJ6X6Ywg
         gytz3x4qiex01LJP5N1zwrgzcVuK6nIeG3+7L55RTG4x0mleGTmviPMWo6GwQJGYDIGI
         1gnbec9BkNylo9q09xCW6uiJ8IzKkVWFKOaF/FQxnIUAmKvNXv+LBU/i0B865oC+wann
         2obzHqI6fJKkfpbzTFAmCW73K4432rV2UEZhfyzXjz9phIpcfELAgFD0+CfOzF9g9L2q
         8rFvQWZAtpGNY2CiqhLHVWFtQNwY79ud4ZXPWdDXadrVOQQFdJ8OsVcr/FmfUeDr9JIn
         emIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691082971; x=1691687771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IoQdLbhMo2crjuIaYzn7Fz25WZvYm//2mDLSxRNcxY=;
        b=ZaZ5sBi9lJ0Xkk0A6S+ED9YDGKCBNIdwn+5edwIjxu9L0vwmrDI+CKmFKM2KBKnkTn
         TzX21RIXD5kGePMVGt8RzB7Bx7fpLJ8fauH0Zdl0ZZSrqnr2Fe4AfTX2iTefMpfbaPIk
         v2eVEnbJGZMANZS8TCnsyqn8KVsBnUzOhzc+PEA45CKeGklPJnZg6JkPC7zRZvKMwjUU
         rBRPjRfSoA/iOCcPEtRZQ07qUzm0fASPkc6UJcRhVqpsCYTgrsvyGKSan5Yi0vDz9aJ/
         uVYNFjRxsuaD1nw9/KA1GO3EcTIFuagsPE5/LmMKTcUjE0J4aUWxzM8n6Q2K0yEvLtTl
         xjig==
X-Gm-Message-State: ABy/qLZU8EWY19p6rikChXmYqop43dEE7hGA4eEkTrzoup57fW1LWoUc
	NFq6q0Qb+G33wTNuKzcJ4Y5AGQ==
X-Google-Smtp-Source: APBJJlF1iMBtEif2OkHJxqnGlMmRhixWgyDu3c0ZLaoR1F4qAcg8eZfOeMfmGSRPJ86y0n3Q9OAWrw==
X-Received: by 2002:a17:906:7495:b0:965:6075:d100 with SMTP id e21-20020a170906749500b009656075d100mr7538879ejl.39.1691082971370;
        Thu, 03 Aug 2023 10:16:11 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
        by smtp.gmail.com with ESMTPSA id l22-20020a170906079600b009934b1eb577sm90895ejc.77.2023.08.03.10.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 10:16:10 -0700 (PDT)
Date: Thu, 3 Aug 2023 20:16:09 +0300
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, anup@brainfault.org, atishp@atishpatra.org
Subject: Re: [PATCH v4 09/10] RISC-V: KVM: Improve vector save/restore errors
Message-ID: <20230803-dc37f7c439265c26f2a9dd01@orel>
References: <20230803163302.445167-1-dbarboza@ventanamicro.com>
 <20230803163302.445167-10-dbarboza@ventanamicro.com>
 <20230803-b656c44ee07d661600b8696a@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803-b656c44ee07d661600b8696a@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_101616_231069_3D117CE1 
X-CRM114-Status: GOOD (  23.03  )
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

On Thu, Aug 03, 2023 at 08:05:47PM +0300, Andrew Jones wrote:
> On Thu, Aug 03, 2023 at 01:33:01PM -0300, Daniel Henrique Barboza wrote:
> > From: Andrew Jones <ajones@ventanamicro.com>
> > 
> > kvm_riscv_vcpu_(get/set)_reg_vector() now returns ENOENT if V is not
> > available, EINVAL if reg type is not of VECTOR type, and any error that
> > might be thrown by kvm_riscv_vcpu_vreg_addr().
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kvm/vcpu_vector.c | 60 ++++++++++++++++++++----------------
> >  1 file changed, 33 insertions(+), 27 deletions(-)
> > 
> > diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
> > index edd2eecbddc2..39c5bceb4d1b 100644
> > --- a/arch/riscv/kvm/vcpu_vector.c
> > +++ b/arch/riscv/kvm/vcpu_vector.c
> > @@ -91,44 +91,44 @@ void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
> >  }
> >  #endif
> >  
> > -static void *kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
> > +static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
> >  				      unsigned long reg_num,
> > -				      size_t reg_size)
> > +				      size_t reg_size,
> > +				      void **reg_val)
> >  {
> >  	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
> > -	void *reg_val;
> >  	size_t vlenb = riscv_v_vsize / 32;
> >  
> >  	if (reg_num < KVM_REG_RISCV_VECTOR_REG(0)) {
> >  		if (reg_size != sizeof(unsigned long))
> > -			return NULL;
> > +			return -EINVAL;
> >  		switch (reg_num) {
> >  		case KVM_REG_RISCV_VECTOR_CSR_REG(vstart):
> > -			reg_val = &cntx->vector.vstart;
> > +			*reg_val = &cntx->vector.vstart;
> >  			break;
> >  		case KVM_REG_RISCV_VECTOR_CSR_REG(vl):
> > -			reg_val = &cntx->vector.vl;
> > +			*reg_val = &cntx->vector.vl;
> >  			break;
> >  		case KVM_REG_RISCV_VECTOR_CSR_REG(vtype):
> > -			reg_val = &cntx->vector.vtype;
> > +			*reg_val = &cntx->vector.vtype;
> >  			break;
> >  		case KVM_REG_RISCV_VECTOR_CSR_REG(vcsr):
> > -			reg_val = &cntx->vector.vcsr;
> > +			*reg_val = &cntx->vector.vcsr;
> >  			break;
> >  		case KVM_REG_RISCV_VECTOR_CSR_REG(datap):
> >  		default:
> > -			return NULL;
> > +			return -ENOENT;
> >  		}
> >  	} else if (reg_num <= KVM_REG_RISCV_VECTOR_REG(31)) {
> >  		if (reg_size != vlenb)
> > -			return NULL;
> > -		reg_val = cntx->vector.datap
> > +			return -EINVAL;
> > +		*reg_val = cntx->vector.datap
> >  			  + (reg_num - KVM_REG_RISCV_VECTOR_REG(0)) * vlenb;
> >  	} else {
> > -		return NULL;
> > +		return -ENOENT;
> >  	}
> >  
> > -	return reg_val;
> > +	return 0;
> >  }
> >  
> >  int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
> > @@ -141,17 +141,20 @@ int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
> >  	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
> >  					    KVM_REG_SIZE_MASK |
> >  					    rtype);
> > -	void *reg_val = NULL;
> >  	size_t reg_size = KVM_REG_SIZE(reg->id);
> > +	void *reg_val;
> > +	int rc;
> >  
> > -	if (rtype == KVM_REG_RISCV_VECTOR &&
> > -	    riscv_isa_extension_available(isa, v)) {
> > -		reg_val = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size);
> > -	}
> > -
> > -	if (!reg_val)
> > +	if (rtype != KVM_REG_RISCV_VECTOR)
> >  		return -EINVAL;
> >  
> > +	if (!riscv_isa_extension_available(isa, v))
> > +		return -ENOENT;
> > +
> > +	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_val);
> > +	if (rc)
> > +		return rc;
> > +
> >  	if (copy_to_user(uaddr, reg_val, reg_size))
> >  		return -EFAULT;
> >  
> > @@ -168,17 +171,20 @@ int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
> >  	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
> >  					    KVM_REG_SIZE_MASK |
> >  					    rtype);
> > -	void *reg_val = NULL;
> >  	size_t reg_size = KVM_REG_SIZE(reg->id);
> > +	void *reg_val;
> > +	int rc;
> >  
> > -	if (rtype == KVM_REG_RISCV_VECTOR &&
> > -	    riscv_isa_extension_available(isa, v)) {
> > -		reg_val = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size);
> > -	}
> > -
> > -	if (!reg_val)
> > +	if (rtype != KVM_REG_RISCV_VECTOR)
> >  		return -EINVAL;
> >  
> > +	if (!riscv_isa_extension_available(isa, v))
> > +		return -ENOENT;
> > +
> > +	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_val);
> > +	if (rc)
> > +		return rc;
> > +
> >  	if (copy_from_user(reg_val, uaddr, reg_size))
> >  		return -EFAULT;
> 
> Ugh, this is totally wrong. We no longer set the register. I need to
> rework this rework...

Oh, never mind. Skimming over (my own patch) I forgot we were fetching the
address not the value. I should have renamed 'reg_val' to 'reg_addr'.
There's another change that can be made, which is to drop rtype and its
check from these functions and just use KVM_REG_RISCV_VECTOR directly in
the mask. I'll send a cleanup patch with that and the rename, but that's
separate from this series.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
