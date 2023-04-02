Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5764AC76196
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Apr 2023 19:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kO1OXe8XF1unoBsXzRafQs54IjXTUYKyWI9NZfzkx20=; b=tHx4HxJfnLg0kr5zXAMwFbxBVT
	86n8ln4w4e4QtAgOdWy8FHEkfTOg2206RyM0b+jRSm6x29jxfQ9rtwOnsCUOyCdGbswJKGAHCEXcv
	yT28qgmm8prdlhtfj5O+L0aLWKz7ECjxQVWIEVi+9Nyye8anlJIa7K2OyaDTAHwz3rpqC/3P9fQKw
	wzhWS+MM+UCiHX+H4j+KOHOabenB3NUc9xVvIUaVIO7gSl+1Nw/aOoMYkoByD7W3PXwSBy3V+lOyP
	8jCaYubB7vy4uE5L25Y9+47QvNVGLd0cAT5CUbx5+f/tXiC7pHTsSJWoFklNkV8s65eWdVDp5ZIJX
	LHbiGMww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pj3F3-00D7Wo-19;
	Sun, 02 Apr 2023 19:19:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pj3F0-00D7W6-11
	for linux-riscv@lists.infradead.org;
	Sun, 02 Apr 2023 19:19:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B30E9B80FF0;
	Sun,  2 Apr 2023 19:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23E0C433EF;
	Sun,  2 Apr 2023 19:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680463187;
	bh=inEW+jtO8y4n3Uvc+E4dflVytHhuhEnZfJdXbyiVNQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sd8FP0S9LEIbmuopOGvYgeBYVUgWX9q8cUDUakVOjKeHCvx83hNM9Lj0HSCygouZj
	 ot8ftyp97Cho3JQVGFZolvn5+2pz0QN8wTdwpkAHxntMKMW1q04TjaSp4IOZLghZjz
	 4PwkLxDnovGltyZ+9WsJzmhL/dIs2gbbEemDql+UaAU7kaIvkzMahAkNY1RZzbVB8P
	 hZS/Zp+zlNZ4zt0TYDx2wBwsGHNKxfL9DAKLJtiTK/nqbI3gW/8VLNjxQgVRq0SGFP
	 SskcGRhhcyAUOYkpLHbR7BRJBbTPbDtXV2dN1aRIXQTuk6bR+KbpIlI4ZuiiqLOG3b
	 SpubQ4ePEAxew==
Date: Sun, 2 Apr 2023 20:19:41 +0100
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
Subject: Re: [PATCH v7 00/22] Basic clock, reset & device tree support for
 StarFive JH7110 RISC-V SoC
Message-ID: <acb36897-8085-4f41-9b68-b243467ffc6f@spud>
References: <20230401111934.130844-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230401111934.130844-1-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_121950_665924_51CD598F 
X-CRM114-Status: GOOD (  19.82  )
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
Content-Type: multipart/mixed; boundary="===============1049265139998637812=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1049265139998637812==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SO2Uk5pRGCbZdMav"
Content-Disposition: inline


--SO2Uk5pRGCbZdMav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Hal,

On Sat, Apr 01, 2023 at 07:19:12PM +0800, Hal Feng wrote:
> This patch series adds basic clock, reset & DT support for StarFive
> JH7110 SoC.
>=20
> @Stephen and @Conor, I have made this series start with the shared
> dt-bindings, so it will be easier to merge.

Thanks. I probably should have asked for that, makes my life easier
that's for sure!

> @Conor, patch 1, 2, 16~21 were already in your branch. Patch 22 is the
> same with the patch [1] I submitted before, which you had accepted but
> not merge it into your branch.

I hadn't merged that into anywhere, so I just went and dropped the
original incarnation of that branch and have re-created it.
I don't recall there being a maintainers pattern error (from running
scripts/get_maintainer.pl --self-test=3Dpatterns) with what I had done in
my branch, but with your patch 1 applied I see one. To save myself a
complaint from LKP, I stripped out the MAINTAINERS bits from patch 1
into their own patch that can go with the clock/reset bits.

I squashed 22 into "riscv: dts: starfive: Add initial StarFive JH7110
device tree" since there's no reason to add something knowingly
incorrect IMO.

I've gone and pushed out the following as riscv-jh7110_initial_dts:
riscv: dts: starfive: Add StarFive JH7110 VisionFive 2 board device
riscv: dts: starfive: Add StarFive JH7110 pin function definitions
riscv: dts: starfive: Add initial StarFive JH7110 device tree
dt-bindings: riscv: Add SiFive S7 compatible
dt-bindings: interrupt-controller: Add StarFive JH7110 plic
dt-bindings: timer: Add StarFive JH7110 clint
dt-bindings: clock: Add StarFive JH7110 always-on clock and reset generator
dt-bindings: clock: Add StarFive JH7110 system clock and reset generator

And the rest as riscv-jh7110_clk_reset:
MAINTAINERS: generalise StarFive clk/reset entries
reset: starfive: Add StarFive JH7110 reset driver
clk: starfive: Add StarFive JH7110 always-on clock driver
clk: starfive: Add StarFive JH7110 system clock driver
reset: starfive: jh71x0: Use 32bit I/O on 32bit registers
reset: starfive: Rename "jh7100" to "jh71x0" for the common code
reset: starfive: Extract the common JH71X0 reset code
reset: starfive: Factor out common JH71X0 reset code
reset: Create subdirectory for StarFive drivers
reset: starfive: Replace SOC_STARFIVE with ARCH_STARFIVE
clk: starfive: Rename "jh7100" to "jh71x0" for the common code
clk: starfive: Rename clk-starfive-jh7100.h to clk-starfive-jh71x0.h
clk: starfive: Factor out common JH7100 and JH7110 code
clk: starfive: Replace SOC_STARFIVE with ARCH_STARFIVE
dt-bindings: clock: Add StarFive JH7110 always-on clock and reset generator
dt-bindings: clock: Add StarFive JH7110 system clock and reset generator

<https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/refs>

As it looks like everything has been resolved in terms of comments on
v6, provided LKP doesn't complain or people don't spot something else,
my plan is to send Stephen a PR around Wednesday for the driver bits.

Please LMK if I screwed up anything,
Conor.

--SO2Uk5pRGCbZdMav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCnVTQAKCRB4tDGHoIJi
0kgSAP0ZhGnMAGUiJ+KlSFzyP2jt+4RI/2QTwN1oKvhgmXYp9gEA51va6jlAkqWF
g5FAbwRJR2vtVawWCI8Mfw/SSpp/jQk=
=ZYkW
-----END PGP SIGNATURE-----

--SO2Uk5pRGCbZdMav--


--===============1049265139998637812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1049265139998637812==--

