Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F935C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 14:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xy/lhKlDd1lL1HKwQ6o0VgEzVoglnluN8ZzAN/fGSCg=; b=rHESIDbdovzuE+
	H1/MTrnn1CC/YPwMiQlGuyXLpD4Ll8oJqM1IQoldUhqMSmOD1fdtB7pc3T0Q3w+oyP4fYmXF6zkSB
	/0RuOQpCDON89kXWGIQEO6x/HxE4FoW7ivmYNJKr00o0PvAXLpGPZMk5xUwa9EO1Hx13xInwxMOxI
	gmPn3mdJFqigwioXUqc/sRDSYGEddRoABIzd+ofrq/7OT1AeCYhsVkTWRfPtk4LKqW+hIreJ8dO5a
	fFuYRvKk3S6KE7QQJYo3JpdYK4sfO4RO7SXrnRV2RpebmtEJfLVeUqUpyKYPYzDsnhqrjTxEF8bLx
	a/NNjQLA2eO5q3XKkRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4MW9-0005o5-1S;
	Wed, 31 May 2023 14:09:37 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4MW6-0005md-1c
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 14:09:35 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-30ae61354fbso3232715f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 May 2023 07:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685542170; x=1688134170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pgpyzmnbNHAseyCM+s0XsB0KjofBbxw68PBCInlqrLM=;
        b=oxzmFA70Bjtlz6BsRl7Er91ErjmIoeIoblFWyRv4dTc3OiWmG2pPwau86hZLSdyF+x
         o/en/dxj3KIaEe2mRLZqODiQX+Fg+JSppTKF39rcISQ02VRyDntm1u1tkc/glQkXxXhh
         EaiHBTIEfxCSC7I4LMcET+AewMo97ui82kaVsMEd7Ab8ZHEKv8SF/Xsnqc94oJk3BzeN
         i2yd/18czjL4o65TJ3sZKe+lBjgFghQNfjWmqI/7IwN3IC290cPe1bGt6TzPvtWv2jX4
         ehNH+GVJmKOfUJCeQKY/KPO98LY19AkaBF/5VcNefetloyimk0xYMoTcdzEvgx+HftjY
         /BSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685542170; x=1688134170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgpyzmnbNHAseyCM+s0XsB0KjofBbxw68PBCInlqrLM=;
        b=PD7C9cprgBYRFAR9VMLLoOHXznV4mV8qt0U8wvWKycKmkJOi00wV3JGqUkbCgcODT1
         DV9Jjo4ZzCbOrzlpa0LmTH7fDRf7Z+AFLM4rjfqEDKfZH9s29en7+mqrHdyaxGGifi3T
         C4bwrByqyjKmnb3h0kIJzD/xbgHlH50d65Wao0H542mBedWA8ivrBQq5TmPrp8FP1JN3
         km/V4aaRKJmrO69Es4xSaisXjxpt23Dh0CUQuQGD+aqTURI45t2vaCQRq6dIUKGuwiXE
         TWv6TFuJaC/rPH9Fzusd/q0uPkIE3fWZvaehevnSAKW57iftX3O1aqbfoY9AM5Nov4wb
         dSDA==
X-Gm-Message-State: AC+VfDzYDTt7ShChNWPX0D72eX3XNcxQ6TrQ6NuygMso17tqeFTgmGgg
	+C0QpvynhPiquWJ4JpPcJ0CP7Q==
X-Google-Smtp-Source: ACHHUZ6/5u1aIeEPR87Cph6/LuYqwzkXH6Ggsh21iSthCsoK8ecfPiKMDhYwuo0sJqTdGafvLc34yA==
X-Received: by 2002:a5d:526e:0:b0:309:50e7:7c3 with SMTP id l14-20020a5d526e000000b0030950e707c3mr4408962wrc.63.1685542170038;
        Wed, 31 May 2023 07:09:30 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id d15-20020a056000114f00b0030af72bca98sm4800839wrx.103.2023.05.31.07.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 07:09:29 -0700 (PDT)
Date: Wed, 31 May 2023 16:09:28 +0200
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
Subject: Re: [PATCH v2 04/10] drivers: perf: Rename riscv pmu driver
Message-ID: <20230531-49ed4c2054db0abbacd03632@orel>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-5-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230512085321.13259-5-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_070934_537384_E391A280 
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

On Fri, May 12, 2023 at 10:53:15AM +0200, Alexandre Ghiti wrote:
> In addition to being more pretty, it will be useful in upcoming commits
> to distinguish those pmu drivers from the other pmu drivers.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_legacy.c | 2 +-
>  drivers/perf/riscv_pmu_sbi.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
> index 0d8c9d8849ee..ffe09d857366 100644
> --- a/drivers/perf/riscv_pmu_legacy.c
> +++ b/drivers/perf/riscv_pmu_legacy.c
> @@ -95,7 +95,7 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
>  	pmu->ctr_clear_idx = NULL;
>  	pmu->ctr_read = pmu_legacy_read_ctr;
>  
> -	perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
> +	perf_pmu_register(&pmu->pmu, RISCV_PMU_LEGACY_PDEV_NAME, PERF_TYPE_RAW);
>  }
>  
>  static int pmu_legacy_device_probe(struct platform_device *pdev)
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 70cb50fd41c2..3b0ee2148054 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -897,7 +897,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto out_unregister;
>  
> -	ret = perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
> +	ret = perf_pmu_register(&pmu->pmu, RISCV_PMU_PDEV_NAME, PERF_TYPE_RAW);

Should we include "sbi" in this name?

>  	if (ret)
>  		goto out_unregister;
>  
> -- 
> 2.37.2
> 

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
