Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332AEC77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 12:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pPqkLWpch2nJJNnNfxLPBhJOJYWTfjS3xWyVLjyZ1k=; b=LbPw/kfxht14q4kn4hGIffzyBl
	9Zn/dEL4PPwRkkXXzOhHAvRVksBR9jeeQWcjOQRyr93SqdF5T69f1PNYO8k355lHIqNP9hOVRxpnT
	Opt5qqLbA3lzYSchYBTDmPv+CrtnklijQ05iGbX9Ly7awG7ZzYyU+bniuzDd+Hj7+jdU8kL3O2VYQ
	fMNk17s8BGF0VQMiAQaDwCih4uUrdXxR3CtMZD8Y0wkXpsgFh0RI6Dy+0FvEAWt9poKfkdvs2V2ZC
	JQWzBXuiD0NMI8YA7dl1nr1rSy1o0jL0kbGTuj6s+gZjZf6nRlGY2Tk4QqZXMEW/Hu+nGAISjJQXW
	1yHYIndQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2AQi-00GebT-0P;
	Thu, 25 May 2023 12:50:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2AQe-00GeZm-1Z
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 12:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685019052; x=1716555052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gnIghBiDVeI92f1OSI9YGrzltj/g25Nt66G/3GQMoc4=;
  b=H1HzgCFeLL/o8dIm7yjU9S1CzXkSVT8239jgXDjwzsO6lhRt96dVv5Ca
   Aka0EKEWXLEahnY6Q3H2jkZE7p8qwmy1fSUS/SXsBqhBy1tMdmBIvpMvt
   AycDHrMIai9mdZK1upMjXB13It3nl2ZiePxu+ur8E6vHx82bWUvwPQA+h
   /JpT6/JYhWNvbkiPYjtto9hV3Z525tquwStVayOUAv6VodPqL4zQ4Wgj6
   +FJ8hnsiUiOYdYkzQtvM6XQr0ZdVrCmnESlPKEZx4N02gLu1hkqzCPTAi
   BO0zUHhxol7wH20n5rhzvG6sSGGU21OP/GV0k5J/dB25MKHynSiouoTor
   w==;
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; 
   d="asc'?scan'208";a="215444870"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 May 2023 05:50:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 25 May 2023 05:50:44 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 25 May 2023 05:50:42 -0700
Date: Thu, 25 May 2023 13:50:19 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor@kernel.org>, <rdunlap@infradead.org>, Arnd Bergmann
	<arnd@arndb.de>, <alex@ghiti.fr>, Stephen Rothwell <sfr@canb.auug.org.au>,
	<linux-next@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <vitaly.wool@konsulko.com>
Subject: Re: linux-next: Tree for May 15 (several RV64 build errors)
Message-ID: <20230525-scoff-eldest-57ec643005dc@wendy>
References: <20230524-scalping-number-63ec10c1f7bf@spud>
 <mhng-29a35d51-8791-449e-96f6-a7faf77f3f36@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-29a35d51-8791-449e-96f6-a7faf77f3f36@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_055052_536262_D8275D0C 
X-CRM114-Status: GOOD (  16.45  )
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
Content-Type: multipart/mixed; boundary="===============8568172321140048184=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8568172321140048184==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GA19nHWYt1Z7wyOt"
Content-Disposition: inline

--GA19nHWYt1Z7wyOt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 04:11:05PM -0700, Palmer Dabbelt wrote:
> On Wed, 24 May 2023 15:49:41 PDT (-0700), Conor Dooley wrote:
> > On Wed, May 24, 2023 at 03:41:15PM -0700, Randy Dunlap wrote:

> > > XIP_KERNEL already has "depends on !COMPILE_TEST", since April of 202=
1.
> >=20
> > Half of me wants to say just remove XIP_KERNEL entirely. Or make it
> > depend on BROKEN, since noone seems to actually test it and I don't
> > think we even know if it works right now?
>=20
> Ya, let's do it.  If it's broken and nobody has said anything but
> randconfig, then probably nobody's using it.  Let's mark it as broken or
> deprecated or whatever and then see if anyone complains.

Apart from being able to generate kernels that are broken (IOW this
randconfig), when we changed the dtb back to being in the fix, we
removed some special case XIP_KERNEL stuff (that's commit f1581626071c
("riscv: Do not set initial_boot_params to the linear address of the
dtb")) where Alex didn't know for sure whether it was safe to do.


Vexriscv (which is Myrtle I think) & Vitaly Wool both have an interest
in it. I dunno Myrtle's email, but I've CCed Vitaly. Maybe someone can
at least test the thing :)

Cheers,
Conor.

--GA19nHWYt1Z7wyOt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG9ZiwAKCRB4tDGHoIJi
0uTYAQD75o4X0KcjEEibuYRBtbJxLrzul579rcG5gj7RbbR/WQEAyRAKttZ1DLiQ
bjZFN8t3FSiE3wAGS14B7QIwTxW+mgE=
=b8Nx
-----END PGP SIGNATURE-----

--GA19nHWYt1Z7wyOt--


--===============8568172321140048184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8568172321140048184==--

