Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C134FC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Feb 2022 23:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3XP52v12nQ4UlD1nPpgwCscCadhZhPLEcMbEwAUF+4o=; b=l8MOaAP38nXdViiD3j4byZB/ii
	zKpN0FZbiiv2nzOHyglMJhwhL5K2d1V6mUA/HSStZGX5RmKec15a/FZ4cc1Vrflxvsow+k2cG/PAg
	Ytzu8iBshk9TNpwroxYPjIuICWAkMiYvpfjsYD6xE35rHlxWjpABWjhpAv/paL1rf+h/flryHq2OR
	qIjI+Cumq8riv6uKIcKVKT781Ns86xzbcpMF0JOQM3WJFsEYcuKRvmjApzbQu4Mb/pwGzp0+H+sG4
	MsMK8eByYx4x4T8TSH412NPcYrr7soPCDilNInwssKw5ryw5uONNQEmh4xRRPs0iMrEQBZwZI3Aqw
	mT3993fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJ1Sv-00AeyC-2E; Sat, 12 Feb 2022 23:06:05 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJ1Sr-00Aexs-Sb
 for linux-riscv@lists.infradead.org; Sat, 12 Feb 2022 23:06:03 +0000
Subject: Re: [PATCH RFC v0] random: block in /dev/urandom
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Biggers <ebiggers@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>, Kees Cook <keescook@chromium.org>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Theodore Ts'o <tytso@mit.edu>
References: <20220211210757.612595-1-Jason@zx2c4.com>
From: Joshua Kinard <kumba@gentoo.org>
Message-ID: <fcab986b-d0bd-c798-de17-266abcdc7da2@gentoo.org>
Date: Sat, 12 Feb 2022 18:05:54 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20220211210757.612595-1-Jason@zx2c4.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_150602_038390_969EC47A 
X-CRM114-Status: GOOD (  36.66  )
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

On 2/11/2022 16:07, Jason A. Donenfeld wrote:
> This is very much an RFC patch, or maybe even an RFG -- request for
> grumbles. This topic has come up a million times, and usually doesn't go
> anywhere. This time I thought I'd bring it up with a slightly narrower
> focus. Before you read further, realize that I do not intend to merge
> this without there being an appropriate amount of consensus for it and
> discussion about it.
> 
> Ever since Linus' 50ee7529ec45 ("random: try to actively add entropy
> rather than passively wait for it"), the RNG does a haveged-style jitter
> dance around the scheduler, in order to produce entropy (and credit it)
> for the case when we're stuck in wait_for_random_bytes(). How ever you
> feel about the Linus Jitter Dance is beside the point: it's been there
> for three years and usually gets the RNG initialized in a second or so.
> 
> As a matter of fact, this is what happens currently when people use
> getrandom(2).
> 
> So, given that the kernel has grown this mechanism for seeding itself
> from nothing, and that this procedure happens pretty fast, maybe there's
> no point any longer in having /dev/urandom give insecure bytes. In the
> past we didn't want the boot process to deadlock, which was
> understandable. But now, in the worst case, a second goes by, and the
> problem is resolved. It seems like maybe we're finally at a point when
> we can get rid of the infamous "urandom read hole".
> 
> Maybe. And this is why this is a request for grumbles patch: the Linus
> Jitter Dance relies on random_get_entropy() returning a cycle counter
> value. The first lines of try_to_generate_entropy() are:
> 
> 	stack.now = random_get_entropy();
> 	/* Slow counter - or none. Don't even bother */
> 	if (stack.now == random_get_entropy())
> 		return;
> 
> So it would appear that what seemed initially like a panacea does not in
> fact work everywhere. Where doesn't it work?
> 
> On every platform, random_get_entropy() is connected to get_cycles(),
> except for three: m68k, MIPS, and RISC-V.
> 

[snip]

> On MIPS, it looks like this:
> 
>         if (can_use_mips_counter(prid))
>                 return read_c0_count();
>         else if (likely(imp != PRID_IMP_R6000 && imp != PRID_IMP_R6000A))
>                 return read_c0_random();
>         else
>                 return 0;
> 
> So it seems like we're okay except for R6000 and R6000A.

The R6000/R6000A CPU only ever existed in systems in the late 1980's that
were fairly large, and I don't think there is a complete, working unit out
there that can actually boot up, let alone boot a Linux kernel.  This check
was probably added as a mental exercise following a processor manual or such.

The old linux-mips wiki even says this:
https://www.linux-mips.org/wiki/R6000

"""
The R6000 is an ECL implementation of the MIPS architecture which was
produced by Bipolar Integrated Technology. The R6000 miroprocessor did
introduce the MIPS II instruction set. Its TLB and cache architecture are
different from all other members of the MIPS family. The R6000 did not
deliver the promised performance benefits, and although it saw some use in
Control Data machines, it quickly disappeared from the mainstream market.
"""

A a quick grep of a recent kernel tree shows this one conditional as the
only user, plus the two defines:

# grep -r "PRID_IMP_R6000" *
arch/mips/include/asm/cpu.h:70:#define PRID_IMP_R6000           0x0300
    /* Same as R3000A  */
arch/mips/include/asm/cpu.h:72:#define PRID_IMP_R6000A          0x0600
arch/mips/include/asm/timex.h:94:       else if (likely(imp !=
PRID_IMP_R6000 && imp != PRID_IMP_R6000A))

I'd say it's better to remove the check and simplify the conditional to
eliminate this corner case.  Maybe keep the #defines around for
documentation, but even that may not be necessary for CPUs that likely don't
exist anymore.


> 
> I think what this adds up to is that this change would positively affect
> everybody, except for _possibly_ negatively affecting poorly configured
> non-Amiga m68k systems and the MIPS R6000 and R6000A. Does that analysis
> seem correct to folks reading, or did I miss something?
> 
> Are there other cases where the cycle counter does exist but is simply
> too slow? Perhaps some computer historians can chime in here.
> 
> If my general analysis is correct, are these ancient platforms really
> worth holding this back? I halfway expect to receive a few thrown
> tomatoes, an angry fist, and a "get off my lawn!", and if that's _all_ I
> hear, I'll take a hint and we can forget I ever proposed this. As
> mentioned, I do not intend to merge this unless there's broad consensus
> about it. But on the off chance that people feel differently, perhaps
> the Linus Jitter Dance is finally the solution to years of /dev/urandom
> kvetching.


-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
