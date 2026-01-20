Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA17D2ECF9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+AyPP6SOaw9Wf87DBg7zNG1pG0cBbZf0QbDLYQx9iTw=; b=rC7G04drAuVRiX
	uQ9v9opmmACEjnTQ9fCvD6Sd/LYkO8SbgoKU0or2e3L6nfYPS4PXuceGNXLTVhwJdmJPj8VsWFPm3
	lyWHqc0xY6Aqx21dmlDH/JjXww/iejXbvSRz8rBSY3BoeqiI7cVIyCFAdToGDM+CDnSv9JUuuTaFx
	5PhqFWywmfSsJt4ODz1eLo+86xTnx8fpvOVVsj24XPV15BkNKlyVWGc2W2PVVwv78MnQDykBVIK6A
	XkAq4l5tmuP6sHoSY5XGHbuxAL0MZewwJRKiBnuVJxlrKyZ60d1ri0FYisEAEyDLll53gNaONkQib
	6AT9rgcCeIsjRiDVYM5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6SA-00000003N2w-2Dyz;
	Tue, 20 Jan 2026 07:47:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6S9-00000003N2q-0NUK
	for linux-riscv@bombadil.infradead.org;
	Tue, 20 Jan 2026 07:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tM/dudV1W48DW6EJyD6Yhsh+4+kz7etn91Z/Ac3GSSc=; b=M2wSbm7Ymf3jR/Tw5+ToESEAjB
	U0Xj2374FpvKBsVva7VxBgOVp2lQmXmunlv7TT/5x3UU4t4ahi/6/0CJ39w4NZ14tHjdB70Y9C3U6
	q9WXFCKtqY9ADgUdcjPlA2YuDPlI3rYfhz3unHshcGIy2VItwSKiXGO5AZk898fgsYzLJkYm2HsKb
	JlUqqqTUyME1URWABd/XkhWYuLp8jA03ysM9ZAn4dHbjVptodn7187ua+DEJhWWAvWWuPAnBZjui1
	HCaDhJMJsXYTfOefUc35sz7vVabV5FlzCCkb0NpRID5HngBcUqdEGgaKF1HoIkkGlt8jMvGsylGkg
	rFBgrWhQ==;
