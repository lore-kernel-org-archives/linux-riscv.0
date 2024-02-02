Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172B7C48291
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 16:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpGV1vHm7QpN68V15euEV4IEk8D1ReYbwGKCMzDBMS0=; b=C+c4ax8Xt7Om2KyN4XIgUk1OKy
	nqDy6gRs1hLQoZOghBeuCahClcEbPx+FabmTfwXF8Mmh6lRnmw6R4yM6FhHYtYRDHRx6WZEjjae9l
	LZaXcdCcox+BNHHTHd6lHjUfvs7kHNgzk3tC0M+bEjlpdnw6DdV8XM7znxG8PoXqzMzQNDKzjVL8P
	RsXwpM1NwMBMb1m0Xd5z0VWrmmjGivJSulbczqKcERBroMmqHPskJddzhvzMYsGT0ppuU0rGety1t
	N28bljrHIRY8NK+AVew2HKrguY3jKWY9n/6oM/dda3Kr3jDaS69lsREJGVMaQbHa8oxODZwcqIgu8
	3pw041aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwhJ-0000000CPBJ-3kXJ;
	Fri, 02 Feb 2024 16:47:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwhH-0000000CPA5-1bKp
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 16:47:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E259862697;
	Fri,  2 Feb 2024 16:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221D2C433C7;
	Fri,  2 Feb 2024 16:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706892442;
	bh=qVGQPqaAKKe4rQPmvSxnfJxycvP91+EBvnjm6km00sU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qNCqFUzTNiblKPnDQEd8pje0NXH4Zy3nqDPZrHBJIwDuSZulOTSYJkzEPpxXJpnY8
	 Fgqdae3dL6Vcw/z+hwVavA4mh7DTV7iDwNFjErVaF1pN5BFxrVOC5bvF9VCrcHulQO
	 mGICncO3/J/ZBtMCbf7tX9MuYMP3folEPxo3ga2eyR2wmKnUWd3xmxZ3Kq5H5ydOaO
	 1X35NC29UpyzTygfL5wyXagjVz73WuiNWiYduyyCwvHEW6tb2CLuOAb5Chrc8ccBCA
	 Sw+BrWqr4Jwm1F1zRshfaSk5DhZwfl9Yt1Iqx+ylGW6cxMPwFlqONy6GjGFXPaFaRO
	 tl1d0paIiPePw==
Date: Fri, 2 Feb 2024 16:47:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFt2Mg==?= =?utf-8?Q?=5D?= riscv:
 dts: starfive: jh7110: Add camera subsystem nodes
Message-ID: <20240202-spoiler-deceit-0e9ac720fd2c@spud>
References: <20240130082509.217683-1-changhuang.liang@starfivetech.com>
 <20240131-recycling-entering-b742e0e835eb@spud>
 <SH0PR01MB06675EF7ACD1452C4DEBE45FF243A@SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn>
 <20240201-handiwork-excretion-36aa2eea0709@spud>
 <SHXPR01MB0671975B6B2455E43A5C7D86F242A@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <SHXPR01MB0671975B6B2455E43A5C7D86F242A@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_084723_523170_9E5EEAE4 
X-CRM114-Status: GOOD (  18.17  )
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
Content-Type: multipart/mixed; boundary="===============0287409290609319944=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0287409290609319944==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BCDHEep2tdoQkpJp"
Content-Disposition: inline


--BCDHEep2tdoQkpJp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 02, 2024 at 02:29:16AM +0000, Changhuang Liang wrote:
>=20
> Hi, Conor,
>=20
> [...]
> > > > > +	imx219_clk: imx219-clock {
> > > > > +		compatible =3D "fixed-clock";
> > > > > +		clock-output-names =3D "imx219_clk";
> > > > > +		clock-frequency =3D <24000000>;
> > > > > +		#clock-cells =3D <0>;
> > > > > +	};
> > > >
> > > > Why do you need an output name here?
> > >
> > > The output name can be unnecessary.
> > >
> > > > Also, where does this clock come from? Is it an oscillator on the b=
oard?
> > > >
> > >
> > > This clock come from imx219, not the VisionFive 2 board.
> >=20
> > If the camera is not on the visionfive 2 board, why are you adding this=
 to
> > visionfive-2.dtsi?
>=20
> It seems that I need to use dtso. Right?

Yes. FWIW, the same comments as applied for the sound card Walker tried
to add applies here too, unless this ships with the boards:
| I'm not against allowing in-tree overlays for hats/capes/daughter-boards
| that come bundled with a board, but accepting ones for a hat that
| someone decided to use theoretically has no limit! The "someone" in this
| case might be a StarFive developer, but it could be any random one of
| your customers next!
https://lore.kernel.org/linux-riscv/20230510-riveter-ridden-3f056251e623@sp=
ud/

I figure this is a similar case as that?

--BCDHEep2tdoQkpJp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZb0clQAKCRB4tDGHoIJi
0s6AAP9L5qiPX0VFQUsozcIGbJ6jTWsVE9WjcORf+MEOv8bBLwD/eAwDIKs2E/3d
hREM5pnSpQkMLMCQ+cIoxbBnsRfWGgY=
=bMIQ
-----END PGP SIGNATURE-----

--BCDHEep2tdoQkpJp--


--===============0287409290609319944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0287409290609319944==--

