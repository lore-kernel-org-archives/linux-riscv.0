Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65964C77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 19:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9hRfIWNVcHUPQY5iUO5yu8UIg6e8yBYsuaR6r9uRnk=; b=QP5vQXnSXC7Y0L9ZRDuzOkR4MI
	z5Lomcu1XtdhG7gflt3TEaN2kRhGYQ8EmzW2CUfVoePgt9R2YYtTceKYvqHdNS4AGQ+hfRzwHPA2Z
	RxKGHXKSl1UtDRL4qjzdBIU8QX+1to9XnDnKtb/BRE8od9fVG/huCjApboJUhKEFyHMEjI1yAKqjq
	Eqp8yfyxVNb1KxYS/NAUfsess2THM305splQQpilDwW1VKoRmqUoGyt1WKr0seg0P1z1GXxySLXJi
	VP8v19MZCaTgWLM7oow3UzfwGgpSPUxNQIdiBZ05CxN9N1gNsWDIN6YMo2lJd6dCR+SWrRY4iPZxr
	djdwTgQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6Tt-001CJZ-1T;
	Mon, 08 May 2023 19:25:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6Tk-001CI4-2a
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 19:25:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 267D260C41;
	Mon,  8 May 2023 19:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE64C433EF;
	Mon,  8 May 2023 19:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683573899;
	bh=d25zkj4QIGqo1q9tRg60u0/yBs9nIpXewK+TJMWlDW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KLRAJbBdRK515SCcYa1oYJQKak5uw89c+v1lYRyQNEYe9Rku839yD9vkdD2MALzRx
	 2hHmvo3ulnCy9ifr4zGje4M0roh1X+ugpS2Wew0Mk21s/j3Q7PLDgZRSMwqeNTHowm
	 ZXAp5vS02JoKUM3VnHz7HpWTKXZGUv5x+lAJfDay8i2OVmHFCg2+JuqI1++489ye4S
	 b3aR3TcYLOoFpnL92z2zBV0jM/wgZxqhpGFdJsc/mjZLwVFQdB36t2AcFS9KkID6b2
	 FmlnqXnINf0TSEuhagyPh0OX78cdwy95tMDESZOiCGcLN2pXQIvFXUy+K5NjiAcW1a
	 /VAo+mf6lNt/A==
Date: Mon, 8 May 2023 20:24:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 5/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Message-ID: <20230508-margarita-fondling-c9b970ad73a9@spud>
References: <20230414024157.53203-1-xingyu.wu@starfivetech.com>
 <20230414024157.53203-6-xingyu.wu@starfivetech.com>
 <20230424-footsie-compost-d6624c8ef4e8@spud>
MIME-Version: 1.0
In-Reply-To: <20230424-footsie-compost-d6624c8ef4e8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_122500_943063_9F2A8B75 
X-CRM114-Status: GOOD (  27.68  )
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
Content-Type: multipart/mixed; boundary="===============4195947475290816227=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4195947475290816227==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mn9OXjbT0/L5FxUF"
Content-Disposition: inline


--mn9OXjbT0/L5FxUF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2023 at 06:15:47PM +0100, Conor Dooley wrote:
> On Fri, Apr 14, 2023 at 10:41:55AM +0800, Xingyu Wu wrote:
> > From: William Qiu <william.qiu@starfivetech.com>
> >=20
> > Add documentation to describe StarFive System Controller Registers.
> >=20
> > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> > ---
> >  .../soc/starfive/starfive,jh7110-syscon.yaml  | 58 +++++++++++++++++++
> >  MAINTAINERS                                   |  6 ++
> >  2 files changed, 64 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/starfive/star=
five,jh7110-syscon.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh=
7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,=
jh7110-syscon.yaml
> > new file mode 100644
> > index 000000000000..de086e74a229
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-sy=
scon.yaml
> > @@ -0,0 +1,58 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-syscon=
=2Eyaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive JH7110 SoC system controller
> > +
> > +maintainers:
> > +  - William Qiu <william.qiu@starfivetech.com>
> > +
> > +description: |
> > +  The StarFive JH7110 SoC system controller provides register informat=
ion such
> > +  as offset, mask and shift to configure related modules such as MMC a=
nd PCIe.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - starfive,jh7110-aon-syscon
> > +              - starfive,jh7110-sys-syscon
> > +          - const: syscon
> > +          - const: simple-mfd
> > +      - items:
> > +          - const: starfive,jh7110-stg-syscon
> > +          - const: syscon
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clock-controller:
> > +    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
> > +    type: object
> > +
> > +  power-controller:
> > +    $ref: /schemas/power/starfive,jh7110-pmu.yaml#
> > +    type: object
>=20
> My plan was to grab this patch after the merge window, but there's been
> some back and forth [1] about what exactly should be a power-controller
> here. Given the merge window is open & I know Emil wants to look at the
> various clock bits for the JH7110, I don't think there's a pressing need
> for you to do anything here, but figured I'd at least mention how things
> are going on this thread too.

To follow up on this, it transpired in that thread that this node, not a
child node, should be the power controller.

Up to you StarFive folk how you wish to resend, but I am fine with it
being in this series, I shall just not pick up the soc driver patches
until the resent binding is applied by Stephen.

Thanks,
Conor.

--mn9OXjbT0/L5FxUF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFlMhQAKCRB4tDGHoIJi
0qDRAQC/Oe6fBxsiKfuTm43qtFROX9XPTmdIibQnwwOi+PzIEQD8DfYgZYAzC53a
PgLCy7zOEWGuwYyL6gtESmlBXNsYlQY=
=Nsa4
-----END PGP SIGNATURE-----

--mn9OXjbT0/L5FxUF--


--===============4195947475290816227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4195947475290816227==--

