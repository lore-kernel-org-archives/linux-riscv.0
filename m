Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF41CD29DE2
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 08:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9aj/6JwRGIiK7wFt3VU1sdh4HlozCo4S9FcmIgKx4Co=; b=NX6f6kB4eudj/8
	eougQeWB1gX9neY3k2Ad2Kfllx+iJE+r3wF1nF6q87K3fbk/NPdbUSSD1qFgSPQO1rWAapHumO6ab
	WuyOoovDSKjBy6fP6hN4Jv8e7H+AOMrMNbGLdWjLOTGMiEPRaPyzZ4PeY0EcXpLXyFZZcOR26juLA
	W5V19fowIAKtOss0mbuNMlaHvKdA8sSCTa5HeX+/DaBuFs7lrJB8uk/wxwV8Tsg3cuOIjtezGKZyJ
	z6+N2XCrnDNFrg3MOPWhVJlWSVtxRFNYqjEPpu32gCQc9qmu2ovxZ6OnJZOJPO/dGIwa3av1A/CKQ
	UgdtSdYC5FRhYo8Y7SZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZqd-00000006l94-2bTk;
	Tue, 13 Jan 2026 08:33:55 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZqa-00000006l8j-37su
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 08:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768293233; x=1799829233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RfLPpuK/xE7+cwBI1b9GZkSf4/NJpfjShFhEo3OgYHY=;
  b=B8206FpmNA842ijXy8b3nHlO5+47mVLpRCsUlrb4G5ZDndSnj3rZEInF
   bBPbi1lHVgrHmPv9wAU1Ujns/vJ319TNnD8IhPsLBVOckCbRbIJzfMcZi
   CUyWSeXCHiOfBI/J+y3YqyRo2LIxaFB+7Src0hGODRqS5nj0/VjhLSEqr
   +UV4PEFsSZLiVzayGafFwpTkYOWuQpJgpjJ7H8S3Az5jGc5MZ4odKqEXY
   cgT3CLprIhLmx/i2BHPKLoqmUjQzi54mA0wnRX1EDKHZzUf8rgR87xDhd
   s5OIN/rUYmJYVfzCH8uMcV3vMeLMN6AWpUZCi8LL2TNY4oXEr2EA3Jz3X
   A==;
X-CSE-ConnectionGUID: 6TMJbAQ5QsSP7+j5aUMWhw==
X-CSE-MsgGUID: iayRgIyMQQq1OrGJFxjD9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69626328"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69626328"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:33:43 -0800
X-CSE-ConnectionGUID: W9lBRYe6R0SBLa8X6E4qkw==
X-CSE-MsgGUID: /AZrUJsHQ9+3DfAOZclyHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209156424"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:33:39 -0800
Date: Tue, 13 Jan 2026 10:33:37 +0200
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
Subject: Re: [PATCH v2 01/14] lib/string: extract generic strlen() into
 __generic_strlen()
Message-ID: <aWYDYRVmad6k14fZ@smile.fi.intel.com>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
 <20260113082748.250916-2-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113082748.250916-2-jiangfeng@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_003352_796780_E599D846 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jan 13, 2026 at 04:27:35PM +0800, Feng Jiang wrote:
> To support performance benchmarking in KUnit tests, extract the
> generic C implementation of strlen() into a standalone function
> __generic_strlen(). This allows tests to compare architecture-optimized
> versions against the generic baseline without duplicating code.

...

> +size_t strlen(const char *s)
> +{
> +	return __generic_strlen(s);
> +}
>  EXPORT_SYMBOL(strlen);

There is no point anymore to have this as an exported function, right? So it can
be moved to string.h as static inline.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
