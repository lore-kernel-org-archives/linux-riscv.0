Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4034DC61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 17:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VVmJUx/PYbtDndDAfO9yGsW/7Rh1ma+zjLFeXA10JE=; b=TMxRArY9z2BZkBzEqXP69Qubrl
	vTj9jnRKW+AZC0gF3Wm3yb4Ieo/ySqWXJyAYlWg5Q0+BFUAxhf+ALa/Ef/ni8lGRGAvHeWcsiKsQ6
	BbatXFlR44Okg5zbtvjSFuGDvwccW5xKLSwovWFhUzVENuEF8d0d4cqVmgKXetNEcN/s8hv7Kk5vt
	hhyHpK0V0/eAyOcgrYUm0ImgsUnkFgNzOEHD6KVXBn4KjOB/KWvU8TRfrwp8JPCnSIq9jaDO7AFpX
	xLf/kkdY2m2zOtJSAUTvBom6iYxrR6teBosutyJKkJgxJCEofXp914LN6nSdQAvdXRtpaI5YbgY2d
	jm/jP1BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUWPw-0099UB-Hc; Tue, 21 Feb 2023 17:27:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUWPt-0099TS-Ly
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 17:27:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 43DBEB81041;
	Tue, 21 Feb 2023 17:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E370C433D2;
	Tue, 21 Feb 2023 17:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677000418;
	bh=cU3JZqMV8I3eS5IY8uyBVDPij+HEK0bbMqGZL/n+ibs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BBd6XKzZRC4zypG8/Sv9m1DgSz4NXl7JmiIuHWIdOoGLcVmFuqzGWIz8lLvasbrmt
	 OmUOGbn9LJUJN4DPV5G3c5OnfUoTQLc9dNe1lJJ1bJepKb5xd66OaYofBoS3C5Rg4G
	 OWRJmZ3CnCBdG8XWXsySLYKz3QqeF16N5EXUQpkzJyPtXp6ribvWPcfiDyBUaeV9Ze
	 8bqx8Zhjwvbvx1hDMrUGIXo92NL5iuUbhDXRVJqEyNhKnsaTpEjrBe/DxHm3phNFeg
	 pV1g/a14ODF7PXArEtZf35UTxyq8MAopmkMH8DvhvsAz/9p4+nAfgAyHcnrwTe1iwW
	 5KnBkidNZ01IQ==
Date: Tue, 21 Feb 2023 17:26:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/19] dt-bindings: clock: Add StarFive JH7110
 always-on clock and reset generator
Message-ID: <Y/T+3H8A7jrX+I9M@spud>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-11-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230221024645.127922-11-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_092701_907489_C27248EE 
X-CRM114-Status: GOOD (  11.49  )
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
Content-Type: multipart/mixed; boundary="===============8574561421582787313=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8574561421582787313==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uwaipNMKG/E3gxwR"
Content-Disposition: inline


--uwaipNMKG/E3gxwR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 10:46:36AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> Add bindings for the always-on clock and reset generator (AONCRG) on the
> JH7110 RISC-V SoC by StarFive Ltd.

> +  clocks:
> +    items:
> +      - description: Main Oscillator (24 MHz)
> +      - description: RTC Oscillator (32.768 kHz)
> +      - description: GMAC0 RMII reference
> +      - description: GMAC0 RGMII RX
> +      - description: STG AXI/AHB
> +      - description: APB Bus
> +      - description: GMAC0 GTX

Ditto here, are some of these clocks, especially gmac0, also optional?

> +
> +  clock-names:
> +    items:
> +      - const: osc
> +      - const: rtc_osc
> +      - const: gmac0_rmii_refin
> +      - const: gmac0_rgmii_rxin
> +      - const: stg_axiahb
> +      - const: apb_bus
> +      - const: gmac0_gtxclk

--uwaipNMKG/E3gxwR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/T+3AAKCRB4tDGHoIJi
0lMNAQDqgVssSvoD3wO1kWvaRRB+UiE+OxXFzbBA7J4AeUX9hgEA+XWwcgAbEcF4
SWAUhBnnb6ev3bxrmG4+m7rCyVZ9og4=
=Az7l
-----END PGP SIGNATURE-----

--uwaipNMKG/E3gxwR--


--===============8574561421582787313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8574561421582787313==--

