Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669CCC44529
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 19:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lfe1CXLyNkxCLyxNWxHwoCd50Kgc1eqe630++ACl04s=; b=RCYODwAS3ugZYu
	6IESKYY8DUhJZKeu5xh6pbidYwyPHjF/5ZXNQU/Ciqh0cBPoK8XmzN4dnIQyY+BU5AKAdBUIspx+e
	fCSn/pYg+XBSCtwbCxSHVnDW+WB83Q5OSvF61pNH+Byy2koP8LHY4kSAOQJDl2RZrT50WRZc7WJj/
	kJ97YtZoprRgANjSYuE9jAQZOwjRCMV/1L55Toh97X9DA1gi50sc/mc8wYGFRRJ9x7ki9X5ok0uZ/
	Zw2uHqr00WmBunkVUr3Y3AZiaVVNKaB3SRfFDr2pTng6SbWp77j9KU31xxZAtSBhbuboZY2+Kexpu
	ZcezW0O5RqZk/V2IxJfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltZF-00000007jw2-2cag;
	Mon, 20 Jul 2026 19:22:21 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltZC-00000007jv5-0sl9
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 19:22:20 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7eb64371a2aso4394727a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 12:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784575337; x=1785180137; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bGto1WUmtU2FuWuRVZZkJWBifnkd6qv0KZ7sGmDSExQ=;
        b=MKyx3VwK5i1pn9diIUghe0LsVzLM3PSdRm7AEmjZIAERTexTeFphc6C4AYxtXpk/6l
         bPitSgNC3lEN4v0AiLGWfQKE7oQYKuCKe3ZtSMGNA1+tScUDx+iNfhqFxAMyvd8a0hbN
         xWeXbwt+JgTjkj07mi40opp/VrPzmzpgFPj121XSsUQ84xZtWN5Db3SRs3e0vAWH5cRA
         OFS60FWr0tAinW71tO5E/CznSG5UahHYhYParqZ3bXnXGcDdEeloxbbe5RMrXZOg+3i/
         rhsUNC22gERYk1C6UAaKwDDqpj2St2XbYMr42fH1l+oE5DS+w4+BTp7n/lkwkJcYtsRr
         FuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784575337; x=1785180137;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGto1WUmtU2FuWuRVZZkJWBifnkd6qv0KZ7sGmDSExQ=;
        b=caWG6dprkgUjU14y5D5Mbt4sKFZGJQ6dILRprdmc5BLBgo2RBg/CO8bOI9KeeUOGAK
         0x2aa+gDXyT+6m7PO3GADm8vIB99rVLa9a9O4SC4ri7dzLrzwSmXrCjNE4UtZdcZbdNZ
         WgRaWgE8opK24B47hO1rYZXFB+3sJCkB8KBVpp/p+mmCzOISuQjQ1BCHlkRGnqaDtMU5
         PBV+GM+YPDy9H6AVpd+v0VYmVv7+pLNIxWe7wuoTz2IHuMw2cIuaSPOi0sRj8DbsXH2w
         6WQN/mT6MeoGHqEI9C+7JCmvmqgf7PAjtDH93jHuMcrb4VvaJL7r/QWAyfjUot1R/QCR
         MEDg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2oNyLy5RamvwWd9TgxCpdJfIYv6vaIVWpav7eiv4d2H0zKahWcd/Vx+Q26NVXi00f36Sxti3FwO98ng==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFzoRA3ytTDNyEH/pmhb7yv0vWIJ8gPAyUG/B8P8gwsjJYUbEy
	pIVKiW7QVxaOB7HJ0qpQJLvPHzCdo35Bf7WQoUecyQOuBs3/vMnwngbcVn04O0chZ/0=
X-Gm-Gg: AfdE7cltpcDWrnTtXY+G9pKhNhfachiVvEm+b/PK1yZ1eZcWWF4LQTfy4f9g+2Ylz5/
	jyi/Oy+i0lLdWXmxhNIiwzk5R3z2kv6nGguXTlS/qk4fWxxLpxJ3I1GEeO1vsDlVH4dH7iJ/rIZ
	/v4Lkba3QzrVYiJZq0VpW4FDW4bcmDVqlGn2CLbnReb9bGG3YJ1bd8C5vRLUekUoMiiHqaiXo2U
	gyhw0VFbMs/sxhKqLYKZ2La4kNgOPpAFgZY/XfHAbh4EGpFIDfeXD1nLWn0XLTdbuDYql9Ql8NF
	ORu7hx5HMLFJIjxNrE9ONJgHk0VvvIwqZUqW1PnMGNKjfPGsX/ybqAEXjJM74hl9FOU3M032toN
	pyqTnuER4yi/0SsZUf6ddJNWQxGjIZfplKph9ZyPb0KoBkApphfwm1ZO84jX+AU5xA+sNbHf7qi
	wrPxZBPStHjk9m/HskrajKllQ4SXQn3/mq0h+wLz5Fbw==
