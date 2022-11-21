Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0527C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 08:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gTcFAoOdRzJRd25S/9T2nbirqvp9Rgvr2Hvzscy6y10=; b=FbZRJ4W0J0Ot21
	lIgx6EkbbAh4EjWrU59hgyoUtRR0kYdTVWH/mGpZUFKCtHyd48u8QBuyFCyYQVHI/vazKG2MiMNtq
	hRjN+NPsCSdWKcerxl6O/h7x3iFixpkMERTGlRhDvVSIVhrsjx6pEn2euiwm11+LaxVGRMQoWDb3B
	fzGLRsNu+AqhCjpmLIi46wuho45sPkAVOOxzIQtKjAcAC1eiOwJU5UYzAGiId5mu8Klt3+BiWPcZH
	MURDRw/OIFpcC7gZDOkPd0cSsH8Oy80m+JdgxepPL7IXwPZWttWP3kPtJcZXorxkFUDXxgYBD7GZO
	9FdVVxav88P/20kADY6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox1s6-00B1Mu-VR; Mon, 21 Nov 2022 08:09:43 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox1s3-00B0mU-Ma
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 08:09:41 +0000
Received: by mail-ej1-f54.google.com with SMTP id m22so26567086eji.10
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 00:09:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aqRaa79Rc3cifC4XGMv+vqJE3qX/IM89zz4U8xNpD4A=;
        b=iz1rMJupYoWu9Jx3xe5lFeBBUepcT0Di53Q3dwTVnnS5QPHIVxbjH258Y2HHC3agEi
         l52BvvpEoQzlpcVW+DrYl+9+bwcBFu04p2yc8aXLinl6M4mKFm1UI4l2ZSSyQwcWE/1P
         KoWVugNcjm6HEcdYfK52RecquY1JhWsai1IaPSrs6SN3PbYEOw1Efr0su9c85ecsRCHv
         2KFvr9JXnwpP5EvawL4eDuJhHyKEfTYRbnufX69oCa2EMRbovPChirA9QXmwj89WMUAs
         l+akB8MQ2sMQr/FHhSOXShEpUnsEheF8LF7AvTsFOOLXmvvfeESz+MOqstMB2pWr/a2L
         S0bw==
X-Gm-Message-State: ANoB5pm9PQzoobbLaN8DUIrzK9o2aM/jVsrCawKuO6mYcrQFiFYv2xLP
	MU3+XO84ZhJgub918qU5soM=
X-Google-Smtp-Source: AA0mqf57RJ5xD73Ge4dm5atkMbDKSzweSU91OHQ6FaeZXpcgvYsG+eKyqO4u0pzF6/7WD5iNRyNGHw==
X-Received: by 2002:a17:906:6892:b0:78d:ab48:bc84 with SMTP id n18-20020a170906689200b0078dab48bc84mr15107208ejr.22.1669018176269;
        Mon, 21 Nov 2022 00:09:36 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id qm13-20020a170907674d00b0077e6be40e4asm4727001ejc.175.2022.11.21.00.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:09:35 -0800 (PST)
Message-ID: <7c450045-c3b2-b16d-609d-810608949611@kernel.org>
Date: Mon, 21 Nov 2022 09:09:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20221120082114.3030-1-jszhang@kernel.org>
 <20221120082114.3030-3-jszhang@kernel.org>
