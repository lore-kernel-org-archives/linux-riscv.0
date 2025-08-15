Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B26BCA0EE4
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 21:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHiLL39rNwrM5fD8eU/DgXpqbjABB5twOisPG8N9at8=; b=PjZhzhFeH0yCGI
	8w68uQnOgai94ZWkEQ07WzgdxO2UbdwrXR2Fm/lalrD96XjDeYBwljwuZDhRfK8lJwjmehIViw0oA
	FFXPSSbVBAMmMgoD+pKmB0iUXWUuSto335INWnancBju0rJUk0dIsuqLN9hkBsWJecnBBG+bKDQ7y
	6EjuHLPMMHEFCT3US6bZT3xCOuU7Io7S0nBYeMoNh+DAgPb5qbp6lrFjtC663IbCI7A8CXdAhFFdD
	rGkJQJO1Rb75HBmrg1klsBF94V9J7hmR1L0Z+LwyAZgI8IoSiKffUkE5EVBbkoMgAAdK6KFiO1/9w
	gCK0X4SXiFudjF//iPfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un1ap-00000003W1V-3ibG;
	Fri, 15 Aug 2025 21:04:07 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un1am-00000003W0g-1ASn
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 21:04:05 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3e57008acd8so20569395ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Aug 2025 14:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755291843; x=1755896643; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ft04JZ672lT2q0D5QFWz6789EtIMwIQ1qPNZYM3WBFM=;
        b=K7e72X4wqcySqYEIFdBzOkNEZAEHqbw50Oc/I4NF2vaB7QIntjj9wZOI7LqE8AMY7Q
         9g1ZR3ojLGJq3B6qssHQn4YbeXhHUvABXgGD7s3HoEPcBcLs6NS5Q+Y+0V/8HBfME3ep
         KpMubpxliuwjpkzkwKEC9hjhOO63rbQT1AcY5Hs2BgltAZYjMupPJEA+iTATDL85Pczp
         ptlbEe4+m26KZ2gJX86IzW5+tFZJAkMwf5WeTleQouyvXpiIPSKcWGNAR9QQvLDKCfAx
         2eLL/47jU5GOHffQHuPGo3kmVUtswlbOm4Y0qXd5BonOmwX4Y/5QLCkLRmmAte63AHMx
         uFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755291843; x=1755896643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ft04JZ672lT2q0D5QFWz6789EtIMwIQ1qPNZYM3WBFM=;
        b=ZD1tao6A9mAQu6xD0BzR/UjFVDJLKNfsf8qK2IetgKduP0bp6UpzYFe4LTZ0OPD0ql
         TjFoIFpIXy4dJgui6ugzTe2DeBg98T7A4eqobPPqC6nVHSqUH6A0iOaNDrfXyqadB0Ui
         fMIniKqKy9BjDMJqRxMQz7d7I8Sj9OY3MrBry9Q/hzDUPNTfbI4sz/c0w57jIM1B/pLp
         zSsm5f5gnDMrieWEGaQt55pZJZ4J+badV7t26Fdu25cTiPvYq2A9eL8X+Vd53sxFzkt3
         vD8tfZ//92qhFMtzuRwNR4fCv3vOpK71zeeF7bUP86QOCBbm7544UYoxzXJ+oHkt6qYU
         2SJA==
X-Forwarded-Encrypted: i=1; AJvYcCX4MK6LZpqQI8b6/t8Pt6TYslDJhL/7Sg+6RPr6wfc1cAaf1q1skVey5K+ZF+n2ZIM062scjSn1kVcB9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyymnpAyVgmksPSRHUBnARJZn+j8PZGq/rCNPdMgtnnX9j6y4ul
	/zFJu8/8Q5Q2EaY+B+LC5LcOoIMnWVywoFjy3PCkGqBpBlI2qKsJglOx5ABEX8OWkmE=
X-Gm-Gg: ASbGnctXlln0OBJJj976JZ6zecj3jfyXfuv9DTrU7sAXdqV7rt7zz7U+jV1o0vk2XBI
	2NwdEqBXkjV3WMXG3yaAPCt8mnC71QIzIRH+qfjLB8oZjo14Lf08gPsjlWmEVf3SOZTO7W5y5b+
	FrjG1qNtOvspM0gklehrgatx5vb/l2LEa4JsZ08Bh7l7n0KalVc8YttYIKTa84LWMjP/OGITclm
	TVPtG21jh9hKfW+w1QnBr5AJW60B4the/0LN+Tq89JCTJycOI1dmacZmxS+DPaun/ECZUFTvdq+
	PUlKHvHyl3/Uns+8mLuQ37z6JykQJTY0J0OPr6T19GnXYg68V03enQm/yDwc3NdmjvpZUlcIV0F
	SnPiXR8RE1EVZjttCPFz4xjLF
X-Google-Smtp-Source: AGHT+IEZ228tEu96gQYjWXKJgevodnNBi1s4R3eESGEOgX3ctS1gUzzAVoE7y2cbjS0nf97wxrlKjw==
X-Received: by 2002:a05:6e02:2583:b0:3e5:66a8:3ebf with SMTP id e9e14a558f8ab-3e57e825485mr67051065ab.5.1755291843294;
        Fri, 15 Aug 2025 14:04:03 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50c949a0167sm643861173.53.2025.08.15.14.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 14:04:02 -0700 (PDT)
