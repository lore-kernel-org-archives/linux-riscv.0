Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55D2C0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 18:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EimXsiY0gWepOUz5vLY7+fOjRfMo93xJSPqpllkNego=; b=2Ht85mAP2xhpYXQ/QSR5rd0Zri
	QETsAzsKanyFLFmjYgMEKXUGWoDj5PCbBRRF8MOHMn3BIlwjXip7UPQyXf/6QuGBDzU+Qz1PenaOm
	sD7MPanwcOHowO39VLYLysUI/yz1HSn4aF2WzFH4zMEShY3ysxu36p2Ibmxj8Nbti4yeK1BFbOkg9
	SePr8/2GjCjyQYEXniGsNNhHi0yQuCfYLp898465sYZv8Sz6/GZZkyQrcYg0HsoAzFKeccZtzA/x4
	o0+LwFLXzBR2X1cMuC7x8WlN+GSScSIlW7P7rxL3LCz1xINon8KQzvR/mS5AByLbZIIe0uTiqTtCX
	DzxKYAhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLSjq-004lL8-2w;
	Mon, 17 Jul 2023 18:14:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLSjn-004lKJ-39
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 18:14:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E7FD5611BF;
	Mon, 17 Jul 2023 18:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F0EC433C8;
	Mon, 17 Jul 2023 18:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689617662;
	bh=OqEJx2JXRNQi7GTOKz0fdomqryGSX0xf5Jw92YAE3rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AhIlQxIn/csuKBLwhCGfjg2VH7okyoik7gdBg6Qz9PqregdMX+gjgXK7hnFvIpxOJ
	 z+68z1h+/90ajCET+LDDRIL5nJMtqgLEegWWEaaLzqtOlrdLfgru/NsXRUM6jHxbqu
	 yZJjSVXpwo6G2SeJN4VxLC9/jFOYIAlhCCBZYxb8W6Va5BpKiN0TCK52zI4RydtSYN
	 m2uh+rAMcbcdKlanv1tCQQrPglUgyoRCC9dlzW71htcprkTw8qwjn9z2iLdbr3H9hS
	 ae8v5xMmH3avB4/3N6w81nF2rKDmKWLGG5xnWs7CtsdV7AGJxn5cM+XMLukkGTFRNe
	 v3Pu/qCRt1ybw==
Date: Mon, 17 Jul 2023 19:14:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 0/7] Add PLL clocks driver and syscon for StarFive
 JH7110 SoC
Message-ID: <20230717-easel-pessimist-5b7c4e5bed0a@spud>
References: <20230717023040.78860-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230717023040.78860-1-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_111424_134270_0885ACE9 
X-CRM114-Status: GOOD (  16.65  )
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
Content-Type: multipart/mixed; boundary="===============7904352365337668332=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7904352365337668332==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vpxOvJLAUWdBcn/b"
Content-Disposition: inline


--vpxOvJLAUWdBcn/b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Xingyu,

On Mon, Jul 17, 2023 at 10:30:33AM +0800, Xingyu Wu wrote:
> This patch serises are to add PLL clocks driver and providers by writing
> and reading syscon registers for the StarFive JH7110 RISC-V SoC. And add=
=20
> documentation and nodes to describe StarFive System Controller(syscon)
> Registers. This patch serises are based on Linux 6.4.
>=20
> PLLs are high speed, low jitter frequency synthesizers in JH7110.
> Each PLL clock works in integer mode or fraction mode by some dividers,
> and the dividers are set in several syscon registers.
> The formula for calculating frequency is:=20
> Fvco =3D Fref * (NI + NF) / M / Q1
>=20
> The first patch adds docunmentation to describe PLL clock bindings,
> and the second patch adds documentation to decribe syscon registers.
> The patch 3 modifies the SYSCRG bindings and adds PLL clock inputs.
> The patch 4 adds driver to support PLL clocks for JH7110.
> The patch 5 modifies the system clock driver and can select the PLL clock
> source from PLL clocks driver. And the patch 6 adds the=20
> stg/sys/aon syscon nodes for JH7110 SoC. The last patch modifies the=20
> syscrg node in JH7110 dts file.

Just FYI, I have picked up the binding & clock portions of this series
and your other one adding the stg syscon. I've pushed them out here for
the test robots to have a look:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=3Dcl=
k-starfive

If that passes, my plan is to send Stephen a PR for the lot, later this
week.

Thanks,
Conor.

--vpxOvJLAUWdBcn/b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLWE+AAKCRB4tDGHoIJi
0ur7AP4ndXL/qJjXJfNtVyd+3rK8jlf/5ysC8FoHGmNOM6U7AAD/avzW3cVV9fHK
stAX7pFN96sp2rQoJQtgrXNJ9rxKrwI=
=8WbH
-----END PGP SIGNATURE-----

--vpxOvJLAUWdBcn/b--


--===============7904352365337668332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7904352365337668332==--

