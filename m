Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB22EC64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 19:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0JSDAcO7ZNks4aZ4XXfHXG5gyjJFiU0TzcbH9dG4YI=; b=a5vdXYN0xAubr4G4DxZLIOFJcv
	u7lfrlGtxs/ErtNlHWkHhZBShzE4CJm+bEUsG/ikXOhTDHGJdA1SyIdmqTJnAZB8SwZh++GGVGdXq
	NIc58Ne3X3v5/PilUXjKXaRjrclxwRUtV+tibpgEU/vSuotwqhz/hhCaOSFescbFCkH8nmitiezxH
	FLsSFcqX6OlQjstHfoFH594z3RLBDRMW9Eu/TWaMqglTDtxxNelJKgePGVYHaqwodf5VMVusWDbJj
	GoaPs/u+FpjCFmrcK/0tTcxfLGSEhyTFhHhV152wB5COCy2a6Zr3uEZvFIhHXnM4KyaftKBTCNCJ3
	KM09JkbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWjbP-00B494-B8; Mon, 27 Feb 2023 19:56:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWjbM-00B48C-J5
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 19:56:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0456D60F24;
	Mon, 27 Feb 2023 19:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DADC433EF;
	Mon, 27 Feb 2023 19:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677527759;
	bh=DjIqsPnT/P7Nb9ik2W2lylfV6VqLezNxb1W9cXM7Lok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hTo7yHiyyI0Iy/gk4xwQhWsCnctsjKnYmAGkr3S4rZhc+RuLbBft/Wga1az1DY8Zy
	 21Bsjdmdcu5hUF2sH3sN72xRIAPgGqlsYLEKe0O7eDoL0DqfAvVSGYO28AZvGxWpFV
	 Ugn74Yf/7PWlP7ppFhVMxIpa61KispFq6koVNg385RN0iqw8MVo/ZqoFRVuBaZLfOQ
	 zdgSPR+nOaKc0sdUewRstc1fal75bStw+jVMt123XVsAiTXucWfe+fowhCRNQHTrX3
	 a4EJpS/i1tVheHQPiBFoZbn/DtDfyf7+FgbFvAgoriKrWSDfesTbJ+ZmCVS+1QAZvM
	 +LI1vycra9sCg==
Date: Mon, 27 Feb 2023 19:55:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 10/11] riscv: dts: starfive: jh7110: Add DVP and HDMI
 TX pixel external clocks
Message-ID: <Y/0KyeK3DU8xtL2V@spud>
References: <20230221083323.302471-1-xingyu.wu@starfivetech.com>
 <20230221083323.302471-11-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230221083323.302471-11-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_115600_722629_2D415415 
X-CRM114-Status: GOOD (  16.30  )
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
Content-Type: multipart/mixed; boundary="===============3101905600906991391=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3101905600906991391==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="80O6WFjF/KFbBM/N"
Content-Disposition: inline


--80O6WFjF/KFbBM/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 04:33:22PM +0800, Xingyu Wu wrote:
> Add DVP and HDMI TX pixel external fixed clocks and the rates are
> 74.25MHz and 297MHz.
>=20
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../dts/starfive/jh7110-starfive-visionfive-2.dtsi   |  8 ++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi             | 12 ++++++++++++
>  2 files changed, 20 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dt=
si b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index c2aa8946a0f1..27af817a55aa 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -86,6 +86,14 @@ &mclk_ext {
>  	clock-frequency =3D <12288000>;
>  };
> =20
> +&dvp_clk {
> +	clock-frequency =3D <74250000>;
> +};
> +
> +&hdmitx0_pixelclk {
> +	clock-frequency =3D <297000000>;
> +};
> +
>  &uart0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&uart0_pins>;
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
> index 005ead2624d4..a5e6fb3ad188 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -245,6 +245,18 @@ mclk_ext: mclk-ext-clock {
>  		#clock-cells =3D <0>;
>  	};
> =20
> +	dvp_clk: dvp-clk-clock {
> +		compatible =3D "fixed-clock";
> +		clock-output-names =3D "dvp_clk";
> +		#clock-cells =3D <0>;
> +	};
> +
> +	hdmitx0_pixelclk: hdmitx0-pixelclk-clock {
> +		compatible =3D "fixed-clock";
> +		clock-output-names =3D "hdmitx0_pixelclk";
> +		#clock-cells =3D <0>;
> +	};
> +

Hmm, would you mind adding these entries with no unit addresses in
alphanumerical order? Both in the soc & board dtsi files.

Thanks,
Conor.

--80O6WFjF/KFbBM/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/0KyQAKCRB4tDGHoIJi
0knlAP4gxK3Mbjl2AkyLpBX/t9oBm8JZ4D9vjdv9xR18sXlfWAEAyd9ChdmJfaU+
6uId/QPwKqq/N0jQBRejvZsi+pIjngA=
=tSXU
-----END PGP SIGNATURE-----

--80O6WFjF/KFbBM/N--


--===============3101905600906991391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3101905600906991391==--

