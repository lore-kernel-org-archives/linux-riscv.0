Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE62C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 21:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8Avk3HTtz5QKuaX+zGdxLcdQzQwmiVuRrwRR4bdHgU=; b=1sz5PSeVvYehLAmGzxRVMvp3KY
	GUsJbFxAJo5fTY8ZOQPFmD4n8xb2JLHbFqca2mPv50UleCz3/Nm0hOWDWF2W/DTyr2N2OB5JSG+mO
	PPkwcnYwrFtb6s0SRnfI4NG8HnqTy3hLaBfl/tHfR3L6NHkj9ndNhLW7o4eAkI0JjnqxIA61ci2P/
	OU2FbL1oLBLKgXjJeNsn9Rqga7YPKZMEOFUDNKboYXGXDqOD8PCsVAo1CkRaCiE1VQd3eigdJAg29
	Wp99IR/+WwY7LsaJnBomNnAxKc39YadW5cdW5+2gYjv10cGEkZIdPv+0rJUnC63CwqltOJFCCbojX
	wIqIxO4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Idc-000DRS-0W;
	Thu, 25 May 2023 21:36:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2IdZ-000DQg-2R;
	Thu, 25 May 2023 21:36:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 37E7D64AF3;
	Thu, 25 May 2023 21:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF05C433D2;
	Thu, 25 May 2023 21:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685050604;
	bh=fTgLUP/spX/1v/xhm+T8su551vODX+MVDzEHLjJVyC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6HB27VGJXeCbOAxlYtTT4a/HviFAW5evDIB38A/SneV95u29fkdGgrymnoPTo9I+
	 N+1wGdd2laYimC/zV2VmgRYK0AxX7Z4cJFe5S6azRUhhQ0ikqPnaR0tVA+w31A/nld
	 3aoR4MKfsMFBp0nYThfSCYlSUOV/GTkQnfRDr+3Xhm9Q31tEqI1QwTYy/Ylw5sCGZr
	 iPhV8IKeaVW5UOlpgf+fDQ2HMupdEVzNe0dWTYF1Qfzn8ch9qm5j6gYjBMJumbt4bW
	 geZTTXszI+HNd1PJlJt0hTGxbH7aY4sE2RUSKE1MkUPLqKgDlsOjv0WHs1Ar1rEwqB
	 1sidF7owc0fWQ==
Date: Thu, 25 May 2023 22:36:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: Re: [PATCH v6 7/7] riscv: dts: starfive: Add USB dts configuration
 for JH7110
Message-ID: <20230525-cross-daybreak-24dfed69e5d0@spud>
References: <20230518112750.57924-1-minda.chen@starfivetech.com>
 <20230518112750.57924-8-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230518112750.57924-8-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_143645_837299_A0A8FFC3 
X-CRM114-Status: GOOD (  15.89  )
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
Content-Type: multipart/mixed; boundary="===============6924517209408067155=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6924517209408067155==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Vw7uD/P9k0KbWgXU"
Content-Disposition: inline


--Vw7uD/P9k0KbWgXU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greg,

On Thu, May 18, 2023 at 07:27:50PM +0800, Minda Chen wrote:
> Add USB wrapper layer and Cadence USB3 controller dts
> configuration for StarFive JH7110 SoC and VisionFive2
> Board.
> USB controller connect to PHY, The PHY dts configuration
> are also added.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
> index 71a8e9acbe55..b65f06c5b1b7 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -366,6 +366,59 @@
>  			status =3D "disabled";
>  		};
> =20
> +		usb0: usb@10100000 {
> +			compatible =3D "starfive,jh7110-usb";
> +			ranges =3D <0x0 0x0 0x10100000 0x100000>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			starfive,stg-syscon =3D <&stg_syscon 0x4>;
> +			clocks =3D <&stgcrg JH7110_STGCLK_USB0_LPM>,

Please don't pick this patch, if the rest of the series is applicable,
as this will break building the dtb as stgcrg does not yet exist in any
maintainer tree.

Thanks,
Conor.

--Vw7uD/P9k0KbWgXU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG/U5gAKCRB4tDGHoIJi
0kaRAP4zsAQYWPoPnIY4GaVky+W0yED4WO9LFF+YaELQTfg7DQEAzHPY2f/ioXn1
ujSP13F9xiLniw+VP2XQjb6uPGHmOwc=
=LWIh
-----END PGP SIGNATURE-----

--Vw7uD/P9k0KbWgXU--


--===============6924517209408067155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6924517209408067155==--

