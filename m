Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709A4CD5BAA
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 18:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDeLB5SSsdlNQfnbKspU2FdB1MgESzYSA4afPUj7OpM=; b=w6eVYMZ7duNScFCHuIE4yvCcCv
	y3j1YfKrI8n7YUabbSBaLfUr7hSmKuvTvhOGNzZI7nSu3Swo3W/N46TW1fgj9QjjbiPk2ZGt1laku
	wsgd2dHwL1EFO6FLtv2OgbZENAqOcXJp3fvzY1uSvcHmOgVlTN+rcPnEAu3ISrOO4e2t4qeFfCcbq
	9Wfqh4gpRUdK76L2rrmV4mJdf/x8lWaP2SGxEFSlInz6SOkPCZWgu260KDEz5qnf4UwdeGHDl+5W8
	62SMvHnvGJk0g7q3IvIPSUt35XuHb62kism2YyDbwAxTWA8Z+r47tNyCqutUHp0oUQbLp59QO4gsu
	abTzsAmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPm4w-00000005Xbu-1emt;
	Wed, 20 May 2026 18:55:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPm4t-00000005Xam-1PJJ
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 18:55:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C0744386F;
	Wed, 20 May 2026 18:55:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108B21F000E9;
	Wed, 20 May 2026 18:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779303334;
	bh=1T+Q/YxtQARU2EGQLE/zHDY4XgcSiULTKufiyFMk81o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d3HC1AWlxYQloLRdwFfkhaO9j224EwZJKTWuqbNerYPPwboNaP5Oz+iENzlzxFIap
	 aB83fyHfHkO46WDersl/s2y9fMKNnVWY7cjunQ3dZWU8yCNtPQ19Yr5yJ/gO+07XZa
	 nEA65mrqtesRALxniBsxDYR26TgwmwQbhOQ2kWquww7WOG+HhUp2rhuD0XkQpnUKl4
	 3jcPM5N7E+loqNENnYvCO7XLTC/PSQpsIvSfJezjYB+z5Mb6JhpjxAe0MsCcyo7EgJ
	 zbX+IR/im+BQAIPoSDd/EOu68/1bNkHfVz3edQcj3+K+CFV6P24opy4+L1dj3HWqu9
	 P6iMyHvEgXW/g==
Date: Wed, 20 May 2026 19:55:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>, Joerg Roedel <joerg.roedel@amd.com>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: iommu: riscv: Add bindings for
 Tenstorrent RISC-V IOMMU
Message-ID: <20260520-imminent-graded-6e1f0f4c54d0@spud>
References: <20260520061855.1623468-4-fustini@kernel.org>
 <20260520-frayed-fervor-7c887193ab19@spud>
 <ag36CHVAERc3ZYmi@x1>
MIME-Version: 1.0
In-Reply-To: <ag36CHVAERc3ZYmi@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_115535_394566_C95AB068 
X-CRM114-Status: GOOD (  13.92  )
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
Content-Type: multipart/mixed; boundary="===============3045520578166540994=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3045520578166540994==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XDMycSDARlTDf9SM"
Content-Disposition: inline


--XDMycSDARlTDf9SM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 11:14:32AM -0700, Drew Fustini wrote:
> On Wed, May 20, 2026 at 05:17:41PM +0100, Conor Dooley wrote:
> > On Tue, May 19, 2026 at 11:16:28PM -0700, Drew Fustini wrote:
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - tenstorrent,riscv-iommu
> > > +    then:
> > > +      properties:
> > > +        reg:
> >=20
> > > +          items:
> > > +            - description: IOMMU base registers
> > > +            - description: Tenstorrent IOMMU machine mode registers.
> >=20
> > Should this also have minItems: 2?
>=20
> I think items: with 2 items implies minItems: 2 but I see your later
> point about the description and names don't belong in the allOf: block.

It would usually, but this is a conditional portion of a wider binding
that you've modified to look like
| reg:
|  minItems: 1
|  maxItems: 2
outside the conditional section, and since you don't further constrain
reg in the conditional section, this minItems: 1 applies.

--XDMycSDARlTDf9SM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag4DoAAKCRB4tDGHoIJi
0i52AQCcMVQtjCAMXGJzQtwBxYsFksRtUfjkaDGhaqziPvWuBQD/T3ApAlZSXRoR
lowYATvKW0j7qswukibEBKJMYExAhgw=
=Cpyi
-----END PGP SIGNATURE-----

--XDMycSDARlTDf9SM--


--===============3045520578166540994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3045520578166540994==--

