Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B3AC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Apr 2022 06:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7AGg7x0D1/TO01M4oWZJ3udc5iJK8Yd8xoacGKwGuA=; b=v4XEsUxwkBshT4wbLBqdHHJn/V
	khn86ggY5eXQ1TowTbfVO4+aeox4QF+vOYEJKod3AdYE8dfQxCnfEYWQ6xWV/Hg/c0EcSqjjoCq+H
	OZR9LB2oaLCLq+bbxqm5ofdZbaFKte4DH8NbbeW9+WZhXoQCMxAql+xnVVKTDhE+bEwmUvcqOYbza
	BPIbCjCFUHPPC3tbjtutYThFG+oJLXHUY3556SSUmuJG96RkW51xL3WIoChTiz9H1RhSO8O7SnCO4
	ElLeqlZvcrWzJb9Yavi4NfI1xxiSmGn5lhakdEvcPxVNWDJQKsRJAekB6fbCUDLlD18nQsqqTEmVR
	T8EJWsSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naB9t-004ho8-Rh; Fri, 01 Apr 2022 06:53:21 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naB9r-004hnh-O5
 for linux-riscv@lists.infradead.org; Fri, 01 Apr 2022 06:53:21 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1naB9k-00025p-1L; Fri, 01 Apr 2022 08:53:12 +0200
Received: from pengutronix.de
 (2a03-f580-87bc-d400-a2e4-7752-b370-a958.ip6.dokom21.de
 [IPv6:2a03:f580:87bc:d400:a2e4:7752:b370:a958])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 1B3C458411;
 Fri,  1 Apr 2022 06:53:10 +0000 (UTC)
Date: Fri, 1 Apr 2022 08:53:09 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, Kito Cheng <kito.cheng@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Sparse Mailing-list <linux-sparse@vger.kernel.org>, ukl@pengutronix.de,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: Re: [PATCH] riscv: fix build with binutils 2.38
Message-ID: <20220401065309.dizbkleyw44auhbo@pengutronix.de>
References: <20220126171442.1338740-1-aurelien@aurel32.net>
 <20220331103247.y33wvkxk5vfbqohf@pengutronix.de>
 <20220331103913.2vlneq6clnheuty6@pengutronix.de>
 <20220331105112.7t3qgtilhortkiq4@pengutronix.de>
 <CAHk-=wjnuMD091mNbY=fRm-qFyhMjbtfiwkAFKyFehyR8bPB5A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjnuMD091mNbY=fRm-qFyhMjbtfiwkAFKyFehyR8bPB5A@mail.gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_235319_820543_169B3A60 
X-CRM114-Status: GOOD (  14.25  )
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
Content-Type: multipart/mixed; boundary="===============2076525477480664606=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2076525477480664606==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5jl2rqq57omr4yri"
Content-Disposition: inline


--5jl2rqq57omr4yri
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 31.03.2022 11:16:53, Linus Torvalds wrote:
> On Thu, Mar 31, 2022 at 3:51 AM Marc Kleine-Budde <mkl@pengutronix.de> wr=
ote:
> >
> > Cc +=3D linux-sparse, Uwe, Luc Van Oostenryck
> >
> > tl;dr:
> >
> > A recent change in the kernel regarding the riscv -march handling breaks
> > current sparse.
>=20
> Gaah. Normally sparse doesn't even look at the -march flag, but for
> riscv it does, because it's meaningful for the predefined macros.
>=20
> Maybe that 'die()' shouldn't be so fatal. And maybe add a few more
> extensions (but ignore them) to the parsing.
>=20
> Something ENTIRELY UNTESTED like the attached.

Works-for-me:

|   CHECK   /srv/work/frogger/socketcan/linux/drivers/net/can/usb/etas_es58=
x/es58x_core.c
| WARNING: invalid argument to '-march': 'zicsr_zifencei'

Tested-by: Marc Kleine-Budde <mkl@pengutronix.de>

Regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--5jl2rqq57omr4yri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmJGoVIACgkQrX5LkNig
0131+gf+OoP5mBIuthsyF3cauP7RO1sSa7VFXUnlth9PI5r6HwTL7dHAjry4lXfJ
x4Dl/7p024mbaQcCTKyUVStHaSIVd6aze/8pCsjmBTARtMe86P9rOyWGaLcES5P7
tp/DjsYxQrYrOt+5Fs7+UrqZP5vnXuPYrKfYz0/VP3fLoA6gFGYTvlTXgiYFj7vL
2xdpRvS1pbZhExvNlkKnJSzKZwE6L841k292RtWWOCzogsPt5YwUlkn/Zb4FbHwR
y8BbMJhcGHG6T+DkgQA6amREXr6Y0Z5z4vzPDZMRpTFdVVmAUaYgqO7sncdEoyDL
qv7LdfZg11z7bYVLbk/Z7Y5oXcsG8A==
=1XuF
-----END PGP SIGNATURE-----

--5jl2rqq57omr4yri--


--===============2076525477480664606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2076525477480664606==--

