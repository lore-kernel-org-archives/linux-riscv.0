Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AF2606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 19:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QIbqNoP/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GulK2+NY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ba/uoR2m7sG5auAKWufYxlLypKKSm/DmK2p/ETV3SkA=; b=QIbqNoP/CBQGGNiRTE6KYSPQA4
	nIAtpNir5d4jQpRjyRzrBJKbcPn0JnHZwcrIHzzDvfu0pRs//Y0K1ivmfLS5ht+eu44ZYpu3jSPRQ
	Lxg0wIBvU9tUSH1MiT1ASLvZ0HPtN3utxgeIGSXzJ+b9zgmJPllA6u8L/DI151QqhzgBh5xL+EFbJ
	Gdmx+x3dcqy3Iu3Eh7CPdqcf88bkjw/SheQ8M95qKJ/MWu7I4Mu+tu15u/cAgf2G2cU47xdpd9BGX
	rlz+6Wn1c0j+h095/0BhURbof0VIa7rk3z/2PvC1Dvkr7Hu0PSH0W6ErfolIgZVxm5puVju3lhYEe
	en3UHcuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMW4c-0000000AGin-208O;
	Thu, 29 Oct 2026 19:46:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMW4a-0000000AGiR-2B5X;
	Thu, 29 Oct 2026 19:46:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F2988410A8;
	Thu, 29 Oct 2026 19:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0821F01816;
	Thu, 29 Oct 2026 19:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793303163;
	bh=T//p5dzd+nUs6RGkT9FOPq6XfHPBSykpDW6FOc0lNR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GulK2+NYu6OXLKnYDvVei/xi4VxfmAbmwxCtDEiTHb/8vs+0OVId/fFcGBEFATnow
	 yZA/8vcNf3pTFb+2lLOJgTW4husYkV8NNGxrDLFYQGZTIHXRYHSoJDYVHWBfYyGAnj
	 yHWsqZz2XQH0dzK+2GEaeLyQ/NdaEWgjXPSvd+zjoL2axQbey7kZ7wf++0Ol0AxRLG
	 lqgzq4bJMekgaEw03n7nUU7HO8awdq6P7W3olyFZW12dk4Rm0we+anS7RWK3absPDR
	 zR5l4M8hdWhcGbFHKpc7hoOeAzFh/tjCpFrYk//Shd3e+DjTBjeSr0pTjkC9WSKhnu
	 H/ZA3qzeh1SPw==
Date: Thu, 29 Oct 2026 19:45:54 +0000
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Subject: Re: [PATCH RFC 11/18] dt-bindings: firmware: add A210 SCMI clock and
 reset IDs
Message-ID: <20261029-lazy-salami-cabba2657632@spud>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
 <20261027-a210-scmi-v1-11-74d58ce85bd8@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261027-a210-scmi-v1-11-74d58ce85bd8@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Drew Fustini <fustini@kernel.org>, Radu Rendec <radu@rendec.net>, Yao Zi <me@ziyao.cc>, Paul Walmsley <paul.walmsley@sifive.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Vivian Wang <wangruikang@iscas.ac.cn>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Jassi Brar <jassisinghbrar@gmail.com>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-serial@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, linux-gpio@vger.kernel.org, Daniel Lezcano <daniel.lezcano@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Paul Walmsley <pjw@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Inochi Amaoto <inochiama@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============7146469028996977676=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7146469028996977676==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j1YaT5ntQHv0iC48"
Content-Disposition: inline

--j1YaT5ntQHv0iC48
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 11:37:02PM +0800, Han Gao via B4 Relay wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
>=20
> Define the SCMI clock and reset IDs for the A210 UARTs, pad controllers
> and AON I2C1. Each UART has separate serial and APB reset lines, so
> they get separate reset IDs, numbered like the matching clocks.

Drivers will never use these, it's all just passthrough - is it actually
a binding at all or should it be in the dts directory as a header there?

Given this can change with firmware versions, and isn't fixed, I don't
think it is actually a binding.

>=20
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  include/dt-bindings/clock/zhihe,a210-scmi.h | 15 +++++++++++++++
>  include/dt-bindings/reset/zhihe,a210-scmi.h | 13 +++++++++++++
>  2 files changed, 28 insertions(+)
>=20
> diff --git a/include/dt-bindings/clock/zhihe,a210-scmi.h b/include/dt-bin=
dings/clock/zhihe,a210-scmi.h
> new file mode 100644
> index 000000000000..b8f6441ac650
> --- /dev/null
> +++ b/include/dt-bindings/clock/zhihe,a210-scmi.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +#ifndef _DT_BINDINGS_CLOCK_ZHIHE_A210_SCMI_H_
> +#define _DT_BINDINGS_CLOCK_ZHIHE_A210_SCMI_H_
> +
> +/* SCMI clock IDs; existing entries must not be renumbered. */
> +#define A210_CLK_UART_SCLK(n) (n)
> +#define A210_CLK_UART_PCLK(n) (10 + (n))
> +#define A210_CLK_PERI1_PAD 20
> +#define A210_CLK_PERI2_PAD 21
> +#define A210_CLK_PERI3_PAD 22
> +#define A210_CLK_AON_SYS 23
> +#define A210_CLK_AON_I2C1_IC 24
> +#define A210_CLK_AON_I2C1_PCLK 25
> +
> +#endif
> diff --git a/include/dt-bindings/reset/zhihe,a210-scmi.h b/include/dt-bin=
dings/reset/zhihe,a210-scmi.h
> new file mode 100644
> index 000000000000..53e108c15407
> --- /dev/null
> +++ b/include/dt-bindings/reset/zhihe,a210-scmi.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +#ifndef _DT_BINDINGS_RESET_ZHIHE_A210_SCMI_H_
> +#define _DT_BINDINGS_RESET_ZHIHE_A210_SCMI_H_
> +
> +/* SCMI reset IDs; existing entries must not be renumbered. */
> +#define A210_RESET_UART_SRST(n) (n)
> +#define A210_RESET_UART_PRST(n) (10 + (n))
> +#define A210_RESET_PERI1_PAD 20
> +#define A210_RESET_PERI2_PAD 21
> +#define A210_RESET_PERI3_PAD 22
> +#define A210_RESET_AON_I2C1 23
> +
> +#endif
>=20
> --=20
> 2.55.0
>=20
>=20

--j1YaT5ntQHv0iC48
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOicgAKCRB4tDGHoIJi
0nRKAQCSAL2ueiPMHjMObm/56vK9Z9iz6fiHz92RtC5Jf8QRIwD/YIsAtrtE4TAM
quUITnSpm7b/sphBMJW2Zw6RLTkZmAQ=
=RNBV
-----END PGP SIGNATURE-----

--j1YaT5ntQHv0iC48--


--===============7146469028996977676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7146469028996977676==--

