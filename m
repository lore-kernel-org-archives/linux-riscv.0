Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FB6CA0EE6
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 20:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBlRT9fkkaV1hhUx727/wicMkRpYwPriOITcGVKXiE8=; b=aA+u+MssKlz2ECRvXFM6LP7p/f
	2YPnzzAIPzCdMd20vuMBZxtnSCKu7yuzAHD6nOaItt9SGH4BetiFsOBJiLDp/oM8bZ4BvxYWtoYxk
	hv/7dXcZ6/swp8sDD2riOInOJcvzK0jvoIAUxAh2e9ijloLcW7qgi91A3fDkM9OHoKCWtkwq2s4Xf
	uatWSYPEzZarREHcRLSVFBlUnJDarbc/uMXEDRLeOpAoLCqsHCwmt94fWsf+avHNAkuZAd4HIbUK9
	uAHygiLMXVR64k8BlhDzT4h4Fm/XhejfqeGvjw6m1mRuHgipH2rZWE6QQ5qd8h0m4Hq2TacR4iAlz
	/hm2oN+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoShH-0000000BVhm-2VHE;
	Tue, 19 Aug 2025 20:12:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQq6-0000000BCoB-0Znn
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 18:13:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7800C613EF;
	Tue, 19 Aug 2025 18:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C64EC16AAE;
	Tue, 19 Aug 2025 18:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755627220;
	bh=KpvPL2aa1SINbF9+aQNQrZ61uMnyrWTf51xfQ5aKQRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bU/kEK1KAuwIyAzv3AUR7Zqhso85eaRZLKIgaj2rVHGE6tFvTO/ViepXxzzQDnqOX
	 jEPgFw3N2mtxEwVlFLGMv3HjfATY6f85xggSTgLuDslh8Jg+qmSAFnWosmxmp433Y3
	 OkBa/aYHSBE3gtdDWSk0emTgJ2THXPc2WeQ5pyRBpj/m5JcsZzfFAjXK6b4gk1nRor
	 Jj/7rUMrDYKmJL509RfvCKXbPrA+Ln/UNdzd6QKLEp3GaG4z88tdj8x2nLFwAOyGeX
	 obsQ3ryuo79NPNLm01A1HwIw1uomZkJWfgDCXc3ZIqJMCgWH5a0uiFsWonkqeMnHT/
	 j14dae9pUEQgA==
Date: Tue, 19 Aug 2025 19:13:35 +0100
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] riscv: dts: starfive: jh7110-common: drop no-sdio
 property from mmc1
Message-ID: <20250819-sushi-change-1254c2d2a08d@spud>
References: <20250729141142.13907-1-e@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <20250729141142.13907-1-e@freeshell.de>
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
Content-Type: multipart/mixed; boundary="===============3499183443737283873=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3499183443737283873==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+sm/HGNSxtTF3UeQ"
Content-Disposition: inline


--+sm/HGNSxtTF3UeQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 07:11:35AM -0700, E Shattow wrote:
> Relax no-sdio restriction on mmc1 for jh7110 boards. Property was
> introduced for StarFive VisionFive2 dts to configure mmc1 for SD Card
> but this is not necessary, the restriction is only needed to block use of
> commands that would cause a device to malfunction.
>=20
> Signed-off-by: E Shattow <e@freeshell.de>

I'm going to apply this one to for-next, to give it more of a chance to
soak.

> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv=
/boot/dts/starfive/jh7110-common.dtsi
> index 4baeb981d4df..b156f8703016 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -290,7 +290,6 @@ &mmc1 {
>  	assigned-clock-rates =3D <50000000>;
>  	bus-width =3D <4>;
>  	bootph-pre-ram;
> -	no-sdio;
>  	no-mmc;
>  	cd-gpios =3D <&sysgpio 41 GPIO_ACTIVE_LOW>;
>  	disable-wp;
>=20
> base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
> --=20
> 2.50.0
>=20

--+sm/HGNSxtTF3UeQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKS+zgAKCRB4tDGHoIJi
0h8zAPsEZlSydbDhSSY6HK5fbO8Q2t/BWSTx9sJrPaJSoqzKxwD/cZmCHPLsQpJ1
LjxgMVRbqLLWQ0fpBuU/6TlManpKJQI=
=orR2
-----END PGP SIGNATURE-----

--+sm/HGNSxtTF3UeQ--


--===============3499183443737283873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3499183443737283873==--

