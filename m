Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BDCC4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 21:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nX6D1kK55q4jRUh47HWxuidvvwNzQWhm0hqT4ydHH4U=; b=YjFXKwg8Hzxa0I
	d4jACcABPYRV/31khXHJChyda5BfSA0Pv7oBccUXLoleCikmR7Jb3d7k3t75Kmrmh/a6a4TeRZ9wW
	xWgJ+n2rS7oMZnyPAtveSoJbZ6NW6848O00idzZGx3O+kaO2Qfhq5AM1ijBPV9WLwqHxTcPty2cCv
	WQPydDEAQaTQBz7P2YwHN0/fNU4sK+o124GHBPEGqOQiDG9CbpxXZGPpEPL/F/PpYVgTcc+4RSIN+
	ZQt7hQkS3jM5JovFxsPqcop5e4rBqi+9u0rWiksxLEiI+4CJXw7l78YnIMyNaMIxIVMMWcHQ1KhH4
	i66L+xNfzdvm1m6ZGAWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0qgv-00B4xO-Uo; Thu, 01 Dec 2022 21:01:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0qcP-00B4RC-5R
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 20:57:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1D63262123
	for <linux-riscv@lists.infradead.org>; Thu,  1 Dec 2022 20:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31BDC43149
	for <linux-riscv@lists.infradead.org>; Thu,  1 Dec 2022 20:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669928233;
	bh=fdrJ15WDKSBx3YB1MakWvP0kCrIB8zpank2IGVDBUI4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AWUsJlemRllHnB3KbfYBFan7MowqWGBBzZXfshK50w7NfgU8DbH0i5URYIiA8i4li
	 GBUHSuMbeF3CoaT6OuX5j6oPgqzYbAa/mwWgJUV1gWr1qn9pDtFcODeJKzmf8ZyH4y
	 Z+z3JndoNbtogS6pfY3Fyl2L/Hd/rs/27letywm4FVrVRK6ziqXPEP1vx34e1upKXp
	 mxZEMect0GromyYeJZOF/2zhuyduh+oNMYqxKtFAdPDwzKvtfdD8O7hVAWvlFNd3jj
	 x6E72ApwWEejybOeqWXhZw3qwRw6IBDRohe6AxHKCqbAYRU4OgHLN8q+YqRmdWZteY
	 b6z6C2+Vm9P0g==
Received: by mail-lf1-f51.google.com with SMTP id be13so4407464lfb.4
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 12:57:13 -0800 (PST)
X-Gm-Message-State: ANoB5pkuGM3aikEuX9HzhYDb1x26m0ZDWIC7YzeE/3GiXSKmIa4J3VAX
	CuKDHYzjf+la7piI7cAkS3czQwlvpMmBfW6xnRw=
X-Google-Smtp-Source: AA0mqf4aRybCNgkYFiWCi2CJQd3OPiCCr15y3XRLfWcWG+1KjPdzD46/6PygpsQciMdDVS+ncbsST+gLVrEqsm5wvZ0=
X-Received: by 2002:a05:6512:15a8:b0:4a6:3ed2:3717 with SMTP id
 bp40-20020a05651215a800b004a63ed23717mr18342342lfb.637.1669928231609; Thu, 01
 Dec 2022 12:57:11 -0800 (PST)
MIME-Version: 1.0
References: <20221130225614.1594256-1-heiko@sntech.de> <20221130225614.1594256-13-heiko@sntech.de>
 <20221201193455.2hr6mwm6sa6vnd3w@kamzik>
In-Reply-To: <20221201193455.2hr6mwm6sa6vnd3w@kamzik>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 1 Dec 2022 21:57:00 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG=zM0EFFPn8MBWFurk=oSRPqwdd6CP1dudQC+JXV36Og@mail.gmail.com>
Message-ID: <CAMj1kXG=zM0EFFPn8MBWFurk=oSRPqwdd6CP1dudQC+JXV36Og@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] efi/riscv: libstub: mark when compiling libstub
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, conor@kernel.org, 
	philipp.tomsich@vrull.eu, emil.renner.berthing@canonical.com, 
	linux-efi@vger.kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_125717_318129_91702A8D 
X-CRM114-Status: GOOD (  24.95  )
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

On Thu, 1 Dec 2022 at 20:35, Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Wed, Nov 30, 2022 at 11:56:12PM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> >
> > We may want to runtime-optimize some core functions (str*, mem*),
> > but not have this leak into libstub and cause build issues.
> > Instead libstub, for the short while it's running, should just use
> > the generic implementation.
> >
> > So, to be able to determine whether functions, that are used both in
> > libstub and the main kernel, are getting compiled as part of libstub or
> > not, add a compile-flag we can check via #ifdef.
> >
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

I think it would be better to update arch/riscv/kernel/image-vars.h so
that only these generic implementations are exposed to the stub in the
first place.

> > ---
> >  drivers/firmware/efi/libstub/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> > index ef5045a53ce0..777d1ab059e3 100644
> > --- a/drivers/firmware/efi/libstub/Makefile
> > +++ b/drivers/firmware/efi/libstub/Makefile
> > @@ -25,7 +25,7 @@ cflags-$(CONFIG_ARM)                := $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> >                                  -fno-builtin -fpic \
> >                                  $(call cc-option,-mno-single-pic-base)
> >  cflags-$(CONFIG_RISCV)               := $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> > -                                -fpic
> > +                                -fpic -DRISCV_EFISTUB
> >  cflags-$(CONFIG_LOONGARCH)   := $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> >                                  -fpie
> >
> > --
> > 2.35.1
> >
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
