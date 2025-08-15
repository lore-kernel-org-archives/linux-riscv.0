Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377B8CA0EE4
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 21:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=puGw2hRcn+tF0eEwLUYAAyG5e7eWprQz4E3nonN8IIM=; b=Hzhhw44LcKUNdH
	/wjBVLI4OGo9bAlQGw4LQTYQfqbod2zQS0edLXOzhQuTEJJ1N7f95Id2rI50AfeHe21zyApeZmbDm
	pwq3/fpIGVge37xuih8cFlpB9s85F0YFFCTpeJ2soKwlCEY9B/cDi2DFphMcmrIL0fHwP44Vv5vfY
	Ptgk3Z1dYZJbCzLQha6YKYujM2aM8L8Iip1kRds96MtqUZ3BTjdj1szugwEv7wwpRbnmR5+U6qjzo
	ckG2eXw2enxukIOPcLjTknH0Gbzzt0edO60zcImpudClSD68wTcGBWTBmscx97kJlSdBUxW1JYGXn
	N/JNdKlhQE+8FsyEg3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un1XU-00000003VBl-3Ebr;
	Fri, 15 Aug 2025 21:00:40 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un1XS-00000003VB4-4C7a
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 21:00:40 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3e571d40088so13479605ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Aug 2025 14:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755291638; x=1755896438; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c0oY/0eKfeCLhES28zKC/33PzkgcGvkJ90ZgWYAFPNE=;
        b=I1RHfM6cxBtlmop9w/PGPTtlvFMm91sGUWGjTa1IMOJ5xlH5mABBqQfnPA6hYkEh3X
         9FabpsSvd8HKshA0tdaYiVZDXhO29hSdk6b07r5gaT8WgSRtvpxUY2uB/PMc4fUSa1wa
         e/DuiuqI2/eCBpuAn4O9APzGXCJsX36xA7/rd6zMSr10WSblxU8tZDfXVMR6+Dm0kRbF
         ldltzIohtd8K+OdWzWCNgfygPKerPaqHVTfO0fqAyAIOHaHWSZ0jqhuaIYOouohav/qF
         C6J0Tc8LkuOMTd9gjmzI9MeTD5cECtcEWCdZXJmjbGDKibDlvb8tO50ENUKUFJ4rZf88
         ZorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755291638; x=1755896438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0oY/0eKfeCLhES28zKC/33PzkgcGvkJ90ZgWYAFPNE=;
        b=Q9b2FYzVjcddbPrGBaTEoK39h3q8+GMqWA+YCgEtEdg6P7hktvDGLhVkgVKghhM61L
         pcLENqgacgqqG1MNdNzaYe/SvL9vdfLzGpmZJrAL+PJMtU1rUOE8HCHVQ3+4pQ/VeqvC
         iH6GPmUsDyfEecgk+FzXeLqfPcpL5NWgsmMRX/4drS/QSgQljPcw9UDucgEW0PyaLChb
         lf3cVfeex/S/5JWw4OhiU4TJm14i2tfRSjTdNdBJWqRMlY7mC4ZtURjHrCXCq7b7U4Na
         tMQ/ovo/1asct+qzrLOKjnYgJP/IwAOSdPUlkVdMJaVNDBjZvZxoli1OHqeBFi/8cBFV
         7TGw==
X-Forwarded-Encrypted: i=1; AJvYcCVOoD1bPjzJEsXLePL/2vFw3Vmm34mlNG+nlhf8MNhWV5EPsAhOBSSSI+FZh+U7mtXo6rcQ9IAoJu8kYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaeZbTUY4wiB/IpfMXYYlfA+eU8TAYauxtDdiHipZNnevRQf4x
	As6xrGPt3mqRJLX7a233Zuo8nKHFV49XNSjpxEZoPoK2uD5wf858OcFaWsDPP8rjmpM=