Received: from mgamail.intel.com ([198.175.65.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6S5-0000000DVfm-2TT7
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 07:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768895222; x=1800431222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pb8tSIzBxYh1mdHVNtiPrkxwBz/DRwHlXyU5R42quzg=;
  b=HQMyGwlaH+LLc96Gn4yxVkj7Pp4nM9B33nfOErBMGeYVly4xPpkoIo8c
   vdIClKSu8uAkzvvZh/cBv0ULdmJSU9rMDiVJjvHUJ6wfWvHtMyspsR/Dn
   f7GNlzWbqURiC+ua4q1ycv3/OxQXoCbs7QdKWA8m0E+TsP6uISjE2Xptl
   bPF8LQDHI8coNQ8cwNtcd3hYZv1+IKLrTB64H1CY1Gl6AtdRDW9gK95Qf
   FjjOwAQi7a4+C0Nzernk1pSM5f2wNPpqiZg7kMFhPcb4L9YMxx/Sn2S4Z
   NLPeMYxS9/S8jhrln2KcFoaG4E9bytHAjmLvG79BGdRifgYCAKC0+e6Gf
   w==;
X-CSE-ConnectionGUID: 4Cz/8BiOQROd8yfUSLKbjg==
X-CSE-MsgGUID: PAQeVTufTWStRkkScswTng==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="81535190"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="81535190"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:46:56 -0800
X-CSE-ConnectionGUID: 7rcAUTaoT0OvH3k6m888nQ==
X-CSE-MsgGUID: Z2hO9ovlTva2gue1TaydKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="205957242"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:46:51 -0800
Date: Tue, 20 Jan 2026 09:46:49 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, akpm@linux-foundation.org, kees@kernel.org,
	andy@kernel.org, ebiggers@kernel.org, martin.petersen@oracle.com,
	ardb@kernel.org, charlie@rivosinc.com, conor.dooley@microchip.com,
	ajones@ventanamicro.com, linus.walleij@linaro.org,
	nathan@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v3 4/8] lib/string_kunit: add performance benchmarks for
 strlen
Message-ID: <aW8y6eC7ZGRYIWkn@smile.fi.intel.com>
References: <20260120065852.166857-1-jiangfeng@kylinos.cn>
 <20260120065852.166857-5-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120065852.166857-5-jiangfeng@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_074702_110354_7C75CBF3 
X-CRM114-Status: GOOD (  21.36  )
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

On Tue, Jan 20, 2026 at 02:58:48PM +0800, Feng Jiang wrote:
> Introduce a benchmarking framework to the string_kunit test suite to
> measure the execution efficiency of string functions.
> 
> The implementation is inspired by crc_benchmark(), measuring throughput
> (MB/s) and latency (ns/call) across a range of string lengths. It
> includes a warm-up phase, disables preemption during measurement, and
> uses a fixed seed for reproducible results.
> 
> This allows for comparing different implementations (e.g., generic C vs.
> architecture-optimized assembly) within the KUnit environment.
> 
> Initially, provide benchmarks for strlen().

...

> +#define STRING_BENCH_SEED	888
> +#define STRING_BENCH_WORKLOAD	1000000UL

Can also be (1 * MEGA) from units.h.

...

> +static const size_t bench_lens[] = {
> +	0, 1, 7, 8, 16, 31, 64, 127, 512, 1024, 3173, 4096

Leave trailing comma.

> +};

...

> +static void *alloc_max_bench_buffer(struct kunit *test,
> +		const size_t *lens, size_t count, size_t *buf_len)
> +{
> +	void *buf;
> +	size_t i, max_len = 0;
> +
> +	for (i = 0; i < count; i++) {
> +		if (max_len < lens[i])
> +			max_len = lens[i];
> +	}
> +
> +	/* Add space for NUL terminator */
> +	max_len += 1;

> +	buf = kunit_kzalloc(test, max_len, GFP_KERNEL);
> +	if (buf && buf_len)
> +		*buf_len = max_len;
> +
> +	return buf;

	if (!buf)
		return NULL;

	*buf_len ...
	return buf;

> +}

...

> +static void fill_random_string(char *buf, size_t len)
> +{
> +	size_t i;
> +	struct rnd_state state;

Reversed xmas tree ordering?

> +	if (!buf || !len)
> +		return;
> +
> +	/* Use a fixed seed to ensure deterministic benchmark results */
> +	prandom_seed_state(&state, 888);
> +	prandom_bytes_state(&state, buf, len);
> +
> +	/* Replace null bytes to avoid early string termination */
> +	for (i = 0; i < len; i++) {
> +		if (buf[i] == '\0')
> +			buf[i] = 0x01;
> +	}
> +
> +	buf[len - 1] = '\0';
> +}

...

> +#define STRING_BENCH(iters, func, ...)					\

Is this same / similar code to crc_benchmark()? Perhaps we need to have KUnit
provided macro / environment to perform such tests... Have you talked to KUnit
people about all this?

> +({									\
> +	u64 __bn_t;							\
> +	size_t __bn_i;							\
> +	size_t __bn_iters = (iters);					\
> +	size_t __bn_warm_iters = max_t(size_t, __bn_iters / 10, 50U);	\

Try to avoid max_t() as much as possible. Wouldn't max() suffice?

> +	/* Volatile function pointer prevents dead code elimination */	\
> +	typeof(func) (* volatile __func) = (func);			\
> +									\
> +	for (__bn_i = 0; __bn_i < __bn_warm_iters; __bn_i++)		\
> +		(void)__func(__VA_ARGS__);				\
> +									\
> +	preempt_disable();						\
> +	__bn_t = ktime_get_ns();					\
> +	for (__bn_i = 0; __bn_i < __bn_iters; __bn_i++)			\
> +		(void)__func(__VA_ARGS__);				\
> +	__bn_t = ktime_get_ns() - __bn_t;				\
> +	preempt_enable();						\
> +	__bn_t;								\
> +})
> +
> +/**
> + * STRING_BENCH_BUF() - Benchmark harness for single-buffer functions.
> + * @test: KUnit context.
> + * @buf_name: Local char * variable name to be defined.
> + * @buf_size: Local size_t variable name to be defined.
> + * @func: Function to benchmark.
> + * @...: Extra arguments for @func.
> + *
> + * Prepares a randomized, null-terminated buffer and iterates through lengths
> + * in bench_lens, defining @buf_name and @buf_size in each loop.
> + */
> +#define STRING_BENCH_BUF(test, buf_name, buf_size, func, ...)		\
> +do {									\
> +	char *buf_name, *_bn_buf;					\
> +	size_t buf_size, _bn_i, _bn_iters, _bn_size = 0;		\
> +	u64 _bn_t, _bn_mbps = 0, _bn_lat = 0;				\
> +									\
> +	if (!IS_ENABLED(CONFIG_STRING_KUNIT_BENCH))			\
> +		kunit_skip(test, "not enabled");			\
> +									\
> +	_bn_buf = alloc_max_bench_buffer(test, bench_lens,		\
> +			ARRAY_SIZE(bench_lens), &_bn_size);		\
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, _bn_buf);			\
> +									\
> +	fill_random_string(_bn_buf, _bn_size);				\

> +	_bn_buf[_bn_size - 1] = '\0';					\

You have already this there in the function, no?

> +	for (_bn_i = 0; _bn_i < ARRAY_SIZE(bench_lens); _bn_i++) {	\
> +		buf_size = bench_lens[_bn_i];				\
> +		buf_name = _bn_buf + _bn_size - buf_size - 1;		\
> +		_bn_iters = STRING_BENCH_WORKLOAD /			\
> +				max_t(size_t, buf_size, 1U);		\

max()

> +		_bn_t = STRING_BENCH(_bn_iters, func, ##__VA_ARGS__);	\
> +									\
> +		if (_bn_t > 0) {					\
> +			_bn_mbps = (u64)(buf_size) * _bn_iters * 1000;	\
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
