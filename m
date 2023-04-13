Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF80C77B6C
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Apr 2023 07:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0l3IF2VxNQNySoqGQriV9ci+fyAu33KWDD4cFtAYro=; b=m8yjH8YOgbtKaQ3D5o+Tafi1jg
	MLhqMI3JdbaSC8F09aCBdWz1c9Zi4UamBRE7MkGaUgFtOfRtDaBJnvboAM9fpHhLG2V59XfVwNwbY
	IEPnzB9VLNB5DnCIpyKxoomKH+ik1UJ5IM7im2T7/pwFIE+Quvn5uBwu6evRnZE41Mls1UKCGpw5Z
	yMkOgVFyWBuF3LnZM1X51H345pnoZgvBDz6f5yQLq0iUWoPPtknTs5MsMACQbvgOD5132W5CcOXRh
	Ffdyr51decFyz2DnDa5CHIXByvwscFvyqvIHzzdIARthPgvfLXWVwd+vNve9cttWOxSv1x2T3nQbx
	Afrqjx9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmr2l-005DrY-2P;
	Thu, 13 Apr 2023 07:06:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmr2h-005Dot-0e
	for linux-riscv@lists.infradead.org;
	Thu, 13 Apr 2023 07:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681369611; x=1712905611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hnm+qNASwOYDuG5+oouWNRN2g8HpLaKpYCGdfHgO0rk=;
  b=F3yoQPYz05Ya9eoG/hcYbymNyjeMhdAvsr6WoptJTsfNd8bH53F62OhW
   LMIrTC6dL37DkZ1gMbeC9VOC1NG3a6A6Srfat1ZRcQeFHdmtgs6ilLQ/K
   DzrngFQv7XeQgwlchTRfhFXvBcFbDPTolWPVA7LwMdT8nzVvlxM5G2IDi
   o40mCSfu/GSoGlb+0UVib/y66e+GtKoJmA/O60uRVLEv1zIw59z4Wb6mI
   MQgZT2UpFPB9SKIJipByuk9Dsg7NPiben86EAufdk/Wo8apxviPNzHWx+
   Fw+JLa+RL5/VmEi2IuYUsATD3Ootff2h+teDye941yBCnQGF293qX+Q4m
   w==;
X-IronPort-AV: E=Sophos;i="5.98,339,1673938800"; 
   d="asc'?scan'208";a="206289796"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2023 00:06:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 13 Apr 2023 00:06:41 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 13 Apr 2023 00:06:38 -0700
Date: Thu, 13 Apr 2023 08:06:23 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>, Prabhakar <prabhakar.csengg@gmail.com>
CC: Prabhakar <prabhakar.csengg@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner
	<heiko@sntech.de>, Guo Ren <guoren@kernel.org>, Andrew Jones
	<ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Samuel
 Holland <samuel@sholland.org>, <linux-riscv@lists.infradead.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v8 5/7] cache: Add L2 cache management for Andes AX45MP
 RISC-V core
Message-ID: <20230413-aorta-unheated-c9bb35411fb2@wendy>
References: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230412110900.69738-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230412-cheddar-prune-5ce03ccf5581@spud>
MIME-Version: 1.0
In-Reply-To: <20230412-cheddar-prune-5ce03ccf5581@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_000651_378131_19D5283E 
X-CRM114-Status: GOOD (  25.69  )
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
Content-Type: multipart/mixed; boundary="===============3085566621281780419=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3085566621281780419==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="68CN9R7A95sqqPd1"
Content-Disposition: inline

--68CN9R7A95sqqPd1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2023 at 09:25:34PM +0100, Conor Dooley wrote:
> On Wed, Apr 12, 2023 at 12:08:58PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >=20
> > I/O Coherence Port (IOCP) provides an AXI interface for connecting
> > external non-caching masters, such as DMA controllers. The accesses
> > from IOCP are coherent with D-Caches and L2 Cache.
> >=20
> > IOCP is a specification option and is disabled on the Renesas RZ/Five
> > SoC due to this reason IP blocks using DMA will fail.
> >=20
> > The Andes AX45MP core has a Programmable Physical Memory Attributes (PM=
A)
> > block that allows dynamic adjustment of memory attributes in the runtim=
e.
> > It contains a configurable amount of PMA entries implemented as CSR
> > registers to control the attributes of memory locations in interest.
> > Below are the memory attributes supported:
> > * Device, Non-bufferable
> > * Device, bufferable
> > * Memory, Non-cacheable, Non-bufferable
> > * Memory, Non-cacheable, Bufferable
> > * Memory, Write-back, No-allocate
> > * Memory, Write-back, Read-allocate
> > * Memory, Write-back, Write-allocate
> > * Memory, Write-back, Read and Write-allocate
> >=20
> > More info about PMA (section 10.3):
> > Link: http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-=
Datasheet.pdf
> >=20
> > As a workaround for SoCs with IOCP disabled CMO needs to be handled by
> > software. Firstly OpenSBI configures the memory region as
> > "Memory, Non-cacheable, Bufferable" and passes this region as a global
> > shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
> > allocations happen from this region and synchronization callbacks are
> > implemented to synchronize when doing DMA transactions.
> >=20
> > Example PMA region passes as a DT node from OpenSBI:
> >     reserved-memory {
> >         #address-cells =3D <2>;
> >         #size-cells =3D <2>;
> >         ranges;
> >=20
> >         pma_resv0@58000000 {
> >             compatible =3D "shared-dma-pool";
> >             reg =3D <0x0 0x58000000 0x0 0x08000000>;
> >             no-map;
> >             linux,dma-default;
> >         };
> >     };
> >=20
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v7 -> v8
> > * Dropped function pointer usage
> > * Now exporting the functions for clean/inval/flush
> > * Switched to using early_initcall instead of arch_initcall
> > * Dropped entry for "include/cache" from MAINTAINERS
> > * Dropped dependency of RISCV on AX45MP_L2_CACHE
> > * Returning error in case of cache line mismatch
>=20
> > * Renamed clean/inval/flush functions
>=20
> I kinda screwed you with that request given Hellwig's NAK on the
> function pointer based stuff. Ah well, I prefer matching the proposed
> naming of the dma core to what RVI chose for the instructions.
>=20
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> I suppose this will need a resubmission once Arnd's stuff gets applied,
> but I would like to see it have a run through the build bots etc.