X-Gm-Gg: ASbGncv2rTeVli1xXk2v2sQo0QI2m0v1+wcfUK50v4T2OojbiZt/z657ej+6IxWPhn0
	JzZKoKOK3Sqj1jcf7Y1ujhG4phrSwnnRD2nDEqCzEZUhXDdmHR9n0Be3rZf2MnCNseTWpgdAgiZ
	FvMdTWUY6XWFNKoVmIuFp4GKuSGa4HeR3Zu+Bi+VJOrtJqvC0aozAAeC0GGsZO67wvnk629B8y5
	MNaIfisTCwTPgFMlDcfdHFN3qVPhu6MitOlev26ns9HNJ1VRR8Eygip0JVdP0vHfAnxiA3uGa6r
	w+25VkiYQt1B6+Z57u4QtDjV9PycrSBSNWIp0zfNJkaQQnuVFClHiMmLAfaql1bAiiyrsvcN1/0
	uekPsKwqVjuljSnYuj5Tonelz
X-Google-Smtp-Source: AGHT+IGt3yd4/7kkwlBNcbkqJ/RCR15gXtigPTEqvc5rOWbxgq9Aiogz1JM+m2KoAxw4fTFhb648xQ==
X-Received: by 2002:a05:6e02:3c83:b0:3e5:7e56:db43 with SMTP id e9e14a558f8ab-3e57e809ed6mr61873795ab.4.1755291635821;
        Fri, 15 Aug 2025 14:00:35 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50c947b4150sm637811173.29.2025.08.15.14.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 14:00:35 -0700 (PDT)
Date: Fri, 15 Aug 2025 16:00:33 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 3/6] RISC-V: KVM: Introduce optional ONE_REG callbacks
 for SBI extensions
Message-ID: <20250815-4414a697ab004422374f4d56@orel>
References: <20250814155548.457172-1-apatel@ventanamicro.com>
 <20250814155548.457172-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250814155548.457172-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_140039_038089_C92B4B0D 
X-CRM114-Status: GOOD (  27.70  )
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

