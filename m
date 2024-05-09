Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A450BC25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 18:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DBXRj+BBQ+nxChG62gS/h9lXLnKpPHOAUrdjcSzRUk=; b=1cTDPL8B9lxGEVs7gUzG+BamHO
	nOWqOqPdj8kBsCePf/gTDDo4/qg2sB5Ik3PR97JJEHn6gbdr/V2aGeGE1vzsCbM1gjjjl+J8g77KV
	xCdWTPY2OV/XIJ4CS0rl5h/GQaaCoC7lQihl9yxuiHhL3ndJPtjpaHNjwzJZ+pI7VrSSPd+3RyoxY
	WMoE91HXxcjaUHbkOosD6hylbZoJTDdt/nXrLCy0C2jZ/T6bTlGuaIvvUrWS1md/+cV1ZumOLF4sn
	KEtcM/7hb9isKH4H+Hf5aDqwk7BdjODdI1msp6dWaFne1JyhlAteOo52yLPqpz2/zwOgnaUM8n1jR
	4BqLorXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s58I2-00000002LRT-4Atg;
	Thu, 09 May 2024 18:14:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s58Hz-00000002LQ4-1uxY
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 18:14:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D2ED61DA4;
	Thu,  9 May 2024 18:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7996C116B1;
	Thu,  9 May 2024 18:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715278482;
	bh=hRafjKR2nz/ik0Ybw1Y2FxPsUTThAfB6fkIwc8yWrHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CcnwgtVCG7xfa9ZqQX9x5aPbB8jIN4eai6HbmPjX9FQGjkRwgfJVizpa671LV5kCx
	 9QcKPdInn/8JQKidSZN9Eu35JSLnJY15KbOhzGq2w8HE2bY9uZkyk0U+HBxZ7kiM+V
	 aysA3CouUg5fksg2k89YsqHNjChC1e+QIExkTm0ZKsenA/hFkA7dd0bD95DC+Uf844
	 S+V1pAlVgGoxrbl2rRuhbFPPz1m/SuYxirzNkqJDLeYRmYySS3s37N8IkpGSb7eQDm
	 BjuX/N9hoEsXnMZUjzWd0dYjjFNG4QGZO2CS7ceb+lKr8CXBBTstrnjgSa7sJEb+st
	 WQf+eKiLwhByQ==
Date: Thu, 9 May 2024 19:14:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>, paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com, broonie@kernel.org,
	Szabolcs.Nagy@arm.com, kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	cleger@rivosinc.com, atishp@atishpatra.org, alex@ghiti.fr,
	bjorn@rivosinc.com, alexghiti@rivosinc.com,
	samuel.holland@sifive.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
	corbet@lwn.net, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	charlie@rivosinc.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, dbarboza@ventanamicro.com,
	sameo@rivosinc.com, shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 04/29] riscv: zicfilp / zicfiss in dt-bindings
 (extensions.yaml)
Message-ID: <20240509-cornflake-foyer-e6589c2bc364@spud>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-5-debug@rivosinc.com>
 <20240410115806.GA4044117-robh@kernel.org>
 <CAKC1njSsZ6wfvJtXkp4J4J6wXFtU92W9JGca-atKxBy8UvUwRg@mail.gmail.com>
 <20240415194105.GA94432-robh@kernel.org>
 <Zh6c0FH2OvrfDLje@debug.ba.rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <Zh6c0FH2OvrfDLje@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_111443_627652_2E9A1791 
X-CRM114-Status: GOOD (  27.24  )
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
Content-Type: multipart/mixed; boundary="===============3570742223195251867=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3570742223195251867==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JhRnWmWpnp4za6Qf"
Content-Disposition: inline


--JhRnWmWpnp4za6Qf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 08:44:16AM -0700, Deepak Gupta wrote:
> On Mon, Apr 15, 2024 at 02:41:05PM -0500, Rob Herring wrote:
> > On Wed, Apr 10, 2024 at 02:37:21PM -0700, Deepak Gupta wrote:
> > > On Wed, Apr 10, 2024 at 4:58=E2=80=AFAM Rob Herring <robh@kernel.org>=
 wrote:
> > > >
> > > > On Wed, Apr 03, 2024 at 04:34:52PM -0700, Deepak Gupta wrote:
> > > > > Make an entry for cfi extensions in extensions.yaml.
> > > > >
> > > > > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> > > > > ---
> > > > >  .../devicetree/bindings/riscv/extensions.yaml          | 10 ++++=
++++++
> > > > >  1 file changed, 10 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.y=
aml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > index 63d81dc895e5..45b87ad6cc1c 100644
> > > > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > @@ -317,6 +317,16 @@ properties:
> > > > >              The standard Zicboz extension for cache-block zeroin=
g as ratified
> > > > >              in commit 3dd606f ("Create cmobase-v1.0.pdf") of ris=
cv-CMOs.
> > > > >
> > > > > +        - const: zicfilp
> > > > > +          description:
> > > > > +            The standard Zicfilp extension for enforcing forward=
 edge control-flow
> > > > > +            integrity in commit 3a20dc9 of riscv-cfi and is in p=
ublic review.
> > > >
> > > > Does in public review mean the commit sha is going to change?
> > > >
> > >=20
> > > Less likely. Next step after public review is to gather comments from
> > > public review.
> > > If something is really pressing and needs to be addressed, then yes
> > > this will change.
> > > Else this gets ratified as it is.
> >=20
> > If the commit sha can change, then it is useless. What's the guarantee
> > someone is going to remember to update it if it changes?
>=20
> Sorry for late reply.
>=20
> I was following existing wordings and patterns for messaging in this file.
> You would rather have me remove sha and only mention that spec is in publ=
ic
> review?

Nope, having a commit sha is desired. None of this is mergeable until at
least the spec becomes frozen, so the sha can be updated at that point
to the freeze state - or better yet to the ratified state. Being in
public review is not sufficient.

Cheers,
Conor

--JhRnWmWpnp4za6Qf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj0SggAKCRB4tDGHoIJi
0mvjAP9d3Qz1PVGc/kOj+XdEfO1FrKoEF9VSW9XYGpnlZvSRVAEAhzTts4ymraHs
rig86vUonyRRKcngwn/ZR5KdPHqJ3ws=
=NfI8
-----END PGP SIGNATURE-----

--JhRnWmWpnp4za6Qf--


--===============3570742223195251867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3570742223195251867==--

