Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F226C02181
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 01:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzQ7+3P0BQ8SboRqqF0GPYxWLsvqZ50YZYjf3cm5oss=; b=AHDqrmhJk/Fox80V67tkzf7FZu
	fhJn3/powIpXnTBh++SexWGr3+W5nGkoUt8OO+HotnR5C6PVA0NS0KxLwPy5ZgEp37l1bmibM0iFK
	42Dez3V9/o7D1RRiQUuwgyszhNYYpq79sMYnLPG8Ok3IZQIM2P4IhND3yy7VJ6V4Gut/ETyBU3bdb
	kPHmUo+3h7kZ02DIHDJsmiAd7mvuzgMa/8BxID1XtvQW6Kp6XNTfQk9Lif5gMfkqBmd5mCUD/Hbvb
	8Sfnl513vyhyI2rRaLY3Uq3nhESuXWgzQzl2l5fDIW7y/t8ZyHNMKE42pUI4liMXBGY1uitERXJfz
	3FKC5Eew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta2ms-00000006f1t-3iZU;
	Tue, 21 Jan 2025 01:10:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta2mq-00000006f1X-0YD8
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 01:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0315F5C5DD7;
	Tue, 21 Jan 2025 01:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1997C4CEDD;
	Tue, 21 Jan 2025 01:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737421835;
	bh=nLrbJgIHwRGKe9+eWfWel7TK4Ps+ZtjQXfUs08yp3H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BM1hPsHJQkSjZuoIYoojvG2xI98I8sMoqxp9FFty+EFgZqBojw0e1JHpWrVby06z9
	 5icD/TMlu0QC73CxalkEDktgwRbLqhbn/e0acdjBIafIOYavxT5bC2cMX/zZzwFDkQ
	 NcimztfLNfRnaUJ2cP6S8iKQnZaz4hxK5dWMmwm0vykOFwhIWiKJMX6bwlJ2/EW1mo
	 WvSDLrNTDIBnZrRkUcF14ARsZsGX41BIxR0IfaMOYGbEusE8IGuz0UUjueCNStFBhR
	 a3F9v39YffwOgWCb0czVR8pjV144isVU0uAcFydXXf4pxCzrwNWoecswFdznrMniwb
	 kM35E4v+heIQw==
Date: Tue, 21 Jan 2025 01:10:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: add Siflower RISC-V SoC family Kconfig support
Message-ID: <20250121-panorama-scarring-6086eb97beaa@spud>
References: <20250120022359.125952-1-gch981213@gmail.com>
 <20250120-skyrocket-fiftieth-5fd770df030f@spud>
 <CAJsYDVJMSdYQ9mLhbt_-CwvfS75piT-cV+-Q5EBvh6CEeQPiJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJsYDVJMSdYQ9mLhbt_-CwvfS75piT-cV+-Q5EBvh6CEeQPiJw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_171036_213881_FA60CC1F 
X-CRM114-Status: GOOD (  16.89  )
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
Content-Type: multipart/mixed; boundary="===============5896952693951441231=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5896952693951441231==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mwOCWWF6ATKsTNpG"
Content-Disposition: inline


--mwOCWWF6ATKsTNpG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 09:04:47AM +0800, Chuanhong Guo wrote:
> Hello!
>=20
> On Tue, Jan 21, 2025 at 2:48=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Mon, Jan 20, 2025 at 10:23:58AM +0800, Chuanhong Guo wrote:
> > > Siflower RISC-V SoCs, including SF21A6826, SF21H8898 and some other
> > > upcomping chips, are RISC-V chips with T-Head C908 cores for home
> > > routers and gateways. Add a Kconfig entry named ARCH_SIFLOWER for
> > > them.
> > > Notably these chips uses ARM PL011 for UART. ARM_AMBA is selected
> > > for its driver.
> > >
> > > Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> >
> > This needs to be in a series with the user (your dts)
>=20
> Could the user be a driver Kconfig instead? When submitting a GPIO driver=
 I
> was suggested to not depend on architecture symbol and add soc-specific
> ones to arch/ first. [0]
>=20
> I still need to polish the clock/reset driver a bit before submitting the=
m.
> Without a clock driver I can't really submit a dts with meaningful conten=
t.
>=20
> [0] https://lore.kernel.org/linux-gpio/CACRpkdYi_+aQ5L-c4=3Dw9MK-6Uh0e9dX=
0nnU6LcZcHd90j97q7w@mail.gmail.com/T/#mf2352fb36ed2cb8c6574d9eb0d4c261d9346=
bf10

Send it with the GPIO driver then please.

--mwOCWWF6ATKsTNpG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ47z9QAKCRB4tDGHoIJi
0tR2APwIbdEKl+JyD2r2yT+oTxwxGlTcLXIApwnET9PgOizjZAD/eak1izeuwRAv
woNopkS7fqurhCW2qvJKzFPJDSm+VQI=
=67aU
-----END PGP SIGNATURE-----

--mwOCWWF6ATKsTNpG--


--===============5896952693951441231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5896952693951441231==--

