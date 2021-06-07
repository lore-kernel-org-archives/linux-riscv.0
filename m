Return-Path: <SRS0=HNmv=LB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34535C4743F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 07:27:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEFBD60E08
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 07:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEFBD60E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzlVI+HTgBaNtqcm6dUqXA2IsVHMAsgwTfFxHDqes6c=; b=CCON9wsU/rJHblp5RvDFcij57i
	P/rzk2A4dsGqvm7BBMXYBA+sO4asDYug378l9yBRqnXJfk013JzLYcecDfakQkCNr/8AZ4zW8wTJf
	kp7PLZBA15ivMj9pplvt+LVxmSyEAv0TDlmwWq1NPxM9mv1uuATqelGrLIYnuEm3y0htkN/cjaO9e
	nshbjX3FKGOVE68BEN6JUxi4McsWttSjyis55yaDB6zORzl+yJqk4x8BRUBgomhAdCBNT5i2LQ0l+
	UOFDfr53JQpa4vtypHHIwIfMXJLWsHf2IYjUVrJ4WBwo29V+yWxAXFC7Fr3Fy3qRA/R2YQE5sUZWm
	8XyJL5cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq9fS-0023f7-M8; Mon, 07 Jun 2021 07:27:26 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq9fI-0023bL-Ry
 for linux-riscv@lists.infradead.org; Mon, 07 Jun 2021 07:27:21 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id E671958038E;
 Mon,  7 Jun 2021 03:27:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 07 Jun 2021 03:27:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=Be4vlGBp5Tgplypsgu9j1asWrWc
 1rZBo7Tlnzeyv74k=; b=QgC4K9mH2QUkot7hdydmZnYXPxowrbwBDzmlg4FBB2L
 qSuelat0c2L7OvaD8a8I1sN3b6/TaNNkJwnxrPKe+uvfqGoc+1JXefSL2zkqHQ8+
 K6B8tjwcKpnpJ22xhmINs4lc+SI0LyhbGIT2mI1tKJ4ok1lUPuCKzDHxsdtEHP03
 Q12yrcUpZuW9C6bK5Ru5F8hnh04k/DEBm5qDzhIm81jCxJlEwGSiOHJp1BYVFj3H
 waGFis1qb8HTH6hNWpw40C9yxRcdfLtoYXs9cXvPNS8+HtBmlC3KZDBC3zFOrLNa
 k3KShdhKiSqhZJLizVJ+7h9wNE17qaKXI7xu/GMSmRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Be4vlG
 Bp5Tgplypsgu9j1asWrWc1rZBo7Tlnzeyv74k=; b=V6V/lcTv12rc702uKGKDFq
 VLov3E51TFZUwFT1UyD6nkAjWhyHfvqezDmKABdO4fZRh8P5eFV/pFCtNQzy/Usv
 EtFclhiw4UiQ3T9hBO41WQJkhnJEeLsZ2GPfmUqlr7qHRhOPgtBnB3zzwik/EqRV
 lx3wKEwNWhuch6HB+tjurY3h2tUBhiOP1G0ubpUIPQHzjhuOBPwoPLQ2OyOyrpr/
 Wpo0paW641XzL0Toft8MOgYQH9NqaGyMsqFYOZAy5sYdeeHLG4heXcsknCMM6P4Y
 XcNzID7vC2WJ46bKul5dksWeDGrYSijo1ixvxR6nNgs0jUhG94xFntsSFmjgWsog
 ==
X-ME-Sender: <xms:UMq9YJk5sHWj7wy7-S_VyhB6Pw7yqJo5h5gatBHzdsm9AkJdIdtSKA>
 <xme:UMq9YE0Yyn6bzVniNy8s-0gvKiFMlZ_thpZXaj284_CSxKhtewWd_TOhgtyDcH3vN
 s20Cvamk-BnalnaB2w>
X-ME-Received: <xmr:UMq9YPrePbLL48qYi5My2tdYfAA5jqHie8S9aCHBb0aRUndWyN3kYEgABFOeqnHdNhxP9imMiB1OxjeB62o8F3f__Kj9StBSI6Xi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtiedguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeutdfgjeeuudehvefgvedvtedtudelfffgffekledtffekgedukeejueev
 ieegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UMq9YJn4BxpDbDfsD0cuUIUAiYIC4K21THlfs-A9J_P8b7PDHrQ-rg>
 <xmx:UMq9YH0TDlZyqGUCt0PUraiciRQ0i_ohz7aKrIvJPi-3Eyu20AnCCg>
 <xmx:UMq9YIs2oyfyoPRgMfTdiGJeD5EvA9g3oYmvQpkkKuGbCS1Qs5cUvQ>
 <xmx:U8q9YO0rEX9A1a-22i6EHE5F3gU4WE2Vcissfx7TnGWPu7Ac4NJTHg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 03:27:12 -0400 (EDT)
Date: Mon, 7 Jun 2021 09:27:09 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Guo Ren <guoren@kernel.org>
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Drew Fustini <drew@beagleboard.org>, liush@allwinnertech.com,
 Wei Wu =?utf-8?B?KOWQtOS8nyk=?= <lazyparser@gmail.com>,
 wefu@redhat.com, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>,
 Atish Patra <atish.patra@wdc.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH v2 09/11] riscv: soc: Initial DTS for Allwinner D1
 NeZha board
Message-ID: <20210607072709.ul4jdvtyspj6t4c6@gilmour>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-13-git-send-email-guoren@kernel.org>
 <2490489.OUOj5N01qN@jernej-laptop>
 <CAJF2gTTDVy89R-gvWUS0sgpX=B14LnH5rDoGP7pv1=OSyJq28Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTTDVy89R-gvWUS0sgpX=B14LnH5rDoGP7pv1=OSyJq28Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_002717_030983_91B917F2 
