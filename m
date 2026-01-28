Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9810AD35690
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 09:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8H37fzgA575UBds2wtFc2L9MgwoQom2xiq1uhLbuDk=; b=qoC/7RO39AWau1
	t4iNqPduECqRXn4Xcp4DAvFrn8QUlgdemo5+7w++u+SwQ91/kni98F/TkOj0+MFyVW9/HZDAg0iu+
	UwX5Bj1M1N7St/7olCwRjI3Gyroa9xPj9iCDCqobIJPQ/bVxjBuJKhrPVwFOCFTqEwI5Qc3rWBMdd
	LC8LFaf2mlaa/1E+FBCtEGRxsv+o5eN2xiugT2v2qmjRtGqtb7gYD7ljW7LmuZKzIcRGNSSMry4TH
	dRuphn03Wgd2TGi4J3uud1jbsKChRi0nN9amh/OSaKOaAJIJxoE+eIhPutBbFboK7jg9tFkpBbbzB
	bBph0tJDmu8gqAvmZ6Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1Oy-0000000Fi8m-2RQa;
	Wed, 28 Jan 2026 08:59:52 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1Ow-0000000Fi8R-13Kd
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 08:59:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769590790; x=1801126790;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aiOWRRjAx3Fe65K/nWnJxxRvs7BcjtXp2Asr0BTsf+E=;
  b=Uqi/Fz+k6IXlbhe9/Ux6Yq67SvCDkJPfMQxlsQAJBP6j6Vq6D/8RIYIx
   /qmm51dNuCamWdFZygRNaiuy6HM3pZ0iWPSPlnRFHuzBr7v82z/ASPNQv
   Kv9rvBPYMxQnd9TiD6hVJnBhZ6sEG8Qotx67lvh3aBWxoCI/m1FTX1uP6
   BrZ52kBCPSkV8LGr7B6Nc7iTAmtSkhh9InOGgJAqPgzRP/Ln9I3crYCZZ
   togrZmTP6LzMOkJ7a5qu+KudE67C+L8BWrotE7qXS/X0q9hD0vPKjxf4Q
   yByfSOv7HuvZJA3PaWd5fgZkACVxqYUtcrnrm9o/mcAVP2JtScW43f0x9
   g==;
X-CSE-ConnectionGUID: VZ/5IEc3RA2IgtA3cSSiSA==
X-CSE-MsgGUID: HfPyJL8HQN2mwGo2MVqo7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="96259207"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="96259207"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 00:59:49 -0800
X-CSE-ConnectionGUID: mvNnzAdoRQWYNA+cb2eLzw==
X-CSE-MsgGUID: +dVQm/t5Sx2lyKn4ImKqGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208111010"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 00:59:45 -0800
Date: Wed, 28 Jan 2026 10:59:43 +0200
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
Message-ID: <aXnP_6wsyXcVGasN@smile.fi.intel.com>
References: <20260127012558.40025-1-jiangfeng@kylinos.cn>
 <20260127012558.40025-5-jiangfeng@kylinos.cn>
 <aXh93EVRSOrQQS6l@smile.fi.intel.com>
 <dcdb82e8-691a-4cc1-88d5-755039ed0313@kylinos.cn>
 <aXiKelsJF-SiqnVS@smile.fi.intel.com>
 <0d0f0528-738b-402c-a05c-53e21000dc67@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0d0f0528-738b-402c-a05c-53e21000dc67@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_005950_351050_BAF71E1D 
X-CRM114-Status: GOOD (  29.63  )
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

On Wed, Jan 28, 2026 at 09:44:40AM +0800, Feng Jiang wrote:
> On 2026/1/27 17:50, Andy Shevchenko wrote:
> > On Tue, Jan 27, 2026 at 05:33:10PM +0800, Feng Jiang wrote:
> >> On 2026/1/27 16:57, Andy Shevchenko wrote:
> >>> On Tue, Jan 27, 2026 at 09:25:54AM +0800, Feng Jiang wrote:

...

