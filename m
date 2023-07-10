Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC09EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 15:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovd9SvNpJ47TFQGe4fw7IwzCuitonooUoqjSyeAxSVQ=; b=RxE++BOJz/x9VAGEr1unzw85Z+
	YrdzOH92UN8rFMbNn2GKevp5JPDy3yafE6mTp0SQTxHIJ4qtvgq7vQnvx3JPHic7vEsBqtsjSti7k
	0uTQlVXIrFIfP7MhCvOKDnYzX6bemKxgLDviJKXzouMdBV5RlD1rrz0IpfZ9tIEVcIfR+FWGe7xHP
	u8NwY9QTg/OMCK7cgmYNZucRsdI+g+MZkeLOlxvJkI6hphEfBqMWXIIktBwp/jF6hyf4lbMfRRiX9
	8QRwxpgNQC3cBXzquipdPx86fSu8s8LxAlbllKPVM1BypqOZueNfdQVBjrkT65pWABRgFabZzKNnB
	YJb+pT1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIt2M-00C2b0-0s;
	Mon, 10 Jul 2023 15:42:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIt2K-00C2Ze-0P
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 15:42:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4164961070;
	Mon, 10 Jul 2023 15:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38172C433C8;
	Mon, 10 Jul 2023 15:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689003768;
	bh=MLkm2Efg9j8j0AApJz1dQVqV7X1VG6QWOQOfrXe3kPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rFxOpWlaPaIK0ysrxL/QJL3Cqc/8xF85GhTcg22mRqejW5TCuPF9WZ9NSiD+ZhsdD
	 jxP/uNptaTdppw5S2SGXnP+Y550EvEtY5ni7onUZCzgKlO2XiPUoS0hVKKS7wzqTJA
	 X6fw61TqMATPuETdMDLFTtjrjNe/12iyqRy7lNws4T9+G2W+vTmGDOFVB91q3II2NQ
	 Ir3IWmune9kQPQi4ZBekP+UCEB69dEia2CiNNXsYNrFil7VrUQyW32pjmKuUekbD+D
	 rrQZaCsPaDzdlRHEg3X5gUu2M2y8yCYbnmc3EhAFuT5NvL+2muKa6OoBkQE1W1z07Q
	 zVjdp0Dj9zcRw==
Date: Mon, 10 Jul 2023 16:42:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Samuel Ortiz <sameo@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
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
Message-ID: <20230710-education-evolution-f12520405842@spud>
References: <20230709115549.2666557-1-sameo@rivosinc.com>
 <20230709115549.2666557-3-sameo@rivosinc.com>
 <20230710151624.GA1987602-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230710151624.GA1987602-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_084252_251785_BDE1E579 
X-CRM114-Status: GOOD (  19.85  )
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
Content-Type: multipart/mixed; boundary="===============5098314556033166887=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5098314556033166887==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="33PrQJ5t6h82PbWt"
Content-Disposition: inline


--33PrQJ5t6h82PbWt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2023 at 09:16:24AM -0600, Rob Herring wrote:
> On Sun, Jul 09, 2023 at 01:55:44PM +0200, Samuel Ortiz wrote:
> > The RISC-V cryptography extensions define a set of instructions, CSR
> > definitions, architectural interfaces and also extension shorthands for
> > running scalar and vector based cryptography operations on RISC-V
> > systems.
> >=20
> > This documents all the dt-bindings for the scalar cryptography
> > extensions, including the Zk, Zkn and Zks shorthands.
> >=20
> > Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
> > ---
> >  .../devicetree/bindings/riscv/extensions.yaml | 82 +++++++++++++++++++
> >  1 file changed, 82 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/=
Documentation/devicetree/bindings/riscv/extensions.yaml
> > index cc1f546fdbdc..361756978da1 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -190,6 +190,24 @@ properties:
> >              instructions as ratified at commit 6d33919 ("Merge pull re=
quest #158
> >              from hirooih/clmul-fix-loop-end-condition") of riscv-bitma=
nip.
> > =20
> > +        - const: zbkb
> > +          description: |
>=20
> Don't need '|' if no formatting to preserve.

The existing binding only adds the `|` where the commit message contains
a #, please drop the `|`s if you end up re-submitting. Otherwise,

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--33PrQJ5t6h82PbWt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKwm8gAKCRB4tDGHoIJi
0lmVAP0dsukr8M+O+PT302/sFjsPmEzuEd8tDVvPqj1YwfVzkAD/SjAtHUhGT5OR
ns6O+iOSrmQmy4IV1qDjUf2BJD/wCgo=
=tIFO
-----END PGP SIGNATURE-----

--33PrQJ5t6h82PbWt--


--===============5098314556033166887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5098314556033166887==--

