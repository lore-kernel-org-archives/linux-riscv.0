Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EDECD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 12:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xwgsZbY3ibY/saz9zOfLJka6w4w2C1CBVvlDCw/J8Vs=; b=WyFhn9IDeR9FPa
	BJtVt/OCWrQ4uXu7WO5KCY/lYeiNH1o2WhRCVxq5E0WocLbeR+11P7VRiNlTnKBvGYEJFZ1pHZnN4
	3Z4iQNiZp7TCT3+96RUhGNyqy/yQBOrp4oByAKvR4EuSTsNxXuOXcEKPptoBJp5ZZTAccF50nhPJZ
	JQSI71dBR6K3WH0HhasstEVWPtvAeNhk3wCdObX1isbLe2HjxDgpBex5ZyZxwlhxnzDEXDkQ72r7d
	BQovRhjjcEfHiyDWj5/rFHlPK4/VoqvSY4ghpM95FvokiFFNSmIltgrrZR1cadfuypNQKVOs7vRDO
	VT29SAV/ReLmfX77aGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsM4E-00000002Ygz-0zml;
	Thu, 04 Apr 2024 12:19:42 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsM49-00000002Yca-4Bmy
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 12:19:40 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-516c11b6af9so1274551e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 05:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712233172; x=1712837972; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lu9C520pl/QToPEuDedj4tCxIjbZApgXqw10FbpssTk=;
        b=StD3iajSZlpx8zeQECrIuxoRFkEuNsDPFThAUZqQMHk5tMjikGT2WiiEBj/jFu2fZu
         bLGWz6uAfFPLHxFVin2ayZU95mNqbyF/yrqQrIJ+cU0+Buy+Wl5ZuuSX7QKJ7P2JO1XG
         je3qObnbY25XKbgZT0wOwg3gs8yHYu/QvKwP+DVxOOpUlma4Nl1ZR8ffttIFo6qi2WTe
         rnStIS817aKYyFpRTXCNy18aU8uke4Pk55hY4GzqrNAaAne4wifm8846D+5pxG+Oaa0s
         /AFhmoKO59xNBtuoozyVy9mTY8iqfmI71l99Z9tWdxiij0nRCd9kvjphsrif4FNKenHD
         n+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233172; x=1712837972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lu9C520pl/QToPEuDedj4tCxIjbZApgXqw10FbpssTk=;
        b=LOV7K5GpDg+BfDMzB9ujlDiav6uaB4UkrmQuU4hx0SQxg3ZjlhgXPMixLHPBGxOigr
         HsltMt9zDa9Cde3rJlhB6PbAEyNHhRMwKQa4RQOXlJ3Z1/HhwgoJxMGPSwwjozYEZQv6
         S85MZgGiWjT5Jmr21TohKva1CyC9SrwFvJveGNHQYJaHgtdudUSapSR0IuG1EWLgNUg0
         4oLdR1aNqtUbKmtzrIiJEb1ICUHKM3zxAgYRTjmbEJEqYhlbxNdME8R/sjkLbhXVhPIy
         YYHnbvQ9pLAF4F0J26HI/Hg1XfFmRxoGsODj8ty8kf4VrTXPq5p19g2POrDuiM7glHKg
         kDJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxeHkUjGG1ENJxgN7OygdYniByxFhO0nxdrkXzZuWf6k1yE2f8C52UAFxY7nJPhMWxj+tGg8qcF/e4UrvohKsbTFHPblYEVkzV0dqLCucE
X-Gm-Message-State: AOJu0YzDEyT86Eafi3qXUO7erMM2jHDS3YIVK8QVzhpplR2LqiOASlA0
	DE5LCzbziWtm6rU0Wsx6atapRm0X+jjkQXic7INK50oQE+OsfoS3dbOhN9s3yio=
