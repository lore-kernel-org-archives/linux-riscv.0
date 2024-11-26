Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F66D6553A
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 17:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4b3AfKs09rdagQIOrGa+nzvjxDb/8ge26LPECQk208Q=; b=29OOAehQy+Fzwo1oj88tXmN7x6
	EM93Boo1i4MUI4VUSrZVpQmI3l5jogcsU/7bEL2x9wPXWrKR3RFuZl4nyR3mqGDFguPNI5OMDaTge
	St68uNhZhtFS9EMZ7sfY+mNQUOls9M724N+D0jpWN+z3KMuHqnBM2bTc/+DrsXZmH6Mu6kBFsY1ay
	/itPPd21JuPEgUkZF70z5c6/70wgjrRt4IFfFJq1NSIEn2aKYmjhhBBvBf63g9c08iD8ly7ZK1oFm
	VnMoQ6+GmmkQjCxE8R/SXfIQC5HIUiRz/tez86cmNJgivYkImiIjIZY56p5Av1ZcpQYTOptDARZcO
	AeoStUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFzqU-0000000BN03-2gza;
	Tue, 26 Nov 2024 17:59:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFzqS-0000000BMzg-3uJ0
	for linux-riscv@lists.infradead.org;
	Tue, 26 Nov 2024 17:59:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0E130A41218;
	Tue, 26 Nov 2024 17:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC7AC4CED3;
	Tue, 26 Nov 2024 17:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732643967;
	bh=NM3GF0xN32aTABQBi5Mj0ioGDDh9e9apDg1yImcCgn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dWpGsXB6ODZuGGJaNJGPLS9JojBHYCb0M8cziC4ZF0gAs88bnpKU+4wP4sy09NOFM
	 AAvvEUujDVqwt9nrTqwsO4wR9V/FkIEXmwPCRQDiOqncETST7NwW9K3kPctLLmAINu
	 pIChB5+HKrhiWMrCqpYeiVQd5S+w3+VWeD1dAKcioATZUyNTaECUBZOaM4hehcLR8L
	 x4182JuTOpPM78EYpfGK6zUVc82c+PNIxc1pvIpnjDN144OhKuqHF3RsGpL+491ea+
	 PiHw1GUmLK8aJ6ZfB+ytiL6iT9mDs1IXf26TZ0Q6Eiz6wHlEzRWAcSaN9WlL2s+VGc
	 JEjCjWHtNcnzg==
Date: Tue, 26 Nov 2024 17:59:23 +0000
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Henry Bell <dmoo_dv@protonmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] riscv: dts: starfive: jh7110-pine64-star64:
 enable usb0 host function
Message-ID: <20241126-unbraided-underhand-680b9482a24f@spud>
References: <20241126073836.17208-1-e@freeshell.de>
 <20241126073836.17208-2-e@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <20241126073836.17208-2-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_095929_030723_A6056AD8 
X-CRM114-Status: GOOD (  14.50  )
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
Content-Type: multipart/mixed; boundary="===============0806155661852936599=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0806155661852936599==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/78djKjc2HyFsLhU"
Content-Disposition: inline


--/78djKjc2HyFsLhU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Emil,

On Mon, Nov 25, 2024 at 11:38:17PM -0800, E Shattow wrote:
> Pine64 Star64 set JH7110 on-chip USB host mode and vbus pin assignment
>=20

Looks like the same thing here, so same thing here :)

Thanks,
Conor.

> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  .../boot/dts/starfive/jh7110-pine64-star64.dts | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch=
/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> index fe4a490ecc61..b764d4d92fd9 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> @@ -80,7 +80,23 @@ &spi0 {
>  	status =3D "okay";
>  };
> =20
> +&sysgpio {
> +	usb0_pins: usb0-0 {
> +		vbus-pins {
> +			pinmux =3D <GPIOMUX(25,  GPOUT_SYS_USB_DRIVE_VBUS,
> +					       GPOEN_ENABLE,
> +					       GPI_NONE)>;
> +			bias-disable;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate =3D <0>;
> +		};
> +	};
> +};
> +
>  &usb0 {
> -	dr_mode =3D "peripheral";
> +	dr_mode =3D "host";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&usb0_pins>;
>  	status =3D "okay";
>  };
> --=20
> 2.45.2
>=20

--/78djKjc2HyFsLhU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0YMewAKCRB4tDGHoIJi
0t66AP9HW0g6caIUNUVKF8Jw63De+iutnLDrv834ASt0W0V3GAEAtxo18pDD1ecG
rfcvf12D+s54jpd8Jz4LCOmqhzdusgs=
=vZzk
-----END PGP SIGNATURE-----

--/78djKjc2HyFsLhU--


--===============0806155661852936599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0806155661852936599==--

