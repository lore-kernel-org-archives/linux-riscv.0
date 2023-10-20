Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D48EC001DF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 14:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsGmN9PfMoQYpzRG+CVzea0aafMjnvPPN3FnONP4W2I=; b=ZvuuDgUL/1IvMI6P/39JrZuZA8
	+Iih5Jp80uuAOrOauHNoISZUJz20qym8/julsfuGixOOh5mtNwIcIwtXX4D7y5ahewD469wA61S+5
	sIKb+/1hSMs64KPtqfvV9OffNIX19kRk12/q23H+6EINaE3sk8HfRFqhqTnW5/3aPutQlDd4dKGY3
	CNgMHscNCO9kfDo3lA5Ze+bi8pmKk8IGCUXIHw46iM+a/PSlaMlbmbiWC3qm+lHRY8EBeKiOPSpBF
	XfFr7vOq/yjT4nKSEIJlq720rRrgTursR8NxI14uwPtxy2k2R/xSNFKio0ruT+H9saLZYJftAhMmw
	iJUSdl4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtqOW-002Tpf-0Y;
	Fri, 20 Oct 2023 14:22:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtqOT-002Tos-0H
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 14:22:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B25C621AA;
	Fri, 20 Oct 2023 14:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A46C433C8;
	Fri, 20 Oct 2023 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697811748;
	bh=y3RAlabMY9JfTgyKPsrGaRZGjnShxDjVRxHtg+L1yjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fNnUhRbK+JboDV8tfL1tmzlR4KdmkFxGZ73HsT6T66jO+mArOuodvbWbdQvugMyVl
	 Dq7rD4NAo4a+nX5l9vo/xDgXyVjhicQJ6tXnyz2xNEeB1WbDH0CWzTBipTJ5AhGvMJ
	 lumjTMwCPLR3cTD+qu+QujvDiZNiRZCXtGn1uS+x+BVS4vhEnhB1zSf8l7T0Qip7bl
	 HAwscskfBoTQSNfQtRyM5FSGOgVm8KbJCinUfMsPU2Q5bFKdobS4ww92urYT4nG+0K
	 zh/U9isAFFV8AvrmNxR8I5gYywJsB9NdEo2ahVN2eYGV+MdaWlV3moxDsOzApP5mfP
	 1f+njzJbKZLTw==
Date: Fri, 20 Oct 2023 15:22:22 +0100
From: Conor Dooley <conor@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Hal Feng <hal.feng@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v6 1/4] dt-bindings: pwm: Add OpenCores PWM module
Message-ID: <20231020-giddy-fidgety-f070ef121ff2@spud>
References: <20231020103741.557735-1-william.qiu@starfivetech.com>
 <20231020103741.557735-2-william.qiu@starfivetech.com>
 <20231020-barley-rosy-92c3688cd515@spud>
MIME-Version: 1.0
In-Reply-To: <20231020-barley-rosy-92c3688cd515@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_072229_266485_CD82FD0B 
X-CRM114-Status: GOOD (  20.38  )
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
Content-Type: multipart/mixed; boundary="===============0559578186769080370=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0559578186769080370==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3KQTc1pnS1DLeim4"
Content-Disposition: inline


--3KQTc1pnS1DLeim4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 03:21:15PM +0100, Conor Dooley wrote:
> Krzysztof, William,
>=20
> On Fri, Oct 20, 2023 at 06:37:38PM +0800, William Qiu wrote:
> > Add documentation to describe OpenCores Pulse Width Modulation
> > controller driver.
> >=20
> > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  .../bindings/pwm/opencores,pwm-ocores.yaml    | 53 +++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pwm/opencores,pwm=
-ocores.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/pwm/opencores,pwm-ocores=
=2Eyaml b/Documentation/devicetree/bindings/pwm/opencores,pwm-ocores.yaml
> > new file mode 100644
> > index 000000000000..0f6a3434f155
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/opencores,pwm-ocores.yaml
> > @@ -0,0 +1,53 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pwm/opencores,pwm-ocores.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: OpenCores PWM controller
> > +
> > +maintainers:
> > +  - William Qiu <william.qiu@starfivetech.com>
> > +
> > +description:
> > +  OpenCores PTC ip core contains a PWM controller. When operating in P=
WM mode, the PTC core
> > +  generates binary signal with user-programmable low and high periods.=
 All PTC counters and
> > +  registers are 32-bit.
> > +
> > +allOf:
> > +  - $ref: pwm.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - opencores,pwm-ocores
>=20
> What does the extra "ocores" suffix add, when it just repeats the vendor
> prefix?
>=20
> > +      - starfive,jh71x0-pwm
>=20
> Krzysztof, did you approve this generic compatible?
>=20
> And the whole thing looks like it should really be something like
>=20
> items:
>   - enum:
>       - starfive,jh7100-pwm
>       - starfive,jh7110-pwm
>   - const: opencores,pwm

(assuming that the opencores,pwm compatible represents a subset of what
is implemented on the jh7100 series)

--3KQTc1pnS1DLeim4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTKNHgAKCRB4tDGHoIJi
0s/HAP9VaJ5WdJWYuB+hx/HBT2bzsFHQFABLh7Gf7UltL5GDvwEAvAd8PHGeD+hI
/NZSW+d6MZdv9Im1y532IWKhqIM2Hw8=
=nKRH
-----END PGP SIGNATURE-----

--3KQTc1pnS1DLeim4--


--===============0559578186769080370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0559578186769080370==--

