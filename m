Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FD4C02180
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 18:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7XDtOpCQHTlv8s0cKrrWhP9K20o6HQ9gXAA6HvjlP4=; b=FbFGT9m+znfJY/PFOp0tPYVW6r
	3wGCnnznPqUdqUwcvf0eIgHZbuMHfRib/EhiHWAaaSO47nKquireYR5JlmVWJwvje+wsBv7attjRN
	SjLkEDYus8FJjHTgsg6q4kCwHXZ8pLF/cP63fGFW3Ax1AN2fMviMDXQGm9WaD7E12C+Ct8Et3gCNZ
	0BK7ZMRcR06xDd3A4LNlfq0wLK8rknkgXluUgpvLbv/gkIkMi8FbPz3hKAaxYCEjyV+vyooi9vrCV
	oduphRZG8KXVhUFdi3NwMwvwzQ9TAj7wLGK133xYld891rjKnPwoizYMUdV5AzTc34N7RE9aiqLQM
	UnSAOgzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPQH-00000006GPZ-0H3x;
	Mon, 13 Jan 2025 18:44:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPQE-00000006GO2-1r3c
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 18:44:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 120335C56F4;
	Mon, 13 Jan 2025 18:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74740C4CED6;
	Mon, 13 Jan 2025 18:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736793861;
	bh=REzVxlFlZt3jmyJLhz4812x6+rsJC8868RgubbOogdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vOHQYYn9UlplFd26nMocQ5aNJqYCOGIRMK+Zz/MW7zp9lEnDJPPLxAGuQckjVDQy0
	 aFtU9mp1TLaIt3yGFhvOmf58brOJq3kXi4w2EoHZ4BZK/eyxutMvX8FlIc7oedkoru
	 HdAlmAKPQzrp9zkHPM2a+tzqtfYCESVAGC7C8rf7B/m7nMrgAtVA6+mcT3ZJLv4rYO
	 mYzOL56Mvu0mtlgFNlBBl/XOLsm3k4zHJEcpGM39C8RXLba+soTDWso0BhSUaXOMxp
	 kZWZ5txewsHsWXjkeMMOL9cPPvXtj2okhsO0ybnocA5oBsFeuoIrtEYbTPTeSWIlCT
	 fjLrtu36kcDnw==
Date: Mon, 13 Jan 2025 18:44:17 +0000
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Minda Chen <minda.chen@starfivetech.com>
Subject: Re: [PATCH v1 1/2] riscv: dts: starfive: jh7110: pciephy0 USB 3.0
 configuration registers
Message-ID: <20250113-mushiness-snugness-0f55574e3956@spud>
References: <20250102183746.411526-1-e@freeshell.de>
 <20250102183746.411526-2-e@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <20250102183746.411526-2-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_104422_518436_C51170C0 
X-CRM114-Status: GOOD (  14.66  )
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
Content-Type: multipart/mixed; boundary="===============8010885030311418718=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8010885030311418718==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FOHyHV9iOj/jYnyr"
Content-Disposition: inline


--FOHyHV9iOj/jYnyr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 02, 2025 at 10:37:36AM -0800, E Shattow wrote:
> StarFive JH7110 contains a Cadence USB2.0+USB3.0 controller IP block that
> may exclusively use pciephy0 for USB3.0 connectivity. Add the register
> offsets for the driver to enable/disable USB3.0 on pciephy0.
>=20
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
> index 0d8339357bad..75ff07303e8b 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -611,6 +611,8 @@ usbphy0: phy@10200000 {
>  		pciephy0: phy@10210000 {
>  			compatible =3D "starfive,jh7110-pcie-phy";
>  			reg =3D <0x0 0x10210000 0x0 0x10000>;
> +			starfive,sys-syscon =3D <&sys_syscon 0x18>;
> +			starfive,stg-syscon =3D <&stg_syscon 0x148 0x1f4>;

Why weren't these added in the first place? Minda, do you know?

>  			#phy-cells =3D <0>;
>  		};
> =20
> --=20
> 2.45.2
>=20

--FOHyHV9iOj/jYnyr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4VfAQAKCRB4tDGHoIJi
0svDAP9bn1shXngVSxwtTd7ldTcxUpfFziGGwYPkzQJxx0mfAgEA82jk5WOM83MQ
gtS8YQT14ttMooCsyg4YEnYq4j6tYQQ=
=u+LI
-----END PGP SIGNATURE-----

--FOHyHV9iOj/jYnyr--


--===============8010885030311418718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8010885030311418718==--