X-Google-Smtp-Source: AGHT+IGEr4LvYqRVP8TkgXhtJPu1ySWcSB/CsLOqLwHtKBXo1yVAMV8rZBtRTlCE8fvE3nx9A3syYg==
X-Received: by 2002:ac2:555b:0:b0:515:d3dc:43e with SMTP id l27-20020ac2555b000000b00515d3dc043emr1852415lfk.51.1712233171751;
        Thu, 04 Apr 2024 05:19:31 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id a12-20020a170906670c00b00a46d6e51a6fsm9012975ejp.63.2024.04.04.05.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:19:31 -0700 (PDT)
Date: Thu, 4 Apr 2024 14:19:30 +0200
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
Subject: Re: [PATCH v5 11/22] RISC-V: KVM: No need to exit to the user space
 if perf event failed
Message-ID: <20240404-de7d09060b134d467e437fcf@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-12-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-12-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_051938_113851_B55B9504 
X-CRM114-Status: GOOD (  26.14  )
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

On Wed, Apr 03, 2024 at 01:04:40AM -0700, Atish Patra wrote:
> Currently, we return a linux error code if creating a perf event failed
> in kvm. That shouldn't be necessary as guest can continue to operate
> without perf profiling or profiling with firmware counters.
> 
> Return appropriate SBI error code to indicate that PMU configuration
> failed. An error message in kvm already describes the reason for failure.
> 
> Fixes: 0cb74b65d2e5 ("RISC-V: KVM: Implement perf support without sampling")
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu_pmu.c     | 14 +++++++++-----
>  arch/riscv/kvm/vcpu_sbi_pmu.c |  6 +++---
>  2 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index b5159ce4592d..2d9929bbc2c8 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -229,8 +229,9 @@ static int kvm_pmu_validate_counter_mask(struct kvm_pmu *kvpmu, unsigned long ct
>  	return 0;
>  }
>  
> -static int kvm_pmu_create_perf_event(struct kvm_pmc *pmc, struct perf_event_attr *attr,
> -				     unsigned long flags, unsigned long eidx, unsigned long evtdata)
> +static long kvm_pmu_create_perf_event(struct kvm_pmc *pmc, struct perf_event_attr *attr,
> +				      unsigned long flags, unsigned long eidx,
> +				      unsigned long evtdata)
>  {
>  	struct perf_event *event;
>  
> @@ -454,7 +455,8 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>  				     unsigned long eidx, u64 evtdata,
>  				     struct kvm_vcpu_sbi_return *retdata)
>  {
> -	int ctr_idx, ret, sbiret = 0;
> +	int ctr_idx, sbiret = 0;
> +	long ret;
>  	bool is_fevent;
>  	unsigned long event_code;
>  	u32 etype = kvm_pmu_get_perf_event_type(eidx);
> @@ -513,8 +515,10 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>  			kvpmu->fw_event[event_code].started = true;
>  	} else {
>  		ret = kvm_pmu_create_perf_event(pmc, &attr, flags, eidx, evtdata);
> -		if (ret)
> -			return ret;
> +		if (ret) {
> +			sbiret = SBI_ERR_NOT_SUPPORTED;

I'm still not sure about this. I replied in the v4 thread about it.

Thanks,
drew

> +			goto out;
> +		}
>  	}
>  
>  	set_bit(ctr_idx, kvpmu->pmc_in_use);
> diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
> index 7eca72df2cbd..e1633606c98b 100644
> --- a/arch/riscv/kvm/vcpu_sbi_pmu.c
> +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> @@ -42,9 +42,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  #endif
>  		/*
>  		 * This can fail if perf core framework fails to create an event.
> -		 * Forward the error to userspace because it's an error which
> -		 * happened within the host kernel. The other option would be
> -		 * to convert to an SBI error and forward to the guest.
> +		 * No need to forward the error to userspace and exit the guest.
> +		 * The operation can continue without profiling. Forward the
> +		 * appropriate SBI error to the guest.
>  		 */
>  		ret = kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1,
>  						       cp->a2, cp->a3, temp, retdata);
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
