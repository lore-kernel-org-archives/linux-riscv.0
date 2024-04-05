Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CBEC67861
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 12:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NiLKeXUgRLm7EOCxZBthzLj/MsvLEyVKZziedLmF5sk=; b=1yRNA+WvI2Aneo
	4eAMsnILsPpsp+xE25VNTVkyjXyFApj3p7TxvdtQtqQdAOPEvIjaWnO6bDcaJZFyd5BWD50qKctOj
	G+QsJON26cdVKuxmRRTSbVylL3SKHDBknPCQe6E8M6ZDEpEgZ87LTrGfjXDehis6SAHZomOpd6mAr
	QPidx8rr4GT3U1bhwRsSLjBQ+vMDq+8gilXUhcZwQFjTIeUZ8JV7JbhI1JO0g4UCHAuFHaojpel9H
	lJ1gzHq+mmsU0YXL5LQmkmlBLv3MN7d4clAnGfyC69qRSf3vr9QTUccpCNiVWHg55OZQkN3RpOGQT
	Izr5yaEdxg+/KDdn2UVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiP2-00000006pyv-3Khl;
	Fri, 05 Apr 2024 12:10:40 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiOy-00000006pw8-2oUA
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 12:10:40 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2d718efedb2so35901271fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 05:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712319034; x=1712923834; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=en++ou90w+echMP7REhkEA6fNREBrRLo/x86xMpLdGE=;
        b=I9TVsJJfIZRtaaS1T8TR+2WyUSPvTYwqOZWIoQ0pG8RsHaXCNRWK8JXO2IY1ci9XR/
         yBZ3gjkYZfD2N4o/ZvsjMmm0l5dMjr46j+sYqFaccGgOts0yls6VCW2TVk67Z/mOnepM
         Cg0GL6cCO5uXGiDWDYSSpxtzY3CBOzBKxDmuJnUpGw356cMVuKMGroOceru/PMnSWpEw
         +pTfOX8OJGTwaeuRROG3QE0epancxZbxMUNePp80EbvQMA4tujhTIW37NFi+ya7EfiPL
         vXTzVVt1KUSXkIpCBRrRxR8GaqT1d4fufzz7YMuD7HjYiK6MlUCekYfBuw1bELHSuo96
         KOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712319034; x=1712923834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=en++ou90w+echMP7REhkEA6fNREBrRLo/x86xMpLdGE=;
        b=iOarpbMRqLXS/GlxyqOWrMJPPEVvRBN6EWNU9xS78pRpdywJ31VDY1Qk+PkBo+FI90
         SpLjHqNK1nDkvk2BM6i1janzS/j6Uru2j1TbFFaCVe6pOBdRBkCFKqdo6RyD7PawDsSX
         J6rRgePENWBosRjiPyG0wlZRJrQiegSPoc+ILvFKgQqfpMHtFg5m4Di7NqWMw6dvRx6C
         YILNuQPzg0hWpaUn1Ls8VgO/BOj68ge0f6En6lHAaCR8ATZUeRSWg8PowaJGRXQqPA0G
         vOCXlMrgkIdVlVgeGh5ir1JKsnvuojylPke/dVrYqs8pCvn7XB+i6yixoQE31qEYI22P
         0ORA==
X-Forwarded-Encrypted: i=1; AJvYcCUr02/7RrORd8w0/yEH4/89DGBVa576/Fou3AVoINbOd5hrZG4e29jFM/bwbVhGCcFzyZ9ALOyj7ksGew5jYmK6txoiCLQcQaGl6qcao+Qf
X-Gm-Message-State: AOJu0YwlWuAy3BHG1J/Ru5r+HEGe7ZX+LlGnasYCT+LLfGTfx9QKtfZ7
	81tvCN24SglIBQQTzSFNR6jfyVFixoum2iczrMNrjHGTtfjCsBRSTCOdVQyPJJI=
X-Google-Smtp-Source: AGHT+IEzRjdEz2L9eamcBiZkSH+r98MqC6ceGdW87UNyauZWh7IXa+iMGl1AT9EDPHKQSSfTKTG4Sg==
X-Received: by 2002:a05:651c:49d:b0:2d6:f793:3434 with SMTP id s29-20020a05651c049d00b002d6f7933434mr1296826ljc.2.1712319034264;
        Fri, 05 Apr 2024 05:10:34 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id j31-20020a5d6e5f000000b0033fc06f2d84sm1872775wrz.109.2024.04.05.05.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 05:10:33 -0700 (PDT)
Date: Fri, 5 Apr 2024 14:10:32 +0200
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
Subject: Re: [PATCH v5 14/22] RISC-V: KVM: Support 64 bit firmware counters
 on RV32
