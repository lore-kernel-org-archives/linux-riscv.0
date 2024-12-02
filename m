Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C82AE69E9B
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 22:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ECJ1KB2b18JOKjZZalFG40Q2NPKlE/hGDYTHs5TeW44=; b=jE1wTNAjLSsMKE
	DDJfTpdnUdJ51rfU+7XgouL7vwIcrJrYvM5CgNV2svfmXishwIiXLN/7XxhLFTmKebXgeL08icOan
	2/XL/WM/WYn9Fi5FM9d3cgC+EPvAbkLTwjN1nYZ9cv7We7ibqkKNrES8C88mhtPv3LBuCWYBc1+8H
	rahAN4QCcEvn6ecQel/aX8Q9NQz0ktjUWQbl95EEDsIJBsuSEV5MsZDx03F7tmhN7dBCnnd6R4agF
	CeRJW9sgRGwybutG7oDlQ+B3pTx3TdBuTQWiTOqqLavZ6LEXm7Pkfu1NkYdmAIHiFWR+aPk8PPK+/
	mF8wfqAzNk2M4IIwGYLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIFF8-00000007fWn-3NzJ;
	Mon, 02 Dec 2024 22:50:14 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIFE8-00000007fNI-3urx
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 22:49:14 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3a77c066a15so18170925ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Dec 2024 14:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1733179751; x=1733784551; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fURT0toHjcy+ckEXrUmwcruMUsZPdjbEVGK7GwErbNE=;
        b=HEGLI+QT6Rw6p/k/kQK/NV7rtEXkvcrNDsZlEtcueHKMi5B3VRQyj6cAMl1XyWrkb9
         T+sNHcglhePeutlJ2AMFzMzcZmdTcO46pykQ9AjCsZda8rBsBIa/YzWV8j/6+Nsr8y6C
         eByWjHkA5Np0TyVATUa45BEnPggkbp1qmtCA+Z1JkR4SF/dFuOPJ43xyTMBlh167wYjK
         YnIcN4OEijHjq88hQ8sZJFCQkQRYa/qmF2MSgr5rHmS0GyZjvEPbL/YaCpK7YrgjW2/M
         tFjRRbROP1AY0WLe7v/FH8+aqZb+RWMWvjjZV7L2CKgJ4pTw26HsQn3o5ohcJlzE9HOm
         O83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733179751; x=1733784551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fURT0toHjcy+ckEXrUmwcruMUsZPdjbEVGK7GwErbNE=;
        b=qQF8NdawqQQLBIOVp8JKxHpXr5z0L22leZbatJvCvHR+VTB5m4knPeGzGu2+FKL0Jt
         D5ZBw5dJ7GDwCyuqbliQGFETIyrD7figYpsCF5pS/QwVS8sCJhL166Z4lzOcF1Ro61qO
         ssYFacYriD3jQRt78z4p/w0N4yThMk/EQOyoKtzWOjunAeBnE114GtgmJBNnP3wil4VN
         s0ZcNFAdxsicfUbkMLwxsd6SwIgGhY/6igY1De5gL+wklUlE7jNaZYwu/WhQOuR+6Z3J
         R+QDi8IheS5g3/1VMzU4siIq0Vs2ghy9+26Fq3ewTcYv+5kMOzU6DfdICWJR7v6Lla5C
         Ekog==
X-Gm-Message-State: AOJu0YyUEZdHxXS1zxY5Y+d7pu0+0CdGx5he6Pi3wlpnk1mzIljQbhuE
	rB4vovkFTzrk0WNLGXrD39x0Uc39QBWydbExyhkMFWjv6Fs494BThn4A3rURGZwVzowbsEOXncD
	z
X-Gm-Gg: ASbGncspUe4CQTNC2jZGS+hVj/Oa3Sbw2DngTB+vGuLSExiebVlTIj/5/8qgseN60RU
	fIVE3/4hUEay+q63p7A4bTRwMH4H5EY3Ew7su+myZnrJRF6wdWjKvVgpt8zZPMEd1N4XqA9vkQn
	ZDZFbuFNyG1jD9vaqQJfzKIxZjdNhHf4rUb0KSRdUpSUCVThpb7EYpKmHYjxwM5xPoLdCRyQzoG
	lIcVgS95/BWtQEsFNhXA5NbH69PPlAf34uRsF6hBXijnv1GZ8lkjmxcdNezFnbdoSLe3y/dXz4=
X-Google-Smtp-Source: AGHT+IF9tXYZOtmonlaAqjdjkiR3RpZurv0DzZ0bFu7NZtqj+dCVIe1TaFCSnbY1pyQjqWZh355Bpg==
X-Received: by 2002:a92:c54f:0:b0:3a7:8720:9de5 with SMTP id e9e14a558f8ab-3a7f9a36198mr3019085ab.1.1733179751641;
        Mon, 02 Dec 2024 14:49:11 -0800 (PST)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e230e5f1easm2357604173.95.2024.12.02.14.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 14:49:10 -0800 (PST)
