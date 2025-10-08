Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689E0CAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 09:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFwb/JTHKzW8hkWK0FubOFx7sro8YoXxEvfsZ2bSZ/s=; b=1Si9ggvoChildSNQTEXHj7jR6r
	OF8aah0CxQqg6gwMJ0u4PSF6JrxlQzv+CPRKt1FLtSrHMWKcC5nA9Z6Oolj920wspowTQ/hh9gbWA
	J+YNOibvZIyBanuecmA/vYBSaXOAt2FxwmuxssHONRTmGrkCVDZ1jY5xVYLFuU4Tskqqex8UxtpRJ
	uW6kqosB2ZrCAqLiPWBA+djLOKvMGEN7fUpCJbPL99TI+cg/uTGjNK97rGHw73VuClRx3ohvgWFWH
	viHdq78QhyHsAchNiEtAnNSCAGRBeHqvCjzycK/b3i4ruI4fCxSY0ChWL31gD1xJhBMYURyiaQbrs
	OsfJVXzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6QGP-00000003YOG-0Yfs;
	Wed, 08 Oct 2025 09:15:13 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6QGM-00000003YNa-3gQl
	for linux-riscv@lists.infradead.org;
	Wed, 08 Oct 2025 09:15:12 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-782bfd0a977so6282101b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 02:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759914910; x=1760519710; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t0o0HS2/pqE2C3fiE9prxdfeC/X7f8Sic3V/E2Xltqg=;
        b=INaD63Jf1Wy65q3SjxCM9+Xd8Qudjafx/FxZG11uQCrV6+ymNgKR8uGmj9Qh+EZOfB
         AfF/d9JWP8X+pxEWuVTNVOAONqo35WFU1ouq87qDOY32es84diwAzGUlNdwJZ0StY5B0
         uzGao35QEsmUKckw4bAGSV4QevyVY3N5lgQfUNbapdeNvVHXQL7q6tB/aU38xCH7aA2U
         WVRDmmiBX0Q/X/rTMIqCG4SQQnNpAAjKozxVRoeZ6+GETaXi7M3S+CMKlf20ASqDah98
         4C3mRn2Z/Gu3ht+EGDcM/VjDmw8sYQIL29V05A8GORqaLZL+OLrDpa+99HM6qWTAv4LL
         fPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759914910; x=1760519710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t0o0HS2/pqE2C3fiE9prxdfeC/X7f8Sic3V/E2Xltqg=;
        b=W5+8MIakdasGdn0OPeA3gzDszPXiqZ2XaFvN1fA9/ReINAvazMSHt/WwvX+4zZESUE
         2wb+q4A9xZq7bF5YFxA56T4TvkwhVqZSeaPrMCPCGJwwLGJS1Foe7JQNW7k1XFZ0ySWP
         obrA5/GpljYVaDKO1fD0f3+L2anW4QbB2K0SuQMz6jv38vD2/CzmrlpoKW6B/gD9AHqK
         JQF7ijFt+TeEq8aPbuvxAoOc2OnYkqqDvmH/R5qZyiecPNqwi9CRnQ8bZNa1CrGG7aSA
         evy8s1GWip11SUdlCXvFKw449J1ELD2PJLZNSTJZeFUn6pP4b4FdLNUA+N1U/sVs/5kt
         2v4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTbY/blysnFX3YNa5TlXn2dxqVWngU9Qatx3zZjFAt4P5GvdCbFChMxqWffZtnwySrSD/TIFlNCwCVnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQhAs1tsoP1TOXhXSGGTq2WXV5RNlbZsOHiPig17Dv9J5LWtXA
	tB7JZYmog6+Z7XxtpqMAkLlDNccqFQ4BweGi7qoWZwQujNnni909MLuV
X-Gm-Gg: ASbGncsKebh8RQeILv5f1zM2WNYJD8mjjT956kUhICdNAEEwPLqINODB74eaMkocjwu
	MTg9qzdcmQbFXO8uRXFV8t48LXZHV8mR8KZDcq8eueIj8FZiaV8ShWEP18BJGv5kPt0f2oFSmPr
	sypIyfIUaoTmziqu7O2VMw1PJS7O/RQZdouOOZlKsgsCtCCqH0OqBLaHPnoQzQTw2S4xmsqctSE
	gdfY81/7NEPGwoksuN93eLmRAaGwr0Qpgq3FcMMwJG+OHAG9DbNCi2mMrKWuiyZ3lCnoVLdn3t7
	Or57iCdW39NNwXmxyJWKGM9PnooMN/sGd8tjVdgRxDJ0A+8duFyMmsquSVZWMfnMF4PGNitnf+2
	M9hka1k+VLknVvkOzb93aLE5rLZ4Pd+/NbqlCFMYUzdA3nts7
X-Google-Smtp-Source: AGHT+IGI8yNIZ7gFtVqGqjSBsgXT7k8WHZPT+PKq0o+GwTZSoNWXWSv1W5+dhSLB5r3FHDgEyjLvog==
X-Received: by 2002:a05:6a00:1884:b0:77f:416e:de8e with SMTP id d2e1a72fcca58-79387efb06cmr3125777b3a.26.1759914909822;
        Wed, 08 Oct 2025 02:15:09 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7932d06d3afsm3168434b3a.70.2025.10.08.02.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 02:15:09 -0700 (PDT)
