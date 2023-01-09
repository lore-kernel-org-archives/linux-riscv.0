Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB6AC54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 13:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yzb9zM71s+R2ZGNfCAz8EHiV8hIqFE0xAYkYM+VWzM=; b=r5sAeixTVtNQY+dbgMqZjErzmH
	goXFTiAHh+5pKlgOg97tHiacl1nUR1hNdYC7JvDwsCJIVWUFDBYJsvu9/UVS7W0u0V/CB/fbwudbP
	X4fZqwsxmyym+qPhXxzcG/r68H54Iyw+y/EW6GuoOVZK2L4Y8eri9Wq0omfnmNUFNKTkTtQ1D5kOb
	zJiXNYYotmEBuDEkMej7yjkkkbv/LfbVZMib6XvCvUp+Qy9nrnPsA34DNwb77zqgq7EzLzxdHlm6S
	ElDNxwVodH7LEyp4afd001MC4yH+vpSb0LtR7oq4y51EDHmztOiYtq2S4AOtY3b78PLtqBYujXLqX
	au/uq9vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEsCF-001aXG-VB; Mon, 09 Jan 2023 13:28:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEsCB-001aTM-0g
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 13:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673270890; x=1704806890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pI9iCisd3SYnJ2fP9FfubE61ZiDt/emWCk3DGSaK2Q0=;
  b=hJ1ymvW0ZIxkIkNFTc7Mm4bfZ/XRTaCFOC8JgK9Ddp4h20RDXwSgyyh6
   F1CmF9Bn0/3revAyQDrkndNV/zkJph+cjfpDIX4wNowGxzQh5OvBntoWD
   Hy4HtfItt6K0YSE9E8ZGw5QC542Ra2dlOoedWJ5I7ME6K8YZkpnBuXfAk
   GxE6j7jZAonttOrnSeWqjhxz0fvuvEX245viHKIYcJaNkW0BKIiy7FqzC
   Taj+bLks1kdSAZbT043Rwjmj823fxJ5u0Ck47ZVW8t3KIk9BVgUTOKbaW
   r6H8J3kLXTeeg07qO6B5vvjMW1bzEbCifgosvzlgR0xeclrLe2gW7um9C
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="asc'?scan'208";a="131470464"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jan 2023 06:27:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 9 Jan 2023 06:27:56 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 9 Jan 2023 06:27:53 -0700
Date: Mon, 9 Jan 2023 13:27:31 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Heiko =?iso-8859-1?Q?St=FCbner?=
	<heiko@sntech.de>, guoren <guoren@kernel.org>, Andrew Jones
	<ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "open
 list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Linux-Renesas
	<linux-renesas-soc@vger.kernel.org>, "Lad, Prabhakar"
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Philipp Tomsich
	<philipp.tomsich@vrull.eu>, Nathan Chancellor <nathan@kernel.org>, Atish
 Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, Tsukasa OI
	<research_trasio@irq.a4lg.com>, Jisheng Zhang <jszhang@kernel.org>, Mayuresh
 Chitale <mchitale@ventanamicro.com>, Christoph Hellwig <hch@lst.de>, Will
 Deacon <will@kernel.org>
Subject: Re: [RFC PATCH v6 1/6] riscv: mm: dma-noncoherent: Switch using
 function pointers for cache management
Message-ID: <Y7wWQ200sdN2rAmX@wendy>
References: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230106185526.260163-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <6f7d06ef-d74d-4dfc-9b77-6ae83e0d7816@app.fastmail.com>
 <CA+V-a8uF1s+dwKC_+apL+CBiHN8w_J0n_G2dqsgiAUZVEibfqg@mail.gmail.com>
 <9017adf0-acd4-4c43-8aea-3579b214b477@app.fastmail.com>
 <CA+V-a8u6jvR=EDeE3mAbDr6-06NoBJ7mwmi_Y9qVyHT+aC-9rg@mail.gmail.com>
 <45d6eb0c-cbe3-4a83-aa12-3483638473ae@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <45d6eb0c-cbe3-4a83-aa12-3483638473ae@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_052811_340987_215FF707 
X-CRM114-Status: GOOD (  31.53  )
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
Content-Type: multipart/mixed; boundary="===============4019245306215073846=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4019245306215073846==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EfZa/VP/6LktfZba"
Content-Disposition: inline

