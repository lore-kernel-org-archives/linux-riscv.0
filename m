Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0553CC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Dec 2021 21:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eGoNv2ANJ9fEtk8YY2Gjvv396dYUp5y9GmkBry6ONGU=; b=A7lGhoDi4W3cTo
	BktmDeiejaFAoYurOu6XSWIgwZg1ak/G87TIhpTfckvShUxuM2bjdFC2HDSOaOhc/H2C1scdeze8i
	4i8CP3BUShi+qcgmfjXm6EY8dU1W3NmUefodHmrU3+u/FqI0xbl+2RHI1oGzmfw9kF5oiVpoo9Tfh
	gPjMiv5vsH0EWV/f9MSeyarQiBVx4R2b4maA+iua4GTOzqbFxcaIWnZpexNq7lM81KAvW6IwS+X+E
	5SpvECN0l07A9/7LB2F/eqLFQ4nKrH3rxGaqeaNoh6lJbO4k5AjfhjW12JqIb6n/cxtsVoBY/nPT5
	DWGbXxYAMUOfcC5O+qQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mv4b3-00EGgM-AJ; Wed, 08 Dec 2021 21:35:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mv4ap-00EGeL-S4
 for linux-riscv@lists.infradead.org; Wed, 08 Dec 2021 21:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638999314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CeXKyb655iDPT4A+Z5xrV0y1RP5TDI3g9ay8C+HT3HE=;
 b=XpT6tLIaOPwTzTjyHhpCyo72BxWndTauv5lwlLF8zLhY7SFOio064mxgRxG7JyB3RXK099
 8YvFvJpK3rg0EKjxMCHymyasbsn/COOPCbkLb+d3kMMSMBiOi8Ny1AW0bb+K2bEcTZ7Kr/
 LlyCJpIVABLHCuFab2QfMAWCRC4Qd9M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-545-ukHCrfUQO0WSeVosx-kfyw-1; Wed, 08 Dec 2021 16:35:12 -0500
X-MC-Unique: ukHCrfUQO0WSeVosx-kfyw-1
Received: by mail-wr1-f70.google.com with SMTP id
 k15-20020adfe8cf000000b00198d48342f9so736548wrn.0
 for <linux-riscv@lists.infradead.org>; Wed, 08 Dec 2021 13:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CeXKyb655iDPT4A+Z5xrV0y1RP5TDI3g9ay8C+HT3HE=;
 b=O8zarvXNZEoOnJNo8fP2eXfGvFPnQlwoqPJ9J8pnvAJDkcEKiw/SwD4nwOWvgdM3ty
 ean3F3aI9nHc8CS+O9RcPbP2JBQC6hHQcDrgCu5YLkGyCMtKF9fFXkI953FO0gN8e6ek
 2QCxQDhTHKUvg4FQOkx3nTyKFQtKUVLOdAJJ77EzqPsVammJGiN63f0DmYQqVLPsJoZM
 Nmom1jk333StsVTg2S32NpkGIVvuC1ui0arEDVPHGjbHntJtdJfrKOWgec9JFHH4IxZ+
 1lK5VZcxXdwojGjlksViCwQYkUubXnxV4tNRSu1Qlo/Z8EDZ4tbjkg2IgwKH2YMy/RMV
 5mgw==
X-Gm-Message-State: AOAM5337oIfo1tWvjcN9cZ/OFgxbKeMUUQrrFR9gnNk82IuWWZhSYYwL
 78JUtSoOZ+ev8hlzI+1HQbuXxVQ+Z0ZNbcyxqaaeAGXgoQmYmDoVsK7OaVRtl54rdkCO8jmEuSK
 YZpBHFd7IZH5IH5atSXLw6YkT0ohY
X-Received: by 2002:adf:e391:: with SMTP id e17mr1405898wrm.613.1638999311243; 
 Wed, 08 Dec 2021 13:35:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx56PDcQ9x4W4KPUCMLY+uuyJihSBiRNIwzduX5rQ30E/1Tn92gPDE60lBy2g7CxuCj7cySQA==
X-Received: by 2002:adf:e391:: with SMTP id e17mr1405757wrm.613.1638999309893; 
 Wed, 08 Dec 2021 13:35:09 -0800 (PST)
Received: from krava (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id b6sm7152187wmq.45.2021.12.08.13.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 13:35:09 -0800 (PST)
Date: Wed, 8 Dec 2021 22:35:07 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: German Gomez <german.gomez@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 acme@kernel.org, John Garry <john.garry@huawei.com>,
 Will Deacon <will@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/4] perf tools: Prevent out-of-bounds access to
 registers
Message-ID: <YbElC/fEgduFMAuo@krava>
References: <20211201123334.679131-1-german.gomez@arm.com>
 <20211201123334.679131-2-german.gomez@arm.com>
MIME-Version: 1.0
In-Reply-To: <20211201123334.679131-2-german.gomez@arm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jolsa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_133515_995876_9A2F8D0E 
X-CRM114-Status: GOOD (  23.49  )
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

On Wed, Dec 01, 2021 at 12:33:29PM +0000, German Gomez wrote:
> The size of the cache of register values is arch-dependant
> (PERF_REGS_MAX). This has the potential of causing an out-of-bounds
> access in the function "perf_reg_value" if the local architecture
> contains less registers than the one the perf.data file was recorded on.
> 
> Since the maximum number of registers is bound by the bitmask "u64
> cache_mask", and the size of the cache when running under x86 systems is
> 64 already, fix the size to 64 and add a range-check to the function
> "perf_reg_value" to prevent out-of-bounds access.
> 
> Signed-off-by: German Gomez <german.gomez@arm.com>

Acked-by: Jiri Olsa <jolsa@redhat.com>

thanks,
jirka

> ---
>  tools/perf/util/event.h     | 5 ++++-
>  tools/perf/util/perf_regs.c | 3 +++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
> index 95ffed663..c59331eea 100644
> --- a/tools/perf/util/event.h
> +++ b/tools/perf/util/event.h
> @@ -44,13 +44,16 @@ struct perf_event_attr;
>  /* perf sample has 16 bits size limit */
>  #define PERF_SAMPLE_MAX_SIZE (1 << 16)
>  
> +/* number of register is bound by the number of bits in regs_dump::mask (64) */
> +#define PERF_SAMPLE_REGS_CACHE_SIZE (8 * sizeof(u64))
> +
>  struct regs_dump {
>  	u64 abi;
>  	u64 mask;
>  	u64 *regs;
>  
>  	/* Cached values/mask filled by first register access. */
> -	u64 cache_regs[PERF_REGS_MAX];
> +	u64 cache_regs[PERF_SAMPLE_REGS_CACHE_SIZE];
>  	u64 cache_mask;
>  };
>  
> diff --git a/tools/perf/util/perf_regs.c b/tools/perf/util/perf_regs.c
> index 5ee47ae15..06a7461ba 100644
> --- a/tools/perf/util/perf_regs.c
> +++ b/tools/perf/util/perf_regs.c
> @@ -25,6 +25,9 @@ int perf_reg_value(u64 *valp, struct regs_dump *regs, int id)
>  	int i, idx = 0;
>  	u64 mask = regs->mask;
>  
> +	if ((u64)id >= PERF_SAMPLE_REGS_CACHE_SIZE)
> +		return -EINVAL;
> +
>  	if (regs->cache_mask & (1ULL << id))
>  		goto out;
>  
> -- 
> 2.25.1
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