So apparently my build bot did actually run against this series?
https://patchwork.kernel.org/project/linux-riscv/list/?series=3D739109

To be quite honest, I am not sure at all how it managed to apply the
series w/ Arnd's pre-reqs. Perhaps it has achieved some from of
sentience. There's a build failure for 32-bit that appeared on the final
patch, but is not really its fault:
=2E./arch/riscv/mm/dma-noncoherent.c: Assembler messages:
=2E./arch/riscv/mm/dma-noncoherent.c:104: Error: unrecognized opcode `sd s0=
,0(sp)'
=2E./arch/riscv/mm/dma-noncoherent.c:105: Error: unrecognized opcode `sd ra=
,8(sp)'
=2E./arch/riscv/mm/dma-noncoherent.c:110: Error: unrecognized opcode `ld ra=
,8(sp)'
=2E./arch/riscv/mm/dma-noncoherent.c:111: Error: unrecognized opcode `ld s0=
,0(sp)'
=2E./arch/riscv/mm/dma-noncoherent.c:111: Error: unrecognized opcode `sd s0=
,0(sp)'
=2E./arch/riscv/mm/dma-noncoherent.c:112: Error: unrecognized opcode `sd ra=
,8(sp)'
=2E./arch/riscv/mm/dma-noncoherent.c:117: Error: unrecognized opcode `ld ra=
,8(sp)'
=2E./arch/riscv/mm/dma-noncoherent.c:118: Error: unrecognized opcode `ld s0=
,0(sp)'
=2E./arch/riscv/mm/pmem.c: Assembler messages:
=2E./arch/riscv/mm/pmem.c:98: Error: unrecognized opcode `sd s0,0(sp)'
=2E./arch/riscv/mm/pmem.c:99: Error: unrecognized opcode `sd ra,8(sp)'
=2E./arch/riscv/mm/pmem.c:104: Error: unrecognized opcode `ld ra,8(sp)'
=2E./arch/riscv/mm/pmem.c:105: Error: unrecognized opcode `ld s0,0(sp)'
=2E./arch/riscv/mm/dma-noncoherent.c:138: Error: unrecognized opcode `sd s0=
,0(sp)'
=2E./arch/riscv/mm/dma-noncoherent.c:139: Error: unrecognized opcode `sd ra=
,8(sp)'
=2E./arch/riscv/mm/dma-noncoherent.c:144: Error: unrecognized opcode `ld ra=
,8(sp)'
=2E./arch/riscv/mm/dma-noncoherent.c:145: Error: unrecognized opcode `ld s0=
,0(sp)'
=2E./arch/riscv/mm/pmem.c:104: Error: unrecognized opcode `sd s0,0(sp)'
=2E./arch/riscv/mm/pmem.c:105: Error: unrecognized opcode `sd ra,8(sp)'
=2E./arch/riscv/mm/pmem.c:110: Error: unrecognized opcode `ld ra,8(sp)'
=2E./arch/riscv/mm/pmem.c:111: Error: unrecognized opcode `ld s0,0(sp)'
=2E./arch/riscv/mm/pmem.c:110: Error: attempt to move .org backwards
=2E./arch/riscv/mm/pmem.c:116: Error: attempt to move .org backwards
=2E./arch/riscv/mm/dma-noncoherent.c:116: Error: attempt to move .org backw=
ards
=2E./arch/riscv/mm/dma-noncoherent.c:123: Error: attempt to move .org backw=
ards
=2E./arch/riscv/mm/dma-noncoherent.c:150: Error: attempt to move .org backw=
ards
make[4]: *** [../scripts/Makefile.build:252: arch/riscv/mm/pmem.o] Error 1
make[4]: *** [../scripts/Makefile.build:252: arch/riscv/mm/dma-noncoherent.=
o] Error 1
make[4]: Target 'arch/riscv/mm/' not remade because of errors.
make[3]: *** [../scripts/Makefile.build:494: arch/riscv/mm] Error 2
make[3]: Target 'arch/riscv/' not remade because of errors.
make[2]: *** [../scripts/Makefile.build:494: arch/riscv] Error 2

The simplest solution may to just be making the erratum depend on 64BIT?

Cheers,
Conor.


--68CN9R7A95sqqPd1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDep4wAKCRB4tDGHoIJi
0qzwAQCB//mAhLekJ/xXPUikaPY7lpNzWjR54lGI6mPu5J5JBwD/c3JyhxdH2BFo
n1Ax2ohRvR94ujh/Sjv4bRM0v8qTtAg=
=ymq9
-----END PGP SIGNATURE-----

--68CN9R7A95sqqPd1--


--===============3085566621281780419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3085566621281780419==--

