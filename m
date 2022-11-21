Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F88DC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 13:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gp0dRT7PMReHVzx+t6sqkj0V4HkEcJkr70czwP2tUE=; b=UC3bEGdjO1G71V
	7mHpWpc1U4q2+1gOPsVm/F4An77Rw0vD7h1j+u1axezVOF4cEg7u8fF4mhbaDfpSwPn6LfMLRWyXe
	pxbFBgYOBikkMLA4tJ/jW0sx2JY9+RSVe1pF0PY/ETcLvARe1U8IPOpcqZMK//K6iTPZPtSkHAqZg
	tgoEF0ZeZfJ/9AVRYiA45nik6IewxWO3yk8XWQJmhIxUDUjJD6vxz4j2bE7p13Ts9unTixPaHCOaJ
	MpK82pJlHu4cSdEf+yxgql2dXbmlH1Y2/CwgTm99tRfCWkk929i9BVllGE5qQUovDw/7CJq9FTzQr
	AMaaFRSNoLH2pKjIv4dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox7KV-00EB57-CW; Mon, 21 Nov 2022 13:59:23 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox7KT-00EB2h-Iq
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 13:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669039161; x=1700575161;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=sj2b1TjV39Tt4i/TIED+Enb/63DlzwcLP/R2kSeUNTQ=;
  b=CV3HeP9NnJpNcvq610fRGTZmHmzA8KL/ZxdOoJMpNc9Ur+8CVZHDG2hL
   edMPFiEI6H1UN4r8s1RVUn9TUfGbyZ5mI2GO9lRu0ez661ozYjEVYioLk
   BeIu7sdAt4+RvP2xh/+6z9os5aoX4s6GPilyYl3GT3CeMv9+Oh6/3nkIv
   Q0ognh8AaQ+51qTG4OzLs263ACeYtRz9PoOZQWb6qLStgo5ArC/p3OZMC
   VZUpJbw/i4OP85cZNDDLJjsfXjigR0GuczDgtVp1NVuqtSTTn20mpZv6I
   XQcqbOC90ubwHbiNkjLBUCXx9NyJbII4DT0RBynEcx/NvA2lDgbSU1GBw
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="340419962"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="340419962"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 05:59:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="704568621"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="704568621"
Received: from ebarboza-mobl1.amr.corp.intel.com ([10.251.209.16])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 05:59:15 -0800
Date: Mon, 21 Nov 2022 15:59:13 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Rob Herring <robh+dt@kernel.org>, 
    Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Jiri Slaby <jirislaby@kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/7] serial: bflb_uart: add Bouffalolab UART Driver
In-Reply-To: <20221120082114.3030-3-jszhang@kernel.org>
Message-ID: <faa34e87-4633-31e7-144b-4fec46cb8f59@linux.intel.com>
References: <20221120082114.3030-1-jszhang@kernel.org> <20221120082114.3030-3-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_055921_652699_870B7440 
X-CRM114-Status: GOOD (  20.66  )
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

On Sun, 20 Nov 2022, Jisheng Zhang wrote:

> Add the driver for Bouffalolab UART IP which is found in Bouffalolab
> SoCs such as bl808.
> 
> UART driver probe will create path named "/dev/ttySx".
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

> diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
> index 238a9557b487..8509cdc11d87 100644
> --- a/drivers/tty/serial/Makefile
> +++ b/drivers/tty/serial/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_SERIAL_8250) += 8250/
>  
>  obj-$(CONFIG_SERIAL_AMBA_PL010) += amba-pl010.o
>  obj-$(CONFIG_SERIAL_AMBA_PL011) += amba-pl011.o
> +obj-$(CONFIG_SERIAL_BFLB) += bflb_uart.o
>  obj-$(CONFIG_SERIAL_CLPS711X) += clps711x.o
>  obj-$(CONFIG_SERIAL_PXA_NON8250) += pxa.o
>  obj-$(CONFIG_SERIAL_SA1100) += sa1100.o
> diff --git a/drivers/tty/serial/bflb_uart.c b/drivers/tty/serial/bflb_uart.c
> new file mode 100644
> index 000000000000..65f98ccf8fa8
> --- /dev/null
> +++ b/drivers/tty/serial/bflb_uart.c
> @@ -0,0 +1,659 @@
> +#define UART_FIFO_CONFIG_1		(0x84)
> +#define  UART_TX_FIFO_CNT_SFT		0
> +#define  UART_TX_FIFO_CNT_MSK		GENMASK(5, 0)
> +#define  UART_RX_FIFO_CNT_MSK		GENMASK(13, 8)
> +#define  UART_TX_FIFO_TH_SFT		16

