Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A4AC001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 09:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjSmYbda5qGITa1YJ4kU3+dhV7fvZ4AtffoVsJtEkiU=; b=bGJ+DlFeLuGbXw
	lEEPCAr2MSxWvwNTb5BR/ZurJMz+bwbYSGtLAsacg3/Ne6ODP2WpvZ5gI/M+ugCMHdfg/cLvdJZRC
	cj2X42A5co1UVFhBRVbIog/QaAFLHi1NHpLg6uYkmYEfzAi0aCO8sDpEpo7r9uFVdAVnauRSEM65Z
	abjBGIhZep2RolT11HuLyVjcUaZ3KOkzgL/jjVOgkkrXOhAYjA3fbex+nlvP+BYK03DdfqTZVp224
	SW635qj+sRItQzyuIM/NjYlu2gC5ltmPjHaOqKNIVkmoukh31/cN76gWbApTYMdzLYwhBRstv91w6
	qZ6+RixxJ3VuOajsJXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMm4F-00DTBc-32;
	Fri, 21 Jul 2023 09:04:55 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMm4C-00DT9n-2z
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 09:04:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso10662125e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 02:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689930289; x=1690535089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n6SiAE2IOMdYwgD47GbQ8AdKaA30hoTLCWN3kPCSoBg=;
        b=GGDNMw12a7e1cR3pbsSxy/8kzfUnVC83Qys713zDUCyHmlJe6gerg5ELKSaSIlhHdK
         vBZH5FZKnVpYwJ0rRrEtjNUGos/VHkRlrNWpvp8TQeYwFFc/eQI9+OqZeGv6bNiBqysb
         Dr3NMqU+dTy7QrOPcV9XC848BAmqrbCZVtLUYmH/5LqguULjPzC65LSKU46Dc/oRPMvy
         kLcBrknHqLRCqluT5aa+fTbmZieZVeEYTwTHo7EnRLXB6oxOthfgDRxW6n3g2FLk4XS+
         CMcmgukJn1uvUu/a98g8WnVWdz3SJlGvONEZ+c8/LKheW5IBybtEsw+0sc9BmWFCsHNO
         1ZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689930289; x=1690535089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6SiAE2IOMdYwgD47GbQ8AdKaA30hoTLCWN3kPCSoBg=;
        b=CyUrXLgsfNvrPJLYnovdPxG4Q51KCSfE7PDV1905KiIlOWydC/gZ5wY7BRiFI2u/qy
         ZSf7jCgZ6SCY+ki9waLOJDRiMoJOnJDOmqAy9kPZP7uFplvbwPRG9KHa+NmqS1oO5tto
         mclI6iHv/+OWrHF6EBp3D4/NeKVmR6rGrLV+bOOhGYHpUdoquTGDpHXJIet4RIZvkoIC
         zHemT/AWZLZ5OLxIOG09IuJg1mTpsQ5/L+Aqiolke+7l2ndLdmj6oXxhfGyFKpfi1eVN
         +8u3F+WzLPEJ65Vy6ywueW+3hU7bS+ztEuA9FLYy15S2pzfpTxSYghEeFHt4YboEH97K
         HyJQ==
X-Gm-Message-State: ABy/qLZzHD4b3KRL0/sXzL6l3Z0+lG4AjrFDcKpOFuGbyVoY/xaFZNQ0
	jspZ76Elx4us8GLneeU1c/4xWQ==
X-Google-Smtp-Source: APBJJlGopjbN46x29tLaXpafKRVsylkt79VNdlV7KNDmBWZZlR7DcZnaoWupBPSXyhR0LMEkTJiVpQ==
X-Received: by 2002:a05:600c:d4:b0:3fb:4064:7e22 with SMTP id u20-20020a05600c00d400b003fb40647e22mr1077466wmm.19.1689930289207;
        Fri, 21 Jul 2023 02:04:49 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id q21-20020a1ce915000000b003fba6709c68sm2982166wmc.47.2023.07.21.02.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 02:04:48 -0700 (PDT)
Date: Fri, 21 Jul 2023 11:04:46 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/6] RISCV: KVM: Add sstateen0 context save/restore
Message-ID: <20230721-78d78a037c03f7a75c5e6525@orel>
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
 <20230721075439.454473-6-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230721075439.454473-6-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_020452_967030_930E6423 
