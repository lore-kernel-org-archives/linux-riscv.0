Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB58C28B28
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 13:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5cdBd/ClL4nsZGWr4diwEfuzWp+7zmVltW6f0CwySw=; b=jDTYNcswUUYgjwKJEDLti1djXu
	FfI5MYftPWIskcOEmDKy3xyymQ/qO8Titk+4moP/dZyC47oUJIeAsb/7Em5Gcdtvaz7wcJo0XVrEq
	vWXI/8s27gO8cM94IhCgTgOXEaDXlpFt9VStgfNY2kMRDayl913hAkMJp1Y2j3iGly3vWD1aMB004
	wtGxbv+o4mFUL+AYj76v3PTNOkJpqnm0ugM3NJlfPSHi3Wbhf2B8amnQn6xeGG4CPIEEjUZ69k6da
	E156HKOx5VlLY2IShuPKPS+GUgTcP/5ZWx/1PCPPedcx6azOu214CDx3B1b8p9Hv5P2EyrGzcIJ3k
	GFHFnFjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLpd-00000008WTW-0WID;
	Wed, 12 Mar 2025 13:09:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLY7-00000008SvI-0yTw
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 12:51:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1CBA5C5A18;
	Wed, 12 Mar 2025 12:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E436C4CEE3;
	Wed, 12 Mar 2025 12:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741783862;
	bh=6rYvu3ypCkOsZirJfiuRrHLmYoQEVDdMOsLJXAG7xN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jn68zqO3cR5YMuyMQ9UAjbUTN43VYWcotjS3h1cr30W/Fz3lr3/pgTyganZzg4smW
	 qDCyd7jEcdx53zHs2Zcd4BxnwlJdsw0yV8If5N1f78WiyVDRUSfp8pHNy0vaoUUpBB
	 ka7qOqKGLeesTCalK0FUM3LtoYSsVrwXPDAPTDGgwL5+pEbQlXwdTrpu61nX3/57jO
	 xA0N05/lV92AkhN5888csRZ+Nv2/fcDb1hhhh5Zfaij0fidYzRfIB8UqtIUqQVdXUm
	 dlA99+ReL4OP8q4NdrXusf1lUjh+6bWlN7D0CBHESvsCWl4NPXzZAqpGIeYDu5LUKw
	 RMuPO064s5baQ==
Date: Wed, 12 Mar 2025 12:50:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Matthias Brugger <matthias.bgg@kernel.org>
Cc: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl, Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] dt-bindings: riscv: Add SiFive HiFive Premier P550
 board
Message-ID: <20250312-unloving-shamrock-babbedab8cbe@spud>
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
 <20250311073432.4068512-5-pinkesh.vaghela@einfochips.com>
 <Z9F3_Zb4RvHLvgSd@ziggy.stardust>
MIME-Version: 1.0
In-Reply-To: <Z9F3_Zb4RvHLvgSd@ziggy.stardust>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_055103_353767_BC32A852 
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
Content-Type: multipart/mixed; boundary="===============0977139360712344604=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0977139360712344604==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Zt/ZnHn6R085mdRK"
Content-Disposition: inline


--Zt/ZnHn6R085mdRK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 01:03:09PM +0100, Matthias Brugger wrote:
> On Tue, Mar 11, 2025 at 01:04:26PM +0530, Pinkesh Vaghela wrote:
> > From: Pritesh Patel <pritesh.patel@einfochips.com>
> >=20
> > Add DT binding documentation for the ESWIN EIC7700 SoC and
> > HiFive Premier P550 Board
> >=20
> > Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> > Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> > ---
> >  .../devicetree/bindings/riscv/eswin.yaml      | 29 +++++++++++++++++++
> >  MAINTAINERS                                   |  6 ++++
> >  2 files changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/eswin.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/riscv/eswin.yaml b/Docum=
entation/devicetree/bindings/riscv/eswin.yaml
> > new file mode 100644
> > index 000000000000..c603c45eef22
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/eswin.yaml
> > @@ -0,0 +1,29 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/riscv/eswin.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ESWIN SoC-based boards
> > +
> > +maintainers:
> > +  - Min Lin <linmin@eswincomputing.com>
> > +  - Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> > +  - Pritesh Patel <pritesh.patel@einfochips.com>
> > +
> > +description:
> > +  ESWIN SoC-based boards
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - sifive,hifive-premier-p550
> > +          - const: eswin,eic7700
>=20
> That should be the other way around. You could have, let's say eic7701
> with different peripherals but smae p550 IP core. I don't expect a new
> eic7700 with a CPU IP other then p550.

No, this is correct. The SoC is made by Eswin (eic7700) and the board
(hifive premier) by SiFive. None of the compatibles listed here are for
the IP core.

If there's another SoC with different peripherals and the same p550 IP
core, I would expect a new SoC compatible /and/ a new board compatible.

Cheers,
Conor.

--Zt/ZnHn6R085mdRK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ9GDLwAKCRB4tDGHoIJi
0p9mAQCg9E5gJqtTAUQyV0MdPda6ImaeAtaeO9C49jodJHDuDgD/TWh7dIoVaMlp
ncCuRxGiz+l4FIYXdmWDQkAx4jjqfww=
=WEsp
-----END PGP SIGNATURE-----

--Zt/ZnHn6R085mdRK--


--===============0977139360712344604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0977139360712344604==--

