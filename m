Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CADC4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Apr 2024 00:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NfRv71kb5hIwLbAQRE3l/7+bIFugaw5dprCsDbOwe3s=; b=z/3SfvPEsV66kz
	24FE4pHiI24sSRZKX2bxf4QzkBhDw3UUSbgFFSWHTh54Yu5FKRKx8Pmu5OrY1NAcBH7iKyTL//hpd
	sdW8oy42ZpRgC1iVOb1PFuW90A+gY2IKQAf/sqbseOv2ocz0ZA/uvqFdVdUwr0dJhsODoQ7srf+5c
	vQCdOsOAYmCQXjdJwBmCaUpDQvqackgDbw55gAhoMbs91eIbM+tPbA8fplBTSwzLQmKILjjvkzECF
	JEEQGpl1+Tqvfd/RNR85U1w/ekT44IFHNSaHX8RjyU/jpLlBcWzQh1sWEtIOGJmH9rHexeEJwGRKF
	rzD15s843J/d/S/hzBYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxyjI-00000007RDC-1gAt;
	Sat, 20 Apr 2024 00:37:20 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxyjE-00000007RAJ-3HCu
	for linux-riscv@lists.infradead.org;
	Sat, 20 Apr 2024 00:37:18 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7d6c66b1e8aso105588539f.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 17:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1713573427; x=1714178227; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vhcLlrujCFL5jsjyr5K82BE+eIjl1NtlFO4BV5YJoss=;
        b=Wogeu5XT2xQK6/PP1Po2ibPHoH50TAXZGcWAdjKt0HBAyFIQAFVhw1FPND6edQCt1Y
         XpBz3ED/vaInnjNv5fMcOMnKGO271y8xBDnNOha+8Yc5nbvJ7I5ZntR991scdlZ3aTbW
         fdOKYWiuc9ouc2g9SaZTtbH78Antcz5BxWqiRojfqyUv0RE4AP3uV12PJWKe6ACaQ+nV
         GXKX6QadTMd5LYuFfuWoOwmDjjoaks6KyNRKArHltf6P/UOmp8I28YIehK4lMYxuaWKg
         r6QkuNYqCSruGJ+5t/7E4T+4vh+rl7zkk9Q6J0LscvIeY/FBaqdRJdaoLsJGwFcaZ+wf
         UACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713573427; x=1714178227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhcLlrujCFL5jsjyr5K82BE+eIjl1NtlFO4BV5YJoss=;
        b=ZLAKkdiYzvS32jLaxGT6fmBkk0XbPmlYFgjZvGKZmz2d+F/Au7novvInoJ2a1yRl5o
         PyAUvuo05lHLtarR+GZ4elDuhZhKwOcLNCfE3LYYKYugJ66aglBq2XgLpG4mWbD2GfkM
         vXIFCX1lgoIU4SRQtodWwox5eb9y0z6S7Gcz25CiMP6t8nWqifs9Ez/jyyw38XSsXquy
         Zz0WsUsp6OYqVxX07pBk0f7fZoGxohaLbYSBt9bl6rJX6cIauLCmmlzExF3zCSqESjY/
         9jfF2a17KmfZp0WmDmXjwCmvOuOQbbfwICrrhZqqx+PUdKBdRhPIdoMX82gc+J89NoXO
         hcFA==
X-Forwarded-Encrypted: i=1; AJvYcCX5Z6qdHcH0QplvLgvz8UjfiHVppTu2o8HE4gdpnWsUUIOy3ChfWqCjyV6f0X6+UymB47GJNhlf09zZUeFWwLl+qcF9DURoEzxK0H/ewbbf
X-Gm-Message-State: AOJu0Yyjtxmg5O3kxt+vEZK6l/k++AfXgsg9pxeL5eRrqGYysGmZQogE
	s76wGOanxoX1/8D74OxDK1NAHghJM8npJ00EmQElYrK2pdBR4JON8IoTC7DfIh0=
X-Google-Smtp-Source: AGHT+IHtrgB69K59tQny2VA0fIN2p3RzbXA0ZFndyB8V2oCD/yBJA3LSTlidjs+c33/HgDrnv1SH7A==
X-Received: by 2002:a05:6e02:1588:b0:36b:12f5:14dc with SMTP id m8-20020a056e02158800b0036b12f514dcmr4475746ilu.32.1713573426742;
        Fri, 19 Apr 2024 17:37:06 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.197])
        by smtp.gmail.com with ESMTPSA id u4-20020a056638134400b00484c44cf9cbsm953419jad.168.2024.04.19.17.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Apr 2024 17:37:06 -0700 (PDT)
Message-ID: <6fa06233-d572-48a7-a8ef-73a7c5879c06@sifive.com>
Date: Fri, 19 Apr 2024 19:37:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/24] drivers/perf: riscv: Fix counter mask iteration
 for RV32
To: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 Conor Dooley <conor.dooley@microchip.com>, Juergen Gross <jgross@suse.com>,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>,
 virtualization@lists.linux.dev, Will Deacon <will@kernel.org>, x86@kernel.org
References: <20240420151741.962500-1-atishp@rivosinc.com>
 <20240420151741.962500-9-atishp@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240420151741.962500-9-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_173716_882390_6C3DDCFF 
X-CRM114-Status: GOOD (  19.37  )
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

On 2024-04-20 10:17 AM, Atish Patra wrote:
> For RV32, used_hw_ctrs can have more than 1 word if the firmware chooses
> to interleave firmware/hardware counters indicies. Even though it's a
> unlikely scenario, handle that case by iterating over all the words
> instead of just using the first word.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index f23501898657..4eacd89141a9 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -652,10 +652,12 @@ static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
>  static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
>  {
>  	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
> +	int i;
>  
> -	/* No need to check the error here as we can't do anything about the error */
> -	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, 0,
> -		  cpu_hw_evt->used_hw_ctrs[0], 0, 0, 0, 0);
> +	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++)
> +		/* No need to check the error here as we can't do anything about the error */
> +		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, i * BITS_PER_LONG,
> +			  cpu_hw_evt->used_hw_ctrs[i], 0, 0, 0, 0);
>  }
>  
>  /*
> @@ -667,7 +669,7 @@ static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
>  static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
>  					       unsigned long ctr_ovf_mask)
>  {
> -	int idx = 0;
> +	int idx = 0, i;
>  	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
>  	struct perf_event *event;
>  	unsigned long flag = SBI_PMU_START_FLAG_SET_INIT_VALUE;
> @@ -676,11 +678,12 @@ static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
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

This is applying the mask for the first 32 logical counters to the both sets of
32 logical counters. ctr_ovf_mask needs to be 64 bits wide here, so each loop
iteration can apply the correct half of the mask.

Regards,
Samuel

> +		/* Start all the counters that did not overflow in a single shot */
> +		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, i * BITS_PER_LONG, ctr_start_mask,
> +			0, 0, 0, 0);
> +	}
>  
>  	/* Reinitialize and start all the counter that overflowed */
>  	while (ctr_ovf_mask) {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
