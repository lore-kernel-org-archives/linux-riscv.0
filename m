Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05185EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 23:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8hMdgPmSeg8q1if02mWIGcG46UvWy9OXV7wHeWQmOg=; b=SS3VsKw1umQZAJ1vbQwQ3OQ5kt
	/++snHYY059fc9Oi/QZIj07FlE5XVojYzgZAsfoDYY/yP4MILwe+Rd7YdoI1ns0nRbygzvRSoXDwC
	inE4aiwCQeUu8sfDTfd820QyGpucjCrcWGJ84PXihQsuHwuQ65dwEGXkbtW05wwOOqVflltOntgRs
	LF1ZxhtM/n85AdwkB7wuPYQA4A/n9WsJgqs1gLUtV+tvjtQPPpU3bW2yHrJHuVS8ti1AbfAQCDqDO
	EepE0A6tpI2K/adFvaZbyXUBt0nLh8zuBGVBPhLWl9tRK3rU7/WYbbnDP9O4/hA+yfWDQ9ghYVFAX
	wE/SoNwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFjcl-006lk1-0k;
	Sat, 01 Jul 2023 23:03:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFjci-006lid-1G
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jul 2023 23:03:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F163B603F3;
	Sat,  1 Jul 2023 23:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07DE2C433C7;
	Sat,  1 Jul 2023 23:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688252595;
	bh=mt6r8UFPAN4tDG96jEynlaqTUBoJG9qJ6uaWu2oLhFc=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=S5wa8azmV3YtUbJzzbB3djgUw3PV3KeEZWnV51I3p6rwFYDhTGd+Sn/Mt0b/iO/Lf
	 ogBXDkNy67736NmHzoZMI7r1ZO5bhoUHwMv+y2W5wKCP+PGClckuF+uD1WJZtXmq2u
	 QMpNpnhP/CUm/rkAng8f11FeC74FXx00cR6Sx1w2X8vLz1y6h9f6aBOnjhWQ1T/B0s
	 G7pymFjt4s0iWOEi5wZmll7Rn4KCeT8DS/MWhi5SwmI4uChlOueuebXW43bHpdLTvG
	 vCRhnnFY9o7UhwJXOv2e284x0MBy5OP6wDk7qDNCHjyGQizoCaLlla/tDDdzk4o+lO
	 qNo3Jg8rm6u2w==
Date: Sun, 2 Jul 2023 00:03:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 4/4] riscv: dts: starfive: add dma controller node
Message-ID: <20230702-scallop-unsafe-9a02b511c95d@spud>
References: <20230322094820.24738-1-walker.chen@starfivetech.com>
 <20230322094820.24738-5-walker.chen@starfivetech.com>
 <ZKCiOQ0IuptKO8kr@aurel32.net>
MIME-Version: 1.0
In-Reply-To: <ZKCiOQ0IuptKO8kr@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_160324_513780_F883419D 
X-CRM114-Status: GOOD (  18.48  )
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
Content-Type: multipart/mixed; boundary="===============4985908044007805170=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4985908044007805170==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="96nw6xgaB1M0jdl2"
Content-Disposition: inline


--96nw6xgaB1M0jdl2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 02, 2023 at 12:01:29AM +0200, Aurelien Jarno wrote:
> On 2023-03-22 17:48, Walker Chen wrote:
> > Add the dma controller node for the Starfive JH7110 SoC.
> >=20
> > Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> > ---
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >=20
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot=
/dts/starfive/jh7110.dtsi
> > index 17220576b21c..b503b6137743 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > @@ -510,6 +510,24 @@
> >  			#gpio-cells =3D <2>;
> >  		};
> > =20
> > +		dma: dma-controller@16050000 {
> > +			compatible =3D "starfive,jh7110-axi-dma";
> > +			reg =3D <0x0 0x16050000 0x0 0x10000>;
> > +			clocks =3D <&stgcrg JH7110_STGCLK_DMA1P_AXI>,
> > +				 <&stgcrg JH7110_STGCLK_DMA1P_AHB>;
> > +			clock-names =3D "core-clk", "cfgr-clk";
> > +			resets =3D <&stgcrg JH7110_STGRST_DMA1P_AXI>,
> > +				 <&stgcrg JH7110_STGRST_DMA1P_AHB>;
> > +			interrupts =3D <73>;
> > +			#dma-cells =3D <1>;
> > +			dma-channels =3D <4>;
> > +			snps,dma-masters =3D <1>;
> > +			snps,data-width =3D <3>;
> > +			snps,block-size =3D <65536 65536 65536 65536>;
> > +			snps,priority =3D <0 1 2 3>;
> > +			snps,axi-max-burst-len =3D <16>;
> > +		};
> > +
> >  		aoncrg: clock-controller@17000000 {
> >  			compatible =3D "starfive,jh7110-aoncrg";
> >  			reg =3D <0x0 0x17000000 0x0 0x10000>;
>=20
> It appears that this patch has never been applied, although the rest of
> the series has already been merged.

Correct. I can't apply it because the stgcrg it depends on is still
pending.

> Unfortunately it doesn't apply
> anymore due to other changes to that file.
>=20
> Could you please rebase and repost it?


--96nw6xgaB1M0jdl2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKCwrgAKCRB4tDGHoIJi
0sJFAQCnplDzaTop7ez/Pr9QBVITVUVlMtt0v7fU5DSZnt0IHwD/ZjpCO+cq0H7W
P/Oxe8VydOaHPtSZ+KQFMCHpMsAR5AE=
=RdNo
-----END PGP SIGNATURE-----

--96nw6xgaB1M0jdl2--


--===============4985908044007805170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4985908044007805170==--

