Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB9BFF8867
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 10:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QNl82+IABRAn2LfKk9HjlGp+6EiwHZMhK8c6qDLjz4=; b=FVLRXG1xbUmlsVEAWIenUXFNM0
	VOy7pC9zFC/ctcT3ZL9e4ViXhfPXgR5+QXBSkreUB/D4LApxAFhGUE/fo01QOqaTnOfbWrpSfMwW1
	58aQhRItZYCXtOnPbj6REIoPuPrmPqzKUs5ciWHJQXUpz2BiCMbmegGIc3sGGCZFFPapslVCu63GD
	FvrsGytXLA0Icr3aqn5yCUYNz7bPUPCcOSFqM/b4ivv/8lMi2HxdoDwmK/no2nFYlsTd3E0wk78XM
	Y/SlQGBu4sQfCuC6fR7a4y6wBOwGNs4+nlp8fXQoE78LiGyJRzjBnXRlqWDwOTQiE4hEH/+drfYP4
	2Wuv77KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2Jv-00000003T6Q-1obu;
	Wed, 29 Apr 2026 10:39:07 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2Js-00000003T64-2qma
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 10:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777459145; x=1808995145;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wS2y88poNh8+M4OaCoMUd1vy4JEzXBX0q9rVHEytoM0=;
  b=PFgO3VWvRZPavT7QQzr0Yu8K4rPevr5JzffahBUufbvDdfAFf2hvsea7
   FG/euUdgjUkwW3ePSa3SGh1abMpGknU0iYy8pVJ+ka1rgtYwLdUzkP5y5
   naJLrpxFMS0GYAvMKWFhuwuSQFDD1H/stMSEm/Nk3guXE+48Ujy2th2p/
   uorXLrYI/h3cSi1nPrSy9IsnZOrUBj+y7E13PxCqxsv4rNoBvVW5ABQjl
   AKoT7SOoiYmo0/dkWVreUwHggFb566OCOLsJ8EVtqQ2vVSHX2to/wvxd7
   dVUepCICQnotd0aD7SxsTh9yUqgErAenFWBBaHNhuzxsgNb56A9M+lN7c
   w==;
X-CSE-ConnectionGUID: BpZ2RJFDT6W2Uk/PgqD2gQ==
X-CSE-MsgGUID: 8EuB9xvPT2yhGJtbJig89Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95803898"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="95803898"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 03:39:03 -0700
X-CSE-ConnectionGUID: Vg9DE7BVQtiBTtBDea3/Uw==
X-CSE-MsgGUID: Ti4RqAGnQv6MTrfg31swsw==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.212])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 03:38:55 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 29 Apr 2026 13:38:44 +0300 (EEST)
To: Jia Wang <wangjia@ultrarisc.com>
cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/4] serial: 8250_dwlib: move DesignWare register
 definitions to header
