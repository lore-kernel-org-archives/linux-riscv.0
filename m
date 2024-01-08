Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED8CC47073
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 17:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9A/j+ncxyMw4p7V1A/LdEO21vm5LAPJKKniCa+KvJC0=; b=Xs3yNjPFWVZ/5saLnP9Ykc2ehY
	waxwkAN4Pd36CNjoebfnBDguA7DqtZvoJOkGmvgndW7s4Qi5dGXUJOaLK/svZAeozovFwMPBqGXya
	udO8/sPECDs6Ld7mb0tGmqkZM7y2HI7WjPu+f4A0Qjmx+qlcX8yt+N0HLMOVW+92Rh+8Wi0N08HeC
	2Yyjdn/YADAsjlV76XNha4HpSU6kcUKm11MwH5qRnAeaNmodr2wRF2Aht1KXyaASps2EZXK0S9hLB
	ZkzuKWM6eG3BFKMX0Q97mOx9tPAGJ1U7GoUSGX2BETNZUpWww3zbGDbE5sr5mJdvePdA4gjXa0Ba1
	wsvPoI0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMtW7-005lNI-2K;
	Mon, 08 Jan 2024 17:34:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMtW5-005lMY-0O
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 17:34:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 631AE60F91;
	Mon,  8 Jan 2024 17:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C6BC433C7;
	Mon,  8 Jan 2024 17:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704735264;
	bh=WxF3mMEMLyJMj2C6OKuTs7PD9Vj4XTLWmmz+TPw4bh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PMTO9m5jCUZETuKErYC+dV7OLZJ+YU4xfDxmzZiT58AzrzQQ9lIAx5+fwI7pfZFLv
	 qjZ4HVEJzOmsn6XaBD910G62BsXIy/BDmmbj2K8ic1r049YzHl3wggXHNqL/ghQcHE
	 7N7o97BvHDTIUyIVv77sZh+tusVjRUNIqf3hy967MLWxQr+O0OgGwzg0YbjowKS3VF
	 dTYMO5I3buWvcTk5GrQTQGD3JAwAehjIc3mFgy41AFSPdkdehALdnhCMex7BkSzvMs
	 OHC5W3Bq4MM0n0F/VnYEnDtwyF4BmhmJRxUaPzIWNe8S+56BZJwH5JBJS5pgGFa30U
	 KnM9gSl54vojQ==
Date: Mon, 8 Jan 2024 17:34:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Drew Fustini <dfustini@baylibre.com>
Subject: Re: [PATCH v2 3/8] riscv: dts: thead: Add TH1520 pin control nodes
Message-ID: <20240108-majorette-overtly-4ec65d0a15e9@spud>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
 <20240103132852.298964-4-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20240103132852.298964-4-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_093425_259829_C1183634 
X-CRM114-Status: GOOD (  13.24  )
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
Content-Type: multipart/mixed; boundary="===============8282584721327023285=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8282584721327023285==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8Qj2RGfy2RprKGUu"
Content-Disposition: inline


--8Qj2RGfy2RprKGUu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 03, 2024 at 02:28:40PM +0100, Emil Renner Berthing wrote:
> Add nodes for pin controllers on the T-Head TH1520 RISC-V SoC.
>=20
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  .../boot/dts/thead/th1520-beaglev-ahead.dts   |  4 ++++
>  .../dts/thead/th1520-lichee-module-4a.dtsi    |  4 ++++
>  arch/riscv/boot/dts/thead/th1520.dtsi         | 24 +++++++++++++++++++
>  3 files changed, 32 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/ri=
scv/boot/dts/thead/th1520-beaglev-ahead.dts
> index 70e8042c8304..6c56318a8705 100644
> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> @@ -44,6 +44,10 @@ &osc_32k {
>  	clock-frequency =3D <32768>;
>  };
> =20
> +&aonsys_clk {
> +	clock-frequency =3D <73728000>;
> +};
> +
>  &apb_clk {
>  	clock-frequency =3D <62500000>;
>  };
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arc=
h/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> index a802ab110429..9865925be372 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> @@ -25,6 +25,10 @@ &osc_32k {
>  	clock-frequency =3D <32768>;
>  };
> =20
> +&aonsys_clk {
> +	clock-frequency =3D <73728000>;
> +};
> +
>  &apb_clk {
>  	clock-frequency =3D <62500000>;
>  };
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/=
thead/th1520.dtsi
> index ba4d2c673ac8..e65a306ff575 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -134,6 +134,12 @@ osc_32k: 32k-oscillator {
>  		#clock-cells =3D <0>;
>  	};
> =20
> +	aonsys_clk: aonsys-clk {
> +		compatible =3D "fixed-clock";
> +		clock-output-names =3D "aonsys_clk";
> +		#clock-cells =3D <0>;
> +	};

Did this stuff sneak into this commit accidentally?

--8Qj2RGfy2RprKGUu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZwyGgAKCRB4tDGHoIJi
0rwgAP97KBxIGWgOemMO6hdqRmD/8ZxeJ0E6JqevM07cpZ+KvgD/UbJ+65Y7gDdm
xrA0pClmQVdKxcDVsF7lpqNgBw4K4As=
=LWOW
-----END PGP SIGNATURE-----

--8Qj2RGfy2RprKGUu--


--===============8282584721327023285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8282584721327023285==--

