Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E0AC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 13:56:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F7356113B
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 13:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F7356113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/W7ncXCAxrPcZTTKA7UDvgnXHdaP3kMgU2S9pKCeuU=; b=E6/noraMF44oJh
	HyFPJPBi4kIo2DCwiWtsBpuXmKIFE+MF2qL6ZQGoztKEmyr5WPJ+Gntk+N08Flte5JgnzTZ73IJl+
	sKmFCWYvPXX5/KjL1A+sHuuPcMqWlzRmfSAStsjBmwRxqBDpkJKFBz6c7JKOCbtn84MnbBJDoeqma
	XMkeE51X3zlrjZXwDN+tvOtD0l1qINwWOPGrSSUwwqc+7Mk+zIMmT2wODSM0YU6xjwM1JFUJYVQma
	FjG8FOW3ArFszbTGPVu8rqygErED9PLTkuFEX9Lr80oMMkvBkVyy3tl9a05sZKHP6+fFxM+HEb/RL
	Qver2yhya29iSZfYINsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ8un-005v0U-3c; Tue, 14 Sep 2021 13:56:01 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ8uO-005uqz-La; Tue, 14 Sep 2021 13:55:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D62A1FB;
 Tue, 14 Sep 2021 06:55:33 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.21.233])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D39B3F5A1;
 Tue, 14 Sep 2021 06:55:29 -0700 (PDT)
Date: Tue, 14 Sep 2021 14:55:27 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, Keith Packard <keithpac@amazon.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>, Kees Cook <keescook@chromium.org>,
 Andy Lutomirski <luto@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
Subject: Re: [RFC PATCH 0/8] Move task_struct::cpu back into thread_info
Message-ID: <20210914135527.GC30247@C02TD0UTHF1T.local>
References: <20210914121036.3975026-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914121036.3975026-1-ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_065536_894014_CEFE76B0 
X-CRM114-Status: GOOD (  26.83  )
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

On Tue, Sep 14, 2021 at 02:10:28PM +0200, Ard Biesheuvel wrote:
> Commit c65eacbe290b ("sched/core: Allow putting thread_info into
> task_struct") mentions that, along with moving thread_info into
> task_struct, the cpu field is moved out of the former into the latter,
> but does not explain why.

From what I recall of talking to Andy around that time, when converting
arm64 over, the theory was that over time we'd move more and more out of
thread_info and into task_struct or thread_struct, until task_struct
supplanted thread_info entirely, and that all became generic.

I think the key gain there was making things more *generic*, and there
are other ways we could do that in future without moving more into
task_struct (e.g. with a geenric thread_info and arch_thread_info inside
that).

With that in mind, and given the diffstat, I think this is worthwhile.

FWIW, for the series:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> While collaborating with Keith on adding THREAD_INFO_IN_TASK support to
> ARM, we noticed that keeping CPU in task_struct is problematic for
> architectures that define raw_smp_processor_id() in terms of this field,
> as it requires linux/sched.h to be included, which causes a lot of pain
> in terms of circular dependencies (or 'header soup', as the original
> commit refers to it).
> 
> For examples of how existing architectures work around this, please
> refer to patches #6 or #7. In the former case, it uses an awful
> asm-offsets hack to index thread_info/current without using its type
> definition. The latter approach simply keeps a copy of the task_struct
> CPU field in thread_info, and keeps it in sync at context switch time.
> 
> Patch #8 reverts this latter approach for ARM, but this code is still
> under review so it does not currently apply to mainline.
> 
> We also discussed introducing yet another Kconfig symbol to indicate
> that the arch has THREAD_INFO_IN_TASK enabled but still prefers to keep
> its CPU field in thread_info, but simply keeping it in thread_info in
> all cases seems to be the cleanest approach here.
> 
> Cc: Keith Packard <keithpac@amazon.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> 
> Ard Biesheuvel (8):
>   arm64: add CPU field to struct thread_info
>   x86: add CPU field to struct thread_info
>   s390: add CPU field to struct thread_info
>   powerpc: add CPU field to struct thread_info
>   sched: move CPU field back into thread_info if THREAD_INFO_IN_TASK=y
>   powerpc: smp: remove hack to obtain offset of task_struct::cpu
>   riscv: rely on core code to keep thread_info::cpu updated
>   ARM: rely on core code to keep thread_info::cpu updated
> 
>  arch/arm/include/asm/switch_to.h       | 14 --------------
>  arch/arm/kernel/smp.c                  |  3 ---
>  arch/arm64/include/asm/thread_info.h   |  1 +
>  arch/arm64/kernel/asm-offsets.c        |  2 +-
>  arch/arm64/kernel/head.S               |  2 +-
>  arch/powerpc/Makefile                  | 11 -----------
>  arch/powerpc/include/asm/smp.h         | 17 +----------------
>  arch/powerpc/include/asm/thread_info.h |  3 +++
>  arch/powerpc/kernel/asm-offsets.c      |  4 +---
>  arch/powerpc/kernel/smp.c              |  2 +-
>  arch/riscv/kernel/asm-offsets.c        |  1 -
>  arch/riscv/kernel/entry.S              |  5 -----
>  arch/riscv/kernel/head.S               |  1 -
>  arch/s390/include/asm/thread_info.h    |  1 +
>  arch/x86/include/asm/thread_info.h     |  3 +++
>  include/linux/sched.h                  |  6 +-----
>  kernel/sched/sched.h                   |  4 ----
>  17 files changed, 14 insertions(+), 66 deletions(-)
> 
> -- 
> 2.30.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
