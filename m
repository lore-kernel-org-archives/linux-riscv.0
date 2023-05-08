Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A2BC77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 07:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jn/YCi96/3FYIK8FuXvPs9ufSeLA1UfYhmcont7hJOc=; b=1/dc6esqMNDRDK1CCvwlBBidwY
	R/VpGNjBt9MI7Hh8dV5h9yIeh3iZdWalO7bKMwr/GKbbEV5wJdJYEIT3Kn6WeeeJxUI7+0y+C25vS
	z4uO0SVD7XJvjYcP8boD/eeHJYnuEEB/35gcMaTPd/dLIsCW0i9gSnzLJ7/w8MmOWs31CC9Rbkm5y
	7rnYwshZD29rXPTOUg1r1hzCfEQR7+qOK+oZPAI73BIPZUcy1EQfaHeEo9r5pCrgwMg53IFx0AoRW
	eklM1KFO1lYblQUmcgAGqncR5PYeMzmhnIAXWClLk6aTakbIHLU+vR7rScKdsipODRHZ27VkRfHFV
	+vuQEKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvuvU-00HSJm-20;
	Mon, 08 May 2023 07:04:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvuvS-00HSJA-08
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 07:04:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683529489; x=1715065489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZZ6t4bzLYyyTNc77pLgan2R4HqwxIpGpMYRfnF0UJwA=;
  b=biSXCYBzTPTP4SJxOinb47eAfaLOFreYetomlyJKv0/dYyciA8U9tKJm
   lEOZMy5LC1K1Flaq9FeDs8a3u/GtRhkighXZHg7UeNrXOxwo6fakQa5Rr
   WU7vw5A2Twzhgzm45X6F4I7SojXyiCVFM/x4+lo57zTyabHrp8y0J7X+Y
   PWZNGVuFvsRp0l3SHB3TstwwDPnkmuuKmzycDNPV783AuIBc8Yl0UZPwB
   DkPwTKFJ7mwNh9dNCxLfb0VfiRxnSvLRfs7jxu42nk09Vqtbnp12EZ61f
   bxbVSi7El5gz6IY4dILllX+1rmK6+jnPDSmscL0YaT10Y0+xNsiRpuX6J
   w==;
X-IronPort-AV: E=Sophos;i="5.99,258,1677567600"; 
   d="asc'?scan'208";a="214169603"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 May 2023 00:04:48 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 8 May 2023 00:04:46 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 8 May 2023 00:04:44 -0700
Date: Mon, 8 May 2023 08:04:24 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Guo Ren <guoren@kernel.org>
CC: Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 2/5] riscv: Add the T-HEAD SoC family Kconfig option
Message-ID: <20230508-compacted-lyricism-65e824882225@wendy>
References: <20230507182304.2934-1-jszhang@kernel.org>
 <20230507182304.2934-3-jszhang@kernel.org>
 <20230507-sleeve-tacky-21e817e31fb2@spud>
 <CAJF2gTTSRQUX8C3C-tgq4o5iGJqKTja7-1Dv8epG_qZizUvSow@mail.gmail.com>
 <20230508-splashed-voicing-bc6e91aeb053@wendy>
 <CAJF2gTSZmjScBERVxxsEJ-q-HdXn+daT5-H-QvGt2iWxPCaT3g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTSZmjScBERVxxsEJ-q-HdXn+daT5-H-QvGt2iWxPCaT3g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_000450_192506_BC140593 
X-CRM114-Status: GOOD (  26.38  )
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
Content-Type: multipart/mixed; boundary="===============3650662582207650425=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3650662582207650425==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e1kl4iCssdrqfp3Y"
Content-Disposition: inline

--e1kl4iCssdrqfp3Y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 08, 2023 at 02:58:02PM +0800, Guo Ren wrote:
> On Mon, May 8, 2023 at 2:53=E2=80=AFPM Conor Dooley <conor.dooley@microch=
ip.com> wrote:
> >
> > On Mon, May 08, 2023 at 02:42:10PM +0800, Guo Ren wrote:
> > > On Mon, May 8, 2023 at 5:22=E2=80=AFAM Conor Dooley <conor@kernel.org=
> wrote:
> > > >
> > > > On Mon, May 08, 2023 at 02:23:01AM +0800, Jisheng Zhang wrote:
> > > > > The first SoC in the T-HEAD series is light(a.k.a th1520), contai=
ning
> > > > > quad T-HEAD C910 cores.
> > > > >
> > > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > > ---
> > > > >  arch/riscv/Kconfig.socs | 6 ++++++
> > > > >  1 file changed, 6 insertions(+)
> > > > >
> > > > > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > > > > index 1cf69f958f10..ce10a38dff37 100644
> > > > > --- a/arch/riscv/Kconfig.socs
> > > > > +++ b/arch/riscv/Kconfig.socs
> > > > > @@ -41,6 +41,12 @@ config ARCH_SUNXI
> > > > >         This enables support for Allwinner sun20i platform hardwa=
re,
> > > > >         including boards based on the D1 and D1s SoCs.
> > > > >
> > > > > +config ARCH_THEAD
> > > >
> > > > Could you please add a defconfig patch, adding this option, so that=
 we
> > > > build support for this platform by default?
> >
> > > Yes, but it's another patch, see: 'commit eb20e7cb91ba ("riscv:
> > > defconfig: Enable the Allwinner D1 platform and drivers")'
> >
> > But that's ARCH_SUNXI for the Allwinner D1. If the TH1520 is a
> > first-party SoC, and not an Allwinner product, it needs a new Kconfig
> > entry etc.
> > If it is an Allwinner, then the dts etc should be in the Allwinner
> > directory too.
> Do you mean?
> config ARCH_THEAD
>         def_bool SOC_THEAD
>=20
> config SOC_THEAD
>         bool "T-HEAD SoCs"
>=20
> In defconfig:
> +CONFIG_SOC_THEAD=3Dy

No, this patch is okay as-is. CONFIG_ARCH_THEAD=3Dy would go into
defconfig in another patch.

Cheers,
Conor.

--e1kl4iCssdrqfp3Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFie+AAKCRB4tDGHoIJi
0mfbAP48d8TBcCsCQGtiT1lMKGfAAs+1cpZRXOnjVTIJPrX9LgEArDXRzSr/wvgG
qH2PJZIhiqQRwnMebnT/WZkqIEVSxQU=
=cMrX
-----END PGP SIGNATURE-----

--e1kl4iCssdrqfp3Y--


--===============3650662582207650425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3650662582207650425==--

