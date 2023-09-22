Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96567CD4F49
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 10:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rBJDle2o9jkk1pNyi0wenEid55vKG8Ny/Grm8CvB4c=; b=NMj2iMXeOjlMovs30ZJLCAzt6Y
	HfKcAOhH41DpnHj9xrOLJDc8WhQGxWZ5DINgq3xml9ip4kqReSjR4yWk9YafgmG31pnyNJrCc1iM9
	0QBdr+ms5F3GFOnbJZj9jpjKESbbX4o0a5jrcEl0l68UTZq2R0TNRxwodxcgsMGpO2s8R065AU0jo
	MkZ7xLDbmmZ+YtVK+vvGtkYuhkeefUftpnyHeBDbtA88JeaiQ67qBHP33DfOjbAe8AQ/mU+ioDoc4
	2T2768tOzYKjKrY44z/5xcNh9+ZQWLGuHwUNrYTa1k3D8H+ZZ/eG+ZL7CGnVU8eQ8jFTpizhgf3TF
	uXsXqYWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjd3C-008g0U-2j;
	Fri, 22 Sep 2023 10:06:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjd39-008fzD-11
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 10:06:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D6D34B822E7;
	Fri, 22 Sep 2023 10:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891B8C433C7;
	Fri, 22 Sep 2023 10:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695377172;
	bh=ZSJfD7k/VQUpXo2+TnOmQVi22abLU8ZmEK3CpkrD6cA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OdBZHf0Djsq5PqRRpd7L0wJmE8UqPNz5KSWCssaBxCFoCnhj+UXwx3sSfYPBV70DZ
	 6dJj2pZyZE9bxhT0if0UBkQg7XyyBLxcCpIhiRtWS8fpgMbrvZc9ElREPbTDNOp0f+
	 oBhtXrLoDoQGk+ZCVnLjDxpzlA4CrpTbQEurUxodCMPQ4thn4YjIc69psxo8rpD5Uc
	 KMcaeewjKUag9gtI2aZ/jsSPbre7Lb5jpcyZ11oQWD/yhhBAPf9I42NeX2CZ8M5Kt4
	 8t3k5wQSSfIsg4wNLqQW3VlGF3RwnkxtdavKvG8PWuyNO7DL4LS4cjs64E4By/tW8r
	 /xQVuXujJDqyQ==
Date: Fri, 22 Sep 2023 11:06:07 +0100
From: Conor Dooley <conor@kernel.org>
To: shravan chippa <shravan.chippa@microchip.com>
Cc: green.wan@sifive.com, vkoul@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, conor+dt@kernel.org, palmer@sifive.com,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	nagasuresh.relli@microchip.com, praveen.kumar@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: dma: sf-pdma: add new compatible name
Message-ID: <20230922-front-transport-84ad558d64f6@spud>
References: <20230922095039.74878-1-shravan.chippa@microchip.com>
 <20230922095039.74878-3-shravan.chippa@microchip.com>
 <20230922-gray-zebra-a0ea451cc5cc@spud>
MIME-Version: 1.0
In-Reply-To: <20230922-gray-zebra-a0ea451cc5cc@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_030615_657048_0F978FC6 
X-CRM114-Status: GOOD (  20.26  )
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
Content-Type: multipart/mixed; boundary="===============4044265513320781840=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4044265513320781840==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gzc29qjm4irtKiMm"
Content-Disposition: inline


--gzc29qjm4irtKiMm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Me again,

On Fri, Sep 22, 2023 at 10:59:52AM +0100, Conor Dooley wrote:
> On Fri, Sep 22, 2023 at 03:20:38PM +0530, shravan chippa wrote:
> > From: Shravan Chippa <shravan.chippa@microchip.com>
> >=20
> > add new compatible name microchip,mpfs-pdma to support out of order dma
> > transfers this will improve the dma throughput for mem-to-mem transfer
> >=20
> > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> I would appreciate if you would drop any vendor tree related tags when
> submitting patches upstream, especially for dt-bindings where it
> actually means something to have my R-b on them.

> > ---
> >  .../bindings/dma/sifive,fu540-c000-pdma.yaml         | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pd=
ma.yaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> > index a1af0b906365..974467c4bacb 100644
> > --- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> > @@ -27,10 +27,14 @@ allOf:
> > =20
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - sifive,fu540-c000-pdma
> > -      - const: sifive,pdma0
> > +    oneOf:
> > +      - items:
> > +          - const: microchip,mpfs-pdma # Microchip out of order DMA tr=
ansfer
> > +          - const: sifive,fu540-c000-pdma # Sifive in-order DMA transf=
er

Whoops, I meant to say - I'm okay with the soc-specific compatible being
added (we should have done that from the start), but I think the
comments here about software behaviour should be removed. With that, you
can re-add
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> > +      - items:
> > +          - enum:
> > +              - sifive,fu540-c000-pdma
> > +          - const: sifive,pdma0
> >      description:
> >        Should be "sifive,<chip>-pdma" and "sifive,pdma<version>".
> >        Supported compatible strings are -
> > --=20
> > 2.34.1
> >=20



--gzc29qjm4irtKiMm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ1nDwAKCRB4tDGHoIJi
0iu4AP9ftHlaLWLxGFrMqLyZkNySjR5Lx2yS6qbidQENPtdz9gD/ZKy6v/mYBTbo
hzCnrlwwv1prOZBIV5HG90XKlkmbrQo=
=/fcK
-----END PGP SIGNATURE-----

--gzc29qjm4irtKiMm--


--===============4044265513320781840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4044265513320781840==--

