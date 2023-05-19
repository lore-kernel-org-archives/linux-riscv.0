Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FDAC7EE2E
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 11:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCDnL/exDMRQL0Ab3yEJ7hzxqCeiWQ9tRqEhCZswsQI=; b=nDFSb5hLixlVQYH6xxKtr/jNbb
	G0gAiPlA0G4+6Z+y6M4/THla9zADXj+ZnLcYIVBRt9VxS56VF0jCO8CHQNcmtuhspQ5pPDPFbQj+X
	x5grAnkuHATMwXujwXZWQVPxGGZpozUeGA3CH0xm5qebDkGnzkWhQWz2z0gHxEvgUAz/31DdBHVsz
	4ab6V2l11AGqsWItW25hou4IODOpLHUaONX/1dSsxlHedCHQX4oV8pWZqXHCQwejx6vGUAMkLUNVx
	mA23ekaYOMovcHKrub8CpSjEaR1PkqlUdX1ZMt8DW1f5CFS45IUJp4lrVGIcDp2c6hgAjQLoAq8Ql
	moViFpgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzyC9-00G5oh-0R;
	Fri, 19 May 2023 11:22:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzyC5-00G5lV-1i
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 11:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684495365; x=1716031365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=70zMPUe0yxRdfFDQaum+Lv5tPUPcm7ABiGrps531AkM=;
  b=m8wDjpvfZ4vKzmIp9237aziyx18q2uEP4Y75XrSPYFCldrGRqHx9UsfX
   2teGb/5p6xNnca/pD5TAGf5sHLPBDrLBOPFIhjANkIzP8KvcmpV+tRJ0I
   cyesmEyCxvEhAQ1i1ga1Rj8mPA9NAPO6rgqCItB0A2cosGHkefmLt8dBc
   TIxJ6CtRQwwBwqdj+hQLzInmyuswmtVj9l/yDc22GIdAnP+L4rwJ1KXJ2
   wZkxC5XJafwrbl9eJHFYS1ZOC6lzHVrMzhm0hNdimDTowIF+0o49hbGl9
   0GPlhNQNkqnfwkzdTB0xpJSDUebiy/JMsOFs0YBwwhcr3IaGDqJSYosXe
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="asc'?scan'208";a="214006166"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 May 2023 04:22:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 19 May 2023 04:22:41 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 19 May 2023 04:22:39 -0700
Date: Fri, 19 May 2023 12:22:18 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
	<sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, linux-riscv <linux-riscv@lists.infradead.org>, Conor
 Dooley <conor@kernel.org>
Subject: Re: linux-next: Tree for May 15 (several RV64 build errors)
Message-ID: <20230519-starlit-grip-ed152fb318cf@wendy>
References: <20230515141235.0777c631@canb.auug.org.au>
 <54244db6-ff69-4cf8-894c-c3dd2f12df9c@infradead.org>
 <5d894e71-25ad-8ba0-f632-2eec6e017f46@ghiti.fr>
 <ee3bc2ce-5ebe-927e-5b6d-0b9490ef3875@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <ee3bc2ce-5ebe-927e-5b6d-0b9490ef3875@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_042245_587377_0760898A 
X-CRM114-Status: GOOD (  13.71  )
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
Content-Type: multipart/mixed; boundary="===============5890796914329809892=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5890796914329809892==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zXr/mpVKTRvFI6MJ"
Content-Disposition: inline

--zXr/mpVKTRvFI6MJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 12:42:55PM +0200, Alexandre Ghiti wrote:

> > > /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld:
> > > section .data LMA [000000000041a000,00000000075bffd7] overlaps
> > > section .text LMA [00000000000f09d4,00000000033562ab]
> > > /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld:
> > > section .init.pi.text LMA [00000000033562ac,0000000003359137]
> > > overlaps section .data LMA [000000000041a000,00000000075bffd7]
> >=20
> >=20
> > I'll check this one too which seems to be related to kernel/pi
> > introduction.
>=20
>=20
> Thanks to Bjorn: this is caused by XIP_KERNEL, which is known to have
> limited size, hence the overlap, so no fix for this one. Is there a way to
> exclude this config from randconfig?

What exactly is the problem? That the randconfig is too big for the max
XIP kernel size?
We already disable half the world for XIP, is turning off the pi stuff
an option? It's already turned off for 32-bit, right?


--zXr/mpVKTRvFI6MJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGdb6gAKCRB4tDGHoIJi
0vVYAQCuJQDeHvqAW7U7kTId0ub6ZpJPRnn7lZisW1y8nNo8WQEA8DchlX9mBO3w
LTWmWx2BpAoAM7VuXrI5pFiIuZA9qQU=
=kiLz
-----END PGP SIGNATURE-----

--zXr/mpVKTRvFI6MJ--


--===============5890796914329809892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5890796914329809892==--

