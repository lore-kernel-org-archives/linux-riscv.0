Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA873C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Apr 2022 23:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NdAVh43Jsp9QKsmoBKsI73XZv0GgzSBtkutAOTHjPDA=; b=k6nU70eZUa2O3a
	3Q6Q9fPzBomS5g2mTF9K1JWbmN+93LGCNGMwnOnDZxHBwkmgPXEEUGukWfNYIcE/kFK11u541My54
	JQenPTE8E0aCzguNi0o94+BixYALuVigW2jeMJdluM6EFfXorSTaGhXmp3Y+rhOmOk4L++nJx0CPB
	md24zJqlu32sXd9CzXWdJaz54J2C+nPQJ1MJJDFH2os3pM3zVzosqvr4Qvp6GuIeatSA0RE0RauVo
	9WqhOXbrAPN+vwWQsu/9ux9t8slbScRHFXq5mcPzNuwwjZfPFOVd2L5yDzlzjICaE3KAuuQcfh2u9
	+I2VkgoqutSuk4ZyjxtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndgaq-005pR5-Pl; Sun, 10 Apr 2022 23:03:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndgae-005pML-Hb; Sun, 10 Apr 2022 23:03:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 41A51B80ECA;
 Sun, 10 Apr 2022 23:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2BEC385A4;
 Sun, 10 Apr 2022 23:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649631804;
 bh=3UW/ugtsAFc3LmqMEdhTjA4sBbB84OlrF236JWrXPJQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NR9pk0uBM1asFnTpcfZ/n5egUA0L5wn0LwY4g0wU3t6o8+s1sxwXOHR2AYAWEi6pV
 I2vKpdgHuCEtkbj5jgEl+6Q+z2lm60QHNjVPUndluZnUmfI2C4+KbpzY9A5VH3UpK3
 P5r9Evysc6lL+rwlKglGhMFJbnFeXyKAGFovS8I7ute7Bmg1zu32YUyz4TLsfBLCTE
 fC/iqfphZbrVckNWFSyEQ+mV/51gW4BSq6CcPUm/8Qyydr7JRQY1FMsyTuSVmBdOKr
 0g+a0Sxr4+W04a25Z9gGkMyiR61smTiTbf6h82pbMVql8l89m1uCYkKbbielAEJF1K
 7i38S8/QIO/7A==
Date: Sun, 10 Apr 2022 16:03:22 -0700
From: Eric Biggers <ebiggers@kernel.org>
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
Subject: Re: [PATCH RFC v1 00/10] archs/random: fallback to using
 sched_clock() if no cycle counter
Message-ID: <YlNiOunUd5xfQiSL@sol.localdomain>
References: <20220408182145.142506-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220408182145.142506-1-Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_160328_929698_243A5CD9 
X-CRM114-Status: GOOD (  16.19  )
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

On Fri, Apr 08, 2022 at 08:21:35PM +0200, Jason A. Donenfeld wrote:
> By my first guess, we have ktime_get_boottime_ns(), jiffies, and
> sched_clock(). It seems like sched_clock() has already done a lot of
> work in being always available with some incrementing value, falling
> back to jiffies as necessary. So this series goes with that as a
> fallback, for when the architecture doesn't define random_get_entropy in
> its own way and when there's no working cycle counter.

Won't this interact badly with how try_to_generate_entropy() (a.k.a. the "Linus
Jitter Dance") detects the presence of an appropriate timer currently?

        stack.cycles = random_get_entropy();

        /* Slow counter - or none. Don't even bother */
        if (stack.cycles == random_get_entropy())
                return;

So if random_get_entropy() always returns 0, then try_to_generate_entropy()
won't run.  However, if random_get_entropy() is even just a low-precision timer,
then try_to_generate_entropy() will have a chance of running, since the timer
might change between the two calls to random_get_entropy().  And if
try_to_generate_entropy() does run, then it credits 1 bit of entropy for every
iteration, regardless of the timer's precision.

This is an existing problem, but this patchset will make it worse, as it changes
a lot of cases from "no timer" to "low precision timer".

Perhaps try_to_generate_entropy() should check the timer at least 3 times and
verify that it changed each time?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
