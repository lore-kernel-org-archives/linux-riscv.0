Return-Path: <SRS0=kt+C=4Y=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB97C10F00
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  7 Mar 2020 08:51:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C28E02070A
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  7 Mar 2020 08:51:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z0TJNKqd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSTLOQa5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C28E02070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w386IgZP5UoldX4Fhlp8HcC2/wPg/XfJrJp4uOXk/gU=; b=Z0TJNKqdj9Xdr6RiYDznfeumW
	YCaAi83CJ7z4rIO19Bfhk29IGORH3IZmMLkc1vonmn1ieeUyRLdIW4TavKa9jPjzlkVrSABxdMoTG
	MhmscracINM5saICbpAYE2hEWPO9YDQo1eTgIrHeJKR+bgquqgS3bocV7UQ8V3Kv9RL6QbPepMLA5
	2C/a+e3ODKwduZH0fG8K6ox1fO4TrvkytaOcH1h2b1+V0wJLDB7ar11lCd7EPzCz3HktgDu1KGtuC
	qkCHP7Vt0syITDKHClBKMQcF+wccDiRHrHOezrwxkE4E9NhTQlybhJheV5UDF/Svf6//HuM0UvbHU
	JzKwAR0+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAVBF-0006Tz-Fp; Sat, 07 Mar 2020 08:51:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAVBD-0006Te-2m
 for linux-riscv@lists.infradead.org; Sat, 07 Mar 2020 08:51:32 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EDB902070A;
 Sat,  7 Mar 2020 08:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583571090;
 bh=XHkhJ9roLn4BQH0RujkrIRY5Fa5VCdkj7MpWailNw9c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jSTLOQa5HR5biwsuxQJQxCY1r4JeMeUWlRVlevIuxnnwWaDPnxfiHy8H2rWjQbUcI
 +8wTupJx+OzEdzUUDucm0W0TUlaTv12wApm7FQ0zBS7vs5x2X5OllXafJGzrbyvtp+
 Si3BKFGeCvF8Qe3jYUWEYhIa2zxhXj/Ws8uE/XKw=
Date: Sat, 7 Mar 2020 09:51:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] tty: serial: Add CONSOLE_POLL support to SiFive UART
Message-ID: <20200307085127.GA3878075@kroah.com>
References: <1583224900-25824-1-git-send-email-vincent.chen@sifive.com>
 <mhng-cf4b7d3b-9841-44a1-9ffd-ac7f4cdeb75d@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-cf4b7d3b-9841-44a1-9ffd-ac7f4cdeb75d@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200307_005131_144173_BF2F81F4 
X-CRM114-Status: GOOD (  20.76  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: vincent.chen@sifive.com, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-serial@vger.kernel.org,
 jslaby@suse.com
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 06, 2020 at 10:13:56AM -0800, Palmer Dabbelt wrote:
> On Tue, 03 Mar 2020 00:41:40 PST (-0800), vincent.chen@sifive.com wrote:
> > Add CONSOLE_POLL support for future KGDB porting.
> > 
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > ---
> >  drivers/tty/serial/sifive.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
> > index d5f81b98e4d7..acdbaca4de36 100644
> > --- a/drivers/tty/serial/sifive.c
> > +++ b/drivers/tty/serial/sifive.c
> > @@ -818,6 +818,29 @@ static int __init sifive_serial_console_setup(struct console *co, char *options)
> >  	return uart_set_options(&ssp->port, co, baud, parity, bits, flow);
> >  }
> > 
> > +#ifdef CONFIG_CONSOLE_POLL
> > +static int sifive_serial_poll_get_char(struct uart_port *port)
> > +{
> > +	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
> > +	char is_empty, ch;
> > +
> > +	ch = __ssp_receive_char(ssp, &is_empty);
> > +	if (is_empty)
> > +		return NO_POLL_CHAR;
> > +
> > +	return ch;
> > +}
> > +
> > +static void sifive_serial_poll_put_char(struct uart_port *port,
> > +					unsigned char c)
> > +{
> > +	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
> > +
> > +	sifive_serial_console_putchar(port, c);
> > +	__ssp_wait_for_xmitr(ssp);
> 
> So we still have that TX watermark bug in the SiFive UARTs.  If this function
> is supposed to wait until the word is actually out on the line then this isn't
> sufficient, but if it's just supposed to wait until the next write won't block
> then this is fine.
> 
> I'm not really a serial person, so mabye someone else knows?  For those
> unfamiliar with the issue, there's a pretty good description in the patch to
> fix it
> 
>    https://github.com/sifive/sifive-blocks/pull/90
> 
> Poking around we don't have any PRE_RATE_CHANGE hook, so I'm going to take a
> whack at adding one -- not really related to this patch, though.

I do have to drop this patch from my tree, as it breaks the build, so it
needs to be redone anyway :(

thanks,

greg k-h

