Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C7FC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 19:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kJ/gpgAiS3iZT1imgmaIcx/BwZWuO+waHtU76tJ4EY=; b=B38x61hgMWmc0WhrWT0cb/K5Me
	QacpU01Wty0ptzFRInXi8rsHC8310XkDfd8OwDrBFAcsnFtrDIU/h49PCA+4BmETWAPwrRnLnxavc
	kUwBuBGqJABI+/ngxeo+waIOynmcnfhUZLVvAakt3jzH0W77QjYngoiifszftQ3XaW+SQM8gSv/B+
	nuAzCktZnkZwktBt0wUvcTCRNCdPj8N5/o5e8F8R/KQzw5X5yksbX939rULINPb2VO6iJjtBoXxyk
	7hS1gvuEeYoyP8nspIJ+k2B7c13ZjvJl71OFKSUl35w2pXpK03zaTBBM5N+4vRYkI/KNtMbJtj690
	DoHM8uMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBgTy-00GNlP-1t;
	Fri, 08 Dec 2023 19:25:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBgTw-00GNkG-0N
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 19:25:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 39263B82E90;
	Fri,  8 Dec 2023 19:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68266C433C8;
	Fri,  8 Dec 2023 19:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702063545;
	bh=z3otdfwGLX1f2a+SvSkMwMZKGTLN4cY6uigJoIFO8gc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dQhKPK3QFPl9Y4y8sbGGByFaxlfrHHBrDeR2t0nRF+ZSY8oHD2YtQlpfSwS0bUcMC
	 5cQbG0I+RUkaUbSqsYWyajZrzXiTtDF3inTnntumVRtejuFCXVALMmWg+0cwc1iUpk
	 Z+r8QBYBA7qb9jB6svwH93w66rJkBtDOofMbrFrQyPZFuQ6SjeogAahQSRKSzpKReZ
	 XW8f3hgrcG3j8RrKzzKnZfymmieb9DV7tyw5upJM6+HL9wL6FFIb4JqzfjNbPHJ3Du
	 EaEioV1pHZ4HoRPRU6nZSC8ZpzJibUXbQQDMxwLTvjV/6LSmWW9broVCN4UAwM8MaI
	 8ZeKPanJ7KM/A==
Date: Fri, 8 Dec 2023 19:25:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, linux-can@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, Eric Dumazet <edumazet@google.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH RESEND v1 2/7] dt-bindings: can: mpfs: add missing
 required clock
Message-ID: <20231208-contusion-professed-3b2235f7d3df@spud>
References: <20231208-reenter-ajar-b6223e5134b3@spud>
 <20231208-palpitate-passable-c79bacf2036c@spud>
 <170206026051.2485962.13304186324857333888.robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <170206026051.2485962.13304186324857333888.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_112552_485391_64271BEB 
X-CRM114-Status: GOOD (  16.27  )
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
Content-Type: multipart/mixed; boundary="===============8505123297446814150=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8505123297446814150==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LcNsrkCtTh9NwKDb"
Content-Disposition: inline


--LcNsrkCtTh9NwKDb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 12:31:00PM -0600, Rob Herring wrote:
>=20
> On Fri, 08 Dec 2023 17:12:24 +0000, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > The CAN controller on PolarFire SoC has an AHB peripheral clock _and_ a
> > CAN bus clock. The bus clock was omitted when the binding was written,
> > but is required for operation. Make up for lost time and add it.
> >=20
> > Cautionary tale in adding bindings without having implemented a real
> > user for them perhaps.
> >=20
> > Fixes: c878d518d7b6 ("dt-bindings: can: mpfs: document the mpfs CAN con=
troller")
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../devicetree/bindings/net/can/microchip,mpfs-can.yaml    | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >=20
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/can/microchip,mpfs-can.yaml: properties:clocks: {'maxItems': 2, 'items':=
 [{'description': 'AHB peripheral clock'}, {'description': 'CAN bus clock'}=
]} should not be valid under {'required': ['maxItems']}
> 	hint: "maxItems" is not needed with an "items" list
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#


Oh dear, me of all people.

--LcNsrkCtTh9NwKDb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXNtsgAKCRB4tDGHoIJi
0oSOAQCwrHN/7yWhuuIG7o8zyiDD3sQh9O0ObhobDPMiwzstNAEAwZYfqSjCNUqo
PRSO8gA7E/ILMPQQJKcY+VOri+ewwAg=
=IQnv
-----END PGP SIGNATURE-----

--LcNsrkCtTh9NwKDb--


--===============8505123297446814150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8505123297446814150==--

