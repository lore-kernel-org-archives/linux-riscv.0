Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC0DC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 12:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z64PAMYufop4ITj3gy8HSNAMhGsjhDWgZNXHi9mIebs=; b=O+BUG8BM5MwLrs
	u+zcIO+Qq6DTy2D65ZnHUCkJopge+klSMPyRpZ5U3L0xu9Ju8AqrqLxoJJM8vbRqpw5+yQcLC8aEL
	AsKNOxK+Id72OQ3BBj9patLnB4j7Ul0ut0roiXgxzB7I5kL7rfVb7H+21NfMACx9f44Yw11v3CN/L
	axrC1wht+mE9dEqzJ5yEIi+k1mDDp7NDNHrziAXa6BqCvFdlJ5wfnWWINPs/VzR7rjxH+rtBmr/yg
	kDJi94/tohcJWEPilkhW9Z5B65WMpkvMJIhOj1ri5+Rt5iE/+rV0fP+uRjIW1T4x/S4D/vCQ7qxv5
	XqvMeSuiSHC87HxgJYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfL3b-009ytF-Ck; Fri, 15 Apr 2022 12:28:11 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfL2U-009y4P-M0; Fri, 15 Apr 2022 12:27:05 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 4C8D392009C; Fri, 15 Apr 2022 14:26:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 4517592009B;
 Fri, 15 Apr 2022 13:26:48 +0100 (BST)
Date: Fri, 15 Apr 2022 13:26:48 +0100 (BST)
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
In-Reply-To: <YlfoeGRM6w2O+eXA@zx2c4.com>
Message-ID: <alpine.DEB.2.21.2204142349180.9383@angie.orcam.me.uk>
References: <20220413115411.21489-1-Jason@zx2c4.com>
 <20220413115411.21489-5-Jason@zx2c4.com>
 <20220413122546.GA11860@alpha.franken.de>
 <alpine.DEB.2.21.2204131331450.9383@angie.orcam.me.uk>
 <CAHmME9pQ4xdeTUDxAdrOu=S9NRTonYzJVk50fa0Zfz4knZt5WA@mail.gmail.com>
 <alpine.DEB.2.21.2204140014580.9383@angie.orcam.me.uk>
 <YlfoeGRM6w2O+eXA@zx2c4.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_052702_912330_D25CA74C 
X-CRM114-Status: GOOD (  33.66  )
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

> >  It depends on the exact system.  Some have a 32-bit high-resolution 
> > counter in the chipset (arch/mips/kernel/csrc-ioasic.c) giving like 25MHz 
> > resolution, some have nothing but jiffies.
> 
> Alright, so there _are_ machines with no c0 cycles but with a good
> clock. Yet, 25MHz is still less than the cpu cycle, so this c0 random
> ORing trick remains useful perhaps.

 It's not much less than the CPU cycle really, given that the R3k CPUs are 
clocked at up to 40MHz in the systems concerned and likewise the buggy R4k 
CPUs run at up to 60MHz (and mind that their CP0 Count register increments 
at half the clock rate, so the rate is up to 30MHz anyway).  The overhead 
of the calculation is more than that, let alone the latency and issue rate 
of an uncached MMIO access to the chipset register.

 Also the systems I have in mind and that lack a counter in the chipset 
actually can make use of the buggy CP0 timer, because it's only when CP0 
timer interrupts are used that the erratum matters, but they use a DS1287 
RTC interrupt instead unconditionally as the clock event (see the comment 
at the bottom of arch/mips/dec/time.c).  But this has not been factored in 
with `can_use_mips_counter' (should it just check for `mips_hpt_frequency' 
being zero perhaps, meaning the timer interrupt not being used?).

 Thomas, do you happen to know if any of the SGI systems that we support 
had buggy early R4k chips?

> >  It seems like a reasonable idea to me, but the details would have to be 
> > sorted out, because where a chipset high-resolution counter is available 
> > we want to factor it in, and otherwise we need to extract the right bits 
> > from the CP0 Random register, either 13:8 for the R3k or 5:0 for the R4k.
> 
> One thing we could do here that would seemingly cover all the cases
> without losing _that_ much would be:
> 
>     return (random_get_entropy_fallback() << 13) | ((1<<13) - read_c0_random());

 Except this would have to be:

    return (random_get_entropy_fallback() << 14) | ((1<<14) - read_c0_random());

of course, as bit 13 is still one of the active ones in the R3k CP0 Random 
register.

> Or in case the 13 turns out to be wrong on some hardware, we could
> mitigate the effect with:
> 
>     return (random_get_entropy_fallback() << 13) ^ ((1<<13) - read_c0_random());

 There are two variants only of the CP0 Random register that we can ever 
encounter, as it's been de-facto standardised in early 1990s already and 
then written down in the MIPSr1 architecture specification ~2000.  So I 
think it may make sense to actually handle them both explictitly with 
individual calculations, possibly conditionalised on a CONFIG setting or 
`cpu_has_3kex', because kernels that support the two variants of the MMU 
architecture are mutually incompatible.

 Ah, there's that buggy non-compliant JZ4740 chip too.  I guess we can 
figure out how many CP0 Random bits it implements, though it may be worth 
noting that architecturally the register is not required to decrement, so 
again it may be good to double-check how the JZ4740 selects the values 
there.

 I think the check for a buggy CP0 timer in `can_use_mips_counter' should 
also be qualified with !(CONFIG_CPU_MIPS32 || CONFIG_CPU_MIPS64), which 
will reduce the function to a constant 1 for the overwhelming majority of 
systems out there, without a need to refer to CP0 PRId every time.

> As mentioned in the 1/xx patch of this series,
> random_get_entropy_fallback() should call the highest resolution thing.
> We then shave off the least-changing bits and stuff in the
> faster-changing bits from read_c0_random(). Then, in order to keep it
> counting up instead of down, we do the subtraction there.

 Isn't it going to be an issue for an entropy source that the distribution 
of values obtained from the CP0 Random bit-field is not even, that is some 
values from the 6-bit range will never appear?

> What do you think of this plan?

 Otherwise it makes absolute sense to me.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
