Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45693C10F16
	for <linux-riscv@archiver.kernel.org>; Mon,  6 May 2024 12:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OP5HkWf2UK8hDKopjlsYaCfNteXNAMzR3nR8yVNTzdE=; b=Wg5YhDeZUy5SRXO0wVWh1MHZXB
	ARiXmt26941BXPMG/q1y3GC75Q8l5v6m/YN5lzY50yYS8DbGhxHwG0A2fptJrjmtiTYoqYTWWTL+K
	BqxZwnn7t4f9l6CqWI9Gj2sioWuDQ9dai+A+4Swyoy2T+G3FDxAOca+P/Frf/Nd9oLGnRbO62/K4z
	tLF6o7J29bd1BwDznN/oUOvByKeDX68V7abJhQhP5KFS8Rln93FDqN1ohOLytCaX+VIv6ZvDCKvFl
	MKKL5U4n6vgY1IuGA4a4ugisi6mT7+2gDQZ/RsMs7Taqmb4wgAnQpbzTI5R/ryfUm1hYjiJ+TiJwW
	EhRUcj1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3x9c-00000007CsJ-2h5M;
	Mon, 06 May 2024 12:09:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3x9Z-00000007Crm-2rBA
	for linux-riscv@lists.infradead.org;
	Mon, 06 May 2024 12:09:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A4246120A;
	Mon,  6 May 2024 12:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A02EC116B1;
	Mon,  6 May 2024 12:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714997347;
	bh=0Fnm+sI6wbj1mgKUxkxRr4HUT2qUNad/sLEyTt+hwpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E9+6v+Kti8MbD+yblxVWhraoQ6x5kHRP8p86QwLv1lLt86iYx1stJvwygiZKJSBRZ
	 XZdCbVfvReLKs9UbAyFPS4EXPB64sNmcrOZ7ZzRdvVSZu0LEcenVRHUARoIpjoLRjz
	 JdimM5YCje+w6lADPp5ePTCHt55ueJZ7iuaI915I5aMPTBWsf4mGO7QUMAPR2GfWwL
	 b7NP4Yo6GDXn3BAG1rIgnDWF8O0Dq0jaakVIaI3ub7NXj7BRZZMxFRcHl9s1OsGBQ3
	 tQgQ0xjOxCTZ4SNszihFdCm1RU58mcGYRyuHMM0k809VbLO4HIN5M8jsrJwcYDYeCQ
	 x1hOM/zckr6cg==
Date: Mon, 6 May 2024 13:09:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Leyfoon Tan <leyfoon.tan@starfivetech.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Yuklin Soo <yuklin.soo@starfivetech.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <drew@beagleboard.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [RFC PATCH v3 0/7] Add Pinctrl driver for Starfive JH8100 SoC
Message-ID: <20240506-buddhism-outtakes-5a2bbcc73f1a@spud>
References: <20240503111436.113089-1-yuklin.soo@starfivetech.com>
 <CACRpkdbxzbNedWTpA5i-45AqPc4fA+GeBGkrjrD_OgkxMZRwXw@mail.gmail.com>
 <ZQZPR01MB0979DEF368CB86BB16B538E78A1CA@ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQZPR01MB0979DEF368CB86BB16B538E78A1CA@ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_050909_835030_599D7074 
X-CRM114-Status: GOOD (  23.26  )
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
Content-Type: multipart/mixed; boundary="===============3448195874866501900=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3448195874866501900==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fhe1DvgnzcGojSpS"
Content-Disposition: inline


--fhe1DvgnzcGojSpS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2024 at 07:31:19AM +0000, Leyfoon Tan wrote:
>=20
>=20
> > -----Original Message-----
> > From: Linus Walleij <linus.walleij@linaro.org>
> > Sent: Monday, May 6, 2024 2:35 PM
> > To: Yuklin Soo <yuklin.soo@starfivetech.com>
> > Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>; Hal Feng
> > <hal.feng@starfivetech.com>; Leyfoon Tan <leyfoon.tan@starfivetech.com>;
> > Jianlong Huang <jianlong.huang@starfivetech.com>; Emil Renner Berthing
> > <kernel@esmil.dk>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
> > Drew Fustini <drew@beagleboard.org>; linux-gpio@vger.kernel.org; linux-
> > kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-
> > riscv@lists.infradead.org; Paul Walmsley <paul.walmsley@sifive.com>; Pa=
lmer
> > Dabbelt <palmer@dabbelt.com>; Albert Ou <aou@eecs.berkeley.edu>
> > Subject: Re: [RFC PATCH v3 0/7] Add Pinctrl driver for Starfive JH8100 =
SoC
> >=20
> > On Fri, May 3, 2024 at 1:14=E2=80=AFPM Alex Soo <yuklin.soo@starfivetec=
h.com>
> > wrote:
> >=20
> > > Starfive JH8100 SoC consists of 4 pinctrl domains - sys_east,
> > > sys_west, sys_gmac, and aon. This patch series adds pinctrl drivers
> > > for these 4 pinctrl domains and this patch series is depending on the
> > > JH8100 base patch series in [1] and [2].
> > > The relevant dt-binding documentation for each pinctrl domain has been
> > > updated accordingly.
> > >
> > > [1]
> > > https://lore.kernel.org/lkml/20231201121410.95298-1-jeeheng.sia@starfi
> > > vetech.com/ [2]
> > > https://lore.kernel.org/lkml/20231206115000.295825-1-
> > jeeheng.sia@starf
> > > ivetech.com/
> >=20
> > v3 is starting to look very nice, why is this patch set still in "RFC"?
> >=20
> > I would like some proper review from the StarFive maintainers at this p=
oint so
> > we can get it finished.
> >=20
> > Yours,
> > Linus Walleij
>=20
> Hi Linus
>=20
> Thanks for reviewing the patches.
>=20
> There is a discussion in another thread about the JH8100 SoC being valida=
ted on FPGA/Emulation only now.  The suggestion is to send the patches as "=
RFC" before the real silicon availability.
>=20
> https://patchew.org/linux/20231201121410.95298-1-jeeheng.sia@starfivetech=
=2Ecom/20231201121410.95298-3-jeeheng.sia@starfivetech.com/

I know I said "drivers" in that mail you link to, but I was mostly
concerned about binding headers etc, of which I think there are actually
none here, so see my reply to this thread a few days ago:
https://lore.kernel.org/all/20240503-undress-mantra-e5e46b2f6360@spud/

--fhe1DvgnzcGojSpS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjjIXgAKCRB4tDGHoIJi
0siTAPwPnSCk10VkOwstQsjPqJmO7jS0QCzQE8MSxiuXnngLHwD/btPWiaBObZuw
ous37JV45r0PEtTo5WYRu5cNHmTICAI=
=uM22
-----END PGP SIGNATURE-----

--fhe1DvgnzcGojSpS--


--===============3448195874866501900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3448195874866501900==--

