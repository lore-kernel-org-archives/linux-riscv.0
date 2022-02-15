Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EE4C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wnLfep+01Ra450gW40Wa2VAntEFu84hSZeItMknGxJA=; b=Thikeg6C+vHoYf
	bX0AQzmFf3ZCXMEQyIeWP7vfKMNSPTXqmxLX+wjHNdPuv81VTI4N4ejdcv04LqQATzkBOR1q7Cfvm
	iuqMldxPJ3oP6YTCQ7vwDjDVYADoULMVdAayaCoj0l+gr3JoZj0AV+MaRduPwhSB1rZwMo/rSM/jl
	x4PWccW3VgLG39LITWfVv2CVRMDFZmUmSAbluxdcSdolC3D9XrvzYxpYmLqStOq/76xisFRaEcyfh
	HFvD+h/C1q2eSMlETz4zq2YgtrDfBtkBg/yqGh+YKGAv91i6W7pwCuQkl6Wt5UTAunEY7FVR07kTk
	4Y3X1qzrOZqHjrTbSG2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJvEv-002KwT-QO; Tue, 15 Feb 2022 10:39:21 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJvEs-002KuD-FT; Tue, 15 Feb 2022 10:39:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31E1E13D5;
 Tue, 15 Feb 2022 02:39:17 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.89.144])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B7AE3F66F;
 Tue, 15 Feb 2022 02:39:10 -0800 (PST)
Date: Tue, 15 Feb 2022 10:39:06 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Heiko Carstens <hca@linux.ibm.com>,
 Rich Felker <dalias@libc.org>, "David S. Miller" <davem@davemloft.net>,
 Richard Weinberger <richard@nod.at>, X86 ML <x86@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 alpha <linux-alpha@vger.kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-csky@vger.kernel.org,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-ia64@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 08/14] arm64: simplify access_ok()
Message-ID: <YguCysZGYYWUhAPk@FVFF77S0Q05N>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-9-arnd@kernel.org>
 <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
 <CAK8P3a2VfvDkueaJNTA9SiB+PFsi_Q17AX+aL46ueooW2ahmQw@mail.gmail.com>
 <CAMj1kXGkG0KMD2rnKAJc3V7X9LP1grbcHTNYMnj_q4GiYfG2pQ@mail.gmail.com>
 <CAK8P3a0NTqK_m7q909d8FN6is8k4_u3zeckC9XOrjEi7kqSvmg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0NTqK_m7q909d8FN6is8k4_u3zeckC9XOrjEi7kqSvmg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_023918_616150_FD4E6A7D 
X-CRM114-Status: GOOD (  16.92  )
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

On Tue, Feb 15, 2022 at 10:39:46AM +0100, Arnd Bergmann wrote:
> On Tue, Feb 15, 2022 at 10:21 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > On Tue, 15 Feb 2022 at 10:13, Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > arm64 also has this leading up to the range check, and I think we'd no
> > longer need it:
> >
> >     if (IS_ENABLED(CONFIG_ARM64_TAGGED_ADDR_ABI) &&
> >         (current->flags & PF_KTHREAD || test_thread_flag(TIF_TAGGED_ADDR)))
> >             addr = untagged_addr(addr);
> 
> I suspect the expensive part here is checking the two flags, as untagged_addr()
> seems to always just add a sbfx instruction. Would this work?
> 
> #ifdef CONFIG_ARM64_TAGGED_ADDR_ABI
> #define access_ok(ptr, size) __access_ok(untagged_addr(ptr), (size))
> #else // the else path is the default, this can be left out.
> #define access_ok(ptr, size) __access_ok((ptr), (size))
> #endif

This would be an ABI change, e.g. for tasks without TIF_TAGGED_ADDR.

I don't think we should change this as part of this series.

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
