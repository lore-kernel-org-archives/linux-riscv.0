Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4421BC7EE23
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 21:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tp0YQud3Cbzg4G4T8Vu3H7BBtTU9pS37SvsdLOWXYK0=; b=nN7aJ+BODQnk7A/lKy5gp8kIwa
	DCnquIZwcQ9fuIcG/4bE5fFlqewMdBLYa5I8nRQaqMCtaLbYwtTRp4Ny5+UO/glfGiDmy7x7WNE0J
	qZAoBRzYBOPXOhSBiPSTU5sD2jZfYPOHhGLbIEyKg2wQka5c4ne2rjXjy41KcSWry1qaiaAqM6jK4
	9ir4Ml+7r3+gzEKluMGH7rw0lpX1/Dm24vc6oxRRWRuz3URvGf8GZ7EvNEqUnCJ7CbjlsvLk08eNC
	HwMrRddIvA9AYaArmooCYnvzmtfZ1CaUcEXyBRlc+97EJZ/zOqIlij4DVzIXp+hGl0Un6hjl488zb
	Yb91HwHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5uq6-00D64c-35;
	Sun, 04 Jun 2023 21:00:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5uq2-00D63o-2C;
	Sun, 04 Jun 2023 21:00:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E22E0609AD;
	Sun,  4 Jun 2023 21:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB97FC433EF;
	Sun,  4 Jun 2023 21:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685912433;
	bh=bP33TM36+Nno9c9jmbHjs6cfji8fLGfto2b0EkwdTmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dz0JAJ/z++ZXys+o8PXM4tJtgvoWr0aPQTOlME1Tnuo9UTwo9FNVZ3CrO76ayaOCA
	 wPLXlXvbwq/tFhC2hWi7ZuhKOxSiwUUewbylPzM54BszYnBG8uxqunt6v4HzCMI00l
	 OCYkG0+JylrrOLXd7lMffOa9Y1N+pgsueKtWond32u+j2+noyb2Pxy2F20x9N6xXhI
	 3MQ46uiR9tCgSRIDZVB0vPqWp39u+fDn0dtp7xEcqeSMzarkTNa8m4WwEkPD+oI5j2
	 TraMflNSGp8aLmqhGIcn6T04p+P+eBsYh91FUo+k77AZq7fgd0nCeRRNmvN6UyWBAh
	 i8uLGtMpcaLew==
Date: Sun, 4 Jun 2023 22:00:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	William Breathitt Gray <william.gray@linaro.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329/T507 SoCs GPADC
Message-ID: <20230604-afternoon-frighten-42222010557b@spud>
References: <20230601223104.1243871-1-bigunclemax@gmail.com>
 <20230601223104.1243871-3-bigunclemax@gmail.com>
 <fbcc5688-387c-32fb-edac-17848c92b936@linaro.org>
 <CALHCpMizv52yj0rw0pR8pYjSys2UivS4L4GkWLgc-d91bdmDCA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALHCpMizv52yj0rw0pR8pYjSys2UivS4L4GkWLgc-d91bdmDCA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_140034_807976_A9FE7734 
X-CRM114-Status: GOOD (  24.09  )
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
Content-Type: multipart/mixed; boundary="===============0754248720062112408=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0754248720062112408==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R6NUQuCQejyhVbgd"
Content-Disposition: inline


--R6NUQuCQejyhVbgd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 04, 2023 at 11:20:43PM +0300, Maxim Kiselev wrote:
> =D0=BF=D1=82, 2 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 11:38, Kr=
zysztof Kozlowski
> <krzysztof.kozlowski@linaro.org>:
> > On 02/06/2023 00:30, Maksim Kiselev wrote:
> > > From: Maxim Kiselev <bigunclemax@gmail.com>
> > >
> > > Allwinner's D1/T113s/R329/T507 SoCs have a new general purpose ADC.
> > > This ADC is the same for all of this SoCs. The only difference is
> > > the number of available channels.
> >
> > Except that it wasn't tested...
>=20
> Yes, you are right. I tested it only on the T113s board. And I will be gl=
ad if
> someone tests it on another SoC.

I would imagine Krzysztof meant testing the binding w/ dt_binding_check
etc, rather than testing the ADC itself.

> > Please run scripts/checkpatch.pl and fix reported warnings. Some
> > warnings can be ignored, but the code here looks like it needs a fix.
> > Feel free to get in touch if the warning is not clear.
>=20
> I got a warning about required maintainer property. Should I do
> anything with this?

Yes, you should!

> If yes, then who should be a maintainer?

You, preferably.

> > Hm? So you do not allow anything from adc.yaml related? Are you sure
> > this is your intention?
>=20
> I'm not sure about it. I looked at other ADC bindings and didn't find
> another driver with 'additionalProperties: true'

Try `unevaluatedProperties: false` instead.

Cheers,
Conor.

--R6NUQuCQejyhVbgd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHz7ZAAKCRB4tDGHoIJi
0mhhAQDWUaQ6MsgMc3hJ9RhC8xIHkPkDg+t28YylGU9AHR/7TQEAoAIiWf+O7hZq
dlGXke5/fRuOymui5uFzsqI45K65SAE=
=8YSV
-----END PGP SIGNATURE-----

--R6NUQuCQejyhVbgd--


--===============0754248720062112408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0754248720062112408==--