X-CRM114-Status: GOOD (  20.25  )
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

On Fri, Jul 21, 2023 at 01:24:38PM +0530, Mayuresh Chitale wrote:
> Define sstateen0 and add sstateen0 save/restore for guest VCPUs.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  arch/riscv/include/asm/csr.h      |  1 +
>  arch/riscv/include/asm/kvm_host.h |  8 ++++++++
>  arch/riscv/kvm/vcpu.c             | 10 ++++++++++
>  3 files changed, 19 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index b52270278733..5168f37d8e75 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -286,6 +286,7 @@
>  #define CSR_STVEC		0x105
>  #define CSR_SCOUNTEREN		0x106
>  #define CSR_SENVCFG		0x10a
> +#define CSR_SSTATEEN0		0x10c
>  #define CSR_SSCRATCH		0x140
>  #define CSR_SEPC		0x141
>  #define CSR_SCAUSE		0x142
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index c3cc0cb39cf8..c9837772b109 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -170,6 +170,10 @@ struct kvm_vcpu_config {
>  	u64 hstateen0;
>  };
>  
> +struct kvm_vcpu_smstateen_csr {
> +	unsigned long sstateen0;
> +};
> +
>  struct kvm_vcpu_arch {
>  	/* VCPU ran at least once */
>  	bool ran_atleast_once;
> @@ -190,6 +194,7 @@ struct kvm_vcpu_arch {
>  	unsigned long host_stvec;
>  	unsigned long host_scounteren;
>  	unsigned long host_senvcfg;
> +	unsigned long host_sstateen0;
>  
>  	/* CPU context of Host */
>  	struct kvm_cpu_context host_context;
> @@ -200,6 +205,9 @@ struct kvm_vcpu_arch {
>  	/* CPU CSR context of Guest VCPU */
>  	struct kvm_vcpu_csr guest_csr;
>  
> +	/* CPU Smstateen CSR context of Guest VCPU */
> +	struct kvm_vcpu_smstateen_csr smstateen_csr;
> +
>  	/* CPU context upon Guest VCPU reset */
>  	struct kvm_cpu_context guest_reset_context;
>  
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 37f1ed70d782..ae750decbefe 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -1138,14 +1138,24 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
>   */
>  static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
>  {
> +	struct kvm_vcpu_smstateen_csr *smcsr = &vcpu->arch.smstateen_csr;
>  	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
> +	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
>  
>  	vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN) &&
> +	    (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
> +		vcpu->arch.host_sstateen0 = csr_swap(CSR_SSTATEEN0,
> +						     smcsr->sstateen0);
>  	guest_state_enter_irqoff();
>  	__kvm_riscv_switch_to(&vcpu->arch);
>  	vcpu->arch.last_exit_cpu = vcpu->cpu;
>  	guest_state_exit_irqoff();
>  	csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN) &&
> +	    (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
> +		smcsr->sstateen0 = csr_swap(CSR_SSTATEEN0,
> +					    vcpu->arch.host_sstateen0);
>  }

It might be nice to keep kvm_riscv_vcpu_enter_exit() "clean", by adding
a couple functions. Something like

 static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *vcpu)
 {
   struct kvm_vcpu_smstateen_csr *smcsr = &vcpu->arch.smstateen_csr;
   struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
   struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;

   vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
   if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN) &&
       (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
          vcpu->arch.host_sstateen0 = csr_swap(CSR_SSTATEEN0,
                                               smcsr->sstateen0);
 }

 static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *vcpu)
 {
   struct kvm_vcpu_smstateen_csr *smcsr = &vcpu->arch.smstateen_csr;
   struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
   struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;

   csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
   if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN) &&
       (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
           smcsr->sstateen0 = csr_swap(CSR_SSTATEEN0,
                                       vcpu->arch.host_sstateen0);
 }

 static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
 {
    kvm_riscv_vcpu_swap_in_guest_state(vcpu);
    guest_state_enter_irqoff();
    __kvm_riscv_switch_to(&vcpu->arch);
    vcpu->arch.last_exit_cpu = vcpu->cpu;
    guest_state_exit_irqoff();
    kvm_riscv_vcpu_swap_in_host_state(vcpu);
 }

>  
>  int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
> -- 
> 2.34.1
>

Either way,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
