Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81EAC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Apr 2022 07:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GG6uuR53Dii1PadfiqzaClxAC4FoZfOKRtpaln8RNN8=; b=ogJ2/thLpauDH9
	cESPM/hkIKbpWsWZL3B/Nudi8KKeE9b+0krQ/JLrLv5y52CcWkEqQ9zY1STeGHr/R7RD4tMOoSABw
	9lWz/hhZcw+z5Y59ReEMOe7orm3DzAN17GDq8ac3ALXwh7HOrBga4KA1gDoi55elL9Lg2IItCy1PP
	mF+GStPDFG3g4cazKs6obRtBopG/2GlmiWlvn1LWDT9D8xLeEiXrAJton+gt6vy4eNrKjd9CRkC8S
	/TdXmZ2cQntBI9AOUr8TQwHscB6KFWZkWhL2Q4bMDudkajk2ja81A32cVFcGi9Ys/3I/Swz26SA/A
	2UHBZUUkcfto3CowUxZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngLXO-00FquW-Ft; Mon, 18 Apr 2022 07:11:06 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngLXK-00Fqsf-VO; Mon, 18 Apr 2022 07:11:05 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1ngLWo-0008Ga-00; Mon, 18 Apr 2022 09:10:30 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 7A686C0193; Mon, 18 Apr 2022 09:10:05 +0200 (CEST)
Date: Mon, 18 Apr 2022 09:10:05 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
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
 Johannes Berg <johannes@sipsolutions.net>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 X86 ML <x86@kernel.org>, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v4 04/11] mips: use fallback for random_get_entropy()
 instead of zero
Message-ID: <20220418071005.GA4075@alpha.franken.de>
References: <20220413115411.21489-1-Jason@zx2c4.com>
 <20220413115411.21489-5-Jason@zx2c4.com>
 <20220413122546.GA11860@alpha.franken.de>
 <alpine.DEB.2.21.2204131331450.9383@angie.orcam.me.uk>
 <CAHmME9pQ4xdeTUDxAdrOu=S9NRTonYzJVk50fa0Zfz4knZt5WA@mail.gmail.com>
 <alpine.DEB.2.21.2204140014580.9383@angie.orcam.me.uk>
 <YlfoeGRM6w2O+eXA@zx2c4.com>
 <alpine.DEB.2.21.2204142349180.9383@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2204142349180.9383@angie.orcam.me.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_001103_369189_B8C767C0 
X-CRM114-Status: GOOD (  24.57  )
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

On Fri, Apr 15, 2022 at 01:26:48PM +0100, Maciej W. Rozycki wrote:
> Hi Jason,
> 
> > >  It depends on the exact system.  Some have a 32-bit high-resolution 
> > > counter in the chipset (arch/mips/kernel/csrc-ioasic.c) giving like 25MHz 
> > > resolution, some have nothing but jiffies.
> > 
> > Alright, so there _are_ machines with no c0 cycles but with a good
> > clock. Yet, 25MHz is still less than the cpu cycle, so this c0 random
> > ORing trick remains useful perhaps.
> 
>  It's not much less than the CPU cycle really, given that the R3k CPUs are 
> clocked at up to 40MHz in the systems concerned and likewise the buggy R4k 
> CPUs run at up to 60MHz (and mind that their CP0 Count register increments 
> at half the clock rate, so the rate is up to 30MHz anyway).  The overhead 
> of the calculation is more than that, let alone the latency and issue rate 
> of an uncached MMIO access to the chipset register.
> 
>  Also the systems I have in mind and that lack a counter in the chipset 
> actually can make use of the buggy CP0 timer, because it's only when CP0 
> timer interrupts are used that the erratum matters, but they use a DS1287 
> RTC interrupt instead unconditionally as the clock event (see the comment 
> at the bottom of arch/mips/dec/time.c).  But this has not been factored in 
> with `can_use_mips_counter' (should it just check for `mips_hpt_frequency' 
> being zero perhaps, meaning the timer interrupt not being used?).
> 
>  Thomas, do you happen to know if any of the SGI systems that we support 
> had buggy early R4k chips?

IP22 has probably seen all buggy MIPS chips produced, so yes I even own
Indy/Indigo2 CPU boards with early R4k chips.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