Use FIELD_PREP() instead of adding a separate *_SFT define.

> +#define  UART_TX_FIFO_TH_MSK		GENMASK(20, 16)
> +#define  UART_RX_FIFO_TH_SFT		24
> +#define  UART_RX_FIFO_TH_MSK		GENMASK(28, 24)
> +#define UART_FIFO_WDATA			0x88
> +#define UART_FIFO_RDATA			0x8c
> +#define  UART_FIFO_RDATA_MSK		GENMASK(7, 0)


> +	val = rdl(port, UART_URX_CONFIG);
> +	val &= ~UART_CR_URX_EN;
> +	wrl(port, UART_URX_CONFIG, val);
> +
> +	val = rdl(port, UART_INT_MASK);
> +	val |= UART_URX_FIFO_INT | UART_URX_RTO_INT |
> +	       UART_URX_FER_INT;

Fits to single line.

> +	port->type = PORT_BFLB;
> +
> +	/* Clear mask, so no surprise interrupts. */
> +	val = rdl(port, UART_INT_MASK);
> +	val |= UART_UTX_END_INT;
> +	val |= UART_UTX_FIFO_INT;
> +	val |= UART_URX_FIFO_INT;
> +	val |= UART_URX_RTO_INT;
> +	val |= UART_URX_FER_INT;

Why to split it to this many lines?

> +	spin_lock_irqsave(&port->lock, flags);
> +
> +	val = rdl(port, UART_INT_MASK);
> +	val |= 0xfff;

In most of the other places, the bits used with UART_INT_MASK are named, 
but for some reason you don't do it here and the bits extend beyond the 
ones which are defined with name.

> +	wrl(port, UART_INT_MASK, val);
> +
> +	wrl(port, UART_DATA_CONFIG, 0);
> +	wrl(port, UART_SW_MODE, 0);
> +	wrl(port, UART_URX_RTO_TIMER, 0x4f);

FIELD_PREP(UART_CR_URX_RTO_VALUE_MSK, 0x4f)? It would document what field
is written explicitly.

> +
> +	val = rdl(port, UART_FIFO_CONFIG_1);
> +	val &= ~UART_RX_FIFO_TH_MSK;
> +	val |= BFLB_UART_RX_FIFO_TH << UART_RX_FIFO_TH_SFT;
> +	wrl(port, UART_FIFO_CONFIG_1, val);
> +
> +	/* Unmask RX interrupts now */
> +	val = rdl(port, UART_INT_MASK);
> +	val &= ~UART_URX_FIFO_INT;
> +	val &= ~UART_URX_RTO_INT;
> +	val &= ~UART_URX_FER_INT;

Combine to single line.

> +static int bflb_uart_request_port(struct uart_port *port)
> +{
> +	/* UARTs always present */
> +	return 0;
> +}
> +static void bflb_uart_release_port(struct uart_port *port)
> +{
> +	/* Nothing to release... */
> +}

Both release_port and request_port are NULL checked by the caller, there's 
no need to provide and empty one.

> +static const struct uart_ops bflb_uart_ops = {
> +	.tx_empty = bflb_uart_tx_empty,
> +	.get_mctrl = bflb_uart_get_mctrl,
> +	.set_mctrl = bflb_uart_set_mctrl,
> +	.start_tx = bflb_uart_start_tx,
> +	.stop_tx = bflb_uart_stop_tx,
> +	.stop_rx = bflb_uart_stop_rx,
> +	.break_ctl = bflb_uart_break_ctl,
> +	.startup = bflb_uart_startup,
> +	.shutdown = bflb_uart_shutdown,
> +	.set_termios = bflb_uart_set_termios,
> +	.type = bflb_uart_type,
> +	.request_port = bflb_uart_request_port,
> +	.release_port = bflb_uart_release_port,
> +	.config_port = bflb_uart_config_port,
> +	.verify_port = bflb_uart_verify_port,
> +};

> +static void bflb_uart_console_write(struct console *co, const char *s,
> +				    u_int count)
> +{
> +	struct uart_port *port = &bflb_uart_ports[co->index]->port;
> +	u32 status, reg, mask;
> +
> +	/* save then disable interrupts */
> +	mask = rdl(port, UART_INT_MASK);
> +	reg = -1;

Use ~0 instead. Why -1 here and 0xfff in the other place?


-- 
 i.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
