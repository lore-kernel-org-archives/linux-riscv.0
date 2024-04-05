Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13310CD11C2
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 11:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=okg9SHQhAR6m+zzgPAOVN8PZbuNTN8HPS7yvjbyvn4Y=; b=FbEdwXYmxwd05w
	wGEITsKaslMm6lDXmO+FRkSS7lzTowLsKZ6ZbWCyl3fzGnEI4R1aEyajQ9DSonNe6TM8CiSxOhpgz
	GwX1ajsEMi0fv3vqLK5d0u6agGzBhUedsJ16mTyXokjmrBPSodnBxYSQocUGHY8wFIk8+4qv4IIbr
	f1y/YuXLyfC8Rt3dgsW+JvhvqU0D2Nw7Z1TAbzaor85+CaeZahwqOmBtnkMG0220uNtPK/FCLhoho
	+bkp2NEUJ6PYC8gQEbW3tVce7j/ZYq3UbTdfwW9eyOJpH4JqauGKGgvO6T/AccUPhsF0Kc3QBc6a2
	7aJrsYHXGcsUieeJOE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rshrk-00000006hzu-1pvQ;
	Fri, 05 Apr 2024 11:36:16 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rshre-00000006hw0-3zs9
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 11:36:14 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-516d09bd434so1753107e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 04:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712316969; x=1712921769; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7xAac9err8NBKRZPxO41MdtHvCNpSltOcxeRWSQQ1Qw=;
        b=PCICVPn1qVl7fZqwEEG6Fe5EfTd4o8SoeOqEwbnSvuXLbezmtJPoJxRmw3HTNw4TJR
         cpEzRRhHmV5TGUniJJyAqtKW947ww2Bvf1vWDsSgF9LKqPeFTjAkuS2ol/rBIW6GWORN
         uFJk+1tfIpV+GA3w9tNuSq79u0kLgdQ1wh08HZB3AnXQQTif5jnaMIpn4+t3TDdL7ZfE
         930VPalw4948vVNO0iCTdjL0Y1xX0IuXz4IvNYT+Pkl/sbfJlNwvcRSG4qBGAGUAoPIu
         3y/GiUAgTOLlQzjALLG0yYGfyAUds/PwT7eJnnIIT5xVXn4IOzSKXMGcbP4qRwvL1FW2
         YtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712316969; x=1712921769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xAac9err8NBKRZPxO41MdtHvCNpSltOcxeRWSQQ1Qw=;
        b=WfCJLIYTczbJ+3GWxkxZip/b1nelwdVCW5M/Ew3eZdK/Ew+HXZ5JvDD+MAm1efyHsd
         vjQUnsyaE3TqTA+6HFOxlQuICWOwI6TMN2+4h82TfRiNaBImLyBDmBJo8nREJirYp/HS
         ltU4qOzGxOCfHOPWyr3tHYUTs+xsZ9GvjLDjOxtTgCFFVGk2WpjlR4G92E6y9dOOfo6e
         JH3Qn6PZGJy6bo5okCi5ssmVsaX/1bAmx0uA7PwvBLmXZAvd67q9AL47m/f+mzP4VWf0
         RHs96ttp8jatQKoOVpVPfG6tQoDcc3RJQc3+sxsEKPtm/FgyiKS/yjh2BC9n5W8JI3XB
         PiXA==
X-Forwarded-Encrypted: i=1; AJvYcCUdzXFBcJKQCCRFJVRjDU9lzV5+SUSYiEbJU4iBiy+rfL9OmbgQRds7+/t7uYcvaPjJupW12oqL1VZ46hPJfle4Qa/p1KPU3SfBJKIIvrW8
X-Gm-Message-State: AOJu0Yw/+a2wW1zmb/i/7J6F+t5ARNGRCevp+kgb69RE44N5hJu5Rogu
	rOkCDiKqcMIniquDdrLfqez4J6kNvs66n3TGyjQEYUmR34wSSrhOB4IoyNyFgtI=
X-Google-Smtp-Source: AGHT+IFOyM+2aNNMenkCs88gwiFX6wHDScI3OJB/kbF1cTF+kZe1Gaz0hjCZfryB5Ww0uUi+yVRjKw==
X-Received: by 2002:a05:6512:2387:b0:514:cbee:a261 with SMTP id c7-20020a056512238700b00514cbeea261mr1000001lfv.27.1712316968622;
        Fri, 05 Apr 2024 04:36:08 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c230300b0041497707746sm5692484wmo.0.2024.04.05.04.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 04:36:07 -0700 (PDT)
