Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986ADFF886D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 18:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ts9HUP5Os7hYxpBCOl1Ono+JVwvv1MY3/z5Rn48UkJE=; b=PBs2AsMiGGkRStZepfiETD525/
	gdzsPlaZthD8jW0cyfBRzWk4HkUCtR4+80ocWSlinyh68D753JqxNk/VZyQCe0+0DNX7+CKu7mvFv
	jQUllIvKXCcgVWuQ/RxDPIjHZs5K1+xsKEy7iL1+ggG4SY4D+2JrFKwS+JQ96ggPepegEkAJyH0Jp
	dYOPo4AYo+xtu1JV0Hz822STaOsuEnF2eHnIp0rV9qMRjvG6BN4bZb0XZvEXlXiAZwxSygwnBBxhy
	6bSEx11e51HXKZ5DuCiH30dgwjw/JzqKl2vp03CLYz5quEPPim02NXL6UUU28q3Xfzu6vNPp/LDJt
	fl3NNC6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnWg-000000027cW-0PgB;
	Tue, 28 Apr 2026 18:51:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnWd-000000027c7-1RAj
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 18:51:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9EE1A44134;
	Tue, 28 Apr 2026 18:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6348FC2BCAF;
	Tue, 28 Apr 2026 18:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777402274;
	bh=1seDTjn6972nfWjS0rEHA9YvmB2LMSwUbkkv4XJ/ipQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gGsqMJQ3dXP21blxtK27vRWL3orDgvzaYg5b0vvG/JRAhzR4Kz9DqHk32KyhUcDB3
	 C5oU6vXj5Np3HgxMkqbU2N5jkSIkF+UP1DVflUSIXcwGDfcEiHYleMjQp3r+463PUw
	 an4Enwm8wFkHI90vonRB8OwaugryHKeuryhY65kw6WduN42Psyl4TqUjF/ucmNtnBz
	 bLrY1ndTlyAJDoztXsOHMkm8c/trO4qf9/alcoNwH68+eXwHAJyfmzJaZFUBsY/rPv
	 p2MA48sC8o1YtmCQcZsxuAqBa9JHSBy5LPJcdKwV8EKb5oG8DBh7tZPS2Jt8Ui6l0n
	 otiO/4jX5ZEDw==
Date: Tue, 28 Apr 2026 19:51:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v1 11/20] dt-bindings: pinctrl: Add
 starfive,jhb100-per1-pinctrl
Message-ID: <20260428-hardhat-both-1c9aa594a45a@spud>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-12-changhuang.liang@starfivetech.com>
 <20260424-mumps-foothill-ef122c1029c0@spud>
 <ZQ4PR01MB120229BE0DAC2658164C066AF2372@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ4PR01MB120229BE0DAC2658164C066AF2372@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_115115_421697_E0047574 
X-CRM114-Status: GOOD (  22.82  )
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
Content-Type: multipart/mixed; boundary="===============8364133694352961150=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8364133694352961150==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xMbyPycYGBGKvOmn"
Content-Disposition: inline


--xMbyPycYGBGKvOmn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 01:28:05AM +0000, Changhuang Liang wrote:
> > On Fri, Apr 24, 2026 at 04:13:21AM -0700, Changhuang Liang wrote:
> > > Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1)
> > > pinctrl controller.
> > >
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > +        properties:
> > > +          pinmux:
> > > +            description: |
> > > +              The list of GPIOs and their function select.
> > > +              The PINMUX macros are used to configure the
> > > +              function selection.
> >=20
> > Why is the pinmux property needed?
> > Can you use pins and function instead?
> >=20
> > Looking at the defines that you have added, it appears that lots of def=
ines for
> > the same peripheral share the same numerical values, suggesting that ac=
ross
> > peripheral, all (or most) pins would share the same mux setting/"functi=
on
> > select", suggesting that pins/function would suffice.
> >=20
> > I'd like to see some justification for pinmux being the right solution =
here, like
> > the "function select" used by one peripheral being significantly differ=
ent for
> > many of its pins.
>=20
> We think that implementing this in the pinmux will be relatively simple. =
It avoids=20
> the need to create a large number of mapping relationships in the driver,=
 which=20
> simplifies our driver implementation. I'm not sure if you'll find this ex=
planation=20
> acceptable.

I don't really see how pins + functions would require lots of "mapping
relationships". Instead of having
+/* pinctrl_sys2 pad function selection */
+#define FUNC_SYS2_UART_CTS				1
+#define FUNC_SYS2_UART_RTS				1
+#define FUNC_SYS2_UART_DCD				1
+#define FUNC_SYS2_UART_DSR				1
+#define FUNC_SYS2_UART_DTR				1
+#define FUNC_SYS2_UART_RI				1
+#define FUNC_SYS2_UART0_TX				1
+#define FUNC_SYS2_UART0_RX				1
+#define FUNC_SYS2_UART1_TX				1
+#define FUNC_SYS2_UART1_RX				1
+#define FUNC_SYS2_UART2_TX				1
+#define FUNC_SYS2_UART2_RX				1
+#define FUNC_SYS2_UART3_TX				1
+#define FUNC_SYS2_UART3_RX				1
+#define FUNC_SYS2_UART4_TX				1
+#define FUNC_SYS2_UART4_RX				1
+#define FUNC_SYS2_UART5_TX				1
+#define FUNC_SYS2_UART5_RX				1
+#define FUNC_SYS2_UART6_TX				1
+#define FUNC_SYS2_UART6_RX				1
+#define FUNC_SYS2_UART7_TX				1
+#define FUNC_SYS2_UART7_RX				1
+#define FUNC_SYS2_UART8_TX				1
+#define FUNC_SYS2_UART8_RX				1
+#define FUNC_SYS2_UART9_TX				1
+#define FUNC_SYS2_UART9_RX				1
+#define FUNC_SYS2_UART10_TX				1
+#define FUNC_SYS2_UART10_RX				1
+#define FUNC_SYS2_UART11_TX				1
+#define FUNC_SYS2_UART11_RX				1
+#define FUNC_SYS2_UART12_TX				1
+#define FUNC_SYS2_UART12_RX				1
+#define FUNC_SYS2_UART13_TX				1
+#define FUNC_SYS2_UART13_RX				1
+#define FUNC_SYS2_UART14_TX				1
+#define FUNC_SYS2_UART14_RX				1
you just define a function called "uart" and have a simple map of
that string to the number 1. You end up with a single array with the
relationships, not lots.

Frankly, pinmux just does not seem appropriate to me when it looks like
90%+ of the pin mappings for a peripheral share the same function value.
There appears only to be a rare number of cases where that doesn't
apply, but that could be handled by having them represented by a
different group/pins node with a different function.

--xMbyPycYGBGKvOmn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafEBnAAKCRB4tDGHoIJi
0uZFAQDc6TkitcowwJ7JWd4hquGJtDH8OjRFObjzwz+BsmdhqwEAjKn+QQKxLE73
SJVK2gbqIbHoREPEvyMGDMPfEaZZHQM=
=QsEF
-----END PGP SIGNATURE-----

--xMbyPycYGBGKvOmn--


--===============8364133694352961150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8364133694352961150==--

