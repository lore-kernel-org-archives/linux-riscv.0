Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420A5C3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 15:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPXvSBxLZS1jTFp3fxOvc+7Q9wJY0HQhAVehNRZ2Lxs=; b=efeJSvNL1qhvXjTUvm2x35LtUi
	tYQ6qOjBB9Bxsv++69pCD8/R0hlvID/G77IGfQ5SemY27OREWIjRrqlDjal4S3MwxlSOAMc3P1WIn
	L+uHSbR+jSbXmPYahwzfUCf+jMoDHPOuzwrccqC9frxzSUtIb6M0+GnKtwTEWmm5kFjculH4OzGol
	I8fcgcwjxOTUbTTuAZLr7TEJyYGW/YiJalfDe0hywcpG0yEeabsWsgKmLyjYHIeJcrUwoR9iI56ks
	aTBBoFb3h7lJgqppLgS4VpK13weUinjSZXbmfVHUnqvduNc43baZ5pBXcl3N8o4CRiUpZLGayE2Gy
	Lf0ZnPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdXPk-00000000oVU-0gfu;
	Mon, 12 Aug 2024 15:56:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdXPh-00000000oUS-0k9D
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 15:56:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 00270CE0FC0;
	Mon, 12 Aug 2024 15:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025E0C32782;
	Mon, 12 Aug 2024 15:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723478210;
	bh=4e6n6x92NqR9MazOboeLoHPGK4lVmsG86VhQltVlHWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vKnVNvPbsccKLigIcSzPDPIcxRbt14nNxS0R8oPjsUpRSOyH3dFuExFnz2wBg8Xob
	 KwK3j8pUKfJp95jaPS5zVNnhb5idDgyLDsjMVmM5XHeq5Hu1lewLpywzwTumyCeVJ5
	 gwjAYzyNCZi7hebQpqq1PDbjEwZPx+LTY5hZyr4NyKIwrmM2jwdm654gbe9zN369XN
	 TQaEYWvaXU6O2HVaHILIzd2XBDe/ZefkVmvS6dVyAB17sgrqJDQXM7MyNG8HRYe6Sp
	 EeHc8R4GAnwGDbFPZoAmAHdlzXkKi2ONO0LnxeCKl41/Yf5lPBYn+0dcYlvFf+MK3i
	 DWOdhCpbikSuA==
Date: Mon, 12 Aug 2024 16:56:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>, Jesse Taube <jesse@rivosinc.com>,
	linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH 2/2] dt-bindings: riscv: Add Zicclsm ISA extension
 description.
Message-ID: <20240812-rogue-enable-9194afe10621@spud>
References: <20240809162240.1842373-1-jesse@rivosinc.com>
 <20240809162240.1842373-3-jesse@rivosinc.com>
 <20240809181536.GA976083-robh@kernel.org>
 <ZrZmTvJgyQ5nB70H@ghost>
MIME-Version: 1.0
In-Reply-To: <ZrZmTvJgyQ5nB70H@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_085653_582279_2FBA9082 
X-CRM114-Status: GOOD (  18.69  )
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
Content-Type: multipart/mixed; boundary="===============8854937244314468833=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8854937244314468833==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5oUgzud46N4jhbzw"
Content-Disposition: inline


--5oUgzud46N4jhbzw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2024 at 11:56:14AM -0700, Charlie Jenkins wrote:
> On Fri, Aug 09, 2024 at 12:15:36PM -0600, Rob Herring wrote:
> > On Fri, Aug 09, 2024 at 12:22:40PM -0400, Jesse Taube wrote:
> > > Add description for Zicclsm ISA extension.
> > >=20
> > > Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> > > V1 -> V2:
> > >  - New patch
> > > V2 -> V3:
> > >  - No changes
> > > V3 -> V4:
> > >  - No changes
> > > V4 -> V5:
> > >  - No changes
> > > V5 -> V6:
> > >  - No changes
> > > V6 -> V7:
> > >  - No changes
> > > V7 -> V8:
> > >  - Rebase onto 2d1f51d8a4b0 (palmer/for-next)
> >=20
> > Please also put the version in the subject. '-vN' is the git-send-email=
=20
> > option to do it for you.
> >=20
> > Rob
> >=20
>=20
> These patches were originally part of a different series [1] but are no
> longer related to that series so I had asked Jesse to spin these off into=
 a
> different series. These version tags probably should not have been left
> on here when made into this new series though.

I dunno, I disagree. I think the versioning should continue on being
split - especially when there's been tags provided on earlier versions.

--5oUgzud46N4jhbzw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrowuQAKCRB4tDGHoIJi
0jq+AQCp+/d4fJsH+1tFW/4KT0Q0ZRrPKVNCwnFEAIbB7uO4+AD8DA2HB1PxjGsW
KBrdfSC7D857tJ/2h3QaZbYOyeNjAQ4=
=sOnO
-----END PGP SIGNATURE-----

--5oUgzud46N4jhbzw--


--===============8854937244314468833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8854937244314468833==--

