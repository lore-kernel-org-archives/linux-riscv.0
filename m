Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207FAEED60A
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 13:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XykpimJNjR+fEjZjLMVdVsBj71GJ2+tifuAQC8qB/wU=; b=Mkvryxf6+osPXu
	QqJ33OD0ouAK1kDJL824e9HsyDpJQAMlIKkGqyXSPT37B85X66XUX7/P2tuGmzIRaeLIBLoZg6LIz
	Ky60n379JQVZ00sePxmaXWBN9zgCidY0uRY6jc72MQJRXd7EXQzS+IB1cgd0yHzB9CJhgTuqg+/G2
	KVfvyAO4wRxYG0GFyswQzXg7ESKzYa4qQGd1juIXINlaluNZGYCtI7tJABPD8u483HpmL9QfWdBi1
	QWzv6wDTGU+1Y+qxYWScjrPZmNownTd/4bjkYQtugy3LSI0di+OujqUS9GWJSvGY+KuTkR3HGI88f
	6vpDMnQ82bauiwSyKgGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sokBX-0000000DFbt-0nE4;
	Thu, 12 Sep 2024 13:48:35 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sokBU-0000000DFbD-033b
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 13:48:33 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-70b2421471aso729607a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 06:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726148910; x=1726753710; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w2CFw9Dh7eA0HUa5RP+vtPlX+BTBhCqCROeh4QH4raM=;
        b=DBMpr3Br8FAg5v52vlKGPiqUueemjrGC0aH80GSdRRdjSPZy1olaoH+8ipwUZpDQ8i
         GSsLEz3Z88EXcK/o4texkJIXC/j6O29Tu/xKzxRmVJiCWFbaBQoBYKG4Zs+gjnH9sfQ7
         92TYGdSRLWEVKXJdCyj0hy0e1Htd7Mi7xFO3KZ+Iro0dja9zacB/HOv3sVN0SYl3rWjN
         LBIW+GSftSDX24X86ALYYCF3QJO/HijC61dngTEq+/FgjZQMYbnqvf9SPhxB0DbbKvQu
         FOkB/f1amyOj8cm7stN7v+kNtb5dd88wY4ormO3Z9rcnPvb1oruqHhwEkt4va7CKYGyu
         8bOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726148910; x=1726753710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w2CFw9Dh7eA0HUa5RP+vtPlX+BTBhCqCROeh4QH4raM=;
        b=nQROHSbSopqMm4RBFrdLx2BHMCaGICtFa2QN7DCd0e7gixppNFBbtFALtVAS+K196Z
         JlT4zJOW2dmB9KHrw/FQb4cBRLz4/arT0lgSeoK8QQdKbVIfVsuqQVSzw7msDF5LUi23
         protVqv8xJzYsk0Knet6M+ZdZQcc8G7pq4ns3qc8xnU1EIg5vCtQlT1PenVg9GdcE/4I
         RHlADaZ34+li0VJ7QeNDBXqJ5sv0ehTmqUViDEtocsRDMI7MicfhmhwYRn+VaGDnAvz7
         26reTNrwIovP/X5W6OZHwM2L2QwKu9PyBAx05rE8ehzsU4Q1/skRqITSTDpVLO60bvsn
         pnTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfngl65SdzaulY0tvAFv0J5GHOS0Fl3krYHRhUBD/urfLLU9jPFHfVaRVX29d9tOvNopl523VQWnGrGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4BwFY+Z/4/ljMvYQ5GSPwfp7qYRwU6j+FDCUuPhpWMitor3xr
	KQfVHw7LxRj97jLDb46YONszPY/CzJPWUgMIRoiDB5HR5WwbyhH1stITwSyk43M=
X-Google-Smtp-Source: AGHT+IFnSFGEp4QnM5zrUd3W8T2mcyVkqpsgf/oETBuvj4bOWWpvgvCsKaHw3hGKPCPPYRuiMA1YBA==
X-Received: by 2002:a05:6a21:3a44:b0:1cf:6e14:9f16 with SMTP id adf61e73a8af0-1cf75eeeafcmr4024068637.14.1726148910560;
        Thu, 12 Sep 2024 06:48:30 -0700 (PDT)
Received: from ?IPV6:2601:600:9001:ecb0::9267? ([2601:600:9001:ecb0::9267])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fc8506sm4612609b3a.5.2024.09.12.06.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 06:48:30 -0700 (PDT)
Message-ID: <605c618c-e044-457a-abd4-66db43999e64@rivosinc.com>
Date: Thu, 12 Sep 2024 06:48:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers/perf: riscv: Align errno for unsupported perf
 event
To: Pu Lehui <pulehui@huaweicloud.com>, linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>
References: <20240831071520.1630360-1-pulehui@huaweicloud.com>
Content-Language: en-US
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240831071520.1630360-1-pulehui@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_064832_215074_D3E6D483 
X-CRM114-Status: GOOD (  18.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 8/31/24 12:15 AM, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> RISC-V perf driver does not yet support PERF_TYPE_BREAKPOINT. It would
> be more appropriate to return -EOPNOTSUPP or -ENOENT for this type in
> pmu_sbi_event_map. Considering that other implementations return -ENOENT
> for unsupported perf types, let's synchronize this behavior. Due to this
> reason, a riscv bpf testcases perf_skip fail. Meanwhile, align that
> behavior to the rest of proper place.
> 
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>   drivers/perf/riscv_pmu_legacy.c | 4 ++--
>   drivers/perf/riscv_pmu_sbi.c    | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
> index 04487ad7fba0..93c8e0fdb589 100644
> --- a/drivers/perf/riscv_pmu_legacy.c
> +++ b/drivers/perf/riscv_pmu_legacy.c
> @@ -22,13 +22,13 @@ static int pmu_legacy_ctr_get_idx(struct perf_event *event)
>   	struct perf_event_attr *attr = &event->attr;
>   
>   	if (event->attr.type != PERF_TYPE_HARDWARE)
> -		return -EOPNOTSUPP;
> +		return -ENOENT;
>   	if (attr->config == PERF_COUNT_HW_CPU_CYCLES)
>   		return RISCV_PMU_LEGACY_CYCLE;
>   	else if (attr->config == PERF_COUNT_HW_INSTRUCTIONS)
>   		return RISCV_PMU_LEGACY_INSTRET;
>   	else
> -		return -EOPNOTSUPP;
> +		return -ENOENT;
>   }
>   
>   /* For legacy config & counter index are same */
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 44d3951d009f..169c5157b916 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -309,7 +309,7 @@ static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
>   			  ret.value, 0x1, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
>   	} else if (ret.error == SBI_ERR_NOT_SUPPORTED) {
>   		/* This event cannot be monitored by any counter */
> -		edata->event_idx = -EINVAL;
> +		edata->event_idx = -ENOENT;
>   	}
>   }
>   
> @@ -543,7 +543,7 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
>   		}
>   		break;
>   	default:
> -		ret = -EINVAL;
> +		ret = -ENOENT;
>   		break;
>   	}
>   

Lgtm. Thanks for aligning the error codes in other places.

Reviewed-by: Atish Patra <atishp@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
