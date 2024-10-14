Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95E8D18129
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 15:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npLbZwOz2jtHg+dSPqDogZtLcd6O/EGLXLNymQzg5fI=; b=U4Zph6JCRgkfFr9ARwMyuyaSjN
	9zHGEsJMrYL+xEPZmgTD19T/WY71KwND8zWI0pRE4YLzUMLFr02xlL+ahtEdIjkYDnBjazn7jO6RW
	DmEOaVsRYFJ5R1mTNGOSc/MEobB3sZ5DH/BFkFknGXkWR0Gb8jAYDgUQ2l9qzcgeULSlaacwe2GV1
	deiSWRtwJQ/+wMowT67e6puLZJkqY2U2htwguQNZt84lfdi3elDvp0oEoJaSHUMITeVuXInNncLR9
	XtRtNHOA2XKC+JgQMnMeQWfwzXKpzDQla537hQ8+Vh2mcdq7qdLo4Tv79uSVTLVsJjyeBJwhEjKn6
	kS8rEJtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0NFE-00000005kHQ-0GEX;
	Mon, 14 Oct 2024 15:44:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0NCJ-00000005jWI-2vyh;
	Mon, 14 Oct 2024 15:41:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 445ACA424DF;
	Mon, 14 Oct 2024 15:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A2A3C4CEC3;
	Mon, 14 Oct 2024 15:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728920485;
	bh=M0aqPwu+dFXtECjVSJ3QQ5hXIYiJbEv0SIsk3LZpeHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kL297kc07fbW2HgkUOc148A271m26BHS4lp+RD+YMjAZNWG7RS3zbnqIpIbvU0UdF
	 YEK279kohnxZHwrC4PJ1QopPzyzFtrajkawya/r2iMFAFvdzksIsRsz1JzzfXre7FJ
	 J3zLjgAXQQEAYBNKZEaab3FMjTurNincfIviP+8hZ5gQVHLU8ImzO7wpMEiIStf+HZ
	 sQ1hd7BhZZMPLovWzebcALmnf7wLcchIEiqvrHOtOgc2Ct2k5lA9yLnRrtB368LIcG
	 ErIwaBkXsqkfiPkWipkqbpSCdwcVQdoolHAdPju2l59jNRtO18M0ye3nkd26r+pvYh
	 RBk4ROumnVUgg==
Date: Mon, 14 Oct 2024 16:41:19 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 10/11] riscv: dts: microchip: fix mailbox description
Message-ID: <20241014-decorator-coma-bdaca54f459b@spud>
References: <20241002-private-unequal-33cfa6101338@spud>
 <20241002-finch-sugar-9958077e8c2b@spud>
MIME-Version: 1.0
In-Reply-To: <20241002-finch-sugar-9958077e8c2b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_084127_891199_B755F533 
X-CRM114-Status: GOOD (  22.45  )
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
Content-Type: multipart/mixed; boundary="===============3042604000962633686=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3042604000962633686==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AMmGHX8GSM3kEZUA"
Content-Disposition: inline


--AMmGHX8GSM3kEZUA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 02, 2024 at 11:48:08AM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> When the binding for the mailbox on PolarFire SoC was originally
> written, and later modified, mistakes were made - and the precise
> nature of the later modification should have been a giveaway, but alas
> I was naive at the time.
>=20
> A more correct modelling of the hardware is to use two syscons and have
> a single reg entry for the mailbox, containing the mailbox region. The
> two syscons contain the general control/status registers for the mailbox
> and the interrupt related registers respectively. The reason for two
> syscons is that the same mailbox is present on the non-SoC version of
> the FPGA, which has no interrupt controller, and the shared part of the
> rtl was unchanged between devices.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/microchip/mpfs.dtsi | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dt=
s/microchip/mpfs.dtsi
> index 9883ca3554c50..f8a45e4f00a0d 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> @@ -259,6 +259,11 @@ clkcfg: clkcfg@20002000 {
>  			#reset-cells =3D <1>;
>  		};
> =20
> +		sysreg_scb: syscon@20003000 {
> +			compatible =3D "microchip,mpfs-sysreg-scb", "syscon";
> +			reg =3D <0x0 0x20003000 0x0 0x1000>;
> +		};
> +
>  		ccc_se: clock-controller@38010000 {
>  			compatible =3D "microchip,mpfs-ccc";
>  			reg =3D <0x0 0x38010000 0x0 0x1000>, <0x0 0x38020000 0x0 0x1000>,
> @@ -521,10 +526,14 @@ usb: usb@20201000 {
>  			status =3D "disabled";
>  		};
> =20
> -		mbox: mailbox@37020000 {
> +		control_scb: syscon@37020000 {
> +			compatible =3D "microchip,mpfs-control-scb", "syscon", "simple-mfd";
> +			reg =3D <0x0 0x37020000 0x0 0x100>;

It came up today that this 0x100 isn't correct - the actual size here is
4 KiB, so there's a zero missing.

> +		};
> +
> +		mbox: mailbox@37020800 {
>  			compatible =3D "microchip,mpfs-mailbox";
> -			reg =3D <0x0 0x37020000 0x0 0x58>, <0x0 0x2000318C 0x0 0x40>,
> -			      <0x0 0x37020800 0x0 0x100>;
> +			reg =3D <0x0 0x37020800 0x0 0x100>;
>  			interrupt-parent =3D <&plic>;
>  			interrupts =3D <96>;
>  			#mbox-cells =3D <1>;
> --=20
> 2.45.2
>=20

--AMmGHX8GSM3kEZUA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZw07nwAKCRB4tDGHoIJi
0uvxAP9ZQ8cvIGni9H/XnWtk13xiTiUDsVDUdKEmVRW5hAVqsQD/SnIowi8Sck+a
xDVwEskn483v/i7rcplrFORdLLx7OwQ=
=2myu
-----END PGP SIGNATURE-----

--AMmGHX8GSM3kEZUA--


--===============3042604000962633686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3042604000962633686==--

