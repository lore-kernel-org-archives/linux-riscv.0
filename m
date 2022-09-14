Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7C4ECAAD3
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Sep 2022 20:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wURsszdv5AqOH/qQsYS8G7PpIsIVojTMGsHUr464/eU=; b=h3C7RSdoitEo6dSYNfxBVDcI8l
	Ejg1Ydam/AMOLfwPsT2B5P7xi6jbzYOTL8Ab0MhFqLoD572hhUeE2mYRUfRju8073+dlQrQe2kbmB
	RZ/JNTq1ZbRrc1aMq3z0ORonzYX9X19UmBTKsrJDg2XADm6iugyD4h2RM43Bx1ziDh4cg9b2f/PnI
	6oziPlPmhYAiQde7wGrKMmeFNyBqNQZTEqDYoGKuNP+dgm9hn1JzBPErELg/nZBUiMfMZuzKVhB0T
	BDO8cQ6MMnnfQHEleHguDvxMWgFjfdwHTb/PJXxrp+Pw9GY2L8O0a0riVy9UvfhVCySKXVA7al3dd
	EPsdXyqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYYYJ-008jcP-Uq; Wed, 14 Sep 2022 20:00:07 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYYYH-008jZT-V2
	for linux-riscv@lists.infradead.org; Wed, 14 Sep 2022 20:00:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oYYY5-0003Q5-Ss; Wed, 14 Sep 2022 21:59:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oYYY5-000ksF-Sj; Wed, 14 Sep 2022 21:59:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oYYY3-000w08-9p; Wed, 14 Sep 2022 21:59:51 +0200
Date: Wed, 14 Sep 2022 21:59:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 2/4] riscv: dts: fix the icicle's #pwm-cells
Message-ID: <20220914195946.eadkppkgqwgwdace@pengutronix.de>
References: <20220824091215.141577-1-conor.dooley@microchip.com>
 <20220824091215.141577-3-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20220824091215.141577-3-conor.dooley@microchip.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_130006_017227_551BF0CD 
X-CRM114-Status: GOOD (  19.35  )
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
Content-Type: multipart/mixed; boundary="===============9135209877046493905=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9135209877046493905==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xhs4rna6j2neqkiv"
Content-Disposition: inline


--xhs4rna6j2neqkiv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Aug 24, 2022 at 10:12:13AM +0100, Conor Dooley wrote:
> \#pwm-cells for the Icicle kit's fabric PWM was incorrectly set to 2 &
> blindly overridden by the (out of tree) driver anyway. The core can
> support inverted operation, so update the entry to correctly report its
> capabilities.
>=20
> Fixes: 72560c6559b8 ("riscv: dts: microchip: add fpga fabric section to i=
cicle kit")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/=
arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> index 0d28858b83f2..e09a13aef268 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> @@ -8,7 +8,7 @@ core_pwm0: pwm@41000000 {
>  		compatible =3D "microchip,corepwm-rtl-v4";
>  		reg =3D <0x0 0x41000000 0x0 0xF0>;
>  		microchip,sync-update-mask =3D /bits/ 32 <0>;
> -		#pwm-cells =3D <2>;
> +		#pwm-cells =3D <3>;
>  		clocks =3D <&fabric_clk3>;
>  		status =3D "disabled";
>  	};

there are no phandles on that PWM, so there is nothing that needs a
followup adaption.

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xhs4rna6j2neqkiv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmMiMq8ACgkQwfwUeK3K
7Ak7Zwf+OlC3O2dW/x6W5h0S9s75i5/nHm6Qx6dJ+U0/9ukUC7hv6MpgLDPI08d4
MQwDXMwEZ3G1Y/UnlbOKWRhtqI3lJ+CPy3yvjpnL5JfmuOh2dpAApo2qjOTZUhqA
MW7+voTOO667MO4uTXK2BEm+2mbT5NQUkvpGK/EOyPMADNo/VOVu/+c6oQu42v9f
G7trOzs9N5WUSZ6egtXHuY53p5LU1I0yReOzWPZsE03JN0xMUJWp3itac/mb7jU/
5ANyCAfTNzhZG9AGCv6jVnk5wSvlglLYV243HG/tELYR5cULQuxhSdY+IwSZmfXq
JtnxMFPz+BxcgoLtxTFO+/Tb31Nr0Q==
=l8aw
-----END PGP SIGNATURE-----

--xhs4rna6j2neqkiv--


--===============9135209877046493905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9135209877046493905==--

