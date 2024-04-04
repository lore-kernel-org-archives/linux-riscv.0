Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2679CD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 11:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGdV+VcbhpmnRlO5TvhWjE2R5C0kilNvcrpWqiE2nGY=; b=o0+YZOFVAzV7U4
	bJcqRZf3jYGqrhRk6YMc+Vx8sk2I9+lqmM/aqyQtXUiRfLJVnwhRT2vDLWvhI/j9k8lgO7IgSP3rz
	7r6ZyLdV5AYFOaI+rCtYUOjBwpZmmrpHWJefj0atBLBjfnhZxwezi5w8y6R2UCLfiwv0o0lUck7hA
	buTGOE5K2PsbX272gaixMX0A3bS19rr4g3YTCXSHxW8+bJHUXGD6bxSMrSipQYW3FqelZnqQmRAn+
	cjLYcaJTtYiShY8Ym7UDDiR9laTRGsF4Z3k9yRWOGfVXSZmKzH5zpGRaRclXAL7VOlxtLSsIybNUd
	3gPoQ5T2zwcUNHH5ZCMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLh2-00000002T9g-4A2Z;
	Thu, 04 Apr 2024 11:55:44 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLh0-00000002T8e-3Rmx
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 11:55:44 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-56e1baf0380so856965a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 04:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712231740; x=1712836540; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MggdLhtScC0WHbexLHVciQeNa0pa9gvC6PekQ9uXyqA=;
        b=NfIKd/iwEOMqqTtT0QDUw7lZs/J/FZ7U+zw9ocBi6oYHozsRNsN6tJTrbxWbPw0TvO
         cGK6F6tPDXvJPYRkbcT11oEDym3+J74xslQh5SoKF1K9LL7DeiBIyKGb9VOpl6cuDiZI
         mIb4wUinU3HU7S9QxqWKV2BF8dgSYa3M5TS2PjyRDt1I77lTImS6sFIOjE0dZZLpTlRg
         eEnowWrHh5xlqWut/pxRmAScA3U1U2kewbJC1xr172WX1tlU2XG0sC6xrcs0utMFAlSU
         14M/eo6il+yqdZi96IK6R0gNWPN9TdkZA94hrZenjJbWywCvE45H0aGQC6vTmh63/Sqg
         KxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712231740; x=1712836540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MggdLhtScC0WHbexLHVciQeNa0pa9gvC6PekQ9uXyqA=;
        b=nZ8x79Q0NRWQQwX2zXqqAXNLiy0ICiTZzTNv1MDFfuPj4hAU5lXs0C5/pf1xzSVAcw
         3/1CWiQ+1alhdTRjn2f6qFpmkl3QTOFqDkrq2eCyFkTp6R28+Pujx3DxHM/TsL0u4Bv+
         C8O0a1VvJzSrVa6eaugZFLWoMyIVENe+g982zvPXLQ+rSPRdiVcuQmNkqEXiMYzXyEIq
         RNv4nF/zMrdQcMxa4byY0u3iOG32CVkIOnReQ57O6IJqyS9vMlBbo8+clr7iTafSOaMu
         C3lHROEQ9tK3uzL7ulIJTqO0fpgMgApHjWc8C7JQgssygTXNCCaBCtKegWRUoCaO45ik
         mbQA==
X-Forwarded-Encrypted: i=1; AJvYcCW8b70oSSg8TsUZ0FwsUlVEUGelZ1rI2S+ywb3YesWEyzYV4S4lfrxFCJQMsmPToQoiW0V2xuyeLr8hRZOSd3qE7qGN1Hovg/Yw2lBlplP4
X-Gm-Message-State: AOJu0YxFEcdZ9n9MmwIb7+Hg2x06dgoBd5qoOdwFGT7+JTmesRlmMLXw
	iyh8YwW0NVmCa6E5EFC2bnFczAgNYDFFY5jkjNHtUMDxe91PVgpKC/6+jlpdSeA=
X-Google-Smtp-Source: AGHT+IHbQVR5kRtT5eSzAIoLj4j7ezmt7zb8/dHcxiB8NsIJPag3OPp4cCgWeUncPmPWCdmuF6F7iw==
X-Received: by 2002:a50:d71e:0:b0:56e:2393:cee4 with SMTP id t30-20020a50d71e000000b0056e2393cee4mr346003edi.9.1712231739832;
        Thu, 04 Apr 2024 04:55:39 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id a88-20020a509ee1000000b0056dc0e21a7dsm6860407edf.4.2024.04.04.04.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 04:55:39 -0700 (PDT)
Date: Thu, 4 Apr 2024 13:55:38 +0200
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
Subject: Re: [PATCH v5 07/22] drivers/perf: riscv: Fix counter mask iteration
 for RV32
Message-ID: <20240404-f10f72395cc0b25971541ece@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-8-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-8-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_045542_872424_D23EF34B 
X-CRM114-Status: GOOD (  22.34  )
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

On Wed, Apr 03, 2024 at 01:04:36AM -0700, Atish Patra wrote:
> For RV32, used_hw_ctrs can have more than 1 word if the firmware chooses
> to interleave firmware/hardware counters indicies. Even though it's a
> unlikely scenario, handle that case by iterating over all the words
> instead of just using the first word.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 8c3475d55433..82336fec82b8 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -771,13 +771,15 @@ static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
>  {
>  	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
>  	unsigned long flag = 0;
> +	int i;
>  
>  	if (sbi_pmu_snapshot_available())
>  		flag = SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT;
>  
> -	/* No need to check the error here as we can't do anything about the error */
> -	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, 0,
> -		  cpu_hw_evt->used_hw_ctrs[0], flag, 0, 0, 0);
> +	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++)
> +		/* No need to check the error here as we can't do anything about the error */
> +		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, i * BITS_PER_LONG,
> +			  cpu_hw_evt->used_hw_ctrs[i], flag, 0, 0, 0);
>  }
>  
>  /*
> @@ -789,7 +791,7 @@ static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
>  static noinline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_hw_evt,
>  						unsigned long ctr_ovf_mask)
>  {
> -	int idx = 0;
> +	int idx = 0, i;
>  	struct perf_event *event;
>  	unsigned long flag = SBI_PMU_START_FLAG_SET_INIT_VALUE;
>  	unsigned long ctr_start_mask = 0;
> @@ -797,11 +799,12 @@ static noinline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_hw_evt
>  	struct hw_perf_event *hwc;
>  	u64 init_val = 0;
>  
> -	ctr_start_mask = cpu_hw_evt->used_hw_ctrs[0] & ~ctr_ovf_mask;
> -
> -	/* Start all the counters that did not overflow in a single shot */
> -	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, 0, ctr_start_mask,
> -		  0, 0, 0, 0);
> +	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
> +		ctr_start_mask = cpu_hw_evt->used_hw_ctrs[i] & ~ctr_ovf_mask;
> +		/* Start all the counters that did not overflow in a single shot */
> +		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, i * BITS_PER_LONG, ctr_start_mask,
> +			0, 0, 0, 0);
> +	}
>  
>  	/* Reinitialize and start all the counter that overflowed */
>  	while (ctr_ovf_mask) {
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
