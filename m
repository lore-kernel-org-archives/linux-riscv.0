Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EBFC43327
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 14:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BboYCRGIaj0YhwCyNoJLiGQpFmyP1d+fA0XWo9pDms=; b=U0C4voR/KcRCuRO2I5ejGBDQm2
	3s/Uq2FgRKcrpAfiWTjRNZTPPnZ1yEqW6QI8AuG0IVSdoBjy7bKjHcYTfLaN5SAHvZ/GtHD/joZGi
	OlA9238WNMV8NFVH4931KIwO324rpQ21fJKzXppJKGdnDxogwADe7FQ8gHvzKdcXL4Ao/xoM1jeXE
	s/tGgdjRfGSobcT0/gGSCEEetbCPhDa5Od0/r7RU9WAVi0DLrIC9qO+oVtApZqEHJpJydK8WrK6Ot
	fVhOT/75xrupDZkZ+fmwt+mOFlLqanDdirxGloI8Ay6At7cm4D1yMbBqQGLdRyGYtyPaNpWo5GjPS
	IDvQ6smQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7fj-0000000BTSB-3CE4;
	Fri, 26 Jun 2026 14:36:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7fi-0000000BTRt-3FYS
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 14:36:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D6D0414DF;
	Fri, 26 Jun 2026 14:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBCC1F000E9;
	Fri, 26 Jun 2026 14:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782484606;
	bh=pRWXUr9PEsOOHoCTMIoYcLvGzO9hsV6w0BemUsTACKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ig9QYiqKEAA1m2n8rFfi/twGt5qWNi6m19j7wpVmTDsBJ/5RQcoM+FqyhGrMl5CPn
	 9b5fnFkkj4BGqnidDmdIZnd85aONWh3DOcv/u58o0m5urZEuKLHbCc3Ra1sv0b0nCy
	 XmXDxAKYztgKz5tMQQsCiI6rXWlsOmWs8wcXi3wC6h1qyInvD0j8JG+U19leyB67PG
	 Jbh6CQ/gxjlBrXkGqB4R+4e42KIzwlyYXx+Vs70sE2uGlYGjiIR9s9SYEKMiZgBnUs
	 aA3lLQFS18gcGZJ5FnqNVmyhsyxhooGbRl2n/axEmKk7AJlv5CIBLnnjneof5IRVjE
	 DiNHaw6MOP+/w==
Date: Fri, 26 Jun 2026 15:36:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	dlan@kernel.org, guodong@riscstar.com, dfustini@oss.tenstorrent.com,
	michal.simek@amd.com, junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn, luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com,
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com,
	robin.randhawa@sifive.com, scott@riscstar.com,
	dave.patel@riscstar.com, raymond.mao@riscstar.com
Subject: Re: [RFC PATCH 2/3] dt-bindings: riscv: Add Worlds per-hart
 properties
Message-ID: <20260626-chitchat-purity-33af51f88380@spud>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
 <20260619105834.1277302-3-peter.lin@sifive.com>
 <20260622-profanity-herbs-1cc1bcf6206f@spud>
 <aj5m00m4KxRAPAnB@plin-1878>
MIME-Version: 1.0
In-Reply-To: <aj5m00m4KxRAPAnB@plin-1878>
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
Content-Type: multipart/mixed; boundary="===============3852185503956392239=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3852185503956392239==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b24ma/P19nA0VTmv"
Content-Disposition: inline


--b24ma/P19nA0VTmv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 07:47:31PM +0800, Yu-Chien Peter Lin wrote:
> Hi Conor,
>=20
> On Mon, Jun 22, 2026 at 06:12:47PM +0100, Conor Dooley wrote:
> > On Fri, Jun 19, 2026 at 06:58:33PM +0800, Yu-Chien Peter Lin wrote:
> > > Add per-hart DT properties for RISC-V Worlds architecture:
> > > riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
> > > platform-defined values are primarily used by M-mode firmware
> > > to configure World ID CSRs and restrict WID usage across
> > > privilege levels.
> > >=20
> > > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > > ---
> > >  .../devicetree/bindings/riscv/cpus.yaml       | 21 +++++
> > >  .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++++++++++=
++
> > >  2 files changed, 98 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/riscv/worlds.ya=
ml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Docu=
mentation/devicetree/bindings/riscv/cpus.yaml
> > > index 5feeb2203050..4b5778b6d3e7 100644
> > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > @@ -26,6 +26,7 @@ description: |
> > >  allOf:
> > >    - $ref: /schemas/cpu.yaml#
> > >    - $ref: extensions.yaml
> > > +  - $ref: worlds.yaml
> > >    - if:
> > >        not:
> > >          properties:
> > > @@ -120,11 +121,31 @@ properties:
> > >        thead systems where the vector register length is not identica=
l on all harts, or
> > >        the vlenb CSR is not available.
> > > =20
> > > +  riscv,pmwid:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Platform-defined M-mode World ID (WID) assigned to this hart.
> > > +    minimum: 0
> > > +    maximum: 63
> > > +
> > > +  riscv,pmwidlist:
> > > +    $ref: /schemas/types.yaml#/definitions/uint64
> > > +    description:
> > > +      Platform-defined bitmap of M-mode World IDs (WIDs) that this h=
art may use.
> >=20
> > I don't understand what the difference is between this property and the
> > one before it are.
> > Is this one meant to be used by m-mode software to then select one which
> > will appear in riscv,pmwid?
>=20
> pmwid (single value) is the reset default, while pmwidlist (bitmap)
> defines the allowed set. The root-of-trust M-mode software may select
> an allowed value from the pmwidlist and write it to the mwid CSR.

I don't understand the point of the property then. If it is the reset
default, just read it out of the register?
Unless I am missing something, it's useless to s-mode because it may
not be what m-mode chose and useless to m-mode that has access to
the csr.

Cheers,
Conor.

--b24ma/P19nA0VTmv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj6OcwAKCRB4tDGHoIJi
0uraAP0VIc7uu6TZluxJwX1wcbBhf0U6wqp0dpR0Zb8yYEKnugD+JqtwpUz5u7Rz
k3+2geeKvfzF9RbQeDPvaD4Hy+7XNA4=
=DJ5l
-----END PGP SIGNATURE-----

--b24ma/P19nA0VTmv--


--===============3852185503956392239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3852185503956392239==--

