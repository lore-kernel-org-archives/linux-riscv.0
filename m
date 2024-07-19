Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1710C3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbBz9yJ8Tq6dhA9vrvu8CQzX+pzZQ+kroQ5pX2xbsVk=; b=jg9hJUV/j3TOqoXTPF2E+Vq/sr
	KkW+hkuT+vhxu9hZ2OGpJqjhOBgOdG+SSrsOJGwjEN2Db8kr/t2i/TIUyG7xr/scnfvFdzftMu4qa
	jgB2L6JtLwiCtuWc27ZnCeimyA735ZTuXRNzqRfTLvv+cMBoOPBsuXp6sc/cL4AXVfOlAmkmmh1Qu
	YKrvwbelid1jpiuMuwPnMQkqih839u23TTVMvJcb0d3Mh1MCZ098pMsrglCE8agGDW4/1wmFClP3D
	pQpY/+V5QD6Ag2iedny6DWKBwaKUkvtC7KSwrRE4ZsK292BsEx88TseSeBxipqI4F0093rexMGTvu
	oHLFGJqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUnU9-00000002kFG-45iA;
	Fri, 19 Jul 2024 13:17:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUnU6-00000002kDK-23GR;
	Fri, 19 Jul 2024 13:17:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EBD9B61BBB;
	Fri, 19 Jul 2024 13:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA35AC32782;
	Fri, 19 Jul 2024 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721395037;
	bh=qtLPFOhjqFSQYLpvCLe3qCCW4Py65LMqZdG1qvlJQ00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BX2Ysd7HikpMDPOtr1h9L5jSD24rg6Ar4jIpudeOW75Ly61bPrVuFM8vH1CYKX6Li
	 2uJyxkwcqs9OnDeFrBkpahew6+Mie/ztcLEfSa4Dv3EXLvfUHnkEFajzNh5uKBqBni
	 iJFP0EkMY77o821Fwfkh2xlFsyatrgxuX+Qv/MRRMLJwOBcES5LFBoRG/gCNB6QJq8
	 WcIutfAiNxcpZU75Qf7cfS1j8EeyoLjrbPDUfxDsW+4vwPGMFldfln9TKqaFiX9Dye
	 OuLHSRI8uIWoEPoStzlx6ROavXVt9xom8g3hmKL8Ldp0XaXaaXNFlZBOivtfEMyR/s
	 4lJIYzCFCmJEw==
Date: Fri, 19 Jul 2024 14:17:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, greentime.hu@sifive.com,
	vincent.chen@sifive.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Subject: Re: [PATCH v7 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
Message-ID: <20240719-flatten-elixir-d4476977ab95@spud>
References: <20240712083850.4242-1-yongxuan.wang@sifive.com>
 <20240712083850.4242-3-yongxuan.wang@sifive.com>
 <727b966a-a8c4-4021-acf6-3c031ccd843a@sifive.com>
 <CAMWQL2g-peSYJQaxeJtyOzGdEmDQ6cnkRBdFQvLr2NQA1+mv2g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMWQL2g-peSYJQaxeJtyOzGdEmDQ6cnkRBdFQvLr2NQA1+mv2g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_061718_647928_B6FC91D6 
X-CRM114-Status: GOOD (  26.93  )
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
Content-Type: multipart/mixed; boundary="===============4187711450152382329=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4187711450152382329==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FVYN+Rx9CKi55/SI"
Content-Disposition: inline


--FVYN+Rx9CKi55/SI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 02:58:59PM +0800, Yong-Xuan Wang wrote:
> Hi Samuel,
>=20
> On Fri, Jul 19, 2024 at 7:38=E2=80=AFAM Samuel Holland
> <samuel.holland@sifive.com> wrote:
> >
> > On 2024-07-12 3:38 AM, Yong-Xuan Wang wrote:
> > > Add entries for the Svade and Svadu extensions to the riscv,isa-exten=
sions
> > > property.
> > >
> > > Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > > ---
> > >  .../devicetree/bindings/riscv/extensions.yaml | 28 +++++++++++++++++=
++
> > >  1 file changed, 28 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml =
b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > index 468c646247aa..e91a6f4ede38 100644
> > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > @@ -153,6 +153,34 @@ properties:
> > >              ratified at commit 3f9ed34 ("Add ability to manually tri=
gger
> > >              workflow. (#2)") of riscv-time-compare.
> > >
> > > +        - const: svade
> > > +          description: |
> > > +            The standard Svade supervisor-level extension for SW-man=
aged PTE A/D
> > > +            bit updates as ratified in the 20240213 version of the p=
rivileged
> > > +            ISA specification.
> > > +
> > > +            Both Svade and Svadu extensions control the hardware beh=
avior when
> > > +            the PTE A/D bits need to be set. The default behavior fo=
r the four
> > > +            possible combinations of these extensions in the device =
tree are:
> > > +            1) Neither Svade nor Svadu present in DT =3D> It is tech=
nically
> > > +               unknown whether the platform uses Svade or Svadu. Sup=
ervisor
> > > +               software should be prepared to handle either hardware=
 updating
> > > +               of the PTE A/D bits or page faults when they need upd=
ated.
> > > +            2) Only Svade present in DT =3D> Supervisor must assume =
Svade to be
> > > +               always enabled.
> > > +            3) Only Svadu present in DT =3D> Supervisor must assume =
Svadu to be
> > > +               always enabled.
> > > +            4) Both Svade and Svadu present in DT =3D> Supervisor mu=
st assume
> > > +               Svadu turned-off at boot time. To use Svadu, supervis=
or must
> > > +               explicitly enable it using the SBI FWFT extension.
> > > +
> > > +        - const: svadu
> > > +          description: |
> > > +            The standard Svadu supervisor-level extension for hardwa=
re updating
> > > +            of PTE A/D bits as ratified at commit c1abccf ("Merge pu=
ll request
> > > +            #25 from ved-rivos/ratified") of riscv-svadu. Please ref=
er to Svade
> >
> > Should we be referencing the archived riscv-svadu repository now that S=
vadu has
> > been merged to the main privileged ISA manual? Either way:
> >
> > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> >
>=20
> Yes, this commit is from the archived riscv-svadu repo. Or should I updat=
e it to
> "commit c1abccf ("Merge pull request  #25 from ved-rivos/ratified") of
> riscvarchive/riscv-svadu."?

I think Samuel was saying that we should use the commit where it was
merged into riscv-isa-manual instead.

--FVYN+Rx9CKi55/SI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZppnRwAKCRB4tDGHoIJi
0qmzAPwPCohsOIh0JMJTv+r89hx01GSGvJwwS4SEQyLjNq8GTwD/bTyQl6+PLCAD
n+bWqAgty3EMTJXCctxru5eDIOrN3wU=
=IM8G
-----END PGP SIGNATURE-----

--FVYN+Rx9CKi55/SI--


--===============4187711450152382329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4187711450152382329==--

