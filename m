Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17B9CD4F24
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 10:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EAOM8rk6Vxadpoh+ofU8Vx2Blj68S0SsqNLg8xKsO2M=; b=DmrCTH7uvx9AVK
	55D/42Zo9RJEffKFpO8G8lz+/LClkWQV78RD59q5Ty6+yflP7lBIDYhE0YK3nTM4QacGBz9WS/bet
	gJqnTT3ro5bMX1M13Sda0nos9lwxBRwDNpxQKihM1Ad7JyN4DioC68uKIC2ZdZUK5kkKfUCJK3pSK
	OV15hfMkDpqsHUDXxu+9PXIwpvf2VWppD6uomYFJTtJV1TNMRo/YV03tbw/Z5OD19Ytfqtnmurna7
	wvmiGSj2JcfIvzphEuTasGsQIY+gC3Yl2aaDooMI72NjFeD/Jtyd+KRoT2vU/Qkg9NqXKB3Y09FWe
	3cLxdg+Eae3HDngzsKoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6vz-00000002ClN-0vM4;
	Wed, 13 May 2026 10:35:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6vx-00000002CkJ-3EJT
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 10:35:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37AC860123;
	Wed, 13 May 2026 10:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA88C2BCB8;
	Wed, 13 May 2026 10:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778668520;
	bh=vFc/0varpnBF15KLeuIScQbsvyHGDQlnFW3oq0QgzkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KwNSc5i8H0zhtr7etEdEyXLasBoIx+Uq4MNV+e75qi4pg9mZH1PsqkiQjXslXjV7d
	 Z6e2GQr/PDwrqybuwKn1IyJ1pNw+I1ERLODwBsqtDqgl3UX3HlsNeif4csjI9T3t0w
	 E9YsJIr1Vit1OYXgxXZpiJn0ls7N86tWA1Iie1Yc=
Date: Wed, 13 May 2026 12:11:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: liu.qingtao2@zte.com.cn
Cc: krzk@kernel.org, jirislaby@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, marex@nabladev.com,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, rdunlap@infradead.org, geert+renesas@glider.be,
	quic_zongjian@quicinc.com, arturs.artamonovs@analog.com,
	robert.marko@sartura.hr, hvilleneuve@dimonoff.com,
	thierry.bultel.yh@bp.renesas.com, julianbraha@gmail.com,
	flavra@baylibre.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	liu.wenhong35@zte.com.cn, liu.fei16@zte.com.cn,
	dai.hualiang@zte.com.cn, deng.weixian@zte.com.cn,
	jia.yunxiang@zte.com.cn, he.yilin@zte.com.cn, bai.lu5@zte.com.cn,
	yang.susheng@zte.com.cn, shen.lin1@zte.com.cn, zuo.jiang@zte.com.cn,
	hu.shengming@zte.com.cn, gao.rui@zte.com.cn, tan.hu@zte.com.cn
Subject: Re: [PATCH v2 2/2] tty: serial: Add LRX UART driver
Message-ID: <2026051316-stellar-enunciate-e2f8@gregkh>
References: <202605130852.64D8qEux084060@mse-fl1.zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202605130852.64D8qEux084060@mse-fl1.zte.com.cn>
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

On Wed, May 13, 2026 at 04:46:57PM +0800, liu.qingtao2@zte.com.cn wrote:
> >From 9eba3be2e9b4d5c77956258e3c5db95049c3a895 Mon Sep 17 00:00:00 2001
> From: Wenhong Liu <liu.wenhong35@zte.com.cn>
> Date: Tue, 28 Apr 2026 22:30:40 +0800
> Subject: [PATCH v2 2/2] tty: serial: Add LRX UART driver
> 
> Add support for the ZTE LRX UART controller with the following features:
> - Support for FIFO mode (16-byte depth)
> - Baud rate configuration
> - Standard asynchronous communication formats:
> * Data bits: 5, 6, 7, 8, 9 bits
> * Parity: odd, even, fixed, none
> * Stop bits: 1 or 2 bits
> - Hardware flow control (RTS/CTS)
> - Multiple interrupt reporting mechanisms
> - DMA support for improved performance
> 
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602140029.NXkDToZ7-lkp@intel.com/
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602140108.kLMOYbwS-lkp@intel.com/

Why are these 4 lines here?  The kernel test robot found bugs in your
previous versions, so fix that, but no need to list that here, right?

> --- /dev/null
> +++ b/drivers/tty/serial/lrx_uart.c
> @@ -0,0 +1,2822 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + *  Serial Port driver for ZTE LRX
> + *
> + *  Copyright (c) 2025, ZTE Corporation. All rights reserved.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/ioport.h>
> +#include <linux/init.h>
> +#include <linux/console.h>
> +#include <linux/platform_device.h>
> +#include <linux/sysrq.h>
> +#include <linux/device.h>
> +#include <linux/tty.h>
> +#include <linux/tty_flip.h>
> +#include <linux/serial_core.h>
> +#include <linux/serial.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/slab.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/scatterlist.h>
> +#include <linux/delay.h>
> +#include <linux/types.h>
> +#include <linux/of.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/sizes.h>
> +#include <linux/io.h>
> +#include <linux/acpi.h>
> +
> +#define UART_NR			14

Why 14?  Why limit yourself at all?

