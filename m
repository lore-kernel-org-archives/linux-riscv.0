Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1717ED29DEC
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 08:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FhLoSooPsP2GqtZUGWLTI2WvT8nNs3pD8Sl0cXbhoHg=; b=sbVHDl577IV0sV
	1FqW6vb0XKEOC3trwMbleX/ZQHmG+ZEHjClukHEvIs3ITLQwekKjebrtvXWku9tH/7ww6wIBQZ9BJ
	MM9V0feG8LgH0XfV5V3VzKS/4nl6dxUddrUviewtF/ttOpMbnx7TWhMesV+FGTYKywktJ+DqtmJr4
	gdWPDDThFA790lskLyH44SwS08/WsSB8zwtmcbzjCoLa6KjB1KfbN/modPL6TozCKj3sjR0cHOekQ
	gAl6t+h8R37vxsRNMMeLGdIj2AiC6o5emGci5FvB7zFYBIHMFZQAn3zwQzghGFtoVJkdZ0Rw+Hp6+
	SfQf9FldiNaKsb/2a79Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfa8k-00000006mOo-23ch;
	Tue, 13 Jan 2026 08:52:38 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfa8i-00000006mOS-08cP
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 08:52:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768294355; x=1799830355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2w9juWxXXUE4lrZsuZProFjKz0C3LTNwy37wnA64u30=;
  b=InLGY35GOwOiHejVrVIn9drnaJJzhBQHaeRy+45aPTdvuzh2RH140T9X
   x5oTvqkzY6DX2azy1eOWqARwjvBLfJh5uD6l+otnzwPm2cEHHXRClMQ4v
   kge45Ll4a/4qg2m4+fTMuLJLybnkKozvXR/Ooo+hsI+c9pRCCIMi0d3wq
   AlOnQNlhPPhKAdMj+auIL2uG2a+uLLGWNGr/iGbQFittRwwHtl9zEX4FD
   6VbBlULPgYP2AdL7gXpzn7gkiuYOxnNv+kj3O2HPG6thHoOs/PHM55UVi
   XfuYAtArZbB9IgVvcs3a9mI/GVtpDFjufu8BB/qD7t1aX+xi0Cu7nzrCv
   Q==;
X-CSE-ConnectionGUID: Ur+7waRfSYi4lKB+VsZ7lQ==
X-CSE-MsgGUID: JBlVencATayD80+CxdnrQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="92242448"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="92242448"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:52:34 -0800
X-CSE-ConnectionGUID: RGJCxMJOTQu/YvscrZy7KQ==
X-CSE-MsgGUID: 7SfGecD0TqqSkqhlMfWbuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209160773"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:52:30 -0800
Date: Tue, 13 Jan 2026 10:52:29 +0200
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
Subject: Re: [PATCH v2 00/14] riscv: optimize string functions and add kunit
 tests
Message-ID: <aWYHzYRdba03HSIH@smile.fi.intel.com>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113082748.250916-1-jiangfeng@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_005236_119076_37417A07 
X-CRM114-Status: GOOD (  11.94  )
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

On Tue, Jan 13, 2026 at 04:27:34PM +0800, Feng Jiang wrote:
> This series introduces optimized assembly implementations for strnlen,
> strchr, and strrchr on the RISC-V architecture. To support a rigorous
> verification process, the series also significantly expands the
> string_kunit test suite with both functional correctness tests and
> performance benchmarks.
> 
> The patchset is organized as follows:
> - Refactoring (Patches 1-4): Extract generic C implementations for
>   strlen, strnlen, strchr, and strrchr into exported __generic_* functions.
> - Correctness Testing (Patches 5-7): Extend string_kunit with detailed
>   functional tests for the target functions.
> - Performance Benchmarking (Patches 8-11): Add a benchmarking framework
>   to string_kunit to measure execution time across various string lengths.
> - RISC-V Optimizations (Patches 12-14): Provide the optimized assembly
>   implementations for the RISC-V architecture.

...

>         # string_test_strlen_bench: strlen performance (long, len: 2048, iters: 10000):
>         # string_test_strlen_bench:   arch-optimized: 14100 ns
>         # string_test_strlen_bench:   generic C:      35605600 ns
>         # string_test_strlen_bench:   speedup:        2525.21x

Doesn't sound right. I think you measured cache performance and not your algo.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
