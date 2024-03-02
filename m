Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96054C54798
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Mar 2024 08:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCMKXQzZx+lY6EdxLfE+k9nrMJemoKFp2PE7LDYu+uM=; b=utayqXHEvooPzM
	HRIiH1nlLpM8BKW8SUL1v5eobwrtjX9GSr9tYpdMEF89u2YA6XAZKn2cxjAmcxIRCJtxl+QL5r/LS
	8kp61pk6aQ5Cxxa62coMDGCrmXKQKlsxp/RBXPHdoc6DQjuj8wxcbciyXrORZKBpMJyIDsVghsBS9
	OtQO8Vr8JHXJeIx3mkcxQl80d4IoQEnaYxjh7m7kfe3R9A/9dVGFcKPKMGFGshIsfYS0/jfigAa85
	Mk+0Woy9cLvCWnMrAa32hZfi8k8fhb2mB5B0ZYwMqhpcbd2Ziy9/01Mg9vKeBN6BSboxgOKEdwNS+
	n39dovlLRrpT+Uh3bwIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgKXQ-000000037x7-08Kt;
	Sat, 02 Mar 2024 08:16:08 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgKXM-000000037wM-4A4v
	for linux-riscv@lists.infradead.org;
	Sat, 02 Mar 2024 08:16:06 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5133d276cbaso205959e87.2
        for <linux-riscv@lists.infradead.org>; Sat, 02 Mar 2024 00:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709367362; x=1709972162; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j+sRBWRjS//bpUjvTytLqzgwvFA5NfQ/0kKt6udHWnE=;
        b=PFRtWlvDRULLA4qdYPxwxMMZFXq+BiyowBADAHHPfL6Rmw2g4+WfGArIfu2xvW208l
         r9DPfEvDhLLUSd9/cLHqGz2YHLfBmMdBPkVpIQ75IMzWzTdEbbHrrxhWO2krVsdzdozx
         +dvdnUAxgDXDagaqrK5PFFhsQsZ1aKVktSGuNYVR6AkvwEn47YqttVRPkHZfmazEQGC+
         62AtXovU7M2FpK+6i4TYHHaBOyWtfINp6GAojs9JmDuyIQ/lCyqaO6jDANN6eIW8snu/
         8+02Zy7RzbywTcc6WOouRUL97anT0O919LLK0aGvgZMbR0CJC6gOifGgJBF+YP+frfVQ
         xgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709367362; x=1709972162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+sRBWRjS//bpUjvTytLqzgwvFA5NfQ/0kKt6udHWnE=;
        b=KQfGOr8fQGGGU0wlOKUdAbYzOfnhQUuPKi5mmDzzk2t3hhd1QVP6kyoeeb/J+bnkRQ
         Oq85DqkekoWGXvOtj2Vw4wn1MPt/2L6pLx9O5KSPO2LrEiTJMPyRci33e0jEuLzmNhj2
         AxEXnMklNX1GmY6SWrRpE4WmtjvzkNU0Uoh2940uaeKL7kUhj2ePZyZj/1gkuOQJ9xfc
         M+Cqg/sWs400++pbr4BT435uPKWYXCEdLsGUQvhd5HwnvNmbSUOymlTRrMFGqFsPNhaW
         7sHCxEGiJvWaq/0GnB1i0L7y5/D2f1iPeYK3Sdqc77rkjtuip3yp2hluWwxKMmExmXR7
         w0pQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0Ru8LVbISk7fpXUqga9fxI8v3i9d8kuF/m2mw5241Snzba1RdCTIc4UK/nJfJ5HpwdT/LhDuX1LKmb8knGtw3rdflIqzpKBb7qVH8mRAY
X-Gm-Message-State: AOJu0Yx+lhTPzHRxhUd+pDKixrymlevjhBFsRGe9X/4Kl9Th5aOq+/RV
	nWuOo+0mkWiFiwM2f8KeJpR47MeRIOatRONQ3USmnfAgSWv4sH49QKg0xmM/Za0=
X-Google-Smtp-Source: AGHT+IEWpcwm0FZQqjctycZ68/FbELxvzDOdEDS3pWw2MGcSKO0tFBODP1icN8h9TBp1bR13mcTvxA==
X-Received: by 2002:a05:6512:308f:b0:513:24b8:90cb with SMTP id z15-20020a056512308f00b0051324b890cbmr3714993lfd.0.1709367362484;
        Sat, 02 Mar 2024 00:16:02 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id h5-20020adf9cc5000000b0033dd9b050f9sm6617089wre.14.2024.03.02.00.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 00:16:01 -0800 (PST)
Date: Sat, 2 Mar 2024 09:15:55 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 07/15] RISC-V: KVM: No need to exit to the user space
 if perf event failed
Message-ID: <20240302-1a3c0df25f2422e1e6abecf3@orel>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-8-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240229010130.1380926-8-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240302_001605_065622_D5302558 
X-CRM114-Status: GOOD (  30.35  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 28, 2024 at 05:01:22PM -0800, Atish Patra wrote:
> Currently, we return a linux error code if creating a perf event failed
> in kvm. That shouldn't be necessary as guest can continue to operate
> without perf profiling or profiling with firmware counters.
> 
> Return appropriate SBI error code to indicate that PMU configuration
> failed. An error message in kvm already describes the reason for failure.

I don't know enough about the perf subsystem to know if there may be
a concern that resources are temporarily unavailable. If so, then this
patch would make it possible for a guest to do the exact same thing,
but sometimes succeed and sometimes get SBI_ERR_NOT_SUPPORTED.
sbi_pmu_counter_config_matching doesn't currently have any error types
specified that say "unsupported at the moment, maybe try again", which
would be more appropriate in that case. I do see
perf_event_create_kernel_counter() can return ENOMEM when memory isn't
available, but if the kernel isn't able to allocate a small amount of
memory, then we're in bigger trouble anyway, so the concern would be
if there are perf resource pools which may temporarily be exhausted at
the time the guest makes this request.

One comment below.

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
> index b1574c043f77..29bf4ca798cb 100644
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
> +			goto out;
> +		}
>  	}
>  
>  	set_bit(ctr_idx, kvpmu->pmc_in_use);
> diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
> index 7eca72df2cbd..b70179e9e875 100644
> --- a/arch/riscv/kvm/vcpu_sbi_pmu.c
> +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> @@ -42,9 +42,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  #endif
>  		/*
>  		 * This can fail if perf core framework fails to create an event.
> -		 * Forward the error to userspace because it's an error which
> -		 * happened within the host kernel. The other option would be
> -		 * to convert to an SBI error and forward to the guest.
> +		 * No need to forward the error to userspace and exit the guest

Period after guest


> +		 * operation can continue without profiling. Forward the

The operation

> +		 * appropriate SBI error to the guest.
>  		 */
>  		ret = kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1,
>  						       cp->a2, cp->a3, temp, retdata);
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
