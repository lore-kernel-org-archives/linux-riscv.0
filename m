Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2C6EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 18:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07BkDiiT5uevtFb941eX2+PgcHfLgZZFL1Qnzxfj4gY=; b=S242AHDy6+Hp0spNJUhFHauvQ7
	4+nNXd3t62JFMFzu2NTrytwuD4SvNln7rxAW2P1HkIFWQx2JbkWMTDybjPw9Ta+nT5tdu3SfGCRQV
	WWNRVHZuL1v6EvMedayotv3KmvlU6Zw0j/rqzxE5HH4GgYiKCfvWKuKqEMlD7bbMC0z/YgkM4lEfn
	tp3kOhRJ+LR54nRHj37YCKpBwLOka1+FvmuurpmgwUOlZQDjGvNXjPo4GX0xMCy/6ZwlLiSz5pzan
	gbfVeALewU/U7DvTX5vDJ4gvWjORrEDHA7Rk8UE68F8pkPa3Y2pMyAMJdSbTRZyCAsKGLkH6cSH6R
	tkns1u7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJI6s-00Ff2H-0v;
	Tue, 11 Jul 2023 18:29:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJI6p-00Ff1n-2C
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 18:29:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E027F615BB;
	Tue, 11 Jul 2023 18:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7316C433C7;
	Tue, 11 Jul 2023 18:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689100150;
	bh=4WHgf4NH3QhoBoMxrjIbPFE8U3So6T1/ORPBCNz8mSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JSt8zgsy1qxDAeeFc8lsgbkWcmZPOWoXyP2xM1kV9XdSJXv+O2Lj4a1D4nR9sAPd6
	 WBp4EX3vLY2g56P9I+UleRLL66kmymXo2FCwNVoIfjqgW6QE59eg65G6Ci+RlyvT6u
	 gvtiQ9O3X2uyTNY/XaF6mSVlWBE0/yWOHcoS3dVC+nxR93UerGkJcXXuF1Cm1mNamp
	 1gfZ1loriSzwd88AhVnvnhYOnA0bA4YHWwVnD8hsF3fKxv+vS3nsPQ8JcqCLu28FZ5
	 pn1g3COnbfGlFQjjp7NDPidt1iF0BK2G8dcL3Ue/fOSvTSuY/0mmZbIkw2TFr8RMhj
	 Z2C0CxKiXuQ7g==
Date: Tue, 11 Jul 2023 19:29:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Ortiz <sameo@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux@rivosinc.com, Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	Guo Ren <guoren@kernel.org>, Atish Patra <atishp@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Evan Green <evan@rivosinc.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: riscv: Document the 1.0 scalar
 cryptography extensions
Message-ID: <20230711-deceiving-pulverize-6d167ba904cd@spud>
References: <20230709115549.2666557-1-sameo@rivosinc.com>
 <20230709115549.2666557-3-sameo@rivosinc.com>
 <20230710151624.GA1987602-robh@kernel.org>
 <20230710-education-evolution-f12520405842@spud>
 <ZK2RN7EKqmW87tyQ@vermeer>
MIME-Version: 1.0
In-Reply-To: <ZK2RN7EKqmW87tyQ@vermeer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_112911_806550_BC446AB6 
X-CRM114-Status: GOOD (  26.84  )
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
Content-Type: multipart/mixed; boundary="===============8303921280151575523=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8303921280151575523==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YcnOMAWI/8l3k2Bk"
Content-Disposition: inline


--YcnOMAWI/8l3k2Bk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2023 at 07:28:23PM +0200, Samuel Ortiz wrote:
> On Mon, Jul 10, 2023 at 04:42:42PM +0100, Conor Dooley wrote:
> > On Mon, Jul 10, 2023 at 09:16:24AM -0600, Rob Herring wrote:
> > > On Sun, Jul 09, 2023 at 01:55:44PM +0200, Samuel Ortiz wrote:
> > > > The RISC-V cryptography extensions define a set of instructions, CSR
> > > > definitions, architectural interfaces and also extension shorthands=
 for
> > > > running scalar and vector based cryptography operations on RISC-V
> > > > systems.
> > > >=20
> > > > This documents all the dt-bindings for the scalar cryptography
> > > > extensions, including the Zk, Zkn and Zks shorthands.
> > > >=20
> > > > Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
> > > > ---
> > > >  .../devicetree/bindings/riscv/extensions.yaml | 82 +++++++++++++++=
++++
> > > >  1 file changed, 82 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yam=
l b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > index cc1f546fdbdc..361756978da1 100644
> > > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > @@ -190,6 +190,24 @@ properties:
> > > >              instructions as ratified at commit 6d33919 ("Merge pul=
l request #158
> > > >              from hirooih/clmul-fix-loop-end-condition") of riscv-b=
itmanip.
> > > > =20
> > > > +        - const: zbkb
> > > > +          description: |
> > >=20
> > > Don't need '|' if no formatting to preserve.
> >=20
> > The existing binding only adds the `|` where the commit message contains
> > a #, please drop the `|`s if you end up re-submitting. Otherwise,
>=20
> I think the `|` is needed because the messages contains a `:`? This is
> the case as the messages in this patch have a "Zvk:..." string.
> Removing the `|` makes dt_binding_check fail because of that.

Right you are. Please keep them so!

--YcnOMAWI/8l3k2Bk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK2fcAAKCRB4tDGHoIJi
0sA9AP9PT0XjbJmH26JVrXZ4zmZU6HqrgHX70VBPn0ThkaXXMwEAg8UsAr1Jm2ZB
aAgTSGrrXOlUT1di0+5Mgxs4ijOGogI=
=XdIy
-----END PGP SIGNATURE-----

--YcnOMAWI/8l3k2Bk--


--===============8303921280151575523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8303921280151575523==--

