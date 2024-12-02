Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C11E69E99
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 22:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c1y1Sd8xv5xrG5o/cExet2r1q2NP2CClie4f0Oq4SEg=; b=tP7RhcePria616
	AacykUmMP2JPZTSOAxzkgkWEWeBTijPQN0OpyzS1H6IVWGqLfZa/ZmGQIbKIixIJYlX2WaQra/I32
	PHBXVhexwyT/u7bQxGHEVp1Fhsf42r4Ch9qNhguw3KBgE2IYWA1MAftkpp/40QoaYlW1S4mLBZb2P
	82PJt4H8TMs2PT9zW/4PdKGgoLwLTnba9Zr9LIohEw4KIdiyPMcbUWWhuUNsPpkE2Pkl0Ud3p5G13
	lcak6fI7fxz8hSVU2stKfmbINqDswfgGiG8TaRcKDpvfzlcXji1h+JE/PLG76+Q4s8Wfz7neyo66v
	Z4lJ57NdJ/OjqVGmUNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIF31-00000007eVZ-1IMz;
	Mon, 02 Dec 2024 22:37:43 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIF2y-00000007eUV-2uq6
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 22:37:41 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3a77562332aso17377885ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Dec 2024 14:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1733179059; x=1733783859; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PMzTzllEKVWPpxhY4qjTST2+tDlHfK8mSjvLBCDTSBA=;
        b=i4FmuU6jclr9jBUWf7lbSHlH9h917of0ysXsQw2yxOTXPko8lZ2zt/t+yxIxwXIF2V
         HxYa3k3tl04EAP/kTZWiYBj0LnGD/GWMCwmkHyaJAlMvK39pGJeJ+UXylOgOrrX+69/f
         VExWE5AT/L3Wrn59CYv1e4iQCSYi2WB46DdaMgJ9Rc6/EABzr+RNbYEIClef4OyFFzsV
         ngSs6XM2YSaxnXXM5oHICrEQZfzgOD7ZlohQnnd8PeV0eHLS9oreezghKPt3+1Lrj0w2
         IqnJQZSzMoSLomGTyvu0XwFDKLsqIaEGDMAoFf8sTpZje0V26RcCznNC8rGh2fxuc8xx
         30sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733179059; x=1733783859;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PMzTzllEKVWPpxhY4qjTST2+tDlHfK8mSjvLBCDTSBA=;
        b=cAElF58cAa3v9FVm7Aftx//xEALRh/Nniiez9/pTaG56201edVJhdhPiJcWt4rms4q
         0SJ3osfbol79TAkzLzCIR5vZEp9Tjq4uooDBfSEXklop/CfXbM8p6rMwxWvbxeqbqAQ3
         w39lJWIOLEp2y9qXDgtc0wPWfuHLw0fwmackfmJWlUnES0LAMXX2SZ5HSaFWaDgGq3n1
         gHqKBvicw9xdEzsHw9aY5bOBPlFfHvU0ywvothQoztvlvcEk/6TMuh1gocagU0kByS4E
         wXPRdw6SIVo8b4dW+2ET+wjh+PwlMiw0R4q077SkqeW9mwhsr6iUBdPCNKQwmbRdBJ+h
         N1Hw==
X-Gm-Message-State: AOJu0Yy4QdyC7MPXHaSFjOXz7UZC677AuhI8BPnGrUEw1SfoUwo4nkR7
	8AGHX+Tq0GagDZRMldF3buvNziXiiN/7Q/bacR72qiECPbGrH3svY7A7C+bI2Dk=
X-Gm-Gg: ASbGnctRny3Hu7BbiF16aMJO4YXiYI1lPxRtyhUF5pjAq34lMSjk8nMfVRO4TKfZPra
	s3ZbyDu70ORQcydYds4Nx2QrjcEplO40sNtHIDkE7dh7jazyDU4zWf2XF56SIFMqnMsJ2MGPidS
	R5FcEwEfBIHPpq3ghOEpTU94MhhNmFiUlq7il9zfGj+GeLS35sxRj9ky460OB5dpP+8thObUXlU
	N0xgQMG15hsKsvnOkwXUI/4TVsPwm/fY9m2fFO4FfQkmxDAmDTVGi+qgxQo5NiHzlmoA4LkGDc=
