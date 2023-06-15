Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A30EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 15:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qwfAyuJNJnuC6N3+gnU/Y7D6HMqHZlKLejIicKfF9hs=; b=b5qXSsbNG6By1z
	A3b8qQloay17KYUqGd+2Uh459eyZpUthUYT1Yg4BLnob9Axv/rPOeapif2HerFLgitNmJeALujJg7
	Aa8V1UA53B4LWRP13R/jYDa6P7iL2u+C4XKIK1gAM9s6tII0IoE8szwlICMrE17+K6rdGzcf8zciA
	HEqAE+JjBOd3WC6QpIu2zPhnBqMNdizmC2Fwe0AsGJFDlSQGcj+BtA3JJzyzrnFf2PlOB0MleQRNH
	7IxW7prLZlytTu3tj24kHkTPY6/O8Y3VOBW6A3YVETlQ9gJ96md9TDnRwQx9zjaw4Q9gDIt3elp5Z
	bTK81vEPq/U4IPIafF1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9pFc-00FLHf-2H;
	Thu, 15 Jun 2023 15:51:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9pFY-00FLGD-2B;
	Thu, 15 Jun 2023 15:51:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3543D615C3;
	Thu, 15 Jun 2023 15:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A065C433C0;
	Thu, 15 Jun 2023 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686844263;
	bh=4vpbcLIWH8N9kUhfy14gCg44JnNZ7tmcDbTQofjr2PY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HtfzZGG4h7OB0EE/lQpmPVeug5hEItWTKVdQh4sHq5pkRyi+IBc4bQYhPGfLUyXAE
	 O6q85QbbLOckkkq+ZDCntMP7kzjRH0BvUgQTZTsRtxOQVhMz+kPywYdC329KKPHRCd
	 EzHAMzGxIY08qUxBzBs5hhcSI+TdpRxjxhxRYluzPI7qsWgQhBwbTOga8HmP1oqokR
	 Nfn1KKfQ7SfISyWUrNFe+l7vvHqttosQ0oHQWcCUmbPCzjqzV6ZQmJ6Lgxc8I7me24
	 3i0BNy8Yi/K34Ad5bteBhAQILk/jkgdXefVdp3M52mTzK8Ji4AXkYMW3KmuCjB1GQn
	 39zP25YPwdB6Q==
Date: Thu, 15 Jun 2023 08:50:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Hugh Dickins <hughd@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 07/23] mips: update_mmu_cache() can replace
 __update_tlb()
Message-ID: <20230615155059.GB3665766@dev-arch.thelio-3990X>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
 <178970b0-1539-8aac-76fd-972c6c46ec17@google.com>
 <20230614231758.GA1503611@dev-arch.thelio-3990X>
 <f5526f17-9d78-f7ea-427a-7e76bfeb6b8@google.com>
 <344a4da-3890-45fd-607e-b5f85ca6ad48@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <344a4da-3890-45fd-607e-b5f85ca6ad48@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_085104_794871_6A24A587 
X-CRM114-Status: GOOD (  52.75  )
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

On Wed, Jun 14, 2023 at 10:43:30PM -0700, Hugh Dickins wrote:
> On Wed, 14 Jun 2023, Hugh Dickins wrote:
> > On Wed, 14 Jun 2023, Nathan Chancellor wrote:
> > > 
> > > I just bisected a crash while powering down a MIPS machine in QEMU to
> > > this change as commit 8044511d3893 ("mips: update_mmu_cache() can
> > > replace __update_tlb()") in linux-next.
> > 
> > Thank you, Nathan, that's very helpful indeed.  This patch certainly knew
> > that it wanted testing, and I'm glad to hear that it is now seeing some.
> > 
> > While powering down?  The messages below look like it was just coming up,
> > but no doubt that's because you were bisecting (or because I'm unfamiliar
> > with what messages to expect there).  It's probably irrelevant information,
> > but I wonder whether the (V)machine worked well enough for a while before
> > you first powered down and spotted the problem, or whether it's never got
> > much further than trying to run init (busybox)?  I'm trying to get a feel
> > for whether the problem occurs under common or uncommon conditions.

Ugh sorry, I have been looking into too many bugs lately and got my
wires crossed :) this is indeed a problem when running init (which is
busybox, this is a simple Buildroot file system).

> > > Unfortunately, I can still
> > > reproduce it with the existing fix you have for this change on the
> > > mailing list, which is present in next-20230614.
> > 
> > Right, that later fix was only for a build warning, nothing functional
> > (or at least I hoped that it wasn't making any functional difference).
> > 
> > Thanks a lot for the detailed instructions below: unfortunately, those
> > would draw me into a realm of testing I've never needed to enter before,
> > so a lot of time spent on setup and learning.  Usually, I just stare at
> > the source.
> > 
> > What this probably says is that I should revert most my cleanup there,
> > and keep as close to the existing code as possible.  But some change is
> > needed, and I may need to understand (or have a good guess at) what was
> > going wrong, to decide what kind of retreat will be successful.
> > 
> > Back to the source for a while: I hope I'll find examples in nearby MIPS
> > kernel source (and git history), which will hint at the right way forward.
> > Then send you a patch against next-20230614 to try, when I'm reasonably
> > confident that it's enough to satisfy my purpose, but likely not to waste
> > your time.
> 
> I'm going to take advantage of your good nature by attaching
> two alternative patches, either to go on top of next-20230614.
> 
> mips1.patch,
>  arch/mips/mm/tlb-r4k.c |   12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> is by far my favourite.  I couldn't see anything wrong with what's
> already there for mips, but it seems possible that (though I didn't
> find it) somewhere calls update_mmu_cache_pmd() on a page table.  So
> mips1.patch restores the pmd_huge() check, and cleans up further by
> removing the silly pgdp, p4dp, pudp, pmdp stuff: the pointer has now
> been passed in by the caller, why walk the tree again?  I should have
> done it this way before.
> 
> But if that doesn't work, then I'm afraid it will have to be
> mips2.patch,
>  arch/mips/include/asm/pgtable.h |   15 ++++++++++++---
>  arch/mips/mm/tlb-r3k.c          |    5 ++---
>  arch/mips/mm/tlb-r4k.c          |   27 ++++++++++++++++++---------
>  3 files changed, 32 insertions(+), 15 deletions(-)
> 
> which reverts all of the original patch and its build warning fix,
> and does a pte_unmap() to balance the silly pte_offset_map() there;
> with an apologetic comment for this being about the only place in
> the tree where I have no idea what to do if ptep were NULL.
> 
> I do hope that you find the first fixes the breakage; but if not, then

I hate to be the bearer of bad news but the first patch did not fix the
breakage, I see the same issue.

> I even more fervently hope that the second will, despite my hating it.
> Touch wood for the first, fingers crossed for the second, thanks,

Thankfully, the second one does. Thanks for the quick and thoughtful
responses!

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
