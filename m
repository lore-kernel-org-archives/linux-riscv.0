Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25D7E69E99
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 23:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K+9wHW6eEQz6wnYDtcjSDh1V9X3PmxXVlpD42s7fQ80=; b=ADLcur/evhSgyt
	SIhT3uESeRuTjIlecNA3lxTfdZN3da9rwnTOdiaNHXdnsXXqncECxpYwt878gquRBqxs5NFAELHEr
	zEwEgQG6B4tZWEJeZ0sXBosDbvHxQpx1TcvUKpaCO+nKQZ/ePMMne6H3OqBJTeGtx+/iYk/T+VQcX
	uMsMSNbwTpKE+bPGs8vHWxdzQp1t1GJYLTB+Me/7u5i1LZyQQiKWVzC4bwldN7rP34Z8s5MbdgAOd
	X7A3mxZ4GPutnT6YjcO+i2MnWcD9FY1XdPHrRsExUFSnV1SRNPKpILQVjwqWK3CRLEScduDHwVCZP
	yiARB7jQyRWX76ypj3bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIFRH-00000007glL-1MEW;
	Mon, 02 Dec 2024 23:02:47 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIFRC-00000007gjw-4BDa
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 23:02:45 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-71d537b50beso2244566a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Dec 2024 15:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1733180562; x=1733785362; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TBGqkK/v5Iev96wXKEIFiXllPqz6RLCGsNpAQ8PdYPY=;
        b=P1+02iRz1XRaEUcObaU9nJ9B35k9Eju7W3rJglxLt/Xifs+fg/Y1JMo6gEZi0VhdcV
         rMuun0VULXPuUnHZNaT3949YcUGy0JnP9G9ZgSgIaLgN6pGiebuAA9h7aHB9f6ypzBZW
         2+Y+++nqb8U5L4LE3n3kWlrQt4N15/51SQ3xr4cGn5Yb3NaYcOVoGVwYWX7NQPDMDnma
         2d0r04iRcMMtlHHi1E8eM7qakoUcsm7jAJqYSdFqVVVulQj5hOMQptZNQ4nvZ1ZuI/l7
         /yCTHf5oFBq2YWMiy8mAgHURwLZitKNZeaAYO47PYh4dwa3wcB06S3lguS03WzkyrJhW
         utgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733180562; x=1733785362;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBGqkK/v5Iev96wXKEIFiXllPqz6RLCGsNpAQ8PdYPY=;
        b=pVLR3wVOVhKB1bE/PWIGrkcjbyK1PEXXJUldWLXUsL5DA1mX640FxsI+VuR72fQP0s
         u1EKO8zmmWStYfihtVxEFuv4JAVtfQ0a7uQLyWVCUUzDNau2+ztRQ/ommvKzJHQyHC4z
         zd0bKov99i7hi6DVFgCluTyVMn36C0dmjl6kMpR+AnCDYAfzIWapgEInjjIx5W9Ro6fN
         Gmy6X/iqAurPbDpBI2Y2Spbsk2Tnho21WCyzGNQ9eutxu4NCjaOn4ubltEhGzbQEGB7a
         A4shynR7C+Kk1HUKmzxBN5SgG1kDhW9hPcjJoqYCQvw7mToyFRq7tRwrWxISz7ikN00O
         88zg==
X-Gm-Message-State: AOJu0YyF+E6ZQFskU4ssxjsDF4ILY+t/fRix3O2JODfd0NB+wxUY1VgC
	AWko3U6st6vmpSDn569xgiyfazNLUTXXXNs768mJez2GsJat+hDYvEKZbcoMP6U=
X-Gm-Gg: ASbGncu40j7lOd3ADf8gePKNfJYU0q+rUZkK65IhjBWEXPYM1KzGALchFfvC5l7+mA6
	UyKqP0BjVfvQ+JwtkgX3SbOrOY8yVpr5IAox6yHEBtrgfDnf+0284TG5gSr/SHUBZMKLDlyDNjg
	YlrF2j8Vs7lNP6d3MPRMxYEcda1f6L/DCFisMpq4Pj2vINWrwoQBDg0Tuq07wJEY0d9ZpGzeNme
	BJQOHK9uxRUrNLV8qq4RGubeJJkrkfJtlYba8aO/v+bBzcO7BpSEI1fy9HwH2frmMdzrXWLIaQ=
X-Google-Smtp-Source: AGHT+IEv1JBbSaCa71BDRL05MtUtqi8CljIjDPjho0wurIfJyJM/U1viaWwUhmNhZ6XHgApvGm5kLA==
X-Received: by 2002:a05:6830:25d4:b0:710:fa7e:e002 with SMTP id 46e09a7af769-71dad6015c9mr537077a34.5.1733180561967;
        Mon, 02 Dec 2024 15:02:41 -0800 (PST)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e230de08f6sm2269346173.79.2024.12.02.15.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 15:02:41 -0800 (PST)
