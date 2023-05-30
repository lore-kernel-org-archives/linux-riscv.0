Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25086C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 10:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1NtASlx7H6QA248IPASXr4fh3Ile1RsGrTN8yUp0rM=; b=HeKZ7UlQmImQgDNZnFRCKRFupu
	K3/KPfLjQlKm4zcmgir/Fhcxp0yuNOUtLSSPvnHLZ8fql0b002h6MSR++/n1D0YLL9aj9FxiFBGET
	Mp/jW84Kf8x8svmGwOdTClvJm7tBsYoj0qT9Zzztagdd/wIPc5CtnBrfqdwjaH6FAvLGp19hJ4hF/
	3IY3X1VZZ569MQ/oFvzlrNfDVGldoSj0jUyYsUNjG3MOhq6hb2ncOgjAt7epDlg8G3Lq7z5+wf2r5
	pV5mq/nBxUfMBKE/XYhMADN6aXaQ1W3Pw4h6X/6DSW5VJ0A0p28FVDH6t9+94bNLcrvnpvfcTqdkz
	iQBohVYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wgd-00DOMs-1S;
	Tue, 30 May 2023 10:34:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wgX-00DOKb-1u
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 10:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685442877; x=1716978877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ezs7z46coeL8J/2z7XFwZEbihsgUQ3C+uMt9D0ovWjQ=;
  b=I0mCa0xj2yucwMK5C+7z+dReF1wjADMI9Qm0l0YNknGWRVcLEq/6myZb
   gv0lD8/yIgboGvMc+P4AUYP6jvePqSgPRl9Sg/RUPoUSfYeZcaN/wuEx9
   rNu2zeZH7dKPTm4XfKTgq2cIaTmP48IVdOsuAqHxRzkS+FCa5yXsG2BzX
   quYr9GADqspQbRca7/yW3cpOf62YhmTLQLtemJvEePDfBTxOmf5bKVmaE
   EAsras49xoFOPDIzxvcZrfmBD4idLfqIVjOZf/AsB0+SfwryRVa1JwGZI
   OxaD/ukvDYAQv18o6cIgIywwJaOt4cTn+081vefd4xn9ZSpDx7/QVyNTM
   g==;
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="asc'?scan'208";a="154575603"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 May 2023 03:34:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 30 May 2023 03:34:30 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 30 May 2023 03:34:29 -0700
Date: Tue, 30 May 2023 11:34:06 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Catalin Marinas <catalin.marinas@arm.com>
CC: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/6] riscv: allow kmalloc() caches aligned to the
 smallest value
Message-ID: <20230530-gyration-handheld-ef4e44e89d61@wendy>
References: <20230526165958.908-1-jszhang@kernel.org>
 <20230526165958.908-6-jszhang@kernel.org>
 <20230529-fidelity-booted-0d4055d1f559@wendy>
 <ZHXJDevEVwUEoOq4@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZHXJDevEVwUEoOq4@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_033437_863398_C67C7C1F 
X-CRM114-Status: GOOD (  20.88  )
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
Content-Type: multipart/mixed; boundary="===============2099103092748656803=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2099103092748656803==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yLd8GXUEZrWQsGZ1"
Content-Disposition: inline

--yLd8GXUEZrWQsGZ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 10:59:41AM +0100, Catalin Marinas wrote:
> On Mon, May 29, 2023 at 12:17:46PM +0100, Conor Dooley wrote:
> > On Sat, May 27, 2023 at 12:59:57AM +0800, Jisheng Zhang wrote:
> > > After this patch, a simple test of booting to a small buildroot rootfs
> > > on qemu shows:
> > >=20
> > > kmalloc-96           5041    5041     96  ...
> > > kmalloc-64           9606    9606     64  ...
> > > kmalloc-32           5128    5128     32  ...
> > > kmalloc-16           7682    7682     16  ...
> > > kmalloc-8           10246   10246      8  ...
> > >=20
> > > So we save about 1268KB memory. The saving will be much larger in nor=
mal
> > > OS env on real HW platforms.
> > >=20
> > > [1] Link: https://lore.kernel.org/linux-arm-kernel/20230524171904.396=
7031-1-catalin.marinas@arm.com/

While I think of it, Link: goes at the start of the line, the [1] should
go at the end (although I don't think you actually reference the link
anywhere in the text & it'll probably not be particularly relevant if a
subsequent revision of that patchset is applied.

> > >=20
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> >=20
> > Fails to build chief, with loads of:
> > linux/dma-mapping.h:546:19: error: redefinition of 'dma_get_cache_align=
ment'
> >=20
> > And for 32-bit there's also a rake of:
> > include/linux/slab.h:239:9: warning: 'ARCH_KMALLOC_MINALIGN' macro rede=
fined [-Wmacro-redefined]
> >=20
> > At the very least, reproducable with rv32_defconfig.
>=20
> Have you this it on top of the KMALLOC_MINALIGN preparation series?
>=20
> https://lore.kernel.org/r/20230524171904.3967031-1-catalin.marinas@arm.co=
m/

Oh, no. Thanks for pointing that out.
Our automation stuff only uses what is in riscv/{for-next,master,fixes}.
Unless my reading comprehension is particularly bad of late it was
non-obvious that this depended on something that had not yet been
applied - it sounded like your series had already been merged last year.
Apologies for the noise then on this patch, but please try to be more
clear about what the dependencies actually are Jisheng.

Cheers,
Conor.

--yLd8GXUEZrWQsGZ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHXRHgAKCRB4tDGHoIJi
0m9uAP9AoI+JEAqv+9RR/YOu/MvDnbTegsXBk/n2SwQtBMLLUwEA8FMW1zWGymoE
agKX1i07+HwjlUVKA0zZWmUkNoUpXQU=
=N2cE
-----END PGP SIGNATURE-----

--yLd8GXUEZrWQsGZ1--


--===============2099103092748656803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2099103092748656803==--