Message-ID: <0a4a569e-dfab-4aed-90df-2fe9719a3803@sifive.com>
Date: Mon, 2 Dec 2024 16:49:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] drivers/perf: riscv: Implement PMU event info
 function
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-5-a4f9691421f8@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20241119-pmu_event_info-v1-5-a4f9691421f8@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_144912_967631_EC54C4ED 
X-CRM114-Status: GOOD (  29.69  )
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
> With the new SBI PMU event info function, we can query the availability
> of the all standard SBI PMU events at boot time with a single ecall.
> This improves the bootime by avoiding making an SBI call for each
> standard PMU event. Since this function is defined only in SBI v3.0,
> invoke this only if the underlying SBI implementation is v3.0 or higher.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h |  7 +++++
>  drivers/perf/riscv_pmu_sbi.c | 71 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 78 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 3ee9bfa5e77c..c04f64fbc01d 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -134,6 +134,7 @@ enum sbi_ext_pmu_fid {
>  	SBI_EXT_PMU_COUNTER_FW_READ,
>  	SBI_EXT_PMU_COUNTER_FW_READ_HI,
>  	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
> +	SBI_EXT_PMU_EVENT_GET_INFO,
>  };
>  
>  union sbi_pmu_ctr_info {
> @@ -157,6 +158,12 @@ struct riscv_pmu_snapshot_data {
>  	u64 reserved[447];
>  };
>  
> +struct riscv_pmu_event_info {
> +	u32 event_idx;
> +	u32 output;
> +	u64 event_data;
> +};
> +
>  #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
>  #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
>  /* SBI v3.0 allows extended hpmeventX width value */
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index f0e845ff6b79..2a6527cc9d97 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -100,6 +100,7 @@ static unsigned int riscv_pmu_irq;
>  /* Cache the available counters in a bitmask */
>  static unsigned long cmask;
>  
> +static int pmu_event_find_cache(u64 config);

This new declaration does not appear to be used.

>  struct sbi_pmu_event_data {
>  	union {
>  		union {
> @@ -299,6 +300,68 @@ static struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
>  	},
>  };
>  
> +static int pmu_sbi_check_event_info(void)
> +{
> +	int num_events = ARRAY_SIZE(pmu_hw_event_map) + PERF_COUNT_HW_CACHE_MAX *
> +			 PERF_COUNT_HW_CACHE_OP_MAX * PERF_COUNT_HW_CACHE_RESULT_MAX;
> +	struct riscv_pmu_event_info *event_info_shmem;
> +	phys_addr_t base_addr;
> +	int i, j, k, result = 0, count = 0;
> +	struct sbiret ret;
> +
> +	event_info_shmem = (struct riscv_pmu_event_info *)
> +			   kcalloc(num_events, sizeof(*event_info_shmem), GFP_KERNEL);

Please drop the unnecessary cast.

> +	if (!event_info_shmem) {
> +		pr_err("Can not allocate memory for event info query\n");

Usually there's no need to print an error for allocation failure, since the
allocator already warns. And this isn't really an error, since we can (and do)
fall back to the existing way of checking for events.

> +		return -ENOMEM;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
> +		event_info_shmem[count++].event_idx = pmu_hw_event_map[i].event_idx;
> +
> +	for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
> +		for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
> +			for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++)
> +				event_info_shmem[count++].event_idx =
> +							pmu_cache_event_map[i][j][k].event_idx;
> +		}
> +	}
> +
> +	base_addr = __pa(event_info_shmem);
> +	if (IS_ENABLED(CONFIG_32BIT))
> +		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO, lower_32_bits(base_addr),
> +				upper_32_bits(base_addr), count, 0, 0, 0);
> +	else
> +		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO, base_addr, 0,
> +				count, 0, 0, 0);
> +	if (ret.error) {
> +		result = -EOPNOTSUPP;
> +		goto free_mem;
> +	}
> +	/* Do we need some barriers here or priv mode transition will ensure that */

No barrier is needed -- the SBI implementation is running on the same hart, so
coherency isn't even a consideration.

> +	for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++) {
> +		if (!(event_info_shmem[i].output & 0x01))

This bit mask should probably use a macro.

> +			pmu_hw_event_map[i].event_idx = -ENOENT;
> +	}
> +
> +	count = ARRAY_SIZE(pmu_hw_event_map);
> +
> +	for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
> +		for (j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
> +			for (k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++) {
> +				if (!(event_info_shmem[count].output & 0x01))

Same comment applies here.

Regards,
Samuel

> +					pmu_cache_event_map[i][j][k].event_idx = -ENOENT;
> +				count++;
> +			}
> +		}
> +	}
> +
> +free_mem:
> +	kfree(event_info_shmem);
> +
> +	return result;
> +}
> +
>  static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
>  {
>  	struct sbiret ret;
> @@ -316,6 +379,14 @@ static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
>  
>  static void pmu_sbi_check_std_events(struct work_struct *work)
>  {
> +	int ret;
> +
> +	if (sbi_v3_available) {
> +		ret = pmu_sbi_check_event_info();
> +		if (!ret)
> +			return;
> +	}
> +
>  	for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
>  		pmu_sbi_check_event(&pmu_hw_event_map[i]);
>  
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
