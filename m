Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF991ECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 09:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKki+tRoLldrPI9n6IlqqEWrp2ZTX9e85Ff2aLiubAs=; b=BaS8uDPe9QUI43qhZxbpxp5Djy
	WboFKFBdbRUQwFB9b8SvUr4G4Jlps7fZC3GzHY6qvrSLu4wHkWHpgb6NtoIptHUTTe92hb+uvanLu
	KRXJSxbRVcgrkuCP9grXUgudq3eJU9lcUUdiydyOgHXJ+Un9jk8U/mnJ4ACg2K33Kn1Jd20MNVHw/
	HJ2KpTPHxsyg0BsY25O6YozAVVTCXPy8M3N4ml3BqgtEgKcpwU/TasM4szyRcY5sIRYKbNP2CLEGd
	NWwa72Wra70P6SfEaOAme7FtoHcizhf4ata3kqDkct4j8pYlnzOT+Sl8mmblpT9PcL3jxJibzXbAP
	Qim1tSkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZY3-002O7O-Sv; Tue, 20 Sep 2022 09:28:11 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZPS-002JDO-0r
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 09:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663665557; x=1695201557;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=BAbM1TqEtb44PX0/vS1qF8q9DcnRF8aqNBELI9rzAgQ=;
  b=PxZghEqKWDgD+QywIzk6YCSMKupB77j6c+0gxJ0F9Qb3xkTDnuEIPhaR
   PwkEEa3sTJJAP+o13WLOHRBIRIUAkbv4b82Vtsb1EurgFz/Cc7MDwaE0h
   jf/c/cDXcDA+z6E/W6QT0XjldLZrEgdMjlcZhU1fAxZ0lQOVzP6x/RL6y
   8WFvIFFApoZIddxUYyNXqpvIFz7hRd/UE5fQgYjdg7/f1ix1pW6LcQDUv
   OCLCVsq6oWrW6M46JMRZXYWAia78BspUioP7JqNyyljD5n9yBqCSYjmqT
   d8HTM6cMmA/aFdW41Xs2/EZGFSZZB7AvHX+0faHfCdilS6RQG9jSi4FMT
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="363603813"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="363603813"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 02:19:15 -0700
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="744459621"
Received: from bdallmer-mobl.ger.corp.intel.com ([10.252.59.238])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 02:19:11 -0700
Date: Tue, 20 Sep 2022 12:19:08 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Jiri Slaby <jslaby@suse.cz>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, 
    Florian Fainelli <f.fainelli@gmail.com>, 
    bcm-kernel-feedback-list@broadcom.com, 
    =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>, 
    Kevin Cernekee <cernekee@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, 
    Baolin Wang <baolin.wang7@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
    Patrice Chotard <patrice.chotard@foss.st.com>, 
    linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 10/10] tty: serial: use uart_port_tx_limited()
In-Reply-To: <20220920075844.29360-1-jslaby@suse.cz>
Message-ID: <f2653c92-1769-fc7c-8ad8-abf34affef6b@linux.intel.com>
References: <20220920052049.20507-1-jslaby@suse.cz> <20220920075844.29360-1-jslaby@suse.cz>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1250180477-1663664450=:1766"
Content-ID: <5186414d-2cc-26ad-bf70-acafdbdd2d7@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_021918_207315_A9174FEC 
X-CRM114-Status: GOOD (  20.16  )
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

--8323329-1250180477-1663664450=:1766
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <8a48e911-6d7c-c65b-e692-658250d45aa1@linux.intel.com>

On Tue, 20 Sep 2022, Jiri Slaby wrote:

> uart_port_tx_limited() is a new helper to send characters to the device.
> Use it in these drivers.
> 
> mux.c also needs to define tx_done(). But I'm not sure if the driver
> really wants to wait for all the characters to dismiss from the HW fifo
> at this code point. Hence I marked this as FIXME.
> 
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: "Pali Rohár" <pali@kernel.org>
> Cc: Kevin Cernekee <cernekee@gmail.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang7@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: linux-riscv@lists.infradead.org

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

One improvement suggestion below.

> diff --git a/drivers/tty/serial/altera_jtaguart.c b/drivers/tty/serial/altera_jtaguart.c
> index 23f339757894..f224f5141726 100644
> --- a/drivers/tty/serial/altera_jtaguart.c
> +++ b/drivers/tty/serial/altera_jtaguart.c
> @@ -137,39 +137,17 @@ static void altera_jtaguart_rx_chars(struct altera_jtaguart *pp)
>  static void altera_jtaguart_tx_chars(struct altera_jtaguart *pp)
>  {
>  	struct uart_port *port = &pp->port;
> -	struct circ_buf *xmit = &port->state->xmit;
> -	unsigned int pending, count;
> -
> -	if (port->x_char) {
> -		/* Send special char - probably flow control */
> -		writel(port->x_char, port->membase + ALTERA_JTAGUART_DATA_REG);
> -		port->x_char = 0;
> -		port->icount.tx++;
> -		return;
> -	}
> +	unsigned int space;
> +	u8 ch;
>  
> -	pending = uart_circ_chars_pending(xmit);
> -	if (pending > 0) {
> -		count = (readl(port->membase + ALTERA_JTAGUART_CONTROL_REG) &
> -				ALTERA_JTAGUART_CONTROL_WSPACE_MSK) >>
> -			ALTERA_JTAGUART_CONTROL_WSPACE_OFF;
> -		if (count > pending)
> -			count = pending;
> -		if (count > 0) {
> -			pending -= count;
> -			while (count--) {
> -				writel(xmit->buf[xmit->tail],
> -				       port->membase + ALTERA_JTAGUART_DATA_REG);
> -				xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
> -				port->icount.tx++;
> -			}
> -			if (pending < WAKEUP_CHARS)
> -				uart_write_wakeup(port);
> -		}
> -	}
> +	space = readl(port->membase + ALTERA_JTAGUART_CONTROL_REG);
> +	space &= ALTERA_JTAGUART_CONTROL_WSPACE_MSK;
> +	space >>= ALTERA_JTAGUART_CONTROL_WSPACE_OFF;

This is FIELD_GET(ALTERA_JTAGUART_CONTROL_WSPACE_MSK, ...) & then allows 
killing ALTERA_JTAGUART_CONTROL_WSPACE_OFF. I'd probably do it in a 
separate patch though.


-- 
 i.
--8323329-1250180477-1663664450=:1766
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1250180477-1663664450=:1766--

