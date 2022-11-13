Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BE4C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Nov 2022 18:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ubul7hhvdirKTQReZFqlwU/nAw8yLj8Bb4cOKsfzqQc=; b=dfhkZNwweaizRi
	F3qBLFyjY19E7mHG7Tpm6rJtKORMswlDLabSC8hPsBikHfZEbze21utBV/k1QelOdfiRy6Nr9BFuO
	65ACKU87Nu+QOCKz7WbQ3MhCGo03lxn4xxDI3kQfkc2FjEORr4gouWlWWxczFKiim+HDaYe13/cQH
	PbhFzRgKvWnuYHfpuLm6d242aS2VL1c5+l+nmO0Dv0fAcBxJPYWxB5PRfqaIFjlKc7WUC95nQEdix
	p1WsewtZ4nd14OG2z9cTrVJ31+nk4lj1Npy4GKYpZBY1Fcm834DSZzb59+f6LiDFctJUNu1Ux8j94
	LlGjRV/Xs0FHRwzvjD/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouHNt-00CpD8-W8; Sun, 13 Nov 2022 18:07:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouHNq-00CpB9-TW
	for linux-riscv@lists.infradead.org; Sun, 13 Nov 2022 18:07:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3A6BCB80B8A;
	Sun, 13 Nov 2022 18:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1ABC433C1;
	Sun, 13 Nov 2022 18:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668362823;
	bh=lA6bkjoAw1Cq/LsJOR5kZLPxbZT5CeVLnXJKGWhl+6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qlu5ImmWalEOBr+ZE6sRbtMDVGLcCpM9NBCKOVRx2/l1XOPEhHBFPYLgbHkqJx9iu
	 o2280zWdcNIwwomLRigbPoglUB8RyDvmTyPBXGOQ4P84XYkAiriP+hwh/vNxYVW73J
	 bBYGmRcm7PwuqmjWdwOxDOI+nHf2Ow956reOIQsPmYQzMf/EeWYe5RkJTqLgVr6fWe
	 zH+KT93j/enGCGE5iopvWpPxTF39SW+DrCsY4BJ+ILGGY0F0ADTUwb+IY82RWCi0DH
	 O5CdDRPrlpJmf4ccQoS0HUvMyWAl1TnltTLXgjEXl6Br6a3VnKcRaVUlzDp6Xyh/Av
	 FCEuQyLS356vQ==
Date: Sun, 13 Nov 2022 18:06:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com
Subject: Re: [PATCH 1/7] efi/riscv: libstub: mark when compiling libstub
Message-ID: <Y3EyQnlKaJM9AoPI@spud>
References: <20221110164924.529386-1-heiko@sntech.de>
 <20221110164924.529386-2-heiko@sntech.de>
 <Y3EmWsGanb4jf35F@spud>
 <2243332.usQuhbGJ8B@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2243332.usQuhbGJ8B@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_100707_264283_53B94135 
X-CRM114-Status: GOOD (  27.58  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Nov 13, 2022 at 06:20:29PM +0100, Heiko St=FCbner wrote:
> Am Sonntag, 13. November 2022, 18:16:10 CET schrieb Conor Dooley:
> > On Thu, Nov 10, 2022 at 05:49:18PM +0100, Heiko Stuebner wrote:
> > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > =

> > > We want to runtime-optimize some core functions (str*, mem*)
> > > but not have this leak into libstub. Instead libstub
> > > for the short while it's running should just use the generic
> > =

> > Totally pedantic reword, mostly b/c I am an eejit and confused myself
> > the first time reading this:
> > =

> > "Instead, libstub, for the short while it's running, should just use
> > the generic implementation."
> > =

> > > implementation.
> > > =

> > > To be able to determine whether functions are getting compiled
> > > as part of libstub or not, add a compile-flag we can check
> > > via #ifdef.
> > =

> > Exempting the stub makes sense to me given when it runs. What's the
> > actual downside of not exempting it though?
> =

> You run into build-errors.

Ah right, I figured it had to be something more than avoiding some
overhead. Might be worth noting that the purpose is to avoid build
errors.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> =

> I.e. the alternatives (zbb-variants in this case) get compiled
> so there is the reference to the _strlen_zbb function in the efi-stub,
> which of course is not fullfillable, hence the "magic" in patch6 :-) .
> =

> =

> Heiko
> =

> =

> > > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > ---
> > >  drivers/firmware/efi/libstub/Makefile | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > =

> > > diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware=
/efi/libstub/Makefile
> > > index b1601aad7e1a..39c8e3da1937 100644
> > > --- a/drivers/firmware/efi/libstub/Makefile
> > > +++ b/drivers/firmware/efi/libstub/Makefile
> > > @@ -25,7 +25,7 @@ cflags-$(CONFIG_ARM)		:=3D $(subst $(CC_FLAGS_FTRAC=
E),,$(KBUILD_CFLAGS)) \
> > >  				   -fno-builtin -fpic \
> > >  				   $(call cc-option,-mno-single-pic-base)
> > >  cflags-$(CONFIG_RISCV)		:=3D $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CF=
LAGS)) \
> > > -				   -fpic
> > > +				   -fpic -DRISCV_EFISTUB
> > >  cflags-$(CONFIG_LOONGARCH)	:=3D $(subst $(CC_FLAGS_FTRACE),,$(KBUILD=
_CFLAGS)) \
> > >  				   -fpie
> > >  =

> > =

> =

> =

> =

> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