Message-ID: <20240405-6ef7f32d45deb5edd2d54ecb@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-15-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-15-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_051036_824864_A37C171B 
X-CRM114-Status: GOOD (  24.42  )
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

On Wed, Apr 03, 2024 at 01:04:43AM -0700, Atish Patra wrote:
> The SBI v2.0 introduced a fw_read_hi function to read 64 bit firmware
> counters for RV32 based systems.
> 
> Add infrastructure to support that.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |  4 ++-
>  arch/riscv/kvm/vcpu_pmu.c             | 44 ++++++++++++++++++++++++++-
>  arch/riscv/kvm/vcpu_sbi_pmu.c         |  6 ++++
>  3 files changed, 52 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> index 257f17641e00..55861b5d3382 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> @@ -20,7 +20,7 @@ static_assert(RISCV_KVM_MAX_COUNTERS <= 64);
>  
>  struct kvm_fw_event {
>  	/* Current value of the event */
> -	unsigned long value;
> +	u64 value;
>  
>  	/* Event monitoring status */
>  	bool started;
> @@ -91,6 +91,8 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>  				     struct kvm_vcpu_sbi_return *retdata);
>  int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  				struct kvm_vcpu_sbi_return *retdata);
> +int kvm_riscv_vcpu_pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
> +				      struct kvm_vcpu_sbi_return *retdata);
>  void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
>  int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long saddr_low,
>  				      unsigned long saddr_high, unsigned long flags,
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 9fedf9dc498b..ff326152eeff 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -197,6 +197,36 @@ static int pmu_get_pmc_index(struct kvm_pmu *pmu, unsigned long eidx,
>  	return kvm_pmu_get_programmable_pmc_index(pmu, eidx, cbase, cmask);
>  }
>  
> +static int pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
> +			      unsigned long *out_val)
> +{
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +	struct kvm_pmc *pmc;
> +	int fevent_code;
> +
> +	if (!IS_ENABLED(CONFIG_32BIT)) {
> +		pr_warn("%s: should be invoked for only RV32\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	if (cidx >= kvm_pmu_num_counters(kvpmu) || cidx == 1) {
> +		pr_warn("Invalid counter id [%ld]during read\n", cidx);
> +		return -EINVAL;
> +	}
> +
> +	pmc = &kvpmu->pmc[cidx];
> +
> +	if (pmc->cinfo.type != SBI_PMU_CTR_TYPE_FW)
> +		return -EINVAL;
> +
> +	fevent_code = get_event_code(pmc->event_idx);
> +	pmc->counter_val = kvpmu->fw_event[fevent_code].value;
> +
> +	*out_val = pmc->counter_val >> 32;
> +
> +	return 0;
> +}
> +
>  static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  			unsigned long *out_val)
>  {
> @@ -705,6 +735,18 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>  	return 0;
>  }
>  
> +int kvm_riscv_vcpu_pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
> +				      struct kvm_vcpu_sbi_return *retdata)
> +{
> +	int ret;
> +
> +	ret = pmu_fw_ctr_read_hi(vcpu, cidx, &retdata->out_val);
> +	if (ret == -EINVAL)
> +		retdata->err_val = SBI_ERR_INVALID_PARAM;
> +
> +	return 0;
> +}
> +
>  int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  				struct kvm_vcpu_sbi_return *retdata)
>  {
> @@ -778,7 +820,7 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>  			pmc->cinfo.csr = CSR_CYCLE + i;
>  		} else {
>  			pmc->cinfo.type = SBI_PMU_CTR_TYPE_FW;
> -			pmc->cinfo.width = BITS_PER_LONG - 1;
> +			pmc->cinfo.width = 63;
>  		}
>  	}
>  
> diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
> index d3e7625fb2d2..cf111de51bdb 100644
> --- a/arch/riscv/kvm/vcpu_sbi_pmu.c
> +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> @@ -64,6 +64,12 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  	case SBI_EXT_PMU_COUNTER_FW_READ:
>  		ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
>  		break;
> +	case SBI_EXT_PMU_COUNTER_FW_READ_HI:
> +		if (IS_ENABLED(CONFIG_32BIT))
> +			ret = kvm_riscv_vcpu_pmu_fw_ctr_read_hi(vcpu, cp->a0, retdata);
> +		else
> +			retdata->out_val = 0;
> +		break;
>  	case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
>  		ret = kvm_riscv_vcpu_pmu_snapshot_set_shmem(vcpu, cp->a0, cp->a1, cp->a2, retdata);
>  		break;
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
