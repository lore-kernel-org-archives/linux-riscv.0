Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B702ACA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6eGieqwnDesuMIeNf+wdwP4SixWK1DOQ6eXYpWLyP4=; b=3vP6ADUEU2+WmBI4k6/7PNaFap
	7l3UWJH12MGE2bKB7nAuNjVZRcoL1UqyRRwpDe43N2rQqUiH9Z9TTCYmzR3lbFwX/ogiMD0zogYiA
	oYt/QM8NDHLS585wQK04g7FxMsIzivF8d6fAlbne9+vivZ3Zdk9m0HnkoEMfdRRGckyPC+e/uGykF
	Nb/gf7xj1D97szM+pkskaD4jIu7AWxCycXn3y3CO+D/bOCdhNz5Ok5I1lWWodPafsHfT/RyI9vNsc
	ZweYGbUgWzTTJP10m8hlWF9zm0xeDZ2Y9oqR1Esv56/R4pDQGOWn4bDECHS8uedyi1ECc/2phsCDi
	tuTCjsyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphur-00000004BHa-3N9B;
	Sat, 23 Aug 2025 06:39:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upUlK-00000003BMP-02Fz
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:37:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1DBF45C70E6;
	Fri, 22 Aug 2025 16:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73852C4CEED;
	Fri, 22 Aug 2025 16:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755880628;
	bh=Nu4e6UeAXwVcvfZtjpDX4+Fvi5Hf97mH4y1qIQ3VZzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n8hLAZfJovCKOU2fELvFU+ZBcFqnowH+57AbthIsjm22+oAhTNi6jrkkShDDkK6K/
	 C1H8s6gvzNgkXr31PNpTZ4UMCG/1+hzaGo4VbrTKm/r+LrQ5wGvaWOI55XUeKNykvT
	 /jSzs4nHn9hFj1gb2KcPdkn6rZ0txqkgQnhe57K9CLyHSIJCjeTsQgr2OWkdLM7wc5
	 W8umRxG2B8NtlR/N5bVucmEIwDjeM2AjYC3sxBa07queDIccM1qoYlZ43ooRfiqC6b
	 D9zNd4dWYQxcO/nfvNYuzpk5PzHkPtB0GUYx+K9iKYzqGnGYiP5NHwB6Gf5ylsP3K7
	 BPZUyP/CprI9A==
Date: Fri, 22 Aug 2025 17:37:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 1/3] dt-bindings: riscv: Add StarFive JH7110S SoC and
 VisionFive 2 Lite board
Message-ID: <20250822-rascal-geometry-83c35926ea7e@spud>
References: <20250821100930.71404-1-hal.feng@starfivetech.com>
 <20250821100930.71404-2-hal.feng@starfivetech.com>
 <20250821-pencil-anguished-6b8467adbd38@spud>
 <ZQ2PR01MB13071F6F2732451DBE3BEE9DE63D2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ2PR01MB13071F6F2732451DBE3BEE9DE63D2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_093710_136930_C8395D2E 
X-CRM114-Status: GOOD (  24.97  )
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
Content-Type: multipart/mixed; boundary="===============3852810226875606596=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3852810226875606596==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nZfVf4i1qpRGT5hz"
Content-Disposition: inline


--nZfVf4i1qpRGT5hz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 07:37:29AM +0000, Hal Feng wrote:
> > On 22.08.25 02:17, Conor Dooley wrote:
> > On Thu, Aug 21, 2025 at 06:09:28PM +0800, Hal Feng wrote:
> > > Add device tree bindings for the StarFive JH7110S SoC and the
> > > VisionFive 2 Lite board equipped with it.
> > >
> > > JH7110S SoC is an industrial SoC which can run at -40~85 degrees
> > > centigrade and up to 1.25GHz. Its CPU cores and peripherals are mostly
> > > similar to those of the JH7110 SoC.
> >=20
> > How "mostly" is mostly? Are there memory map or capability differences?
>=20
> To be precise, the CPU cores and peripherals are the same as those of the
> JH7110 SoC. I will improve the commit description in the next version.

Ye, please do. The complete lack of differences other than thermals
and cpu performance is what allows you to use all the same compatibles
for the peripherals after all!

>=20
> Here are the differences between them:=20
> JH7110 supports 0~70 degrees centigrade and up to 1.5GHz.
> JH7110S supports -40~85 degrees centigrade and up to 1.25GHz.
>=20
> Best regards,
> Hal
>=20
> >=20
> > >
> > > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > > ---
> > >  Documentation/devicetree/bindings/riscv/starfive.yaml | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml
> > > b/Documentation/devicetree/bindings/riscv/starfive.yaml
> > > index 7ef85174353d..a2952490709f 100644
> > > --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> > > @@ -33,6 +33,11 @@ properties:
> > >                - starfive,visionfive-2-v1.3b
> > >            - const: starfive,jh7110
> > >
> > > +      - items:
> > > +          - enum:
> > > +              - starfive,visionfive-2-lite
> > > +          - const: starfive,jh7110s
> > > +
> > >  additionalProperties: true
> > >
> > >  ...
> > > --
> > > 2.43.2
> > >
>=20

--nZfVf4i1qpRGT5hz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKicsAAKCRB4tDGHoIJi
0sCgAQCngjj8rbPb0Af9BMZYRbpS50JcfXIJv0U+8Lki4SL4CQEAzz2rJzTiq/u6
Udk42wTGzXD6bXBGwcGrUnFUsV713ws=
=6L7i
-----END PGP SIGNATURE-----

--nZfVf4i1qpRGT5hz--


--===============3852810226875606596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3852810226875606596==--

