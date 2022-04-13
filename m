Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2BFC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 11:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0JHZ1pvBnP4Tqhawr7rD8xlKF7kQ1xmxHYvFzX44chw=; b=5BgSwf7TLsMEAS
	KVc1eS/kY6j8r+MUq5ZKrY4+qW/dUYtqMP/96aGW7LQr8NpI6jxAQ6pOE0SyYeAkSmEpV/gwAE0xa
	/49RIzGM2V+0yWtyNUD+/QS3THrr+rM/Ud+Vyld98glXzA+1L3u92KEC6niQZ+jvMsYxpE5EthUye
	OicsW0c/o9/M9Jx4bnJyJ5dhx5JzyO9mpTX4xN5fzNhw/fuJcQr1LTdCq8DzKyeU13tdWazUGfJGf
	h8k4Pqeb6uOFEofMDkdi04nlG8jDbNXztFJx0lmGgHdwMsAqG2XZZe3RrupP5RzpO6ZGg+Ufau1q0
	2io+aNTsodToz+t2AcdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nebaH-000ouy-PA; Wed, 13 Apr 2022 11:54:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nebZz-000old-LU; Wed, 13 Apr 2022 11:54:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5ED36B82364;
 Wed, 13 Apr 2022 11:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3665C385A3;
 Wed, 13 Apr 2022 11:54:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="I24BDt43"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649850865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Syo5gf48g80rVSQvZPt751gQBfMbjfV+Pcog5nChNyY=;
 b=I24BDt43uFrMKfHLaa3LqTNbmq29rFHJtUSqfd2IBpVMAS8hwKwxp1x+2z289sLn9xIZri
 aRjISg9muRb3oVmWw2YEhAfoZGSLf6ndYbD2gygbm9q9BStKgkYMjpI+WyC1+vCfswcLMU
 YfOZ10ZnCtEU7uXWC0RqOl1kTrVw5XI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 832259f5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 13 Apr 2022 11:54:25 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 tglx@linutronix.de, arnd@arndb.de
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Theodore Ts'o <tytso@mit.edu>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
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
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org
Subject: [PATCH v4 00/11] archs/random: fallback to best raw ktime when no
 cycle counter
Date: Wed, 13 Apr 2022 13:54:00 +0200
Message-Id: <20220413115411.21489-1-Jason@zx2c4.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_045436_010959_AF9E6639 
X-CRM114-Status: GOOD (  24.10  )
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

Hi folks,

The RNG uses a function called random_get_entropy() basically anytime
that it needs to timestamp an event. For example, an interrupt comes in,
and we mix a random_get_entropy() into the entropy pool somehow.
Somebody mashes their keyboard or moves their mouse around? We mix a
random_get_entropy() into the entropy pool. It's one of the main
varieties of input.

Unfortunately, it's always 0 on a few platforms. The RNG has accumulated
various hacks to deal with this, but in general it's not great. Surely
we can do better than 0. In fact, *anything* that's not the same exact
value all the time would be better than 0. Even a counter that
increments once per hour would be better than 0! I think you get the
idea.

On most platforms, random_get_entropy() is aliased to get_cycles(),
which makes sense for platforms where get_cycles() is defined. RDTSC,
for example, has all the characteristics we care about for this
function: it's fast to acquire (i.e. acceptable in an irq handler),
pretty high precision, available, forms a 2-monotone distribution, etc.
But for platforms without that, what is the next best thing?

Sometimes the next best thing is architecture-defined. For example,
really old MIPS has the CP0 random register, which isn't a cycle
counter, but is at least something. However, some platforms don't even
have an architecture-defined fallback.

Fortunately, the timekeeping subsystem has already solved this problem
of trying to determine what the least bad clock is on constrained
systems, falling back to jiffies in the worst case. By exporting the raw
clock, we can get a decent fallback function for when there's no cycle
counter or architecture-specific function.

This series makes the RNG more useful on: m68k, RISC-V, MIPS, ARM32,
NIOS II, SPARC32, Xtensa, and Usermode Linux. Previously these platforms
would, in certain circumstances, but out of luck with regards to having
any type of event timestamping source in the RNG.

Finally, note that this series isn't about "jitter entropy" or other
ways of initializing the RNG. That's a different topic for a different
thread. Please don't let this discussion veer off into that. Here, I'm
just trying to find a good fallback counter/timer for platforms without
get_cycles(), a question with limited scope.

If this (or a future revision) looks good to you all and receives the
requisite acks, my plan was to take these through the random.git tree
for 5.19, so that I can then build on top of it.

Thanks,
Jason

Changes v3->v4:
- Use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL.

Changes v2->v3:
- Name the fallback function random_get_entropy_fallback(), so that it
  can be changed out as needed.
- Include header with prototype in timekeeping.c to avoid compiler
  warning.
- Export fallback function symbol.

Changes v1->v2:
- Use ktime_read_raw_clock() instead of sched_clock(), per Thomas'
  suggestion.
- Drop arm64 change.
- Cleanup header inclusion ordering problem.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Theodore Ts'o <tytso@mit.edu>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: David S. Miller <davem@davemloft.net>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: sparclinux@vger.kernel.org
Cc: linux-um@lists.infradead.org
Cc: x86@kernel.org
Cc: linux-xtensa@linux-xtensa.org

Jason A. Donenfeld (11):
  timekeeping: add raw clock fallback for random_get_entropy()
  m68k: use fallback for random_get_entropy() instead of zero
  riscv: use fallback for random_get_entropy() instead of zero
  mips: use fallback for random_get_entropy() instead of zero
  arm: use fallback for random_get_entropy() instead of zero
  nios2: use fallback for random_get_entropy() instead of zero
  x86: use fallback for random_get_entropy() instead of zero
  um: use fallback for random_get_entropy() instead of zero
  sparc: use fallback for random_get_entropy() instead of zero
  xtensa: use fallback for random_get_entropy() instead of zero
  random: insist on random_get_entropy() existing in order to simplify

 arch/arm/include/asm/timex.h      |  1 +
 arch/m68k/include/asm/timex.h     |  2 +-
 arch/mips/include/asm/timex.h     |  2 +-
 arch/nios2/include/asm/timex.h    |  2 +
 arch/riscv/include/asm/timex.h    |  2 +-
 arch/sparc/include/asm/timex_32.h |  4 +-
 arch/um/include/asm/timex.h       |  9 +---
 arch/x86/include/asm/tsc.h        | 10 ++++
 arch/xtensa/include/asm/timex.h   |  6 +--
 drivers/char/random.c             | 87 ++++++++++---------------------
 include/linux/timex.h             |  8 +++
 kernel/time/timekeeping.c         | 10 ++++
 12 files changed, 67 insertions(+), 76 deletions(-)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
