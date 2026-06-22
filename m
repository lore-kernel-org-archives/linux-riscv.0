Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B55CDB46B
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 06:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PxXDYOUpM00CuzAbHhoCaR8Fu4nYsfi59xPFkMjN4RE=; b=qUGyCcDlY0wGGq
	JoM/FHRZ/0iNyYEZPj9p7LKRXo2QJ7tQsx6YkW7gNqgzvdtpd/ECW5xHOnaQKCz9UMhCUg6OuA/Mx
	TxHXn5r2gUiPdB6JUKjC/wXEa/bnh/1osrB6Xkfp0BOSBiJMcZFlUjCC51fjv/2zD6XYvZlbex4H6
	Tsup9csw00WwFXGvBtUMt5BJnHjl0KmX5VsWH3s9WkPTPD1K/rVkfQ3Xq0eZBHNfdBu5bjo5CEKPB
	fUp3ZNCoo/p19gQnSm4iEsEJ6XGQ1WUVZwFp7iGFec8H0pr04GU52m9qA7kJMaIdW8mMRPStzGbTD
	pCn51WB848fM/RB1cGWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYOy-00000004Uvr-1NeV;
	Mon, 22 Jun 2026 06:45:00 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYOv-00000004Uur-2Pu4
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 06:44:58 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-30c001b21feso3579833eec.1
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jun 2026 23:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782110696; x=1782715496; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O89IWiz4+jst6WssmkXWLaT7xtJNIW5Q681+XiS4VbI=;
        b=seHltfuhZDrqV7LCibXzWQxrbf87RR1ro3JqWt4uIiKfC8AUkEB0q3a5vfx7uHHIpr
         +k6nAK5gRIIJd6tyn40oELUEkk6pVTyK7BRZgBePXuUg0uUdJksZQDo35Cl1+moBg6+t
         i+hWELepl0IS8ejn6w/V//kyYeCoN6D8bV4I0G0mneWw/GueA415N2Tb5/52dE36rEed
         Itc1L3gp73WA/6BjxGEyWJvPyPDehYjbTrpLPZDOzPFMIg4JduK9bObQq3U+Rguyu1U7
         mkg0wqGpVwUQw5saxi/K7Mqh6qHSNsk4z4qNVuZYLstwc46QQ2rjjLNu7ySDXmcJOnvw
         LPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110696; x=1782715496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O89IWiz4+jst6WssmkXWLaT7xtJNIW5Q681+XiS4VbI=;
        b=UAiU2WgejPqxvyWVV+NPS6J+kRB8MKncuyt5nFGs6UW3ZGMIs1RuJpFJFVsI5pSi9w
         wpHlD478bAn8VB8vwRxTzPz14iCWyBpFJ5YDIAh7wNyB3ELWyhvX6FXbqC989R+zHtXM
         +t6EtbIiOl+u2akCBK2EVGszu5z56fCNOQ7TMOAB1hhypIv85mtbqxbVzyQHjXXLbaCP
         o+xk1j+CgYNY31p/rkqfadKOAsVAIi1b4xxkBkf+sVQShp/yyNKwEU37VOhFRUbvAvqG
         RW0f9gF1NPVYybQRUKPneHVeLfnUVj6I+xEQJh9suYSZVsRBUar9Z/9lQ8S63D4/IjkP
         H12g==
X-Forwarded-Encrypted: i=1; AHgh+RqRBwQn/RhSVn1oiPeN7jEnwsXjkmN3WHGxQmI9iMmD9hh/R0h/kR/RaZsPPTRshmIJn6g/tJRNmrursw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/oVUB5OGkXrthuBVgUol7DOCtsmaC20Z1Xg9+x2UfgaetoKJ+
	2x1usbX0zUBfkfQGCLhn0yipf8bNiKOuq4/8cfDoB6R3F0wI5DGtJqUT
X-Gm-Gg: AfdE7cmtWguIG3Kl1LG6ocg4SJXV80y3QWN+0/Hh9gxSbP4/ep43vknLXHkh6+Z92K9
	8YfHKs7di7cdxIXTEMIvInAXozNJatHfx1mvaKWfgxuoDYryyufIWdIko93WbjRzEKkfrLbK0Oz
	FvG3KAKT6jvWEhfgIP67lP7BCSKHBVI8ypyyUg39+EcsmQ/FSh0Tez4WFgHeF0hh4U7WJwLX8t4
	IcZlegi7OM47vB1HuRDvAv0vNT6qXknDoAylJY73QxXbWewF1RZ3zuJHGYrxmsgWGnv8h5TZWJH
	dQK92nCjT79jS1Mf1mVTRGC+mOlUKtama/B9H0RUCvNrC93Z4sJbukuowMD+caFmSTB92VygtnX
	LNmUmbRPmW+IOST4eP2eyC2xdvkj/L+k/lo2EqSusCktzK2JW+yYKwgIUK2Z3VlK9z8jTt+TH8x
	cd
X-Received: by 2002:a05:7300:dc10:b0:304:df8b:71ee with SMTP id 5a478bee46e88-30c06ffd9e8mr7952599eec.7.1782110696380;
        Sun, 21 Jun 2026 23:44:56 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d78esm8370076eec.18.2026.06.21.23.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:44:55 -0700 (PDT)
Date: Sun, 21 Jun 2026 23:44:52 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anup Patel <anup@brainfault.org>,
	Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ian Rogers <irogers@google.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 17/21] RISC-V: perf: Add Qemu virt machine events