X-Google-Smtp-Source: AGHT+IHn6Lx4GjIuR+MSzoOaterYaBTQwRP1DNSP58qngN6mgKfAI1QR+jafEOWkEaXAab45plCQgQ==
X-Received: by 2002:a05:6e02:1a03:b0:3a7:e286:a56b with SMTP id e9e14a558f8ab-3a7f9a2fad6mr2575485ab.5.1733179059220;
        Mon, 02 Dec 2024 14:37:39 -0800 (PST)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a7ccc0dde5sm24963835ab.43.2024.12.02.14.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 14:37:38 -0800 (PST)
Message-ID: <e124c532-7a08-4788-843d-345827e35f5f@sifive.com>
Date: Mon, 2 Dec 2024 16:37:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drivers/perf: riscv: Add raw event v2 support
To: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-3-a4f9691421f8@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20241119-pmu_event_info-v1-3-a4f9691421f8@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_143740_761171_5B25AD52 
X-CRM114-Status: GOOD (  19.54  )
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
> SBI v3.0 introduced a new raw event type that allows wider
> mhpmeventX width to be programmed via CFG_MATCH.
> 
> Use the raw event v2 if SBI v3.0 is available.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h |  4 ++++
>  drivers/perf/riscv_pmu_sbi.c | 18 ++++++++++++------
>  2 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 9be38b05f4ad..3ee9bfa5e77c 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -159,7 +159,10 @@ struct riscv_pmu_snapshot_data {
>  
>  #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
>  #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
> +/* SBI v3.0 allows extended hpmeventX width value */
> +#define RISCV_PMU_RAW_EVENT_V2_MASK GENMASK_ULL(55, 0)
>  #define RISCV_PMU_RAW_EVENT_IDX 0x20000
> +#define RISCV_PMU_RAW_EVENT_V2_IDX 0x30000
>  #define RISCV_PLAT_FW_EVENT	0xFFFF
>  
>  /** General pmu event codes specified in SBI PMU extension */
> @@ -217,6 +220,7 @@ enum sbi_pmu_event_type {
>  	SBI_PMU_EVENT_TYPE_HW = 0x0,
>  	SBI_PMU_EVENT_TYPE_CACHE = 0x1,
>  	SBI_PMU_EVENT_TYPE_RAW = 0x2,
> +	SBI_PMU_EVENT_TYPE_RAW_V2 = 0x3,
>  	SBI_PMU_EVENT_TYPE_FW = 0xf,
>  };
>  
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 50cbdbf66bb7..f0e845ff6b79 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -59,7 +59,7 @@ asm volatile(ALTERNATIVE(						\
>  #define PERF_EVENT_FLAG_USER_ACCESS	BIT(SYSCTL_USER_ACCESS)
>  #define PERF_EVENT_FLAG_LEGACY		BIT(SYSCTL_LEGACY)
>  
> -PMU_FORMAT_ATTR(event, "config:0-47");
> +PMU_FORMAT_ATTR(event, "config:0-55");
>  PMU_FORMAT_ATTR(firmware, "config:62-63");
>  
>  static bool sbi_v2_available;
> @@ -527,18 +527,24 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
>  		break;
>  	case PERF_TYPE_RAW:
>  		/*
> -		 * As per SBI specification, the upper 16 bits must be unused
> -		 * for a hardware raw event.
> +		 * As per SBI v0.3 specification,
> +		 *  -- the upper 16 bits must be unused for a hardware raw event.
> +		 * As per SBI v3.0 specification,
> +		 *  -- the upper 8 bits must be unused for a hardware raw event.
>  		 * Bits 63:62 are used to distinguish between raw events
>  		 * 00 - Hardware raw event
>  		 * 10 - SBI firmware events
>  		 * 11 - Risc-V platform specific firmware event
>  		 */
> -
>  		switch (config >> 62) {
>  		case 0:
> -			ret = RISCV_PMU_RAW_EVENT_IDX;
> -			*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
> +			if (sbi_v3_available) {
> +				*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
> +				ret = RISCV_PMU_RAW_EVENT_V2_IDX;
> +			} else {
> +				*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
> +				ret = RISCV_PMU_RAW_EVENT_IDX;

Shouldn't we check to see if any of bits 48-55 are set and return an error,
instead of silently requesting the wrong event?

Regards,
Samuel

> +			}
>  			break;
>  		case 2:
>  			ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
