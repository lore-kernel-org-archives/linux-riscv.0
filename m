Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98050CF34A0
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 11:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/rYGXQYwf6Z4NF2eSZ+B6/XZcB+0kjS+Ub7xi/s8ek=; b=dyU9mswu9/WD1O5MfPq4rJrr1T
	ssncLS95+e6RP8IMrSLGFZv+PH39yvSSu1fQ1MU+p9YkYRMu1+KdCnKfyhYXlgcUrtl5mky8zRfyD
	dJMnaLY+aTCKULUkybTh4FJlS0ruKVjUX8Z5CYNq6v/jKgTi5AYKKsjBAWfoj6icelZi0yIxlWM0j
	JpAjfdTD/8qt72JkIEl62u1LTugJ32lmyyFThiqez9T/6Z0OcR6FQMKpuJ2OETyHPdLDBrNVH3bGz
	nBVI4YSZGXQAuI0Lrm4IwZ9xN8cwLAQSspxsQTGWIzsio29wgqkhxVSYYM8FUyKqnGyKGR5s2ujAo
	YMAKOq9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swK70-00000008uvz-3x0L;
	Thu, 03 Oct 2024 11:35:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swK5b-00000008ujD-3cdL;
	Thu, 03 Oct 2024 11:33:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9A659A4391C;
	Thu,  3 Oct 2024 11:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ECB1C4CEC5;
	Thu,  3 Oct 2024 11:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727955226;
	bh=NLctO8JI0MYGf7CqUEPw7Kskjrc+MaQ2Y++XMVrcnE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NqWQ7z7R/QiDmVe1vwzFaIZH3Bfi4p0TGx5ZhHXG8nX5K4Ta30gOCci/jlREHBNET
	 ezHW/slty1w1mKw5zwX+gk+BRRRkaRJ8c57l1SBYv/W+QqftETZVkcHBEjSJXrSMgG
	 Kq6rlRNULhQQ1u2YU3kaBIzwrwOHIIbzr76ke6BfQfRd1y3B36m/663nhsZkc3FLr1
	 qW60VceSzoySuVa0AdGWA1RMBi/5XdjqzA/T0nWhf/JSJE22Q/EuiuG0MZGiEHVwVv
	 bZXjl/SWowvwIRGo4FaGy0b6B9tM5zrfKqp6FILJH1owDHTMcOew/mUEFfsF/KFKKY
	 JYJxh5wiQ4sSg==
Date: Thu, 3 Oct 2024 12:33:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 08/11] clk: move meson clk-regmap implementation to
 common code
Message-ID: <20241003-tacking-ladylike-dfe2b633e647@spud>
References: <20241002-private-unequal-33cfa6101338@spud>
 <20241002-hula-unwashed-1c4ddbadbec2@spud>
 <2b49c4df-a34a-42c5-8d44-9e47da630fe8@linaro.org>
 <1jwmiqsks3.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1jwmiqsks3.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_043348_058355_00586E31 
X-CRM114-Status: GOOD (  29.42  )
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
Content-Type: multipart/mixed; boundary="===============4349570543818433964=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4349570543818433964==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uCgVWK9mZdISCwYL"
Content-Disposition: inline


