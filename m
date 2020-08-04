Return-Path: <SRS0=zqIG=BO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3204FC433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2020 15:49:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0755F21744
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2020 15:49:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0fO0mBQX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLYhnrNC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0755F21744
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dE8MeDHO69KGCTMa/pbvjLRgMlasCofKEuoHjzH/voc=; b=0fO0mBQXS11Y3kVcwMUoNjHmpN
	zRIwz6uC7izCmSRXYfAEF8IPBtoe+Umm5IlLmwQaG6kjN6v9Pqv53mQel30D0U9zShNqNUFBJpzbf
	LI6XV47ySTgxcO/yOh3WaU07FgoLzYrWAnkyzYqFxjMh3cZAf4T0WVkFltspX4bCDOAp+WizmACxl
	i+npJPRjubI29Y4ZUeATDd0RdXwf1m4BXMuPGT29Y8yUwZyG3r4UCdORZxne1RbFu9Tba46b7vsj7
	WIfiHC4GpuF2dikvhIoIFnxi2I0cFvG2FN0gsoQTNb1rnV9LXQzCO66Y+M5Pfv5b8sWf4aRbBOSx/
	PrSeCsVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2zC5-0001dg-0P; Tue, 04 Aug 2020 15:49:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2zC1-0001cj-W3
 for linux-riscv@lists.infradead.org; Tue, 04 Aug 2020 15:49:35 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2AF6421744;
 Tue,  4 Aug 2020 15:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596556172;
 bh=QsTMC6SLev6ciXKGAQQLQoUY0jFy36C74ksPMkq7COk=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=HLYhnrNCP+LU+0Z7YJBOjhOf5u6gP45nqyYoZxh0fUnqECOE0ZJsJkDhZ1DOIeuJh
 3Z0jfjTITF80mzZqnG19XomRa0Su0varVijd0J0vHIROLImnW1BGwaiL76s44i08/P
 B0CA+7vHMdl176RsN13IxUxd1v0Y087cocISFRG0=
Date: Tue, 4 Aug 2020 17:49:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, speakup@linux-speakup.org
Subject: Re: [PATCH 2/2] speakup: only build serialio when ISA is enabled
Message-ID: <20200804154952.GB495852@kroah.com>
References: <20200804111332.dex7jobmabifdzw5@function>
 <20200804113413.GA181242@kroah.com>
 <20200804114951.ijs3hnezi4f64nll@function>
 <20200804115817.GC203147@kroah.com>
 <20200804153542.zowupa4ygdgxnciu@function>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804153542.zowupa4ygdgxnciu@function>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_114934_189513_D114E416 
X-CRM114-Status: GOOD (  18.17  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 04, 2020 at 05:35:42PM +0200, Samuel Thibault wrote:
> Greg KH, le mar. 04 ao=FBt 2020 13:58:17 +0200, a ecrit:
> > 	ERROR: modpost: "spk_serial_io_ops" [drivers/accessibility/speakup/spe=
akup_keypc.ko] undefined!
> > 	ERROR: modpost: "spk_stop_serial_interrupt" [drivers/accessibility/spe=
akup/speakup_keypc.ko] undefined!
> =

> Oh, indeed, these are not covered by the first patch.
> =

> I realize that KEYPC depends on ISA, but with COMPILE_TEST as
> alternative. We can build serialio in the COMPILE_TEST case too, I'll
> update the patches.
> =

> But then we'll still have:
> =

> > the riscv build issues.
> =

> Actually I was surprised by the riscv build issue: the issue is within
> riscv's inb() implementation, serialio.c is only calling it.
> arch/riscv/include/asm/io.h says:
> =

> #define PCI_IOBASE		((void __iomem *)PCI_IO_START)
> [...]
> #define inb(c)		({ u8  __v; __io_pbr(); __v =3D readb_cpu((void*)(PCI_IOB=
ASE + (c))); __io_par(__v); __v; })
> =

> and thus yes it's arithmetic over a (void*) pointer, the caller cannot
> do anything about it.

And that's fine, math with pointers, even void ones, is ok.

I wonder why riscv was complaining about that.  It's not nice, but it is
valid C.

> 8250_port.c itself uses inb(), doesn't it get a warning as well? Or is
> it getting compiled-out on riscv because of some Kconfig condition?

Probably this.

> I
> see that the whole drivers/tty/serial is under HAS_IOMEM, and that's the
> only condition I can see for 8250_port.c (except SERIAL_8250 of course),
> is that it, or is SERIAL_8250 just not enabled in the riscv bot?
> =

> Actually the warning seems new, when looking at the Debian build log:
> =

> https://buildd.debian.org/status/fetch.php?pkg=3Dlinux&arch=3Driscv64&ver=
=3D5.7.10-1&stamp=3D1595803499&raw=3D0
> =

> and looking for serialio.c, I do not see a warning, and its code hasn't
> changed. Is the build bot compiler just more talkative?

It's more talkative at times, and maybe the riscv code changed too.

Let's see if any of their developers care about it :)

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
