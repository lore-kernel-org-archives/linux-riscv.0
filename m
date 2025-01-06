Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6FDE77188
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 20:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcH4NLDFx/RaPNgutatnFZl+sA0Seh59Cp4NUlQB87k=; b=VGGxk4lLMV1oYA96JFR/VLWlWj
	AznwBJ2NQ2YcYcifonxSwSMoXDkjyUjBSuqLDZgO3SwvvfitRPLndkPSN84DuUXpG/V44Jb3FzfED
	zB1/VGeKPluHFSzmpduPELvbOWeRqqClKmjPUggo3VSo0/J4oPD1p7JBjugYP0SDqZeTbVPDEFv1o
	aShgIBHzHcpha251uLfGz9UmEFp1oQgmx29nGfUI1gyupyVas3gwrBVEEUyrHVU2d2cbqvCj5chsC
	8uaCuSdNSHHivBXBcs0Bt4Oaqoi1FKiLY6pAU0KUXVKeMr0Uz1OFwxxSkhb0/2Pry/FYY6bCLmCV1
	Md2scUSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUtOd-00000002Y1a-2xha;
	Mon, 06 Jan 2025 20:08:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUtOb-00000002Y0m-1aPk
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 20:08:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 39F83A41DE8;
	Mon,  6 Jan 2025 20:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0D3C4CED6;
	Mon,  6 Jan 2025 20:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736194095;
	bh=NRvcTToc1p4yengV/ghwPWZPCAkf/SQCKLQ2gGwbYKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qZAmycN72/Iq0R0hlYUh1WnNiRyMtPLZYkTdeYf0YJ5vAknT/fQ6apnZLHyeodlu/
	 MLv2X15tTYa0Ow94CWJfPHuuVfUs+AnoLkY4JhGoPaj0/ybU+jgnR3Qkg7Ehxcz1TN
	 rycAFm40zOxettK79oCNZzY9PUa9HONV6acEHkLeO2ewffFHMjlRMfzEfP5O0IvOVF
	 8gMY9b3TIaib7mcNkiXb8wWnVBq9dpeiOFGP/GeXMy/QkwPbrfyCf5PJbgqPXL5dxe
	 Khd14AAZrK0mHG3qVgQ2qXVnzkOhW3dlPzOtEY4RPBUc+If0B0UJ85VkvisqVxdg7S
	 QroQR67nQ7udA==
Date: Mon, 6 Jan 2025 20:08:11 +0000
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Minda Chen <minda.chen@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v1 1/5] riscv: dts: starfive: jh7110-common: replace
 syscrg clock assignments
Message-ID: <20250106-suggest-waltz-47d7f7760069@spud>
References: <20250102194530.418127-1-e@freeshell.de>
 <20250102194530.418127-2-e@freeshell.de>
 <20250104-mutilated-unpaved-008eebdb200a@spud>
 <56c372c3-bb8b-4150-9b34-a6cca906d740@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <56c372c3-bb8b-4150-9b34-a6cca906d740@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_120817_547722_BC11AB6E 
X-CRM114-Status: GOOD (  24.57  )
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
Content-Type: multipart/mixed; boundary="===============9116153573132509741=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9116153573132509741==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/Nn58aHnpboDlL35"
Content-Disposition: inline


--/Nn58aHnpboDlL35
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 04, 2025 at 01:04:30PM -0800, E Shattow wrote:
> Hi, Conor  (added CC: Minda Chen, Hal Feng)
>=20
> On 1/4/25 10:33, Conor Dooley wrote:
> > On Thu, Jan 02, 2025 at 11:45:07AM -0800, E Shattow wrote:
> > > Replace syscrg assignments of clocks, clock parents, and rates, for
> > > compatibility with downstream boot loader SPL secondary program
> > > loader.
> > >=20
> > > Signed-off-by: E Shattow <e@freeshell.de>
> > > ---
> > >   arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 12 +++++++++---
> > >   1 file changed, 9 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/r=
iscv/boot/dts/starfive/jh7110-common.dtsi
> > > index 48fb5091b817..55c6743100a7 100644
> > > --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > > +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > > @@ -359,9 +359,15 @@ spi_dev0: spi@0 {
> > >   };
> > >   &syscrg {
> > > -	assigned-clocks =3D <&syscrg JH7110_SYSCLK_CPU_CORE>,
> > > -			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> > > -	assigned-clock-rates =3D <500000000>, <1500000000>;
> > > +	assigned-clocks =3D <&syscrg JH7110_SYSCLK_CPU_ROOT>,
> > > +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
> > > +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
> > > +			  <&syscrg JH7110_SYSCLK_QSPI_REF>;
> > > +	assigned-clock-parents =3D <&pllclk JH7110_PLLCLK_PLL0_OUT>,
> > > +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> > > +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> > > +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
> > > +	assigned-clock-rates =3D <0>, <0>, <0>, <0>;
> >=20
> > Why is assigned rates here 0s, rather than the property just removed?
> >=20
> > >   };
> > >   &sysgpio {
> > > --=20
> > > 2.45.2
> > >=20
>=20
> Assigned rates all zeroes is how it is in U-Boot. Removing the
> assigned-clock-rates property as suggested does work in U-Boot and Linux
> both.
>=20
> For context, U-Boot fails when replacing assigned-clocks to
> JH7110_SYSCLK_CPU_CORE (500MHz) and JH7110_PLLCLK_PLL0_OUT (1500MHz) from
> Linux. So I tried to merge all properties together and in testing then
> U-Boot failed (or I did it wrong). However replacing the Linux properties
> with the U-Boot configuration (above) on Linux does work for both.
>=20
> I do not know if this is correct but I can test any suggestions and report
> if they are working.
>=20
> Do these changes make sense? Are there other variations I should test?

I'd like the commit message to at least explain why these clocks need to
be set to zero (I assume that means disabled?). Maybe the StarFive folks
know why it is required?

--/Nn58aHnpboDlL35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ3w4KgAKCRB4tDGHoIJi
0q6ZAQCjyh1rshl3u2uUsHiXi6RIJflNxe8iLN0VR1ebRmfi7gEAnxi30CSpTzYt
T3mTDWwJQaewB8Jn+NOtieX6BCBa8gg=
=x1MF
-----END PGP SIGNATURE-----

--/Nn58aHnpboDlL35--


--===============9116153573132509741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9116153573132509741==--