Date: Fri, 5 Apr 2024 13:36:06 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Ajay Kaher <akaher@vmware.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Alexey Makhalov <amakhalov@vmware.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH v5 13/22] RISC-V: KVM: Add perf sampling support for
 guests
Message-ID: <20240405-5b84abdbf55142d40410fec8@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-14-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-14-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_043611_068010_71821657 
X-CRM114-Status: GOOD (  30.26  )
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

On Wed, Apr 03, 2024 at 01:04:42AM -0700, Atish Patra wrote:
> KVM enables perf for guest via counter virtualization. However, the
> sampling can not be supported as there is no mechanism to enabled
> trap/emulate scountovf in ISA yet. Rely on the SBI PMU snapshot
> to provide the counter overflow data via the shared memory.
> 
> In case of sampling event, the host first sets the guest's LCOFI
> interrupt and injects to the guest via irq filtering mechanism defined
> in AIA specification. Thus, ssaia must be enabled in the host in order
> to use perf sampling in the guest. No other AIA dependency w.r.t kernel
> is required.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h          |  3 +-
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |  3 ++
>  arch/riscv/include/uapi/asm/kvm.h     |  1 +
>  arch/riscv/kvm/aia.c                  |  5 ++
>  arch/riscv/kvm/vcpu.c                 | 15 ++++--
>  arch/riscv/kvm/vcpu_onereg.c          |  5 ++
>  arch/riscv/kvm/vcpu_pmu.c             | 68 +++++++++++++++++++++++++--
>  7 files changed, 92 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 9d1b07932794..25966995da04 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -168,7 +168,8 @@
>  #define VSIP_TO_HVIP_SHIFT	(IRQ_VS_SOFT - IRQ_S_SOFT)
>  #define VSIP_VALID_MASK		((_AC(1, UL) << IRQ_S_SOFT) | \
>  				 (_AC(1, UL) << IRQ_S_TIMER) | \
> -				 (_AC(1, UL) << IRQ_S_EXT))
> +				 (_AC(1, UL) << IRQ_S_EXT) | \
> +				 (_AC(1, UL) << IRQ_PMU_OVF))
>  
>  /* AIA CSR bits */
>  #define TOPI_IID_SHIFT		16
> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> index 77a1fc4d203d..257f17641e00 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> @@ -36,6 +36,7 @@ struct kvm_pmc {
>  	bool started;
>  	/* Monitoring event ID */
>  	unsigned long event_idx;
> +	struct kvm_vcpu *vcpu;
>  };
>  
>  /* PMU data structure per vcpu */
> @@ -50,6 +51,8 @@ struct kvm_pmu {
>  	bool init_done;
>  	/* Bit map of all the virtual counter used */
>  	DECLARE_BITMAP(pmc_in_use, RISCV_KVM_MAX_COUNTERS);
> +	/* Bit map of all the virtual counter overflown */
> +	DECLARE_BITMAP(pmc_overflown, RISCV_KVM_MAX_COUNTERS);
>  	/* The address of the counter snapshot area (guest physical address) */
>  	gpa_t snapshot_addr;
>  	/* The actual data of the snapshot */
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index b1c503c2959c..e878e7cc3978 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -167,6 +167,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZFA,
>  	KVM_RISCV_ISA_EXT_ZTSO,
>  	KVM_RISCV_ISA_EXT_ZACAS,
> +	KVM_RISCV_ISA_EXT_SSCOFPMF,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
> index a944294f6f23..0f0a9d11bb5f 100644
> --- a/arch/riscv/kvm/aia.c
> +++ b/arch/riscv/kvm/aia.c
> @@ -545,6 +545,9 @@ void kvm_riscv_aia_enable(void)
>  	enable_percpu_irq(hgei_parent_irq,
>  			  irq_get_trigger_type(hgei_parent_irq));
>  	csr_set(CSR_HIE, BIT(IRQ_S_GEXT));
> +	/* Enable IRQ filtering for overflow interrupt only if sscofpmf is present */
> +	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSCOFPMF))
> +		csr_write(CSR_HVIEN, BIT(IRQ_PMU_OVF));
>  }
>  
>  void kvm_riscv_aia_disable(void)
> @@ -558,6 +561,8 @@ void kvm_riscv_aia_disable(void)
>  		return;
>  	hgctrl = get_cpu_ptr(&aia_hgei);
>  
> +	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSCOFPMF))
> +		csr_clear(CSR_HVIEN, BIT(IRQ_PMU_OVF));
>  	/* Disable per-CPU SGEI interrupt */
>  	csr_clear(CSR_HIE, BIT(IRQ_S_GEXT));
>  	disable_percpu_irq(hgei_parent_irq);
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index b5ca9f2e98ac..bb10771b2b18 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -365,6 +365,13 @@ void kvm_riscv_vcpu_sync_interrupts(struct kvm_vcpu *vcpu)
>  		}
>  	}
>  
> +	/* Sync up the HVIP.LCOFIP bit changes (only clear) by the guest */
> +	if ((csr->hvip ^ hvip) & (1UL << IRQ_PMU_OVF)) {
> +		if (!(hvip & (1UL << IRQ_PMU_OVF)) &&
> +		    !test_and_set_bit(IRQ_PMU_OVF, v->irqs_pending_mask))
> +			clear_bit(IRQ_PMU_OVF, v->irqs_pending);
> +	}
> +
>  	/* Sync-up AIA high interrupts */
>  	kvm_riscv_vcpu_aia_sync_interrupts(vcpu);
>  
> @@ -382,7 +389,8 @@ int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
>  	if (irq < IRQ_LOCAL_MAX &&
>  	    irq != IRQ_VS_SOFT &&
>  	    irq != IRQ_VS_TIMER &&
> -	    irq != IRQ_VS_EXT)
> +	    irq != IRQ_VS_EXT &&
> +	    irq != IRQ_PMU_OVF)
>  		return -EINVAL;
>  
>  	set_bit(irq, vcpu->arch.irqs_pending);
> @@ -397,14 +405,15 @@ int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
>  int kvm_riscv_vcpu_unset_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
>  {
>  	/*
> -	 * We only allow VS-mode software, timer, and external
> +	 * We only allow VS-mode software, timer, counter overflow and external
>  	 * interrupts when irq is one of the local interrupts
>  	 * defined by RISC-V privilege specification.
>  	 */
>  	if (irq < IRQ_LOCAL_MAX &&
>  	    irq != IRQ_VS_SOFT &&
>  	    irq != IRQ_VS_TIMER &&
> -	    irq != IRQ_VS_EXT)
> +	    irq != IRQ_VS_EXT &&
> +	    irq != IRQ_PMU_OVF)
>  		return -EINVAL;
>  
>  	clear_bit(irq, vcpu->arch.irqs_pending);
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index f4a6124d25c9..4da4ed899104 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -36,6 +36,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	/* Multi letter extensions (alphabetically sorted) */
>  	KVM_ISA_EXT_ARR(SMSTATEEN),
>  	KVM_ISA_EXT_ARR(SSAIA),
> +	KVM_ISA_EXT_ARR(SSCOFPMF),
>  	KVM_ISA_EXT_ARR(SSTC),
>  	KVM_ISA_EXT_ARR(SVINVAL),
>  	KVM_ISA_EXT_ARR(SVNAPOT),
> @@ -101,6 +102,9 @@ static bool kvm_riscv_vcpu_isa_enable_allowed(unsigned long ext)
>  		return false;
>  	case KVM_RISCV_ISA_EXT_V:
>  		return riscv_v_vstate_ctrl_user_allowed();
> +	case KVM_RISCV_ISA_EXT_SSCOFPMF:

nit: this case which starts with 'S' should come before the 'V' case since
we tend to alphabetize these things.

> +		/* Sscofpmf depends on interrupt filtering defined in ssaia */
> +		return __riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSAIA);
>  	default:
>  		break;
>  	}
> @@ -116,6 +120,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_C:
>  	case KVM_RISCV_ISA_EXT_I:
>  	case KVM_RISCV_ISA_EXT_M:
> +	case KVM_RISCV_ISA_EXT_SSCOFPMF:

Since we can choose not to inject overflow interrupts for the guest, then
the VMM could be allowed to disable this. Returning false from this
function means that there's no way for KVM to turn off the behavior (or
that KVM doesn't want to maintain code allowing the behavior to be turned
off). Extensions that provides instructions which are unconditionally
exposed to VS-mode can't be disabled, but anything KVM emulates, like this
overflow can be. Is disabling Sscofpmf something that KVM would rather not
maintain?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
