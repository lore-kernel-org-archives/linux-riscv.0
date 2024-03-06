Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397B3C5475B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1dzKHlxjUUiEKI9pB6/AZtQBCISMhOH3JQfXZzZOwA=; b=KuJzfHttu9luex2GWgpMAgX8l5
	h0AYx89jGLwabqKeexiORXV/tAe5eN9fTUu39/ZGQDfTE/h7EEHWUTiLcfzNRzuxt7sHBmNmQUQBa
	nQhusYRcSWDs8umkEs0ynKVkYGbtcHzSUwhuLHWRHDGy8tE05TMn3Spq5qLWs8FLnO2ucA814bcg/
	DNHIaa0R2jlQ/LbMwTXMuwKc0DFAI/KynWClUb9BFbZ7E8LJDytoMEZ8db4DK+e2uNxsVETxcoH6A
	V83BOVK/AGF/Sml084ey02dEP6ca27kbXqxD53aFzg/qcHIRKwpgf5aFZoMDZWofnOyLJKpUdbMXA
	Saky59/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmEh-0000000GnYj-2JiX;
	Wed, 06 Mar 2024 08:02:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmEd-0000000GnYC-3X0b
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 08:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709712163; x=1741248163;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PyZhw+aI3BqVpB4+q9ngRHTHPtwZjPrXz+aw8UuF9/Y=;
  b=gqI+1kxSPNUDydk4RGPLi9fmZlnqKaGKF0c2Nx115fdTcczHG+ZwpBU4
   Rdkp3CEgm6Yz1u2/NjotyWr42HvvQa9wHBG6zEUYw4tHywqg05gcQnfcX
   H/6+2zyxAW8COAf+rSi5aX3gzUg9kDlz5FJMwMK/NaU2eYWiS2L3fxNQV
   wN+P7n2N/N0Who7YGJmNcTyvfmOhXqgO4OmQ7dF2ofwbMUVSEyMnxAPL+
   8yqqknpoMDEF3qwsPlHGOVzCeo3jgyY1RiUTPT72AB0Pf4JomWQUxFN+O
   PQ5K07EWG1/RsIwc+nScn4kLIbJvVGXMIF0B1zm1C/iDGwyJ5NrlSGsNg
   A==;
X-CSE-ConnectionGUID: MPFPpQYySGyjzSC0A1Svkg==
X-CSE-MsgGUID: 0/8Xm/nUTT6EzsMZTZoIbw==
X-IronPort-AV: E=Sophos;i="6.06,207,1705388400"; 
   d="asc'?scan'208";a="17263119"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Mar 2024 01:02:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 01:02:25 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 6 Mar 2024 01:02:22 -0700
Date: Wed, 6 Mar 2024 08:01:38 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Guo Ren <guoren@kernel.org>
CC: Yangyu Chen <cyy@cyyself.name>, <linux-riscv@lists.infradead.org>, Conor
 Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 5/7] riscv: Kconfig.socs: Split ARCH_CANAAN and
 SOC_CANAAN_K210
Message-ID: <20240306-scowling-mortify-9b427c80e8ab@wendy>
References: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com>
 <tencent_6F35FEF31908DE6AEB385AE30AC658863C0A@qq.com>
 <CAJF2gTS1-VQP=gQBx=SoUWsdap153EGOObKVn+2L7=kbP2CqFg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTS1-VQP=gQBx=SoUWsdap153EGOObKVn+2L7=kbP2CqFg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_000244_146474_ECEB4D9D 
X-CRM114-Status: GOOD (  15.66  )
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
Content-Type: multipart/mixed; boundary="===============7756015651821274625=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7756015651821274625==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2ZekCWx4C9PPAhdA"
Content-Disposition: inline

--2ZekCWx4C9PPAhdA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2024 at 07:38:52AM +0800, Guo Ren wrote:

> On Wed, Mar 6, 2024 at 7:04=E2=80=AFAM Yangyu Chen <cyy@cyyself.name> wro=
te:
> >
> > Since we have Canaan Kendryte K230 with MMU now. The use of SOC_CANAAN
> > is no longer only referred to K210. Split them and add _K210 suffix
> > to the name for old SOC_CANAAN. And allows ARCH_CANAAN to be selected
> > for other Canaan SoCs.
> >
> > Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> > ---
> >  arch/riscv/Kconfig.socs                        | 8 +++++---
> >  arch/riscv/Makefile                            | 2 +-
> >  arch/riscv/configs/nommu_k210_defconfig        | 3 ++-
> >  arch/riscv/configs/nommu_k210_sdcard_defconfig | 3 ++-
> >  drivers/clk/Kconfig                            | 4 ++--
> >  drivers/pinctrl/Kconfig                        | 4 ++--
> >  drivers/reset/Kconfig                          | 4 ++--
> >  drivers/soc/Makefile                           | 2 +-
> >  drivers/soc/canaan/Kconfig                     | 4 ++--
> >  9 files changed, 19 insertions(+), 15 deletions(-)

> This patch cross so many subsystems, I am not sure about it. If I were
> you, I would keep SOC_CANAAN and just add SOC_CANAAN_K230.

Right. That is why I didn't try to rename the symbol, and just left it
as SOC_CANAAN, but if the relevant people ack it, the chances of a
significant conflict are low.


--2ZekCWx4C9PPAhdA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZegi3gAKCRB4tDGHoIJi
0hUrAPwJw0mn86N4pL5jjPftSxkk1HRIW7D9bLGyzFSPhfqi7gD+O8rzCHK7bdQn
//+uIN+fxPUGG42+2OKOFsoxgvVF3AU=
=bXTQ
-----END PGP SIGNATURE-----

--2ZekCWx4C9PPAhdA--


--===============7756015651821274625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7756015651821274625==--

