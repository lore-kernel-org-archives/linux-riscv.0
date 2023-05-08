Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66006C77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 06:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pzbgy/Iy1HszNyVtpdEgSueuC9pUUI/BiyS3ogJZuA4=; b=Cr/xztje269OnGXaxZX4GidBvW
	8DWEgoe2RRnB/RuyQ/okGlYw7rMF/cowv6Laz3/WToc7BZHeRfXRrW26pFr3adjfeBBTRiQI9ldYM
	mFfSDVFI8oqx9HQv4AQ6M0z4/5ejD5bDeE2eEeeyfuamdpzcXwxUa4U6GgLxSukeNc40UH0c/Znw7
	4cXG6yWn5arlM3jC/ErBieTYocmgXO6xIUg3vcg09b5jam1VsH81GlnzV+mI6fg4IhT5b0rG3fwC0
	tb6DOyu7nGWETghC7fXjVnfy3FasYvAs0O3KQtxCoWrWRQQkz9tPnpBpV6Em07nfKZJshU2CDnP8F
	xkO26u1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvujv-00HR5M-0m;
	Mon, 08 May 2023 06:52:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvujs-00HR4H-1l
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 06:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683528772; x=1715064772;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jmyhl5KhhfscLfRNmqFrjA+USTYyDadaT89tqH5yj9c=;
  b=0++v6A+WIB+SkFGfn/d6BxmDMQa0kFDoz1KMLY+dYKIawY7CpbySoYTN
   gIQIRfCKCpOVBG/VWSVVqW8tlWYpgfcNvRjQ5l1tDrqqbs2X46V1Ni3S5
   zr0XAtRoO+pwJMDWbn2IGiGFqi1EYTCOusCUAnjVSV/lWkP/sM9cK+zml
   FtdmeZwflKQE1uwy6f4Lfj2/4O3B+zxu83d9se7P0Rw7bN8rSLUSyRDm4
   4/wBVePBwzwTc0yivGvPKt2ETeuWhmKsbJ9GrAYwyEZufwCgLS7qUBfiM
   EEuHmexnjdlt3QGmVcSvaj6b7jLPOfUCCvmTtIQRPSiZOvlIfRGlUL7/1
   w==;
X-IronPort-AV: E=Sophos;i="5.99,258,1677567600"; 
   d="asc'?scan'208";a="212854013"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 May 2023 23:52:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 7 May 2023 23:52:46 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Sun, 7 May 2023 23:52:43 -0700
Date: Mon, 8 May 2023 07:52:24 +0100
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
Message-ID: <20230508-splashed-voicing-bc6e91aeb053@wendy>
References: <20230507182304.2934-1-jszhang@kernel.org>
 <20230507182304.2934-3-jszhang@kernel.org>
 <20230507-sleeve-tacky-21e817e31fb2@spud>
 <CAJF2gTTSRQUX8C3C-tgq4o5iGJqKTja7-1Dv8epG_qZizUvSow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTTSRQUX8C3C-tgq4o5iGJqKTja7-1Dv8epG_qZizUvSow@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_235252_793598_B0E1632F 
X-CRM114-Status: GOOD (  21.81  )
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
Content-Type: multipart/mixed; boundary="===============6665343486928870217=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6665343486928870217==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WAjmQ6ZL3drTJadU"
Content-Disposition: inline

--WAjmQ6ZL3drTJadU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 08, 2023 at 02:42:10PM +0800, Guo Ren wrote:
> On Mon, May 8, 2023 at 5:22=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Mon, May 08, 2023 at 02:23:01AM +0800, Jisheng Zhang wrote:
> > > The first SoC in the T-HEAD series is light(a.k.a th1520), containing
> > > quad T-HEAD C910 cores.
> > >
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  arch/riscv/Kconfig.socs | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > > index 1cf69f958f10..ce10a38dff37 100644
> > > --- a/arch/riscv/Kconfig.socs
> > > +++ b/arch/riscv/Kconfig.socs
> > > @@ -41,6 +41,12 @@ config ARCH_SUNXI
> > >         This enables support for Allwinner sun20i platform hardware,
> > >         including boards based on the D1 and D1s SoCs.
> > >
> > > +config ARCH_THEAD
> >
> > Could you please add a defconfig patch, adding this option, so that we
> > build support for this platform by default?

> Yes, but it's another patch, see: 'commit eb20e7cb91ba ("riscv:
> defconfig: Enable the Allwinner D1 platform and drivers")'

But that's ARCH_SUNXI for the Allwinner D1. If the TH1520 is a
first-party SoC, and not an Allwinner product, it needs a new Kconfig
entry etc.=20
If it is an Allwinner, then the dts etc should be in the Allwinner
directory too.

Cheers,
Conor.

--WAjmQ6ZL3drTJadU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFicGQAKCRB4tDGHoIJi
0pjPAP0S/tHQSJAG9NJlAJoKtXSJqHqgGe4uxJHLZs3z9WuyGQEA+7omrh/Hz8AJ
5GT8mkA0HjL61HBgDk4yjXhRCjOZfQw=
=kbWE
-----END PGP SIGNATURE-----

--WAjmQ6ZL3drTJadU--


--===============6665343486928870217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6665343486928870217==--

