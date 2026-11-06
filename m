Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85557606D817
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 18:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ucC6Y1Lr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KrBSVpvJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LHqxvYSIh3XGqNkkXH4kvm49EegywGZif2azg20mZtw=; b=ucC6Y1LrCSXLoNdY9r0eC+stlm
	mkORhMSWV6VxY7d4p151sKiXk4d1w/bu0MB7+7VxjrOzm8rTA7iphcUgWQ+5R1YIb/NZj+XnIG8w3
	raylVD8vGua+u8qQp57b2xOGOSsQlpvE1n8Yv1S3ZpC+ZQoxCjGfkGMyVrLEwcYCDG2v11PGQMXkE
	eC9GYxwVvE+UEgUhbdivia7T9MItwlNDjzewIaYemDFjr4ua3ggwh6pb0lS4z9/eeFZO8XvsK7wTc
	ivbQJ7RKvDkh7HkD0WmC3pjQ2S9PV5H8RJJkptGCvxAHQ14oY1v+XwJstnrCkv7s8D/UUq2HeQv54
	T6Ltqr8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOXf-0000000DO3Y-1rWW;
	Fri, 06 Nov 2026 18:19:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOXe-0000000DO3G-024t;
	Fri, 06 Nov 2026 18:19:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F7336020A;
	Fri,  6 Nov 2026 18:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC2E1F008A4;
	Fri,  6 Nov 2026 18:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793989197;
	bh=c/20RGI5WiHKKkpDTceQl002Lfa1bhsWYphTb3UDQkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KrBSVpvJM7vkY1slHDjt9v9csvTLVw6DZE9OLBCH6kHBWwi/iB0GMO52uMbFZPMu2
	 aoxCVUIO3CfvqbM4ApUWQqMUyq7T507tTjGYhdLv9cHq0mKkBdnJcKicl10MAbOTO6
	 l2bPh4z/TPbXDyBRgQauffurjJJKfxnf8R5aSi4pzmXXl5IiGbbZX+1B8VF3IZ5rwr
	 0g7Tt8zM/nxj3oEc1nE9jrxUZVpbFdLHlwshhP4A3v/UkkQpvvX+reUCCcU7KAJ91b
	 dy37lW9arn8Wu6MQyOfyX701vpirgwBIQ4tvzJCyh+t3BrRDSXQUnDmZ8+xFdidOMf
	 sRqoiBHWy1upA==
Date: Fri, 6 Nov 2026 18:19:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jun Chang <jun.chang@metanoia-comm.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	CL Wang <cl634@andestech.com>, Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Randolph Sheng-Kai =?utf-8?B?TGluKOael+iBluWHsSk=?= <randolph@andestech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>, linux-mmc@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 25/25] MAINTAINERS: add RISC-V Metanoia SoC support
Message-ID: <20261106-comic-cupid-a8a3c127307f@spud>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-25-86087eaf5af4@bootlin.com>
 <4f1e52d9-0788-4601-8f67-898256a776b4@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <4f1e52d9-0788-4601-8f67-898256a776b4@kernel.org>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0872402454467920625=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0872402454467920625==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EI85CRMW6gBoUvVg"
Content-Disposition: inline

--EI85CRMW6gBoUvVg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:22:15PM +0100, Krzysztof Kozlowski wrote:
> On 06/11/2026 10:30, Beno=EEt Monin wrote:
> > Add a maintainer entry for the Metanoia MT2824 SoC, covering the
> > SoC-specific DT bindings, the SoC and the evaluation board device trees,
> > and the phy driver.
> >=20
> > Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
> > Signed-off-by: Beno=EEt Monin <benoit.monin@bootlin.com>
> > ---
> >  MAINTAINERS | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 93abbb315065..310544f96204 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -24072,6 +24072,17 @@ T:	git git://git.kernel.org/pub/scm/linux/kern=
el/git/iommu/linux.git
> >  F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> >  F:	drivers/iommu/riscv/
> > =20
> > +RISC-V METANOIA SoC SUPPORT
> > +M:	Jun Chang <jun.chang@metanoia-comm.com>
>=20
> So Jun will handle the patches? Can we get an Ack for this?

There's no tree listed, so probably Jun is not handling any patches...

I /could/ apply patches for this platform alongside the other one that I
manage, but I don't really want to and someone that actually cares for
this platform should be the one applying patches for it.

Beno=EDt/Jun, please see Documentation/process/maintainer-soc.rst !

--EI85CRMW6gBoUvVg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4aQwAKCRB4tDGHoIJi
0rbxAQDp+CX8P4FSxsxtp+sH+XOoVxSjimJET4S5CSWzGNHXFQD/b5cKyz3+v/zA
eq6hyBYC7BQX3uGp2UiAkQX4EfPpDwQ=
=dNYG
-----END PGP SIGNATURE-----

--EI85CRMW6gBoUvVg--


--===============0872402454467920625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0872402454467920625==--

