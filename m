Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B5BC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 06:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHolCDeWjDbJm9xOsx4bqf5Fc/ZBl+EXMHc/9CuaJf8=; b=QZfOg/7VRZ29+h
	f8dkid2lrKZINNzTG1tjf75zXSXbiZvEyY24rL6DCgxEz/K1g7w1vxE1pl94TgWni1x2wgnr6zx3b
	L+Q0FARxWFzVYqCgPMZZGEhSpa2NRuYMDHcJJVVVwbg4QhzgbfeorQOecWi70RONqeVZYlYChT24M
	DMO8qhgGs0kiev/I+oO2we1n903brDEY5gy/F0UAeYcOu6Ilj2+5QW9PtTNQzdd2++AjYdjOwSjq5
	iw+LSvNWkwevXlT6UaABZb7U5wGn8B8Y/Ity5i/SPvq80xQFpxeaOp8HPZj1RAfk3Gl2xOBou5ukA
	5JavT3Sw9Igf3U/+fnag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoLe-00000000mwt-41Ly;
	Wed, 01 Jul 2026 06:23:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoLc-00000000mwO-3NGJ;
	Wed, 01 Jul 2026 06:23:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC4CB6001D;
	Wed,  1 Jul 2026 06:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCAF1F000E9;
	Wed,  1 Jul 2026 06:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782886979;
	bh=+CV7vM2cx+5CJ4FbmSzaWHO/QerFhIw/VFpB9UKLnag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mebOUl/bwwqf4S7w7kuJFeK55aOXArL3TFyTg+YwHZM0Aqo11A2cwS2qc5uyoKBt3
	 dO1KZT7hVdrx3UQSma8+4XOmo21d0bOAN1LIlAgM9Y8eOKJY0Am34vRTyrvlFkADQo
	 x2jOHdyCdZ4ScD80uScfDrZqs4dIm7ltOQlidHQ4sEnEeMHf6nhJANmcdrRyxybp9x
	 JiBCaAsNQyVRCHvCxSm8C+u/RhJQ7nrDRUq8ub8VwDsYeOka1bmYijdNL1YvAxDwRy
	 dbxGH1+8CZ5cX5Q+oodtuhxPWpU3U8Kh2r3L9QxGBPoQqcrIq4NLslPud4kI2Fins+
	 hgjq0enJu8OWw==
From: Mike Rapoport <rppt@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>, 
 Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Will Deacon <will@kernel.org>, Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: linux-mm@kvack.org, Alexander Potapenko <glider@google.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrey Konovalov <andreyknvl@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20260630150413.1718632-1-ekffu200098@gmail.com>
References: <20260630150413.1718632-1-ekffu200098@gmail.com>
Subject: Re: [PATCH v3 0/8] treewide: remove unnecessary invalid range
 checks in memblock iteration loops
Message-Id: <178288696837.1179975.5183177963398478769.b4-ty@b4>
Date: Wed, 01 Jul 2026 09:22:48 +0300
MIME-Version: 1.0
X-Mailer: b4 0.15.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 01 Jul 2026 00:04:05 +0900, Sang-Heon Jeon wrote:
> treewide: remove unnecessary invalid range checks in memblock iteration loops
> 
> The memblock API guarantees that for_each_mem_range() and
> for_each_mem_pfn_range() never return an invalid range, meaning start is
> always less than end.
> 
> Several memblock callers still have unnecessary invalid range checks in
> their loop bodies, so remove them.
> 
> [...]

Applied to range-checks branch of memblock.git tree, thanks!

[1/8] arm64: mm: remove unreachable invalid range check in kasan_init_shadow()
      commit: f6e6c57f2e100813be6d5882060fef81cb6f32de
[2/8] LoongArch: remove unreachable invalid range check in kasan_init()
      commit: 68d3b7d58237b8794d9343210d4c90b8381cfa96
[3/8] riscv: remove unreachable invalid range check in create_linear_mapping_page_table()
      commit: 99e60ebe108817fd48791f2cb81f1e672ad8285b
[4/8] riscv: remove unreachable invalid range check in kasan_init()
      commit: 8008f6995d0c0cf22e7b4d60e95fe14085c10f35
[5/8] ARM: remove unreachable invalid range check in kasan_init()
      commit: 3db1a9ccf9290ea3fe01aadf3bd743ef7032b24a
[6/8] powerpc64/kasan: Remove unreachable invalid range check in kasan_init_phys_region()
      commit: 21e95a4b6f34770571eeeaa6adb535efba1b7281
[7/8] mm: remove unnecessary empty range check in early_calculate_totalpages()
      commit: c6af91e48594191f62ad3c1fcc8269b1eb539ef8
[8/8] mm/hugetlb: remove unnecessary empty range check in hugetlb_bootmem_set_nodes()
      commit: 2db44dc8bdd3cfc933a3193724f4d38b03e35b80

tree: https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock
branch: range-checks

--
Sincerely yours,
Mike.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
