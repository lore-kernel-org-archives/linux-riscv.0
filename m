Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A70CD2ECF9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 07:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oHCA/vgiIvZWmgQ7T22guStFVUuFb4mUjCqKNDk2rHE=; b=pCe6VaMR9a+6B/
	LvBHmsyX896D/5mTvoOP07lHomXgkg51lRWuD3U39k7jX8L8vo7DIVRB+WAB647qYgUnllBMU3n4r
	+DcAnznNdnN86/K0TYQp4tTlQLQUsAEq9K4CNB2X0NvwfFkApQ3jhy1HZzk+HMsRXscqMS3KL8m3r
	Xadehk28Uz7hQRU6NhObvBbxdmwhhBLBojXiw7kDLx6mqkV9FJNY03Om9Np1b4ilvht5EF1o9ZlbN
	R0rblKF2DaY6j909jhsM3MGW9O+s5tayE1M/e0V8wvDgIbzIrDe7Bd1g3oDBvc2wfvFkBN7oXaKDO
	mlzkzlOyiD2/EQc+vHIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6IB-00000003MLC-2FTu;
	Tue, 20 Jan 2026 07:36:47 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6I8-00000003MKq-1hIM
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 07:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768894604; x=1800430604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dY/ITLky4ksuqTvlk+bheOz2RwnVsxxlZhktw+2usFw=;
  b=IFs002E5CB9Jo/ApkeKzJQUxVeNSLJloUBTGMoVWOz/xk/Xcx/YkIyq9
   xO1lQF+Cifstp1OprEI9DhEk3ZV/JAW+fuukJ6qlmZKePMlNZRTtZYBwz
   6OEKFfKC540VoOW3kAXjrbnwlWc3PCNGifm/F6BDnmfkF+ZFkHAcL3dlT
   3kFe9p1CpA5B2SBLDowlxi8U/RoKMFkd1qJGwD8RKSWGD0wvW7nGKl9cZ
   kjryP/Tfh4YC0+jeIT9cFax/FR8kZQ+TW4kaiGLbK9apVmJ+sdDnrQeyA
   qvXBwZql9Dv4iexknXNHMZRD0KrTPIAlr+TJN6qxPNs7do2Xqb7dxeOZL
   A==;
X-CSE-ConnectionGUID: IVNHtZMHQ5KBntzcM4HcSQ==
X-CSE-MsgGUID: XJWf20mNRQmEcE3PDM3a8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="80817809"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="80817809"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:36:44 -0800
X-CSE-ConnectionGUID: aHKjsF1ETVKAm/rOnd05ig==
X-CSE-MsgGUID: kqcYcfVPSbeawduoR8Oxig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="205198375"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:36:39 -0800
Date: Tue, 20 Jan 2026 09:36:36 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, akpm@linux-foundation.org, kees@kernel.org,
	andy@kernel.org, ebiggers@kernel.org, martin.petersen@oracle.com,
	ardb@kernel.org, charlie@rivosinc.com, conor.dooley@microchip.com,
	ajones@ventanamicro.com, linus.walleij@linaro.org,
	nathan@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 0/8] riscv: optimize string functions and add kunit
 tests
Message-ID: <aW8whGcAR0x6FSRJ@smile.fi.intel.com>
References: <20260120065852.166857-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120065852.166857-1-jiangfeng@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_233645_074393_C399E06A 
X-CRM114-Status: GOOD (  18.65  )
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

On Tue, Jan 20, 2026 at 02:58:44PM +0800, Feng Jiang wrote:
> This series provides optimized implementations of strnlen(), strchr(),
> and strrchr() for the RISC-V architecture. The strnlen implementation
> is derived from the existing optimized strlen. For strchr and strrchr,

strchr() and strrchr()

> the current versions use simple byte-by-byte assembly logic, which
> will serve as a baseline for future Zbb-based optimizations.
> 
> The patch series is organized into three parts:
> 1. Correctness Testing: The first three patches add KUnit test cases
>    for strlen, strnlen, and strrchr to ensure the baseline and optimized

strlen(), strnlen(), and strrchr()

>    versions are functionally correct.
> 2. Benchmarking Tool: Patches 4 and 5 extend string_kunit to include
>    performance measurement capabilities, allowing for comparative
>    analysis within the KUnit environment.
> 3. Architectural Optimizations: The final three patches introduce the
>    RISC-V specific assembly implementations.
> 
> Following suggestions from Andy Shevchenko, performance benchmarks have
> been added to string_kunit.c to provide quantifiable evidence of the
> improvements. Andy provided many specific comments on the implementation
> of the benchmark logic, which is also inspired by Eric Biggers'
> crc_benchmark(). Performance was measured in a QEMU TCG (rv64) environment,
> comparing the generic C implementation with the new RISC-V assembly versions.
> 
> Performance Summary (Improvement %):
> ---------------------------------------------------------------
> Function  |  16 B (Short) |  512 B (Mid) |  4096 B (Long)
> ---------------------------------------------------------------
> strnlen   |    +64.0%     |   +346.2%    |    +410.7%

This is still suspicious.

> strchr    |    +4.0%      |   +6.4%      |    +1.5%
> strrchr   |    +6.6%      |   +2.8%      |    +0.0%
> ---------------------------------------------------------------
> The benchmarks can be reproduced by enabling CONFIG_STRING_KUNIT_BENCH
> and running: ./tools/testing/kunit/kunit.py run --arch=riscv \
> --cross_compile=riscv64-linux-gnu- --kunitconfig=my_string.kunitconfig \
> --raw_output
> 
> The strnlen implementation leverages the Zbb 'orc.b' instruction and

strnlen()

> word-at-a-time logic, showing significant gains as the string length
> increases.

Hmm... Have you tried to optimise the generic implementation to use
word-at-a-time logic and compare?

> For strchr and strrchr, the handwritten assembly reduces

strchr() and strrchr()

> fixed overhead by eliminating stack frame management. The gain is most
> prominent on short strings (1-16B) where function call overhead dominates,
> while the performance converges with the C implementation for longer
> strings in the TCG environment.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
