Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB04D79768
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Jan 2026 09:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6wICWp4a3Xf7r7mk3BGKlRj8VpQa00YUsiG3whB9lqc=; b=OcHGk0/hIGtpP+
	mFbNgAv/HPwbUUBRnJCOlfqw2cZg1y4bHO4y1tC2VY4BHQoHM+xp56b8QHMCiW/2oYNAUf5tEdDQo
	MwoO6pBkjveBBS2w/Qx65m1ZCQYTmdznVbpNKIkd7IALN+4Fv8bFnbEvv/GWWFdo4eXqYoofz3pmz
	pbq32y3JhbgHI3KzVmc/o0MKP9V/e+V5BAekaSUiLWcL23xcKhIB7uPetLdOcnLhTSaRlAJppa56H
	vww/wb6Ukz5S3+zRWxiQpYHKabX3ub+P5PT4pJrRQD0O8tb1JlNmQ+BpqlKfpF6AG7IE7bkqlbHH5
	1IF4DteU2s4feocs1VvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm7ei-00000002T9F-2peG;
	Sat, 31 Jan 2026 09:52:40 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm7ef-00000002T8t-17f1
	for linux-riscv@lists.infradead.org;
	Sat, 31 Jan 2026 09:52:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769853157; x=1801389157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=prkCbPpCK0uSsTKs9tYKLKVPMYFEczVRQ2cVcHOj6bk=;
  b=Vo936ra0FK5FgbJi3WRG5n02Vmsyf3XfRtUdMJtqwiK6K1RlZ1cmkdnF
   FLPeVJmmHwp4/iu5Spep1lPLIQdfcA0aZaxJScPxGXesIOQHY2rEP8XGT
   YCxlUt4+UsEUQXVAZyc5Q/dWOqgHGHvNmWigBGmcgXAWEItUygGAnCgee
   yVf3BE5zTeNPB2LMpRCWBENe6PiMN19RI8EDj7KqUAVnwjq29Ytd63HLZ
   yPsDqxKo0xKkHyI0in0RqGWM6tsZ4yhWlmAUckZU/Y6SU28P3/0VcdUDM
   raI5IPu1WyKY2i+6rPUaXvIjD0Idrdw2S+PA9BxqqdSKHD7R6R6TcPPqb
   w==;
X-CSE-ConnectionGUID: dKLFkiFgSvW5yeShGzIGFA==
X-CSE-MsgGUID: c+a7cv+WQoKfWqK/o/vmNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="81825384"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="81825384"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 01:52:34 -0800
X-CSE-ConnectionGUID: 8oBHYl3SRW+h/ERs3D/XjA==
X-CSE-MsgGUID: idkdaagRRoOHqiianH1HEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="209287642"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.97])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 01:52:29 -0800
Date: Sat, 31 Jan 2026 11:52:28 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: Feng Jiang <jiangfeng@kylinos.cn>, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, akpm@linux-foundation.org,
	andy@kernel.org, ebiggers@kernel.org, martin.petersen@oracle.com,
	herbert@gondor.apana.org.au, samuel.holland@sifive.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	charlie@rivosinc.com, nathan@kernel.org, linusw@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v7 0/8] riscv: optimize string functions and add kunit
 tests
Message-ID: <aX3Q3O8qEasNeso8@smile.fi.intel.com>
References: <20260130025018.172925-1-jiangfeng@kylinos.cn>
 <202601300936.6EDA32E96@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202601300936.6EDA32E96@keescook>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_015237_348696_BA5D7214 
X-CRM114-Status: GOOD (  11.44  )
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

On Fri, Jan 30, 2026 at 09:37:36AM -0800, Kees Cook wrote:
> On Fri, Jan 30, 2026 at 10:50:10AM +0800, Feng Jiang wrote:
> > This series provides optimized implementations of strnlen(), strchr(),
> > and strrchr() for the RISC-V architecture. The strnlen() implementation
> > is derived from the existing optimized strlen(). For strchr() and
> > strrchr(), the current versions use simple byte-by-byte assembly logic,
> > which will serve as a baseline for future Zbb-based optimizations.
> 
> I'm happy with the Kunit elements here, so unless Andy has other
> feedback, please feel free to take this via the riscv tree. (Or if riscv
> maintainers would prefer, I can take it via string.)

I have an impression that I already gave some tag. Why aren't not here?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
