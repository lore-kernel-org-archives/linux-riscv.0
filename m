Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC82CFC5E4
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 16:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5B3Zg7zqgFbwHSS6A9VrE2X1xMkSVzlnyYtbmz1pws=; b=2ypfYBp1lw93UZkV5NHLxiXLyv
	ADT+/MJFAjbQbDsDdXz9s69xwWquuw7rZIQReHQP++VSAV3GffWgp7kBVNn4oAn7GdEgUys8+Gzho
	pn3QA0qev7lB7n81jtEWTHGZloHdDPaeLfVn3g4d20HXpzt44OoBr+qVlL+2aQcT3tTZrvxqLUJxg
	l/COZMIER+VHj9rF0t8m247h7DvEJeQEsRuANEYxPhskYHd59b+b7S+d7dD54SWpyjZ8R5qAbsW2i
	3TP30ZLOW+Gi7eGfo1CrvOcynuUyMySew6IJtroCx56MqKeQkrmGjY+H7P1aPR4X5mrXwg6IywXJ5
	1+wkzmQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syw82-0000000DXuN-1aK2;
	Thu, 10 Oct 2024 16:35:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syvqV-0000000DUXL-19ig
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 16:17:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 222CDA44B9D;
	Thu, 10 Oct 2024 16:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1AAFC4CEC5;
	Thu, 10 Oct 2024 16:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728577017;
	bh=voGVJTL+cAj6EmXPR+KQJh9ISLK3DMAUVPirCQBGkik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0I54elwvtUsv/BNkncmFRr3FnQw1wYW4MAwz+lOyhu2lmD+2DO3YJmOhuSyC97Zh
	 TXouELUyGL8SJqJcZdZApJm545a1UzQt4g4aPOpat+cVu0OpvWtg1mEave1Q0Qz0Bh
	 sDu+4Ym++e5RZezklw3A/IlGVg/4JlZYssR+oO6jb3RoKcqvCnQRHq84GmSVJ02Laj
	 Z3/pXkavUIIRo7h4ONPbjmlV4n8K5Jq+oDJFpEBdmZvfkKeXbaIrfDI3wP/Y1PF0Fo
	 C3vbq1hnrf4FdrQNOhJy/jp8jYHWZpqJ3X+d/2453D2TThC4TAIcdu+cJL8if2K28P
	 koSx87d8f32fw==
Date: Thu, 10 Oct 2024 17:16:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Inochi Amaoto <inochiama@outlook.com>, Guo Ren <guoren@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: interrupt-controller: Add Sophgo SG2044
 ACLINT SSWI
Message-ID: <20241010-playtime-liquid-cf9888d27052@spud>
References: <20241004080557.2262872-1-inochiama@gmail.com>
 <20241004080557.2262872-2-inochiama@gmail.com>
 <20241004-patronize-doily-8406fa214347@spud>
 <42ndts6wuoor3tbt3uv5kuco37kc6bnnoepqtauqosw2gg2xn7@7hfdc6wgvlsm>
MIME-Version: 1.0
In-Reply-To: <42ndts6wuoor3tbt3uv5kuco37kc6bnnoepqtauqosw2gg2xn7@7hfdc6wgvlsm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_091659_482167_20499B73 
X-CRM114-Status: GOOD (  29.38  )
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
Content-Type: multipart/mixed; boundary="===============4155131097153538073=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4155131097153538073==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NLIrl1uOyUVux6/2"
Content-Disposition: inline


--NLIrl1uOyUVux6/2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 05, 2024 at 08:46:37AM +0800, Inochi Amaoto wrote:
> On Fri, Oct 04, 2024 at 04:44:22PM +0100, Conor Dooley wrote:
> > On Fri, Oct 04, 2024 at 04:05:55PM +0800, Inochi Amaoto wrote:
> > > Sophgo SG2044 has a new version of T-HEAD C920, which implement
> > > a fully featured ACLINT device. This ACLINT has an extra SSWI
> > > field to support fast S-mode IPI.
> > >=20
> > > Add necessary compatible string for the T-HEAD ACLINT sswi device.
> > >=20
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > ---
> > >  .../thead,c900-aclint-sswi.yaml               | 58 +++++++++++++++++=
++
> > >  1 file changed, 58 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/interrupt-contr=
oller/thead,c900-aclint-sswi.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/t=
head,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-co=
ntroller/thead,c900-aclint-sswi.yaml
> > > new file mode 100644
> > > index 000000000000..0106fbf3ea1f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c9=
00-aclint-sswi.yaml
> > > @@ -0,0 +1,58 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/interrupt-controller/thead,c900-a=
clint-sswi.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Sophgo sg2044 ACLINT Supervisor-level Software Interrupt Devi=
ce
> > > +
> > > +maintainers:
> > > +  - Inochi Amaoto <inochiama@outlook.com>
> > > +
> > > +description:
> > > +  The SSWI device is a part of the riscv ACLINT device. It provides
> > > +  supervisor-level IPI functionality for a set of HARTs on a RISC-V
> > > +  platform. It provides a register to set an IPI (SETSSIP) for each
> > > +  HART connected to the SSWI device.
> >=20
> > If it is part of the aclint, why should it have a separate node, rather
> > than be part of the existing aclint node as a third reg property?
>=20
> For aclint, the current nodes that have documented are mswi and mtime.
> Since the mtime is a M-mode time source, it is not suitable to add the
> sswi reg into this device. For mswi, it is OK to add a sswi reg, but
> this will cause problem while checking "interrupt-extend". Do we just
> double the maxItem? Or just left it unchanged?
>=20
> Another reason to add it as a separate node is that the draft says
> sswi can be multiple. If we add this device by adding reg. It will be
> hard if we have multiple sswi devices but one mswi device.

Ah, I see we do indeed have 2 devices already for the aclint, one for
mswi and mtimer.

--NLIrl1uOyUVux6/2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZwf98wAKCRB4tDGHoIJi
0tquAQCi8VLHi3iAdTSDUqGhkFnId5un/ek8rvYQaquTvHU4sAD/el+Rhz0sf/CY
mqYHgZepBr3qqOqJeAvrc6p2sIuS2A4=
=6zwW
-----END PGP SIGNATURE-----

--NLIrl1uOyUVux6/2--


--===============4155131097153538073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4155131097153538073==--