On Thu, Aug 14, 2025 at 09:25:45PM +0530, Anup Patel wrote:
> SBI extensions can have per-VCPU state which needs to be saved/restored
> through ONE_REG interface for Guest/VM migration. Introduce optional
> ONE_REG callbacks for SBI extensions so that ONE_REG implementation
> for an SBI extenion is part of the extension sources.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  21 ++--
>  arch/riscv/kvm/vcpu_onereg.c          |  31 +-----
>  arch/riscv/kvm/vcpu_sbi.c             | 145 ++++++++++++++++++++++----
>  arch/riscv/kvm/vcpu_sbi_sta.c         |  64 ++++++++----
>  4 files changed, 178 insertions(+), 83 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index 766031e80960..144c3f6d5eb9 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -59,6 +59,15 @@ struct kvm_vcpu_sbi_extension {
>  	void (*deinit)(struct kvm_vcpu *vcpu);
>  
>  	void (*reset)(struct kvm_vcpu *vcpu);
> +
> +	bool have_state;
> +	unsigned long state_reg_subtype;
> +	unsigned long (*get_state_reg_count)(struct kvm_vcpu *vcpu);

I think we can drop 'have_state'. When 'get_state_reg_count' is NULL, then
the state reg count must be zero (i.e. have_state == false).

> +	int (*get_state_reg_id)(struct kvm_vcpu *vcpu, int index, u64 *reg_id);
> +	int (*get_state_reg)(struct kvm_vcpu *vcpu, unsigned long reg_num,
> +			     unsigned long reg_size, void *reg_val);
> +	int (*set_state_reg)(struct kvm_vcpu *vcpu, unsigned long reg_num,
> +			     unsigned long reg_size, const void *reg_val);
>  };
>  
>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
> @@ -73,10 +82,9 @@ int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
>  				   const struct kvm_one_reg *reg);
>  int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
>  				   const struct kvm_one_reg *reg);
> -int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu,
> -			       const struct kvm_one_reg *reg);
> -int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu,
> -			       const struct kvm_one_reg *reg);
> +int kvm_riscv_vcpu_reg_indices_sbi(struct kvm_vcpu *vcpu, u64 __user *uindices);
> +int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg);
> +int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg);
>  const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
>  				struct kvm_vcpu *vcpu, unsigned long extid);
>  bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
> @@ -85,11 +93,6 @@ void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
>  void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
>  void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu);
>  
> -int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long reg_num,
> -				   unsigned long *reg_val);
> -int kvm_riscv_vcpu_set_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long reg_num,
> -				   unsigned long reg_val);
> -
>  #ifdef CONFIG_RISCV_SBI_V01
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
>  #endif
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index b77748a56a59..5843b0519224 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -1090,36 +1090,9 @@ static unsigned long num_sbi_ext_regs(struct kvm_vcpu *vcpu)
>  	return copy_sbi_ext_reg_indices(vcpu, NULL);
>  }
>  
> -static int copy_sbi_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
> -{
> -	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
> -	int total = 0;
> -
> -	if (scontext->ext_status[KVM_RISCV_SBI_EXT_STA] == KVM_RISCV_SBI_EXT_STATUS_ENABLED) {
> -		u64 size = IS_ENABLED(CONFIG_32BIT) ? KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
> -		int n = sizeof(struct kvm_riscv_sbi_sta) / sizeof(unsigned long);
> -
> -		for (int i = 0; i < n; i++) {
> -			u64 reg = KVM_REG_RISCV | size |
> -				  KVM_REG_RISCV_SBI_STATE |
> -				  KVM_REG_RISCV_SBI_STA | i;
> -
> -			if (uindices) {
> -				if (put_user(reg, uindices))
> -					return -EFAULT;
> -				uindices++;
> -			}
> -		}
> -
> -		total += n;
> -	}
> -
> -	return total;
> -}
> -
>  static inline unsigned long num_sbi_regs(struct kvm_vcpu *vcpu)
>  {
> -	return copy_sbi_reg_indices(vcpu, NULL);
> +	return kvm_riscv_vcpu_reg_indices_sbi(vcpu, NULL);
>  }
>  
>  static inline unsigned long num_vector_regs(const struct kvm_vcpu *vcpu)
> @@ -1247,7 +1220,7 @@ int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
>  		return ret;
>  	uindices += ret;
>  
> -	ret = copy_sbi_reg_indices(vcpu, uindices);
> +	ret = kvm_riscv_vcpu_reg_indices_sbi(vcpu, uindices);
>  	if (ret < 0)
>  		return ret;
>  	uindices += ret;
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 01a93f4fdb16..8b3c393e0c83 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -364,64 +364,163 @@ int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
>  	return 0;
>  }
>  
> -int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu,
> -			       const struct kvm_one_reg *reg)
> +int kvm_riscv_vcpu_reg_indices_sbi(struct kvm_vcpu *vcpu, u64 __user *uindices)
> +{
> +	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
> +	const struct kvm_riscv_sbi_extension_entry *entry;
> +	const struct kvm_vcpu_sbi_extension *ext;
> +	unsigned long state_reg_count;
> +	int i, j, rc, count = 0;
> +	u64 reg;
> +
> +	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
> +		entry = &sbi_ext[i];
> +		ext = entry->ext_ptr;
> +
> +		if (!ext->have_state ||
> +		    scontext->ext_status[entry->ext_idx] != KVM_RISCV_SBI_EXT_STATUS_ENABLED)
> +			continue;
> +
> +		state_reg_count = ext->get_state_reg_count(vcpu);
> +		if (!uindices)
> +			goto skip_put_user;
> +
> +		for (j = 0; j < state_reg_count; j++) {
> +			if (ext->get_state_reg_id) {
> +				rc = ext->get_state_reg_id(vcpu, j, &reg);
> +				if (rc)
> +					return rc;
> +			} else {
> +				reg = KVM_REG_RISCV |
> +				      (IS_ENABLED(CONFIG_32BIT) ?
> +				       KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64) |
> +				      KVM_REG_RISCV_SBI_STATE |
> +				      ext->state_reg_subtype | j;
> +			}
> +
> +			if (put_user(reg, uindices))
> +				return -EFAULT;
> +			uindices++;
> +		}
> +
> +skip_put_user:
> +		count += state_reg_count;
> +	}
> +
> +	return count;
> +}
> +
> +static const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext_withstate(struct kvm_vcpu *vcpu,
> +									    unsigned long subtype)
> +{
> +	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
> +	const struct kvm_riscv_sbi_extension_entry *entry;
> +	const struct kvm_vcpu_sbi_extension *ext;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
> +		entry = &sbi_ext[i];
> +		ext = entry->ext_ptr;
> +
> +		if (ext->have_state &&
> +		    ext->state_reg_subtype == subtype &&
> +		    scontext->ext_status[entry->ext_idx] == KVM_RISCV_SBI_EXT_STATUS_ENABLED)
> +			return ext;
> +	}
> +
> +	return NULL;
> +}
> +
> +int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  {
>  	unsigned long __user *uaddr =
>  			(unsigned long __user *)(unsigned long)reg->addr;
>  	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
>  					    KVM_REG_SIZE_MASK |
>  					    KVM_REG_RISCV_SBI_STATE);
> -	unsigned long reg_subtype, reg_val;
> -
> -	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
> +	const struct kvm_vcpu_sbi_extension *ext;
> +	unsigned long reg_subtype;
> +	void *reg_val;
> +	u64 data64;
> +	u32 data32;
> +	u16 data16;
> +	u8 data8;
> +
> +	switch (KVM_REG_SIZE(reg->id)) {
> +	case 1:
> +		reg_val = &data8;
> +		break;
> +	case 2:
> +		reg_val = &data16;
> +		break;
> +	case 4:
> +		reg_val = &data32;
> +		break;
> +	case 8:
> +		reg_val = &data64;
> +		break;
> +	default:
>  		return -EINVAL;
> +	};