X-Received: by 2002:a05:6830:81ee:b0:7e9:b4d1:78b0 with SMTP id 46e09a7af769-7eda1157b00mr8626249a34.30.1784575336932;
        Mon, 20 Jul 2026 12:22:16 -0700 (PDT)
Received: from toolbox ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad91b8a5sm8911080a34.5.2026.07.20.12.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:22:16 -0700 (PDT)
Date: Mon, 20 Jul 2026 14:21:59 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Fushuai Wang <fushuai.wang@linux.dev>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	ilpo.jarvinen@linux.intel.com, osama.abdelkader@gmail.com, andy.shevchenko@gmail.com, 
	jackzxcui1989@163.com, kees@kernel.org, sean@mess.org, alan@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, wangfushuai@baidu.com, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3] serial: 8250: Clear CON_PRINTBUFFER on port
 re-registration
Message-ID: <dnpnqx6fz4osobhi7ydt2pi6hvqb4lm5vonpfpwrl2nogpadmw@6bqiyjskjo5j>
References: <20260522101042.21976-1-fushuai.wang@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260522101042.21976-1-fushuai.wang@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_122218_262816_EE72ACFC 
X-CRM114-Status: GOOD (  22.29  )
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

Hi Fushuai,

On Fri, May 22, 2026 at 06:10:42PM +0800, Fushuai Wang wrote:
> From: Fushuai Wang <wangfushuai@baidu.com>
> 
> When two PnP devices map to the same physical port, the serial8250 driver
> removes and re-registers the console structure for the same port.
> 
> During re-registration, the console structure still has CON_PRINTBUFFER set
> from the initial registration, which causes console_init_seq() to set
> console->seq to syslog_seq. This results in re-printing the entire
> system log buffer, which may lead to RCU stall on slow serial consoles.
> 
> Clear CON_PRINTBUFFER when re-registering a port to prevent duplicate
> log printing.
> 
> Fixes: 835d844d1a28 ("8250_pnp: do pnp probe before legacy probe")
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
> ---
> V2->V3: Clear CON_PRINTBUFFER when remove the port
> V1->V2: Add Fixes tag
> 
>  drivers/tty/serial/8250/8250_core.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Seems like this patch was added in next-20261717.

I'm noticing that this patch is causing no serial output to be visible
on riscv boards till the uart device is registered. Normally while
booting, we expect for all the prints made before this to be
buffered and appear post serial device initialization.

=> booti 0x11000000 0x21000000:${initrd_size} 0x31000000
Moving Image from 0x11000000 to 0x200000, end=1ca6000
[ 161.301] ## Flattened Device Tree blob at 31000000
[ 161.302]    Booting using the fdt blob at 0x31000000
[ 161.307]    Loading Ramdisk to 7653e000, end 7dd81853 ... OK
[ 161.366]    Loading Device Tree to 0000000076532000, end 000000007653d25d ... OK

Starting kernel ...

[    0.235159] printk: legacy console [ttyS0] enabled
[    0.238787] /soc/i2c@d401d800/pmic@41: Fixed dependency cycle(s) with /soc/i2c@d401d800/pmic@41/regulators/buck5

Most devs who are debugging might be booting with the earlycon boot
parameter. If earlycon is present, serial output is present, but
with earlycon missing (which is what most distros use), I don't get
any serial output till this point.

I observed this on a Milk-V Jupiter and a Hifive Premier P550. Same
behaviour in both cases.

Regards
Anirudh Srinivasan

> 
> diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
> index a428e88938eb..5419f1d22d47 100644
> --- a/drivers/tty/serial/8250/8250_core.c
> +++ b/drivers/tty/serial/8250/8250_core.c
> @@ -716,8 +716,12 @@ int serial8250_register_8250_port(const struct uart_8250_port *up)
>  	if (uart->port.type == PORT_8250_CIR)
>  		return -ENODEV;
>  
> -	if (uart->port.dev)
> +	if (uart->port.dev) {
> +		if (uart_console(&uart->port))
> +			uart->port.cons->flags &= ~CON_PRINTBUFFER;
> +
>  		uart_remove_one_port(&serial8250_reg, &uart->port);
> +	}
>  
>  	uart->port.ctrl_id	= up->port.ctrl_id;
>  	uart->port.port_id	= up->port.port_id;
> -- 
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
