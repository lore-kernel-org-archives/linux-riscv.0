Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35480C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 09:12:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECA90604DC
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 09:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECA90604DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmkweQ/2JZ0WvOntJ+tlSQFl2QFsrMX6krRuDWQpFJc=; b=qzOLS/YvRObUmX
	eL9I9zM4oSCGLe15Ul7J+jnFKEC0siMeUOJ18vvnoHVLE1Ma6dJcearp2DDEfaM6fkc1OxZNqjvnD
	p7YuSRqDSlOs/oDm1+vHOWHAlNOYRLGgfNpMqGWDYTXPOymKGr5GnM8MIfmQE8FEeEnpxA88Zcc5I
	cWWBpW+gb1ImZOokbwbsxO0obMLfQbdjnBsFg/eFGFRaS6jao2Zb3iUQ+fnSpOi8gfrOjFtLtPCOM
	jW+mS+kvUOmhqKJCRMbILj2ZyuBjvsgmX31CrE4GyY5bPJGnfAOxVcog/V5FsCBV6jy2hn5vaOROP
	yTv+3exiPZc5NWOTUSpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV99Y-006Udu-9E; Tue, 28 Sep 2021 09:11:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV8qK-006Lzx-9z; Tue, 28 Sep 2021 08:52:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE5C760720;
 Tue, 28 Sep 2021 08:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632819123;
 bh=UDvkMYqTjLXd6+U2xicY7wOfUB5ZOkt+dHh/8rdOTlc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cTMu48TryxtwYwA63frS9WJsJJtEv8zNUOA50QJOwYJ0ttQWvS4N1NtQ+dt8EE1QB
 WhvB44NHLxAwiU4WCWSnlO7WUmvq+ucC/YeM6Y6E023XhlJf2A8iiN1XuyCLH2haOB
 FQfyeBE6vO+J663EBcQ41MZaMprqmPm+ZWOSYwzz/naSuZOP4YNqCtElFq+e+yTRuk
 NiwEJtLB0Z2ARXqw90D53fVfYtKVVuyk326lFNxGgNlfhGBmmlxDJCgfxMk57b9x6C
 wSyieVrQ78KKPQ8Q8DtU2H5vcgQXRr5qnGV1uFZi1a6nOMvr2XmKfed8DufVkpQDWH
 0rdiFQilULl0A==
Received: by mail-wm1-f47.google.com with SMTP id
 f78-20020a1c1f51000000b0030cdb3d6079so2120208wmf.3; 
 Tue, 28 Sep 2021 01:52:03 -0700 (PDT)
X-Gm-Message-State: AOAM531AIRqGPp4uaBHXTxv+q0t3q4szU3MzWS75KJQiydQzTQXbzTis
 /AJT2sLC2cQgqDBEC1ZSUkaqebd6LZA/pNuEqIk=
X-Google-Smtp-Source: ABdhPJw1EufysO2nBZfUTMJ2f+KmIJnZVJeIE5gSQnbkQLtCag7gFuUClKMRTlZ2vF3thR7qUDV3jWY2OpZi5LDCFI4=
X-Received: by 2002:a1c:2357:: with SMTP id j84mr3498711wmj.1.1632819112401;
 Tue, 28 Sep 2021 01:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210928075216.4193128-1-arnd@kernel.org>
 <20210928083751.GG9223@ediswmail.ad.cirrus.com>
In-Reply-To: <20210928083751.GG9223@ediswmail.ad.cirrus.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 28 Sep 2021 10:51:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a11c6eLRWKvQeSqvEicc9bMDeEEGV5fygTidoRzYf9KnQ@mail.gmail.com>
Message-ID: <CAK8P3a11c6eLRWKvQeSqvEicc9bMDeEEGV5fygTidoRzYf9KnQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] firmware: include drivers/firmware/Kconfig
 unconditionally
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Simon Trimmer <simont@opensource.cirrus.com>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 "the arch/x86 maintainers" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-ia64@vger.kernel.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_015204_417435_C41949C4 
X-CRM114-Status: GOOD (  23.93  )
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

On Tue, Sep 28, 2021 at 10:37 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Thanks for looking at this for us. I don't think we are greatly
> attached to drivers/firmware as a location. Essentially, what we
> have is some firmware parsing code that needs to be shared across
> several devices, previously this was just in the sound subsystem as
> all our parts were audio. We are going to shortly be upstreaming
> some non-audio parts that use the same firmware infrastructure
> and it didn't seem very sensible to have them including bits of
> the audio subsystem.
>
> I guess the question might be where else would said code go?
> drivers/firmware seemed most obvious, all the other locations
> I can think of don't really make sense. Can't really put it a bus
> like spi/i2c etc. because we have parts on many buses. Can't
> really put it in a functional subsystem (audio/input etc.) since
> the whole idea was to try and get some independence from that so
> we don't have parts including subsystems they don't use. Could
> maybe put it in MFD, but no hard guarantee every part using it
> will be an MFD device and I am fairly confident Lee will feel it
> isn't MFD code as it doesn't relate to managing multiple devices.
> Only other option I can think of would be to make some sort of
> drivers/dsp or maybe drivers/cs_dsp, but not clear to me that is
> obviously better than using drivers/firmware.

Other DSPs use the drivers/remoteproc/ subsystem, but that
is more for general-purpose DSPs that can load application
specific firmware rather than loading a single firmware blob
as you'd normally do with the request_firmware() style interface.

Not sure if that fits what you do. Can you point to a high-level
description of what this DSP does besides audio, and how
flexible it is? That might help find the right place for this.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
