Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76651C25B7E
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 15:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9mdtJR3k5RyWWCVdDnoetvg2QM4bBj3pTFyrys54pc=; b=sM6vmRy7QeMeuBxNW3PKuI3OS5
	wIGIPiBzCFw4YpMtQS5M5JJcnox1ewBblWd/UGifnQERK9Wzl/OlnQuApidvigMs2q4ZjAHYU/k/w
	CqL77FIjZd3yYlgkCjmaHRIMVr4pshH5pgrOo6/0sLM2EgF6eSPfISCKwhKYmcRFK8qsw0P19AP6f
	Fos+o6aWsxyjpJchCejltGFrrUY/7r4nmyQH/Ll15BdfssRVhnWkXMXs8dOVlchs61xsRAGYJZMDQ
	EqOQCe4jLpHgrk0GCVvqOEjXTbSCJQQiODLAbMCdoh39Qda2I4mbpzooKS00B+tuRJRUMbOkHn+N+
	VpJwZ4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD3o9-0000000AbUp-3Unk;
	Fri, 31 May 2024 15:04:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD3o7-0000000AbUK-1YAv
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 15:04:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A0FC062C21;
	Fri, 31 May 2024 15:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C353DC116B1;
	Fri, 31 May 2024 15:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717167878;
	bh=WlONLvUzuGAWpIFAckDTFmIFip9XIDRJ004IX70Pa7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j0r8HZ6wRlWQ8R7CpmEvEMHRZ8f5m4JQa4hyyRFq+uqUEAYINjfc7wUw8O4xqvvhl
	 f/EBqTzaVIiGe+3P3TVXsSSDEFY04V8CmIPLCl4A6mGInJRmUd4uxt+lOCOzoS//lT
	 5OctIOrg7J0+8y++Kwh5uEfiXKvD0ZJtZJBJAINyOHE4uK12UuawnUeAzmTIPx3Itg
	 h3PN0MiYCKmOKTv9TvRoYUuH8yT2Khhc9Y7+g8/XeP6GKXbAQv9hVyaW+Q0x0sKhdF
	 zLMYwfZT8TwziirNpOt94sJlBoq7rFPcf8jceK2odSb5rMf3UWT+OQvHDvHjt5nQyX
	 OeR1OKATPKrYw==
Date: Fri, 31 May 2024 16:04:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Haylen Chu <heylenay@outlook.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: thermal: sophgo,cv180x-thermal: Add
 Sophgo CV180x thermal
Message-ID: <20240531-oyster-duct-9eaf5f3e6f35@spud>
References: <SEYPR01MB422119B40F4CF05B823F93DCD7F32@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <SEYPR01MB4221BD44992A23E2B0061023D7F32@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <1624f2f0-0a2d-4918-a129-84dca6da9af8@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1624f2f0-0a2d-4918-a129-84dca6da9af8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_080439_566106_B4193654 
X-CRM114-Status: GOOD (  15.31  )
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
Content-Type: multipart/mixed; boundary="===============0383231222011155373=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0383231222011155373==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+uuAo5InwkaQdoaN"
Content-Disposition: inline


--+uuAo5InwkaQdoaN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 10:54:24AM +0200, Krzysztof Kozlowski wrote:
> On 30/05/2024 15:48, Haylen Chu wrote:
> > Add devicetree binding documentation for thermal sensors integrated in
> > Sophgo CV180X SoCs.
> >=20
> > Signed-off-by: Haylen Chu <heylenay@outlook.com>
> > ---
> >  .../thermal/sophgo,cv180x-thermal.yaml        | 46 +++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/thermal/sophgo,cv=
180x-thermal.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/thermal/sophgo,cv180x-th=
ermal.yaml b/Documentation/devicetree/bindings/thermal/sophgo,cv180x-therma=
l.yaml
> > new file mode 100644
> > index 000000000000..0364ae6c1055
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/thermal/sophgo,cv180x-thermal.y=
aml
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/thermal/sophgo,cv180x-thermal.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo CV180x on-SoC Thermal Sensor
> > +
> > +maintainers:
> > +  - Haylen Chu <heylenay@outlook.com>
> > +
> > +description: Binding for Sophgo CV180x on-SoC thermal sensor
> > +
> > +properties:
> > +  compatible:
> > +    items:
>=20
> Drop items
>=20
> > +      - enum:
> > +          - sophgo,cv180x-thermal

And a soc-specific compatible too please.

Thanks,
Conor.

--+uuAo5InwkaQdoaN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlnnAAAKCRB4tDGHoIJi
0qptAP4qGy3UQyXxXeohA72UPBX2kjoA0eFZmEQmtys4kbms9gEAlrIcVuX9VmxR
vRHaOBCFCMp9dhqbo/U7804CHW3NYgM=
=annq
-----END PGP SIGNATURE-----

--+uuAo5InwkaQdoaN--


--===============0383231222011155373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0383231222011155373==--