X-CRM114-Status: GOOD (  28.95  )
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
Content-Type: multipart/mixed; boundary="===============5946218372411277140=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5946218372411277140==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dkq7vhizxit3oxmd"
Content-Disposition: inline


--dkq7vhizxit3oxmd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 07, 2021 at 11:44:03AM +0800, Guo Ren wrote:
> On Mon, Jun 7, 2021 at 12:26 AM Jernej =C5=A0krabec <jernej.skrabec@gmail=
=2Ecom> wrote:
> >
> > Hi!
> >
> > I didn't go through all details. After you fix all comments below, you =
should
> > run "make dtbs_check" and fix all reported warnings too.
> >
> > Dne nedelja, 06. junij 2021 ob 11:04:07 CEST je guoren@kernel.org napis=
al(a):
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > Add initial DTS for Allwinner D1 NeZha board having only essential
> > > devices (uart, dummy, clock, reset, clint, plic, etc).
> > >
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > Co-Developed-by: Liu Shaohua <liush@allwinnertech.com>
> > > Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
> > > Cc: Anup Patel <anup.patel@wdc.com>
> > > Cc: Atish Patra <atish.patra@wdc.com>
> > > Cc: Christoph Hellwig <hch@lst.de>
> > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > Cc: Drew Fustini <drew@beagleboard.org>
> > > Cc: Maxime Ripard <maxime@cerno.tech>
> > > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > > Cc: Wei Fu <wefu@redhat.com>
> > > Cc: Wei Wu <lazyparser@gmail.com>
> > > ---
> > >  arch/riscv/boot/dts/Makefile                       |  1 +
> > >  arch/riscv/boot/dts/allwinner/Makefile             |  2 +
> > >  .../boot/dts/allwinner/allwinner-d1-nezha-kit.dts  | 29 ++++++++
> > >  arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi    | 84
> > > ++++++++++++++++++++++ 4 files changed, 116 insertions(+)
> > >  create mode 100644 arch/riscv/boot/dts/allwinner/Makefile
> > >  create mode 100644 arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-=
kit.dts
> > > create mode 100644 arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi
> > >
> > > diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makef=
ile
> > > index fe996b8..3e7b264 100644
> > > --- a/arch/riscv/boot/dts/Makefile
> > > +++ b/arch/riscv/boot/dts/Makefile
> > > @@ -2,5 +2,6 @@
> > >  subdir-y +=3D sifive
> > >  subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) +=3D canaan
> > >  subdir-y +=3D microchip
> > > +subdir-y +=3D allwinner
> > >
> > >  obj-$(CONFIG_BUILTIN_DTB) :=3D $(addsuffix /, $(subdir-y))
> > > diff --git a/arch/riscv/boot/dts/allwinner/Makefile
> > > b/arch/riscv/boot/dts/allwinner/Makefile new file mode 100644
> > > index 00000000..4adbf4b
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/allwinner/Makefile
> > > @@ -0,0 +1,2 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +dtb-$(CONFIG_SOC_SUNXI) +=3D allwinner-d1-nezha-kit.dtb
> > > diff --git a/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
> > > b/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts new file m=
ode
> > > 100644
> > > index 00000000..cd9f7c9
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
> >
> > Board DT names are comprised of soc name and board name, in this case i=
t would
> > be "sun20i-d1-nezha-kit.dts"
> >
> > > @@ -0,0 +1,29 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >
> > Usually copyrights are added below spdx id.
> >
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "allwinner-d1.dtsi"
> > > +
> > > +/ {
> > > +     #address-cells =3D <2>;
> > > +     #size-cells =3D <2>;
> >
> > This should be part of SoC level DTSI.
> >
> > > +     model =3D "Allwinner D1 NeZha Kit";
> > > +     compatible =3D "allwinner,d1-nezha-kit";
> >
> > Board specific compatible string should be followed with SoC compatible=
, in
> > this case "allwinner,sun20i-d1".  You should document it too.
> >
> > > +
> > > +     chosen {
> > > +             bootargs =3D "console=3DttyS0,115200";
> >
> > Above line doesn't belong here. If anything, it should be added dynamic=
ally by
> > bootloader.
>
> After discussion, we still want to keep a default value here.
> Sometimes we could boot with jtag and parse dtb is hard for gdbinit
> script.
>
> >
> > > +             stdout-path =3D &serial0;
> > > +     };
> > > +
> > > +     memory@40000000 {
> > > +             device_type =3D "memory";
> > > +             reg =3D <0x0 0x40000000 0x0 0x20000000>;
> > > +     };
> >
> > Ditto for whole memory node.
>
> Ditto

The thing is that there's never a good value for a default. Let's take
the memory node here: what would be a good default? If we want to make
it work everywhere it's going to be the lowest amount of memory
available on the D1 boards. It's going to be hard to maintain and very
likely to be overlooked, resulting in broken boards anyway.

If someone is savvy enough to use JTAG, it's not really difficult to
modify the DT for their board when they need it.

Maxime

--dkq7vhizxit3oxmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYL3KTQAKCRDj7w1vZxhR
xWFdAQDLzaFiCNqj57hi5iIYQrv16nkQoboc0eB4T/McOPR6fAD+IUjgmFf62NP1
oefDLUF5Vp/JYH2eWZYcHp5G9m79Sg0=
=eB6L
-----END PGP SIGNATURE-----

--dkq7vhizxit3oxmd--


--===============5946218372411277140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5946218372411277140==--

