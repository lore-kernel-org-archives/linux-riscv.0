Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D8BCD11C2
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 12:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iPa+OgJsDsMY5MZ12T/YyvZL5gqhwIu+ux+VA7oVxzs=; b=BjHiKFygMWwugr
	Nwh5jjbPp9oQ3KAFl3gQ03AOSNBmaP/NR5s9BdYWudSDtFYwD82Q7BHITVP8vbCrNdHyZkxbTmCPI
	3r/DaMgzpWASzipK8eMN/AkhxMtFQb5YDjB6aTE4Iy14Af0JyDOxEhxP7uefUxx7n3aZmTJWW0okM
	OjWW6zMzogq6NxMY8nDy6teF5ouACtzJssVM2uOHFUSY9FXLZ5uaaNwM+SgVPg6SEZMUOUrZcbBj0
	Wzwqnne227TImlgS64By6l3IRZNKxCnUiw0RaXEevJevK3xK4mtc5rNZ8OAW/kdEMwHvCUTbyfnsX
	nMHnqvEmzMa7bNuxLlCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiRN-00000006quc-071F;
	Fri, 05 Apr 2024 12:13:05 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiRJ-00000006qsG-44SU
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 12:13:03 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2d8129797fcso27262911fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 05:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712319178; x=1712923978; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HYZcvWtsDvy2pse+vGPhkHFJFnqvbEcDhkbwdc6IM+c=;
        b=EYu85x9Qu6qM1P/kBRliWhsbXdYAQ3SeP0jTr6RkirvBd4hVfkVxDKTAtW0hOCM1cv
         NNLruc7Er9uuXJU3kV5cO06yNrwretqfKi9wKP5JwVkSHaZVPIDqKyMtJHL4GRE4OsTr
         GE0fqwyjgCfhVJzEjtq+aKIBa1FZPBukpTG/9mBvEzhrgyC6mq26a8+h6gCyPp7B5cgg
         cG4TvIZduNMNXWLc319lDUesblCnSbnNNqputLWLESUl/9EWMFSSMonG8RxBuH/9J838
         06FUHGKfDUoNTtnUxYaRu4GrzKrg/H66IHf+nKrNMlch9g+GCGn53q57/kpa+TvCeNAU
         BLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712319178; x=1712923978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYZcvWtsDvy2pse+vGPhkHFJFnqvbEcDhkbwdc6IM+c=;
        b=ASdECx4lpVRlaujHSyS6mHgafzrfqGynjZ5mXUUnfq+T+g9B65X10ZWn7UZM5eVqe/
         U2a88fo1kZsSJSqB5C04iRYIc0xIL1y6R9axK+CWd9PDRit1n5DE/1bQzx7okfVS6VWf
         tM798UXJknROgkLL9985jQ76uWRU0qCTn6n+M/UPQSLLsG3JsT29r+0BCBsDVzvJztXk
         +3jpoQgsYoaHT3iK2R/PNGYYYHdWeT6pjAII3kr1w3RI6PYH4NXS6rvY05Ui8sYiI8Gs
         QSfwpZpwJCwO3cz2yzAcu1otAFbE/Ir4zQ5AIOyN2PGgDMjB1A9Qifm/4aBHeiUNJxSH
         qneA==
X-Forwarded-Encrypted: i=1; AJvYcCXVb3hK4P84tLOah2Iv4Ke1GeFNKh1eN74h2q6MdCFgZjiFnPBz+xGOcmjYiGTs3YUOZgFCt5GL91wPNLTBBu5ZvL0KnmoONB26tT0SO97p
X-Gm-Message-State: AOJu0Yy3O3zQJl+y6gFx93IZiSdrzm8Z/whIxDkPIcz6C+iSxbp+OsVK
	JcVjn2o9X5pAPE5PXeaEpo6YH7rRcXHGL7oHzyNTol9PORrKab3jEmrjOjQNDqI=
X-Google-Smtp-Source: AGHT+IE7Lx9Gy8UPuI2Fe6F5yEOkQeAtXYhy3EeJ04SwdjNicn6qCSA5xJIY7awO1OB5cSxmhomVgg==
X-Received: by 2002:a2e:8555:0:b0:2d7:9d4:f31c with SMTP id u21-20020a2e8555000000b002d709d4f31cmr1244137ljj.15.1712319178095;
        Fri, 05 Apr 2024 05:12:58 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id iv9-20020a05600c548900b004162e3e5b9asm2463049wmb.44.2024.04.05.05.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 05:12:57 -0700 (PDT)
Date: Fri, 5 Apr 2024 14:12:56 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Ajay Kaher <akaher@vmware.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Alexey Makhalov <amakhalov@vmware.com>, 
	Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH v5 15/22] RISC-V: KVM: Improve firmware counter read
 function
Message-ID: <20240405-dbb7765ae18820c57461dfff@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-16-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-16-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_051302_039912_9AD901C6 
X-CRM114-Status: GOOD (  18.48  )
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

On Wed, Apr 03, 2024 at 01:04:44AM -0700, Atish Patra wrote:
> Rename the function to indicate that it is meant for firmware
> counter read. While at it, add a range sanity check for it as
> well.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_pmu.h | 2 +-
>  arch/riscv/kvm/vcpu_pmu.c             | 7 ++++++-
>  arch/riscv/kvm/vcpu_sbi_pmu.c         | 2 +-
>  3 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> index 55861b5d3382..fa0f535bbbf0 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> @@ -89,7 +89,7 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>  				     unsigned long ctr_mask, unsigned long flags,
>  				     unsigned long eidx, u64 evtdata,
>  				     struct kvm_vcpu_sbi_return *retdata);
> -int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> +int kvm_riscv_vcpu_pmu_fw_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  				struct kvm_vcpu_sbi_return *retdata);
>  int kvm_riscv_vcpu_pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
>  				      struct kvm_vcpu_sbi_return *retdata);
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index ff326152eeff..94efa88d054d 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -235,6 +235,11 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  	u64 enabled, running;
>  	int fevent_code;
>  
> +	if (cidx >= kvm_pmu_num_counters(kvpmu) || cidx == 1) {
> +		pr_warn("Invalid counter id [%ld] during read\n", cidx);
> +		return -EINVAL;
> +	}
> +
>  	pmc = &kvpmu->pmc[cidx];
>  
>  	if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
> @@ -747,7 +752,7 @@ int kvm_riscv_vcpu_pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
>  	return 0;
>  }
>  
> -int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> +int kvm_riscv_vcpu_pmu_fw_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  				struct kvm_vcpu_sbi_return *retdata)
>  {
>  	int ret;
> diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
> index cf111de51bdb..e4be34e03e83 100644
> --- a/arch/riscv/kvm/vcpu_sbi_pmu.c
> +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> @@ -62,7 +62,7 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  		ret = kvm_riscv_vcpu_pmu_ctr_stop(vcpu, cp->a0, cp->a1, cp->a2, retdata);
>  		break;
>  	case SBI_EXT_PMU_COUNTER_FW_READ:
> -		ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
> +		ret = kvm_riscv_vcpu_pmu_fw_ctr_read(vcpu, cp->a0, retdata);
>  		break;
>  	case SBI_EXT_PMU_COUNTER_FW_READ_HI:
>  		if (IS_ENABLED(CONFIG_32BIT))
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
