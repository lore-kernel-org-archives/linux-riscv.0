Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68DAC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jun 2022 09:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idh6q3iBeEwwR735F8YvgG/Qbejh4CdIsABQYVRNY18=; b=zVpl9NHc7Rldjy
	+TX40dqumehitm5ns4C1S6Qhg5gan4gyGbIBND+WQ5vSI2edEjzS/gU/TCKYWYsxBNnrJOXG6xPAi
	9zUO3cPnNySxu9wxSzdrbPFdfsjfs5y11j73CynScgbNOMFMaAzoh/5IV3hLrhAYiL/iv6RXb97rd
	GDEx5qQJZ4+ZxBdicbfYNqzObZtY6vgsLrrNNdwEa7+NhljO5uCzUfXpo0UlZXn2jaVH9W4F5ARLe
	CLZBd9gHUH/N6e6V3itjwdUN03OFy0+vUn5PW9MAP7PT/fI4dEWGM/j/61sTkRubA7rocE2iK16I0
	uiWrlqVujFX/uSgCLKWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzxrG-00CMM8-RZ; Sat, 11 Jun 2022 09:56:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzxr4-00CMHz-DF; Sat, 11 Jun 2022 09:56:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 41DF8B80E9A;
	Sat, 11 Jun 2022 09:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF641C3411E;
	Sat, 11 Jun 2022 09:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654941386;
	bh=G3SijAZJFwW8PPbomjAxbmJ1C1Qf1Qf77wWOoRRw+dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=je5xCyBasUps0lw+zm8BT+55x7BMo8QBuhxo7JbtlactdaXmHz6lygNzLVrkm8nAX
	 HjEppJFc+QzCFrtWjpMbQ5TNT070wVV+inQya2B9+gtBdLCpCi5lhYrB8oioVSA00t
	 hIu1Oa3GrD0WLeAPrt7UP5jlkYHkU2fo87dm0Y2tsE2pbKenH7urJXTDUAgrXYtoWI
	 sACEfm3Hy0H/485yd2z03sytvQHGo5HqeAr0OHZgDGtUHNS7u3v0z9DoUqRmcgnTGS
	 yJ2Edt+EBxtqLD6Zk4/TW4K+j7AB4xUoNv3rGt0AT9EmLHGsWZAuNEVqCOGQlFxuD6
	 6hRDH3YDodvdQ==
Date: Sat, 11 Jun 2022 12:56:12 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Wupeng Ma <mawupeng1@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Darren Hart <dvhart@infradead.org>,
	Andy Shevchenko <andy@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Kees Cook <keescook@chromium.org>, songmuchun@bytedance.com,
	Randy Dunlap <rdunlap@infradead.org>,
	damien.lemoal@opensource.wdc.com,
	Stephen Boyd <swboyd@chromium.org>, Wei Liu <wei.liu@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	David Hildenbrand <david@redhat.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Zhen Lei <thunder.leizhen@huawei.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>, gpiccoli@igalia.com,
	Huacai Chen <chenhuacai@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>, chenzhou10@huawei.com,
	vijayb@linux.microsoft.com,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/6] introduce mirrored memory support for arm64
Message-ID: <YqRmvJDiy2UQkEDu@kernel.org>
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <CAMj1kXH5r=CUoLCndBUsZ04_0UCJ2VqgJDdp2wbdNCtEx0Yxag@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXH5r=CUoLCndBUsZ04_0UCJ2VqgJDdp2wbdNCtEx0Yxag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_025630_768846_CC248DFE 
X-CRM114-Status: GOOD (  37.37  )
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

On Fri, Jun 10, 2022 at 01:23:34PM +0200, Ard Biesheuvel wrote:
> On Tue, 7 Jun 2022 at 11:16, Wupeng Ma <mawupeng1@huawei.com> wrote:
> >
> > From: Ma Wupeng <mawupeng1@huawei.com>
> >
> > Commit b05b9f5f9dcf ("x86, mirror: x86 enabling - find mirrored memory ranges")
> > introduced mirrored memory support for x86. This support rely on UEFI to
> > report mirrored memory address ranges.  See UEFI 2.5 spec pages 157-158:
> >
> >   http://www.uefi.org/sites/default/files/resources/UEFI%202_5.pdf
> >
> > Memory mirroring is a technique used to separate memory into two separate
> > channels, usually on a memory device, like a server. In memory mirroring,
> > one channel is copied to another to create redundancy. This method makes
> > input/output (I/O) registers and memory appear with more than one address
> > range because the same physical byte is accessible at more than one
> > address. Using memory mirroring, higher memory reliability and a higher
> > level of memory consolidation are possible.
> >
> > These EFI memory regions have various attributes, and the "mirrored"
> > attribute is one of them. The physical memory region whose descriptors
> > in EFI memory map has EFI_MEMORY_MORE_RELIABLE attribute (bit: 16) are
> > mirrored. The address range mirroring feature of the kernel arranges such
> > mirrored regions into normal zones and other regions into movable zones.
> >
> > Arm64 can support this too. So mirrored memory support is added to support
> > arm64.
> >
> > The main purpose of this patch set is to introduce mirrored support for
> > arm64 and we have already fixed the problems we had which is shown in
> > patch #5 to patch #8 and try to bring total isolation in patch #9 which
> > will disable mirror feature if kernelcore is not specified.
> >
> > In order to test this support in arm64:
> > - patch this patch set
> > - add kernelcore=mirror in kernel parameter
> > - start you kernel
> >
> > Patch #1-#2 introduce mirrored memory support form arm64.
> > Patch #3-#5 fix some bugs for arm64 if memory reliable is enabled.
> > Patch #6 disable mirror feature if kernelcore is not specified.
> >
> > Thanks to Ard Biesheuvel's hard work [1], now kernel will perfer mirrored
> > memory if kaslr is enabled.
> >
> > [1] https://lore.kernel.org/linux-arm-kernel/CAMj1kXEPVEzMgOM4+Yj6PxHA-jFuDOAUdDJSiSxy_XaP4P7LSw@mail.gmail.com/T/
> >
> > Changelog since v2:
> > - remove efi_fake_mem support
> > - remove Commit ("remove some redundant code in ia64 efi_init") since
> >   efi_print_memmap() is not public
> > - add mirror flag back on initrd memory
> >
> > Changelog since v1:
> > - update changelog in cover letter
> > - use PHYS_PFN in patch #7
> >
> > Ma Wupeng (6):
> >   efi: Make efi_find_mirror() public
> >   arm64/mirror: arm64 enabling - find mirrored memory ranges
> >   mm: Ratelimited mirrored memory related warning messages
> >   mm: Demote warning message in vmemmap_verify() to debug level
> >   mm: Add mirror flag back on initrd memory
> >   efi: Disable mirror feature if kernelcore is not specified
> >
> 
> I have tested these changes on QEMU/arm64 with the patch below, and
> things seem to work as expected. We have some minor issues to work out
> but the general shape of this code is good.
> 
> As for the mm/ changes: does anyone mind if I take those through the
> EFI tree as well?

No objections from me.

> I don't think the EFI and -mm changes depend on each other, so they
> can go into -mm separately as well.

--
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
