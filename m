Return-Path: <SRS0=F/sc=EY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8DEC56202
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 06:57:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 196F024654
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 06:57:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cJBjVjoN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="U45SNSKJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 196F024654
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o/Oqr7NiN8/5fEvvpB/4DIecgMcn80Q5KiPgSYVkyqQ=; b=cJBjVjoNIh7dBn8xzL869kEwN
	X4tarHhFf05I/jHLVo6llGio2RUIEdhoNwsK4I+x3G5ZBMwKT+rEavosiSolTE9j05ZPHMI7Y+sQA
	P5qF3mh7f1S7L6eBoMH+TGdKqzoAQm8NsBrhuJIr3QwQYdEG+e6saNfyR63CsE1OjEfIOnJjL3G8Q
	XwhUZcDj3nqB19oWjU1P0i8ut9Rd6XolnGlznUST4YH1RzkSzZ2MllnFF14i3j3g6VZDA111wnft6
	puxq8UCP+mSafcFmun2Wdj4AHzpitNJzy664P1Z7ygiqEXsRqf2ZzunYd9G6EyP6kyaD1lsiuB+d1
	n/N97V70Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfHPD-0004LL-OW; Wed, 18 Nov 2020 06:57:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfHP8-0004J9-EO; Wed, 18 Nov 2020 06:57:23 +0000
Received: from kernel.org (unknown [77.125.7.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5BB624654;
 Wed, 18 Nov 2020 06:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605682641;
 bh=p9re6A1RRg6oU6SsuX3QRE0t8ggbYYLXloFK2ojmgAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U45SNSKJGotiPIakEwaAseiV27AsVkyTNt66bCAHLcpiM1G9GhxPaQQlROUaXdH9c
 rZ2SGl1DirjI0HjrC5eRlRQ7rEdibP7yq1sGHKXfUjmBvTCB1ZAiMR3V9ZcpXtRamU
 6btiE8gvCG8QTrNMjF7yXVOnKyB3lsNIE30mk1FQ=
Date: Wed, 18 Nov 2020 08:57:06 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v9 8/9] arch, mm: wire up memfd_secret system call were
 relevant
Message-ID: <20201118065706.GL370813@kernel.org>
References: <20201117162932.13649-1-rppt@kernel.org>
 <20201117162932.13649-9-rppt@kernel.org> <X7QFMhQlyBMI1wXE@trantor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X7QFMhQlyBMI1wXE@trantor>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_015722_691049_4594D488 
X-CRM114-Status: GOOD (  24.28  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 17, 2020 at 05:15:30PM +0000, Catalin Marinas wrote:
> On Tue, Nov 17, 2020 at 06:29:31PM +0200, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > Wire up memfd_secret system call on architectures that define
> > ARCH_HAS_SET_DIRECT_MAP, namely arm64, risc-v and x86.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  arch/arm64/include/asm/unistd.h        | 2 +-
> >  arch/arm64/include/asm/unistd32.h      | 2 ++
> >  arch/arm64/include/uapi/asm/unistd.h   | 1 +
> >  arch/riscv/include/asm/unistd.h        | 1 +
> >  arch/x86/entry/syscalls/syscall_32.tbl | 1 +
> >  arch/x86/entry/syscalls/syscall_64.tbl | 1 +
> >  include/linux/syscalls.h               | 1 +
> >  include/uapi/asm-generic/unistd.h      | 6 +++++-
> >  scripts/checksyscalls.sh               | 4 ++++
> >  9 files changed, 17 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/unistd.h b/arch/arm64/include/asm/unistd.h
> > index 86a9d7b3eabe..949788f5ba40 100644
> > --- a/arch/arm64/include/asm/unistd.h
> > +++ b/arch/arm64/include/asm/unistd.h
> > @@ -38,7 +38,7 @@
> >  #define __ARM_NR_compat_set_tls		(__ARM_NR_COMPAT_BASE + 5)
> >  #define __ARM_NR_COMPAT_END		(__ARM_NR_COMPAT_BASE + 0x800)
> >  
> > -#define __NR_compat_syscalls		442
> > +#define __NR_compat_syscalls		443
> >  #endif
> >  
> >  #define __ARCH_WANT_SYS_CLONE
> > diff --git a/arch/arm64/include/asm/unistd32.h b/arch/arm64/include/asm/unistd32.h
> > index 6c1dcca067e0..5279481ec95b 100644
> > --- a/arch/arm64/include/asm/unistd32.h
> > +++ b/arch/arm64/include/asm/unistd32.h
> > @@ -891,6 +891,8 @@ __SYSCALL(__NR_faccessat2, sys_faccessat2)
> >  __SYSCALL(__NR_process_madvise, sys_process_madvise)
> >  #define __NR_watch_mount 441
> >  __SYSCALL(__NR_watch_mount, sys_watch_mount)
> > +/* 442 is memfd_secret, it is not implemented for 32-bit */
> > +__SYSCALL(442, sys_ni_syscall)
> 
> It now behaves correctly for compat but I don't think we need to
> increment __NR_compat_syscalls. The compat syscall handler already calls
> sys_ni_syscall() if out of range.

Ok, let's drop this change as well :)

> So the only arm64 change needed is defining __ARCH_WANT_MEMFD_SECRET
> (well, we don't have a use for it yet ;)).
> 
> -- 
> Catalin

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
