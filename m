Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE84FF885D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 07:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTprRY+zbK6yZ2FB6hs/Tv9GXctnu9XrxYF5kxvSKkw=; b=SXQ++ZPlmvSwxd
	fV7N/kSokUC1KwkL5bkCp2CZQW7YfIA2LBcuBf0nCIO201y6Y7DPkvTg7urwb+cVdm4kMA2NvzreG
	LHyrIK14ZOCLRnV7HUEB7NgXwxxHnOgizY4zSE6c35RGs+T3H/7gBqf/pvr6phsfCE/Dtvdc2N7aZ
	8wBPK+NeRRFqflyhmNqUlVRaA0TSOwjIr1g1iKr5rO5LbzBcYtUKV30UZCJ/SGkfkE2EoYTD5634f
	XLflX9Bz1FL1CCKGP2UWSP3PvPg+wqxWLfEYjXrXhD/AzLDogml9wv1ccLB2y4tWO/zKhqv8g/XNm
	NsgYdgJJtrbMUZAAIf1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcrp-00000000m66-1603;
	Tue, 28 Apr 2026 07:28:25 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcrn-00000000m5W-1R2i
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 07:28:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777361303; x=1808897303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cnLBWFAgnHpFzq+M5i9HhlcSIKs0qTNVPCZxbnKABas=;
  b=bFldBH8dt5SYO/yvTJKuiCgCHc0sL3UP+mlkqKOv7lQS832xaD/j6KxA
   wnojNKcU4Gq1KmUUUIheLOFOZt8tlY+hM63cvcFw3ue4kem3fq3sMiPRG
   hqHTlHwtVfd5xzrop5lOBb7rvvLPrS3vIHkZwF5BJENCYu4pWuW92sg1w
   DCVS4ojWS4p72aOy7t3quvhDDIxJOc2/Gm1XzAVdJ6IeJqRMtOWj0gG/s
   iOhOFhMJglNnkXgSByf8x/VQmkS0lZIubLv0m2ImjFqfZMk5EnG9AhIx2
   IYPxW8iEhpf11hN3MHOnBdauVjDK6T9naU+YpslrsNFWDft5e7oXHVNK3
   g==;
X-CSE-ConnectionGUID: nEYUzG+TRDGzj3o6neU8/A==
X-CSE-MsgGUID: owFdhbYhTeW5Ww4o2XpKqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78281984"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="78281984"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 00:28:23 -0700
X-CSE-ConnectionGUID: J9bnrosjRwSdZz5Wa0Qxlg==
X-CSE-MsgGUID: NPcAeaqjSKeFyRyPDBE/0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="229518477"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 00:28:19 -0700
Date: Tue, 28 Apr 2026 10:28:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/4] serial: 8250_dw: build Renesas RZN1 CPR value
 from DW_UART_CPR_* definitions
Message-ID: <afBhkbGLsuqUitOl@ashevche-desk.local>
References: <20260428-ultrarisc-serial-v5-0-97de63b1e3eb@ultrarisc.com>
 <20260428-ultrarisc-serial-v5-2-97de63b1e3eb@ultrarisc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428-ultrarisc-serial-v5-2-97de63b1e3eb@ultrarisc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_002823_418282_1F6A12CF 
X-CRM114-Status: GOOD (  15.87  )
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

On Tue, Apr 28, 2026 at 01:26:27PM +0800, Jia Wang wrote:
> Replace the magic CPR value for Renesas RZ/N1 with a composition using
> DW_UART_CPR_* bit/field definitions and FIELD_PREP_CONST().
> 
> Introduce a helper macro to convert a FIFO size (bytes) into the CPR
> FIFO_MODE field value, with BUILD_BUG_ON_ZERO() checks for alignment and
> bounds. Use it to replace the literal FIFO_MODE values in the RZN1.

A couple of nit-picks below. After addressing them you can add

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
> +#include <linux/build_bug.h>
> +#include <linux/align.h>

Preserve order, 'a' goes before 'b'.

>  #include <linux/io.h>
>  #include <linux/types.h>

...

>  /* Helper for FIFO size calculation */
>  #define DW_UART_CPR_FIFO_SIZE(a)	(FIELD_GET(DW_UART_CPR_FIFO_MODE, (a)) * 16)

> +#define DW_UART_CPR_FIFO_MODE_MAX	0x80

You used decimal values elsewhere (id est 16), use upper limit in decimal
as well.

> +#define DW_UART_CPR_FIFO_MODE_FROM_SIZE(size)				\
> +	(BUILD_BUG_ON_ZERO(!IS_ALIGNED((size), 16)) +			\
> +	 BUILD_BUG_ON_ZERO(((size) / 16) > DW_UART_CPR_FIFO_MODE_MAX) +	\
> +	 ((size) / 16))

I don't see the need in having that maximum being defined separately (we don't
have that for 16, no need to have it for 128.

Since some ISA:s have one assembly instruction to get both / and % divisions,
it's better to use that instead of IS_ALIGNED(). Can you check code generation
for x86_64 / x86?

#define DW_UART_CPR_FIFO_MODE_FROM_SIZE(size)				\
	(BUILD_BUG_ON_ZERO((size) > 2048) + BUILD_BUG_ON_ZERO((size) % 16) + ((size) / 16))

Note, I dropped first division in order to show the upper limit in a plain
number since 16 is also FIFO size in bytes.

Also note, this evaluates (size) three times, which might be problematic,
but I think we can leave with that for now.


-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