superfluous ';'

>  
> -	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
> +	if (copy_from_user(reg_val, uaddr, KVM_REG_SIZE(reg->id)))
>  		return -EFAULT;
>  
>  	reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
>  	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
>  
> -	switch (reg_subtype) {
> -	case KVM_REG_RISCV_SBI_STA:
> -		return kvm_riscv_vcpu_set_reg_sbi_sta(vcpu, reg_num, reg_val);
> -	default:
> +	ext = kvm_vcpu_sbi_find_ext_withstate(vcpu, reg_subtype);
> +	if (!ext || !ext->set_state_reg)
>  		return -EINVAL;
> -	}
>  
> -	return 0;
> +	return ext->set_state_reg(vcpu, reg_num, KVM_REG_SIZE(reg->id), reg_val);
>  }
>  
> -int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu,
> -			       const struct kvm_one_reg *reg)
> +int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  {
>  	unsigned long __user *uaddr =
>  			(unsigned long __user *)(unsigned long)reg->addr;
>  	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
>  					    KVM_REG_SIZE_MASK |
>  					    KVM_REG_RISCV_SBI_STATE);
> -	unsigned long reg_subtype, reg_val;
> +	const struct kvm_vcpu_sbi_extension *ext;
> +	unsigned long reg_subtype;
> +	void *reg_val;
> +	u64 data64;
> +	u32 data32;
> +	u16 data16;
> +	u8 data8;
>  	int ret;
>  
> -	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
> +	switch (KVM_REG_SIZE(reg->id)) {
> +	case 1:
> +		reg_val = &data8;
> +		break;
> +	case 2:
> +		reg_val = &data16;
> +		break;
> +	case 4:
> +		reg_val = &data32;
> +		break;
> +	case 8:
> +		reg_val = &data64;
> +		break;
> +	default:
>  		return -EINVAL;
> +	};

superfluous ';'

