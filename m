Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6EEC7EE29
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 21:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0DRG6H0AMfTdckS2Qtx5EBjJPUwE1vr4lJoQ9nd1ag=; b=rpFJdY6+p90fCfyxnIuylVlXyR
	PY1YhkNuvrCJbk/b2rxhmmCNRX7NyT3/sOOwOY3pQ96z/0oAsdVlyzuqqunHQ8qu4sB40gyBq4V1F
	XBwPuprvZXrCSV9yMtWiAcoOzZ2s7TUTBaCA1xAF6v1v+7yBfHxPvVgDtTaWoFzFZ+rQ4d+RvNhYr
	75PTDNIjR1SL1zY2BR7FtfsftCgg6PiwzyRM114DWkdOUOGSIUV+HxBo7RmwdA0A1npo7Ea91j5ai
	NaMuQGjTY1yyXO3+CCdlsLs5oxKA8tk3tyJkzKO2WdO3kuPb9/psVoCzzF4kNh34y9G7K6teYfl7c
	oQtdXfDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2IjW-000E8Q-0T;
	Thu, 25 May 2023 21:42:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2IjU-000E7o-0b
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 21:42:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8A50364B5E;
	Thu, 25 May 2023 21:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FCC5C433EF;
	Thu, 25 May 2023 21:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685050971;
	bh=FjzpokD3KlPp8OLgmScsmPYAiivMUvZd0d1dgeN/VZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jJoyh+4n68Ju6BaUjIkoD3sxPvcYo48wGZOVliY/Qu5DJK2G8lxGnOhq0PfX6XdHg
	 PrxvI42P/D4vV/+J3ljjgB2+p9eNhClm1ROwAa72bND4XzUJc+IiMkz7VY7/YHNSJE
	 qeJC8d9HwMEzfpkb9KRxUzoHpzH7DH7nMOQyTgwX7XWcrrujDbXu1foblWM9mXi2x1
	 Gsy3oHLog8I4eL2JMhJhRlRfxxtZ6I6J2/RQFsqLoHh4wyCgzfD+tPhLFsinVpEFRd
	 aOeZSfWeBwcAGoLQKl2RRuu/ifXDJpF/hazBAFos9poa1PJrDGqHjqHM6fCsBZn26q
	 hkyW07t/y2KPQ==
Date: Thu, 25 May 2023 22:42:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 09/11] riscv: dts: starfive: jh7110: add pmu
 controller node
Message-ID: <20230525-unwarlike-mule-f37ec29cf7c5@spud>
References: <20230518101234.143748-1-xingyu.wu@starfivetech.com>
 <20230518101234.143748-10-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230518101234.143748-10-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_144252_262153_466B939A 
X-CRM114-Status: GOOD (  17.35  )
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
Content-Type: multipart/mixed; boundary="===============8234487460961216315=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8234487460961216315==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ammaxlZe6GO1q9SH"
Content-Disposition: inline


--ammaxlZe6GO1q9SH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 06:12:32PM +0800, Xingyu Wu wrote:
> From: Walker Chen <walker.chen@starfivetech.com>
>=20
> Add the pmu controller node for the Starfive JH7110 SoC. The PMU needs
> to be used by other modules such as VPU, ISP, etc.
>=20
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>

Firstly, this is missing your SoB - but more importantly this is already
in my tree as 6a887bcc4138 ("riscv: dts: starfive: Add PMU controller
node").

Thanks,
Conor.

> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
> index 4c5fdb905da8..30e1f34d5cf8 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -496,5 +496,12 @@ aongpio: pinctrl@17020000 {
>  			gpio-controller;
>  			#gpio-cells =3D <2>;
>  		};
> +
> +		pwrc: power-controller@17030000 {
> +			compatible =3D "starfive,jh7110-pmu";
> +			reg =3D <0x0 0x17030000 0x0 0x10000>;
> +			interrupts =3D <111>;
> +			#power-domain-cells =3D <1>;
> +		};
>  	};
>  };
> --=20
> 2.25.1
>=20

--ammaxlZe6GO1q9SH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG/WVQAKCRB4tDGHoIJi
0utfAP4iYxhTjF7eRb0ilQrW5LNMGhk1Qr4ecLfvdWIrU21NsAEA1DnG2vnKfoRI
nCZWaxxfvH6O1DXPEMFiiEh8Evllvgk=
=MphS
-----END PGP SIGNATURE-----

--ammaxlZe6GO1q9SH--


--===============8234487460961216315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8234487460961216315==--

