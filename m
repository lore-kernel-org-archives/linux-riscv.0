Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8A8C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 11:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aUG4B7gxiLEb86RhDe520dALlv3nhOnq5W+3OVj6A7E=; b=vaQGnTcLMyZjzw
	8G54F9DTTW9+oc6J1iT/EY0Tzr1gZopIrg2nHsU1QOWIq1NgnGweQ87NWbT3OqImpMJ1lESPFq/fe
	HvaHsLJbx050dY1PnI3gxpYl12YI5bogvuE113GTVXJ4ucL+wcDK/kkLbwm3EIO3YGUuWBDmxT3p4
	QdLhpz0370opH7MG9NDrLAlg6msK7I1EsKxq1II82KyU8YPQyZrL5Hfz8RVxWajMSok+3LY/JiPWM
	cqQjHR4mnxaz5vsis8yaPQJ8zVK0EW4qK5YA6P5LDs0XNsR6fy1B0Nu9yFmNNBI1nucDVasOagYhj
	UXgVe74+hZkv/T+tdGwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzckP-007swS-M8; Fri, 10 Jun 2022 11:24:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzckC-007srB-1z; Fri, 10 Jun 2022 11:24:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A5FF620ED;
	Fri, 10 Jun 2022 11:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB180C3411E;
	Fri, 10 Jun 2022 11:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654860238;
	bh=HeCAjKOn2KigltHeufUPG6Zo86H7F1OtCV+x3kBERyk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TMWnGNYSc8xYLa6h/7+SvfAxfukNjSnBmdGr1vx1M75fSRRkjk3It0RW6/WLU5if5
	 16UB5WVv7vsf89dGWJyYKHVGlNoOxpSfjzmPYWLNA5tYuV7jDgynOYq39eu6g3nRMR
	 //f+6IrPyJYySE7gP86xQ1Q/tt6iSrtEjCDJRAfQQeeRUWj0xEg81s0YtvAGs6cSO3
	 00QYQBkLSl4XnElHfZwizATFsAEbF64abjgRNRzgHs54NB1+dbXOvWoYD/j58n9tiD
	 iPFbVVvOEOLRnC+vnpgf0T//7wFXEmbnj4ABIBzrYNFfPq4EQh6BfkHafGQrx1p47o
	 kXfHKB8gPE8qQ==
Received: by mail-ua1-f53.google.com with SMTP id z20so2085237ual.3;
        Fri, 10 Jun 2022 04:23:58 -0700 (PDT)
X-Gm-Message-State: AOAM532xbxotT8nUTTNsEVB/aK2QVY1oweXYFmhDvezL+NLBHlHY/W1M
	Uuv1gYs7baz3iK/H0LQR2yy4Np6X7jE1h2upLE4=
X-Google-Smtp-Source: ABdhPJw61qaz84kbcnvqt3Pfi7RCDWoDotPOctj0KisQ84BqKvHZdKcC0MvHMZLpsJONm1ypLPd1ws7GG69fHNK89dQ=
X-Received: by 2002:a05:6830:9c2:b0:606:1e0a:cc8d with SMTP id
 y2-20020a05683009c200b006061e0acc8dmr19098159ott.265.1654860227136; Fri, 10
 Jun 2022 04:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
In-Reply-To: <20220607093805.1354256-1-mawupeng1@huawei.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 10 Jun 2022 13:23:34 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH5r=CUoLCndBUsZ04_0UCJ2VqgJDdp2wbdNCtEx0Yxag@mail.gmail.com>
Message-ID: <CAMj1kXH5r=CUoLCndBUsZ04_0UCJ2VqgJDdp2wbdNCtEx0Yxag@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] introduce mirrored memory support for arm64
To: Wupeng Ma <mawupeng1@huawei.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, 
	Andy Shevchenko <andy@infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Kees Cook <keescook@chromium.org>, songmuchun@bytedance.com, 
	Randy Dunlap <rdunlap@infradead.org>, damien.lemoal@opensource.wdc.com, 
	Stephen Boyd <swboyd@chromium.org>, Wei Liu <wei.liu@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, David Hildenbrand <david@redhat.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, gpiccoli@igalia.com, 
	Huacai Chen <chenhuacai@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, chenzhou10@huawei.com, 
	vijayb@linux.microsoft.com, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-efi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_042400_203046_29288532 
X-CRM114-Status: GOOD (  32.71  )
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

On Tue, 7 Jun 2022 at 11:16, Wupeng Ma <mawupeng1@huawei.com> wrote:
>
> From: Ma Wupeng <mawupeng1@huawei.com>
>
> Commit b05b9f5f9dcf ("x86, mirror: x86 enabling - find mirrored memory ranges")
> introduced mirrored memory support for x86. This support rely on UEFI to
> report mirrored memory address ranges.  See UEFI 2.5 spec pages 157-158:
>
>   http://www.uefi.org/sites/default/files/resources/UEFI%202_5.pdf
>
> Memory mirroring is a technique used to separate memory into two separate
> channels, usually on a memory device, like a server. In memory mirroring,
> one channel is copied to another to create redundancy. This method makes
> input/output (I/O) registers and memory appear with more than one address
> range because the same physical byte is accessible at more than one
> address. Using memory mirroring, higher memory reliability and a higher
> level of memory consolidation are possible.
>
> These EFI memory regions have various attributes, and the "mirrored"
> attribute is one of them. The physical memory region whose descriptors
> in EFI memory map has EFI_MEMORY_MORE_RELIABLE attribute (bit: 16) are
> mirrored. The address range mirroring feature of the kernel arranges such
> mirrored regions into normal zones and other regions into movable zones.
>
> Arm64 can support this too. So mirrored memory support is added to support
> arm64.
>
> The main purpose of this patch set is to introduce mirrored support for
> arm64 and we have already fixed the problems we had which is shown in
> patch #5 to patch #8 and try to bring total isolation in patch #9 which
> will disable mirror feature if kernelcore is not specified.
>
> In order to test this support in arm64:
> - patch this patch set
> - add kernelcore=mirror in kernel parameter
> - start you kernel
>
> Patch #1-#2 introduce mirrored memory support form arm64.
> Patch #3-#5 fix some bugs for arm64 if memory reliable is enabled.
> Patch #6 disable mirror feature if kernelcore is not specified.
>
> Thanks to Ard Biesheuvel's hard work [1], now kernel will perfer mirrored
> memory if kaslr is enabled.
>
> [1] https://lore.kernel.org/linux-arm-kernel/CAMj1kXEPVEzMgOM4+Yj6PxHA-jFuDOAUdDJSiSxy_XaP4P7LSw@mail.gmail.com/T/
>
> Changelog since v2:
> - remove efi_fake_mem support
> - remove Commit ("remove some redundant code in ia64 efi_init") since
>   efi_print_memmap() is not public
> - add mirror flag back on initrd memory
>
> Changelog since v1:
> - update changelog in cover letter
> - use PHYS_PFN in patch #7
>
> Ma Wupeng (6):
>   efi: Make efi_find_mirror() public
>   arm64/mirror: arm64 enabling - find mirrored memory ranges
>   mm: Ratelimited mirrored memory related warning messages
>   mm: Demote warning message in vmemmap_verify() to debug level
>   mm: Add mirror flag back on initrd memory
>   efi: Disable mirror feature if kernelcore is not specified
>

I have tested these changes on QEMU/arm64 with the patch below, and
things seem to work as expected. We have some minor issues to work out
but the general shape of this code is good.

As for the mm/ changes: does anyone mind if I take those through the
EFI tree as well? I don't think the EFI and -mm changes depend on each
other, so they can go into -mm separately as well.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
