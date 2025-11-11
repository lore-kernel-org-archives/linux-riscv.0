Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB367CCFA1A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 16:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pl5tYY5bon52UuXE6y6b/Q9J0ldHM+gAD8HGmR8Huxc=; b=NobHlj9bsKWKJEDFnHyV6sxDDl
	bUBrRFZ7Y+mBgBqn5+yfgN8LpdJXNpfebmo7TtxY1X6LGmMa2b+unN9eJ8Vy77XF+0Q4Apv5ogdvB
	exiEpHkwMOQonJM7HU4Bji7l8HyQmNwA727B04UkT+qb28irSx3bVrspQiG9YlZfvC9BsGRKuWexM
	kIKwDuJoXYvJXLhifkg9aCXEa36QzI4jlr7dlBqVLg2GanugYYv88EMYjot/PTmyCUPwtODARXFLj
	4PWE2YMtz/+mZuC5yF6o7ZbWu1j4GfGEnGisIoqsFms5a2v5qvx/5jtj9ECmZ/p48woTjACW8ET5E
	R9DZ+NmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrVv-00000007U7q-1fvv;
	Tue, 11 Nov 2025 16:46:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrVt-00000007U7E-3Rvq
	for linux-riscv@lists.infradead.org;
	Tue, 11 Nov 2025 16:46:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C85C74061F;
	Tue, 11 Nov 2025 16:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1597CC4CEFB;
	Tue, 11 Nov 2025 16:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762879596;
	bh=jeDtFvGUXIuVgUDPgyVS9vBhjXcXU//Cn4BpthaOkM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=leINhPUnfTtmVDkHrVZuiuhH38TSZeyEd+IyIWhXZV5UYD4/CMbUIw+80GBULpBci
	 OdzhLsUuct8gS9MljKSePHzRtP+uWmuVVcmoTFmeU2wTbb68i/huv5Zi4xYkv2Bjei
	 WoqnrW20p5qK89MuNndzjPVctflnmm1pEqp2JZ5+kvjCnrUD3nWWq5v0ylMN4Y5eci
	 EwhHhIyRxpqjLBtT9DayUNOGF+1aOfVJobfW+UFDVJGFJEClkfBPj9scudgvc/RRR2
	 f1Rr4Sbz2BLL7NhetWqTQiO9lVb4yzuH+2VHcyRAFKtSBIqe+7JFPNX3DhyqF7eSes
	 DXRdIwDAA1e8Q==
Date: Tue, 11 Nov 2025 16:46:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: claudiu.beznea@tuxon.dev, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/5] reset: mpfs: add non-auxiliary bus probing
Message-ID: <20251111-apron-dispersal-6bd72d4a41a1@spud>
References: <20251110-zookeeper-femur-68a0ae346397@spud>
 <20251110-evict-gratified-bb816e2799a2@spud>
 <2fabead977bee651800790f6b0d6323ffdc372c5.camel@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <2fabead977bee651800790f6b0d6323ffdc372c5.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_084637_882987_31AAC528 
X-CRM114-Status: GOOD (  10.56  )
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
Content-Type: multipart/mixed; boundary="===============5705705762485432977=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5705705762485432977==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ONeNsy8hStpVyMW+"
Content-Disposition: inline


--ONeNsy8hStpVyMW+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 12:34:16PM +0100, Philipp Zabel wrote:
> On Mo, 2025-11-10 at 11:23 +0000, Conor Dooley wrote:
>=20
> With the superfluous cleanup include fixed.
>=20
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>=20
> and
>=20
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
>=20
> to be merged with the reset of the series.

Cool, I have dropped the include and pushed the patch to the
clk-microchip branch:
https://git.kernel.org/at91/c/4a75fcd2000e1af452343aac6e34387f8e794f37

I opted to leave the include of regmap.h in mpfs.h unchanged.

Cheers,
Conor.

--ONeNsy8hStpVyMW+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRNoZAAKCRB4tDGHoIJi
0u/OAP4opIygXiE1msTAsenTF2y3vFMINksWzjFlo4txUmVtAwEApW/hg6Lu/LrI
Q6y1spEYrjz9xkO8cWWj/Le7Z07Cuw8=
=G7cd
-----END PGP SIGNATURE-----

--ONeNsy8hStpVyMW+--


--===============5705705762485432977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5705705762485432977==--