Date: Fri, 15 Aug 2025 16:04:02 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 4/6] RISC-V: KVM: Move copy_sbi_ext_reg_indices() to SBI
 implementation
Message-ID: <20250815-ba0f0a816fc5281383a2b988@orel>
References: <20250814155548.457172-1-apatel@ventanamicro.com>
 <20250814155548.457172-5-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250814155548.457172-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_140404_320191_5C68F2A8 
X-CRM114-Status: GOOD (  21.11  )
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

On Thu, Aug 14, 2025 at 09:25:46PM +0530, Anup Patel wrote:
> The ONE_REG handling of SBI extension enable/disable registers and
> SBI extension state registers is already under SBI implementation.
> On similar lines, let's move copy_sbi_ext_reg_indices() under SBI
> implementation.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  2 +-
>  arch/riscv/kvm/vcpu_onereg.c          | 29 ++-------------------------
>  arch/riscv/kvm/vcpu_sbi.c             | 27 ++++++++++++++++++++++++-
>  3 files changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index 144c3f6d5eb9..212c31629bc8 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -78,6 +78,7 @@ void kvm_riscv_vcpu_sbi_request_reset(struct kvm_vcpu *vcpu,
>  				      unsigned long pc, unsigned long a1);
>  void kvm_riscv_vcpu_sbi_load_reset_state(struct kvm_vcpu *vcpu);
>  int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
> +int kvm_riscv_vcpu_reg_indices_sbi_ext(struct kvm_vcpu *vcpu, u64 __user *uindices);
>  int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
>  				   const struct kvm_one_reg *reg);
>  int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
> @@ -87,7 +88,6 @@ int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu, const struct kvm_one_reg *
>  int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg);
>  const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
>  				struct kvm_vcpu *vcpu, unsigned long extid);
> -bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
>  int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
>  void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
>  void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 5843b0519224..0894ab517525 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -1060,34 +1060,9 @@ static inline unsigned long num_isa_ext_regs(const struct kvm_vcpu *vcpu)
>  	return copy_isa_ext_reg_indices(vcpu, NULL);
>  }
>  
> -static int copy_sbi_ext_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
> -{
> -	unsigned int n = 0;
> -
> -	for (int i = 0; i < KVM_RISCV_SBI_EXT_MAX; i++) {
> -		u64 size = IS_ENABLED(CONFIG_32BIT) ?
> -			   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
> -		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_SBI_EXT |
> -			  KVM_REG_RISCV_SBI_SINGLE | i;
> -
> -		if (!riscv_vcpu_supports_sbi_ext(vcpu, i))
> -			continue;
> -
> -		if (uindices) {
> -			if (put_user(reg, uindices))
> -				return -EFAULT;
> -			uindices++;
> -		}
> -
> -		n++;
> -	}
> -
> -	return n;
> -}
> -
>  static unsigned long num_sbi_ext_regs(struct kvm_vcpu *vcpu)
>  {
> -	return copy_sbi_ext_reg_indices(vcpu, NULL);
> +	return kvm_riscv_vcpu_reg_indices_sbi_ext(vcpu, NULL);
>  }
>  
>  static inline unsigned long num_sbi_regs(struct kvm_vcpu *vcpu)
> @@ -1215,7 +1190,7 @@ int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
>  		return ret;
>  	uindices += ret;
>  
> -	ret = copy_sbi_ext_reg_indices(vcpu, uindices);
> +	ret = kvm_riscv_vcpu_reg_indices_sbi_ext(vcpu, uindices);
>  	if (ret < 0)
>  		return ret;
>  	uindices += ret;
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 8b3c393e0c83..19e0e3d7b598 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -110,7 +110,7 @@ riscv_vcpu_get_sbi_ext(struct kvm_vcpu *vcpu, unsigned long idx)
>  	return sext;
>  }
>  
> -bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx)
> +static bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx)
>  {
>  	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
>  	const struct kvm_riscv_sbi_extension_entry *sext;
> @@ -288,6 +288,31 @@ static int riscv_vcpu_get_sbi_ext_multi(struct kvm_vcpu *vcpu,
>  	return 0;
>  }
>  
> +int kvm_riscv_vcpu_reg_indices_sbi_ext(struct kvm_vcpu *vcpu, u64 __user *uindices)
> +{
> +	unsigned int n = 0;
> +
> +	for (int i = 0; i < KVM_RISCV_SBI_EXT_MAX; i++) {
> +		u64 size = IS_ENABLED(CONFIG_32BIT) ?
> +			   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
> +		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_SBI_EXT |
> +			  KVM_REG_RISCV_SBI_SINGLE | i;
> +
> +		if (!riscv_vcpu_supports_sbi_ext(vcpu, i))
> +			continue;
> +
> +		if (uindices) {
> +			if (put_user(reg, uindices))
> +				return -EFAULT;
> +			uindices++;
> +		}
> +
> +		n++;
> +	}
> +
> +	return n;
> +}
> +
>  int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
>  				   const struct kvm_one_reg *reg)
>  {
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
