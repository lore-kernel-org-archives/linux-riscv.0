Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CA7C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 17:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJvKPKH0poGKLLyxAr7L6LrWDtGlOFMNPSXDyERDjfo=; b=ch4ODIxw2LdU2j2mi4uYFO4MVw
	3j1cbfKg4onL3Fvheuml6QGWgph/B+LYEt3QVcPf5QB2meRD9sOSduNDDvcHaVuGoeStPmHr5lrxf
	JyZlLovlAgEnX1crT4Qk2/HkdJgP2PQh0e0RvVfSL/zy7sQc0fV8hGsTXUdAkvFUwhidmDdPDn9u6
	aFnK320RUbmB+X/Dy6kssk8ACzxB4GP5kyHeaaB7oWFD/vWyr36/bmGQ1KA/Vb4TfrMyoKbgwAEn8
	v/kKuldZWvwTuxpNNr/Ng7eKaOLfy1tiX4k3hbK6rq2mxOvtCAcjIYlPrQm0NQJRUBCfxgh8qV+/3
	vmJEDEtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbkMu-00000005o8K-04xe;
	Wed, 07 Aug 2024 17:22:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbkMq-00000005o7b-3bwO
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 17:22:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B6A81CE0F82;
	Wed,  7 Aug 2024 17:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85A0C32781;
	Wed,  7 Aug 2024 17:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723051348;
	bh=y6mJiL+/McAto5QWkflfrjZFdn6Y74RBYK1IE0EbZGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owWgzSrkOEo9kWqWUr5x4wRzvi88VoT4jyWIx4s9aUtJ4IjvpB5xpLTsI+nCi09gj
	 lRw+2eWqz0Rg0CS59/LJD0bJA4JRd/koUNFZ+rZk+QVKEyxV4dRYPdjestJAO1Rhvp
	 ZuchR+43Vc612jJdJlt1Yh3lJ4+2XOlsH5/KvZaAGspGfz2+m18CSPqCvM/H2OAbuA
	 ksq7IdAiYcwfL2/TnfGSs/Cjilr0KZ6YWdoAUYo9j5gQTWOLWfS5RnMqFpDkx87Q3g
	 Xssz6QmBN+iHUNaeVfuyzx/v29adPahGaDjVJyfjL2mtuZqa8/0vZPEQq+86pwdPGk
	 J0JR7yRdGP2hg==
Date: Wed, 7 Aug 2024 18:22:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Lewis Hanly <lewis.hanly@microchip.com>
Subject: Re: [RFC v7 4/6] gpio: mpfs: add polarfire soc gpio support
Message-ID: <20240807-epileptic-pessimism-a7866dbadae4@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-underage-wheat-7dd65c2158e7@wendy>
 <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com>
 <20240806-breeze-crazily-84d4e4af8f4e@spud>
 <CACRpkdbMxuhe2HQZ-Av1R7JW94rS0FosPO-utYNsFO8avR3TbQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdbMxuhe2HQZ-Av1R7JW94rS0FosPO-utYNsFO8avR3TbQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_102233_279005_D8E9C45F 
X-CRM114-Status: GOOD (  23.74  )
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
Content-Type: multipart/mixed; boundary="===============8224973845839185150=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8224973845839185150==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2+uJzAu790xEQaKU"
Content-Disposition: inline


--2+uJzAu790xEQaKU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2024 at 06:55:58PM +0200, Linus Walleij wrote:
> On Tue, Aug 6, 2024 at 7:18=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> > On Mon, Aug 05, 2024 at 10:04:53AM +0200, Linus Walleij wrote:
>=20
> > > Is it possible to use augmented generic MMIO, i.e just override these
> > > two functions that
> > > need special handling?
> >
> > I'll look into it - as I mentioned under the --- line, I really didn't
> > touch most of the driver and there's comments from Lewis' submission
> > that still apply.
>=20
> Thanks Conor, thanks for taking this over, too many patch sets fall
> on the floor.

Meh, it always bugged me that upstreaming driver was given up on because
fixing the interrupts was "hard". It'd be a poor example to others if I
le the driver sit downstream as a result.

> I'm mostly fine merging it like this and then improving
> it in-tree as well, I'm not as insistent on things being perfect before
> merging as long as they are maintained.

The gpio side of things might not be too bad, but the irqchip side is
crap (it has an of_iomap() in it for example*), and if the irqchip driver
needs work it feels sensible to improve on both before merging anything.
Unless of course, you think it would be reasonable to rip the interrupt
support out of the gpio driver, merge that and incrementally add it
while also improving the things you and the earlier review mentioned
w.r.t. regmap?

Cheers,
Conor.

* Getting rid of the of_iomap() needs me to rewrite parts of the clock
driver, which seemed overkill until I knew whether or not the approach
was permitted.

--2+uJzAu790xEQaKU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrOtTwAKCRB4tDGHoIJi
0gNfAQCL3AK7b7Rag0SuAREO6VHwuSZM26U4wr2nM7r1q6SmAwD9HTu8K4xzfaDX
SbK/WfgJsXClolZ0GfJezsgv+yu4RAw=
=Sm0o
-----END PGP SIGNATURE-----

--2+uJzAu790xEQaKU--


--===============8224973845839185150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8224973845839185150==--

