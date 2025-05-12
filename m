Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F094C3ABD2
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 11:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTqBrygklVVE+YydzN2NhKlpoQeDSXlofR5mhrvJfzI=; b=DJ3YOTSFznGvP0VxxAAINKaYUc
	QvNPVwBdVd98FeUMsO7F112jGriyteIGblUk1oeOw5FID8AQGOo9ZaYDCZDHlVyxjHCX1OyLpCrwP
	Lk3oJZ6D0oHogHb5EQlG8MUf91srVWiiYu9UPT+1gO5v/AjlCLhhvHPmGdxqluY0ncsQdNh3e8r/Z
	Ge9VrRCn3lRwCq+dlR5unTBcXeL2t8KVF0HV1WrbPB/ELCgZWtZMutlKxk7ByoUv1c/D5A69YjHXr
	u0s4efChnhIZmlf9VU9XJCf/uK7d4JNMUhm6t3IA0z9O/rakAlZdfDO0IK3nzAI9w89wjpLlwxTcm
	BmW6c+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERko-00000009JK9-2It5;
	Mon, 12 May 2025 11:55:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERiq-00000009Iy4-2oIH
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 11:53:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 180A74A42C;
	Mon, 12 May 2025 11:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FBD1C4CEE7;
	Mon, 12 May 2025 11:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747050808;
	bh=XRTRdFsjTIvQFPCYdsS7RtuGeazpj8HDdc2C/0Tr0+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uhykW5tWkylsMRnTtM4JyB85xGedLRJaWdAGBR7SS6gscZl1OaRFbhfhwIQYpna1U
	 1YhecEAWlQutPONxvc/+ZDIyHIoZzBci0wwJsLTb9YqoCswKOD41ANXLtE5cKWpJJb
	 fRgFHktHPiJnsPQ8rmXju3B+58MLO8fz/I1Vcos1Q3g0wGjaVD7NoeF+EB24qQgobw
	 /6U1kLuFYWgNG/3VS/HxZc7dP2CiznjHRZ0QDHE5YSthWRjjpikOMFqd2i1K4KwH/n
	 yVHAeJRX1JbdWYZ9ONTt61IhB8x4BCvk/52FoeTNiDMzM+MPlQaVEb6rNOR6Ds221/
	 R3EsBllOXQFKw==
Date: Mon, 12 May 2025 12:53:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/2] dt-bindings: cache: add specific RZ/Five
 compatible to ax45mp
Message-ID: <20250512-unbundle-outgoing-92aeed9c60f4@spud>
References: <20250509-sapling-exhale-72815a023ac1@spud>
 <20250509-dwindle-remold-98b3d03d0631@spud>
 <CAMuHMdVWznEm4Kg-MvgCT5+cBtdwGi9YrzFK6mBaoPJ+VK8S+Q@mail.gmail.com>
 <20250512-disaster-plaster-9dc63205cd6e@spud>
 <CA+V-a8sJUsNsF+AT1v3ySLiH9RGwDukMHHOC44JuV4JE3YKEpg@mail.gmail.com>
 <CAMuHMdWcfH7RfYnX+1vx6zFo83oGAW25kSAH0fW8Nb_LQ4PV_w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWcfH7RfYnX+1vx6zFo83oGAW25kSAH0fW8Nb_LQ4PV_w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_045328_747167_95567A4F 
X-CRM114-Status: GOOD (  25.91  )
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
Content-Type: multipart/mixed; boundary="===============5299200702132442426=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5299200702132442426==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RsJS8sFLG1dSwYiq"
Content-Disposition: inline


--RsJS8sFLG1dSwYiq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 01:05:13PM +0200, Geert Uytterhoeven wrote:
> On Mon, 12 May 2025 at 12:05, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, May 12, 2025 at 10:59=E2=80=AFAM Conor Dooley <conor@kernel.org=
> wrote:
> > > On Mon, May 12, 2025 at 11:01:26AM +0200, Geert Uytterhoeven wrote:
> > > > On Fri, 9 May 2025 at 17:39, Conor Dooley <conor@kernel.org> wrote:
> > > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > > >
> > > > > When the binding was originally written, it was assumed that all
> > > > > ax45mp-caches had the same properties etc. This has turned out to=
 be
> > > > > incorrect, as the QiLai SoC has a different number of cache-sets.
> > > > >
> > > > > Add a specific compatible for the RZ/Five for property enforcemen=
t and
> > > > > in case there turns out to be additional differences between these
> > > > > implementations of the cache controller.
> > > > >
> > > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-ca=
che.yaml
> > > > > +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-ca=
che.yaml
> > > > > @@ -28,6 +28,7 @@ select:
> > > > >  properties:
> > > > >    compatible:
> > > > >      items:
> > > > > +      - const: renesas,r9a07g043f-cache
> > > >
> > > > This name looks a bit too generic to me, as this is not a generic
> > > > cache on the R9A07G043F SoC, but specific to the CPU cores.
> > >
> > > So "reneasas,r9...-cpu-cache"?
> >
> > Maybe "renesas,r9a07g043f-riscv-cache" ?
>=20
> "renesas,r9a07g043f-ax45mp-cache"?
>=20
> There don't seem to be many vendor-specific derivatives of standardized
> caches, except for "brcm,bcm11351-a2-pl310-cache".

The sifive stuff is all "vendor,soc-cache" into "sifive,ccache" but
there's little ambiguity about there being an arm version of the same
soc there. I don't mind the "renesas,r9...-ax45mp-cache" one you
suggested, feels better than "riscv" to me.

--RsJS8sFLG1dSwYiq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCHhMwAKCRB4tDGHoIJi
0lJdAQDZmT6/q6Y+3Bxx5FSNDxRX2GP522P/d6ovCDdXuDAXKQEAtZHf0hmuuKUK
Qg/Xu5NA7V10fSgeZavhNiZEaWlFdgI=
=4rqL
-----END PGP SIGNATURE-----

--RsJS8sFLG1dSwYiq--


--===============5299200702132442426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5299200702132442426==--

