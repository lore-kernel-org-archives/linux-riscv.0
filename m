Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C82D29DE2
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 08:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HnOXz7Zol9wKlrUw+Y8UsIaYyrf4F9fLlaSCjUD9x9w=; b=TFB1iIMn4KFzZ/
	sOrg7q+TIbmYaw9Z7cg8a+3z7+ziPbmsLlWIrJznVZF/CjOIZnGqkJfZD3FFLK9sDxYhWVYIW8yuf
	wlstvtOwKg3PHQxlJ80FQGMsXI0Nuy0EWTSfTMVyp+evnnOgFw6IcJp+0u3/iwO05Zs2hzMwluNwJ
	jA8Ttxw+gEJGNikUgnUWrjNf4XKX4HrztO8FQi8re1slNOa0igZiWPPLNjbiKEdUX36Ln3AD7kVbz
	OK1/44PlPW3e4Xu+4V5rrAGi3Y+AOHAMvwL3EoctaaorRz4+g0mxINcW9oS2OHzituHZ7sRSnOgaI
	2Ks3IS/g6u4WKaRarCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfa2l-00000006m1u-1XSR;
	Tue, 13 Jan 2026 08:46:27 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfa2i-00000006m1Z-1aeP
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 08:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768293984; x=1799829984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LuR1U+G1fxeaAcVaesDQDX6kj+hiGYDQWKnGdmCi+hw=;
  b=UjUVLWmbYOTBnqciRznWo0ogqmUPtTHUic/MsIrXr+7bHOGhi01dNED4
   i+xWIPNLLMShlri1qu8bxa2kCg9YPd+W+bj0AYcF5wijL1LSQSOcTdBEV
   yW4sHhrBFLombVNoav9ZS1oWz17se9NNmyoToxY0pWcgq9pw0JFQsGfO0
   hj9HHewqAxLgZHZVH+TDSnnOgDPA2JZx0MgMv0HgwrqWEEVFVijLgq7JQ
   omyKHldPgT2m/zs9+j4wsQbMd5L31CtLxK5D6NnPr8egYSfxm78wYJvBH
   wqyYms4FaIAr+AKJJzWhvqJobrc01/rbBwNlzriDLxIV6410tisP/sxp9
   Q==;
X-CSE-ConnectionGUID: VvKeeEYqQ9KwWixvxfgqpw==
X-CSE-MsgGUID: ybUzNZ/zQk69TAGJtBU73w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="86989597"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="86989597"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:46:23 -0800
X-CSE-ConnectionGUID: ZzFm8NyUTlK/FhfmXPjeIA==
X-CSE-MsgGUID: OOPd+QWlR/OVKWtJe7hJBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203483672"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:46:19 -0800
Date: Tue, 13 Jan 2026 10:46:16 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, kees@kernel.org, andy@kernel.org,
	akpm@linux-foundation.org, ebiggers@kernel.org,
	martin.petersen@oracle.com, ardb@kernel.org,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	samuel.holland@sifive.com, linus.walleij@linaro.org,
	nathan@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 08/14] lib/string_kunit: add performance benchmark for
 strlen()
Message-ID: <aWYGWLEekWh3jJVf@smile.fi.intel.com>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
 <20260113082748.250916-9-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113082748.250916-9-jiangfeng@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_004624_500361_A95B9F34 
X-CRM114-Status: GOOD (  15.96  )
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

On Tue, Jan 13, 2026 at 04:27:42PM +0800, Feng Jiang wrote:
> Introduce a benchmark to compare the architecture-optimized strlen()
> implementation against the generic C version (__generic_strlen).
> 
> The benchmark uses a table-driven approach to evaluate performance
> across different string lengths (short, medium, and long). It employs
> ktime_get() for timing and get_random_bytes() followed by null-byte
> filtering to generate test data that prevents early termination.
> 
> This helps in quantifying the performance gains of architecture-specific
> optimizations on various platforms.

...

> +static void string_test_strlen_bench(struct kunit *test)
> +{
> +	char *buf;
> +	size_t buf_len, iters;
> +	ktime_t start, end;
> +	u64 time_arch, time_generic;
> +
> +	buf_len = get_max_bench_len(bench_cases, ARRAY_SIZE(bench_cases)) + 1;
> +
> +	buf = kunit_kzalloc(test, buf_len, GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(bench_cases); i++) {
> +		get_random_nonzero_bytes(buf, bench_cases[i].len);
> +		buf[bench_cases[i].len] = '\0';
> +
> +		iters = bench_cases[i].iterations;
> +
> +		/* 1. Benchmark the architecture-optimized version */
> +		start = ktime_get();
> +		for (unsigned int j = 0; j < iters; j++) {
> +			OPTIMIZER_HIDE_VAR(buf);
> +			(void)strlen(buf);

First Q: Are you sure the compiler doesn't replace this with __builtin_strlen() ?

> +		}
> +		end = ktime_get();
> +		time_arch = ktime_to_ns(ktime_sub(end, start));
> +
> +		/* 2. Benchmark the generic C version */
> +		start = ktime_get();
> +		for (unsigned int j = 0; j < iters; j++) {
> +			OPTIMIZER_HIDE_VAR(buf);
> +			(void)__generic_strlen(buf);
> +		}

Are you sure the warmed up caches do not affect the benchmark? I think you need
to flush / make caches dirty or so on each iteration.

> +		end = ktime_get();
> +		time_generic = ktime_to_ns(ktime_sub(end, start));
> +
> +		string_bench_report(test, "strlen", &bench_cases[i],
> +				time_arch, time_generic);
> +	}
> +}


-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