--EfZa/VP/6LktfZba
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 09, 2023 at 01:59:12PM +0100, Arnd Bergmann wrote:
> On Mon, Jan 9, 2023, at 13:03, Lad, Prabhakar wrote:
> > On Sun, Jan 8, 2023 at 12:08 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >> >> > +struct riscv_cache_ops {
> >> >> > +     void (*clean_range)(unsigned long addr, unsigned long size);
> >> >> > +     void (*inv_range)(unsigned long addr, unsigned long size);
> >> >> > +     void (*flush_range)(unsigned long addr, unsigned long size);
> >> >> > +     void (*riscv_dma_noncoherent_cmo_ops)(void *vaddr, size_t s=
ize,
> >> >> > +                                           enum dma_data_directi=
on dir,
> >> >> > +                                           enum dma_noncoherent_=
ops ops);
> >> >> > +};
> >> >>
> >> >> I don't quite see how the fourth operation is used here.
> >> >> Are there cache controllers that need something beyond
> >> >> clean/inv/flush?
> >> >>
> >> > This is for platforms that dont follow standard cache operations (li=
ke
> >> > done in patch 5/6) and there drivers decide on the operations
> >> > depending on the ops and dir.
> >>
> >> My feeling is that the set of operations that get called should
> >> not depend on the cache controller but at best the CPU. I tried to
> >> enumerate how zicbom and ax45 differ here, and how that compares
> >> to other architectures:
> >>
> >>                   zicbom      ax45,mips,arc      arm           arm64
> >> fromdevice      clean/flush   inval/inval   inval/inval   clean/inval
> >> todevice        clean/-       clean/-       clean/-       clean/-
> >> bidi            flush/flush   flush/inval   clean/inval   clean/inval

I did a bit of digging on lore for context on why the ops are what they
are..
In v3 of the Zicbom enablement patchset, things looked like:
=66romdevice	inval/inval
todevice	clean/-
bidi		flush/inval

v3:
https://lore.kernel.org/linux-riscv/20220610004308.1903626-3-heiko@sntech.d=
e/

Samuel had some comments about the invals:
https://lore.kernel.org/linux-riscv/342e3c12-ebb0-badf-7d4c-c444a2b842b2@sh=
olland.org/

In v4 it was changed to:
=66romdevice	inval/flush
todevice	clean/-
bidi		flush/flush

v4:
https://lore.kernel.org/linux-riscv/20220619203212.3604485-4-heiko@sntech.d=
e/

Christoph replied to that one, linking the thread belonging to the
commit you pointed out earlier:
https://lore.kernel.org/linux-riscv/20220620061607.GB10485@lst.de/

v5 produced what you have in your table above:
https://lore.kernel.org/linux-riscv/20220629215944.397952-4-heiko@sntech.de/

> >>
> >> So everyone does the same operation for DMA_TO_DEVICE, but
> >> they differ in the DMA_FROM_DEVICE handling, for reasons I
> >> don't quite see:
> >>
> >> Your ax45 code does the same as arc and mips. arm and
> >> arm64 skip invalidating the cache before bidi mappings,
> >> but arm has a FIXME comment about that. arm64 does a
> >> 'clean' instead of 'inval' when mapping a fromdevice
> >> page, which seems valid but slower than necessary.
> >>
> >> Could the zicbom operations be changed to do the same
> >> things as the ax45/mips/arc ones, or are there specific
> >> details in the zicbom spec that require this?
> >>
> > I'll let the RISC-V experts respond here.
>=20
> Adding Christoph Hellwig and Will Deacon to Cc as well.
>=20
> I had another look at the arm64 side, which (like the zicbom
> variant) uses 'clean' on dma_sync_single_for_device(DMA_FROM_DEVICE),
> as that has changed not that long ago, see
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dc50f11c6196f45c92ca48b16a5071615d4ae0572
>=20
> I'm still not sure what the correct set of operations has
> to be, but nothing in that patch description sounds ISA
> or even microarchitecture specific.

Hope the lore archaeology helps jog people's memories...

Conor


--EfZa/VP/6LktfZba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7wWQwAKCRB4tDGHoIJi
0gL7AQDEzebwbDTWywTDxF0JbLupBm3vCX+c0NjvVE0cz+r1qwEAhs7DXHh6uLCR
MEBu78WTgDnKbkFV06kacnxKCzIo8gE=
=RzhW
-----END PGP SIGNATURE-----

--EfZa/VP/6LktfZba--


--===============4019245306215073846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4019245306215073846==--