>  
>  	reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
>  	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
>  
> -	switch (reg_subtype) {
> -	case KVM_REG_RISCV_SBI_STA:
> -		ret = kvm_riscv_vcpu_get_reg_sbi_sta(vcpu, reg_num, &reg_val);
> -		break;
> -	default:
> +	ext = kvm_vcpu_sbi_find_ext_withstate(vcpu, reg_subtype);
> +	if (!ext || !ext->get_state_reg)
>  		return -EINVAL;
> -	}
>  
> +	ret = ext->get_state_reg(vcpu, reg_num, KVM_REG_SIZE(reg->id), reg_val);
>  	if (ret)
>  		return ret;
>  
> -	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
> +	if (copy_to_user(uaddr, reg_val, KVM_REG_SIZE(reg->id)))
>  		return -EFAULT;
>  
>  	return 0;
> diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
> index cc6cb7c8f0e4..d14cf6255d83 100644
> --- a/arch/riscv/kvm/vcpu_sbi_sta.c
> +++ b/arch/riscv/kvm/vcpu_sbi_sta.c
> @@ -151,63 +151,83 @@ static unsigned long kvm_sbi_ext_sta_probe(struct kvm_vcpu *vcpu)
>  	return !!sched_info_on();
>  }
>  
> -const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta = {
> -	.extid_start = SBI_EXT_STA,
> -	.extid_end = SBI_EXT_STA,
> -	.handler = kvm_sbi_ext_sta_handler,
> -	.probe = kvm_sbi_ext_sta_probe,
> -	.reset = kvm_riscv_vcpu_sbi_sta_reset,
> -};
> +static unsigned long kvm_sbi_ext_sta_get_state_reg_count(struct kvm_vcpu *vcpu)
> +{
> +	return sizeof(struct kvm_riscv_sbi_sta) / sizeof(unsigned long);
> +}
>  
> -int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu,
> -				   unsigned long reg_num,
> -				   unsigned long *reg_val)
> +static int kvm_sbi_ext_sta_get_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
> +				   unsigned long reg_size, void *reg_val)
>  {
> +	unsigned long *value;
> +
> +	if (reg_size != sizeof(unsigned long))
> +		return -EINVAL;
> +	value = reg_val;
> +
>  	switch (reg_num) {
>  	case KVM_REG_RISCV_SBI_STA_REG(shmem_lo):
> -		*reg_val = (unsigned long)vcpu->arch.sta.shmem;
> +		*value = (unsigned long)vcpu->arch.sta.shmem;
>  		break;
>  	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
>  		if (IS_ENABLED(CONFIG_32BIT))
> -			*reg_val = upper_32_bits(vcpu->arch.sta.shmem);
> +			*value = upper_32_bits(vcpu->arch.sta.shmem);
>  		else
> -			*reg_val = 0;
> +			*value = 0;
>  		break;
>  	default:
> -		return -EINVAL;
> +		return -ENOENT;
>  	}
>  
>  	return 0;
>  }
>  
> -int kvm_riscv_vcpu_set_reg_sbi_sta(struct kvm_vcpu *vcpu,
> -				   unsigned long reg_num,
> -				   unsigned long reg_val)
> +static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
> +				   unsigned long reg_size, const void *reg_val)
>  {
> +	unsigned long value;
> +
> +	if (reg_size != sizeof(unsigned long))
> +		return -EINVAL;
> +	value = *(const unsigned long *)reg_val;
> +
>  	switch (reg_num) {
>  	case KVM_REG_RISCV_SBI_STA_REG(shmem_lo):
>  		if (IS_ENABLED(CONFIG_32BIT)) {
>  			gpa_t hi = upper_32_bits(vcpu->arch.sta.shmem);
>  
> -			vcpu->arch.sta.shmem = reg_val;
> +			vcpu->arch.sta.shmem = value;
>  			vcpu->arch.sta.shmem |= hi << 32;
>  		} else {
> -			vcpu->arch.sta.shmem = reg_val;
> +			vcpu->arch.sta.shmem = value;
>  		}
>  		break;
>  	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
>  		if (IS_ENABLED(CONFIG_32BIT)) {
>  			gpa_t lo = lower_32_bits(vcpu->arch.sta.shmem);
>  
> -			vcpu->arch.sta.shmem = ((gpa_t)reg_val << 32);
> +			vcpu->arch.sta.shmem = ((gpa_t)value << 32);
>  			vcpu->arch.sta.shmem |= lo;
> -		} else if (reg_val != 0) {
> +		} else if (value != 0) {
>  			return -EINVAL;
>  		}
>  		break;
>  	default:
> -		return -EINVAL;
> +		return -ENOENT;
>  	}
>  
>  	return 0;
>  }
> +
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta = {
> +	.extid_start = SBI_EXT_STA,
> +	.extid_end = SBI_EXT_STA,
> +	.handler = kvm_sbi_ext_sta_handler,
> +	.probe = kvm_sbi_ext_sta_probe,
> +	.reset = kvm_riscv_vcpu_sbi_sta_reset,
> +	.have_state = true,
> +	.state_reg_subtype = KVM_REG_RISCV_SBI_STA,
> +	.get_state_reg_count = kvm_sbi_ext_sta_get_state_reg_count,
> +	.get_state_reg = kvm_sbi_ext_sta_get_reg,
> +	.set_state_reg = kvm_sbi_ext_sta_set_reg,
> +};
> -- 
> 2.43.0
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
