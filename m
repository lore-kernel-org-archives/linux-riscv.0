Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A45DC7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 14:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S8wfU/jSPU5A29WaA0VJDn+YWfwxiw38ZnUkP3Qos8w=; b=l3Efe9A5clMPko
	LPTp4BilhkLS7qxKvc14vIziFLDcl9RjNXeGSGpAwCnrU7WXzGePKNTDUv76CnHB8UMAqOCue0PyR
	8oJBPdg5wqA8JaX910rMNv+0Un43sclS80JCRZqH2Q/GJ4wt23h/LyLHbAWtoLRCMJ6glW4eCCX4k
	Nbiez6+Or+zAb43s5Ju1B7Sn/uC6iQZ7/8u7v3bOZufPbYTSJnoLyASqkJkF4s09yvymgovLBr74K
	23iuMBSxj2BbZqFh70M/zY4wNYk3EDOjN8EmP7+FQNTgqpTJFfwAfpBAs/35EA5AqDPeyxJto6fPN
	WHzr91YYNIqytVaDTehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Mnj-0008M3-0V;
	Wed, 31 May 2023 14:27:47 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Mnf-0008KT-19
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 14:27:45 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-30af56f5f52so1839771f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 May 2023 07:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685543259; x=1688135259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RZQfdwTjxzu5eTOjhFaQdoWnR4tOyHUVZ5eFRh/PK/c=;
        b=i9po3clbzEzJ5aZJXp7NVJtbYUD67qaN17suS1XLMBFHgOJIzR9JhzXZI9ZJYqcXzB
         kq/YSfSHb/X2mueCDVBd/l5QWcvxxlsWUUy88nrWZhX1ilWRtOOHcfJJ/0RS0jGhkCzU
         6X+sfKFKK8FPnIqVwRUZZgmv8K9q2bbO9TfEFrndYZKJKeK3GOqAsVNNVqmSiDNc0YfN
         XGf26cv2lKDNNG9JBv3HmW19c1DlT4oYqocIY9T/iywirimClxbKK+MiFqEKFT4zgJI+
         Fxa3nzHXP1JUOKnsWrX1F7xw2VqyGsPWm1LrAxNcnujbuy78IrhQ6p5qAn14yj5SvUqb
         wjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685543259; x=1688135259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZQfdwTjxzu5eTOjhFaQdoWnR4tOyHUVZ5eFRh/PK/c=;
        b=LOBgU9cLEHo/X9qxhpE9Y+pnZ9Byj4D0SKgHXqlKMDUjOepTxbwerPkHK2coG2bcCs
         41t5wc9ogWMqojSjYQRELHzSMGsiY18oszYYFNe7r2ld8IVQjVq7uE76N5uhuP7pkulv
         3w+fJt3vpN/JRFdMd+EGMBa//N3gjLaIs/m5+UZBhR6NB6DDEt+G+2CskZ1Y1eVFxnfj
         mF4Mz8lXDbGZ2Bj+E0J0gocnq2rKzaEfgblrZN4wUgazQrMpQES1slIQ2TCDIJqKWMg9
         m8a7gQSXSkR6Sn6le6c4y87TaRXae54CsaR2hD9dU61GtXLpFC/yipqBbO4TxBVp9Srd
         /9BA==
X-Gm-Message-State: AC+VfDyjQ3+QUF2D7/iyFiKW34e8GSsPV8ncLQP0bzhCVFPE2ATEHc95
	j+tfu+798UcTWoVVK+jOK1Mh+w==
X-Google-Smtp-Source: ACHHUZ7faXqorHCT28+gR8386YvZ5DrWoH2MDLT9ZyAvgjAEryPUGFAdHDgZlqhXBtiXlNhK+JXJbg==
X-Received: by 2002:adf:cd07:0:b0:30a:bf2b:e03c with SMTP id w7-20020adfcd07000000b0030abf2be03cmr4218382wrm.23.1685543259663;
        Wed, 31 May 2023 07:27:39 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600012c400b003047dc162f7sm7057593wrx.67.2023.05.31.07.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 07:27:39 -0700 (PDT)
Date: Wed, 31 May 2023 16:27:38 +0200
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
Subject: Re: [PATCH v2 06/10] drivers: perf: Implement perf event mmap
 support in the legacy backend
Message-ID: <20230531-705f2911e8d66938ece04905@orel>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-7-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230512085321.13259-7-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_072743_391189_618BBF01 
X-CRM114-Status: GOOD (  21.37  )
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

On Fri, May 12, 2023 at 10:53:17AM +0200, Alexandre Ghiti wrote:
> Implement the needed callbacks in the legacy driver so that we can
> directly access the counters through perf in userspace.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_legacy.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
> index ffe09d857366..f0f5bd856f66 100644
> --- a/drivers/perf/riscv_pmu_legacy.c
> +++ b/drivers/perf/riscv_pmu_legacy.c
> @@ -74,6 +74,31 @@ static void pmu_legacy_ctr_start(struct perf_event *event, u64 ival)
>  	local64_set(&hwc->prev_count, initial_val);
>  }
>  
> +static uint8_t pmu_legacy_csr_index(struct perf_event *event)
> +{
> +	return event->hw.idx;
> +}
> +
> +static void pmu_legacy_event_mapped(struct perf_event *event, struct mm_struct *mm)
> +{
> +	/* In legacy mode, the first 3 CSRs are available. */

Shouldn't this be

 /* In legacy mode, the first and third CSR are available. */

?

> +	if (event->attr.config != PERF_COUNT_HW_CPU_CYCLES &&
> +	    event->attr.config != PERF_COUNT_HW_INSTRUCTIONS)
> +		return;
> +
> +	event->hw.flags |= PERF_EVENT_FLAG_USER_READ_CNT;
> +}
> +
> +static void pmu_legacy_event_unmapped(struct perf_event *event, struct mm_struct *mm)
> +{
> +	/* In legacy mode, the first 3 CSRs are available. */

same comment

> +	if (event->attr.config != PERF_COUNT_HW_CPU_CYCLES &&
> +	    event->attr.config != PERF_COUNT_HW_INSTRUCTIONS)
> +		return;
> +
> +	event->hw.flags &= ~PERF_EVENT_FLAG_USER_READ_CNT;
> +}
> +
>  /*
>   * This is just a simple implementation to allow legacy implementations
>   * compatible with new RISC-V PMU driver framework.
> @@ -94,6 +119,9 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
>  	pmu->ctr_get_width = NULL;
>  	pmu->ctr_clear_idx = NULL;
>  	pmu->ctr_read = pmu_legacy_read_ctr;
> +	pmu->event_mapped = pmu_legacy_event_mapped;
> +	pmu->event_unmapped = pmu_legacy_event_unmapped;
> +	pmu->csr_index = pmu_legacy_csr_index;
>  
>  	perf_pmu_register(&pmu->pmu, RISCV_PMU_LEGACY_PDEV_NAME, PERF_TYPE_RAW);
>  }
> -- 
> 2.37.2
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
