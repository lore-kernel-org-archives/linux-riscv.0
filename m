Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9355C38159
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 23:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVmN/NzfmC5ttV91ffvLQi5BQ3UR/FZPsaedqb6LL2c=; b=qkJXR3rExpDbI6fqZXdmKI0poB
	HPh6Mr8biRO1K4so91xjIk8Lcmqc8T6ntH9wZ21qQvJf4uf2kpwMMVBQ3PFnFHZ7djlkZQFZPG4bK
	7H8fqii7Fr6c5SwkJU377CXugJU8r0nSqVRli4FZA258/rO5BCiFtZvOQuw/EjBtUuSGwW5Bael5R
	giU8LgGkvqA05fps8yqu98vcvSz6CdF8M90+uPYbRHEprKxiTDnqwdJJQoDrTArTBBi8mGm2tY3+V
	WleuEQY3Ufjy/v2VXxEfdNxvJRYkWgOKYuDPY562jka72DZoFHEvfj/kgDwrjNHqXNDawa2RtnGrR
	aZAn/eSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pII5G-002yKd-O5; Wed, 18 Jan 2023 23:43:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pII5D-002yK6-PZ
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 23:43:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4585E61AB9;
	Wed, 18 Jan 2023 23:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403F0C433EF;
	Wed, 18 Jan 2023 23:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674085386;
	bh=Okd6MIEI+bnAJs2p19rWhJG6+ljN8iX62czvy5e5c4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FMWFJvg3ySJH0/xRmzFgX4ei12XCJ5lb0Yl/JzgdDT7Zm6buaZShV2CeaPY8LpDpY
	 8VOatkM9mAFJLZXAODl1O3ey0EzSTLWATSDKVJzes85RwWWLSnIompE0k5DP0Evk7n
	 rK9ErPDnQ+pEdhJBRWeDhGMyyMRWSXaGj9jNVT7wTRzWDaJZy/dIpaq+sm/5EuvpQf
	 y+wAYGHrI4ndrhR420aWYE1sXSPeU8zIlKWm6MkudIP9XTT4nXM/aG05Qv5sdOKkmm
	 czKMDGGowcBcNBvlsiErUA1e6EyVhYUclEFL8GRh/6HjroEMeuh7nCUPrbJO/CbZ6Y
	 S7HryQL2hYdcQ==
Date: Wed, 18 Jan 2023 23:43:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] riscv: dts: starfive: Add StarFive JH7110
 VisionFive 2 board device tree
Message-ID: <Y8iEBOjLthlNX/xy@spud>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-8-hal.feng@starfivetech.com>
 <Y72nbfJxYdO2AojI@spud>
MIME-Version: 1.0
In-Reply-To: <Y72nbfJxYdO2AojI@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_154307_944592_211980FC 
X-CRM114-Status: GOOD (  25.85  )
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
Content-Type: multipart/mixed; boundary="===============7654961562371701838=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7654961562371701838==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ck4pvxVOY1Kfvyhk"
Content-Disposition: inline


--Ck4pvxVOY1Kfvyhk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2023 at 05:59:09PM +0000, Conor Dooley wrote:
> On Tue, Dec 20, 2022 at 09:12:47AM +0800, Hal Feng wrote:
>=20
> > +	aliases {
> > +		serial0 =3D &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path =3D "serial0:115200n8";
> > +	};
>=20
> So I think this is wrong, and the stdout-path should be uart3 instead.
> Per the QSG [0], GPIO5/6 are the suggested UART Tx/Rx to use.
> This appears to map to uart3 rather than uart0.
> FWIW, uart3 is also the stdout-path for the v1, see:
> arch/riscv/boot/dts/starfive/jh7100-common.dtsi
>=20
> At least, that change is what I needed to do in order to use the
> JH7110_VisionFive2_upstream branch, AFAICT matches what you've got in
> this series.

I went and re-tried things again today, but with the clk & pinctrl series
=66rom the ML instead of that branch.
I'd gone and used that branch instead of the patches, as there were some
build issues with the pinctrl driver from the patches.
I fixed the build issues in the pinctrl driver and now uart0 works.

Looking at it again, it makes sense for uart0 to be serial0, given
there's pinconf stuff being done in this DT for pins 5 & 6 for uart0.

Perhaps by using that branch, I was using some older drivers etc given
it seems to mostly contain commits dating from November?
I'm still a bit confused about the whole thing, given I tried out a
whole load of branches to get something booting with ethernet support
that day!

Since this seems to work with the fixed pinctrl driver, I don't think
you need to change anything here.

Apologies for the noise!
Conor.


--Ck4pvxVOY1Kfvyhk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8iEBAAKCRB4tDGHoIJi
0ui9AQCEj0sA+NvX+A6mlsoSkQPrEOSs990I2Ni0LtP1f+xkRAEAw6Srrmpajmp3
i9HfNdFUU1MPc0SrwlyKgR5faz0F7AU=
=vX2v
-----END PGP SIGNATURE-----

--Ck4pvxVOY1Kfvyhk--


--===============7654961562371701838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7654961562371701838==--

