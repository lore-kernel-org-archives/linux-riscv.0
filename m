Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E96C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 21:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6iHld62gl/L+ZKI4Hg5KnzKQEgKhZf+jUS8TCpmF6fQ=; b=JHxGpk9THPmuTHvYvwS8HwdzxW
	IOxba66Dl0eXVTjpFaX87wanF6bzglF4nai6PaiBBBO4r5kscj1tpVrw9ybzRZw1TDhmEFqYG9puM
	0AZX3jG2XizuJT+mC/QXvC5O6V6KYjxVzPu7F5WU0WchpxNnDasC13nLQEWDwXCXx+F1mIdRrM05S
	2tPdjy5LJj2+GHsETXCjo1+pi9sJN2IKQwBV8u58lE8FpfrPL2gaAG+m9R+ITeHdEOwAuJXu0VZXk
	6lirwhqCcjzHmqeJjsGymhCqpWqv9QZPNR7mJsL6H81XWn2CVPXQr3wPByjdocDQ3zM4z3tW9KglH
	Ph+niVjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7kDJ-004NsS-LT; Tue, 20 Dec 2022 21:31:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7kDH-004Npi-1d
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 21:31:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2449E615C1;
	Tue, 20 Dec 2022 21:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1241EC433EF;
	Tue, 20 Dec 2022 21:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671571909;
	bh=4guvi9YPGFRvRQkeTTfj8xKEOlTkQRxYmYlBnGBXEX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ASxomZZ51mjz4Jo/cYvbgQ8eSBD4Tn8igs2KbvX90bcV+batkM9mcEcqR6yEFxKaL
	 m6eRlqXxtHZR8VhA5kAbbr6LjbEcjO+RPq6+oqD1yGOzrZDgu59kpEPGA2T1xLz01B
	 jdlJk4CJCkE4Y+wRWhotjfCFXnlT1GyfNF0oj10fMTQ/p5TOpWLG81hoUgxBnmWWNd
	 lGjeJUQS05LoIFGXZqnUHE2AnoB/bWI/ARiD9MGFabxR5csrcyp2L3u8bmIIBJ26L3
	 yMO8Zmm0BAMkrZ6YcY7IA90xnO2ufKbygNruyugkqY/3jfgdEW9VPeZ1boHijaWKt9
	 0M+sYe8B4HrnA==
Date: Tue, 20 Dec 2022 21:31:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/7] riscv: dts: starfive: Add initial StarFive JH7110
 device tree
Message-ID: <Y6Ipv0BUummgqNaw@spud>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-7-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20221220011247.35560-7-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_133151_184368_E3E63BD0 
X-CRM114-Status: GOOD (  14.61  )
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
Content-Type: multipart/mixed; boundary="===============0475237929861053608=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0475237929861053608==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ObhNkYFiXiedhNNQ"
Content-Disposition: inline


--ObhNkYFiXiedhNNQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2022 at 09:12:46AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> Add initial device tree for the JH7110 RISC-V SoC by StarFive
> Technology Ltd.
>=20
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---

FWIW, this cpu-map is now the default in linux, so you no longer *need*
to add it for that purpose - but there's obviously no harm in being
explicit for other operating systems etc. (IOW, don't remove it!)

> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu =3D <&S76_0>;
> +				};
> +
> +				core1 {
> +					cpu =3D <&U74_1>;
> +				};
> +
> +				core2 {
> +					cpu =3D <&U74_2>;
> +				};
> +
> +				core3 {
> +					cpu =3D <&U74_3>;
> +				};
> +
> +				core4 {
> +					cpu =3D <&U74_4>;
> +				};
> +			};
> +		};
> +	};

> +		syscrg: clock-controller@13020000 {

For obvious reasons, I cannot apply this until both the clock & pinctrl
bindings are in my tree - but you know that already.

> +			compatible =3D "starfive,jh7110-syscrg";
> +			reg =3D <0x0 0x13020000 0x0 0x10000>;
> +			clocks =3D <&osc>, <&gmac1_rmii_refin>,
> +				 <&gmac1_rgmii_rxin>,
> +				 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
> +				 <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
> +				 <&tdm_ext>, <&mclk_ext>;

As Krzk asked - are these clocks really all inputs to the SoC?

> +			clock-names =3D "osc", "gmac1_rmii_refin",
> +				      "gmac1_rgmii_rxin",
> +				      "i2stx_bclk_ext", "i2stx_lrck_ext",
> +				      "i2srx_bclk_ext", "i2srx_lrck_ext",
> +				      "tdm_ext", "mclk_ext";
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +		};
> +
> +		gpio: gpio@13040000 {

> +		gpioa: gpio@17020000 {

Out of curiousity, why gpio & gpioa?

Thanks,
Conor.


--ObhNkYFiXiedhNNQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6IpvwAKCRB4tDGHoIJi
0rWYAQDTig/t+OM+9hgBx8d3GAyl2YXKCY8myegiWUBmFC6xAQD/aQpZ/dHH5sUO
IXoDliLR2oe/z45FzDkNU6ZSUhqQEAA=
=U8m6
-----END PGP SIGNATURE-----

--ObhNkYFiXiedhNNQ--


--===============0475237929861053608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0475237929861053608==--

