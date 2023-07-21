Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A56EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 09:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TOoc9I4zHMlA/X1BK9TVdoJ56SbEfKnOm0Kumk7OLXM=; b=1FCtqa7FO0u6EM
	iQtAUDAT1vr5U/xZo04wb3lhcYulqGxb/2O/5ERZ45SK4SDWgY++LbRHqkOqoGN7yLBUqgv/0fhE7
	wgeQiCbe+SJhb4LAAO34T4IhEnBbO1fAk5x9Lo+H6E3iDiHTlhWdacxnOA975NnvhOWkydtORyDmS
	GhzbpIt7qWfbXd57KIfsK300MiL1eqiQGcG2LpJ7cKbDzrYtw1FSxxZUaUjXXe9yjufZN6hrWrEOp
	JpY6Uv3f5224h4N2Be72j+lROU6vGa2Ny6Dk2hLXfS9x5aRn5HUd4UOf3TefopGzi3jnnhuV1uGi3
	ufwPw0+jo8cxV6x0rHKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMmCL-00DUzq-17;
	Fri, 21 Jul 2023 09:13:17 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMmCJ-00DUy7-0M
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 09:13:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbab0d0b88so17499405e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 02:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689930791; x=1690535591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hwldx6yYXPiZYUG02y80I6KRctMzMLL7fLh9hWSyBrY=;
        b=Nlwu2qOJikcOUBLSPtmzZVH9lj4bbd+y3nkyTk6/e+ERSLabtCciMe6k1R5K8j/ffy
         1HkmkYufAUbhesjAMkoCevNb73juJ1PYyd16D64V9OdmquBVo9cxgRsG3/0WplVSPshb
         OJ6xm92QU6JFy3pNklX4/4J7nTLpDr+GfO+N8cWKvtt81wEwRxksTjIzghBw8+l1BeFw
         vXSBBBDSwSMOKehpiiPiIPQ2pbCaTA1Dfw25YrXAnAUBiv1SjGXGVErkec3wbo2nl/lw
         dkQUXvTjLuzX767cGZZ8gkBv0D5M8+06ngxwLX+Ah5FSYILG57JkINdIoI5u3/nbl0gE
         1/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689930791; x=1690535591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hwldx6yYXPiZYUG02y80I6KRctMzMLL7fLh9hWSyBrY=;
        b=MA1wmhT0nkneqhn+j4iL3nxdlQCpzjyIuAXkWQcVSNc+PptLU+JGYm32lCKLzLaF34
         yD3TsCkntCchhlSKBeH0YJk9wV7ZD4V0hdTPk5Qkxdw1IzjM1Hzh1QLmFRmDbYnjdOHr
         cx+0bbhI9sAcNtX3XN1TI4BTyKvyMP7EzUohZJK1qPjp44HarxjX6CoY0WxtWvwRQzUE
         MPNQtQ3x5ytXJy2IL89FpCrfov0TOk/BOWtTLMnKwCSck0fzR/cs6W2qsT2CsP6gWJmo
         KPk5TbyrGUKR2BDj/rMoryY4Ja1yMY6Iuy8ML9i9aWLjtYIVXriLiAOuoe0wGXlPKr/T
         Augg==
X-Gm-Message-State: ABy/qLaTrB0pgMCKzOq7fdOQ3jhpBCl1eakzVDyg2jfIer9931b/PqkB
	lVMoCP6zrf2oFnpy6d72nB1qfg==
X-Google-Smtp-Source: APBJJlGE3VHvqX9OCQ61LwKQ49yhHkIZNUSwrrYytYyL4BRBY+I7HezxBS23v4C63sVUXPW1sjT83Q==
X-Received: by 2002:a05:6000:4cd:b0:316:fc03:3c66 with SMTP id h13-20020a05600004cd00b00316fc033c66mr1256900wri.3.1689930791010;
        Fri, 21 Jul 2023 02:13:11 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id o20-20020a5d58d4000000b0031433443265sm3618211wrf.53.2023.07.21.02.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 02:13:10 -0700 (PDT)
Date: Fri, 21 Jul 2023 11:13:09 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 6/6] RISCV: KVM: Add sstateen0 to ONE_REG
Message-ID: <20230721-9b2298b97fbc5223d1487202@orel>
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
 <20230721075439.454473-7-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230721075439.454473-7-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_021315_146250_20C975F5 
X-CRM114-Status: GOOD (  21.05  )
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

