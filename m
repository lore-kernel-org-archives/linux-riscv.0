Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113F0C44521
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 07:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JUhL6FFMaUGandppVegrVD2kvGOl/JywfWknpEGvIrE=; b=017ETW8qcqKol8
	nJg/Qln/zDp+MTPMKTWbWUutjy4039FKJhRBTnF4D+Cz75bjDaf46sHvlJuX3sEfLwI6FDfKdVhW4
	BSATcMtb5Y77XxGrzS9A5j0RTOE+tHipuRFpTqXi5YGxLXIKbCtQWJhXCn4pJZVwMTsqIEXmTo3aP
	D2dfdSmb97bPKtt5NcgEW3ubATEGEzqqQfsYgUko9hTuN6jyVQAX8rEeIjtVW3RZNMl9yY/SnhVPh
	ZPiz0afZTqE3fj6gZKnFoOdu9BlJQ1oowy2NC9SQOnGpeLDm6/Dx5OY0aIEzZRfkb5OCZ9NeRdCxO
	+K1FtbRbCkk8+ssKt/7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliMI-000000064NC-25Kf;
	Mon, 20 Jul 2026 07:24:14 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKb-000000063K0-3IWR
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:34 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38dcbade417so7897358a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 00:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532149; x=1785136949; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dcPxSVKmnyDYbDNSJzzUfsfbxgQsODI8nQ8p4qJtspk=;
        b=fpGrkmd8RwYWtA/V3DrfUAt6XRF2P7h1CuO/UMSPRCMFXHrWfSvGTb5SAfEDxIYSM2
         nRMAGXVss5lr4n7DkZ52fqBDcjTsBi0cSe+E2ib0L5f7PZ9FEl9s/HQzGyjxFIuctbMx
         nfKAnHulRRFNaIYCViRvZdu8nCA81PWkvR3A5KJghJH67lo6dWYHzXYBuHOoh22riYJ7
         10LQqwYmuQgnU4cIeD3tfNf42ilKh7lhK0XFM5kdh584jFawIES9w8ds1YWlB5g4BmDD
         4qd5FK2Qn4vBb60oHhFjqbqd1gXdb6I4i2TBHOLYPOCcNlBodqauOXUrmtosgUe/HJB3
         xHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532149; x=1785136949;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcPxSVKmnyDYbDNSJzzUfsfbxgQsODI8nQ8p4qJtspk=;
        b=KP0JS7H+qiN+pVGYtuqe3aPLGyecF7K+4OwAFk4hQR4i7/fcENlxhTSUcnCWrBUtO3
         53ifBSGcNwAi309kIRn1WM7uJA5eKK34sjZRPBh5OkXWeZ+OZUqO4mpmHDSfVaVV11bp
         uoX2gxRsFZL9y2kvuPhZnlRhxYqqjENe3g2aUnqx7vWKO8KsIVS0xwghPpax3vSEjrO+
         whIP/cWyek33StGmbxo7CvvIaP8lkU90GkCswHjhM4Y46ukSiTOoQZqYGi37+0N+bq79
         0Cj2qov6tzT2bUUe/PdGNcKfa6EzSRfW7ndohNA1Ja5a3yZ6zhewKauxdAibtuxMPH/y
         ugtg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7mS/kknIX6m6egAgKJmevhIes6lj3z/V7dNF872SPsSq16gcfQG47jxTZyf7jnS4OetRK24JtXibkRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YztUqWYDQfr8qUGNUYRr6Wm1yWfJgZv/DhKzeW8hcLh3kMaIxUs
	RbkH/v50zl/H9qockdOOSpCMdywncnAqQ8y3JNW1FgBKQ71CQXc1r6NQ2PEIzsJn
X-Gm-Gg: AfdE7ckYo/FLLkH5Xpj+KoVM75wJ+LX2wK3KwTVIzTtbN+DZ3qa3VI+v3636s+YJGBZ
	v05DXKSnIQCsk62Hngb7SJBJMkjQY0qGQbHy6bkJoyrE6VPV1IzzPNcT3CuT+8//KMtJ4nlTLAg
	SIOERsKSWrXSwGcrjVQmA7Vs9e4s9nBGyQQ2X8Q7IvJ5WJKLEoiaXlXPDw3Q1eNMxpRSk/cDvdb
	1VVRFxzKmFuRfa3bxAogji1ehgCXg9SxokuXJhtkov/8m+uOEzldzDjE6ax0hpRKlcYjmlDw4vb
	7brMX3Dtuzdr7of1KQRaOwyzOLwShWUeG+os8nhfBCxn25608r82FKG0B7GykrKXMuXYS+62Z86
	DTJM7bvyGm9Owg1X2WFvaGfC2q4pMe1ltz6hNJ90hhr8RG3/ghRK06Tpfiu0EDrXx8mTQl3gmCt
	f/sPBautPEuGnOTmo9VoLtAgHhdlrv
