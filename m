Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6ABC761AF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 16:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIJXaykIqZldIwWZnRbwe/IUHgAq0zrGEn2mCBMqqGg=; b=ZqX6BS/4mWK56ZadymDanEnJ73
	A6SexfVgkbXPYW/EzZDoTh4Vj0+hYMCJ1GYiM4iLAi0RHpS2sYD52N0epJWfk/bJtZKdH/Igkvcqg
	hBGi56dW3TcUSEPilduWaqXpsRxsachKTWuQMrXg1bsp0AAPpxmwEkaq+PyHG7LMg5q/YhZh4/AOJ
	9Ourqu+XBs38dysPqAAB7UWu9B3m/jcM29uwRQHJggIlf1WasAoSIxgccc6DTfy3dOZSTh0TaijBG
	DhDo+51A5udtwSN0PwlstsdF5qSM/3SIscBd6KClEXt0saATajmYygiZYrBHuVljjEM5zxnJcFV0a
	09Rk9Z/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYlg-0017r5-30;
	Wed, 29 Mar 2023 16:35:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYle-0017p3-0J
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 16:35:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 61598B8235D;
	Wed, 29 Mar 2023 16:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CEAC433A4;
	Wed, 29 Mar 2023 16:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680107717;
	bh=9Qz5EAmCOL+i+u0TEzl9COJMOzeqVFdc0yFKt5x5s1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Go7xWPDCKBNfq4Ytevsuw8fdbZYMfquPT5WqMXt5jkfMK8rHWFAEMXPniq6MkRxKV
	 pLRo7kbE/bB1NJOgdSiyzoVxcXmmp9YrZQUo/elIokZSlkTDOrFxfyyPUfYsJ3PE6y
	 fCRzRWzPNDaaLUIzpH4XbarDbFqfYLzCkdQZZ9X3pys1e3P/jPVhlyPrXq0SA99WDw
	 ic9mE49NIASEX2Iz6XnIQRV85YQ1Aqq3gRNlJnJ32hBSXTIrMVUi2ya7R2inE8BnQH
	 kS3QNRQ0Xu3dLJh3+Y7JU6pDt0pR3yi3LZZBToP9Gga9ARu/UZVO8KG74Jiz3SjmrR
	 JsYF7Zrj3jGmg==
Date: Wed, 29 Mar 2023 17:35:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes v2 2/3] riscv: Do not set initial_boot_params to
 the linear address of the dtb
Message-ID: <5f01d8ec-553b-4954-a72d-de212230be96@spud>
References: <20230329081932.79831-1-alexghiti@rivosinc.com>
 <20230329081932.79831-3-alexghiti@rivosinc.com>
 <179c38d6-4298-4a16-b0d7-8aee49a91f58@spud>
 <CAHVXubh9t7VuM337Br-4y7zJp1msr6+bAtr1eVLc+P50V9Bikg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHVXubh9t7VuM337Br-4y7zJp1msr6+bAtr1eVLc+P50V9Bikg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_093522_441485_89A9FB12 
X-CRM114-Status: GOOD (  29.88  )
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
Content-Type: multipart/mixed; boundary="===============3365417951953141827=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3365417951953141827==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kjAfQifgMlHd6Dn/"
Content-Disposition: inline


--kjAfQifgMlHd6Dn/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 04:52:45PM +0200, Alexandre Ghiti wrote:
> On Wed, Mar 29, 2023 at 4:37=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Wed, Mar 29, 2023 at 10:19:31AM +0200, Alexandre Ghiti wrote:
> > > early_init_dt_verify() is already called in parse_dtb() and since the=
 dtb
> > > address does not change anymore (it is now in the fixmap region), no =
need
> > > to reset initial_boot_params by calling early_init_dt_verify() again.
> > >
> > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > ---
> > >  arch/riscv/kernel/setup.c | 5 +----
> > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > >
> > > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > > index 542eed85ad2c..a059b73f4ddb 100644
> > > --- a/arch/riscv/kernel/setup.c
> > > +++ b/arch/riscv/kernel/setup.c
> > > @@ -278,10 +278,7 @@ void __init setup_arch(char **cmdline_p)
> > >  #if IS_ENABLED(CONFIG_BUILTIN_DTB)
> > >       unflatten_and_copy_device_tree();
> > >  #else
> > > -     if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
> > > -             unflatten_device_tree();
> >
> > Silly question maybe, but since it isn't explicitly mentioned, the
> > XIP_FIXUP bits no longer matter?
>=20
> The XIP_FIXUP is only needed when translating virtual to physical
> addresses, but that does not mean I did not break it, I haven't
> considered XIP at all...

So, what currently happens is that, during early boot, we call
parse_dtb() right at the beginning of setup_arch().
That calls early_init_dt_scan(dtb_early_pa), which in turn calls
early_init_dt_verify(dtb_early_pa).

Here, relatively late during boot, we are coming along and calling the
function again. This existed prior to the XIP stuff landing, but the
specific XIP_FIXUP handling looks to be the fallout from:
https://lore.kernel.org/linux-riscv/82a05081-5662-c787-44e4-d480774ce31c@gh=
iti.fr/

The check in the first place was added by Anup's move away from fixmap
for dtb stuff, which makes me wonder - should this actually be part of
1/3? Something, something we no longer need to do this because these
addresses no longer change as per 1/3?

> > Also, in related news, I assume you don't have a QEMU setup that can do
> > boot an XIP kernel?
>=20
> I haven't booted a XIP kernel for a long time now, here are my notes
> from that time:
> https://github.com/AlexGhiti/alexghiti.github.io/blob/main/xip/XIP.md

Right, I'll have to get around to trying that. We never put any
investment into QEMU internally, nor run any CI against it, so the HSS
doesn't actually work in QEMU anymore.
Assertion failures due to missing peripheral emulation :(
Probably don't need the HSS though and can do a direct kernel boot, I'll
have to see if that works for this XIP stuff, I know it does for regular
kernels.

Cheers,
Conor.

--kjAfQifgMlHd6Dn/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCRowAAKCRB4tDGHoIJi
0ha3AQDqn5pBsE36Dp/vUjZCUYNwqjpdLvfFR9ru62ASV7a8CwEAgUXOc+FcR+Ok
bwGeyZ4aob+H7tDntX3k8QaoUhlvkAE=
=idAD
-----END PGP SIGNATURE-----

--kjAfQifgMlHd6Dn/--


--===============3365417951953141827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3365417951953141827==--

