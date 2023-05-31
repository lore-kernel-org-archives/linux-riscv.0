Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D27C77B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 13:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQsxO/H/2YhRoBgIt0R/m0kwafpiRt1NAV6r2TxR3rE=; b=waLodrkgEX0gAq
	OAOAunkt30ZjR9n+bIfDyYHcemFWv9yOOuBOaMN1GLrzg/0CNtJHQnVa3K9iZeXFruxPAv9MelrBy
	POmIAZKyuRQnb+XBKN2B7R8nHg7RDdRaqA65jatgSUN4gDHiFWdDbXGfbcTsBYrbAgrCwxzYmyAzg
	kv9jPs83X+GWt2i0mrzVZyO8xF2R2dhAfNBMhd4jhph2YsH6rMoZeeNyQMvO/xLqgRsF9cr6fBiX6
	FyhN7pXQaJLRdQ7C5jjdNV2ncM0kMAl1imRkqF7jBxooBB+Pa5tcHDkMw0283744Fy0JpqU4oAWLv
	JGBvYg4qG93oRjoBFN8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4MHG-00033N-1O;
	Wed, 31 May 2023 13:54:14 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4MHD-000311-2t
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 13:54:13 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-30ad752f433so4075322f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 May 2023 06:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685541249; x=1688133249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zbb0XlzY1V6un7ssRQbevCYzvMDnOinL05UrfKmM4xc=;
        b=C6P+PAcESg9pjJuC1kShZkAMK9uNCuZZC59NjruVdLAT+QbK5Fb7OyTaHMvt9uPzWB
         XC6YjFkU+s1LzKNcLemCA5UvlagHiacGzTfiM/R2e6hfVvlyHtQgvcdf+G/89fBAyaFn
         al95wHlokLtDX33yAGCyGXGWNp+6upvH+JRfhP/MfAomjpj7ykZGP6APMEFunMG6Um4A
         Q0GkFyAbz3+Gec81W0jn0DXHKIAfGHWPlMPSF60xf9udnMyIdlRQDSu26bSGscPRElke
         Ee9HUot213bm0c1us5iqLgmtj9PemzfMxCRv29nNkaPrcub3t3g85duWFbefmqdgiqmB
         Q95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685541249; x=1688133249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zbb0XlzY1V6un7ssRQbevCYzvMDnOinL05UrfKmM4xc=;
        b=Wtvjk72UmIVWvzYHPbSdByahAZ0yJipWeVRuodQnH/yX8QMb3JC+mVOz2hR9ChCF9q
         pSH0GeBMRcBEbA718cn3x8ztOOmMqQRVUgyMx8LzI7Dm3ry9dZ1HhrY3hNNpcr26Mh8j
         iWSS6F68cAHmQZI6487NDiY+58OmSCvfc9r39e0V74kk7QhTfxTlUK/CY8CZeHLfV6OO
         uL3+AJJoVk5Yxcl1hgWSRejnXfrshvOdAx7xHEJRxEM+9jfUBr3KiZjNHkuG8li1Byem
         Vml/r345hKVCKx1y+yfl39kZCq5erBAoqR9gGAzTHr2DcfJqrSz7Iv58V+Ap2ZJXfbWc
         KlvA==
X-Gm-Message-State: AC+VfDynMZajXKAlz0LyRx4DdeDmiQd0hVi6KBS0ybj+FZVbDPfizFA+
	SOWXSSP+ACfzl21xpb6DpvTt3A==
X-Google-Smtp-Source: ACHHUZ65HnfYl06bZQf8YF6kP/w87wKf4hufmXMk6i3aLTcwxJQjR5kyaJJ5JQgRjhi7bOY5IOdgjg==
X-Received: by 2002:adf:e848:0:b0:2f0:2d92:9c81 with SMTP id d8-20020adfe848000000b002f02d929c81mr4030977wrn.19.1685541248998;
        Wed, 31 May 2023 06:54:08 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id i16-20020a05600011d000b0030aefa3a957sm7021247wrx.28.2023.05.31.06.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 06:54:08 -0700 (PDT)
Date: Wed, 31 May 2023 15:54:07 +0200
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
Subject: Re: [PATCH v2 01/10] perf: Fix wrong comment about default event_idx
Message-ID: <20230531-5678beb107af4b9805cbb611@orel>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230512085321.13259-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_065411_943317_07F8149A 
X-CRM114-Status: GOOD (  20.24  )
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

On Fri, May 12, 2023 at 10:53:12AM +0200, Alexandre Ghiti wrote:
> event_idx default implementation returns 0, not idx + 1.

The comment was correct until commit c719f56092ad ("perf: Fix and clean
up initialization of pmu::event_idx"). I'm not sure that warrants a fixes
tag, but maybe a reference in the commit message.

> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  include/linux/perf_event.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index d5628a7b5eaa..56fe43b20966 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -442,7 +442,8 @@ struct pmu {
>  
>  	/*
>  	 * Will return the value for perf_event_mmap_page::index for this event,
> -	 * if no implementation is provided it will default to: event->hw.idx + 1.
> +	 * if no implementation is provided it will default to 0 (see
> +	 * perf_event_idx_default).
>  	 */
>  	int (*event_idx)		(struct perf_event *event); /*optional */
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
