Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1185BEB64DC
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 23:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KY2oCea6ST6AwdQB4xezo/Z3x6ZOycYLsKnFpKGEdU=; b=vjEnOUvFAbUN6gura8nWEVWCBY
	I4SNzNPILujrsERPMymT7oT/19iHfPZHhn2594ct0pG9iQOiTtk+MMzykVhhnFRPgqOa0AVT/InoJ
	xSEpVlx7CDwR53noMJ96k5v+zR7l2BKEOU/fa43p9ZA8O+GjDHuZFnAMSEl02IYIESPSg3/pGvSzT
	hkqHPzs1Md6QuHQYJv31B6tFLsWMFaXgtTTWOc2kq31OK40J6m1DRNZ12SfxGaYOAj5wFeTlrIyf1
	l9d90KKIIRfR85+tcmvAhEdumdxGjHVDb2IWH/SdqpSAnMzYX17ZccT6vomv/GAbrqi1EuuGDZ/8q
	7NIGOMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFjf1-006m1W-1R;
	Sat, 01 Jul 2023 23:05:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFjey-006m0k-0U
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jul 2023 23:05:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C5ADA60A0C;
	Sat,  1 Jul 2023 23:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2E7C433C7;
	Sat,  1 Jul 2023 23:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688252742;
	bh=CtjmbMV6hgSJLwjZdBZjw6qZiEGab/wtFzurXmkUtsw=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=cxwWM7J5w6vVG7bnFAhc1D+5ZPOy3GciLuv39i8XnQeYgxxZfDApxabmegBcnNK6O
	 vXHtFK7Jx6qqd2F5KA9Lt2TCosxuB4kvfrzaNsXpmuS55EZsJyi/dDcq7atfrMtfSk
	 R+ccQSiMwJBdHVOHHYtZtMgkvmYf6bKypyehNR1el9uIhd8CYzZPgsGsP/VaseALTH
	 wraRgIyo9hoN5z7oNWnOBeFjTjQrCGuH4VJXRceR1qykGCGLLVZ/uYtuynHKBwyMyo
	 RwS83XFaDhwl0/hXddrTEP+sIjCJKzSB/XQ8ImetN6bGWp9KSXZS6vgsLuYSmuoL0q
	 yxy5EwsSjmGsg==
Date: Sun, 2 Jul 2023 00:05:37 +0100
From: Conor Dooley <conor@kernel.org>
To: jiajie.ho@starfivetech.com, Palmer Dabbelt <palmer@rivosinc.com>,
	olivia@selenic.com, herbert@gondor.apana.org.au, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, kernel@esmil.dk,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 3/3] riscv: dts: starfive: Add TRNG node for
 VisionFive 2
Message-ID: <20230702-ajar-stingy-3eb04f334575@spud>
References: <20230117015445.32500-4-jiajie.ho@starfivetech.com>
 <mhng-348475f1-5880-4951-9692-78210a17acd3@palmer-ri-x1c9a>
 <ZKCgXvcbWBGWZnsU@aurel32.net>
MIME-Version: 1.0
In-Reply-To: <ZKCgXvcbWBGWZnsU@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_160544_274640_305DCB64 
X-CRM114-Status: GOOD (  17.55  )
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
Content-Type: multipart/mixed; boundary="===============7031357562161482997=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7031357562161482997==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ej1htFhOe1EwGlXT"
Content-Disposition: inline


--ej1htFhOe1EwGlXT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 01, 2023 at 11:53:34PM +0200, Aurelien Jarno wrote:
> On 2023-03-14 18:45, Palmer Dabbelt wrote:
> > On Mon, 16 Jan 2023 17:54:45 PST (-0800), jiajie.ho@starfivetech.com wr=
ote:
> > > Adding StarFive TRNG controller node to VisionFive 2 SoC.
> > >=20
> > > Co-developed-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> > > Signed-off-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> > > Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> > > ---
> > >  arch/riscv/boot/dts/starfive/jh7110.dtsi | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >=20
> > > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/bo=
ot/dts/starfive/jh7110.dtsi
> > > index 4ac159d79d66..3c29e0bc6246 100644
> > > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > @@ -455,5 +455,15 @@ uart5: serial@12020000 {
> > >  			reg-shift =3D <2>;
> > >  			status =3D "disabled";
> > >  		};
> > > +
> > > +		rng: rng@1600c000 {
> > > +			compatible =3D "starfive,jh7110-trng";
> > > +			reg =3D <0x0 0x1600C000 0x0 0x4000>;
> > > +			clocks =3D <&stgcrg JH7110_STGCLK_SEC_HCLK>,
> > > +				 <&stgcrg JH7110_STGCLK_SEC_MISCAHB>;
> > > +			clock-names =3D "hclk", "ahb";
> > > +			resets =3D <&stgcrg JH7110_STGRST_SEC_TOP_HRESETN>;
> > > +			interrupts =3D <30>;
> > > +		};
> > >  	};
> > >  };
> >=20
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> It appears that this patch has never been applied, although the rest of
> the series has already been merged.

Ditto here, depends on the stgcrg, so it can't be applied yet.

> Unfortunately it doesn't apply
> anymore due to other changes to that file.
>=20
> Could you please rebase and resend it?

No harm in a resend of course, given it doesn't apply.

Cheers,
Conor.

--ej1htFhOe1EwGlXT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKCxQQAKCRB4tDGHoIJi
0lmZAP0SNjqkT8s0n5wtApbSeSzlCFqL+QWYwc90EmHZ2nvUAAD6AyyO6yS2S+0w
9vMPZEB+a1Y4AmHnkfKGkzunks9MQw8=
=Mc7t
-----END PGP SIGNATURE-----

--ej1htFhOe1EwGlXT--


--===============7031357562161482997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7031357562161482997==--

