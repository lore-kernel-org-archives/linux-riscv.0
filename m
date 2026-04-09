Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1EAE9DE68
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 08:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9HSMlCnCN0bdjBP9mIvaiiAwIs26tAyoekRRi2I6X7c=; b=myCP++ldcalde6
	IJT1REslOVXdX+Bhp5hIdy2yF2l/vOCFcJ6cOFi5n3N1yNdQzvbpkjHRhYVrJIzQbCd2lJZxTKV3W
	BIv8OEfbem6W1TdPyGuYnAau76LQjLJhIYLCXxVnxmm/+ChevPM2GKiJED230bTuQjTzV0ebXmCvi
	blg63JrJl42SZoqpATRXZDT4GTpT2FJmOErJPXtM+XB4kRqXngIQeq3Co51mA4AHdwz6BBlapKR3e
	r7B2aS6fWdX4R0x+ueVPFR1JcYDB8DPuhrIFei1KhBLMkJi4cSPVPs2wUXSngXBxRSRThTaHU2hv7
	g+O9agau3Hfxgcx+hADg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAl6s-00000009ysl-19Ma;
	Thu, 09 Apr 2026 08:51:34 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAl6p-00000009ysM-0U2W
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 08:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775724691; x=1807260691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O9w1M17xx3f85x9wbHEdMuKroOeuT9XGJrpq17rO9ps=;
  b=fkH4xThSFzq9pkKg58ZfTjvoP/SaBCkNChnAC9nRJ0GId0mqqoRvN7sU
   TZT258Surg9as89Ae8fLvT1p3YTnAOF7U5BQNEM5G1rzFaXSQicaqI+yP
   5vQv6hcCONb5reC2Dh19FC1sA9SHK5mCUmVqBq6nLIDY9LnVVI+XsxzX5
   PG3XaOQ0kXJHuih4b+I7R+u7UEcfCUb0s6J44/Yy+OmK40XNOduoWG/Va
   7HP23MQ5/YdbQlppPWtZ66OxC2Zt3H5+k1bsHC0FS+tcgkG6eb6HvDmtI
   cqhYDadXvj9RxS/tafCDp4EaiaqxXPKySnInfmTUIc5EDuzuxP/blP65M
   w==;
X-CSE-ConnectionGUID: q7NjeTagSy+L9qZt822Aag==
X-CSE-MsgGUID: l/qzeDx7SL2rgAxPkrpYxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76602780"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="76602780"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 01:51:30 -0700
X-CSE-ConnectionGUID: C8XW1grwQmy4ERag0KIsWw==
X-CSE-MsgGUID: sDAlntsWTLmmp5fDK3+zxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="233609780"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.162])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 01:51:27 -0700
Date: Thu, 9 Apr 2026 11:51:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Dmitry Antipov <dmantipov@yandex.ru>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Kees Cook <kees@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, linux-riscv@lists.infradead.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v9 6/6] riscv: export symbols needed for riscv32 EFI stub
Message-ID: <addojV2U2ol7UZp9@ashevche-desk.local>
References: <20260403103338.1122415-1-dmantipov@yandex.ru>
 <20260403103338.1122415-7-dmantipov@yandex.ru>
 <20260409050018.GA371560@inky.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260409050018.GA371560@inky.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_015131_202473_84510CA4 
X-CRM114-Status: GOOD (  15.31  )
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

On Wed, Apr 08, 2026 at 10:00:18PM -0700, Charlie Jenkins wrote:
> On Fri, Apr 03, 2026 at 01:33:38PM +0300, Dmitry Antipov wrote:
> > Fix the following link error observed when building EFI-enabled
> > kernel with CONFIG_EFI_STUB=y and CONFIG_EFI_GENERIC_STUB=y:
> > 
> > riscv32-linux-gnu-ld: ./drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L49':
> > __efistub_cmdline.c:(.init.text+0x1f2): undefined reference to `__efistub___ashldi3'
> > riscv32-linux-gnu-ld: __efistub_cmdline.c:(.init.text+0x202): undefined reference to `__efistub___lshrdi3'
> > 
> > Note: compile (gcc 15.2.1 and clang 21.1.8) tested only.
> 
> I attempted to boot this on riscv32 in qemu with u-boot. I used
> CONFIG_EFI_ZBOOT to generate vmlinux.efi. With this option enabled,
> there is the same undefined reference errors with this patch applied.
> I have not found a good way to resolve this issue, so I resorted to
> copying the __lshrdi3() implementation over into
> drivers/firmware/efi/libstub/riscv.c and that successfully booted with
> EFI.

Thank you for trying and testing this.
Can you instead this patch take the mini-series from 20260409033824.465455-1-dmantipov@yandex.ru?

> > Closes: https://lore.kernel.org/oe-kbuild-all/202603041925.KLKqpK6N-lkp@intel.com

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
