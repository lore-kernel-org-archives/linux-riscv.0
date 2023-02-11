Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51D1C61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Feb 2023 11:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zu4jnSNeFh7AlQ1lNLnXWnzudp4lTH010GsvJjEEU7c=; b=B31gc+L/eUUgejvZ1KN0MFQx+K
	mjNVLMrP4DxLJ91ap6dF7Tb486z6DSc/m5KFPHtq7oOA5oSZBS/FWDWqHLF8Yc6lt9NeWds2KaRwG
	3KXEQI7tt38oKMhCX6L/CACEW3XY5DksOq0VFkESk6FitbFl7oKA5Xs9dRdbSROQISs0sQ7b4WTzr
	CcHLWM0ZW6eZUKHrx3aXwWpC4UX8+RPEN/NucGMis0TISwPjZBdxyLIG/WISE7YlsGKqwS0igysek
	r6JPngPWaNsnDPFrDjJNbAkoxNJFwjgnFASIQMmCWCb+RVn84uIMTXRVLqOjcgOOEMXsN4M3w1F89
	A5lKqjqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQnng-009Gt1-8V; Sat, 11 Feb 2023 11:12:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQnnV-009Goo-Gw; Sat, 11 Feb 2023 11:12:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 735DB60BD3;
	Sat, 11 Feb 2023 11:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A369CC433D2;
	Sat, 11 Feb 2023 11:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676113905;
	bh=bSc3QDkye7G9brveSsTMHHaP4EPwwtXKdg0WmqV1umU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CiCGIO4wHeg6JQxT/y7YBpqTzyXtJIUzaPGd8SF3pY2iHyGGEh/nbleA0AtbQuMEq
	 KReZiJB6MGrKU3+tqOh2Xu19WAwTUHm3J9B3Y1MB9ST+ZI+eNrGdRYUbtXHpCzT21p
	 ezPENxYiFLSp9XY5SFryvk8vLyW5VgR7IJP/PrTzMeMNe+F3OkrIpqqw6dJOXsA54E
	 aCDnTABvUhX45PQ2F5pdim+GVjCBdUCRWjdbtuCZ0ZoIx2o/h/2g2utpJNXgwXmn/x
	 /Ru0ZgBBu8rmvTwXqq6DbwgY9USXxd8jMtPJvOqUObEyXSzpCV8Y0pa7xI+RwqWKd1
	 AwYvY5oQgxWdw==
Date: Sat, 11 Feb 2023 11:11:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	arnd@arndb.de, prabhakar.csengg@gmail.com
Subject: Re: [PATCH 00/12] Enable networking support for StarFive JH7100 SoC
Message-ID: <Y+d36nz0xdfXmDI1@spud>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_031201_683811_2CF272A7 
X-CRM114-Status: GOOD (  23.54  )
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
Content-Type: multipart/mixed; boundary="===============5643907748467845842=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5643907748467845842==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j1FzqJZn+VPtvkJp"
Content-Disposition: inline


--j1FzqJZn+VPtvkJp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Cristian!

+CC Arnd, Prabhakar

On Sat, Feb 11, 2023 at 05:18:09AM +0200, Cristian Ciocaltea wrote:
> This patch series adds ethernet support for the StarFive JH7100 SoC and=
=20
> makes it available for the StarFive VisionFive V1 and BeagleV Starlight=
=20
> boards, although I could only validate on the former SBC.
>=20
> The work is heavily based on the reference implementation [1] and require=
s=20
> the non-coherent DMA support provided by Emil via the Sifive Composable=
=20
> Cache controller.
>=20
> Also note there is an overlap in "[PATCH 08/12] net: stmmac: Add glue lay=
er=20
> for StarFive JH7100 SoC" with the Yanhong Wang's upstreaming attempt [2]:
> "[PATCH v4 5/7] net: stmmac: Add glue layer for StarFive JH7110 SoCs".=20
>=20
> Since I cannot test the JH7110 SoC, I dropped the support for it from Emi=
l's
> variant of the stmmac glue layer. Hence, we might need a bit of coordinat=
ion
> in order to get this properly merged.

To be honest, that one is the least of your worries sequencing wise.
Anything doing non-coherent DMA on RISC-V that doesn't use instructions is
dependant on Prabhakar's series:
https://lore.kernel.org/linux-riscv/20230106185526.260163-1-prabhakar.mahad=
ev-lad.rj@bp.renesas.com/#t
That's kinda stalled out though, waiting on Arnd to make some changes to
the cross-arch DMA code:
https://lore.kernel.org/linux-riscv/ea4cb121-97e9-4365-861a-b3635fd34721@ap=
p.fastmail.com/

I was talking to Emil about the non-coherent support at FOSDEM actually,
and I see no real reason not to bring the JH7100 non-coherent support in
if we are doing it for other SoCs.

So yeah, hopefully we shall get there at some point soonTM...

Sorry,
Conor.

> [1] https://github.com/starfive-tech/linux/commits/visionfive
> [2] https://lore.kernel.org/linux-riscv/20230118061701.30047-6-yanhong.wa=
ng@starfivetech.com/
>=20
> Cristian Ciocaltea (7):
>   dt-bindings: riscv: sifive-ccache: Add compatible for StarFive JH7100
>     SoC
>   dt-bindings: riscv: sifive-ccache: Add 'uncached-offset' property
>   dt-bindings: net: Add StarFive JH7100 SoC
>   riscv: dts: starfive: Add dma-noncoherent for JH7100 SoC
>   riscv: dts: starfive: jh7100: Add ccache DT node
>   riscv: dts: starfive: jh7100: Add sysmain and gmac DT nodes
>   riscv: dts: starfive: jh7100-common: Setup pinmux and enable gmac
>=20
> Emil Renner Berthing (5):
>   soc: sifive: ccache: Add StarFive JH7100 support
>   soc: sifive: ccache: Add non-coherent DMA handling
>   riscv: Implement non-coherent DMA support via SiFive cache flushing
>   dt-bindings: mfd: syscon: Add StarFive JH7100 sysmain compatible
>   net: stmmac: Add glue layer for StarFive JH7100 SoC
>=20
>  .../devicetree/bindings/mfd/syscon.yaml       |   1 +
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  15 +-
>  .../bindings/net/starfive,jh7100-dwmac.yaml   | 106 ++++++++++++
>  .../bindings/riscv/sifive,ccache0.yaml        |  33 +++-
>  MAINTAINERS                                   |   6 +
>  arch/riscv/Kconfig                            |   6 +-
>  .../boot/dts/starfive/jh7100-common.dtsi      |  78 +++++++++
>  arch/riscv/boot/dts/starfive/jh7100.dtsi      |  55 +++++++
>  arch/riscv/mm/dma-noncoherent.c               |  37 ++++-
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 155 ++++++++++++++++++
>  drivers/soc/sifive/Kconfig                    |   1 +
>  drivers/soc/sifive/sifive_ccache.c            |  71 +++++++-
>  include/soc/sifive/sifive_ccache.h            |  21 +++
>  15 files changed, 587 insertions(+), 11 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/starfive,jh7100=
-dwmac.yaml
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
>=20
> --=20
> 2.39.1
>=20

--j1FzqJZn+VPtvkJp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+d36gAKCRB4tDGHoIJi
0tBsAQDdrlFgBWg7PiySc6og9Whrn0zcOLK13yTZBJsgJt+dpQEA7lF2MNYZsVWJ
2GMwFbzf/sF46dzxMbyYAIa8XTMemws=
=Slx1
-----END PGP SIGNATURE-----

--j1FzqJZn+VPtvkJp--


--===============5643907748467845842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5643907748467845842==--

