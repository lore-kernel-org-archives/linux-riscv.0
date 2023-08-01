Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EDEC04FE0
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 11:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMjERQsGKSffnEdkWm4b7eHG2WNGYq5+v/8dXzDqv8o=; b=DZHhYvBLsDukj8avm5z7O3ky5N
	pDCTQ0kN+z/66Jlr0iZ2SG0LNSpVMqABFoNL2cuLFYh93ldmK0k/wea+wFA6qxnFwd5tanBw5Jxa3
	IECSrutdANjov1yWUgUK9xwWwQLipNS8qCIpR7t6TtYTq6VrWqx4M5EtjH2HhAhH1v54d+h0d5pcm
	mvhEWTgioqe4axrhc6A3rzuVSDl1SdLUVM6qOZSXs44FMRQklycS9TJyLMWpsRMRkmfGT2Koh0Yhj
	oNyeU6d2kXlNTAUR/oIQ8Ntx7RUrk/NIWcSlEXuDSI2V9Ba1kxwpMP3S23z5WBtqhmcP2hlg9pyKD
	hyy+BimQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQnol-00280B-1m;
	Tue, 01 Aug 2023 11:45:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQnoj-0027zg-2c
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 11:45:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3CDD61561;
	Tue,  1 Aug 2023 11:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC05AC433C8;
	Tue,  1 Aug 2023 11:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690890332;
	bh=7tDiTd4TDuNKvPRSv3/p+m31RyZXbyg7abTCZkKLnF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SxV77xpJBISvKsn/J3Rd0xWFdhym10nJYIZsOUjlscvbz/fhlS9zj1uzWuvlefFau
	 Rts0JJPLs1/vreoerPbofHR+M5eyKjowFHDTVaBHYVEljiLbd5pfAPYxhzNO/IhgyE
	 XoRrPgH/ltc0U6+Qn+f7P0Jg8R/FHU+2AkgsWyQsFd86IZpVIDs3Ga8u/K0MrShK+W
	 PmsVlqBQ0mGnq02wT/oSOngWRw31gCAHKnwalM0LRM9RyylzRzJAiOr18Jzqr+/4CM
	 +rWkUGZF6DlFP0+gFM4SBIrvcp1GgrNdCFDDPsfTATYGjgR/wyqGEhuW50TcFsE5Po
	 R06wPzbRkOP5w==
Date: Tue, 1 Aug 2023 13:45:29 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com, 
	Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>, 
	Chris Morgan <macromorgan@hotmail.com>, Jack Zhu <jack.zhu@starfivetech.com>, 
	Shengyang Chen <shengyang.chen@starfivetech.com>, Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v1 v1 3/7] riscv: dts: starfive: jh7110: add dc
 controller and hdmi  node
Message-ID: <fin3n5qq2jcejmksjrhi2s4xzfy3jvi264htwzvabzdrdc47wg@6binn7jn2pdv>
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
 <20230801101030.2040-4-keith.zhao@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230801101030.2040-4-keith.zhao@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_044533_956925_3948B2AF 
X-CRM114-Status: GOOD (  16.17  )
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
Content-Type: multipart/mixed; boundary="===============3223439422354404136=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3223439422354404136==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="skfe2pxrx4sbzczu"
Content-Disposition: inline


--skfe2pxrx4sbzczu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2023 at 06:10:26PM +0800, Keith Zhao wrote:
> Add the dc controller and hdmi node for the Starfive JH7110 SoC.
>=20
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 87 +++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 43 +++++++++
>  2 files changed, 130 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dt=
si b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index de0f40a8b..32e5cc96c 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -31,6 +31,21 @@ memory@40000000 {
>  		reg =3D <0x0 0x40000000 0x1 0x0>;
>  	};
> =20
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		linux,cma {
> +			compatible =3D "shared-dma-pool";
> +			reusable;
> +			size =3D <0x0 0x20000000>;
> +			alignment =3D <0x0 0x1000>;
> +			alloc-ranges =3D <0x0 0x80000000 0x0 0x20000000>;
> +			linux,cma-default;
> +		};
> +	};
> +

You should explain why you need this, either in a comment or in the
commit log.
>

--skfe2pxrx4sbzczu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMjwWQAKCRDj7w1vZxhR
xfLPAQCg7oQJf+fuhklc8W+YG708G6AdwC21jBHjwoV/gdctOQEA1NuI8i4v+QQh
6uqlf1/mgX7XSembyehbCmGpksTxhQw=
=dBWR
-----END PGP SIGNATURE-----

--skfe2pxrx4sbzczu--


--===============3223439422354404136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3223439422354404136==--