Message-ID: <20edc3a9-2efe-4431-b198-f00b3940777c@gmail.com>
Date: Wed, 8 Oct 2025 02:13:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] rvtrace: Add functions to start/stop tracing on a
 component path
To: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Greg KH <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>
References: <20251002060732.100213-1-apatel@ventanamicro.com>
 <20251002060732.100213-5-apatel@ventanamicro.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20251002060732.100213-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_021510_934329_EE825B70 
X-CRM114-Status: GOOD (  21.20  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, Mayuresh Chitale <mchitale@ventanamicro.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Liang Kan <kan.liang@linux.intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 10/1/25 23:07, Anup Patel wrote:
> From: Mayuresh Chitale <mchitale@ventanamicro.com>
> 
> The perf driver framework needs to be able to start / stop all components
> in a trace component path during its operation. Add rvtrace_path_start()
> and rvtrace_path_stop() functions for this purpose.
> 
> Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   drivers/hwtracing/rvtrace/rvtrace-core.c | 44 ++++++++++++++++++++++++
>   include/linux/rvtrace.h                  |  6 ++++
>   2 files changed, 50 insertions(+)
> 
> diff --git a/drivers/hwtracing/rvtrace/rvtrace-core.c b/drivers/hwtracing/rvtrace/rvtrace-core.c
> index 7013d50ca569..109be40d4b24 100644
> --- a/drivers/hwtracing/rvtrace/rvtrace-core.c
> +++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
> @@ -614,6 +614,50 @@ static void rvtrace_release_path_nodes(struct rvtrace_path *path)
>   	}
>   }
>   
> +int rvtrace_path_start(struct rvtrace_path *path)
> +{
> +	const struct rvtrace_driver *rtdrv;
> +	struct rvtrace_component *comp;
> +	struct rvtrace_path_node *node;
> +	int ret;
> +
> +	list_for_each_entry(node, &path->comp_list, head) {
> +		comp = node->comp;
> +		rtdrv = to_rvtrace_driver(comp->dev.driver);
> +		if (!rtdrv->start)
> +			continue;
> +
> +		ret = rtdrv->start(comp);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(rvtrace_path_start);
> +
> +int rvtrace_path_stop(struct rvtrace_path *path)
> +{
> +	const struct rvtrace_driver *rtdrv;
> +	struct rvtrace_component *comp;
> +	struct rvtrace_path_node *node;
> +	int ret;
> +
> +	list_for_each_entry(node, &path->comp_list, head) {
> +		comp = node->comp;
> +		rtdrv = to_rvtrace_driver(comp->dev.driver);
> +		if (!rtdrv->stop)
> +			continue;
> +
> +		ret = rtdrv->stop(comp);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(rvtrace_path_stop);
> +
>   struct rvtrace_path *rvtrace_create_path(struct rvtrace_component *source,
>   					 struct rvtrace_component *sink,
>   					 enum rvtrace_component_mode mode)
> diff --git a/include/linux/rvtrace.h b/include/linux/rvtrace.h
> index f2174f463a69..e7bd335d388f 100644
> --- a/include/linux/rvtrace.h
> +++ b/include/linux/rvtrace.h
> @@ -273,10 +273,14 @@ struct rvtrace_path *rvtrace_create_path(struct rvtrace_component *source,
>   					 struct rvtrace_component *sink,
>   					 enum rvtrace_component_mode mode);
>   void rvtrace_destroy_path(struct rvtrace_path *path);
> +int rvtrace_path_start(struct rvtrace_path *path);
> +int rvtrace_path_stop(struct rvtrace_path *path);
>   
>   /**
>    * struct rvtrace_driver - Representation of a RISC-V trace driver
>    * id_table: Table to match components handled by the driver
> + * start:        Callback to start tracing
> + * stop:         Callback to stop tracing
>    * probe:        Driver probe() function
>    * remove:       Driver remove() function
>    * get_trace_id: Get/allocate a trace ID
> @@ -285,6 +289,8 @@ void rvtrace_destroy_path(struct rvtrace_path *path);
>    */
>   struct rvtrace_driver {
>   	const struct rvtrace_component_id *id_table;
> +	int			(*start)(struct rvtrace_component *comp);
> +	int			(*stop)(struct rvtrace_component *comp);
>   	int			(*probe)(struct rvtrace_component *comp);
>   	void			(*remove)(struct rvtrace_component *comp);
>   	int			(*get_trace_id)(struct rvtrace_component *comp,

I'd suggest add another function (*quiesce) or something like that. Trace
components have a tr??Empty bit that indicates trace has been all flushed
out. Also along the path when you do rvtrace_path_stop, you need to ensure
the source has stopped and quiescent before beginning to stop the sink.
Otherwise you'll get partial or corrupted trace. In essence, follow Control
Interface Spec 11.3 Enabling and Disabling. FYI: my userspace driver:
https://github.com/ganboing/riscv-trace-umd/blob/master/rvtrace/funnel.py#L223

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