> >>>> +#define STRING_BENCH_BUF(test, buf_name, buf_size, func, ...)		\
> >>>> +do {									\
> >>>> +	size_t buf_size, _bn_i, _bn_iters, _bn_size = 0;		\
> >>>> +	u64 _bn_t, _bn_mbps = 0, _bn_lat = 0;				\
> >>>> +	char *buf_name, *_bn_buf;					\
> >>>> +									\
> >>>> +	_bn_buf = alloc_max_bench_buffer(test, bench_lens,		\
> >>>> +			ARRAY_SIZE(bench_lens), &_bn_size);		\
> >>>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, _bn_buf);			\
> >>>> +									\
> >>>> +	fill_random_string(_bn_buf, _bn_size);				\
> >>>> +									\
> >>>> +	for (_bn_i = 0; _bn_i < ARRAY_SIZE(bench_lens); _bn_i++) {	\
> >>>> +		buf_size = bench_lens[_bn_i];				\
> >>>> +		buf_name = _bn_buf + _bn_size - buf_size - 1;		\
> >>>> +		_bn_iters = STRING_BENCH_WORKLOAD / max(buf_size, 1U);	\
> >>>> +									\
> >>>> +		_bn_t = STRING_BENCH(_bn_iters, func, ##__VA_ARGS__);	\
> >>>
> >>>> +									\
> >>>
> >>> Remove unneeded blank line.
> >>
> >> Will fix.
> >>
> >>>> +		if (_bn_t > 0) {					\
> >>>> +			_bn_mbps = (u64)(buf_size) * _bn_iters		\
> >>>
> >>> Why buf_size in the parentheses here and not anywhere else (above)?
> >>
> >> It was a bit inconsistent. I'll remove the unneeded parentheses for buf_size.
> >>
> >>> I assume it's just an external temporary variable? But why do we need to have
> >>> it in the parameters to the macro?
> >>
> >> This is necessary because buf_size often needs to be passed as an argument
> >> to the function under test. For instance, when benchmarking strnlen, the
> >> caller must pass the current length as an argument:
> >> STRING_BENCH_BUF(test, buf, len, strnlen, buf, len);
> > 
> > Okay, and why is it needed in this macro? It get overridden immediately in
> > the loop. Assuming that the array size of bench lengths is not zero, this
> > has no visible use. Can you elaborate?
> 
> Thank you for the explanation. I see the source of the confusion now.
> 
> In v5, buf_name and buf_size were not intended to pass external variables into
> the macro. Instead, they were naming placeholders for local variables declared
> inside the macro's scope. This allows the caller to define the names used in
> the variadic arguments.
> 
> To resolve the logical inconsistency you pointed out, I'd like to propose two
> options for v6. Which one would you prefer?
> 
> Option 1: Internal Declaration (The "Self-Contained" approach)
> 
> We declare and initialize the variables directly inside the loop. This keeps
> the macro self-contained and the caller doesn't need to pre-declare anything.
> 
> for (_bn_i = 0; _bn_i < ARRAY_SIZE(bench_lens); _bn_i++) {
>     size_t buf_size = bench_lens[_bn_i];
>     char *buf_name = _bn_buf + _bn_size - buf_size - 1;
>     ...
> }
> 
> Usage:
>   STRING_BENCH_BUF(test, my_buf, my_len, strnlen, my_buf, my_len);

This option is better as long as the user doesn't need to know the (stale) data
out of these parameters. And I think this is the case, so #1 is the winner.

> Option 2: External Declaration (The list.h approach)
> 
> The macro expects the caller to provide pre-declared variables, similar to
> list_for_each_entry(). This removes all re-declarations inside the macro.
> 
> for (_bn_i = 0; _bn_i < ARRAY_SIZE(bench_lens); _bn_i++) {
>     buf_size = bench_lens[_bn_i];
>     buf_name = _bn_buf + _bn_size - buf_size - 1;
>     ...
> }
> 
> Usage:
>   size_t my_len;
>   char *my_buf;
>   STRING_BENCH_BUF(test, my_buf, my_len, strnlen, my_buf, my_len);
> 
> Please let me know which style fits the kernel's preference better, and
> I will implement it in v6 along with your other suggestions.
> 
> Thanks for the catch!
> 
> >>>> +					* (NSEC_PER_SEC / MEGA);	\
> >>>> Leave '*' on the previous line.
> >>
> >> Will fix.
> >>
> >>>> +			_bn_mbps = div64_u64(_bn_mbps, _bn_t);		\
> >>>> +			_bn_lat = div64_u64(_bn_t, _bn_iters);		\
> >>>> +		}							\
> >>>> +		kunit_info(test, "len=%zu: %llu MB/s (%llu ns/call)\n",	\
> >>>> +				buf_size, _bn_mbps, _bn_lat);		\
> >>>> +	}								\
> >>>> +} while (0)

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
