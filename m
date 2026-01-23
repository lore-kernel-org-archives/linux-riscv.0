Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0476D72373
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 11:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YwXqeGGO+mp9g8Pv2uxkJ0zihnxue8rUMkp6oNSZ4Mo=; b=pVcMxot61DQ05v
	N3DOrEj8WIB4O26iIx96mgAlarRtGKGZFWUqncTgWpRSUP94f56upyoc0MaM92aLJiSGoHk5aC8am
	mKeFNACSNpbQSgSh8IXuMyggi8Phwu12KD+3MOhJxB0Ic85U5ZuqwhyuJbhkNdxOHbLjtklUdPQBe
	ymFpBaZDLCLExea06EBZ6RVmS0yCfnF8nMQK1zpp13HGpRiYriL5LjHIxfYHAKUTmRwDQweavtjH2
	aVdWt3BieMCF5R/ERnQgbWJID4X5a3fmvUPZo8CclCqp7zchyNAxdVjQ0XkTMfh7hXCY0xeWYN0g7
	ccLIYyZLlwtxY+cwulWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEvs-00000008nGO-0PI8;
	Fri, 23 Jan 2026 11:02:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEvn-00000008nB0-2I6w
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 Jan 2026 11:02:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uX9e5/5y1eZvtK6ZekXQ1rwORvSYI8KRGjpyvZR99dw=; b=l20Wr7O5I+zJPgiiFlohXtVV9S
	0sOFShThjRWQCYxZnEQNccnhlYApktfsLTMEcNbbWbFa67xN3uo2JW9RLINi1/KpqHExmuL7MacZz
	pUllYkjg1bRRLElsY96Xl790801BAdoWcs5K3r8o3ca6lmK4KNJKbVLFx3iCO8mIQv68qqy2dxNBI
	wZda5zVLwXQ/ibEZi9vbYMtu8UJ9EhEvI5GZTi5l5QjchlE4X6USHdTngWtTHlYtdP0uHwOmireX3
	XqwZH/U/mj9yZsnio+UDk66rJiPeeE3fe/C7SSK533jNG/kVtUHretOX61zlV7W7ZfVfxZZ+eDnuF
	uX/Q4BHQ==;
Received: from mgamail.intel.com ([198.175.65.14])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEvj-00000002DdW-3EPP
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 11:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769166138; x=1800702138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TnAJh/kYI3vezbRFK4R/V29ptgvspkFfTPz2BdA1TY0=;
  b=iDE3nOhmZcdPM0IAZSN1UpG408aouwAowXYhd2w1GX0SWG+OWQe9/VgA
   g9S87n+kY8y3bBjNfuKNyBsN3ej8PI5dFSkJZCiEVE9N1vyryejqjXH30
   CzASRB+N7aFokDQnU2a/iGMx16F/GG67iBt/hWagxf3NtWcjrpx8tOt/8
   thx6UmapD/gAHzW5T9CsdrwehDpF1LyHk7KK2LFW2yLW0NRYD46jal62c
   A3qFVP8FOxoLqG52Bu4TLtSrn4YLi8KQZUM4cEO20U9y3sPECLPiI1puw
   gOezhJXNsoR/zeu1VsfPvbeM+HmjvG8fEISNYdDr4Y40R3NB3lvv3xCLL
   Q==;
X-CSE-ConnectionGUID: my/z/uKxTxWLiXKA12Lc7A==
X-CSE-MsgGUID: 0MiJfLNJRL+GnQ8zeOPe/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="74270801"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="74270801"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 03:02:12 -0800
X-CSE-ConnectionGUID: dBmA4e4xR6eGC+YW+e7q0Q==
X-CSE-MsgGUID: spZj5O1RSnOzbrBu0gQN2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="229961255"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.112])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 03:02:09 -0800
Date: Fri, 23 Jan 2026 13:02:07 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, akpm@linux-foundation.org, kees@kernel.org,
	andy@kernel.org, ebiggers@kernel.org, martin.petersen@oracle.com,
	mingo@kernel.org, charlie@rivosinc.com, conor.dooley@microchip.com,
	samuel.holland@sifive.com, linus.walleij@linaro.org,
	nathan@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 4/8] lib/string_kunit: add performance benchmark for
 strlen()
Message-ID: <aXNVL318XTTQ3tsU@smile.fi.intel.com>
References: <20260123085841.212468-1-jiangfeng@kylinos.cn>
 <20260123085841.212468-5-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260123085841.212468-5-jiangfeng@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_110220_248533_AFBC1589 
X-CRM114-Status: GOOD (  17.36  )
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

On Fri, Jan 23, 2026 at 04:58:37PM +0800, Feng Jiang wrote:
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
> 
> Initially, provide a benchmark for strlen().

...

> +static void *alloc_max_bench_buffer(struct kunit *test,
> +		const size_t *lens, size_t count, size_t *buf_len)
> +{
> +	size_t i, max_len = 0;
> +	void *buf;

> +	for (i = 0; i < count; i++) {
> +		if (max_len < lens[i])
> +			max_len = lens[i];
> +	}

	size_t max_len = 0;
	void *buf;

	for (size_t i = 0; i < count; i++)
		max_len = max(lens[i], max_len);

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

> +	size_t __bn_i;							\

Define it inside for-loop:s.

> +	u64 __bn_t;							\
> +									\
> +	__bn_warm_iters = max(__bn_iters / 10, 50U);			\
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

...

> +#define STRING_BENCH_BUF(test, buf_name, buf_size, func, ...)		\
> +do {									\
> +	size_t buf_size, _bn_i, _bn_iters, _bn_size = 0;		\
> +	u64 _bn_t, _bn_mbps = 0, _bn_lat = 0;				\
> +	char *buf_name, *_bn_buf;					\

> +	if (!IS_ENABLED(CONFIG_STRING_KUNIT_BENCH))			\
> +		kunit_skip(test, "not enabled");			\

Hmm... Since it's a macro anyway, I think the old style is okay:


#if IS_ENABLED(CONFIG_STRING_KUNIT_BENCH)
#define STRING_BENCH_BUF(test, buf_name, buf_size, func, ...)		\
	...
#else
#define STRING_BENCH_BUF(test, buf_name, buf_size, func, ...)		\
	kunit_skip(test, "not enabled");				\
#endif

But check it that it doesn't produce warnings in `make W=1` case.

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
> +		if (_bn_t > 0) {					\
> +			_bn_mbps = (u64)(buf_size) * _bn_iters * 1000;	\

"KILO"? Or "(MEGA/KILO)"? I'm puzzled with this 1000 multiplier.

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
