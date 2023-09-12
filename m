Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C55CA0EF1
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 16:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YW7cOnUD02GDMsUzOtTxmF6Tsxsrvtin+QjVmDcWf5k=; b=uuoImtkhNJOn5QzRC2hBNJFpMT
	oWYU2ok75LVIsshl2K2PE87wutkgz12Of8E1/8rkRSiyI/UpFSu8z0o+W+u4d9vu/OtWv0/uJeawM
	XjQ/8s/7gPQwqH1fKTppDmhGiU8wfTkku9P6/6aydovhoN08PxiNR9dHRHY1jVTc3sra/BpnqTNoK
	sc2VGUGEcz9IU3uZ4sdOK1ZX/Md0cxzdlxaeRfw+P5i1tv+QTp6RnQFpo24e+6rwZrfKPnkcG+Dwg
	ToBrH578ruAhI7q8/Gllk86zLz19ks4oyip4Q2rS9MuRj87Zz77rBaXAbhQbAt3P2jXiC4swRYTZ2
	PA99scug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6RL-003qwG-1v;
	Tue, 12 Sep 2023 16:40:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6RI-003qvI-1O
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 16:40:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 90137CE1D43;
	Tue, 12 Sep 2023 16:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0067AC433C7;
	Tue, 12 Sep 2023 16:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694536833;
	bh=A5hJ7RKJaON9rED/+nFLDpLgZWvMB8+aB01tk0eVE3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SP1pRl0D385TaNkk1URK6N9hFj+7Yv6XDTxSa7NSh4wqFquUQq4uSxzrlcjiW3cCG
	 6dU/0xE8U+2jp+t1gEca0BxL1y43z20oBuInovyKB/5/fgzduSWuyCqVlURE/4g5pw
	 GcrfOKHJTM2CbXOs7QFOK3y9rDcUKUsFWDad4Xf5uJ78zYRRQN+yDXYWmfCJ2gxOon
	 l3mwUH+BBOmiVWzLl55FZhO3+7tRP8pcm2mpmUBfLNCM4t0arD98o7zSRHq0H3bnb+
	 4vIFrUApwhhyFUG7msbhrEfPSp5XJ6cqykmOixEerrBhU+Lj0sQBfQEnOsdZn0d9In
	 MVRcxwU5LXkzA==
Date: Tue, 12 Sep 2023 17:40:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 1/3] dt-bindings: mmc: Remove properties from required
Message-ID: <20230912-seventeen-reborn-48ec5bf5f053@spud>
References: <20230912081402.51477-1-william.qiu@starfivetech.com>
 <CAJM55Z_NjSVwCcS0MfHw3mAwsBuScAU0OXX1Ga1+TfQNHKB7Vw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z_NjSVwCcS0MfHw3mAwsBuScAU0OXX1Ga1+TfQNHKB7Vw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_094036_823810_9FEB8B8A 
X-CRM114-Status: GOOD (  23.69  )
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
Content-Type: multipart/mixed; boundary="===============1782547297885712031=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1782547297885712031==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cUk6S7kc0eLwyqAK"
Content-Disposition: inline


--cUk6S7kc0eLwyqAK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 02:12:44AM -0700, Emil Renner Berthing wrote:
> William Qiu wrote:
> > Due to the change of tuning implementation, it's no longer necessary to
> > use the "starfive,sysreg" property in dts, so remove it from required.
>=20
> nit: again the device tree should be a description of the hardware, so the
> justification here shouldn't be that the Linux driver doesn't use the fie=
ld,
> but that it turns out the registers aren't required for the peripheral to=
 work
> properly. Don't respin the series just for this though.
>=20
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

The fact that I can't actually apply this without breaking bisection
kinda hints at removing it in this patch is incorrect.

>=20
> > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> > ---
> >  Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.=
yaml b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
> > index 51e1b04e799f..553a75195c2e 100644
> > --- a/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
> > @@ -55,7 +55,6 @@ required:
> >    - clocks
> >    - clock-names
> >    - interrupts
> > -  - starfive,sysreg
> >
> >  unevaluatedProperties: false
> >
> > @@ -73,5 +72,4 @@ examples:
> >          fifo-depth =3D <32>;
> >          fifo-watermark-aligned;
> >          data-addr =3D <0>;
> > -        starfive,sysreg =3D <&sys_syscon 0x14 0x1a 0x7c000000>;
> >      };
> > --
> > 2.34.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

--cUk6S7kc0eLwyqAK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQCUewAKCRB4tDGHoIJi
0maDAQDgV2ZQDW92zUjexwzbV/uBoRBa5Xy3lJvdqgHjt/yJWQEAsUru3ltxVeL3
q3k/FIGMUjG4FUDAgSr0SRZjCtFKwwI=
=ZyML
-----END PGP SIGNATURE-----

--cUk6S7kc0eLwyqAK--


--===============1782547297885712031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1782547297885712031==--

