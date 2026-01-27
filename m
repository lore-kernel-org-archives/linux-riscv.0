Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D014CCA6C92
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 08:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnRLAvv/ktZrGTLt8NuBvjjQT/k51yP9tfzfBare9gU=; b=Y7r2JWGXVQvoKv
	6Vw9aHbDL4S7Unm1NcgZQ+e1Hz+KHrW3EZlUzdhZu868Njn7xfmvpiZzCEsFvX2UmLRY5xbq1w6FE
	5U09AAEVkKFNbKoSiRT6QidHO4KQAR8WJgOniiVw28s+ymde2e2yKCQRrPyjP9xsY22Cslrg0ex/F
	OoD5VJJ52OR7WAD+nU8RVNnDZl86ixvYcc9BOBqFjD+MuPf3E9DW9yx3UxUenkyK20yUIGGnPx05J
	5hMv+ajCfp/hWnw5IFf2+rmVTtMeW0G0+7wq4tHt+h+yUtUoJPr7qnlA5NJKtxYx31JxyfzrIhzFQ
	66KvZQEiL7xGCMDabYJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkeso-0000000Dt1Z-0an7;
	Tue, 27 Jan 2026 08:57:10 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkesl-0000000Dt0U-32zn
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 08:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769504228; x=1801040228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B0I0oaZQsAdILuwspLXSS9mmvQz9qSJghCZs0WfsOQg=;
  b=DwXzZ4iwIbMLwHD7PH2PnKgcqQ+zIn8IRIjmCnkYjork5QjfltBbQwO6
   owVtvAIZfVdswjE2o5qXJdfuuIOyDbc1vzR2Tmll3dZMU5lZqGghLCG55
   OgpCFdu20+Bp1uFk6TiTHOxUrwstFrSpAufr6PB7ucR03OYA/McHxmAqD
   LH5cYkcHe3lvgEL+0UzO3NqPElhmzqeK4hpY4/agI3vgXtJ5vrpmCcpT+
   Sd9jJdWbrhi8qBHJNTs8dzlaj+KLSDXMQNbb2e6u4bcG+T8PBRN/DUa9l
   sI5xXcIT+5fb5zL63wgrKQ2zM5UzK/hqP2Z1ZPNbQroWyP9UiwSg7o96S
   g==;
X-CSE-ConnectionGUID: MFlWU6SlSziBxxvNPFwxyw==
X-CSE-MsgGUID: fjQbsyXZTjKOFkzx1lJGVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82122917"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="82122917"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 00:57:07 -0800
X-CSE-ConnectionGUID: 4jAFmzE3SJClXjb5Py/jfw==
X-CSE-MsgGUID: 1Rfd1XACRZK1VZjGHVP01A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207539221"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.248])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 00:57:02 -0800
Date: Tue, 27 Jan 2026 10:57:00 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, akpm@linux-foundation.org, kees@kernel.org,
	andy@kernel.org, ebiggers@kernel.org, martin.petersen@oracle.com,
	sohil.mehta@intel.com, charlie@rivosinc.com,
	conor.dooley@microchip.com, samuel.holland@sifive.com,
	linus.walleij@linaro.org, nathan@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v5 4/8] lib/string_kunit: add performance benchmark for
 strlen()
Message-ID: <aXh93EVRSOrQQS6l@smile.fi.intel.com>
References: <20260127012558.40025-1-jiangfeng@kylinos.cn>
 <20260127012558.40025-5-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260127012558.40025-5-jiangfeng@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_005708_049887_ADCB56C4 
X-CRM114-Status: GOOD (  18.12  )
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

On Tue, Jan 27, 2026 at 09:25:54AM +0800, Feng Jiang wrote:
> Introduce a benchmarking framework to the string_kunit test suite to
> measure the execution efficiency of string functions.
> 
> The implementation is inspired by crc_benchmark(), measuring throughput
> (MB/s) and latency (ns/call) across a range of string lengths. It
> includes a warm-up phase, disables preemption during measurement, and
> uses a fixed seed for reproducible results.
> 
> This framework allows for comparing different implementations (e.g.,
> generic C vs. architecture-optimized assembly) within the KUnit
> environment.

