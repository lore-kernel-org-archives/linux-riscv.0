Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E26AC28B28
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 18:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpsTGdj0e7H8h5HcWAKbj8ayFWNqoKSEq/MMrrT/GwI=; b=d6bL5Yh54yG9jR2VrxibrkbwXP
	e/rS80DY0dNI4zs0PQ7aUHZ55mW8TbFmT1QAnn7yjn788foGYRRw5vl2UmVpVY92NZzR1azevu9+3
	L15/8TuepS0efiPcpm7zqkMJlF/9URHE49C9BhO2WexF+8eSHfqevujjs5F4ank97VBvKwukvGWw/
	u0EfkcAxid1g2ZHGNsQqjntHzIgaOFdhQGKsb+rTZZGh4EGKM9UiaVUFuOCZ7FcBUWIlK4/l5q6si
	xo8RQEyaNB9bZousXmfKpyewv4e7foW8DffL1LmO9NV/CywlAb2z9JVjxpafc2cL4YdARN2eLaZos
	JPRI88wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnAw-0000000CBK7-3aOk;
	Thu, 13 Mar 2025 18:20:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tslb5-0000000BrIt-3eTP;
	Thu, 13 Mar 2025 16:39:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF76BA477BB;
	Thu, 13 Mar 2025 16:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112F0C4CEDD;
	Thu, 13 Mar 2025 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741883990;
	bh=SJIh4TOyAnLQgRaND+z2LtBYQ5hvnSYhcxMltVARNHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jXsvsd/lxGJNEoAX6HtYBN5kSEz6YHB6jkvfmSGlAYkaC6zejLPn/jhjOGbnxowV9
	 G4ObNvl3IBz4OwYO2TlZ/bLh8DZduHi5CkgzYMn1CVOppgH6xx0HzA9IMhHkCryYCY
	 ZnelQtcYuqYVLCo8RDAfcA5wrN0rilAxNY4bxJB3K1CqJlX1tG+a3qgJkkTCsPFO7h
	 mIMi9CWIvAGiys0Idmh6XXVvAFEOzxC+aoae1uw6WzZghXN98gnejmZ33szJK51KlP
	 WWbGYBsBTpQxs6TW4o+VUbqyqW8YHpq93CdsecoGwYUTU6EUH46GDnnPb9iVFpOFP+
	 OQMV0Bj8JCyMQ==
Date: Thu, 13 Mar 2025 16:39:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v2 00/13] arch, mm: reduce code duplication in mem_init()
Message-ID: <5de71a98-d87f-4bfd-83a1-3f6e11c84d7d@sirena.org.uk>
Mail-Followup-To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
References: <20250313135003.836600-1-rppt@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250313135003.836600-1-rppt@kernel.org>
X-Cookie: A beer delayed is a beer denied.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_093952_048482_DB0E2AB2 
X-CRM114-Status: GOOD (  12.53  )
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
Content-Type: multipart/mixed; boundary="===============9026665509995910038=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9026665509995910038==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2QbfUHTxTDOlgUSw"
Content-Disposition: inline


--2QbfUHTxTDOlgUSw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 13, 2025 at 03:49:50PM +0200, Mike Rapoport wrote:

> v2 changes:
> * don't use generic version for setting high_memory on architectures
>   that use that varialble earlier than free_area_init()
> * use memblock_alloc_or_panig() to allocate zero pages on MIPS and s390
> * fix alignment in allocation of zero pages on s390
> * add Acked-by

This resolves the issues for 32 bit arm, at least the v7 boards:

Tested-by: Mark Brown <broonie@kernel.org>

My v5 and v6 boards are having issues but I think that's unrelated
infrastructure (in one case definitely so).

--2QbfUHTxTDOlgUSw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfTCkgACgkQJNaLcl1U
h9BPbAf/SDBWCt481g26uw69KoHpeH2cGq0Z5NH3zUIIBiu3gpRrex/BeLXVuY79
d57+lsymFEsgnNbhXNvzjAzmaRTSMBu9C1S5o4Jo3+sz8kEnBS/myycnCrbU+lVy
9R4LmwA4hhMZw2+UhgRPVFMTjd7fsFFLAsxmHyCheEOGfLGKMTKleusqFbK2phbu
IrDc/IU6mCxqGrgZ3lO0fV7w2SfpkBANi9bXJz7aeAbqsOBeVyLCKgAL/gsbZxDZ
g6Y0lOdm1gfigEHb8d5DiireqslCdgHnoH90rRI+3YBQiT8QOJLd/3W3G7YrKPNy
/ufJa9n1CuXbfkYbynfJxmTOHNUPHw==
=M7tK
-----END PGP SIGNATURE-----

--2QbfUHTxTDOlgUSw--


--===============9026665509995910038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9026665509995910038==--

