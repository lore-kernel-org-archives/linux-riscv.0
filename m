Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8294C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 14:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LR+NA7N39X9YxGOKhJOuJrGUw89GxVh9KSxfr6QbwAc=; b=jje7QQDK8pEFkx
	MmEP1UosEVigbb3o47u+mrU4TryP62WwukumRhdurXuafQWYo3xSeZ2pNWC+rvQ9FC85ggB1FE5BZ
	fN0lq5jjKtH5IrdIMMCVoHItXhH5RhMHy7SzPOzSPaTus8+WYO/4popFU/bPuXdhcTXKXkIr5hz8/
	LVqgatC6Q9Whc9cEENfe4larYxEtIiBVFABTVHIlLna3VqYDTjuDA42WU65ahQpuaXhX2Pne3cAQA
	cvP0ajgvzy7VYENp/9/824cdvTqipVWlU+RIx1P7XdiUBure93Kr+3VacbawVXSrqgQPRroydGi0S
	4pd0AKeMmiA4nvHzOkzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4MOI-0004Xw-21;
	Wed, 31 May 2023 14:01:30 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4MOG-0004WZ-1P
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 14:01:30 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-510f525e06cso9717865a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 May 2023 07:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685541687; x=1688133687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xV0p1cILT3YTZiyLBW2gM8L29pLx3no3Au0rCN/fAsw=;
        b=gUF0PwXYe8VCgDpxtcKPgbxsSJTGNkqXOtSRlywJlkOjfIJ4RSdfa2UVuR44ynbHFw
         NKNlI0h8WPdCGNa+vUoV2SDzv0cNPY++y1O+tSLD8DyL+GNgS0+nkfGF0a6i3YJH+wNV
         x4Bp+2sGbToPR2nr3y4lOVew5cRUUf0c0FY3u/GtWzluqFr8GLUv2Nk+8WCV1g20INdO
         UOcEZhwWwmk9YeNFWiDVZ/Gl2IRFnDzPIDxnaFptnayBtNdH1D8DIsrPvDfelv48ixSU
         FJeUMC0Jl9ubMq0XnS+bntiTO2K2CBvylp+N3GZIEWWPJ2nplN2VeXy5NQg1vGhN3qCH
         j4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685541687; x=1688133687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xV0p1cILT3YTZiyLBW2gM8L29pLx3no3Au0rCN/fAsw=;
        b=Ko1olzUSYTWV8F8DE6H1LUu8R2TEmsMpljme0eZ9mZgod78TKMptgiDbuVssWNljva
         6EhlVLGZAwsOirWwvGYUupYppZRQjoug9jQv4gQe7n5nSyty4Gu5QKvGJ/wfV4CRyC5Y
         8FsOYXrB15/E6t6ajTwn2dGzlvBSzCZ0Ow598NPCz7psbEwIVawQ7VUEFLvD0ZGdlAxa
         4e8mqjB3BWmjvrAIG3QQWhRWxnTYcEvRpDUdsqGK6RaN/x9QEj5IiNvHDfq7SItFB0wD
         Jv9vyfFmp9b3RRDCCREzX5vkt2QSmpVwODizlLkGmStRA3QkzNXp4iwpaixWljQo8rle
         uyYQ==
X-Gm-Message-State: AC+VfDyqb/N0sRYpPprRN2o1+vDtIomLfcDh4C2SB2ysMJu31iB8lSWG
	j3o0c6D8vsP8TaxB4N+gGV7aAQ==
X-Google-Smtp-Source: ACHHUZ65P5pCqpKEk6KKg8Qqezxma5Yv53pnk0dfCkZMl5e4aOBfLb2ibQkhM3VpJR/whOzqfU8jYA==
X-Received: by 2002:a17:907:72cb:b0:974:1d8b:ca5e with SMTP id du11-20020a17090772cb00b009741d8bca5emr5212006ejc.14.1685541686880;
        Wed, 31 May 2023 07:01:26 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id e6-20020a170906504600b00965ac1510f8sm8966578ejk.185.2023.05.31.07.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 07:01:26 -0700 (PDT)
Date: Wed, 31 May 2023 16:01:25 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Ian Rogers <irogers@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 03/10] riscv: Make legacy counter enum match the HW
 numbering
Message-ID: <20230531-ddb2d631e152526102f41d5e@orel>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-4-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230512085321.13259-4-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_070128_491659_84D5578E 
X-CRM114-Status: GOOD (  19.78  )
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

On Fri, May 12, 2023 at 10:53:14AM +0200, Alexandre Ghiti wrote:
> RISCV_PMU_LEGACY_INSTRET used to be set to 1 whereas the offset of this
> hardware counter from CSR_CYCLE is actually 2: make this offset match the
> real hw offset so that we can directly expose those values to userspace.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_legacy.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
> index ca9e20bfc7ac..0d8c9d8849ee 100644
> --- a/drivers/perf/riscv_pmu_legacy.c
> +++ b/drivers/perf/riscv_pmu_legacy.c
> @@ -12,8 +12,11 @@
>  #include <linux/perf/riscv_pmu.h>
>  #include <linux/platform_device.h>
>  
> -#define RISCV_PMU_LEGACY_CYCLE		0
> -#define RISCV_PMU_LEGACY_INSTRET	1
> +enum {
> +	RISCV_PMU_LEGACY_CYCLE,
> +	RISCV_PMU_LEGACY_TIME,
> +	RISCV_PMU_LEGACY_INSTRET
> +};

I guess this doesn't hurt, since these are just indices internal to this
driver, but it's a bit odd to also have a RISCV_PMU_LEGACY_TIME, when
the driver is only for cycle and instret, as its Kconfig help text says.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
