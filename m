Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53D1FE51FB
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 10:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pz3a8ZBOkz0zM0G3mGpwit5FfS/YRfCkATPrh5rikB8=; b=wwpg6U/rTq+O3L
	4HvfTdlGV7O2V9MdN2DyFHtcovd24POmxgtU+UVTjNm8cHouZmVpdPoTS3cEuxUvlxGrZttqUiQ+c
	B8yrSfTOBXTd7uiMgT4lKFzPlAxc9Zw7KReccWv72M5PVsw0MFIrsL5cAwNKsqpxAr0NYolebMOJ6
	dZNYGr/8PTWyvUWdMDrJuBTRRXleHr1qMKGpW8ZwDqpTAhPRWmP2af+cdaZRfq7AI1XP5qb7tRPM+
	n0G43drQ8G8AEgxs7vWQ20y74vi/s2LXYf8WExsPddgtdtMg96S9icnHUUaxF24uJfDfD0E6fCJMV
	QSC173ZQrKVuqkekc24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDNH-0000000CzPL-1nML;
	Fri, 24 Apr 2026 10:03:03 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDNF-0000000CzP0-3Z3X
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 10:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777024982; x=1808560982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3O0hkOr0ra+XwzgaJg/mBljF+oLjMea8qTbme5+LGj8=;
  b=ReVvdAbBkfwfzD6GUE/LdvDFTeDHmbMrrE9jbDRNZ0hQMNjv1NE7JnQX
   QOBTf3zgOHTFt7ChCprBdEUOPcA9vxy6uNm1O1EOdQJPxSjgymPOjxRlj
   NzjY8vi9zApWuNA1lTMm2tAwwCGz3szlfF3Lz2ipOqAJw+4BSdMbfpa7G
   qy99lyf3yrGYVsMoc+5xwHwO5NVN29itl44ek7hgVcUezCOYfIWnejJ+l
   4Vw+3pQcNVVDYo6CgUVCWyrji+Dj3HJXD20hy+FcqpLZdB4LdJ1pn7r/x
   lcUujJ2hy/QLtBRg1bG0WrxRvGdbTvcqW4kKbItPslJp5iO6ZdvGJk8ER
   w==;
X-CSE-ConnectionGUID: aE1eVQIFSGSTO+06PgjtdA==
X-CSE-MsgGUID: WH8OpNuaSWODjgmn3HvhQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="81610836"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="81610836"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 03:03:01 -0700
X-CSE-ConnectionGUID: ukFTa7PlSa2Zz1lCOXIFZw==
X-CSE-MsgGUID: +82JyomrSpmxCXnW6i7e8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="237970033"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 03:02:58 -0700
Date: Fri, 24 Apr 2026 13:02:55 +0300
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
Subject: Re: [PATCH v4 1/4] serial: 8250_dwlib: move DesignWare register
 definitions to header
Message-ID: <aes_zx9GdaXnDNqG@ashevche-desk.local>
References: <20260424-ultrarisc-serial-v4-0-1765a0b4c4a0@ultrarisc.com>
 <20260424-ultrarisc-serial-v4-1-1765a0b4c4a0@ultrarisc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260424-ultrarisc-serial-v4-1-1765a0b4c4a0@ultrarisc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_030301_948628_BD669C5C 
X-CRM114-Status: GOOD (  11.46  )
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

On Fri, Apr 24, 2026 at 01:39:28PM +0800, Jia Wang wrote:
> Move the DW_UART_* register offsets and CPR bit/field definitions from
> 8250_dwlib.c into 8250_dwlib.h so they can be shared by 8250_dw and
> 8250_dwlib users.
> 
> Add an include guard for 8250_dwlib.h.

...

> -/* DesignWare specific register fields */
> -#define DW_UART_IIR_IID			GENMASK(3, 0)
> -
> -#define DW_UART_MCR_SIRE		BIT(6)
> -
> -#define DW_UART_USR_BUSY		BIT(0)
> -

