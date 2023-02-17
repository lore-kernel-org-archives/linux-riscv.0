Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFCDC636D6
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 16:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZlsOBqJQ1/pMY63aBWnCARDIJg5kzHzm/xCaiH3OL8=; b=FUezNBTUc0EzytngdfAMcmvJnC
	dskfkI+HmjYYZ/nB4FFOZtwqT/8cHsDFP8AjuSQANpkuvwFIK4tqs3PlWJ/hS3mMrEFrwErz/nYXb
	6o4ZFO0SJpbscVCZMm/Cnxs2xz4w9fqNz9mC/cbQbP/o7iyQnY1yAl+joyLllntJN1ugbL0mKjtjM
	itdPjbFgYe5ekssVW9PAN+XVLqxaG53bltKRomYt/j3EU1e8bIPO4Ljyeko/D6yKnG9wsN7iRFp6p
	lWQrPMKZ0+ayj6r8WUtRuoBicFyVF3ZQL/QzEOe/hvnNHVQqwO1e1N2CwSL2waOY3yLPf0QhCLBYK
	pS0uWBwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3aP-00F2jS-Cd; Fri, 17 Feb 2023 16:27:49 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3aI-00F2hM-U4
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 16:27:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 424F9B82C76;
	Fri, 17 Feb 2023 16:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319E9C433EF;
	Fri, 17 Feb 2023 16:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676651259;
	bh=/7n/cDvLrD1MXgANvvSLbsLrYC+ZynSXWqXQNtEzktE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JQHjgKLShFCu5HAbOO1K5ZDvuKqqVeT7xE/idx4eN0YIW/K0UasNEHeI3XABJC7I9
	 Vf5wgVsQzkFPIwCfpt3c9eZdigzQg4aNmrJZSGmmiK2lz0UfEvfR/4jjdedtkYDNE1
	 EypnzsRRkRIINmCxlBMRnv6LLfYPj113Outk3HAZifmYM3D12C/SBUJ5jGrsmzmuRp
	 5D3t+Meu4JZbcHIdsLu31iFzIpa4tIukVg3SJZsGOWHlAWdOliy4k4XYnv+Ndj+JYF
	 8+b169D7idvuqlNoQvr5zKdjwlJL5jGkL26fSVg6/dFJtlAOC3MEaUN/ilmSWruiIA
	 xBJgpKnd6Lnsw==
Date: Fri, 17 Feb 2023 16:27:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Message-ID: <Y++q9ln8P3XegqfN@spud>
References: <Y6JB37Pd5TZoGMy4@spud>
 <7a7bccb1-4d47-3d32-36e6-4aab7b5b8dad@starfivetech.com>
 <Y6tSWB2+98a8k9Qw@spud>
 <5cf0fe71-fd17-fb28-c01e-28356081ba76@starfivetech.com>
 <Y+5z8skN2DuvxDEL@spud>
 <68e61f28-daec-ce72-726a-1fffe8e94829@starfivetech.com>
 <Y+8x/KSujhgNLAd6@wendy>
 <d3b06d0b-ff17-ebab-bae5-e1ec836fe667@starfivetech.com>
 <Y++B43uCnPQlRYFi@wendy>
 <dcba75b5-7b62-35aa-6836-5d5edd785002@linaro.org>
MIME-Version: 1.0
In-Reply-To: <dcba75b5-7b62-35aa-6836-5d5edd785002@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_082743_291970_574D962A 
X-CRM114-Status: GOOD (  22.83  )
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
Content-Type: multipart/mixed; boundary="===============7406177593151423581=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7406177593151423581==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SyOFsqOpDx+l/Uu8"
Content-Disposition: inline


--SyOFsqOpDx+l/Uu8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2023 at 04:47:48PM +0100, Krzysztof Kozlowski wrote:
> On 17/02/2023 14:32, Conor Dooley wrote:
> >>>> Yes, it is.
> >>>
> >>> Which would then make GMAC1 RGMII RX optional, rather than required?
> >>
> >> If thinking in this way, I must say yes, it is optional. But actually
> >> GMAC1 RGMII RX feeds gmac1_rx by default.=20
> >> For a mux, it usually works if you populate only one input to it.
> >> Does it mean all the other inputs are optional? And how can we define
> >> which input is required?
> >=20
> > I'm not sure, that is a question for Krzysztof and/or Rob.
>=20
> That's a long thread, please summarize what you ask. Otherwise I have no
> clue what is the question.

Sorry. I tried to preserve the context of the conversation the last time
I cropped it so that things would be contained on one email.

For me at least, I am wondering how you convey that out of a list of
clock inputs (for example a, b, c, d) that two of the clocks are inputs
to a mux and it is only required to provide one of the two (say b & c).

> Does the mux works correctly if clock input is not connected? I mean,
> are you now talking about real hardware or some simplification from SW
> point of view?

I'm coming at this from an angle of "is a StarFive customer going to show
up with a devicetree containing dummy fixed-clocks to satisfy dtbs_check
because they opted to only populate one input to the mux".
I don't really care about implications for the driver, just about
whether the hardware allows for inputs to the mux to be left
un-populated.

Cheers,
Conor.


--SyOFsqOpDx+l/Uu8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY++q5AAKCRB4tDGHoIJi
0of0AP9b4nngiPS2EpyTXEZ+/C7SPEoZpvSl1nRB1hqHGRePTgD/e/wC+yu8sTRR
cTy0Wvob6bxyC4j38a5p5UnXb+ZTtgw=
=Wk+p
-----END PGP SIGNATURE-----

--SyOFsqOpDx+l/Uu8--


--===============7406177593151423581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7406177593151423581==--

