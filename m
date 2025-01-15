Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D01C02183
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 09:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqzb52v096BTWLvI3KpRpassg2PbIBeupX4I16XWF3g=; b=ZdTfN6PA1MGiYNcY3UuGfIk0r9
	rj6TfIEFNVB100MsTKCZshdXkkFgoq6cSduOkU0HvgGFrjZDMct3yPTas8eqVy3hp9rxlYJKe35L3
	eRZAaklBrRRMf8U8cAAjbPV5FjsWYxp9jsrdz9SLA66jcKlyq9dTA82uotaxPgU1x5A18FWUObNtK
	J+TYQBT3GpUWRqtNjlD51SsRvmEORPu7OQ3Qs7Fn7fk8nBuLAiN3R/JR/t5XPS/luYJbAC6WVNb21
	N78hbiXKm/JsVLJxwwSEfJ0y5fVllSmzJF9xnSLkp+vXv/5JdkXLsJ4epMY09wuzg14lwiGrM10xe
	/KcFQapQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzuR-0000000BNfe-271F;
	Wed, 15 Jan 2025 09:41:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzoF-0000000BMMf-1CF2
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 09:35:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ECD4C5C5B4E;
	Wed, 15 Jan 2025 09:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2B3C4CEDF;
	Wed, 15 Jan 2025 09:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736933734;
	bh=p+hqniwq/VG9dhOh6Hnhr7/N5Yo4JFKM4KBxZNiPOn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qRvxXnwGSIpQXwIDT7QucTsJ76w30NW8G0Oc2INCOreyRafL45Q1Bnkt+ZjQRc1Q7
	 rtNO3RX+QlHH0BYPWStorAMVLu8ehU9j4ApR4WRSjvb3hNxzM3ZLFvE0yb7Dq8XSTu
	 kz3NBv4jVdlwN1IDLbdh4xnsQKfDA2paX5dJsWbZKTsjvOIaisPU8zzRaZ1aLdFmJb
	 2bkXXmerrlPDPLCXzA/Avdnkab38LIjev2u6Ub0sm260nsXMOUYtrR+ct9/Bowrmsl
	 U5F+FVxu/TbaabYZ82YrcRO5oHcSBm0bDhDhL9IwbRVQqhryvH/qebYRLt06DYE4bP
	 LXnKlPEqaTWAg==
Date: Wed, 15 Jan 2025 09:35:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Minda Chen <minda.chen@starfivetech.com>
Subject: Re: [PATCH v1 1/5] riscv: dts: starfive: jh7110-common: replace
 syscrg clock assignments
Message-ID: <20250115-bunkmate-reluctant-a9bad52d8a04@spud>
References: <20250102194530.418127-1-e@freeshell.de>
 <20250102194530.418127-2-e@freeshell.de>
 <20250104-mutilated-unpaved-008eebdb200a@spud>
 <56c372c3-bb8b-4150-9b34-a6cca906d740@freeshell.de>
 <20250106-suggest-waltz-47d7f7760069@spud>
 <ZQ2PR01MB1307A9E106AE06E144875D6EE619A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ2PR01MB1307A9E106AE06E144875D6EE619A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_013535_409987_2815F117 
X-CRM114-Status: GOOD (  40.37  )
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
Content-Type: multipart/mixed; boundary="===============4478213651664357167=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4478213651664357167==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aIHZ/aPXKB+pnUdS"
Content-Disposition: inline


