Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99373C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Dec 2022 14:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wrLSZhjhLxhKhuKMmXR7hbm57oaf6feDvRjx7QCbMU=; b=jP60PNAYk0THVeTK9qp1vGlFUX
	uIFlJGxM0WchoFae8WMTDT5H2le8pm2ust8kswwF79RDzMcKJsOlrfR0Afk+P8WKCA/xkX4jCosWg
	gbvcs2nHcAqyDAsHfhmXX60VCHWJ7ySyg5PdR5E13JGBfqXU5WQ2puGxKlIPCG+AhQnCYiHqZAjQS
	5ryzBRx62lPtCFydusgodVyLfhn/QGEBPvLMGpu0CEmhUmqFRwCzA4nak1+oWf9era0cSrZMJTfLT
	NgIPjdmk6zy7Y3XFgteA72UOW0R6yC08RlnoQYedaH5yAj+cNVYxPU3ifKMwKbEZ883Ds8DOV3xC+
	3WUiFHAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAAp8-00Dbtx-NW; Tue, 27 Dec 2022 14:20:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAAp3-00Dbr7-CB
	for linux-riscv@lists.infradead.org; Tue, 27 Dec 2022 14:20:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 413146115D;
	Tue, 27 Dec 2022 14:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC432C433EF;
	Tue, 27 Dec 2022 14:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672150851;
	bh=eszlHNnwyNqenWwhKzQ+6Bi2gaQg/fCsFC2uNABjCnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YjNkSZobSLITUsrFDYjjw5wWsL5+U+K1fNc+qPZLS4I3pTDDKea1l7/BVRuqMabBH
	 IYcUeJVMXeF2SourDqOTfpVeitr9w3SEGC3Exx5duAKS1ePBqb3JgtGnOhuIBFBp/y
	 m5651OY2LIOGPN4G9tw7k4lTgLsyS5zVKroND//oZFHNUILRaPj8+liO7kXw08+Em4
	 yCIPvOmAa5p0lvMvIaFHRtO/aC0io+9/ye7yo2S95nXy3LLRbGGXeQ0ljbdCONj+1Q
	 nhmHBf9DA6yZ7mbIykq02XytDyrR9xAtblDkOJxOCijvRhKm00X70eLFqD5XD0dT/J
	 tHB1wVY+Yjd2A==
Date: Tue, 27 Dec 2022 14:20:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
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
Subject: Re: [PATCH v3 0/7] Basic device tree support for StarFive JH7110
 RISC-V SoC
Message-ID: <Y6r/Pa6mxzIiYnuC@spud>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <Y6on34WC2u3PSBHl@spud>
 <7cc1078e-744a-c68f-98d2-6c68d2784df2@linaro.org>
MIME-Version: 1.0
In-Reply-To: <7cc1078e-744a-c68f-98d2-6c68d2784df2@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_062053_667948_2858CD36 
X-CRM114-Status: GOOD (  12.95  )
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
Content-Type: multipart/mixed; boundary="===============1525202904864884454=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1525202904864884454==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FU7aTXDCvLLRKW0J"
Content-Disposition: inline


--FU7aTXDCvLLRKW0J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 27, 2022 at 08:58:01AM +0100, Krzysztof Kozlowski wrote:
> On 27/12/2022 00:01, Conor Dooley wrote:
> > On Tue, Dec 20, 2022 at 09:12:40AM +0800, Hal Feng wrote:
> > The DT is waiting for the clock/reset & pinctrl binding headers anyway,
>=20
> Which were sent with build warnings/errors...

Yah, DW chief - I'm not in a rush. Figure it'll take a few more
iterations.

Errors/warnings aside, responding to the clock series again is in my
todo list, not convinced by the clock binding itself.


--FU7aTXDCvLLRKW0J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6r/HgAKCRB4tDGHoIJi
0gYeAQCeWz9Cz2cqX8w05FRvSFr+0vhC8blylBRMdd0k4kNzCwD/RcbCjRaC4y1l
3MMyFlRE9sQKhQSovtr0C9rIztbO9wI=
=anTB
-----END PGP SIGNATURE-----

--FU7aTXDCvLLRKW0J--


--===============1525202904864884454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1525202904864884454==--

