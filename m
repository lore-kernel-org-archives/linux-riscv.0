Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5A4C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 22:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYFRmibu22nfWNaWg3JM2Nh0Mhd04kWzmol/SwIUmAo=; b=RYhcCU/zdL9xukcpRuq2hpwEuq
	ip4VhfpJ3NnwP6x+izCBymyMGo1+RY859oYYcWUrhKWt7fuq6FvGLeppMYZ9LJ4q0wLKpERmPQLxa
	AM+A+TSTMZECFkiBTXBIa5i9D3oAOD7f+JZCqHgC1AyXb/9Y1CCDcOLcOvPFYSpSAZ0JI9hSPFxiS
	5PT6FawaqCyr2MR3mgw8ksxQ3WOZQpFOC+dg7Ca3lL1k8l3f4pjZyb8WHrx4npQaOnpYH8YjWK1yt
	CTo3wrCeTJZNonTNCycxM1XVggpeL6voxTimo7GtSihgucQWbQQNCn83bfWVODIbOVXX8izRJJjnm
	eGY++f5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxbEu-00DBzb-3B;
	Fri, 12 May 2023 22:27:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxbEr-00DByk-2I
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 22:27:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0174964C21;
	Fri, 12 May 2023 22:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA94C433D2;
	Fri, 12 May 2023 22:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683930468;
	bh=yotOQtdEH6rCCF1UokNJsyz14i9QXPrLX0CaR5Gj1jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QOkQfjvbQElQo2Q2BSeL3euoR4smHoogkxZNaHfne7A75YEbUtQYzHRXiX7P1ETxi
	 AJnA0P3BO4rK0q8+YmVSkEQWsGsvGB6pxlSAiTYgLkRukaCPACbi7AMBQlr8TTkNjZ
	 Ep0U58R2PwWtuJSWG5u44UIPOeAH+U5OcRCpJAdENH0tbmZW3+DypvM4peUl6YWCYR
	 TcDAupbBd/yQS0h1q8BuXA+mZLXsKDPBrTjit914UHuvy0fE4FPiLt030zL6GRb1WV
	 L2BduV/N74pCi6Sa8CxsNBNDQzSIzutQHRu1F2KWbzKNudFqgtFycK8/qY6PAEI2oq
	 hrWA5nkASuonw==
Date: Fri, 12 May 2023 23:27:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	walker.chen@starfivetech.com
Subject: Re: [PATCH v1 2/2] riscv: dts: starfive: jh7110: Add watchdog node
Message-ID: <20230512-barrack-catchable-1f4072b9355b@spud>
References: <20230509151723.84989-1-xingyu.wu@starfivetech.com>
 <20230509151723.84989-3-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230509151723.84989-3-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_152749_817925_18474FB0 
X-CRM114-Status: GOOD (  17.79  )
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
Content-Type: multipart/mixed; boundary="===============3496080947383010651=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3496080947383010651==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8JU6x6woKhLCHwoo"
Content-Disposition: inline


--8JU6x6woKhLCHwoo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 11:17:23PM +0800, Xingyu Wu wrote:
> Add the watchdog node for the Starfive JH7110 SoC.

Emil or Walker, could I get a review on this please?
It's the only dts patch on the list right now for the jh7110 that I can
actually apply, so it'd be nice to do so.

Thanks,
Conor.

>=20
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
> index 4c5fdb905da8..47c163ec0bf1 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -469,6 +469,16 @@ sysgpio: pinctrl@13040000 {
>  			#gpio-cells =3D <2>;
>  		};
> =20
> +		watchdog@13070000 {
> +			compatible =3D "starfive,jh7110-wdt";
> +			reg =3D <0x0 0x13070000 0x0 0x10000>;
> +			clocks =3D <&syscrg JH7110_SYSCLK_WDT_APB>,
> +				 <&syscrg JH7110_SYSCLK_WDT_CORE>;
> +			clock-names =3D "apb", "core";
> +			resets =3D <&syscrg JH7110_SYSRST_WDT_APB>,
> +				 <&syscrg JH7110_SYSRST_WDT_CORE>;
> +		};
> +
>  		aoncrg: clock-controller@17000000 {
>  			compatible =3D "starfive,jh7110-aoncrg";
>  			reg =3D <0x0 0x17000000 0x0 0x10000>;
> --=20
> 2.25.1
>=20

--8JU6x6woKhLCHwoo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF69XwAKCRB4tDGHoIJi
0udqAP4tKOaHjuSPwwqts5hXwNP+jpgONumVl4re6oLMfdh5fAEA4kRfEXdNqmD1
pUcjCp6fw2W4wFgttfmyY+0JRcLSRQ8=
=nlcN
-----END PGP SIGNATURE-----

--8JU6x6woKhLCHwoo--


--===============3496080947383010651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3496080947383010651==--