--uCgVWK9mZdISCwYL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 02, 2024 at 03:21:16PM +0200, Jerome Brunet wrote:
> On Wed 02 Oct 2024 at 13:20, Neil Armstrong <neil.armstrong@linaro.org> w=
rote:
>=20
> > On 02/10/2024 12:48, Conor Dooley wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >> I like this one better than qualcomms and wish to use it for the
> >> PolarFire SoC clock drivers.
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> >>   drivers/clk/Kconfig                           |  4 ++
> >>   drivers/clk/Makefile                          |  1 +
> >>   drivers/clk/{meson =3D> }/clk-regmap.c          |  2 +-
> >>   drivers/clk/meson/Kconfig                     | 46 +++++++++--------=
--
> >>   drivers/clk/meson/Makefile                    |  1 -
> >>   drivers/clk/meson/a1-peripherals.c            |  2 +-
> >>   drivers/clk/meson/a1-pll.c                    |  2 +-
> >>   drivers/clk/meson/axg-aoclk.c                 |  2 +-
> >>   drivers/clk/meson/axg-audio.c                 |  2 +-
> >>   drivers/clk/meson/axg.c                       |  2 +-
> >>   drivers/clk/meson/c3-peripherals.c            |  2 +-
> >>   drivers/clk/meson/c3-pll.c                    |  2 +-
> >>   drivers/clk/meson/clk-cpu-dyndiv.c            |  2 +-
> >>   drivers/clk/meson/clk-dualdiv.c               |  2 +-
> >>   drivers/clk/meson/clk-mpll.c                  |  2 +-
> >>   drivers/clk/meson/clk-phase.c                 |  2 +-
> >>   drivers/clk/meson/clk-pll.c                   |  2 +-
> >>   drivers/clk/meson/g12a-aoclk.c                |  2 +-
> >>   drivers/clk/meson/g12a.c                      |  2 +-
> >>   drivers/clk/meson/gxbb-aoclk.c                |  2 +-
> >>   drivers/clk/meson/gxbb.c                      |  2 +-
> >>   drivers/clk/meson/meson-aoclk.h               |  2 +-
> >>   drivers/clk/meson/meson-eeclk.c               |  2 +-
> >>   drivers/clk/meson/meson-eeclk.h               |  2 +-
> >>   drivers/clk/meson/meson8-ddr.c                |  2 +-
> >>   drivers/clk/meson/meson8b.c                   |  2 +-
> >>   drivers/clk/meson/s4-peripherals.c            |  2 +-
> >>   drivers/clk/meson/s4-pll.c                    |  2 +-
> >>   drivers/clk/meson/sclk-div.c                  |  2 +-
> >>   drivers/clk/meson/vclk.h                      |  2 +-
> >>   drivers/clk/meson/vid-pll-div.c               |  2 +-
> >>   .../meson =3D> include/linux/clk}/clk-regmap.h  |  0
> >>   32 files changed, 53 insertions(+), 53 deletions(-)
> >>   rename drivers/clk/{meson =3D> }/clk-regmap.c (99%)
> >>   rename {drivers/clk/meson =3D> include/linux/clk}/clk-regmap.h (100%)
> >>=20
> > <snip>
> >
> > I don't have objections, but I think Stephen didn't like the idea
> > a few years ago, but perhaps it has changed...
> >
> > Anyway, take my:
> > Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
>=20
> We had a similar discussion 3y ago indeed:
> https://lore.kernel.org/linux-clk/162734682512.2368309.120158730107770830=
14@swboyd.mtv.corp.google.com/
>=20
> There are needs for a common regmap backed clocks indeed, but allowing
> meson flavored regmap clocks to spread in the kernel was not really the
> prefered way to do it.=20

Cool, thanks for that link.

> IIRC, Stephen's idea was more the bring regmap support in clk-gate.c,
> clk-mux, etc ... I'm not quite sure how make iomem and regmap co-exist
> in a manageable/maintainable way within those drivers (without adding yet
> another level of abstraction I mean) ? Silently creating a regmap maybe
> ? but that's probably a bit heavy. I did not really had time to dig more
> on this, I guess no one did.

I guess I have some motivation to looking into it at the moment. I had
my reservations about the Meson approach too, liking it more than
Qualcomm's didn't mean I completely liked it.
It was already my intention to implement point b of your mail, had the
general idea here been acceptable, cos that's a divergence from how the
generic clock types (that the driver in question currently uses) work.
And on that note, I just noticed I left the mild-annoyance variable name
"sigh" in the submitted driver changes, which I had used for the
clk_regmap struct that your point b in the link relates to.

> I don't really have a preference one way or the other but if it is going
> to be exposed in 'include/linux', we need to be sure that's how we want
> to do it. With clocks poping in many driver subsystems, it will
> difficult to change afterward.=20

Yeah, I agree. I didn't expect this to go in right away, and I also
didn't want to surge ahead on some rework of the clock types, were
people to hate even the reuse.



--uCgVWK9mZdISCwYL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZv6BFAAKCRB4tDGHoIJi
0jmWAP9z0C6fhBUSC/WWZ6MZddGsLo6oJD3x2WT9TTBT2I9w/wEAs8bEOsrFDfek
0QgAHx+Dw07ysrdYhC0Q1STP5zoaUAI=
=3uTP
-----END PGP SIGNATURE-----

--uCgVWK9mZdISCwYL--


--===============4349570543818433964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4349570543818433964==--

