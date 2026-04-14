Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F644ED7B87
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 08:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2nJ+xHuBMeWgqR3UuLoP1sAqvnlA0xy4l9AR6Z3yRU=; b=Tbr9N1HnCK9vSI
	Ca/E9F0FIpoHYlIqYLteWEhVqFad+p+ix7G3lY7hLDGSnP6WRmje3ROKru3Sw4c4gtmTJ54VGBuhp
	niAnn/YZSngiW3cTvOa9tDP+m797m0KEK+pgn+AW2J9+Hv7RxGcNnjv77RXZjAw5yRWG+rNWi+Tbh
	rRBc9+gAbHYRF5g59OdoFAB+8iEyKI5JhsrlBpd3yuWw3eNopKHAIAn7bBhlABCdCY/SlZqWIjOpz
	O//TXA6qU2Feo+Q1hosR/piN0AsMP1L2tB9UE8rZpoAtLcUqR83/11UBaTP+S5rxukVNAc3yJJwlk
	gj/C+f0kk7F+YQHNCeEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZGy-0000000H0AS-1N0q;
	Tue, 14 Apr 2026 08:37:28 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZGv-0000000H09s-2y4b
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 08:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776155845; x=1807691845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=26O8cdHKpRYtvo/zFt3CDmsve2vQRXicAvNUHovWsN0=;
  b=hBpfPoG0fYxvzWrRQlQQAjKC4onMTyCBLhCXqxfhsGiOw8s+bCfbK1Z2
   2+n2ybxGbN10rFIpCw/d9VjACgw3UcVOKC6Dk2Wa2bVQkBohsJFm+s6su
   ARwi5I05vfZm5E9d9Xq87eVcVcuH1NjCHp1d10LZiQNIePHAZgWj8IxCQ
   MAlvjQRdRBxp3IqhjwFoL0bwjS60C3DSQrkTkqgDeJJhCeq6Iju7AzRAs
   5irtbK5JLmFWnwp1zDYu5kHPWxJo+GPGckMY0NjLFMr+km7fcI2IbNvS6
   mGoB5qtCWtoqwmIe66LzUg26b7bFkg6cciPWJ44EpgiI1nyoCvZg2v03/
   g==;
X-CSE-ConnectionGUID: VXCxPwE+TQG92AE2xVUgMg==
X-CSE-MsgGUID: +kaD4w+VSHu0x+L9eYor3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="102562505"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="102562505"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 01:37:24 -0700
X-CSE-ConnectionGUID: GzmXz62ZRy62907bzdR8Rg==
X-CSE-MsgGUID: gFsjhr4BSEOlxHDq4WhHNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="234430368"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 01:37:23 -0700
Date: Tue, 14 Apr 2026 11:37:20 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH v3 3/3] riscv: fix building compressed EFI image
Message-ID: <ad38wBx9HIajbjv2@ashevche-desk.local>
References: <20260413092202.174394-1-dmantipov@yandex.ru>
 <20260413092202.174394-4-dmantipov@yandex.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260413092202.174394-4-dmantipov@yandex.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_013725_775221_1E0E342B 
X-CRM114-Status: GOOD (  11.15  )
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

On Mon, Apr 13, 2026 at 12:22:02PM +0300, Dmitry Antipov wrote:
> When building vmlinuz.efi with CONFIG_EFI_ZBOOT enabled,
> '__lshrdi3()' is also needed to fix yet another link error:
> 
> riscv32-linux-gnu-ld: drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L49':
> __efistub_cmdline.c:(.init.text+0x202): undefined reference to `__efistub___lshrdi3'
> 
> And since riscv64 can have CONFIG_EFI_ZBOOT but doesn't need
> these library routines, introduce CONFIG_EFI_ZBOOT_EXTRAS to
> manage linking of lib-ashldi3.o lib-lshrdi3.o on riscv32 only.

> Reviewed-and-tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

At most we use Reported-and-tested (as they have at least some relationship),
but these two (and in general the combined tags are discouraged) must be split.

> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

...

> +config EFI_ZBOOT_EXTRAS

Can we name them rather after libgcc?

Exempli gratia

config EFI_ZBOOT_USE_LIBGCC

?

> +	bool
> +	default y if RISCV && 32BIT

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