One nit-pick, though, these three need the similar comments in the header and a
blank line between them.

...

> +/* Offsets for the DesignWare specific registers */
> +#define DW_UART_USR	0x1f /* UART Status Register */
> +#define DW_UART_DMASA	0xa8 /* DMA Software Ack */
> +#define DW_UART_TCR	0xac /* Transceiver Control Register (RS485) */
> +#define DW_UART_DE_EN	0xb0 /* Driver Output Enable Register */
> +#define DW_UART_RE_EN	0xb4 /* Receiver Output Enable Register */
> +#define DW_UART_DLF	0xc0 /* Divisor Latch Fraction Register */
> +#define DW_UART_RAR	0xc4 /* Receive Address Register */
> +#define DW_UART_TAR	0xc8 /* Transmit Address Register */
> +#define DW_UART_LCR_EXT	0xcc /* Line Extended Control Register */
> +#define DW_UART_CPR	0xf4 /* Component Parameter Register */
> +#define DW_UART_UCV	0xf8 /* UART Component Version */
> +
> +/* Receive / Transmit Address Register bits */
> +#define DW_UART_ADDR_MASK		GENMASK(7, 0)

> +/* Line Status Register bits */
> +#define DW_UART_LSR_ADDR_RCVD		BIT(8)

Like this one, the IIR. MCR, and USR bits should be commented. Also preserve
the sorting by the register offset, so the groups of bits follow the above list
of registers, where USR bits, for example, should go before TCR.

> +/* Transceiver Control Register bits */
> +#define DW_UART_TCR_RS485_EN		BIT(0)
> +#define DW_UART_TCR_RE_POL		BIT(1)
> +#define DW_UART_TCR_DE_POL		BIT(2)
> +#define DW_UART_TCR_XFER_MODE		GENMASK(4, 3)
> +#define DW_UART_TCR_XFER_MODE_DE_DURING_RE	FIELD_PREP(DW_UART_TCR_XFER_MODE, 0)
> +#define DW_UART_TCR_XFER_MODE_SW_DE_OR_RE	FIELD_PREP(DW_UART_TCR_XFER_MODE, 1)
> +#define DW_UART_TCR_XFER_MODE_DE_OR_RE		FIELD_PREP(DW_UART_TCR_XFER_MODE, 2)
> +
> +/* Line Extended Control Register bits */
> +#define DW_UART_LCR_EXT_DLS_E		BIT(0)
> +#define DW_UART_LCR_EXT_ADDR_MATCH	BIT(1)
> +#define DW_UART_LCR_EXT_SEND_ADDR	BIT(2)
> +#define DW_UART_LCR_EXT_TRANSMIT_MODE	BIT(3)
> +
> +/* Component Parameter Register bits */
> +#define DW_UART_CPR_ABP_DATA_WIDTH	GENMASK(1, 0)
> +#define DW_UART_CPR_AFCE_MODE		BIT(4)
> +#define DW_UART_CPR_THRE_MODE		BIT(5)
> +#define DW_UART_CPR_SIR_MODE		BIT(6)
> +#define DW_UART_CPR_SIR_LP_MODE		BIT(7)
> +#define DW_UART_CPR_ADDITIONAL_FEATURES	BIT(8)
> +#define DW_UART_CPR_FIFO_ACCESS		BIT(9)
> +#define DW_UART_CPR_FIFO_STAT		BIT(10)
> +#define DW_UART_CPR_SHADOW		BIT(11)
> +#define DW_UART_CPR_ENCODED_PARMS	BIT(12)
> +#define DW_UART_CPR_DMA_EXTRA		BIT(13)
> +#define DW_UART_CPR_FIFO_MODE		GENMASK(23, 16)

> +/* DesignWare specific register fields */
> +#define DW_UART_IIR_IID			GENMASK(3, 0)
> +#define DW_UART_MCR_SIRE		BIT(6)
> +#define DW_UART_USR_BUSY		BIT(0)

I.o.w. uncouple these as per above.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
