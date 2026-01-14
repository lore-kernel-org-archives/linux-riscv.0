Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E5DD31A14
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 07:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=78eA3bOCJMBVKtAkC0zgStnFdbfqOrgSH72iowxMbdU=; b=OKV8Erc8rtHhG1
	h4L6fTH2eVc8GqUoC+rDXHbWvmwVVrdjxfB2JdEAPVVRpn91eTlbMjcORBDjaG/TPhDeaHWtNki/E
	/rzT7+Sf6Yy9efEnX0LWev8p16BJIWwE7W2LBpS8SBPKWFXdcafrXPyJ87qHRgqkTvFrX462zws3F
	QYhAakyHMXPndvsxWHirzTep6gf+d5iNxzTebT5emwBvcW4rsnA7as3gdzU93808DKTZHIVYS2ZH2
	KW/cOFERXTFpjyFW5nWMOpl1velLXWM1G7cAoW/CFr8eyvGA4PMXGiLmEfHdBAhaVxkphxLNd7jZj
	LSQGYzpUc4H1qiRwf+tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuyw-00000008AJk-0Fk4;
	Wed, 14 Jan 2026 07:07:54 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuyt-00000008AJO-3Viu
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 07:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768374471; x=1799910471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2z55lQeEFN0tV+1Vom2Fy3lGVm2xlsns7xXqQyYQ5mY=;
  b=SwMpudKrPe/yivx6xiQm0EzmGBxU6jFEr7ptQPtK3u/pjfKeQjdMBv0H
   Jit0K6vAianckXBUEEdIa09SNIf4azgu9vr43yPo0HOeECYVY8PGXN9gL
   NWI/RncnpCylP20rfq3K9bxlwUs+RA3SmYSWup8sxW3E+O1DEN3hNUZYH
   Sj/qtbUT3A+YwuXGPzZYi0LFFry+LufXDI9LaPwTqQZOVq2+O8Ub+W+71
   AOLfzCVkTLdtkt0sZ/Yloibpr5GIKGn2+3nI5coC2SZdbwGV8Doq9nZpF
   qQtNoIT1Im0H1P/b2AtoGbgE36J39zYZRGki58wC/+HsKBVuFTvbqXluJ
   w==;
X-CSE-ConnectionGUID: RTbbzl+cRA+onOJ10E6JGA==
X-CSE-MsgGUID: OUQkGbIDQWWffo0CPp7FcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69588041"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69588041"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:07:51 -0800
X-CSE-ConnectionGUID: mfcot9iJSQ+9+7LLinCy0Q==
X-CSE-MsgGUID: YAYONSpeRc+yCnfwbsdTjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="235317211"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:07:47 -0800
Date: Wed, 14 Jan 2026 09:07:44 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Feng Jiang <jiangfeng@kylinos.cn>, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, kees@kernel.org,
	andy@kernel.org, akpm@linux-foundation.org,
	martin.petersen@oracle.com, ardb@kernel.org,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	samuel.holland@sifive.com, linus.walleij@linaro.org,
	nathan@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 01/14] lib/string: extract generic strlen() into
 __generic_strlen()
Message-ID: <aWdAwHy77V8EiDeX@smile.fi.intel.com>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
 <20260113082748.250916-2-jiangfeng@kylinos.cn>
 <20260114000151.GB2178@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114000151.GB2178@quark>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_230751_970140_6770506A 
X-CRM114-Status: GOOD (  18.40  )
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

On Tue, Jan 13, 2026 at 04:01:51PM -0800, Eric Biggers wrote:
> On Tue, Jan 13, 2026 at 04:27:35PM +0800, Feng Jiang wrote:
> > To support performance benchmarking in KUnit tests, extract the
> > generic C implementation of strlen() into a standalone function
> > __generic_strlen(). This allows tests to compare architecture-optimized
> > versions against the generic baseline without duplicating code.

...

> A similar problem exists with the architecture-optimized CRC and crypto
> functions.  Historically, these subsystems exported both generic and
> architecture-optimized functions.
> 
> We've actually been moving away from that design to simplify things.
> For example, for CRC-32C there's now just the crc32c() function which
> delegates to the "best" CRC-32C implementation, with no direct access to
> the generic implementation of CRC-32C.
> 
> crc_kunit then just tests and benchmarks crc32c().  To check how the
> performance of crc32c() changes when its implementation changes (whether
> the change is the addition of an arch-optimized implementation or a
> change in an existing arch-optimized implementation), the developer just
> needs to run crc_kunit with two kernels, before and after.
> 
> I suggest just doing that.  In that case there would be no need to
> export the generic implementations of these functions.

This also would work for me! Whatever, folks, you find the best from the
readability and maintenance point of view.

> (Also note that *if* the generic functions are exported, they probably
> should be exported only when the KUnit test is enabled.  There's no need
> to include them in the kernel image when the test isn't enabled.)

True.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