--aIHZ/aPXKB+pnUdS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 06:33:08AM +0000, Hal Feng wrote:
> > On 07.01.25 04:08, Conor Dooley wrote:=20
> > On Sat, Jan 04, 2025 at 01:04:30PM -0800, E Shattow wrote:
> > > Hi, Conor  (added CC: Minda Chen, Hal Feng)
> > >
> > > On 1/4/25 10:33, Conor Dooley wrote:
> > > > On Thu, Jan 02, 2025 at 11:45:07AM -0800, E Shattow wrote:
> > > > > Replace syscrg assignments of clocks, clock parents, and rates,
> > > > > for compatibility with downstream boot loader SPL secondary
> > > > > program loader.
> > > > >
> > > > > Signed-off-by: E Shattow <e@freeshell.de>
> > > > > ---
> > > > >   arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 12 +++++++++-=
--
> > > > >   1 file changed, 9 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > > > > b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > > > > index 48fb5091b817..55c6743100a7 100644
> > > > > --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > > > > +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > > > > @@ -359,9 +359,15 @@ spi_dev0: spi@0 {
> > > > >   };
> > > > >   &syscrg {
> > > > > -	assigned-clocks =3D <&syscrg JH7110_SYSCLK_CPU_CORE>,
> > > > > -			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> > > > > -	assigned-clock-rates =3D <500000000>, <1500000000>;
> > > > > +	assigned-clocks =3D <&syscrg JH7110_SYSCLK_CPU_ROOT>,
> > > > > +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
> > > > > +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
> > > > > +			  <&syscrg JH7110_SYSCLK_QSPI_REF>;
> > > > > +	assigned-clock-parents =3D <&pllclk JH7110_PLLCLK_PLL0_OUT>,
> > > > > +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> > > > > +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> > > > > +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
> > > > > +	assigned-clock-rates =3D <0>, <0>, <0>, <0>;
> > > >
> > > > Why is assigned rates here 0s, rather than the property just remove=
d?
> > > >
> > > > >   };
> > > > >   &sysgpio {
> > > > > --
> > > > > 2.45.2
> > > > >
> > >
> > > Assigned rates all zeroes is how it is in U-Boot. Removing the
> > > assigned-clock-rates property as suggested does work in U-Boot and
> > > Linux both.
> > >
> > > For context, U-Boot fails when replacing assigned-clocks to
> > > JH7110_SYSCLK_CPU_CORE (500MHz) and JH7110_PLLCLK_PLL0_OUT
> > (1500MHz)
> > > from Linux. So I tried to merge all properties together and in testing
> > > then U-Boot failed (or I did it wrong). However replacing the Linux
> > > properties with the U-Boot configuration (above) on Linux does work f=
or
> > both.
> > >
> > > I do not know if this is correct but I can test any suggestions and
> > > report if they are working.
> > >
> > > Do these changes make sense? Are there other variations I should test?
> >=20
> > I'd like the commit message to at least explain why these clocks need t=
o be
> > set to zero (I assume that means disabled?). Maybe the StarFive folks k=
now
> > why it is required?
>=20
> Here "assigned-clock-rates =3D <0>, ..." means skipping setting clock rat=
es.
> You can refer to
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/cl=
ock/clock.yaml/

If you check the wording there, it says:
  To skip setting parent or rate of a clock its corresponding entry should =
be
  set to 0, or can be omitted if it is not followed by any non-zero entry.
Since all clocks are being set to 0 above, we should be in the "can be
omitted" case for the entire property, no? That would...

> Linux here setting JH7110_SYSCLK_CPU_CORE to 500MHz and JH7110_PLLCLK_PLL=
0_OUT
> to 1500MHz are for increasing the CPU frequency to 1500MHz.
>=20
> VF2 u-boot is still running at 1000MHz now. You failed to set JH7110_PLLC=
LK_PLL0_OUT
> to 1500MHz, because CPU power supply voltage needs to be increased before=
 running at
> 1500MHz.
>=20
> I think a better choice now is changing Linux device tree as follows:
>=20
> &syscrg {
> 	assigned-clocks =3D <&syscrg JH7110_SYSCLK_CPU_ROOT>,
> 			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
> 			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
> 			  <&syscrg JH7110_SYSCLK_QSPI_REF>,
> 			  <&syscrg JH7110_SYSCLK_CPU_CORE>,
> 			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> 	assigned-clock-parents =3D <&pllclk JH7110_PLLCLK_PLL0_OUT>,
> 				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> 				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> 				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
> 	assigned-clock-rates =3D <0>, <0>, <0>, <0>, <500000000>, <1500000000>;
> };

=2E..make this one a reasonable change...

> For u-boot, if there is no requirement to run u-boot at 1500MHz, just keep
> &syscrg {
> 	assigned-clock-rates =3D <0>, <0>, <0>, <0>;
> };

=2E..but not this one.

> in u-boot device tree. If we need running 1500MHz in u-boot, I will send =
a patch
> to implement it and then &syscrg{...} in u-boot device tree can be droppe=
d.
>=20
> Best regards,
> Hal

--aIHZ/aPXKB+pnUdS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4eBYQAKCRB4tDGHoIJi
0vdWAP9O6R65THOidydMf9y6+5AUKdKrXbUDa7LoIf2/uuhMCQEAqdUmvrNeAAX6
6jVcoKymWpEdVb6NkXhE7Stf9bs3HQU=
=1dvY
-----END PGP SIGNATURE-----

--aIHZ/aPXKB+pnUdS--


--===============4478213651664357167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4478213651664357167==--

