Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE4CEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 07:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogosxnBZhrkm6rgXwbkgx+3apTC8dIM+cXOt/WGIlWw=; b=hTKFHTpuQHWlHtcOHYsDlji8ZU
	3+x7i7O5cVNLoKITjLvzziBhhMV3HjGnNEEwmEqjY6yVJGR2p6bP60/8F5al1L2+f/9+w+jD5xPcn
	Gy3cgNJkxsY714dlux4KMGoXcaG0+9NBEzkyysmqa6qkr2fEgFGKm8VzFDQoKrAbxtgXwukL0+RfU
	PZ34uiDjsqjeli88FLsVzy8boFJxGa4OamOwCs3ICtSIazz4qDcm/YhWTsQPgB5T4ymGph3yTvttC
	qfvJEnNAc1hfN5MRgUMkbV+d9hGzZ+V0wkcUcn6QHH68dFAqKpdB/lv6Ggg+Gbhc8MXpuupMQ30wR
	RU74TFqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPHYS-00239b-0S;
	Fri, 28 Jul 2023 07:06:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPHYP-00238Z-1Q
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 07:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690527985; x=1722063985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YV/HherCTDGw+ls4/jLdsAyaf6VBOQkF2Uf7NZiBfII=;
  b=WQP/BC+00hmQAj2QkA+0SPtlcQzErmCG+jmPXpM85yNL+EV2X5HCfxj5
   /8a5pUG+ptFu1wjDXUDaHX8L7GnIIV+AaXtjrRAszlhLGB9JuE5MgSpko
   KczGV19hrJw8S4lWB2Qgy31qRuRwxB/9HcFa/Ipq1XZmzmJtMSaCFXYS3
   Ic8fSTipn3JkMqS+lYXTl6DxA7iGglZvDroDGUjZBaBMd0bGEVuz06mPp
   gcZ8QliWvrJcn5hDhR161SX1GHL6eigx4IRCv7RZ2lJdEX9y2nWyOsHb1
   BGXEzFZDr3rpTE1nP63G0qGMrAp5pmK/QvujsLc/j/Y8pcgWfGMN6DGhB
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="asc'?scan'208";a="227027311"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2023 00:06:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 28 Jul 2023 00:06:23 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 28 Jul 2023 00:06:20 -0700
Date: Fri, 28 Jul 2023 08:05:46 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>
CC: Eric Lin <eric.lin@sifive.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <tglx@linutronix.de>, <peterz@infradead.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <zong.li@sifive.com>,
	<greentime.hu@sifive.com>, <vincent.chen@sifive.com>, Nick Hu
	<nick.hu@sifive.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
Message-ID: <20230728-facedown-husked-9813fa79d9a0@wendy>
References: <20230720135125.21240-1-eric.lin@sifive.com>
 <20230720135125.21240-2-eric.lin@sifive.com>
 <20230720-slept-guru-216e2803061e@spud>
MIME-Version: 1.0
In-Reply-To: <20230720-slept-guru-216e2803061e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_000625_539832_BF1AE403 
X-CRM114-Status: GOOD (  20.92  )
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
Content-Type: multipart/mixed; boundary="===============4060628008783196990=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4060628008783196990==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CLBf1mcbqLUt7ULL"
Content-Disposition: inline

--CLBf1mcbqLUt7ULL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 06:10:51PM +0100, Conor Dooley wrote:
> Hey Eric,
>=20
> On Thu, Jul 20, 2023 at 09:51:19PM +0800, Eric Lin wrote:
> > This add YAML DT binding documentation for SiFive Private L2
> > cache controller
> >=20
> > Signed-off-by: Eric Lin <eric.lin@sifive.com>
> > Reviewed-by: Zong Li <zong.li@sifive.com>
> > Reviewed-by: Nick Hu <nick.hu@sifive.com>
> > ---
> >  .../bindings/cache/sifive,pl2cache.yaml       | 62 +++++++++++++++++++
>=20
> btw, your $subject should be "dt-bindings: cache: ...." rather than
> "riscv: sifive".
>=20
> >  1 file changed, 62 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/cache/sifive,pl2c=
ache.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/cache/sifive,pl2cache.ya=
ml b/Documentation/devicetree/bindings/cache/sifive,pl2cache.yaml
> > new file mode 100644
> > index 000000000000..ee8356c5eeee
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/cache/sifive,pl2cache.yaml
> > @@ -0,0 +1,62 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (C) 2023 SiFive, Inc.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SiFive Private L2 Cache Controller
> > +
> > +maintainers:
> > +  - Greentime Hu  <greentime.hu@sifive.com>
> > +  - Eric Lin  <eric.lin@sifive.com>
>=20
> There's extra spaces in these lines for some reason.
>=20
> > +
> > +description:
> > +  The SiFive Private L2 Cache Controller is per core and
> > +  communicates with both the upstream L1 caches and
> > +  downstream L3 cache or memory, enabling a high-performance
> > +  cache subsystem.
> > +
> > +allOf:
> > +  - $ref: /schemas/cache-controller.yaml#
> > +
>=20
> I'm pretty sure that I pointed out last time around that you need to add
> something like in the ccache driver:
>=20
> select:
>   properties:
>     compatible:
>       contains:
>         enum:
>           - sifive,ccache0
>           - sifive,fu540-c000-ccache
>           - sifive,fu740-c000-ccache
>=20
> otherwise this binding will be used for anything containing "cache" in
> the dt-binding.
> For this binding, I think that the following is sufficient:
>=20
> select:
>   properties:
>     compatible:
>       contains:
>           const: sifive,pl2cache1
>=20
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: sifive,pl2cache1
> > +      - const: cache
>=20
> You omitted the pl2cache0 from here, that needs to come back! You'll end
> up with 2 items entries.
> Either way, I can't take this binding without a soc-specific compatible,
> per sifive-blocks-ip-versioning.txt..

Further, "sifive,perfmon-counters" is an undocumented property.

Thanks,
Conor.

--CLBf1mcbqLUt7ULL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMNoygAKCRB4tDGHoIJi
0t7lAP4l8gcLhmzGLDZoKSuera2y1ijqtLLcIiiMvpnoAU9Z6gEA3sHmaOCWY5wC
Dp6THGXUlDytdskVE4dXvgAel5laawk=
=Bv67
-----END PGP SIGNATURE-----

--CLBf1mcbqLUt7ULL--


--===============4060628008783196990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4060628008783196990==--

