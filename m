Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CA9D2D8DA
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 09:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UwJ0ynMaFwApKE3TcL++vi7bL5fZMWgiByrXCcE3nY0=; b=mOjn8XmAKDqxqb
	6tV7TmTDjRxPdFqQYCm6sIasnk5EeqzccClWrqlou5hUC23oQFguGh7aK3j7Xcgk5CXvDmHtBFphC
	U0ByKx4dQCEoFE2DREAmFGHVnq+S3kkji370qN7+Z4PviX7Vq9sdDqDjFwZPumK8294/6jN4h/2V/
	qtuEkcp226Y100TPEsasXeIkRU4p/qoIkj7npPbdv4v1MdKwJwX52KS3NDKW3o9qJjx2urZGM00OL
	4RThDqsPl/u3vlDm2UM/y4Qd/husldjAEzgwgelRqiyjTQeWZJxptzN3wb+KsqZXCrrQSY6B/FP58
	qoxUkW7I/Lh4FNbD9cDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfiu-0000000DznK-2dVp;
	Tue, 27 Jan 2026 09:51:00 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfir-0000000DzmV-47jh
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 09:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769507458; x=1801043458;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9JoGMgukM4DO2lRnKpbhZfoRHZo0S35f5oyw0yGG8sI=;
  b=Vgoq2rygTI76R0eZGS1vlVPE+Y3P5SnBI8Z3DNm1z+QmNXs/L7EzJSMl
   0fhhtCMpKbfryDcD1X5BBTHxxxtvZfur/xdOWKlytZCSGPGEHK9t5pdof
   80fzSbU7X/oPxUg4GPaIyfxngoruYpkNPQezill0iBzxhT3MV2IzzIrAn
   Ilpt94DPEbs5zDqVQ3M4AVbU2y1Zqakd0HXtwxaiA7IYqDDemwQSDZhuW
   hkLVtW9Jyi0vJwRd6yAuLdmQitUMCIkwFPbK/950PVdqA6sPfU8jN3+RB
   VexFh1Buwvt49jNC7XTGX0dwIOb8+OW0hDGiW/ULUpyjqPZN7blkdw61X
   g==;
X-CSE-ConnectionGUID: gfDJan65Qo2lTVRUYSu56w==
X-CSE-MsgGUID: hREBQTbHQdWjKljIM2bdWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="58271401"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="58271401"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:50:56 -0800
X-CSE-ConnectionGUID: OqvKmhYqSd2jgX+m0sRoEQ==
X-CSE-MsgGUID: 2zHo4xzOTYyK0NqT/J5mqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="208301388"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.248])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:50:52 -0800
Date: Tue, 27 Jan 2026 11:50:50 +0200
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
Message-ID: <aXiKelsJF-SiqnVS@smile.fi.intel.com>
References: <20260127012558.40025-1-jiangfeng@kylinos.cn>
 <20260127012558.40025-5-jiangfeng@kylinos.cn>
 <aXh93EVRSOrQQS6l@smile.fi.intel.com>
 <dcdb82e8-691a-4cc1-88d5-755039ed0313@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dcdb82e8-691a-4cc1-88d5-755039ed0313@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_015058_069113_099D0B76 
X-CRM114-Status: GOOD (  19.51  )
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

On Tue, Jan 27, 2026 at 05:33:10PM +0800, Feng Jiang wrote:
> On 2026/1/27 16:57, Andy Shevchenko wrote:
> > On Tue, Jan 27, 2026 at 09:25:54AM +0800, Feng Jiang wrote:

...

> >> +#define STRING_BENCH_BUF(test, buf_name, buf_size, func, ...)		\
> >> +do {									\
> >> +	size_t buf_size, _bn_i, _bn_iters, _bn_size = 0;		\
> >> +	u64 _bn_t, _bn_mbps = 0, _bn_lat = 0;				\
> >> +	char *buf_name, *_bn_buf;					\
> >> +									\
> >> +	_bn_buf = alloc_max_bench_buffer(test, bench_lens,		\
> >> +			ARRAY_SIZE(bench_lens), &_bn_size);		\
> >> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, _bn_buf);			\
> >> +									\
> >> +	fill_random_string(_bn_buf, _bn_size);				\
> >> +									\
> >> +	for (_bn_i = 0; _bn_i < ARRAY_SIZE(bench_lens); _bn_i++) {	\
> >> +		buf_size = bench_lens[_bn_i];				\
> >> +		buf_name = _bn_buf + _bn_size - buf_size - 1;		\
> >> +		_bn_iters = STRING_BENCH_WORKLOAD / max(buf_size, 1U);	\
> >> +									\
> >> +		_bn_t = STRING_BENCH(_bn_iters, func, ##__VA_ARGS__);	\
> > 
> >> +									\
> > 
> > Remove unneeded blank line.
> 
> Will fix.
> 
> >> +		if (_bn_t > 0) {					\
> >> +			_bn_mbps = (u64)(buf_size) * _bn_iters		\
> > 
> > Why buf_size in the parentheses here and not anywhere else (above)?
> 
> It was a bit inconsistent. I'll remove the unneeded parentheses for buf_size.
> 
> > I assume it's just an external temporary variable? But why do we need to have
> > it in the parameters to the macro?
> 
> This is necessary because buf_size often needs to be passed as an argument
> to the function under test. For instance, when benchmarking strnlen, the
> caller must pass the current length as an argument:
> STRING_BENCH_BUF(test, buf, len, strnlen, buf, len);

Okay, and why is it needed in this macro? It get overridden immediately in
the loop. Assuming that the array size of bench lengths is not zero, this
has no visible use. Can you elaborate?

> >> +					* (NSEC_PER_SEC / MEGA);	\
> > > Leave '*' on the previous line.
> 
> Will fix.
> 
> >> +			_bn_mbps = div64_u64(_bn_mbps, _bn_t);		\
> >> +			_bn_lat = div64_u64(_bn_t, _bn_iters);		\
> >> +		}							\
> >> +		kunit_info(test, "len=%zu: %llu MB/s (%llu ns/call)\n",	\
> >> +				buf_size, _bn_mbps, _bn_lat);		\
> >> +	}								\
> >> +} while (0)

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
