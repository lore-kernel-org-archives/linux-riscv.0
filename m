Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E421EB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 19:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfscRlxpGracK9qoximo3k1y3f19LJtqvrexTsfn3fw=; b=fA4MGul4AMDVmdYOiK78xjXGtV
	zNGbFrzOtvAGLrkPRJIlTYupnc6xZBclStQNCxQgpqS8xoOf9OMoN0sS0hvJtaINGMaVS7VdT6bis
	kW+gcxW57deHgu8b+IBXCaV4bzkuY5QsTohXCRYAfQDPMqFLt4Zyzkm5TGRH/J/6KoyXXpNXSmake
	IyLP9vH9CSFBQ4Sn8t+DgR6eot6F9cxYvLkwcf8H1Eep4IFrfmUhAH47ttpcLpDaWKKoSo8/ko0O0
	xHZxr7An59v/OPvuo7hd6ldJ3e++Yqfz30C3FmjL7eg5zjT/gFp/Ak+vhB0Wxgui+mCs0CPZR8uFp
	f6FAO1NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q99Wa-008xYe-24;
	Tue, 13 Jun 2023 19:17:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q99WX-008xXn-1s
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 19:17:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 465E3634EB;
	Tue, 13 Jun 2023 19:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48515C433F1;
	Tue, 13 Jun 2023 19:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686683867;
	bh=oD280Kq4hv47N+S/pekjBlHMpeiY3mor5pFjsES0eBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GFaMCiooc9xqA+b6v8Ydxm4bW3t48zVN7o+ZLd9NGw0ecZInTVWNcNVsWdohpUWeo
	 7gyZ+f7Fvo+wbFePOydPko9zAxcfOd9DIrYPdthKHDBIeCVt4ky2Ij8rwjLsNHQubN
	 xD8g7S9oYJDWPtaqKcvrJQuI2BM5Th+SNP49XhZ/8Odl42JApkWMPYNhpk7Ew8WaDY
	 EG8c8EXeDjvhfvXO1CRLI6P6m0PV9kVbx1JOM/88yXzfkbaRfxamz9PEnqw/v4zPYN
	 pU+F39Ep5YJVdAkMNbgHDVeg1/P0gISYAIbp2N+sQCLKy/NZxNoWjLI7j3YTD/Bkk9
	 RImaTm1CyiEPA==
Date: Tue, 13 Jun 2023 20:17:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 3/7] dt-bindings: clock: jh7110-syscrg: Add PLL clock
 inputs
Message-ID: <20230613-vessel-gallantly-d8c7393c9aca@spud>
References: <20230613125852.211636-1-xingyu.wu@starfivetech.com>
 <20230613125852.211636-4-xingyu.wu@starfivetech.com>
 <75508c4d-d86e-f88f-191f-dd870ebe7bd7@linaro.org>
MIME-Version: 1.0
In-Reply-To: <75508c4d-d86e-f88f-191f-dd870ebe7bd7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_121749_713692_4FADC0B4 
X-CRM114-Status: GOOD (  13.32  )
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
Content-Type: multipart/mixed; boundary="===============8071156986419160796=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8071156986419160796==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4FpC5bN6KyvzAt5G"
Content-Disposition: inline


--4FpC5bN6KyvzAt5G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 08:34:25PM +0200, Krzysztof Kozlowski wrote:
> On 13/06/2023 14:58, Xingyu Wu wrote:
> > Add optional PLL clock inputs from PLL clock generator.
>=20
> Are you sure that PLLs are optional? Usually they are not...

They're not. What's happening here is the original binding was defined
without these clocks (obviously, since they're only being added now) so
for the driver they are still "optional" to keep compatibility.
In mainline, the driver takes the "osc" input and registers some
fixed-factor clocks to mimic these PLLs & after this patchset that is
only done as a fallback if the clock inputs to the clock controller,
=66rom the PLLs, are missing.
They should not be optional in the dt-binding because they're not
optional in the hardware afaik!

Cheers,
Conor.

--4FpC5bN6KyvzAt5G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIjA1QAKCRB4tDGHoIJi
0olYAQCUKGw49UtQ9fn/beKhbR7EyT1pRj5cgqbV4cYpDu9U9AEAqbt+eklBEBlT
/UHn1MIfOjSf0NW68hlORp8JzD6gSgw=
=aTi3
-----END PGP SIGNATURE-----

--4FpC5bN6KyvzAt5G--


--===============8071156986419160796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8071156986419160796==--

