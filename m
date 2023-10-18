Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2ECCDB483
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 13:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccWC6vUaDXLZmOPBDzZ2oxIMYSKnMIpm/in97gjX3+M=; b=PEtMnRfsZ/Htn+OvnLd/vvfIr3
	S1YI28NP36NbLGA8hzyP3rMuEpkQFmbqh6AMn723XGvYcH8WffPXlsABZsjBOqXMZAh/DwP72goFO
	Y7iMUWpua5hoxIoJYclg9Tt5J6hcu7xfHUYxSPIhtrGSflmlK+TkDFRMPEl1dTU8WVWjJ9wKALzy3
	iFiRCEitGfKGxh0Qz9HYif1mi14s8tOtPUraOICj7NS8SKJkDO9k5cCzoInOF1s3st3rDzk3/+4fh
	uNDeSkhoE9Py+jGLkLxUQuYzBYYrNhObT5svsSPNfaYAl+aKgbm7FLM+r0QLB1OwNLCvPSuldFqYT
	2CV0nTbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt73g-00EpEz-2s;
	Wed, 18 Oct 2023 13:58:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt73e-00EpDj-1V
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 13:57:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 07A16B82393;
	Wed, 18 Oct 2023 13:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B336C433C7;
	Wed, 18 Oct 2023 13:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697637476;
	bh=9CmkbilECnd6ujEwZdATorH+rM11Zfb8aq81/Ubbn+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u5AciNiqCUVqfWrstP1MVrMTugREQ2IjVcYCWzfDKjkJvtOw4vyyxAejqyWGMgDr8
	 SOaeOx6lWLiKz0j2COAB/qb8L2Rm6KJ0BmJwOkAz2+T5KJt0zxK5cC85xMfkAIGJ/I
	 zXlV7bSkmjWoqgUkK2EHknjEo3TYmU6RsXWTSMcQnKqVRS/mc3zy+Nvw/KGqgrbIDq
	 WS3BUnm5hYQ8pG4q96QdFMtCW2HHwQEphyUsatEFi9RUg6ajwiaNYMpvyyj1Xc8Zfg
	 QGgsQInTyaIo+Yph8bsl4vnh3DayUsBFEyi5F+nhFO/9JzkwCbQcplGGdoVRMVbVB0
	 tiSuzu9D90oiQ==
Date: Wed, 18 Oct 2023 14:57:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Subject: Re: [PATCH v2 6/7] riscv: dts: thead: Enable BeagleV Ahead eMMC
 controller
Message-ID: <20231018-dating-yogurt-d7f3a65a873e@spud>
References: <20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com>
 <20231017-th1520-mmc-v2-6-4678c8cc4048@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20231017-th1520-mmc-v2-6-4678c8cc4048@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_065758_677327_129EAF8A 
X-CRM114-Status: GOOD (  14.64  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jason Kridner <jkridner@beagleboard.org>, linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Xi Ruoyao <xry111@xry111.site>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Robert Nelson <robertcnelson@beagleboard.org>, Fu Wei <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============4158316962056644352=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4158316962056644352==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EJhQKjdNlUN6WevH"
Content-Disposition: inline


--EJhQKjdNlUN6WevH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2023 at 01:43:52PM -0700, Drew Fustini wrote:
> Add properties to the emmc node and enable it and set the frequency for
> the sdhci clock.
>=20
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/ri=
scv/boot/dts/thead/th1520-beaglev-ahead.dts
> index 70e8042c8304..bf55319ba950 100644
> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> @@ -52,6 +52,10 @@ &uart_sclk {
>  	clock-frequency =3D <100000000>;
>  };
> =20
> +&sdhci_clk {
> +	clock-frequency =3D <198000000>;
> +};
> +
>  &dmac0 {
>  	status =3D "okay";
>  };
> @@ -59,3 +63,13 @@ &dmac0 {
>  &uart0 {
>  	status =3D "okay";
>  };
> +
> +&mmc0 {
> +	bus-width =3D <8>;
> +	max-frequency =3D <198000000>;
> +	mmc-hs400-1_8v;
> +	non-removable;
> +	no-sdio;
> +	no-sd;
> +	status =3D "okay";
> +};

Is this file meant to be in alphanumerical order?


--EJhQKjdNlUN6WevH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS/kXgAKCRB4tDGHoIJi
0ob5AQCRV10xGur/a43BpgYcA5A0R9y8m/5uK2GBbJL6LVr59QEAopmqh+brNf3r
URiqy36uFplvPJ9tsOe2/+aAmZRtWQU=
=DFYd
-----END PGP SIGNATURE-----

--EJhQKjdNlUN6WevH--


--===============4158316962056644352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4158316962056644352==--