From: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 2/7] serial: bflb_uart: add Bouffalolab UART Driver
In-Reply-To: <20221120082114.3030-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_000939_779962_58BCBDF7 
X-CRM114-Status: GOOD (  27.14  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On 20. 11. 22, 9:21, Jisheng Zhang wrote:
> Add the driver for Bouffalolab UART IP which is found in Bouffalolab
> SoCs such as bl808.
> 
> UART driver probe will create path named "/dev/ttySx".
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
...

 > #define UART_FIFO_CONFIG_0		(0x80)

Superfluous parentheses.

...
> +static void bflb_uart_set_termios(struct uart_port *port,
> +				  struct ktermios *termios,
> +				  const struct ktermios *old)
> +{
> +	unsigned long flags;
> +	u32 valt, valr, val;
> +	unsigned int baud, min;
> +
> +	valt = valr = 0;

Unneeded (see below).

> +
> +	spin_lock_irqsave(&port->lock, flags);
> +
> +	/* set data length */
> +	val = tty_get_char_size(termios->c_cflag) - 1;
> +	valt |= (val << UART_CR_UTX_BIT_CNT_D_SFT);

Use =, not |=. Other than that, can FIELD_SET() be used, provided you 
already define the constants using GENMASK()?

> +
> +	/* calculate parity */
> +	termios->c_cflag &= ~CMSPAR;	/* no support mark/space */
> +	if (termios->c_cflag & PARENB) {
> +		valt |= UART_CR_UTX_PRT_EN;
> +		if (termios->c_cflag & PARODD)
> +			valr |= UART_CR_UTX_PRT_SEL;

This should be valt, IMO.

> +	}
> +
> +	valr = valt;

If not, this doesn't make sense to me.

> +	/* calculate stop bits */
> +	if (termios->c_cflag & CSTOPB)
> +		val = 2;
> +	else
> +		val = 1;
> +	valt |= (val << UART_CR_UTX_BIT_CNT_P_SFT);
> +
> +	/* flow control */
> +	if (termios->c_cflag & CRTSCTS)
> +		valt |= UART_CR_UTX_CTS_EN;
> +
> +	/* enable TX freerunning mode */
> +	valt |= UART_CR_UTX_FRM_EN;
> +
> +	valt |= UART_CR_UTX_EN;
> +	valr |= UART_CR_URX_EN;

Why this is not the very first and only for valt and copied to valr above?

> +
> +	wrl(port, UART_UTX_CONFIG, valt);
> +	wrl(port, UART_URX_CONFIG, valr);
> +
> +	min = port->uartclk / (UART_CR_UTX_BIT_PRD + 1);
> +	baud = uart_get_baud_rate(port, termios, old, min, 4000000);
> +
> +	val = DIV_ROUND_CLOSEST(port->uartclk, baud) - 1;
> +	val &= UART_CR_UTX_BIT_PRD;
> +	val |= (val << 16);
> +	wrl(port, UART_BIT_PRD, val);
> +
> +	uart_update_timeout(port, termios->c_cflag, baud);
> +
> +	spin_unlock_irqrestore(&port->lock, flags);
> +}
> +
> +static void bflb_uart_rx_chars(struct uart_port *port)
> +{
> +	unsigned char ch, flag;

Please use u8. (serial_core should too, but that's only on a TODO list yet)

> +	unsigned long status;

Long? I think u32.

> +
> +	while ((status = rdl(port, UART_FIFO_CONFIG_1)) & UART_RX_FIFO_CNT_MSK) {
> +		ch = rdl(port, UART_FIFO_RDATA) & UART_FIFO_RDATA_MSK;
> +		flag = TTY_NORMAL;

Drop this flag completely and use the constant below directly.

> +		port->icount.rx++;
> +
> +		if (uart_handle_sysrq_char(port, ch))
> +			continue;
> +		uart_insert_char(port, 0, 0, ch, flag);
> +	}
> +
> +	spin_unlock(&port->lock);
> +	tty_flip_buffer_push(&port->state->port);
> +	spin_lock(&port->lock);
> +}
> +
> +static void bflb_uart_tx_chars(struct uart_port *port)
> +{

Are you unable to use the TX helper? If so:
* why?
* use uart_advance_xmit() at least.

> +	struct circ_buf *xmit = &port->state->xmit;
> +	unsigned int pending, count;
> +
> +	if (port->x_char) {
> +		/* Send special char - probably flow control */
> +		wrl(port, UART_FIFO_WDATA, port->x_char);
> +		port->x_char = 0;
> +		port->icount.tx++;
> +		return;
> +	}
> +
> +	pending = uart_circ_chars_pending(xmit);
> +	if (pending > 0) {
> +		count = (rdl(port, UART_FIFO_CONFIG_1) &
> +			 UART_TX_FIFO_CNT_MSK) >> UART_TX_FIFO_CNT_SFT;
> +		if (count > pending)
> +			count = pending;
> +		if (count > 0) {
> +			pending -= count;
> +			while (count--) {
> +				wrl(port, UART_FIFO_WDATA, xmit->buf[xmit->tail]);
> +				xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
> +				port->icount.tx++;
> +			}
> +			if (pending < WAKEUP_CHARS)
> +				uart_write_wakeup(port);
> +		}
> +	}
> +
> +	if (pending == 0)
> +		bflb_uart_stop_tx(port);
> +}
> +
> +static irqreturn_t bflb_uart_interrupt(int irq, void *data)
> +{
> +	struct uart_port *port = data;
> +	u32 isr, val;
> +
> +	isr = rdl(port, UART_INT_STS);
> +	wrl(port, UART_INT_CLEAR, isr);
> +
> +	isr &= ~rdl(port, UART_INT_MASK);
> +
> +	spin_lock(&port->lock);
> +
> +	if (isr & UART_URX_FER_INT) {
> +		/* RX FIFO error interrupt */
> +		val = rdl(port, UART_FIFO_CONFIG_0);
> +		if (val & UART_RX_FIFO_OVERFLOW)
> +			port->icount.overrun++;
> +
> +		val |= UART_RX_FIFO_CLR;
> +		wrl(port, UART_FIFO_CONFIG_0, val);
> +	}
> +
> +	if (isr & (UART_URX_FIFO_INT | UART_URX_RTO_INT)) {
> +		bflb_uart_rx_chars(port);
> +	}
> +	if (isr & (UART_UTX_FIFO_INT | UART_UTX_END_INT)) {
> +		bflb_uart_tx_chars(port);
> +	}

Superfluous braces.

> +
> +	spin_unlock(&port->lock);
> +
> +	return IRQ_RETVAL(isr);

Can it happen that UART_INT_STS is nonzero and UART_INT_MASK is zero? 
You'd cause "irqX: nobody cared" in that case.

> +}
> +
> +static void bflb_uart_config_port(struct uart_port *port, int flags)
> +{
> +	u32 val;
> +
> +	port->type = PORT_BFLB;
> +
> +	/* Clear mask, so no surprise interrupts. */

surprising?

> +	val = rdl(port, UART_INT_MASK);
> +	val |= UART_UTX_END_INT;
> +	val |= UART_UTX_FIFO_INT;
> +	val |= UART_URX_FIFO_INT;
> +	val |= UART_URX_RTO_INT;
> +	val |= UART_URX_FER_INT;
> +	wrl(port, UART_INT_MASK, val);
> +}
> +
> +static int bflb_uart_startup(struct uart_port *port)
> +{
> +	unsigned long flags;
> +	int ret;
> +	u32 val;
> +
> +	ret = devm_request_irq(port->dev, port->irq, bflb_uart_interrupt,
> +			       IRQF_SHARED, port->name, port);
> +	if (ret) {
> +		dev_err(port->dev, "fail to request serial irq %d, ret=%d\n",
> +			port->irq, ret);
> +		return ret;
> +	}
> +
> +	spin_lock_irqsave(&port->lock, flags);
> +
> +	val = rdl(port, UART_INT_MASK);
> +	val |= 0xfff;

Can this be a defined macro too, please?

> +	wrl(port, UART_INT_MASK, val);
> +
> +	wrl(port, UART_DATA_CONFIG, 0);
> +	wrl(port, UART_SW_MODE, 0);
> +	wrl(port, UART_URX_RTO_TIMER, 0x4f);

Another magic constant.

> +
> +	val = rdl(port, UART_FIFO_CONFIG_1);
> +	val &= ~UART_RX_FIFO_TH_MSK;
> +	val |= BFLB_UART_RX_FIFO_TH << UART_RX_FIFO_TH_SFT;

FIELD_SET()?

> +	wrl(port, UART_FIFO_CONFIG_1, val);
> +
> +	/* Unmask RX interrupts now */
> +	val = rdl(port, UART_INT_MASK);
> +	val &= ~UART_URX_FIFO_INT;
> +	val &= ~UART_URX_RTO_INT;
> +	val &= ~UART_URX_FER_INT;
> +	wrl(port, UART_INT_MASK, val);
> +	val = rdl(port, UART_UTX_CONFIG);
> +	val |= UART_CR_UTX_EN;
> +	wrl(port, UART_UTX_CONFIG, val);
> +	val = rdl(port, UART_URX_CONFIG);
> +	val |= UART_CR_URX_EN;
> +	wrl(port, UART_URX_CONFIG, val);
> +
> +	spin_unlock_irqrestore(&port->lock, flags);
> +
> +	return 0;
> +}
...
> +/*
> + * Interrupts are disabled on entering
> + */
> +static void bflb_uart_console_write(struct console *co, const char *s,
> +				    u_int count)
> +{
> +	struct uart_port *port = &bflb_uart_ports[co->index]->port;
> +	u32 status, reg, mask;
> +
> +	/* save then disable interrupts */
> +	mask = rdl(port, UART_INT_MASK);
> +	reg = -1;

You use 0xfff earlier, now 0xffffffff. Is that OK? Why not use the same 
constant?

> +	wrl(port, UART_INT_MASK, reg);
> +
> +	/* Make sure that tx is enabled */
> +	reg = rdl(port, UART_UTX_CONFIG);
> +	reg |= UART_CR_UTX_EN;
> +	wrl(port, UART_UTX_CONFIG, reg);
> +
> +	uart_console_write(port, s, count, bflb_console_putchar);
> +
> +	/* wait for TX done */
> +	do {
> +		status = rdl(port, UART_STATUS);
> +	} while ((status & UART_STS_UTX_BUS_BUSY));
> +
> +	/* restore IRQ mask */
> +	wrl(port, UART_INT_MASK, mask);
> +}

regards,
-- 
js
suse labs


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
