Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F31C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 07:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Ez3WqVBT3N1mfoE2NkzpZgd2yit45hCGfcQHgeZL/A=; b=X/bS2KdQ8XtJZ12/s57nI3dHsJ
	GJxGS5HFZNuyrRT4RQ+i3ZF/2TIe/MsXqOSbBbC/LvwbGs6wSCYI6dMERLs32G5GZU4MdTtIVExQW
	eJ5ZIex4sYZkRcVwXJBmSk4RlOQRtJ968W04OGf9zbsJ3jSvlix8lt9Tf6QUehmu3ntAsnoT6ngCT
	KOd23TFhIrFwz5890Hd3tBPqiTHIO2ofoCv59VzAK/7AI2dAoFY9FuBdHvI3CWaG95cLBxd4C7TSB
	nUJ2TL90dneYQ43wFgF4SRfkwTOWVdTILb6MM/egH2/+gksx3lIVPveYF8cKgiewnkr7YrsyywJuL
	dydYM4Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyorS-004bjg-38;
	Tue, 16 May 2023 07:12:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyorO-004biO-0m
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 07:12:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684221158; x=1715757158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t8CijbnvNDIu5h7DZKaUt0LbJeKMTc2o7hsFHeeJoGY=;
  b=ltG5jSgIZfA1Fb7kmZbp8X65mGzZnSjjJQsJhJx3lpCUw3EiQoXHB03Z
   llX/E6UEFG8NJz1opx/QZEPHQNKf6kMPZzgzdpDFYS9LNweQriWjkSxjZ
   RRtf+Dg/HKHoVBBxZ5qr/L/4dfKl8ecKz7nJFaNRKZuLKgVq5T7PS6aUk
   LGWF/hVMjAnGMt5JE6sNTYROoqsrPkEjBoQ0HUmTXNSYbCkugSJjv71S9
   5yZ+tF9CBPq0q4eZCDm9MgLj+r1KFFqTWsXy6fMZS64FRtwnPPg6Lqk1h
   Z0BWPni06KvGE0jxm9lsclDY8eKppoxL52Z3C4YOKfJBE2tM4Zelrsnb2
   w==;
X-IronPort-AV: E=Sophos;i="5.99,278,1677567600"; 
   d="asc'?scan'208";a="213481929"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 May 2023 00:12:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 16 May 2023 00:12:33 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 16 May 2023 00:12:31 -0700
Date: Tue, 16 May 2023 08:12:10 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: Randy Dunlap <rdunlap@infradead.org>, Robin Murphy <robin.murphy@arm.com>,
	<linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, <iommu@lists.linux.dev>, Conor Dooley <conor@kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] iommu: PGTABLE_LPAE is also for RISCV
Message-ID: <20230516-gristle-spill-e27c58770a47@wendy>
References: <20230330060105.29460-1-rdunlap@infradead.org>
 <2529dd93-2cb2-6ed8-20c0-c424e6613717@arm.com>
 <833203b0-aee5-eb23-afb4-ff71a3024258@infradead.org>
 <280c0994-f7cd-bb0e-8c68-62f72a4a38ca@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <280c0994-f7cd-bb0e-8c68-62f72a4a38ca@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_001238_481336_8977B328 
X-CRM114-Status: GOOD (  17.98  )
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
Content-Type: multipart/mixed; boundary="===============5311465651924104563=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5311465651924104563==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kEpcCnhkORFemaUM"
Content-Disposition: inline

--kEpcCnhkORFemaUM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2023 at 09:02:50AM +0200, Alexandre Ghiti wrote:
> Hi Randy,
>=20
>=20
> On 3/30/23 18:49, Randy Dunlap wrote:
> >=20
> > On 3/30/23 09:34, Robin Murphy wrote:
> > > On 2023-03-30 07:01, Randy Dunlap wrote:
> > > > On riscv64, linux-next-20233030 (and for several days earlier),
> > > > there is a kconfig warning:
> > > >=20
> > > > WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LP=
AE
> > > >  =A0=A0 Depends on [n]: IOMMU_SUPPORT [=3Dy] && (ARM || ARM64 || CO=
MPILE_TEST [=3Dn]) && !GENERIC_ATOMIC64 [=3Dn]
> > > >  =A0=A0 Selected by [y]:
> > > >  =A0=A0 - IPMMU_VMSA [=3Dy] && IOMMU_SUPPORT [=3Dy] && (ARCH_RENESA=
S [=3Dy] || COMPILE_TEST [=3Dn]) && !GENERIC_ATOMIC64 [=3Dn]
> > > >=20
> > > > and build errors:
> > > >=20
> > > > riscv64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `.L14=
0':
> > > > io-pgtable-arm.c:(.init.text+0x1e8): undefined reference to `alloc_=
io_pgtable_ops'
> > > > riscv64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `.L16=
8':
> > > > io-pgtable-arm.c:(.init.text+0xab0): undefined reference to `free_i=
o_pgtable_ops'
> > > > riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `.L140':
> > > > ipmmu-vmsa.c:(.text+0xbc4): undefined reference to `free_io_pgtable=
_ops'
> > > > riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `.L0 ':
> > > > ipmmu-vmsa.c:(.text+0x145e): undefined reference to `alloc_io_pgtab=
le_ops'
> > > >=20
> > > > Add RISCV as an allowed ARCH dependency to fix these problems.
> > > >=20
> > > > Fixes: d286a58bc8f4 ("iommu: Tidy up io-pgtable dependencies")
> > > BTW that doesn't look like the right fix target - this presumably dat=
es back as far as when ARCH_RENESAS was added to RISCV, such that it was po=
ssible to start selecting IPMMU_VMSA without COMPILE_TEST?
> > OK, I can go with that. Thanks for your help.
> >=20
>=20
> Any updates on this fix?

Superseeded by
https://lore.kernel.org/linux-iommu/20230330165817.21920-1-rdunlap@infradea=
d.org/

I guess that never went anywhere?


--kEpcCnhkORFemaUM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGMsygAKCRB4tDGHoIJi
0vOKAQCLR9m9tYztuGYjhMQ0trXZPKE2Y8xVwNtfr5jJy14lRgD/WEmttGELpMve
zitK847mqPuq6YE2XnjnZvsdGcD6cAc=
=WJ81
-----END PGP SIGNATURE-----

--kEpcCnhkORFemaUM--


--===============5311465651924104563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5311465651924104563==--

