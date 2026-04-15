Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122D4F41987
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 09:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVJISeiqQA/dGAitHyeXwYllL9+YEllEK7k1UiYuivM=; b=MoDMNQ+NPy3Pka
	fsSk29jWz43rMSJZNo4Cjus5oYSXlMqaNUBMs702tVACOdCl0I6J1HOJZ8/gqcfAqrgpSL2EzY8YX
	TOpTLPZPKUjjD1F/nkRXefr2L7/6UwGA0QPl/ogcsnoYFNUMeTUgzmMYtAO2PNOK9UCm6S8SCb/C1
	7wbqOatZ/pzy6FR7Uk9vv7dOTyYvap+8PYsu/Ee1CJhrUkljPppqdznLeBTp7aamW3kpZedfzsz1l
	BqwYdwCWeDa7x+f3DGk7a21DO4T6aP/EIvVRZITJe9ezr5qU3wzxN7ptdFAmRzvEozC40aUENqN2S
	NpmERnpNlJHI+UhHDnGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCwvh-00000000vvu-31fj;
	Wed, 15 Apr 2026 09:53:05 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCwve-00000000vvK-3Jap
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 09:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776246782; x=1807782782;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3fk+o8IALEh5DWjkaX/Zs/CY0Fh3YqT3vOmYEv88GKM=;
  b=N5dagH+tLGPDNCvXrRehgw8Gc6Q7/M77Ef3TvhGjQmewic1AbKSTMTuq
   PcF/oGdlskZNNp3Ny3xTIWG1UAf73T+7Sk/EC2qLsd8B3ns2IUZxNHMg4
   6gorZ4lSsbnEkIWoEbj8v5yXzxI3ATkhMN5iK3wj0YxBPcXkZz4kHFxY8
   343jp+R00cP4L2vBsnDT+uwgQtvgjhe9OaHRHEvwMblrubMcqZHXTFf+o
   zH1m2d8eCcXaxOmF2TBDAsIhUuh6SwiaZdmHEIalqidXD/T9TN5tBWeV4
   OsgwX3p8QCE9c0+w8SRxzJZNKK3/m3w5KcQcbwWysuMlOnYEWNsNXwkaO
   g==;
X-CSE-ConnectionGUID: GozD3BwoTwuvFg/Gls80ig==
X-CSE-MsgGUID: SrHkBtMGRGePROrJ3JmhXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="87922047"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="87922047"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 02:53:00 -0700
X-CSE-ConnectionGUID: 2sjnkIYqT9KpS+N/KAee0w==
X-CSE-MsgGUID: N5TzoYGMTWavfr27vstasA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230295052"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.34])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 02:52:58 -0700
Date: Wed, 15 Apr 2026 12:52:55 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH v4 3/3] riscv: fix building compressed EFI image
Message-ID: <ad9f9543RuV17RnH@ashevche-desk.local>
References: <20260414102608.573555-1-dmantipov@yandex.ru>
 <20260414102608.573555-4-dmantipov@yandex.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260414102608.573555-4-dmantipov@yandex.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_025302_844192_EBBE2463 
X-CRM114-Status: UNSURE (   8.93  )
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

On Tue, Apr 14, 2026 at 01:26:08PM +0300, Dmitry Antipov wrote:
> When building vmlinuz.efi with CONFIG_EFI_ZBOOT enabled,
> '__lshrdi3()' is also needed to fix yet another link error:
> 
> riscv32-linux-gnu-ld: drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L49':
> __efistub_cmdline.c:(.init.text+0x202): undefined reference to `__efistub___lshrdi3'
> 
> And since riscv64 can have CONFIG_EFI_ZBOOT but doesn't need these
> library routines, introduce CONFIG_EFI_ZBOOT_USE_LIBGCC to manage
> linking of lib-ashldi3.o and lib-lshrdi3.o on riscv32 only.

Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

I think you need a tag from Ard on this.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
