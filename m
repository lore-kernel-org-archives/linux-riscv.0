Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D37C48286
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 18:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0KNdT2CCX3CMhNy8uIeb8bxjhvkrEhzDBFh8PVyoc4=; b=x8RtZCj3TcRCOWB5XL3JkIJejk
	sGD9+glMP4k5hgxxQrDh8svt7UiFcxNEai8+iGZ2amHiUiJtvSvPYui+AU8Em1bTJF2A+bL8sfNan
	BLNv8osAq1gaD+8OErFiJnI1Tve55C0jBYq30rMPlysEYTBUux2pzgI9yy2AuUNShngJ0Cx6ibbYb
	8jZ/m8/fIi2M49omkUnbF6EK6KqK/emWQlcqPz9c4jyS1rq+e5F4IXSI4V8WS0qrlTyLvAZKqzSJF
	4X00LoYSuGbCoFz8vQNlPJqhK2zjO9kyHi/STEZfKb61e7O9J9H/SHRnJzB2Pj4cIY/4F0lOWYFdz
	N3e7NCRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbwo-0000000930M-0qN5;
	Thu, 01 Feb 2024 18:38:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbwl-000000092z8-2cHY
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 18:38:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C302620A8;
	Thu,  1 Feb 2024 18:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE0DC433F1;
	Thu,  1 Feb 2024 18:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706812677;
	bh=0JVpzxvxHW0CTZLMhUSI5/1YEsJwW5sGalQevgBRPig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RqKSHXuvgjL0C8Scyh/DKYXAe4w5/voFVCi4sLwxrmUFM5F3on17NUnZV9s8sw6Gi
	 feC+RN7VeJpPn/2WZ23ZHgGsF5+zX1MivRCZ05qAk1JesfpQc3QYkPbqjAv51qG1qG
	 ISNyF6TRUbzIkdJrGqtWyBm4Bthu8S+wcVrMn5covTI1GmZZigKzLimm+lYO33bypA
	 6AL9redV6TPUGkUHLiUrm/pWbjYnnwKhKfcH2WyMNtX8W22AnPlu924unKphfawY62
	 LIvQ0tOJQBmWeTdkW7Cxn95xr6+9YgEe+bWeJWl2KRjOOYn6Br4CmHRPBxOxWbnlc6
	 CKL6LUYcHZkZQ==
Date: Thu, 1 Feb 2024 18:37:52 +0000
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
Subject: Re: =?utf-8?B?5Zue5aSNOiBbdjI=?= =?utf-8?Q?=5D?= riscv: dts:
 starfive: jh7110: Add camera subsystem nodes
Message-ID: <20240201-handiwork-excretion-36aa2eea0709@spud>
References: <20240130082509.217683-1-changhuang.liang@starfivetech.com>
 <20240131-recycling-entering-b742e0e835eb@spud>
 <SH0PR01MB06675EF7ACD1452C4DEBE45FF243A@SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <SH0PR01MB06675EF7ACD1452C4DEBE45FF243A@SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_103759_784328_8458355D 
X-CRM114-Status: GOOD (  18.66  )
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
Content-Type: multipart/mixed; boundary="===============5675166510956946643=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5675166510956946643==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aKOGQMxv8o8LMxKI"
Content-Disposition: inline


--aKOGQMxv8o8LMxKI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 01:42:13AM +0000, Changhuang Liang wrote:
> Hi, Conor
>=20
> > On Tue, Jan 30, 2024 at 12:25:09AM -0800, Changhuang Liang wrote:
> > > Add camera subsystem nodes for the StarFive JH7110 SoC. They contain
> > > the imx219, dphy-rx, csi2rx, camss nodes.
> > >
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >  .../jh7110-starfive-visionfive-2.dtsi         | 103
> > ++++++++++++++++++
> > >  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  67 ++++++++++++
> > >  2 files changed, 170 insertions(+)
> > >
> > > diff --git
> > > a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > > b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > > index b89e9791efa7..e0027bb379ef 100644
> > > --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > > @@ -30,6 +30,37 @@ cpus {
> > >  		timebase-frequency =3D <4000000>;
> > >  	};
> > >
> > > +	imx219_clk: imx219-clock {
> > > +		compatible =3D "fixed-clock";
> > > +		clock-output-names =3D "imx219_clk";
> > > +		clock-frequency =3D <24000000>;
> > > +		#clock-cells =3D <0>;
> > > +	};
> >=20
> > Why do you need an output name here?
>=20
> The output name can be unnecessary.=20
>=20
> > Also, where does this clock come from? Is it an oscillator on the board?
> >=20
>=20
> This clock come from imx219, not the VisionFive 2 board.

If the camera is not on the visionfive 2 board, why are you adding this
to visionfive-2.dtsi?

--aKOGQMxv8o8LMxKI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbvlAAAKCRB4tDGHoIJi
0t7uAP99Kv0Ha56vaQ3FmdELSrLyGZPzRKwDjvkXfD/FjO5zzwD/Y5FDv6A1egV9
RKSaWFPmNuF8uiKHjPFGwcVibWqw8gs=
=+5Bw
-----END PGP SIGNATURE-----

--aKOGQMxv8o8LMxKI--


--===============5675166510956946643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5675166510956946643==--

