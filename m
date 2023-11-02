Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98FEC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 10:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEvlrpJjbZ9zWTgih+YS0y+6F2b66GB4+xLuMEhATzw=; b=ognggfne5FzBJkiJyOS0WJ0/o+
	/Pk30a/jxfQwS3/y1H+KyvW1TcqhH0QqR+E0Aa8fMSIZ88vwgUuGVlRotWGHv7kFji4cDrPOvMYws
	Wxy8oKfQKI+p6oVt6q3WwcCRxGCibiNdRKY4kHrt1uW/nyZHpGoPY2PoVPNrzIoCiK4HbKWm40Q5+
	dgcKu50mwUSIb/ehUFvmMOCzKMWRGMjvkPOs4UmvesPl7zVE9oEcK7TnEY4od3GoBke1bGEZz/q6j
	EklLMwl1CW/7CiRpFlIiI9G9feiCbBf5ZLkAtOdYDxd8gtDZw/Nx6ed/Q5AXqDgvADgWGrAAdBqqM
	oI6cKQmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyUqX-0097DQ-2x;
	Thu, 02 Nov 2023 10:22:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyUqS-0097Ci-2u
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 10:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1698920557; x=1730456557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QTIJe6fBmHZ5pDGO2297HJQPTJ63MepYsAuffQjdfjA=;
  b=t4yD8j4UylEbW4CcGyFbVUnUhY8ytqLCCP9tz0QwiII20VZwggwcPnSf
   wbgRWV45JnABuL2fE6VFSPa31RohEXWPlFg02/4HgLMb2MuIVz3WpIjQc
   BrtOjPkqUjronn9DXGYCyUi58Q3d0edXBzo0xGOWkOD7kmXiu0NsYslHV
   TFfhMqVKn//QpifHVHuWrL86A3yAJ3klPmpUviJMtmb/qtAPdD9UiPfAx
   o/PfL0oZqh5es8qjrLTLxrdkDLDRQLjrLMPztsysOJCtgmtIP0Iuu5okP
   zbPoSNxKYktuJZYYPvy1bHEOfENAijvdyDy9ep5FUiC55jsC2HPxLvqe5
   Q==;
X-CSE-ConnectionGUID: dttG3pA+QG+SpyyA/RvAEA==
X-CSE-MsgGUID: fmLvno0mTHGxaLzBwfDWtA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="asc'?scan'208";a="241755710"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Nov 2023 03:22:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Nov 2023 03:22:18 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 2 Nov 2023 03:22:16 -0700
Date: Thu, 2 Nov 2023 10:21:51 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>, David Laight
	<David.Laight@aculab.com>, Xiao Wang <xiao.w.wang@intel.com>, Evan Green
	<evan@rivosinc.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann
	<arnd@arndb.de>
Subject: Re: [PATCH v9 0/5] riscv: Add fine-tuned checksum functions
Message-ID: <20231102-express-deplete-4dd19e21a82c@wendy>
References: <20231031-optimize_checksum-v9-0-ea018e69b229@rivosinc.com>
 <20231101-palace-tightly-97a1d35a4597@spud>
 <ZUKFkn/PzOjw129p@ghost>
MIME-Version: 1.0
In-Reply-To: <ZUKFkn/PzOjw129p@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_032237_008163_4317DD49 
X-CRM114-Status: GOOD (  33.19  )
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
Content-Type: multipart/mixed; boundary="===============8983055560314441111=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8983055560314441111==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iP257PpdxnYzWyml"
Content-Disposition: inline

--iP257PpdxnYzWyml
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 01, 2023 at 10:06:26AM -0700, Charlie Jenkins wrote:
> On Wed, Nov 01, 2023 at 11:50:46AM +0000, Conor Dooley wrote:
> > On Tue, Oct 31, 2023 at 05:18:50PM -0700, Charlie Jenkins wrote:
> > > Each architecture generally implements fine-tuned checksum functions =
to
> > > leverage the instruction set. This patch adds the main checksum
> > > functions that are used in networking.
> > >=20
> > > This patch takes heavy use of the Zbb extension using alternatives
> > > patching.
> > >=20
> > > To test this patch, enable the configs for KUNIT, then CHECKSUM_KUNIT
> > > and RISCV_CHECKSUM_KUNIT.
> > >=20
> > > I have attempted to make these functions as optimal as possible, but I
> > > have not ran anything on actual riscv hardware. My performance testing
> > > has been limited to inspecting the assembly, running the algorithms on
> > > x86 hardware, and running in QEMU.
> > >=20
> > > ip_fast_csum is a relatively small function so even though it is
> > > possible to read 64 bits at a time on compatible hardware, the
> > > bottleneck becomes the clean up and setup code so loading 32 bits at a
> > > time is actually faster.
> > >=20
> > > Relies on https://lore.kernel.org/lkml/20230920193801.3035093-1-evan@=
rivosinc.com/
> >=20
> > I coulda sworn I reported build issues against the v8 of this series
> > that are still present in this v9. For example:
> > https://patchwork.kernel.org/project/linux-riscv/patch/20231031-optimiz=
e_checksum-v9-3-ea018e69b229@rivosinc.com/

> You did, and I fixed the build issues. This is another instance of how
> Patchwork reports the results of the previous build before the new build
> completes. Patchwork was very far behind so it took around 15 hours for
> the result to be ready.

:clown_face:

> There are some miscellaneous warnings in random
> drivers that I don't think can be attributed to this patch.

Yeah, there sometimes are warnings that seem spurious when you touch a
bunch of header files. I'm not really sure how to improve on that, since
it was newly introduced. My theory is that how we do a build of commit
A, then commit A~1 and then commit A again & take the difference between
the 2nd and 3rd builds (which should both be partial rebuilds) is not as
symmetrical as I might've thought and is the source of those seemingly
unrelated issues that come up from time to time.

--iP257PpdxnYzWyml
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUN4PwAKCRB4tDGHoIJi
0jV3AP9c6KociGHuayEHtzK5fniiLEgkWkN9CfAqobQ+jqH0lAEA7HISbiX11E5K
Exvq77KvbRkFrOWUcY+p5/1Ke/8UYwU=
=M/iI
-----END PGP SIGNATURE-----

--iP257PpdxnYzWyml--


--===============8983055560314441111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8983055560314441111==--

