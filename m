Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3C0C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Feb 2022 23:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=akfFMHyrKR45TL4JBDR9Ns6Jww/gGhDHwnyofZICJpE=; b=2yRKMSY/1+Vy5H
	0aB7htCVm5KXgZ7R5CYz5jyYFkJtUGhvQG5CvehniYvVS4rHLNFN6pzKrJvIRvzYLyOlbZjBoV8Lp
	q+qzKYK7Fa1I08ORzs6oLjUgzUMJk9oammA861hS6XuzsqsecBtZ7XWfrHC60uuVEiQMmEQeA2hc9
	ZPadKDoNpSXNJKSyX6Wyveeh90DKAh3YwiopX5F0UTt6YpaZ77Dcxtil0JDinCmAnnHFWpv63g6+9
	GbrdQjAybSnFODPujNGAm79Axxv9HfISynBCGlkgTpcx1Jk5sG8vBib2xvuXQUlyQJnuZhJY9cc79
	9oGJXHE/u0e31dJdsdhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJ1aH-00AfNY-KL; Sat, 12 Feb 2022 23:13:41 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJ1aE-00AfMk-HJ
 for linux-riscv@lists.infradead.org; Sat, 12 Feb 2022 23:13:40 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 5036892009C; Sun, 13 Feb 2022 00:13:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 4182F92009B;
 Sat, 12 Feb 2022 23:13:33 +0000 (GMT)
Date: Sat, 12 Feb 2022 23:13:33 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Joshua Kinard <kumba@gentoo.org>
cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, 
 linux-m68k@lists.linux-m68k.org, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-mips@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, 
 Eric Biggers <ebiggers@google.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Andy Lutomirski <luto@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Lennart Poettering <mzxreary@0pointer.de>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Theodore Ts'o <tytso@mit.edu>, Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH RFC v0] random: block in /dev/urandom
In-Reply-To: <fcab986b-d0bd-c798-de17-266abcdc7da2@gentoo.org>
Message-ID: <alpine.DEB.2.21.2202122309560.34636@angie.orcam.me.uk>
References: <20220211210757.612595-1-Jason@zx2c4.com>
 <fcab986b-d0bd-c798-de17-266abcdc7da2@gentoo.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_151338_785690_95E9A389 
X-CRM114-Status: GOOD (  11.47  )
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

On Sat, 12 Feb 2022, Joshua Kinard wrote:

> # grep -r "PRID_IMP_R6000" *
> arch/mips/include/asm/cpu.h:70:#define PRID_IMP_R6000           0x0300
>     /* Same as R3000A  */
> arch/mips/include/asm/cpu.h:72:#define PRID_IMP_R6000A          0x0600
> arch/mips/include/asm/timex.h:94:       else if (likely(imp !=
> PRID_IMP_R6000 && imp != PRID_IMP_R6000A))
> 
> I'd say it's better to remove the check and simplify the conditional to
> eliminate this corner case.  Maybe keep the #defines around for
> documentation, but even that may not be necessary for CPUs that likely don't
> exist anymore.

 IIRC Ralf used to have a working R6k machine, but I have no idea what has 
happened to it.  No port of Linux has been made for that system though, 
that's for sure.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