Message-ID: <ajjZ5NljehUXERN1@blinky>
References: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
 <20260608-counter_delegation-v6-17-285b72ed65a9@meta.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260608-counter_delegation-v6-17-285b72ed65a9@meta.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_234457_619887_B9433B8D 
X-CRM114-Status: GOOD (  21.94  )
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

On Mon, Jun 08, 2026 at 11:01:31PM -0700, Atish Patra wrote:
> From: Atish Patra <atishp@rivosinc.com>
> 
> Qemu virt machine supports a very minimal set of legacy perf events.
> Add them to the vendor table so that users can use them when
> counter delegation is enabled.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/vendorid_list.h |  4 ++++
>  drivers/perf/riscv_pmu_sbi.c           | 36 ++++++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
> index 7f5030ee1fcf..603aa2b21c0b 100644
> --- a/arch/riscv/include/asm/vendorid_list.h
> +++ b/arch/riscv/include/asm/vendorid_list.h
> @@ -11,4 +11,8 @@
>  #define SIFIVE_VENDOR_ID	0x489
>  #define THEAD_VENDOR_ID		0x5b7
>  
> +#define QEMU_VIRT_VENDOR_ID		0x000
> +#define QEMU_VIRT_IMPL_ID		0x000
> +#define QEMU_VIRT_ARCH_ID		0x000

Palmer proposed a change to this a while ago to set the archid for qemu
as 42 but it looks like it was never merged in qemu, but it was merged
into the riscv spec.

Here is the spec PR: https://github.com/riscv/riscv-isa-manual/pull/1213
Here is the current spec: https://github.com/riscv/riscv-isa-manual/blob/main/marchid.md
Here is the QEMU patch: https://lore.kernel.org/all/20240131182430.20174-1-palmer@rivosinc.com/

Should we follow up with this/maybe this should be accounted for here as
an alternate id?

- Charlie

> +
>  #endif
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 00b84b28117a..74acac54328e 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -26,6 +26,7 @@
>  #include <asm/sbi.h>
>  #include <asm/cpufeature.h>
>  #include <asm/vendor_extensions.h>
> +#include <asm/vendorid_list.h>
>  #include <asm/vendor_extensions/andes.h>
>  #include <asm/hwcap.h>
>  #include <asm/csr_ind.h>
> @@ -453,7 +454,42 @@ struct riscv_vendor_pmu_events {
>  	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map, \
>  	  .attrs_events = _attrs },
>  
> +/* QEMU virt PMU events */
> +static const struct riscv_pmu_event qemu_virt_hw_event_map[PERF_COUNT_HW_MAX] = {
> +	PERF_MAP_ALL_UNSUPPORTED,
> +	[PERF_COUNT_HW_CPU_CYCLES]		= {0x01, 0xFFFFFFF8},
> +	[PERF_COUNT_HW_INSTRUCTIONS]		= {0x02, 0xFFFFFFF8}
> +};
> +
> +static const struct riscv_pmu_event qemu_virt_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
> +						[PERF_COUNT_HW_CACHE_OP_MAX]
> +						[PERF_COUNT_HW_CACHE_RESULT_MAX] = {
> +	PERF_CACHE_MAP_ALL_UNSUPPORTED,
> +	[C(DTLB)][C(OP_READ)][C(RESULT_MISS)]	= {0x10019, 0xFFFFFFF8},
> +	[C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]	= {0x1001B, 0xFFFFFFF8},
> +
> +	[C(ITLB)][C(OP_READ)][C(RESULT_MISS)]	= {0x10021, 0xFFFFFFF8},
> +};
> +
> +RVPMU_EVENT_CMASK_ATTR(cycles, cycles, 0x01, 0xFFFFFFF8);
> +RVPMU_EVENT_CMASK_ATTR(instructions, instructions, 0x02, 0xFFFFFFF8);
> +RVPMU_EVENT_CMASK_ATTR(dTLB-load-misses, dTLB_load_miss, 0x10019, 0xFFFFFFF8);
> +RVPMU_EVENT_CMASK_ATTR(dTLB-store-misses, dTLB_store_miss, 0x1001B, 0xFFFFFFF8);
> +RVPMU_EVENT_CMASK_ATTR(iTLB-load-misses, iTLB_load_miss, 0x10021, 0xFFFFFFF8);
> +
> +static struct attribute *qemu_virt_event_group[] = {
> +	RVPMU_EVENT_ATTR_PTR(cycles),
> +	RVPMU_EVENT_ATTR_PTR(instructions),
> +	RVPMU_EVENT_ATTR_PTR(dTLB_load_miss),
> +	RVPMU_EVENT_ATTR_PTR(dTLB_store_miss),
> +	RVPMU_EVENT_ATTR_PTR(iTLB_load_miss),
> +	NULL,
> +};
> +
>  static struct riscv_vendor_pmu_events pmu_vendor_events_table[] = {
> +	RISCV_VENDOR_PMU_EVENTS(QEMU_VIRT_VENDOR_ID, QEMU_VIRT_ARCH_ID, QEMU_VIRT_IMPL_ID,
> +				qemu_virt_hw_event_map, qemu_virt_cache_event_map,
> +				qemu_virt_event_group)
>  };
>  
>  static const struct riscv_pmu_event *current_pmu_hw_event_map;
> 
> -- 
> 2.53.0-Meta
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
