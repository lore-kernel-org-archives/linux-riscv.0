Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B435C3271E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 15:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=XIIfrcoBL6g/Lg9tJ2o0lYQXHpSplm5xYPdKn7I7DBg=; b=flQk2v+evkeYfQ
	KccSAGjzjjrmsPsPTCUBC0Ng0Fyau3Dog3CAXfu8VY+fYDdkhknBKUwWCW9F+YNKBIGJVbpjPv5EO
	gktbOaZnngh7rVO6comNN84H3ju2r71SDwlQUvbqd9cv8WHIy7HP9oCn9PpoY7wHaT8b9jCDg7Ams
	0O5piIQ8hHf3TvpNJpFInK2k+YpmIjpm0LZepMQlZSv6Nr+3PRUe5L+Ub60ytY7hg2fIhtSBKvBDA
	FiV1//UjMMoWllHt8vRd5FhZOihPEWiEaXI3LTfu/hxyBx+6JzE+69gFR6ovivESx6f83bnUad22V
	dVHikQunQKZad4F/lsxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQqB1-00000004CCg-0TQo;
	Mon, 08 Jul 2024 15:21:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQqAx-00000004CBz-2T0U
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 15:21:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F2101042;
	Mon,  8 Jul 2024 08:21:33 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 170663F641;
	Mon,  8 Jul 2024 08:21:05 -0700 (PDT)
Date: Mon, 8 Jul 2024 16:21:00 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] riscv: uaccess: optimizations
Message-ID: <ZowD3LQT_KTz2g4X@J2N7QTR9R3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wgRgDy8_=uZPZr4LRyF7BiN1nDNzUx7iRzrD0g8O+bh3A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_082111_753726_A7AC6FBE 
X-CRM114-Status: GOOD (  34.05  )
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

On Fri, Jul 05, 2024 at 10:58:29AM -0700, Linus Torvalds wrote:
> On Fri, 5 Jul 2024 at 04:25, Will Deacon <will@kernel.org> wrote:
> >
> > we'd probably want to use an address that lives between the two TTBRs
> > (i.e. in the "guard region" you mentioned above), just in case somebody
> > has fscked around with /proc/sys/vm/mmap_min_addr.
> 
> Yes, I don't want to use a NULL pointer and rely on mmap_min_addr.
> 
> For x86-64, we have two "guard regions" that can be used to generate
> an address that is guaranteed to fault:
> 
>  - the kernel always lives in the "top bit set" part of the address
> space (and any address tagging bits don't touch that part), and does
> not map the highest virtual address because that's used for error
> pointers, so the "all bits set" address always faults

The same should be true on arm64, though I'm not immediately sure if we
explicitly reserve that VA region -- if we don't, then we should.

>  - the region between valid user addresses and kernel addresses is
> also always going to fault, and we don't have them adjacent to each
> other (unlike, for example, 32-bit i386, where the kernel address
> space is directly adjacent to the top of user addresses)

Today we have a gap between the TTBR0 and TTBR1 VA ranges in all
configurations, but in future (with the new FEAT_D128 page table format)
we will have configurations where there's no gap between the two ranges.

> So on x86-64, the simple solution is to just say "we know if the top
> bit is clear, it cannot ever touch kernel code, and if the top bit is
> set we have to make the address fault". So just duplicating the top
> bit (with an arithmetic shift) and or'ing it with the low bits, we get
> exactly what we want.
> 
> But my knowledge of arm64 is weak enough that while I am reading
> assembly language and I know that instead of the top bit, it's bit55,
> I don't know what the actual rules for the translation table registers
> are.
> 
> If the all-bits-set address is guaranteed to always trap, then arm64
> could just use the same thing x86 does (just duplicating bit 55
> instead of the sign bit)?

I think something of that shape can work (see below). There are a couple
of things that make using all-ones unsafe:

1) Non-faulting parts of a misaligned load/store can occur *before* the
   fault is raised. If you have two pages where one of which is writable
   and the other of which is not writeable (in either order), a store
   which straddles those pages can write to the writeable page before
   raising a fault on the non-writeable page.

   I've seen this behaviour on real HW, and IIUC this is fairly common.

2) Loads/stores which wrap past 0xFFFF_FFFF_FFFF_FFFF access bytes at
   UNKNOWN addresses. An N-byte store at 0xFFFF_FFFF_FFFF_FFFF may write
   to N-1 bytes at an arbitrary address which is not
   0x0000_0000_0000_0000.

   In the latest ARM ARM (K.a), this is described tersely in section
   K1.2.9 "Out of range virtual address".

   That can be found at:

   https://developer.arm.com/documentation/ddi0487/ka/?lang=en

   I'm aware of implementation styles where that address is not zero and
   can be a TTBR1 (kernel) address.

Given that, we'd need to avoid all-ones, but provided we know that the
first access using the pointer will be limited to PAGE_SIZE bytes past
the pointer, we could round down the bad pointer to be somewhere within
the error pointer page, e.g.

	SBFX <mask>, <ptr>, #55, #1
	ORR  <ptr>, <ptr>, <mask>
	BIC <ptr>, <ptr>, <mask>, lsr #(64 - PAGE_SHIFT)

That last `BIC` instructions is "BIt Clear" AKA "AND NOT". When bit 55
is one that will clear the lower bits to round down to a page boundary,
and when bit 55 is zero it will have no effect (as it'll be an AND with
all-ones).

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
