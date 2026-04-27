Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29455FF8861
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 08:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZfUyvHUr6UoxRDlxGmGcIht5qJds9egQf+nUNKHw84=; b=ITeN4OIAAojJN4
	nvmZEfPaSuDGDLRHNguHEaWFF/zYa+baWW1K7Cn0ZvzF3rtwoSUuH+acgIDeyi4pASz2KMIPWS4Cp
	jCpp8aXXK8R6NKegkkM7iH7wdDM2P1gAoHt4knKvjlvIt0b1JOd3VJAgEhWRwsKSa/3ssT6y2traT
	kw5xUxHFrngPNgUBIDIeROUXooA7GWqcrORKKg6H2C2dWGoBVeky0CFHSIgk7qmA3OMzEx9OdAUVH
	bCJaVq5STHxbN9Vg7nliNf9kaRRyFaxnGt9cpxkF45xO7oN2h4D+xTvgeep0wlIewQJAw2XIh9sxN
	9hZw2KGLOQxbGD2nMn+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHHe-0000000GRlb-34ic;
	Mon, 27 Apr 2026 08:25:38 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHHb-0000000GRhq-1mYH
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 08:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777278335; x=1808814335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=trwJAd2yBWHkILnEXCJ4c6+mvrmlRaN5OpdL393pF10=;
  b=FaGP0NdvkyFJeopIk5bVAFOGxJCBonNHeks0jZCuGQ7/RqNcD0g0xOPX
   ne29Ju7UgXeTqiHo1BFUMe/IOip7k9URjmM+kpnmUyB0eswkQH8IoTHNt
   ljPg9O2NPrLeg8edmni3R40MshcL+GoQ6PqhEFcuJKYgp/rYIljQ3MaHB
   Go/nE2J+CuZBOv+8XvvHFwW9hCykN4GnS4/bON3aWQBfpXXR8UpP+T9p8
   PZ3vYVdNtEpzYLzxB2MY0GbnLUqZWiXmSqZ63+/2KRoNdRUSdXWXwPq8V
   +eXJJJXVyrve/y+La1AJyC1XEGPa/IU8qzQzYQffc7qfPH2DWq6RG+vpA
   g==;
X-CSE-ConnectionGUID: vUn5eGF0Q8qeM5HqMdtlfQ==
X-CSE-MsgGUID: qzl8BLp5Qy6+Z+5tPnykwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="65692787"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="65692787"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 01:25:33 -0700
X-CSE-ConnectionGUID: Rt43cVzzR7CL+Yw1ftCHMA==
X-CSE-MsgGUID: z3CqV+k1RiqvXrq9MZ8tsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="237533351"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 01:25:31 -0700
Date: Mon, 27 Apr 2026 11:25:28 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] riscv32 library enhancements and build fixes
Message-ID: <ae8deOQyKa_j0Jb8@ashevche-desk.local>
References: <20260425185151.477442-1-dmantipov@yandex.ru>
 <20260425143631.e20246946f59925c5eb8dc22@linux-foundation.org>
 <df673a44d292bb3df498b78a8b637f880e28931f.camel@yandex.ru>
 <ae8dGrM77NuCe4S0@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae8dGrM77NuCe4S0@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_012535_515479_3EA5CD48 
X-CRM114-Status: GOOD (  22.74  )
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

On Mon, Apr 27, 2026 at 11:23:59AM +0300, Andy Shevchenko wrote:
> On Mon, Apr 27, 2026 at 11:13:20AM +0300, Dmitry Antipov wrote:
> > On Sat, 2026-04-25 at 14:36 -0700, Andrew Morton wrote:
> > 
> > > I didn't upstream "lib and lib/cmdline enhancements v9" this cycle.
> > 
> > You don't have to upstream v9. Because v9 is v8 + initial RISC-V build
> > fix, which is a part of another series (this one) now. The proper sequence
> > is v8 + this series.
> > 
> > > So can we please sort through these things (and the AI review) before
> > > adding more?
> > 
> > Not sure about AI but hopefully human should realize that I'm not an
> > expert in m68k/sparc32/xtensa/csky/[your favorite arch here]. Enabling
> > and running the test on _all_ architectures where it is expected to 
> > work requires obtaining (or even building by myself) a cross-compiler,
> > setting up the kernel and QEMU, etc. I've spent a reasonable time with
> > RISC-V and ARM and hopefully set up a good starting point for 
> > m68k/sparc32/xtensa/csky/[your favorite arch here] maintainers, who are
> > free to incorporate the test into their target architecture.
> > 
> > I'm going to fix everything I consider reasonable, submit v7 and give up -
> > because without even a single reply from core RISC-V maintainers, this
> > just turns into an endless brain masturbation.
> 
> I believe it's better to issue v10 of that series + v7 of this in one go.

(I meant v8 of that as you said + v7 of this one as v10 of that one, and sorry
 for any confusion I added in the previous reply.)

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
