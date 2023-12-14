Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD1DC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 13:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amRIM745hdyZjulaMCOPodsVv16xEcEllos/Zu9BydQ=; b=jeJdi3v7g/wFnp2DorxAYjbYWq
	SFN9HB69/iAnRWNNSqU0L3zft6Dfx24LcHj/lSfCKnisACSSE0z3JCmq/scQqfod0N+8wMVkOy/Ar
	SpX80yPeFyoFJore84M/mZR9ApV8MI1Vz3L0U9zbsK05L9LoTvVPlJf68Scir1AeHl8Q0nlPQehRq
	iQzvtpJnEqBZFHq5hPWrYLtgVcMG/g6eTflTOGcqqJpzrTyOSwvaj+sjuU9WUco+szqGfdXS5IxLG
	PRu7e6roo1zBt4blA2WHNasu7qFC14kF4LbmKEv0+lDtM1FQcilbseJqF8ICZ5wN4TtjUcJC6zafE
	6V3iJDog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDlaO-000Lta-1G;
	Thu, 14 Dec 2023 13:17:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDlaL-000Lrm-1z
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 13:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9B485CE2408;
	Thu, 14 Dec 2023 13:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2EFFC433C8;
	Thu, 14 Dec 2023 13:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702559821;
	bh=JHyomd0Q9NPn9A6jdZewEr+8uII5CmAyP0V6PrfA4bA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cs7sirs9h0XVwnqWYZLR/SKUFu2N9cpp0Yiz0d+uM6Gx48N7jql/U1q1F0Baw8AK0
	 KAsMhLeqa+jA25Lv7z282d9rx/9Bx3RtE/7rtOpsLo2hAMJVn/cb8uNlOCUh9G1tRa
	 Q4BlAFF9y8gqm4V1uwSrFjju+NkuQAPifpstroy8LPfPit/KVjSN39cF+u1fdTDuFr
	 wxH9zOBWW1Jj+JAaA2/6ttNAWNB3DcevrU39jZyxIV3queyCIejv1lioZzsj2CMqI5
	 YpAEj54TSUVWnVHEfGb4FtOIqjOnmePv+hf2aM31ld4yumAISfJy8yxIVIZjHqK8C8
	 P5OilGkQLL67g==
Date: Thu, 14 Dec 2023 13:16:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND v1 2/7] dt-bindings: can: mpfs: add missing
 required clock
Message-ID: <20231214-tinderbox-paver-d1ff0fc5c428@spud>
References: <20231208-reenter-ajar-b6223e5134b3@spud>
 <20231208-palpitate-passable-c79bacf2036c@spud>
 <20231212-unreeling-depose-8b6b2e032555-mkl@pengutronix.de>
 <20231213-waffle-grueling-3a5c3879395b@spud>
 <20231214-tinderbox-glitzy-60d1936ab85f-mkl@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20231214-tinderbox-glitzy-60d1936ab85f-mkl@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_051705_997958_50A134F2 
X-CRM114-Status: GOOD (  25.94  )
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
Content-Type: multipart/mixed; boundary="===============0632985087042191033=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0632985087042191033==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8sbtDukOq8t99rKn"
Content-Disposition: inline


--8sbtDukOq8t99rKn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 12:31:04PM +0100, Marc Kleine-Budde wrote:
> On 13.12.2023 13:02:49, Conor Dooley wrote:
> > On Tue, Dec 12, 2023 at 09:49:41PM +0100, Marc Kleine-Budde wrote:
> > > On 08.12.2023 17:12:24, Conor Dooley wrote:
> > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > >=20
> > > > The CAN controller on PolarFire SoC has an AHB peripheral clock _an=
d_ a
> > > > CAN bus clock. The bus clock was omitted when the binding was writt=
en,
> > > > but is required for operation. Make up for lost time and add it.
> > > >=20
> > > > Cautionary tale in adding bindings without having implemented a real
> > > > user for them perhaps.
> > > >=20
> > > > Fixes: c878d518d7b6 ("dt-bindings: can: mpfs: document the mpfs CAN=
 controller")
> > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > >  .../devicetree/bindings/net/can/microchip,mpfs-can.yaml    | 7 +++=
++--
> > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/net/can/microchip,mp=
fs-can.yaml b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.=
yaml
> > > > index 45aa3de7cf01..05f680f15b17 100644
> > > > --- a/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.=
yaml
> > > > +++ b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.=
yaml
> > > > @@ -24,7 +24,10 @@ properties:
> > > >      maxItems: 1
> > > > =20
> > > >    clocks:
> > > > -    maxItems: 1
> > > > +    maxItems: 2
> > > > +    items:
> > > > +      - description: AHB peripheral clock
> > > > +      - description: CAN bus clock
> > >=20
> > > Do we we want to have a "clock-names" property, as we need the clock
> > > rate of the CAN bus clock.
> >=20
> > We should not need the clock-names property to be able to get both of
> > the clocks. clk_bulk_get_all() for example should be usable here.
>=20
> ACK, but we need the clock rate of CAN clock. Does this binding check
> that the CAN clock rate is the 2nd one?

The items list requires that the can clock be the second one, so drivers
etc can rely on that ordering.

--8sbtDukOq8t99rKn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXsARwAKCRB4tDGHoIJi
0h9wAP903owgON0b07MdLtwGROU5QzSNFLxoBOqorLvQyAIqpAD+NUlz2g5CmXeF
4jrpFftFyQNgWbQ8mC2atxX5XKUNvA4=
=LB6e
-----END PGP SIGNATURE-----

--8sbtDukOq8t99rKn--


--===============0632985087042191033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0632985087042191033==--