Message-ID: <8dc7e94c-4bf2-4367-8561-166bec6ec315@sifive.com>
Date: Mon, 2 Dec 2024 17:02:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] RISC-V: KVM: Implement get event info function
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-7-a4f9691421f8@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20241119-pmu_event_info-v1-7-a4f9691421f8@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_150243_865858_B82227BF 
X-CRM114-Status: GOOD (  22.75  )
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

Hi Atish,

On 2024-11-19 2:29 PM, Atish Patra wrote:
> The new get_event_info funciton allows the guest to query the presence
> of multiple events with single SBI call. Currently, the perf driver
> in linux guest invokes it for all the standard SBI PMU events. Support
> the SBI function implementation in KVM as well.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |  3 ++
>  arch/riscv/kvm/vcpu_pmu.c             | 67 +++++++++++++++++++++++++++++++++++
>  arch/riscv/kvm/vcpu_sbi_pmu.c         |  3 ++
>  3 files changed, 73 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> index 1d85b6617508..9a930afc8f57 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> @@ -98,6 +98,9 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
>  int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long saddr_low,
>  				      unsigned long saddr_high, unsigned long flags,
>  				      struct kvm_vcpu_sbi_return *retdata);
> +int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low,
> +				  unsigned long saddr_high, unsigned long num_events,
> +				  unsigned long flags, struct kvm_vcpu_sbi_return *retdata);
>  void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu);
>  void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
>  
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index efd66835c2b8..a30f7ec31479 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -456,6 +456,73 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
>  	return 0;
>  }
>  
> +int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low,
> +				  unsigned long saddr_high, unsigned long num_events,
> +				  unsigned long flags, struct kvm_vcpu_sbi_return *retdata)
> +{
> +	unsigned long hva;
> +	struct riscv_pmu_event_info *einfo;
> +	int shmem_size = num_events * sizeof(*einfo);
> +	bool writable;
> +	gpa_t shmem;
> +	u32 eidx, etype;
> +	u64 econfig;
> +	int ret;
> +
> +	if (flags != 0 || (saddr_low & (SZ_16 - 1))) {
> +		ret = SBI_ERR_INVALID_PARAM;
> +		goto out;
> +	}
> +
> +	shmem = saddr_low;
> +	if (saddr_high != 0) {
> +		if (IS_ENABLED(CONFIG_32BIT)) {
> +			shmem |= ((gpa_t)saddr_high << 32);
> +		} else {
> +			ret = SBI_ERR_INVALID_ADDRESS;
> +			goto out;
> +		}
> +	}
> +
> +	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, shmem >> PAGE_SHIFT, &writable);
> +	if (kvm_is_error_hva(hva) || !writable) {
> +		ret = SBI_ERR_INVALID_ADDRESS;

This only checks the first page if the address crosses a page boundary. Maybe
that is okay since kvm_vcpu_read_guest()/kvm_vcpu_write_guest() will fail if a
later page is inaccessible?

> +		goto out;
> +	}
> +
> +	einfo = kzalloc(shmem_size, GFP_KERNEL);
> +	if (!einfo)
> +		return -ENOMEM;
> +
> +	ret = kvm_vcpu_read_guest(vcpu, shmem, einfo, shmem_size);
> +	if (ret) {
> +		ret = SBI_ERR_FAILURE;
> +		goto free_mem;
> +	}
> +
> +	for (int i = 0; i < num_events; i++) {
> +		eidx = einfo[i].event_idx;
> +		etype = kvm_pmu_get_perf_event_type(eidx);
> +		econfig = kvm_pmu_get_perf_event_config(eidx, einfo[i].event_data);
> +		ret = riscv_pmu_get_event_info(etype, econfig, NULL);
> +		if (ret > 0)
> +			einfo[i].output = 1;

This also needs to write `output` in the else case to indicate that the event is
not supported; the spec does not require the caller to initialize bit 0 of
output to zero.

Regards,
Samuel

> +	}
> +
> +	kvm_vcpu_write_guest(vcpu, shmem, einfo, shmem_size);
> +	if (ret) {
> +		ret = SBI_ERR_FAILURE;
> +		goto free_mem;
> +	}
> +
> +free_mem:
> +	kfree(einfo);
> +out:
> +	retdata->err_val = ret;
> +
> +	return 0;
> +}
> +
>  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu,
>  				struct kvm_vcpu_sbi_return *retdata)
>  {
> diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
> index e4be34e03e83..a020d979d179 100644
> --- a/arch/riscv/kvm/vcpu_sbi_pmu.c
> +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> @@ -73,6 +73,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  	case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
>  		ret = kvm_riscv_vcpu_pmu_snapshot_set_shmem(vcpu, cp->a0, cp->a1, cp->a2, retdata);
>  		break;
> +	case SBI_EXT_PMU_EVENT_GET_INFO:
> +		ret = kvm_riscv_vcpu_pmu_event_info(vcpu, cp->a0, cp->a1, cp->a2, cp->a3, retdata);
> +		break;
>  	default:
>  		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
>  	}
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
