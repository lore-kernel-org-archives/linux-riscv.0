Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DDBC47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 14:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MmWYE+ORpL4BorY65df8w12jMm1p3iUs/9ZEYul9s8=; b=AM3EZR6NjC7IPZeiTyXVXGuyRT
	KYch4T0KoXB52DMaxqnPrtduxF1BJG2BreSeHHOsvHdiiiI1Mr8z9ER3APoDdapPbsLeZELhQc44k
	OgpzjAxUmLtOTvLRCgTbBtayDQQnW8al7ugf0E+lGI0filUfop5DXPblYqDt8qyxOVg6qOo4pLCKt
	6chOwCdvmTGY/LZbGN7ov/nSivW4NMB5IKLfMrkDrg6dSAsFSllDbf/36LjlIcr0beP8bWfZW2YOo
	pWpYOaCvwc5NachHL4PEovEo+rji2Ibw1kgRHo2hZUzsNXolZzRF5axLTUtsksjrsmjNpbIZeJ0kE
	ATF5J5cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBhc-00000003vlQ-2cLu;
	Wed, 31 Jan 2024 14:36:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBha-00000003vkn-2TpS
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 14:36:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 13AF26165F;
	Wed, 31 Jan 2024 14:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C76C433F1;
	Wed, 31 Jan 2024 14:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706711793;
	bh=hJ+XW2fv/7c4oP2Hm+5FY6Z2FZRxNXmDtEx1scYcuKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p/qcrKiUHr3R1zdZ6ueRxhVHbjIE36TksoTuqq3vRIuuZUagwUzQ1qMMdox/KrNeO
	 wQR9R4DSLgs/QTZsLPR6dBZBiBmmvi0tvubLIQA+8jFH3YuC4U+WPyj2v88xmU/oVd
	 lQJboA+5ntxwJWtMJYwFXNva6EPUfst7xqfhUI/at8UR5f8x+am3/j9vySclg8RzFn
	 IMnaJwlS/BX/b6bUt/iQe5m3K5tb4QlTVwfE43RPWcRSKR0xd0jn6OBZKtXhx34Rep
	 giJJQe1WJ4x09mMkji1B5Y32pOUNE9s+QGF6D02G6v+/AwrtEKuMAkjK3S0AO6wXcu
	 3JGJc50OL1Lww==
Date: Wed, 31 Jan 2024 14:36:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [v2] riscv: dts: starfive: jh7110: Add camera subsystem nodes
Message-ID: <20240131-recycling-entering-b742e0e835eb@spud>
References: <20240130082509.217683-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240130082509.217683-1-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_063634_692527_026E5228 
X-CRM114-Status: GOOD (  13.64  )
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
Content-Type: multipart/mixed; boundary="===============6585983214254575388=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6585983214254575388==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q8uPg8RLNm85EpwJ"
Content-Disposition: inline


--Q8uPg8RLNm85EpwJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 12:25:09AM -0800, Changhuang Liang wrote:
> Add camera subsystem nodes for the StarFive JH7110 SoC. They contain the
> imx219, dphy-rx, csi2rx, camss nodes.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 103 ++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  67 ++++++++++++
>  2 files changed, 170 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dt=
si b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index b89e9791efa7..e0027bb379ef 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -30,6 +30,37 @@ cpus {
>  		timebase-frequency =3D <4000000>;
>  	};
> =20
> +	imx219_clk: imx219-clock {
> +		compatible =3D "fixed-clock";
> +		clock-output-names =3D "imx219_clk";
> +		clock-frequency =3D <24000000>;
> +		#clock-cells =3D <0>;
> +	};

Why do you need an output name here?
Also, where does this clock come from? Is it an oscillator on the board?

> +	imx219_vana_2v8: 2p8v {

For all of these regulators, please put "regular-" as a prefix for the
node names.

Cheers,
Conor.

--Q8uPg8RLNm85EpwJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbpa1gAKCRB4tDGHoIJi
0htJAP926uU2I31XT3Lgqjc+bRiJN/IujQZChYy/z+0X+iurnQD8Ca60fxV3t1q8
5cLQMdnaSwEe56ewCzw3aTA82hkzQAU=
=t0pB
-----END PGP SIGNATURE-----

--Q8uPg8RLNm85EpwJ--


--===============6585983214254575388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6585983214254575388==--

