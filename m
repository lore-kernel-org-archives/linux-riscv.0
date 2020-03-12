Return-Path: <SRS0=jpEU=45=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE144C0044D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2020 02:37:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C83E20734
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2020 02:37:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iI+FvDJq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="a+9TM53e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C83E20734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=faWpUg+LE2/N1Y0T5FmZCDAU16Eeu82lWgxkIXEoRSM=; b=iI+FvDJq14LFld0QeZyjoUqrL
	+d4K0NXFET0iIT0XtBOZootaRmCxdVOBx1z9wH1dAOpcKw0RFS60B6ZjoyrJx6DwO6hGn8C8Oo5Tu
	zS72QLfkNg+bfAZ8BOpk3vvbLZRzZ6e4mhuVRqjtJgre9/5VzQT+s3u709tjCfoEiHVUq13q1KGsO
	YoDCwnRifAaVehWuuqmmhREqOQXwcdbzQn5z/Ev5eLe0Zm4n0+7YT5EB/KvrcGZhlG3SduWJyug58
	1BxAO8UguaYokeT2nA3V/3uaCxnKhx25F6NrtuQ1bIpmO9zK9kL42P9nzPJ/E0aEyHJwUFQvYoRAt
	ipAseYrOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCDiZ-00065e-Hi; Thu, 12 Mar 2020 02:37:03 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCDiV-00065K-Jf
 for linux-riscv@lists.infradead.org; Thu, 12 Mar 2020 02:37:02 +0000
Received: by mail-qt1-x842.google.com with SMTP id 59so3245251qtb.1
 for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2020 19:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=faWpUg+LE2/N1Y0T5FmZCDAU16Eeu82lWgxkIXEoRSM=;
 b=a+9TM53emBGV+ZoqvnaXKlCyI0G7M3o7DQci1N4S/xM3SqdIRyuXnhROgqIZALgZGN
 WsyX12Q+kKapBCiQzBuFyJ1EHOsJt4cUIZ4FBen6X6lYZRjgn0R1qZkbzF0uIJd2QYK0
 r31T7StlLu7FdOiADVU9GdgVbMFKp9OQLI7SRcwPeZcXv1KeM55IxFQ22vNCTSpbgncE
 CdpRVO8k9pm7E4REwSOY0+NapxfEF4O9+aQ8jPY5/7VcMQ7S+8HKjUm+frFZHnm7Np5d
 KhU27PPLVP7LCXyJONUYpdxOQzfV7H9/UUQxPnLdM+3E+KCONfev7npJP+bmLsa4vDQs
 upww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=faWpUg+LE2/N1Y0T5FmZCDAU16Eeu82lWgxkIXEoRSM=;
 b=PXa0Dq+pwikiPCeaz73pHbqlLTng+iTuEFZbTtLR9vgyLuUYgIltJgC7iU/AcCTd2g
 uq1OJSuJhJNAIPIBm0/a/IZlNPUomYePi9blpUElQDZ0sxHh87FHFnvZxn3r8xMUgBXC
 WnC7DqCNA/0Z/Zlyg01ea4hm8gQ/YV3N8v+SEZNIKVbohdZ4bATssZSrUXkrvuZhBn86
 tHcH0YMr6F6Or89TrzorprreVe2vInKJQEc/cnsUYbhVgLxZNPjG/HArBjDqIvddSMJX
 mXTvVeodr/McifuXAMTPbMgFAtjBks2HqVijE9Li/u97eLv3afcU9yT5GUk/Cv3yGid0
 eUow==
X-Gm-Message-State: ANhLgQ1ErTs75orJKuB+zQVuGqiCokBepPSzbs53gAsCiHjQ7Ho/TgM+
 SEt6UvXjF0AUcBaag/gp/D8FO18pmG4qREPfiA1ONQ==
X-Google-Smtp-Source: ADFU+vu7D7I/KxqhTI33Btk5Vo27UwFDEur84H7SBerYlWEcjxh9uN0Uv2fDhZ8EPiPWuGJ3Y+pW9sN4NWNBpudPiaA=
X-Received: by 2002:ac8:24db:: with SMTP id t27mr5452633qtt.49.1583980618106; 
 Wed, 11 Mar 2020 19:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <1583224900-25824-1-git-send-email-vincent.chen@sifive.com>
 <mhng-cf4b7d3b-9841-44a1-9ffd-ac7f4cdeb75d@palmerdabbelt-glaptop1>
 <20200307085127.GA3878075@kroah.com>
In-Reply-To: <20200307085127.GA3878075@kroah.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Thu, 12 Mar 2020 10:36:46 +0800
Message-ID: <CABvJ_xjXCX2WVxQrrYWmP2n-xp2fpwade9JBbna=j7UkYOkY2Q@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: Add CONSOLE_POLL support to SiFive UART
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_193659_679291_CD49210E 
X-CRM114-Status: GOOD (  23.78  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-serial@vger.kernel.org, jslaby@suse.com
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Mar 7, 2020 at 4:51 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Mar 06, 2020 at 10:13:56AM -0800, Palmer Dabbelt wrote:
> > On Tue, 03 Mar 2020 00:41:40 PST (-0800), vincent.chen@sifive.com wrote:
> > > Add CONSOLE_POLL support for future KGDB porting.
> > >
> > > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > > ---
> > >  drivers/tty/serial/sifive.c | 27 +++++++++++++++++++++++++++
> > >  1 file changed, 27 insertions(+)
> > >
> > > diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
> > > index d5f81b98e4d7..acdbaca4de36 100644
> > > --- a/drivers/tty/serial/sifive.c
> > > +++ b/drivers/tty/serial/sifive.c
> > > @@ -818,6 +818,29 @@ static int __init sifive_serial_console_setup(struct console *co, char *options)
> > >     return uart_set_options(&ssp->port, co, baud, parity, bits, flow);
> > >  }
> > >
> > > +#ifdef CONFIG_CONSOLE_POLL
> > > +static int sifive_serial_poll_get_char(struct uart_port *port)
> > > +{
> > > +   struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
> > > +   char is_empty, ch;
> > > +
> > > +   ch = __ssp_receive_char(ssp, &is_empty);
> > > +   if (is_empty)
> > > +           return NO_POLL_CHAR;
> > > +
> > > +   return ch;
> > > +}
> > > +
> > > +static void sifive_serial_poll_put_char(struct uart_port *port,
> > > +                                   unsigned char c)
> > > +{
> > > +   struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
> > > +
> > > +   sifive_serial_console_putchar(port, c);
> > > +   __ssp_wait_for_xmitr(ssp);
> >
> > So we still have that TX watermark bug in the SiFive UARTs.  If this function
> > is supposed to wait until the word is actually out on the line then this isn't
> > sufficient, but if it's just supposed to wait until the next write won't block
> > then this is fine.
> >
> > I'm not really a serial person, so mabye someone else knows?  For those
> > unfamiliar with the issue, there's a pretty good description in the patch to
> > fix it
> >
> >    https://github.com/sifive/sifive-blocks/pull/90
> >
> > Poking around we don't have any PRE_RATE_CHANGE hook, so I'm going to take a
> > whack at adding one -- not really related to this patch, though.
>
> I do have to drop this patch from my tree, as it breaks the build, so it
> needs to be redone anyway :(
>

Thanks for the test to find out my mistake.
I will fix it and resend the 2nd version patch.
Thanks