Acked-by: Andy Shevchenko <andy@kernel.org>
A few nit-picks below.

...

> +static void *alloc_max_bench_buffer(struct kunit *test,
> +		const size_t *lens, size_t count, size_t *buf_len)
> +{
> +	size_t max_len = 0;
> +	void *buf;
> +
> +	for (size_t i = 0; i < count; i++)
> +		max_len = max(lens[i], max_len);

You also need minmax.h.

> +	/* Add space for NUL character */
> +	max_len += 1;
> +
> +	buf = kunit_kzalloc(test, max_len, GFP_KERNEL);
> +	if (!buf)
> +		return NULL;
> +
> +	if (buf_len)
> +		*buf_len = max_len;
> +
> +	return buf;
> +}

...

> +#define STRING_BENCH(iters, func, ...)					\
> +({									\
> +	/* Volatile function pointer prevents dead code elimination */	\
> +	typeof(func) (* volatile __func) = (func);			\
> +	size_t __bn_iters = (iters);					\
> +	size_t __bn_warm_iters;						\
> +	u64 __bn_t;							\


Perhaps a short comment here

	/* Use 10% of the given iterations (maximum 50) to warm up */

> +	__bn_warm_iters = max(__bn_iters / 10, 50U);			\
> +									\
> +	for (size_t __bn_i = 0; __bn_i < __bn_warm_iters; __bn_i++)	\
> +		(void)__func(__VA_ARGS__);				\
> +									\
> +	preempt_disable();						\
> +	__bn_t = ktime_get_ns();					\
> +	for (size_t __bn_i = 0; __bn_i < __bn_iters; __bn_i++)		\
> +		(void)__func(__VA_ARGS__);				\
> +	__bn_t = ktime_get_ns() - __bn_t;				\
> +	preempt_enable();						\
> +	__bn_t;								\
> +})

...

> +#define STRING_BENCH_BUF(test, buf_name, buf_size, func, ...)		\
> +do {									\
> +	size_t buf_size, _bn_i, _bn_iters, _bn_size = 0;		\
> +	u64 _bn_t, _bn_mbps = 0, _bn_lat = 0;				\
> +	char *buf_name, *_bn_buf;					\
> +									\
> +	_bn_buf = alloc_max_bench_buffer(test, bench_lens,		\
> +			ARRAY_SIZE(bench_lens), &_bn_size);		\
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, _bn_buf);			\
> +									\
> +	fill_random_string(_bn_buf, _bn_size);				\
> +									\
> +	for (_bn_i = 0; _bn_i < ARRAY_SIZE(bench_lens); _bn_i++) {	\
> +		buf_size = bench_lens[_bn_i];				\
> +		buf_name = _bn_buf + _bn_size - buf_size - 1;		\
> +		_bn_iters = STRING_BENCH_WORKLOAD / max(buf_size, 1U);	\
> +									\
> +		_bn_t = STRING_BENCH(_bn_iters, func, ##__VA_ARGS__);	\

> +									\

Remove unneeded blank line.

> +		if (_bn_t > 0) {					\
> +			_bn_mbps = (u64)(buf_size) * _bn_iters		\

Why buf_size in the parentheses here and not anywhere else (above)?
I assume it's just an external temporary variable? But why do we need to have
it in the parameters to the macro?

> +					* (NSEC_PER_SEC / MEGA);	\

Leave '*' on the previous line.

> +			_bn_mbps = div64_u64(_bn_mbps, _bn_t);		\
> +			_bn_lat = div64_u64(_bn_t, _bn_iters);		\
> +		}							\
> +		kunit_info(test, "len=%zu: %llu MB/s (%llu ns/call)\n",	\
> +				buf_size, _bn_mbps, _bn_lat);		\
> +	}								\
> +} while (0)

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
