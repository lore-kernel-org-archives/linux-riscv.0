Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D138FF8862
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 08:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8WKonkJEpMQAIHHs01tWHsl8VxNrErshH0y9WhzQwc=; b=0JmdjWm2L8o2/I
	c4HnDXEEJOvJPQCCYUeoeLDY2IKyzMUc8ITqv01CrzNqB/L5MKF8dRqzkAN/2rke1S0d0RIWpizK2
	5h4uW2Kqgqy4ePz2PQOYMNuIEnK/AZg11bfLcqbmt02l1OcZkgr0xsL2G7kKalxKoWwTZfUwqUAWh
	nN+tCtxa/4RwUqjC7mKEngAL+5UqHtpqeNbS7LXCkUPYOMJT/IZUSJtStjCGCbMZ0+k/ccD+2fvO3
	WWWwgp4yf/wOP3ZTZozgDOvFmjR8rtiXr0pjQG7hwNw3jou53CXiSrArcbQNa9IFNIUYGDSRPjV71
	+l0VQb82feVB5OftPkwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHG6-0000000GRKi-2n67;
	Mon, 27 Apr 2026 08:24:02 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHG3-0000000GRKM-3vjh
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 08:24:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777278240; x=1808814240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HaP7CTCCtZ1ZOWjXU2hqUefh4vpr8nlvgt8UGZh9RVc=;
  b=hYTv6Q/CcVv3fxNzQgvtfYO7N+9HQNBL3PWwUr81MVXZeNEowK6Va/2j
   pkhVzXF3cxeDj/dCaylJRR1HCFYy6ocbSDZ4nuRZoUeHgjLus8E1AUURc
   U2HjFAvZT96yMBA2thuSGEXs/TuIZxm9zw5DEaujiUppuS5FNP05DuiKz
   Y4R+BfZRdmQkM75/WRA13H7IRwZZmZ1cMXqLHBBATvb+eewi5FgcsjPv+
   MxtOzBCY2v8UPyI4XZcfcPfFzIaev04KhLbmgjho+/L6wD1XIgDRI/XNa
   uhvMVsgQiL4PIWY+48T6LYmlrPeYofM9jEcR/gHFnS18tntoaD29/KDF6
   Q==;
X-CSE-ConnectionGUID: o9aG1FW7SSun9VhA8JHvqA==
X-CSE-MsgGUID: P0tMSU/LTdSKutYyqDvwbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78144773"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="78144773"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 01:23:59 -0700
X-CSE-ConnectionGUID: X0ntodF3RxaIzpG7fO82WA==
X-CSE-MsgGUID: B/NAJDAMSiWeQwXb163gxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="256881417"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 01:23:56 -0700
Date: Mon, 27 Apr 2026 11:23:54 +0300
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
Message-ID: <ae8dGrM77NuCe4S0@ashevche-desk.local>
References: <20260425185151.477442-1-dmantipov@yandex.ru>
 <20260425143631.e20246946f59925c5eb8dc22@linux-foundation.org>
 <df673a44d292bb3df498b78a8b637f880e28931f.camel@yandex.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df673a44d292bb3df498b78a8b637f880e28931f.camel@yandex.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_012400_019131_58F22B5A 
X-CRM114-Status: GOOD (  18.63  )
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

On Mon, Apr 27, 2026 at 11:13:20AM +0300, Dmitry Antipov wrote:
> On Sat, 2026-04-25 at 14:36 -0700, Andrew Morton wrote:
> 
> > I didn't upstream "lib and lib/cmdline enhancements v9" this cycle.
> 
> You don't have to upstream v9. Because v9 is v8 + initial RISC-V build
> fix, which is a part of another series (this one) now. The proper sequence
> is v8 + this series.
> 
> > So can we please sort through these things (and the AI review) before
> > adding more?
> 
> Not sure about AI but hopefully human should realize that I'm not an
> expert in m68k/sparc32/xtensa/csky/[your favorite arch here]. Enabling
> and running the test on _all_ architectures where it is expected to 
> work requires obtaining (or even building by myself) a cross-compiler,
> setting up the kernel and QEMU, etc. I've spent a reasonable time with
> RISC-V and ARM and hopefully set up a good starting point for 
> m68k/sparc32/xtensa/csky/[your favorite arch here] maintainers, who are
> free to incorporate the test into their target architecture.
> 
> I'm going to fix everything I consider reasonable, submit v7 and give up -
> because without even a single reply from core RISC-V maintainers, this
> just turns into an endless brain masturbation.

I believe it's better to issue v10 of that series + v7 of this in one go.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