On Fri, Jul 21, 2023 at 01:24:39PM +0530, Mayuresh Chitale wrote:
> Add support for sstateen0 CSR to the ONE_REG interface to allow its
> access from user space.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h |  9 +++++++
>  arch/riscv/kvm/vcpu.c             | 40 +++++++++++++++++++++++++++++++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 74c7f42de29d..bdddfb20299a 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -93,6 +93,11 @@ struct kvm_riscv_aia_csr {
>  	unsigned long iprio2h;
>  };
>  
> +/* Smstateen CSR for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> +struct kvm_riscv_smstateen_csr {
> +	unsigned long sstateen0;
> +};
> +
>  /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
>  struct kvm_riscv_timer {
>  	__u64 frequency;
> @@ -173,10 +178,14 @@ enum KVM_RISCV_SBI_EXT_ID {
>  #define KVM_REG_RISCV_CSR		(0x03 << KVM_REG_RISCV_TYPE_SHIFT)
>  #define KVM_REG_RISCV_CSR_GENERAL	(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
>  #define KVM_REG_RISCV_CSR_AIA		(0x1 << KVM_REG_RISCV_SUBTYPE_SHIFT)
> +#define KVM_REG_RISCV_CSR_SMSTATEEN	(0x2 << KVM_REG_RISCV_SUBTYPE_SHIFT)
> +
>  #define KVM_REG_RISCV_CSR_REG(name)	\
>  		(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
>  #define KVM_REG_RISCV_CSR_AIA_REG(name)	\
>  	(offsetof(struct kvm_riscv_aia_csr, name) / sizeof(unsigned long))
> +#define KVM_REG_RISCV_CSR_SMSTATEEN_REG(name)	\
> +	(offsetof(struct kvm_riscv_smstateen_csr, name) / sizeof(unsigned long))
>  
>  /* Timer registers are mapped as type 4 */
>  #define KVM_REG_RISCV_TIMER		(0x04 << KVM_REG_RISCV_TYPE_SHIFT)
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index ae750decbefe..af7549374c4b 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -507,6 +507,34 @@ static int kvm_riscv_vcpu_general_get_csr(struct kvm_vcpu *vcpu,
>  	return 0;
>  }
>  
> +static inline int kvm_riscv_vcpu_smstateen_set_csr(struct kvm_vcpu *vcpu,
> +						   unsigned long reg_num,
> +						   unsigned long reg_val)
> +{
> +	struct kvm_vcpu_smstateen_csr *csr = &vcpu->arch.smstateen_csr;
> +
> +	if (reg_num >= sizeof(struct kvm_riscv_smstateen_csr) /
> +	    sizeof(unsigned long))
> +		return -EINVAL;
> +
> +	((unsigned long *)csr)[reg_num] = reg_val;
> +	return 0;
> +}
> +
> +static int kvm_riscv_vcpu_smstateen_get_csr(struct kvm_vcpu *vcpu,
> +					    unsigned long reg_num,
> +					    unsigned long *out_val)
> +{
> +	struct kvm_vcpu_smstateen_csr *csr = &vcpu->arch.smstateen_csr;
> +
> +	if (reg_num >= sizeof(struct kvm_riscv_smstateen_csr) /
> +	    sizeof(unsigned long))
> +		return -EINVAL;
> +
> +	*out_val = ((unsigned long *)csr)[reg_num];
> +	return 0;
> +}
> +
>  static inline int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
>  						 unsigned long reg_num,
>  						 unsigned long reg_val)
> @@ -552,6 +580,12 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
>  	case KVM_REG_RISCV_CSR_AIA:
>  		rc = kvm_riscv_vcpu_aia_get_csr(vcpu, reg_num, &reg_val);
>  		break;
> +	case KVM_REG_RISCV_CSR_SMSTATEEN:
> +		rc = -EINVAL;
> +		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
> +			rc = kvm_riscv_vcpu_smstateen_get_csr(vcpu, reg_num,
> +							      &reg_val);
> +		break;
>  	default:
>  		rc = -EINVAL;
>  		break;
> @@ -591,6 +625,12 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
>  	case KVM_REG_RISCV_CSR_AIA:
>  		rc = kvm_riscv_vcpu_aia_set_csr(vcpu, reg_num, reg_val);
>  		break;
> +	case KVM_REG_RISCV_CSR_SMSTATEEN:
> +		rc = -EINVAL;
> +		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
> +			rc = kvm_riscv_vcpu_smstateen_set_csr(vcpu, reg_num,
> +							      reg_val);
> +		break;
>  	default:
>  		rc = -EINVAL;
>  		break;
> -- 
> 2.34.1
>

The EINVAL's will get changed to ENOENT's with the get/set-one-reg error
code rework that's coming after get-reg-list lands, but for now I guess
it makes sense to leave them consistent with the others.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
