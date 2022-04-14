Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E7CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 01:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tr7D/CClpLROxzWWm/RKSiXcn4uyTg8QnFD2oeLrrSU=; b=nMU+uKDMHGRlbB
	e8IT9z4PHwvMQ7o7NV5z5JjQ6tLmdcOPpMUiI1EoAHnKEGHGR7JDgJJo2jyfXatQ3szD8Xk0H9jdD
	HbPJq/cclRqm7+PKPeD2gAeppbwYOybNfWWlrsw9S0U7mUPjMI6qbSOkz0NWGqL8f1HAWqtOF8UoF
	J31CL6pjGUN7Rw32/QOVDMC/JxP/lHotqnko/pjh6L6dmXJpprKzIyXCAJEBeARV9cZkytsQMt7Mn
	IxUktit2hE66Zl5o1VRTH4ZenMSXJmgJGNBc9UBlLJV35+/ZmRv3uQX7c2Wja+tbk9bt7rUPq/n7F
	0ffc8AvT+bR9lfkbGPRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neo67-003FhP-D6; Thu, 14 Apr 2022 01:16:35 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neo5v-003Fdg-JW; Thu, 14 Apr 2022 01:16:25 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id D411B92009C; Thu, 14 Apr 2022 03:16:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id C508F92009B;
 Thu, 14 Apr 2022 02:16:18 +0100 (BST)
Date: Thu, 14 Apr 2022 02:16:18 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 LKML <linux-kernel@vger.kernel.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, 
 Theodore Ts'o <tytso@mit.edu>, 
 Dominik Brodowski <linux@dominikbrodowski.net>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "David S . Miller" <davem@davemloft.net>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, 
 Max Filippov <jcmvbkbc@gmail.com>, John Stultz <john.stultz@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, sparclinux@vger.kernel.org, 
 linux-um@lists.infradead.org, X86 ML <x86@kernel.org>, 
 linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v4 04/11] mips: use fallback for random_get_entropy()
 instead of zero
In-Reply-To: <CAHmME9pQ4xdeTUDxAdrOu=S9NRTonYzJVk50fa0Zfz4knZt5WA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2204140014580.9383@angie.orcam.me.uk>
References: <20220413115411.21489-1-Jason@zx2c4.com>
 <20220413115411.21489-5-Jason@zx2c4.com>
 <20220413122546.GA11860@alpha.franken.de>
 <alpine.DEB.2.21.2204131331450.9383@angie.orcam.me.uk>
 <CAHmME9pQ4xdeTUDxAdrOu=S9NRTonYzJVk50fa0Zfz4knZt5WA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_181623_836546_EF5BB388 
X-CRM114-Status: GOOD (  17.95  )
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

Hi Jason,

> However, one thing that I've been thinking about is that the c0 random
> register is actually kind of garbage. In my fuzzy decade-old memory of
> MIPS, I believe the c0 random register starts at the maximum number of
> TLB entries (16?), and then counts down cyclically, decrementing once
> per CPU cycle. Is that right?

 Yes, for the relevant CPUs the range is 63-8 << 8 for R3k machines and 
47-0 (the lower bound can be higher if wired entries are used, which I 
think we occasionally do) for R4k machines with a buggy CP0 counter.  So 
there are either 56 or up to 48 distinct CP0 Random register values.

> If it is, there are some real pros and cons here to consider:
> - Pro: decrementing each CPU cycle means pretty good granularity
> - Con: wrapping at, like, 16 or something really is very limited, to
> the point of being almost bad
> 
> Meanwhile, on systems without the c0 cycles counter, what is the
> actual resolution of random_get_entropy_fallback()? Is this just
> falling back to jiffies?

 It depends on the exact system.  Some have a 32-bit high-resolution 
counter in the chipset (arch/mips/kernel/csrc-ioasic.c) giving like 25MHz 
resolution, some have nothing but jiffies.

> IF (a) the fallback is jiffies AND (b) c0 wraps at 16, then actually,
> what would be really nice would be something like:
> 
>     return (jiffies << 4) | read_c0_random();
> 
> It seems like that would give us something somewhat more ideal than
> the status quo. Still crap, of course, but undoubtedly better.

 It seems like a reasonable idea to me, but the details would have to be 
sorted out, because where a chipset high-resolution counter is available 
we want to factor it in, and otherwise we need to extract the right bits 
from the CP0 Random register, either 13:8 for the R3k or 5:0 for the R4k.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
