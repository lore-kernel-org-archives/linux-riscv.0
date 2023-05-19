Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565BAC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 11:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHokcizUpdrozl0f7B8dNCP0MZZfOAL38Sar4l3jy60=; b=p9IJIx0Bub5Jn9IvQ5qnP25TtA
	K9GAa871KmSVbRiznPrNpTanTK/XkU2zhrbYgwE9CDzidvkKRbWZOfczh4ZWWwtGE1PSRF9opBu2s
	48iMUxuUbM04gR/Xtl6V0ecbneGdAKnF3LatcJtOXYeE+RO1JrZX/P1xaOVXSgUwGIVdb3uhLolp0
	15tcLGcaduZXBIMjaa2AENIvxAcV8ky3CvUjEu/96bTiikhI7h2BoqXp0QY+GaMCxyFbDdHHtuNGR
	lD4uEjDnZc6pjPTErQwmkopunzzc5++kaZHYH4NVfb/6QGFPkbOXLRpo95tQ+kZ7LWSj9mf+/Mpsx
	QDrzJcJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzyho-00GAGh-2P;
	Fri, 19 May 2023 11:55:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzyhl-00GAG2-0S
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 11:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684497329; x=1716033329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZcnD1s9sB8FFoJCCwAYWXI3hUc+y0AnVUaksQh1t5oY=;
  b=lhj8xzSJ78ox2FG/m9Hv+naHxZqQa2YZeaofYYPP49xpuZhU3r8VUZC4
   yblX68jfLfC6WJtC7vfU37Gi5mffnB7iB854Cd5srz08+QreO67E+ytFb
   K3bxCwjSXgFilOntwxzlrfMkibmhW7YwFgHVHifbfPq2lVkF+q8OYDHQE
   bAKe6GGJzTZkwFNL+U90m6CU41E+UZU0Lj++uzYeQD5ritue6eALC18w8
   gPcKvb781iNY+CNN+4kHv30mDFvWyYQQshGHljCfYL5fgPFDNkd62lfFE
   yQzoe9GJaxRZfYH1AjDdFMfrXD/ynu8/uhTBuwxfuW7x56GJVSJXoUT0o
   g==;
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="asc'?scan'208";a="214581983"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 May 2023 04:55:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 19 May 2023 04:55:26 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 19 May 2023 04:55:24 -0700
Date: Fri, 19 May 2023 12:55:02 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel@sholland.org>
CC: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 06/10] dt-bindings: riscv: Add bouffalolab bl808 board
 compatibles
Message-ID: <20230519-squad-undermine-6124aafebafa@wendy>
References: <20230518152244.2178-1-jszhang@kernel.org>
 <20230518152244.2178-7-jszhang@kernel.org>
 <c6e44e14-35b2-da09-5e8c-4d47e7a7a055@sholland.org>
MIME-Version: 1.0
In-Reply-To: <c6e44e14-35b2-da09-5e8c-4d47e7a7a055@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_045529_368859_2F54511D 
X-CRM114-Status: GOOD (  37.18  )
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
Content-Type: multipart/mixed; boundary="===============1981876316903993687=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1981876316903993687==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LxBuwS+otbeaG+3j"
Content-Disposition: inline

--LxBuwS+otbeaG+3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 10:31:35PM -0500, Samuel Holland wrote:
> Hi Jisheng, DT maintainers,

Sick, thanks for piping up Samuel!
Both Rob and Krzysztof are not around at the moment, so that probably
leaves it up to me.. I'm adding Arnd in case he has a take here too.

> On 5/18/23 10:22, Jisheng Zhang wrote:
> > Several SoMs and boards are available that feature the Bouffalolab
> > bl808 SoC. Document the compatible strings.
> >=20
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../bindings/riscv/bouffalolab.yaml           | 29 +++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/bouffalolab=
=2Eyaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/riscv/bouffalolab.yaml b=
/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> > new file mode 100644
> > index 000000000000..3b25d1a5d04a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> > @@ -0,0 +1,29 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/riscv/bouffalolab.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Bouffalo Lab Technology SoC-based boards
> > +
> > +maintainers:
> > +  - Jisheng Zhang <jszhang@kernel.org>
> > +
> > +description:
> > +  Bouffalo Lab Technology SoC-based boards
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +  compatible:
> > +    oneOf:
> > +      - description: Carrier boards for the Sipeed M1s SoM
> > +        items:
> > +          - enum:
> > +              - sipeed,m1s-dock
> > +          - const: sipeed,m1s
> > +          - const: bouffalolab,bl808
>=20
> As mentioned in the message for patch 5, "The Bouffalolab bl808 SoC
> contains three riscv CPUs, namely M0, D0 and LP. The D0 is 64bit RISC-V
> GC compatible, so can run linux."
>=20
> I have also been running U-Boot and NOMMU Linux on the less powerful,
> but still quite fast, "M0" core. However, this core needs a different
> DTB because:
>  1) The CPU is different (T-HEAD E907 instead of C906).
>  2) The interrupt routing is completely different.
>     a. The M0 core contains a CLIC instead of a PLIC.
>     b. The peripherals in the SoC are split between two buses. Those
>        on one bus have their IRQs directly connected to M0, and share
>        a multiplexed IRQ connection to D0; and vice versa for the
>        other bus. So each bus's interrupt-parent needs to be swapped.
>=20
> Using some preprocessor magic like we did for Allwinner and Renesas, I
> was able to share most of the SoC and board DTs between the cores[1].
> However, this still ends up with two DTs for each board. So here are my
> questions:
>  - Is this acceptable?

I expected it to look worse than it actually turned out to be.
I don't think Krzysztof in particular is a fan of having conditional
bits in dts files, but for the shared arm/riscv stuff there was not
really another sensible option.

>  - Is there precedent for how we should name the two board DTs?

Arnd might have some idea about precedent here, but I like your naming
well enough.

>  - How does this affect the board and SoC compatible strings?
>    - Should there be a separate "bouffalolab,bl808-d0" in addition to
>      "bouffalolab,bl808"?

What ordering were you intending here?
"pine64,0x64" "bouffalolab,bl808" "bouffalolab,bl808-d0"?

That doesn't really seem correct though, as it does not get less specific
as you move right.

"pine64,0x64" "bouffalolab,bl808-d0" "bouffalolab,bl808" doesn't seem
right either though, for the same sort of reason.

>    - Is it acceptable to use the same board compatible string for both,
>      since the _board_ part of the DT does not change, only things
>      inside the SoC?

I think you may need to have 2 compatibles per board, depending on which
cpu. Perhaps even as verbose as:
"pine61,0x64-d0" "pine64,0x64" "bouffalolab,bl808-d0" "bouffalolab,bl808"

Not exactly straightforward though, is it!

> It would be possible to avoid having two DTs per board by guarding all
> of the differences behind "#ifdef CONFIG_64BIT", but that seems wrong
> because you would end up with two totally incompatible DTBs named the
> same thing, depending on how the DTB was built.

I think having 2 dtbs is fine, and as I mentioned, I've seen Krzysztof
complain previously about conditional bits like that.

Cheers,
Conor.

--LxBuwS+otbeaG+3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGdjlgAKCRB4tDGHoIJi
0tAQAQCdbojzTmY2QrZpKQo0nj8+qxFONs8VYRfCsU2Xg2afPAEAtrBzj/r6BfCS
68C3HwnUUv5Vx+6SNWmBVEN/782qPAM=
=iT9e
-----END PGP SIGNATURE-----

--LxBuwS+otbeaG+3j--


--===============1981876316903993687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1981876316903993687==--