> +
> +#define ISR_PASS_LIMIT		256
> +
> +#define LRX_UART_NAME		"lrx-uart"

KBUILD_MODNAME?

> +#define LRX_UART_TTY_PREFIX	"ttyLRX"

Why are you using a new name and not the existing ones?  Why is this not
just a variant of the existing 8250 serial driver?  Surely this is not a
totally new UART that looks nothing like that one, right?

> +/* There is by now at least one vendor with differing details, so handle it */

So a new UART already has conflicting implementations?  How can that
happen?

> +/* Deals with DMA transactions */
> +
> +struct lrx_uart_dmabuf {
> +	dma_addr_t		dma;
> +	size_t			len;
> +	char			*buf;

u8?

> +/*
> + * We wrap our port structure around the generic uart_port.
> + */
> +struct lrx_uart_port {
> +	struct uart_port	port;
> +	const u16		*reg_offset;
> +	struct clk		*clk;
> +	const struct vendor_data *vendor;
> +	unsigned int		im;		/* interrupt mask */
> +	unsigned int		old_status;
> +	unsigned int		fifosize;	/* vendor-specific */
> +	unsigned int		fixed_baud;	/* vendor-set fixed baud rate */
> +	char			type[16];
> +	bool			rs485_tx_started;
> +	unsigned int		rs485_tx_drain_interval; /* usecs */
> +#ifdef CONFIG_DMA_ENGINE

Why would this UART not use the DMA engine?  When would that ever be
disabled?

> +/*
> + * Reads up to 256 characters from the FIFO or until it&apos;s empty and

This implies that some tool wrote this code.  Please always properly
document that and where it copied the information from in order to write
this code.

> +/*
> + * All the DMA operation mode stuff goes inside this ifdef.
> + * This assumes that you have a generic DMA device interface,
> + * no custom DMA interfaces are supported.
> + */
> +#ifdef CONFIG_DMA_ENGINE
> +
> +#define LRX_UART_DMA_BUFFER_SIZE PAGE_SIZE

Why not just use PAGE_SIZE?  And how do you know the dma buffer is the
same size always?  When using 16k pages, the hardware knows this?

> +/*
> + * Try to refill the TX DMA buffer.
> + * Locking: called with port lock held and IRQs disabled.
> + * Returns:
> + *   1 if we queued up a TX DMA buffer.
> + *   0 if we didn&apos;t want to handle this by DMA

Again, fix your tooling :(

> +/*
> + * Flush the transmit buffer.
> + * Locking: called with port lock held and IRQs disabled.
> + */
> +static void lrx_uart_dma_flush_buffer(struct uart_port *port)
> +__releases(&sup->port.lock)
> +__acquires(&sup->port.lock)

Ok, but:

> +{
> +	struct lrx_uart_port *sup =
> +	    container_of(port, struct lrx_uart_port, port);
> +
> +	if (!sup->using_tx_dma)
> +		return;
> +
> +	dmaengine_terminate_async(sup->dmatx.chan);
> +
> +	if (sup->dmatx.queued) {
> +		dma_unmap_single(sup->dmatx.chan->device->dev, sup->dmatx.dma,
> +				 sup->dmatx.len, DMA_TO_DEVICE);
> +		sup->dmatx.queued = false;
> +		sup->dmacr &= ~UARTFCCR_TXDMAE;
> +		lrx_uart_write(sup->dmacr, sup, REG_FCCR);
> +	}
> +}

I don't see those locks being touched, where did that happen?

> +static irqreturn_t lrx_uart_int(int irq, void *dev_id)
> +{
> +	struct lrx_uart_port *sup = dev_id;
> +	unsigned int status, pass_counter = ISR_PASS_LIMIT;
> +	int handled = 0;

bool?

> +static int lrx_uart_hwinit(struct uart_port *port)
> +{
> +	struct lrx_uart_port *sup =
> +	    container_of(port, struct lrx_uart_port, port);

You do this "container_of()" everywhere, why not write a simple macro
for it to make it more obvious like to_lxr_uart_port()?

And why not use container_of_const()?

> +static int lrx_uart_allocate_irq(struct lrx_uart_port *sup)
> +{
> +	lrx_uart_write(sup->im, sup, REG_IMSC);
> +
> +	return request_irq(sup->port.irq, lrx_uart_int, IRQF_SHARED, "lrx-uart", sup);

You had a driver name way above, why not use that instead of this string
here?

> +	/* Set baud rate */
> +	lrx_uart_write(quot & 0x3f, sup, REG_FD);
> +	lrx_uart_write(quot >> 6, sup, REG_IND);
> +
> +	/*
> +	 * ----------v----------v----------v----------v-----
> +	 * NOTE: REG_FRCR MUST BE WRITTEN AFTER REG_FD & REG_IND.
> +	 * ----------^----------^----------^----------^-----
> +	 */

Why the odd comment style?

> +	lrx_uart_write(frcr, sup, REG_FRCR);
> +
> +	lrx_uart_write(fccr, sup, REG_FCCR);

Why the blank line between these?

> +static struct lrx_uart_port *lrx_uart_console_ports[UART_NR];

Why isn't this a dynamic list?

> +/*
> + * While this can be a module, if builtin it&apos;s most likely the console
> + * So let&apos;s leave module_exit but move module_init to an earlier place

Again, your tooling is broken :(

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