In-Reply-To: <20260429-ultrarisc-serial-v6-1-b2c852e0c4c3@ultrarisc.com>
Message-ID: <36efd2f5-d050-c613-77bf-dc651a94a586@linux.intel.com>
References: <20260429-ultrarisc-serial-v6-0-b2c852e0c4c3@ultrarisc.com> <20260429-ultrarisc-serial-v6-1-b2c852e0c4c3@ultrarisc.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1401029749-1777459124=:966"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_033904_788094_3A0BC829 
X-CRM114-Status: GOOD (  15.42  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1401029749-1777459124=:966
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 29 Apr 2026, Jia Wang wrote:

> Move the DW_UART_* register offsets and CPR bit/field definitions from
> 8250_dwlib.c into 8250_dwlib.h so they can be shared by 8250_dw and
> 8250_dwlib users.
>=20
> Add an include guard for 8250_dwlib.h.
>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/tty/serial/8250/8250_dw.c    | 11 ------
>  drivers/tty/serial/8250/8250_dwlib.c | 49 --------------------------
>  drivers/tty/serial/8250/8250_dwlib.h | 67 ++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 67 insertions(+), 60 deletions(-)
>=20
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/=
8250_dw.c
> index 94beadb4024d..467755bf0092 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -34,22 +34,11 @@
> =20
>  #include "8250_dwlib.h"
> =20
> -/* Offsets for the DesignWare specific registers */
> -#define DW_UART_USR=090x1f /* UART Status Register */
> -#define DW_UART_DMASA=090xa8 /* DMA Software Ack */
> -
>  #define OCTEON_UART_USR=090x27 /* UART Status Register */
> =20
>  #define RZN1_UART_TDMACR 0x10c /* DMA Control Register Transmit Mode */
>  #define RZN1_UART_RDMACR 0x110 /* DMA Control Register Receive Mode */
> =20
> -/* DesignWare specific register fields */
> -#define DW_UART_IIR_IID=09=09=09GENMASK(3, 0)
> -
> -#define DW_UART_MCR_SIRE=09=09BIT(6)
> -
> -#define DW_UART_USR_BUSY=09=09BIT(0)
> -
>  /* Renesas specific register fields */
>  #define RZN1_UART_xDMACR_DMA_EN=09=09BIT(0)
>  #define RZN1_UART_xDMACR_1_WORD_BURST=09(0 << 1)
> diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/82=
50/8250_dwlib.c
> index b055d89cfb39..8859e66d2d71 100644
> --- a/drivers/tty/serial/8250/8250_dwlib.c
> +++ b/drivers/tty/serial/8250/8250_dwlib.c
> @@ -13,55 +13,6 @@
> =20
>  #include "8250_dwlib.h"
> =20
> -/* Offsets for the DesignWare specific registers */
> -#define DW_UART_TCR=090xac /* Transceiver Control Register (RS485) */
> -#define DW_UART_DE_EN=090xb0 /* Driver Output Enable Register */
> -#define DW_UART_RE_EN=090xb4 /* Receiver Output Enable Register */
> -#define DW_UART_DLF=090xc0 /* Divisor Latch Fraction Register */
> -#define DW_UART_RAR=090xc4 /* Receive Address Register */
> -#define DW_UART_TAR=090xc8 /* Transmit Address Register */
> -#define DW_UART_LCR_EXT=090xcc /* Line Extended Control Register */
> -#define DW_UART_CPR=090xf4 /* Component Parameter Register */
> -#define DW_UART_UCV=090xf8 /* UART Component Version */
> -
> -/* Receive / Transmit Address Register bits */
> -#define DW_UART_ADDR_MASK=09=09GENMASK(7, 0)
> -
> -/* Line Status Register bits */
> -#define DW_UART_LSR_ADDR_RCVD=09=09BIT(8)
> -
> -/* Transceiver Control Register bits */
> -#define DW_UART_TCR_RS485_EN=09=09BIT(0)
> -#define DW_UART_TCR_RE_POL=09=09BIT(1)
> -#define DW_UART_TCR_DE_POL=09=09BIT(2)
> -#define DW_UART_TCR_XFER_MODE=09=09GENMASK(4, 3)
> -#define DW_UART_TCR_XFER_MODE_DE_DURING_RE=09FIELD_PREP(DW_UART_TCR_XFER=
_MODE, 0)
> -#define DW_UART_TCR_XFER_MODE_SW_DE_OR_RE=09FIELD_PREP(DW_UART_TCR_XFER_=
MODE, 1)
> -#define DW_UART_TCR_XFER_MODE_DE_OR_RE=09=09FIELD_PREP(DW_UART_TCR_XFER_=
MODE, 2)
> -
> -/* Line Extended Control Register bits */
> -#define DW_UART_LCR_EXT_DLS_E=09=09BIT(0)
> -#define DW_UART_LCR_EXT_ADDR_MATCH=09BIT(1)
> -#define DW_UART_LCR_EXT_SEND_ADDR=09BIT(2)
> -#define DW_UART_LCR_EXT_TRANSMIT_MODE=09BIT(3)
> -
> -/* Component Parameter Register bits */
> -#define DW_UART_CPR_ABP_DATA_WIDTH=09GENMASK(1, 0)
> -#define DW_UART_CPR_AFCE_MODE=09=09BIT(4)
> -#define DW_UART_CPR_THRE_MODE=09=09BIT(5)
> -#define DW_UART_CPR_SIR_MODE=09=09BIT(6)
> -#define DW_UART_CPR_SIR_LP_MODE=09=09BIT(7)
> -#define DW_UART_CPR_ADDITIONAL_FEATURES=09BIT(8)
> -#define DW_UART_CPR_FIFO_ACCESS=09=09BIT(9)
> -#define DW_UART_CPR_FIFO_STAT=09=09BIT(10)
> -#define DW_UART_CPR_SHADOW=09=09BIT(11)
> -#define DW_UART_CPR_ENCODED_PARMS=09BIT(12)
> -#define DW_UART_CPR_DMA_EXTRA=09=09BIT(13)
> -#define DW_UART_CPR_FIFO_MODE=09=09GENMASK(23, 16)
> -
> -/* Helper for FIFO size calculation */
> -#define DW_UART_CPR_FIFO_SIZE(a)=09(FIELD_GET(DW_UART_CPR_FIFO_MODE, (a)=
) * 16)
> -
>  /*
>   * divisor =3D div(I) + div(F)
>   * "I" means integer, "F" means fractional
> diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/82=
50/8250_dwlib.h
> index 7dd2a8e7b780..2f26f9ecacbe 100644
> --- a/drivers/tty/serial/8250/8250_dwlib.h
> +++ b/drivers/tty/serial/8250/8250_dwlib.h
> @@ -1,11 +1,76 @@
>  /* SPDX-License-Identifier: GPL-2.0+ */
>  /* Synopsys DesignWare 8250 library header file. */
> =20
> +#ifndef _SERIAL_8250_DWLIB_H_
> +#define _SERIAL_8250_DWLIB_H_
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
>  #include <linux/io.h>
>  #include <linux/types.h>
> =20
>  #include "8250.h"
> =20
> +/* Offsets for the DesignWare specific registers */
> +#define DW_UART_USR=090x1f /* UART Status Register */
> +#define DW_UART_DMASA=090xa8 /* DMA Software Ack */
> +#define DW_UART_TCR=090xac /* Transceiver Control Register (RS485) */
> +#define DW_UART_DE_EN=090xb0 /* Driver Output Enable Register */
> +#define DW_UART_RE_EN=090xb4 /* Receiver Output Enable Register */
> +#define DW_UART_DLF=090xc0 /* Divisor Latch Fraction Register */
> +#define DW_UART_RAR=090xc4 /* Receive Address Register */
> +#define DW_UART_TAR=090xc8 /* Transmit Address Register */
> +#define DW_UART_LCR_EXT=090xcc /* Line Extended Control Register */
> +#define DW_UART_CPR=090xf4 /* Component Parameter Register */
> +#define DW_UART_UCV=090xf8 /* UART Component Version */
> +
> +/* Interrupt ID Register bits */
> +#define DW_UART_IIR_IID=09=09=09GENMASK(3, 0)
> +
> +/* Modem Control Register bits */
> +#define DW_UART_MCR_SIRE=09=09BIT(6)
> +
> +/* Line Status Register bits */
> +#define DW_UART_LSR_ADDR_RCVD=09=09BIT(8)
> +
> +/* UART Status Register bits */
> +#define DW_UART_USR_BUSY=09=09BIT(0)
> +
> +/* Transceiver Control Register bits */
> +#define DW_UART_TCR_RS485_EN=09=09BIT(0)
> +#define DW_UART_TCR_RE_POL=09=09BIT(1)
> +#define DW_UART_TCR_DE_POL=09=09BIT(2)
> +#define DW_UART_TCR_XFER_MODE=09=09GENMASK(4, 3)
> +#define DW_UART_TCR_XFER_MODE_DE_DURING_RE=09FIELD_PREP(DW_UART_TCR_XFER=
_MODE, 0)
> +#define DW_UART_TCR_XFER_MODE_SW_DE_OR_RE=09FIELD_PREP(DW_UART_TCR_XFER_=
MODE, 1)
> +#define DW_UART_TCR_XFER_MODE_DE_OR_RE=09=09FIELD_PREP(DW_UART_TCR_XFER_=
MODE, 2)
> +
> +/* Receive / Transmit Address Register bits */
> +#define DW_UART_ADDR_MASK=09=09GENMASK(7, 0)
> +
> +/* Line Extended Control Register bits */
> +#define DW_UART_LCR_EXT_DLS_E=09=09BIT(0)
> +#define DW_UART_LCR_EXT_ADDR_MATCH=09BIT(1)
> +#define DW_UART_LCR_EXT_SEND_ADDR=09BIT(2)
> +#define DW_UART_LCR_EXT_TRANSMIT_MODE=09BIT(3)
> +
> +/* Component Parameter Register bits */
> +#define DW_UART_CPR_ABP_DATA_WIDTH=09GENMASK(1, 0)
> +#define DW_UART_CPR_AFCE_MODE=09=09BIT(4)
> +#define DW_UART_CPR_THRE_MODE=09=09BIT(5)
> +#define DW_UART_CPR_SIR_MODE=09=09BIT(6)
> +#define DW_UART_CPR_SIR_LP_MODE=09=09BIT(7)
> +#define DW_UART_CPR_ADDITIONAL_FEATURES=09BIT(8)
> +#define DW_UART_CPR_FIFO_ACCESS=09=09BIT(9)
> +#define DW_UART_CPR_FIFO_STAT=09=09BIT(10)
> +#define DW_UART_CPR_SHADOW=09=09BIT(11)
> +#define DW_UART_CPR_ENCODED_PARMS=09BIT(12)
> +#define DW_UART_CPR_DMA_EXTRA=09=09BIT(13)
> +#define DW_UART_CPR_FIFO_MODE=09=09GENMASK(23, 16)
> +
> +/* Helper for FIFO size calculation */
> +#define DW_UART_CPR_FIFO_SIZE(a)=09(FIELD_GET(DW_UART_CPR_FIFO_MODE, (a)=
) * 16)
> +
>  struct dw8250_port_data {
>  =09/* Port properties */
>  =09int=09=09=09line;
> @@ -38,3 +103,5 @@ static inline void dw8250_writel_ext(struct uart_port =
*p, int offset, u32 reg)
>  =09else
>  =09=09writel(reg, p->membase + offset);
>  }
> +
> +#endif /* _SERIAL_8250_DWLIB_H_ */

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1401029749-1777459124=:966
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323328-1401029749-1777459124=:966--