X-Received: by 2002:a17:90b:574c:b0:387:e0cb:7ee with SMTP id 98e67ed59e1d1-38e4b585dd2mr13626298a91.34.1784532149122;
        Mon, 20 Jul 2026 00:22:29 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:28 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v8 17/22] RISC-V: perf: Add legacy event encodings via
 sysfs
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
In-Reply-To: <20260701-counter_delegation-v8-17-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-17-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211940.543975.8329989834248386453.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=3146;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=dYF7nkp05JxYIKgQ4jHUTlERnRx5T3N6NMRVo9VDNt4=;
 b=yNzrmMlFIV+5r1fH4TqRRoOIIToHMnHyIVcRLkrmaO7IQjikh+PA4TCmBvZRnz3a2vdy7TVyZ
 PAlFudkjROVCE4aB2ntR0CghpkPkmifUKhLjLdNzlxWYp2bBVNxPaFq
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002230_146710_DC75341F 
X-CRM114-Status: GOOD (  18.39  )
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

# Add your code comments below. There is no need to trim or delete
# any existing content -- just insert your comments under the relevant
# lines of code. Lines starting with "> " are quoted diff context and
# lines starting with "| " are comments from other reviewers.
# The final email will be reformatted automatically to include only
# the sections that have your comments.
#
> Define sysfs details for the legacy events so that any tool can
> parse these to understand the minimum set of legacy events
> supported by the platform. The sysfs entry will describe both event
> encoding and corresponding counter map so that an perf event can be
> programmed accordingly.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 19d9e4750424..8d56bef95a1b 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -131,7 +131,20 @@ static struct attribute_group riscv_cdeleg_pmu_format_group = {
>  	.attrs = riscv_cdeleg_pmu_formats_attr,
>  };
>  
> +#define RVPMU_EVENT_ATTR_RESOLVE(m) #m
> +#define RVPMU_EVENT_CMASK_ATTR(_name, _var, config, mask) \
> +	PMU_EVENT_ATTR_STRING(_name, rvpmu_event_attr_##_var, \
> +			      "event=" RVPMU_EVENT_ATTR_RESOLVE(config) \
> +			      ",counterid_mask=" RVPMU_EVENT_ATTR_RESOLVE(mask))
> +
> +#define RVPMU_EVENT_ATTR_PTR(name) (&rvpmu_event_attr_##name.attr.attr)
> +
> +static struct attribute_group riscv_cdeleg_pmu_event_group __ro_after_init = {
> +	.name = "events",
> +};
> +
>  static const struct attribute_group *riscv_cdeleg_pmu_attr_groups[] = {
> +	&riscv_cdeleg_pmu_event_group,
>  	&riscv_cdeleg_pmu_format_group,
>  	NULL,
>  };
> @@ -447,11 +460,14 @@ struct riscv_vendor_pmu_events {
>  	const struct riscv_pmu_event *hw_event_map;
>  	const struct riscv_pmu_event (*cache_event_map)[PERF_COUNT_HW_CACHE_OP_MAX]
>  						       [PERF_COUNT_HW_CACHE_RESULT_MAX];
> +	struct attribute **attrs_events;
>  };
>  
> -#define RISCV_VENDOR_PMU_EVENTS(_vendorid, _archid, _implid, _hw_event_map, _cache_event_map) \
> +#define RISCV_VENDOR_PMU_EVENTS(_vendorid, _archid, _implid, _hw_event_map, \
> +				_cache_event_map, _attrs) \
>  	{ .vendorid = _vendorid, .archid = _archid, .implid = _implid, \
> -	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map },
> +	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map, \
> +	  .attrs_events = _attrs },
>  
>  static struct riscv_vendor_pmu_events pmu_vendor_events_table[] = {
>  };
> @@ -473,6 +489,8 @@ static void __init rvpmu_vendor_register_events(void)
>  		    pmu_vendor_events_table[i].archid == arch_id) {
>  			current_pmu_hw_event_map = pmu_vendor_events_table[i].hw_event_map;
>  			current_pmu_cache_event_map = pmu_vendor_events_table[i].cache_event_map;
> +			riscv_cdeleg_pmu_event_group.attrs =
> +							pmu_vendor_events_table[i].attrs_events;
>  			break;
>  		}
>  	}

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
