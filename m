Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969BBC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 18:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DOSm/Xzd3zZhvYYQpuLS6SeFnt25qD76ibiDRV8H3js=; b=V5UdS4CAdfnb22
	b4+vvV7fH7AQLSjqTJ1EJJYo3QNxRdxzBHqaFwyW594xXFOj8nmrc+tE6T7esW+Hmxed58s8qxvOm
	RlB7Tr0dtHSNAamdD08jnmTaqBgBmvbfppSv4IzraHHd7/sO3KUurQSngycZryscAjnpHuaIeVSL+
	fd52deqYqrCGui2vVdrHok/Ocv8Uk/w1xZKnTPNg53/GpGYNZXXorR1LRlFO42a6kRXaqnB2GE1vz
	zl2+HnI4GPGFi5/h2psBpAUJbwuWp0kcrLM3+Y7NBi3NOfAUl01PoOPIoAPppi0OYRm2xczzQRBDr
	e+CkH0Jo+s1QLCxFneOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nctRC-000xYh-2F; Fri, 08 Apr 2022 18:34:26 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nctQs-000xRG-OG; Fri, 08 Apr 2022 18:34:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D5D41042;
 Fri,  8 Apr 2022 11:34:03 -0700 (PDT)
Received: from lakrids (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 300E03F718;
 Fri,  8 Apr 2022 11:33:59 -0700 (PDT)
Date: Fri, 8 Apr 2022 19:33:53 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 arnd@arndb.de, Theodore Ts'o <tytso@mit.edu>,
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
 Johannes Berg <johannes@sipsolutions.net>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, x86@kernel.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH RFC v1 07/10] arm64: use sched_clock() for
 random_get_entropy() instead of zero
Message-ID: <YlCAEaG4i/OuMKet@lakrids>
References: <20220408182145.142506-1-Jason@zx2c4.com>
 <20220408182145.142506-8-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220408182145.142506-8-Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_113406_956002_AEB76607 
X-CRM114-Status: GOOD (  24.87  )
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

On Fri, Apr 08, 2022 at 08:21:42PM +0200, Jason A. Donenfeld wrote:
> In the event that random_get_entropy() can't access a cycle counter or
> similar, falling back to returning 0 is really not the best we can do.
> Instead, at least calling sched_clock() would be preferable, because
> that always needs to return _something_, even falling back to jiffies
> eventually. It's not as though sched_clock() is super high precision or
> guaranteed to be entropic, but basically anything that's not zero all
> the time is better than returning zero all the time.
> 
> If CONFIG_ARM_ARCH_TIMER=n, then get_cycles() will return 0, so we only
> need the fallback code for that case.

In arch/arm64/Kconfig we unconditionally select CONFIG_ARM_ARCH_TIMER,
so that configuration shouldn't be possible, and I don't think this
patch is necessary.

On arm64 we depend on the architected timer in a bunch of places, so
anyone hacking that out has bigger problems.

Thanks,
Mark.

> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  arch/arm64/include/asm/timex.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/timex.h b/arch/arm64/include/asm/timex.h
> index cf59ce91b22d..bfebd2e1ce45 100644
> --- a/arch/arm64/include/asm/timex.h
> +++ b/arch/arm64/include/asm/timex.h
> @@ -13,6 +13,15 @@
>   */
>  #define get_cycles()	arch_timer_read_counter()
>  
> +#ifndef CONFIG_ARM_ARCH_TIMER
> +/*
> + * The default implementation of random_get_entropy() calls get_cycles(),
> + * which will return 0 if CONFIG_ARM_ARCH_TIMER=n, so we fall back to
> + * sched_clock() here. Not a great situation, but better than nothing.
> + */
> +#define random_get_entropy() ((unsigned long)sched_clock())
> +#endif
> +
>  #include <asm-generic/timex.h>
>  
>  #endif
> -- 
> 2.35.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
