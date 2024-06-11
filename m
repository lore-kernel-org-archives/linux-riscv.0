Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A229AC27C65
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 16:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBrCFGrC0xrLBVIBq5Eh6lvYIIJVENRR0j6YAOauUH0=; b=mdFx3EIwSq1iJ/Osdmv+1gIre0
	eGHTrIw4uUK4BJh4T9L2zZ7sOLEbkNWjfbo8bOQQB7ySUjg8jMRgYCYoIbd4Bdo8HI0OjKbCrmNfW
	nXiHRdtut7VvpWjlZCNi/Pbt1B0FAwKfeTTlvP7tc6DDKyWbWLlnIf7GX1fW9SqG6asJd2+sbG9/7
	scay2bSIRZwv2kZUtR12aS697Hty8ARxFJFp8EsgYkEG7BUDRM8o3h9B6k6dQ8LlnsmGd5VnjUOTX
	3aKPRYccoL6yjQKGwjXoCyWZ/qbLdeu64JFQlbi/YFKMgsbaUmimTy7Qs29tfxCtdIMWO52mYrhUF
	Pr6mD1qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH4IN-00000009Udz-2PT8;
	Tue, 11 Jun 2024 16:24:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH4IJ-00000009Uc2-0kfm
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jun 2024 16:24:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5EEEF60F2A;
	Tue, 11 Jun 2024 16:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0867FC2BD10;
	Tue, 11 Jun 2024 16:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718123062;
	bh=e2JRZAInX4VbpDRXbsbxfaga+F/z//woWGhb8XL6kFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bo8W7+Nsmby3FBoOMRdMQxnBcT41xKkNNkijVXEx+MFxGy3lE1nIwiamipM48xVaO
	 cxXeLblMLHoColDh6jSxBmQiTIet0GtPca+IGdMHHRxIUutbzqBf7S13DdBthpQ1wS
	 Yfb6/5gNUi3jL90M9/7OOZ36wNDW9d8JaOywWjKT5R/4IZPIJGN0KwuATCptlowdhy
	 AAALLHqCvERrV1gBKfKZMPfH1hQBcawKLvdXOgo6+aXZ8rH24VI4DdCNkaSlInMnBa
	 OHdG4X0mmJjQ9XRETAvKy4QfIIPhvPLwKZY+Ce+KWtavaZzVjKoon5Hc2Dh5+HlXIo
	 DOVW1zTBgzeFQ==
Date: Tue, 11 Jun 2024 17:24:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1] riscv: dts: starfive: add PCIe dts configuration for
 JH7110
Message-ID: <20240611-irk-hypocrite-a53e98e6c394@spud>
References: <20240611015200.40996-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240611015200.40996-1-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_092423_336456_B920370C 
X-CRM114-Status: GOOD (  12.99  )
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
Content-Type: multipart/mixed; boundary="===============4574425455995855823=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4574425455995855823==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wzZC5MCZUi+ZMG8A"
Content-Disposition: inline


--wzZC5MCZUi+ZMG8A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 09:52:00AM +0800, Minda Chen wrote:
> Add PCIe dts configuraion for JH7110 SoC platform.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../boot/dts/starfive/jh7110-common.dtsi      | 64 ++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 86 +++++++++++++++++++
>  2 files changed, 150 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv=
/boot/dts/starfive/jh7110-common.dtsi
> index 8ff6ea64f048..1da7379f4e08 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -294,6 +294,22 @@
>  	status =3D "okay";
>  };
> =20
> +&pcie0 {
> +	perst-gpios =3D <&sysgpio 26 GPIO_ACTIVE_LOW>;
> +	phys =3D <&pciephy0>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie0_pins>;
> +	status =3D "okay";
> +};
> +
> +&pcie1 {
> +	perst-gpios =3D <&sysgpio 28 GPIO_ACTIVE_LOW>;
> +	phys =3D <&pciephy1>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie1_pins>;
> +	status =3D "okay";
> +};

Do all 3 of the mars, star64 and visionfive 2 have both PCIe ports
exposed? I assume if one does, all does, since they're basically
identical?

--wzZC5MCZUi+ZMG8A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmh6MQAKCRB4tDGHoIJi
0v1MAP9PTX9Hu0d+NafLeM2JG8n5oxSljJKr6Q/CDKPbUeaOcgEAxScFlExYbnQb
F951+zWbwytmbr3baByHSjGl6D2Cigg=
=ds5C
-----END PGP SIGNATURE-----

--wzZC5MCZUi+ZMG8A--


--===============4574425455995855823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4574425455995855823==--

