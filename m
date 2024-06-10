Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6655C27C5E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 19:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fh/xEBVhMaTo1hgmKFCtGZvBJFjUECXq1U7AjnwbEHc=; b=r37SdnO6ZRlaI8cONXkvtJS1Uf
	J/3uzn+JNxj1nJR17s2ZX3keHZYJl+K89C3D7JQAb5mRQEfrYHvpMyVmJn2vQC1+0nbqS2z7KxFI0
	vmT/xoG6adZHSZwepFEa0P+Ja9b+9+8IcDKMcltzxB7qlijz/9fVAajfccTKIJ6nz9GLAZKsPwa6Q
	7Vr0g/nIbRLXckFpAJq5t/SS1fuxRlvJRZWIVOtFlVWipECBL/XNxwlluHZjmOzd7oxQIKvbPdsRN
	Y+xIQN4TXaKpSEbTAlbsNSFqC0RwWeSstU8trh+6tg1K1cyotUd1XtSMg7PsTj7GoVN/9leMrgoOS
	llLu/5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGkgy-00000006GPr-1Wmd;
	Mon, 10 Jun 2024 19:28:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGkgv-00000006GOt-1DeH
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 19:28:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 916C260C0D;
	Mon, 10 Jun 2024 19:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468B4C4AF1A;
	Mon, 10 Jun 2024 19:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718047708;
	bh=9PZjDT0V6Lj4GRK41zPSetvsgEiAtuFunhoEXkc3IY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TzjQlIS/V6CcADcn39qu2MVD/FOA+Yr1qULzWAMawj4+ebOtJTsjTS8PWQReYHTUG
	 t+b10QtTD4rZWBvXYcPEAXJyraxXaxdRcUcmIa/r/WJBUz8+ASC1ep3qdO5S8FAOBU
	 OBfzwXkUZW57K73lsfZdzbkmqc3oyftFUt8BMrHSkwiTqIovF/ssJpOtVa9PkT7fJb
	 W4+IRELYJ3POTYVbrVtiGU6Vl1PfN4RwR978eiSDoU7Dr/53/hcmvcGsZWM9uyEIsa
	 P+HafwBaOUMhDp8SPgHnxzpgbr8YJHO+llEdJbpVEgLymDlFY+Q3jKcbI47wglfe73
	 ALVBkh4DUZJdg==
Date: Mon, 10 Jun 2024 20:28:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 02/13] dt-bindings: thead: add a vlen register length
 property
Message-ID: <20240610-envision-impart-7211e512f987@spud>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
 <20240609-xtheadvector-v1-2-3fe591d7f109@rivosinc.com>
 <20240610-unaltered-crazily-5b63e224d633@spud>
 <Zmcr7pP+XEWHYTsy@ghost>
MIME-Version: 1.0
In-Reply-To: <Zmcr7pP+XEWHYTsy@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_122829_559595_A5F11EFB 
X-CRM114-Status: GOOD (  26.20  )
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
Content-Type: multipart/mixed; boundary="===============6390289757090581390=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6390289757090581390==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zZEd5eFtiVuoCvyW"
Content-Disposition: inline


--zZEd5eFtiVuoCvyW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 09:38:06AM -0700, Charlie Jenkins wrote:
> On Mon, Jun 10, 2024 at 05:29:23PM +0100, Conor Dooley wrote:
> > On Sun, Jun 09, 2024 at 09:45:07PM -0700, Charlie Jenkins wrote:
> > > Add a property analogous to the vlenb CSR so that software can detect
> > > the vector length of each CPU prior to it being brought online.
> > > Currently software has to assume that the vector length read from the
> > > boot CPU applies to all possible CPUs. On T-Head CPUs implementing
> > > pre-ratification vector, reading the th.vlenb CSR may produce an ille=
gal
> > > instruction trap, so this property is required on such systems.
> > >=20
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> > >  Documentation/devicetree/bindings/riscv/thead.yaml | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Doc=
umentation/devicetree/bindings/riscv/thead.yaml
> > > index 301912dcd290..5e578df36ac5 100644
> > > --- a/Documentation/devicetree/bindings/riscv/thead.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/thead.yaml
> > > @@ -28,6 +28,13 @@ properties:
> > >            - const: sipeed,lichee-module-4a
> > >            - const: thead,th1520
> > > =20
> > > +thead,vlenb:
> >=20
> > This needs to move back into cpus.yaml, this file documents root node
> > compatibles (boards and socs etc) and is not for CPUs. If you want to
> > restrict this to T-Head CPUs only, it must be done in cpus.yaml with
> > a conditional `if: not: ... then: properties: thead,vlenb: false`.
> >=20
> > Please test your bindings.
>=20
> Now that I know `make dt_binding_check` exists I will use that in the
> future!

And in this case dtbs_check would also complain about riscv,vlenb being
undocumented - and complain about thead,vlenb not being a permitted cpu
property either.

Thanks,
Conor.

--zZEd5eFtiVuoCvyW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmdT1gAKCRB4tDGHoIJi
0gELAP9N4Tu6RdQuKtMCvloFTO6BrRXNU2iSwXxMepsikmv0PQEAsVNMYTrc/cIX
AooXc0b3saxiQGxb2MiZo/UtbA/dcAo=
=DctY
-----END PGP SIGNATURE-----

--zZEd5eFtiVuoCvyW--


--===============6390289757090581390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6390289757090581390==--

