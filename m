Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0904C54E41
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 10:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5aL6yzTQukkK713XkUus8xmABaDQchASByF9rhYHz6M=; b=AO4F7kHd5Zv75Zd9nQhKB227Nd
	oIXzf0kkjYefYXT6V890nl4GE+mFqyibUo0AxFcNtSCjy76tN95rIFsmJTym/5ud6nihzztwjrVlT
	TOz6mdxNY+w1Y4L1Lxg37bS/3NyyKAaJf0YAQbWwIlBZc+MJEbpWr6DFUrKCT8qhPRo0OdcS42tiU
	ISlhCRqliD7PxyhBI/D5jMZPVrBblsV/lm5c9mr4fB8BPA5iEnLG+GJhXkFrZy4x+iM+pQpPHGC3Z
	b1Uli92+ASY4vXCH91TikAqBUSzn+MfYnQuNFW7T+eG8FfBp0UWUeeY9utN4NN7OxL1LCV8W0VxAO
	a5IJkclA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5bJ-00000008cyS-46h3;
	Mon, 04 Mar 2024 10:31:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5L0-00000008YM0-1IBI
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 10:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709547266; x=1741083266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kfAcNKmA4cBvu+kjAgfSfD0IyZ8QJAIfKSZTQk0XGtM=;
  b=V2ftnkte6gDfaJFiH9BSe1l/jhNrYnZIlBpGsgtsI2PCKTIMieVCqAvW
   bbocJEIdZQoVSkzbfU6P3pLqzpiK8V9vpcjpu/psZt5N4gTIjWgopdXP6
   oSnoo9vbRc/Xib9KEz0njjfCbgIQ0WAaHx4vwNFp33yy///XMym0GNW7f
   i5h9a0EKUbchYQukjGpzWcZTLYErOd24KaJUcCNbC0AIE0V0CL+bNz53y
   c4gBAMg6i1cK311g4/xxKOZ/Oujlm5JFqm66o7KDnj2tFdVaT1PsPPCmB
   hK+80ycuUcFi1k8q1GSR+B/JfB6aY5p2oItGznzd9D+A3OFlgxhWl3yPn
   g==;
X-CSE-ConnectionGUID: wCwOhLHtRuaTzD16zsH71g==
X-CSE-MsgGUID: pesRzB4dSCO6pOnMr5pS8w==
X-IronPort-AV: E=Sophos;i="6.06,203,1705388400"; 
   d="asc'?scan'208";a="17693678"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Mar 2024 03:12:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 03:12:31 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 4 Mar 2024 03:12:29 -0700
Date: Mon, 4 Mar 2024 10:11:45 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Yangyu Chen <cyy@cyyself.name>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: add Canaan K230 boards compatible
 strings
Message-ID: <20240304-wharf-safely-8167b9641821@wendy>
References: <tencent_E15F8FE0B6769E6338AE690C7F4844A31706@qq.com>
 <tencent_D5188EA5B85A31AC21588DBD7C7482ACDA08@qq.com>
 <7c3c578a-d662-4485-ad15-47250ad0e935@linaro.org>
 <tencent_BF607C338244DA7F8EB2B8F2314A218B8D08@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_BF607C338244DA7F8EB2B8F2314A218B8D08@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_021428_363852_489D2393 
X-CRM114-Status: GOOD (  27.72  )
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
Content-Type: multipart/mixed; boundary="===============5644879353246778794=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5644879353246778794==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sMeZDBbqBAeg1clN"
Content-Disposition: inline

--sMeZDBbqBAeg1clN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2024 at 04:51:05PM +0800, Yangyu Chen wrote:
> On 2024/3/4 16:11, Krzysztof Kozlowski wrote:
> > On 03/03/2024 14:26, Yangyu Chen wrote:
> > > Since K230 was released, K210 is no longer the only SoC in the Kendry=
te
> > > series, so remove the K210 string from the description. Also, add two
> > > boards based on k230 to compatible strings to allow them to be used i=
n the
> > > dt.
> > >=20
> > > Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> > > ---
> > >   Documentation/devicetree/bindings/riscv/canaan.yaml | 13 ++++++++++=
++-
> > >   1 file changed, 12 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/riscv/canaan.yaml b/Do=
cumentation/devicetree/bindings/riscv/canaan.yaml
> > > index 41fd11f70a49..444758db964e 100644
> > > --- a/Documentation/devicetree/bindings/riscv/canaan.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/canaan.yaml
> > > @@ -10,7 +10,7 @@ maintainers:
> > >     - Damien Le Moal <dlemoal@kernel.org>
> > >   description:
> > > -  Canaan Kendryte K210 SoC-based boards
> > > +  Canaan Kendryte SoC-based boards
> > >   properties:
> > >     $nodename:
> > > @@ -42,6 +42,17 @@ properties:
> > >         - items:
> > >             - const: canaan,kendryte-k210
> > > +      - items:
> > > +          - const: canaan,k230-usip-lp3-evb
> > > +          - const: canaan,kendryte-k230
> > > +
> > > +      - items:
> > > +          - const: canaan,canmv-k230
> >=20
> > Why this is not part of previous entry in an enum?
> >=20
> > > +          - const: canaan,kendryte-k230
> > > +
> > > +      - items:
> > > +          - const: canaan,kendryte-k230
> >=20
> > Usually you cannot run SoCs alone. What does it represent (in real life=
)?
> >=20
>=20
> I'm not sure what it means.

You have a SoC compatible but no board compatible. You cannot run a SoC
without some sort of board connected to it, so this should be removed.

> If you wonder why should I add a compatible string for soc, that is altho=
ugh
> we cannot run SoCs alone, adding a soc compatible will allow some
> bootloaders or SBI on RISC-V to choose an errata for a soc. Such as this
> opensbi patch. [1]

You don't need to add an isolated compatible like this to be able to
apply that "erratum", the compatible is already documented from the
"usip-l3-evb" and "canmv-k230" entries.

> If you wonder why I should allow a soc-compatible string with soc alone,
> that is because k210 did it previously.

The k210 is not really a beacon of quality in the DT department, copying
=66rom there is likely to be misleading unfortunately.

> And provide a k210_generic.dts to
> use it. I haven't provided generic dts now but allowing only soc-compatib=
le
> string alone would also be acceptable I think.

To be honest, I would like to delete the generic dts for the k210, I
don't think it should exist, at least not in the current form.

Thanks,
Conor.

--sMeZDBbqBAeg1clN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeWeYQAKCRB4tDGHoIJi
0l7sAP47uOhYd1DCwmJBkxO8TaMhAQS5Yf1og9jIrnGIqxlXVgD/Y4GmbTvJfOfh
M8suFJ9UmnJ3S0rikA5KJgnrXlJZ7gA=
=TfqN
-----END PGP SIGNATURE-----

--sMeZDBbqBAeg1clN--


--===============5644879353246778794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5644879353246778794==--

