Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83D5C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 18:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=150R6V/XifZoG2luMZJbDWWiqX5vhhwY978Y7vpKHtU=; b=u7lIZSjgv9J3cq2KWAerbYWVC1
	a/h9Y51QLJl8Nss9YEojZKgqHiAb0yXpfRg/hLVRhS1Wsl+Nteo+6u6d3lwtDAx9W1bJcN2KIwzC5
	Qu8fMZUxPQbWsKt3yReP9fbXEMiQk/6wb26nTfYbaXDDw69CEg60z63pYph7CB6da+rAFhGN5eVgS
	BdzW95Xnf3r6k4XaO5vWHNdKhOwMWeWOpgiQE1CXlHFYIXz+HriH83tyEyXG05HXZ/KMHixrZT3WO
	b+lNdy3f8SF9rdJrhXflo+OuxOnAWTV0d3Ag/J+gGx+c8KfRdZe5nxri0YXKZscdaD1qeA5LTwHTB
	o9dzbNCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2EJG-0000000ANnT-3ggv;
	Wed, 01 May 2024 18:04:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2EJA-0000000ANmI-1uhm;
	Wed, 01 May 2024 18:04:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 56F1CCE1296;
	Wed,  1 May 2024 18:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CB5C072AA;
	Wed,  1 May 2024 18:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714586633;
	bh=drTPFEBrSB98Q77bfO9fNzjeKZr9JPcrroYaZiR1E/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qN29Q61To54o4hphAo7D6ESVL5CLcZ22ZHpI0FyvYvFgLaFOBDvLlrbsKw9PUcy16
	 TdhZ8IltTvssrtMVEElRJH/lued5Rf9aQs3IwxXmxDMeOfCZkMXkPcVhn4/JicsHw5
	 B0UCecIgcjbVQEWadDfGNsMY/WIcfZWgJWkcZdQdn+grMkc4EW6c5HQ/M5qrSvfD7V
	 n+TDSu+G2xvUHeWKLLGMTrnbT2HYGkpmfC2D/dbyODDAShXE0KLAySIvrgReg8bZUj
	 lQLQRnOko30Wy0F+eHnN6YKuMuZWuj5rhHdeiU+ZzDDv+kmMt5ZvIv4AP+w+Bzt/x5
	 7IRI/B/fm+YVg==
Date: Wed, 1 May 2024 19:03:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Evan Green <evan@rivosinc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 05/16] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <20240501-banner-sniff-4c5958eb15ef@spud>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-5-b692f3c516ec@rivosinc.com>
 <CALs-HstM64Hy_=XVz=0sWQt=8j1u+bq6RhthUuD3P0E4=HyvcA@mail.gmail.com>
 <ZjKBKg5zzikR5ngl@ghost>
MIME-Version: 1.0
In-Reply-To: <ZjKBKg5zzikR5ngl@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_110359_494963_03146875 
X-CRM114-Status: GOOD (  19.26  )
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
Content-Type: multipart/mixed; boundary="===============4981638759022551149=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4981638759022551149==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DB2yQnBvjkhLdZ/3"
Content-Disposition: inline


--DB2yQnBvjkhLdZ/3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 01, 2024 at 10:51:38AM -0700, Charlie Jenkins wrote:
> On Wed, May 01, 2024 at 09:44:15AM -0700, Evan Green wrote:
> > On Fri, Apr 26, 2024 at 2:29=E2=80=AFPM Charlie Jenkins <charlie@rivosi=
nc.com> wrote:
> > > +       for (int i =3D 0; i < riscv_isa_vendor_ext_list_size; i++) {
> > > +               const struct riscv_isa_vendor_ext_data_list *ext_list=
 =3D riscv_isa_vendor_ext_list[i];
> > > +
> > > +               if (bitmap_empty(ext_list->vendor_bitmap, ext_list->b=
itmap_size))
> > > +                       bitmap_copy(ext_list->vendor_bitmap,
> > > +                                   ext_list->per_hart_vendor_bitmap[=
cpu].isa,
> > > +                                   ext_list->bitmap_size);
> >=20
> > Could you get into trouble here if the set of vendor extensions
> > reduces to zero, and then becomes non-zero? To illustrate, consider
> > these masks:
> > cpu 0: 0x0000C000
> > cpu 1: 0x00000003 <<< vendor_bitmap ANDs out to 0
> > cpu 2: 0x00000010 <<< oops, we end up copying this into vendor_bitmap
> >=20
>=20
> Huh that's a good point. The standard extensions have that same bug too?
>=20
> 	if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
> 		bitmap_copy(riscv_isa, isainfo->isa, RISCV_ISA_EXT_MAX);
> 	else
> 		bitmap_and(riscv_isa, riscv_isa, isainfo->isa, RISCV_ISA_EXT_MAX);

I suppose it could in theory, but the boot hart needs ima to even get
this far. I think you'd only end up with this happening if there were
enabled harts that supported rvXXe, but I don't think we even add those
to the possible set of CPUs. I'll have to check.

--DB2yQnBvjkhLdZ/3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjKEAgAKCRB4tDGHoIJi
0t4AAP48TlGaRjpIOJcoV+H8wuppgNwKKx3OUtSc+5sg9jOMTgD/cl2e9XPolr3n
9O0nDbaTisOGW7yGRdUZvJ0dsEhOqwE=
=mFwP
-----END PGP SIGNATURE-----

--DB2yQnBvjkhLdZ/3--


--===============4981638759022551149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4981638759022551149==--

