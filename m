Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE205EC1127
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 19:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UtHww8U7GjYhRpCc16EJ6I5lq+j5m9bEbeRBZhPafRo=; b=Rqxx/k/Bl1zo11
	iQK9Rtvo8SfQurbZ+6PYlGWkebTK7kabpJsRIG16BnHQv0CWKQspNEsZlmizoxrD3+n4bwz4RXZne
	XDKV9xxJDgWmeZm/hTxbt5gRzXFKLX9k959MyqaxOuWBYkfvUwZc1FaK+MYahOZpAPWDQf7SvXKHF
	+fL1QlPQYpAH7/9tLRMCfS0Rll/d7kRAanKp077y6668efKeFX9T1DY1zWyVvIBv53H0aVywbdaMO
	Kz88iGyKDQliC8cmu+d24pTBaT4R4NqYvir/SzyEb8+GPQNxazAgmqgq5WSBHi4uBsVfM8M/eAXZc
	E8FTshVkmDsKDoTgdUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vubnq-00000000wca-2Ev2;
	Mon, 23 Feb 2026 19:41:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vubno-00000000wcE-1dCj
	for linux-riscv@lists.infradead.org;
	Mon, 23 Feb 2026 19:41:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0851A41A8C;
	Mon, 23 Feb 2026 19:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8185CC116C6;
	Mon, 23 Feb 2026 19:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771875667;
	bh=WEA6P95rkpZGExTdoo0RdXuU9UiczYMaZDEepqmmNf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HHE7diwSspbMM7gFWFYKCy8L8ucllyJCnYSvp3iCleZ1TGGXI2au3miXIunOKIsJ+
	 VBDHHzqtvSaMet6brn85yJfH+ndBeWY2y4uqBzIxb8dno1e3MfFjQX6Gc2yjDyIxSP
	 pBA86kZeTw5qvbxPYqJaBLHt/9WEWufkPKOEqM+K7zVMGGe1f4G/Kqvl5ts4IeFIZr
	 qszRyR4+lO2yG6+Clh6gDC+tt/IavaWv8EGjzPasQgM8umTyGCAEVhaQiAGuuwzQPL
	 7QcSsNYgrrxCHge0KyVDHNl0ha1DYW70VaWBP6Kq9iNSPldoa66XNX1nIeg5G0ijvw
	 elPrtlC69zfwg==
Date: Mon, 23 Feb 2026 21:40:59 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org
Subject: Re: [PATCH v3 24/29] arch, mm: consolidate initialization of SPARSE
 memory model
Message-ID: <aZytSwzGj24lqkLU@kernel.org>
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260111082105.290734-25-rppt@kernel.org>
 <20260223144108-dcace0b9-02e8-4b67-a7ce-f263bed36f26@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260223144108-dcace0b9-02e8-4b67-a7ce-f263bed36f26@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_114108_490375_6E59565A 
X-CRM114-Status: GOOD (  24.23  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Thomas,

On Mon, Feb 23, 2026 at 02:52:45PM +0100, Thomas Wei=DFschuh wrote:
> Hi everyone,
> =

> On Sun, Jan 11, 2026 at 10:20:58AM +0200, Mike Rapoport wrote:
> > Every architecture calls sparse_init() during setup_arch() although the
> > data structures created by sparse_init() are not used until the
> > initialization of the core MM.
> > =

> > Beside the code duplication, calling sparse_init() from architecture
> > specific code causes ordering differences of vmemmap and HVO initializa=
tion
> > on different architectures.
> > =

> > Move the call to sparse_init() from architecture specific code to
> > free_area_init() to ensure that vmemmap and HVO initialization order is
> > always the same.
> =

> This broke the boot on RISC-V 32-bit (rv32_defconfig) for me.
> =

> Specifically if sparse_init() is *not* called before the following callch=
ain,
> the kernel dies at that point.
> =

> start_kernel()
>   setup_arch()
>     apply_boot_alternatives()
>       _apply_alternatives()
>         riscv_cpufeature_patch_func()
>           patch_text_nosync()
>           riscv_alternative_fix_offsets()

Hm, most architectures do alternatives patching much later in the boot,
when much more subsystems (including mm) is already initialized.

Any particular reason riscv does it that early? =

 =

> Simple reproducer, using kunit:
> =

> ./tools/testing/kunit/kunit.py run --raw_output=3Dall --make_options LLVM=
=3D1 --arch riscv32 --kconfig_add CONFIG_SPARSEMEM_MANUAL=3Dy --kconfig_add=
 CONFIG_SPARSEMEM=3Dy

Looking at patch_map it's quite clear why movement of sparse_init() cased a
crash:

	if (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr))
		page =3D phys_to_page(__pa_symbol(addr));

phys_to_page() with CONFIG_SPARSEMEM=3Dy will try to access memory section
that are initialized in sparse_init().

What I don't understand is why patch_map() needs a struct page for kernel
text patching at all, __pa_symbol() should work just fine.
And the BUG_ON(!page) is completely bogus for phys_to_page() conversion,
because that one is pure arithmetics.

If moving apply_boot_alternatives() is not an option for riscv, something
like the patch below should fix the issue with access to nonexistent
memory sections. But I think moving apply_boot_alternatives() later in boot
would make things less fragile.

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index db13c9ddf9e3..89b3c13f2865 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -43,18 +43,19 @@ static __always_inline void *patch_map(void *addr, cons=
t unsigned int fixmap)
 {
 	uintptr_t uintaddr =3D (uintptr_t) addr;
 	struct page *page;
+	phys_addr_t phys;
 =

-	if (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr))
-		page =3D phys_to_page(__pa_symbol(addr));
-	else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
+	if (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr)) {
+		phys =3D __pa_symbol(addr);
+	} else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
 		page =3D vmalloc_to_page(addr);
-	else
+		BUG_ON(!page);
+		phys =3D page_to_phys(page);
+	} else {
 		return addr;
+	}
 =

-	BUG_ON(!page);
-
-	return (void *)set_fixmap_offset(fixmap, page_to_phys(page) +
-					 offset_in_page(addr));
+	return (void *)set_fixmap_offset(fixmap, phys + offset_in_page(addr));
 }
 =

 static void patch_unmap(int fixmap)

-- =

Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
