Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A0AC77B6C
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 07:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQX1w7Wa9IcRH7qn4cFr0rTA2ayvG8esiY1NoeQDIP8=; b=HN7ikxlFCOrOmIXmG38Jx77vOg
	JNaNqE6GPW3E3R1ppBgCbDVyaSLW/O7P07gVwbbmZuRc6N2np7c53oX+LdLEAJvkh6RVLnjIneqFo
	xEOR0s/CeU5P9ut+GEzVHjsTFog3KDJhrG2ZyYPln8nwLQvda1mDLq6RxQUsSo13WjsDmEFTOx3lC
	GuAqZVhjloAlSXSb2q9hhnIHO9j8HWgPRjV2dfhW36jsfTgIOTSkLtTkw3CJfiU+X//2MRJB4Fa1E
	5DeyukUkW6bOXAJbodNVnil9IK9kk98VeFq/wk+RLzWBaYjjjlCYYuh4gKFwb/3BXtq6uSkSpyJ1n
	y1NzULpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phQVj-00GxH5-25;
	Wed, 29 Mar 2023 07:46:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phQVg-00GxG2-21
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 07:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680075981; x=1711611981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RXE11WAjq7Mq1gQbnjVpv6i2MWcnuFssWTa5BCBjDx8=;
  b=Mn/+z4Q+iaFSEkbjp5aRUuhlgw0nIVZnnn8UZSBu+Jriikj9eXbdpmWU
   2N6Aek68kNByjGHWWhQFMiMBfaoNtF9WqJ9ZJflLVKUr0SVPSv4oK66Fs
   /M6iT4QLXifQPK9PHoGbzY6nGdywkqj3TrOHe7ovzDHiJieB0MDKbPcRn
   cizMEJVaWLsX7xO4tTuWhbDH0zo8M7f651lWMx1zEdndgpTI1aEBH37vB
   Di1c/0pTo0PZ+QDh2G1pqm22QkkWEgEjuv8Cai5FrMWnma74tGs8gJnmv
   x3QeOph6tkGImd4EfopesixtNrLHS7tLGsq0kjyi5JNmpvrL+pqJTcqv2
   g==;
X-IronPort-AV: E=Sophos;i="5.98,300,1673938800"; 
   d="asc'?scan'208";a="203958215"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Mar 2023 00:46:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 00:46:11 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 29 Mar 2023 00:46:09 -0700
Date: Wed, 29 Mar 2023 08:45:56 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
	<corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -fixes 1/2] riscv: Move early dtb mapping into the fixmap
 region
Message-ID: <3fbfd976-6a24-44cf-91f2-89cc050b4256@spud>
References: <20230323163347.182895-1-alexghiti@rivosinc.com>
 <20230323163347.182895-2-alexghiti@rivosinc.com>
 <292617ac-b63b-473d-8d4e-2817d17233a1@spud>
 <b9097be8-b842-5e53-f728-a8cb6251316d@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <b9097be8-b842-5e53-f728-a8cb6251316d@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_004620_697064_7C1E29F3 
X-CRM114-Status: GOOD (  31.75  )
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
Content-Type: multipart/mixed; boundary="===============0422482451153757504=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0422482451153757504==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mHQtHzilC6ByhlZn"
Content-Disposition: inline

--mHQtHzilC6ByhlZn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 09:36:00AM +0200, Alexandre Ghiti wrote:
> On 3/27/23 12:37, Conor Dooley wrote:
> > On Thu, Mar 23, 2023 at 05:33:46PM +0100, Alexandre Ghiti wrote:

> The fix is not wrong, it is just incomplete: it fixes the issue with the
> not-existing-anymore address but introduces the problem with the possible
> allocations in the reserved regions (which you explained clearly below,
> thanks).

Which to me, makes it wrong ;) It's my own patch I'm dumping on so I
think I am best qualified to do that!

> > It would be good to mention that specifically I think, say:
> >=20
> > 	riscv establishes 2 virtual mappings:
> >=20
> > 	- early_pg_dir maps the kernel which allows to discover the system
> > 	  memory
> > 	- swapper_pg_dir installs the final mapping (linear mapping included)
> >=20
> > 	We used to map the dtb in early_pg_dir using DTB_EARLY_BASE_VA, and th=
is
> > 	mapping was not carried over in swapper_pg_dir. This caused problems
> > 	for reserved memory, as early_init_fdt_scan_reserved_mem() initialised
> > 	reserved_mem variables with addresses that lie in the early_pg_dir dtb
> > 	mapping. When those addresses are reused with swapper_pg_dir, this
> > 	mapping does not exist and then we trap.
> > 	The previous "fix" was incorrect as early_init_fdt_scan_reserved_mem()
> > 	must be called before swapper_pg_dir is set up otherwise we could
> > 	allocate in reserved memory defined in the dtb.
> >=20
> > 	Move the dtb mapping in the fixmap region which is established in
> > 	early_pg_dir and handed over to swapper_pg_dir.
> >=20
> > You need this one too:
> > Fixes: 922b0375fc93 ("riscv: Fix memblock reservation for device tree b=
lob")
>=20
> Not sure this commit is related to this fix and it's hard to find *one*
> culprit: TBH I only mentioned this one as otherwise I think the right com=
mit
> is commit 8f3a2b4a96dc ("RISC-V: Move DT mapping outof fixmap") but that'=
s a
> long time ago and the patch won't apply easily, not sure what to do here.

Yeah, it's hard to say.. I think the one I mentioned above should be
mentioned though, because that's what (I think) introduced the bug that
I was fixing in my commit, so if this patch is replacing my fix (which
it is) then I think it should have a super-set of the Fixes: tags in my
one.

> > Thanks for working on this,
>=20
>=20
> You're welcome, that was fun!

Sounds like masochism to me! ;)


--mHQtHzilC6ByhlZn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCPspwAKCRB4tDGHoIJi
0n4CAQDthtD9EQ0oVsSXbJlZB5gXxT0oxDzOxUW/Gy6acDiNewD/Qdy18eeHVLCP
ZtZm+663INT/3mXFda24f6EIu8spDAk=
=7bOX
-----END PGP SIGNATURE-----

--mHQtHzilC6ByhlZn--


--===============0422482451153757504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0422482451153757504==--

