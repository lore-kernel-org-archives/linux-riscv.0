Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFC2C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Apr 2022 23:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+oepWrP7D1+wdTS20aK1Tagnmqj2v1N+p+SdZfT0+I=; b=UAruwFMywKs+NJ
	0WFjcNPPSyCQFwYH5+m2pDDz9EmYJ2pKbzuQiTuAmWfIztLnXsia2AsKmj6b0xtdl9b8a1SJKRaBT
	GNlyEJ2Slfpl2rIXmYo7/hkEFDYNffg5/CxXrzz9b/q4VNhotDTekacYMzDLY2319dvukCQlnGLod
	Ffh11wjj0bTl+cqkDr7F4Z0oC/n/Bi8cPEkCiOeQRVj5I1VbPhVnagFfdh24PzBL8/aiLk1IEax6H
	JBaJFLCT8DhoR8Zrrq5Wrm0q/BJ9oniZHfM141Us/CkokJocjhCuTY3GsuQ9NpucAr+0MAyo4NoY3
	dZ4SMixseCD03T0WpGTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndKWe-003uQY-Iu; Sat, 09 Apr 2022 23:29:52 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndKWT-003uPG-5T; Sat, 09 Apr 2022 23:29:42 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1649546972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ht/BjZKfEwbNRvmZyePyMT+aylBpF12k4dVD0rKNtw8=;
 b=AuRq0wCtYXKcm0ryJ67Fp/GBt6cO3SpVd7CkUPfzGNUT87YnBYIl6wooRCxo0V2LKVufAe
 WruAMWs3kz06ZmLlyY2BfPNF+Mn3kMGDmBnqUAIeDdyFzC3xXyK9l5c1+wSdGQ03tVQfPJ
 RV4AhVLGmS0YZcCYNSYMlG1vu/XcNd7tscR4pyhRiCZYkA/IYnCAHheqwKo1LRtrkVRuS0
 9WKJUAPO4GRrNkF5PYwAo6aRPKyz3ID7dl7/kd4fGzDwHM3O+aAEkPYVddEU86X1kEeGN7
 ochLJcl/0cW+kNW7GARWG+dZDnaeEFAyMnCOj52aFtVrAyVaSbB6B5xsdlKXaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1649546972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ht/BjZKfEwbNRvmZyePyMT+aylBpF12k4dVD0rKNtw8=;
 b=vUyIxyQVS1fiHfbV4PIICFMXMOmWDlpsE1+vbv1Qj49gakWkhrvZAc3R+9XH7ZlvihGyvm
 qbHedOcHogR2iNAA==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, arnd@arndb.de
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Theodore Ts'o <tytso@mit.edu>,
 Dominik Brodowski <linux@dominikbrodowski.net>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, "David S . Miller" <davem@davemloft.net>, Richard
 Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H .
 Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max
 Filippov <jcmvbkbc@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, x86@kernel.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH RFC v1 00/10] archs/random: fallback to using
 sched_clock() if no cycle counter
In-Reply-To: <20220408182145.142506-1-Jason@zx2c4.com>
References: <20220408182145.142506-1-Jason@zx2c4.com>
Date: Sun, 10 Apr 2022 01:29:32 +0200
Message-ID: <87wnfxhm3n.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_162941_392409_B68B5BFE 
X-CRM114-Status: GOOD (  19.35  )
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

Jason,

On Fri, Apr 08 2022 at 20:21, Jason A. Donenfeld wrote:
> Sometimes the next best thing is architecture-defined. For example,
> really old MIPS has the CP0 random register, which isn't a cycle
> counter, but is at least something. However, some platforms don't even
> have an architecture-defined fallback. In that case, what are we left
> with?
>
> By my first guess, we have ktime_get_boottime_ns(), jiffies, and
> sched_clock(). It seems like sched_clock() has already done a lot of
> work in being always available with some incrementing value, falling
> back to jiffies as necessary. So this series goes with that as a
> fallback, for when the architecture doesn't define random_get_entropy in
> its own way and when there's no working cycle counter.

sched_clock() is a halfways sane option, but yes as Arnd pointed out:

> Another option would be falling back to different things on different
> platforms. For example, Arnd mentioned to me that on m68k,
> ktime_get_ns() might be better than sched_clock(), because it doesn't
> use CONFIG_GENERIC_SCHED_CLOCK and therefore is only as good as
> jiffies.

ktime_get_ns() or the slightly faster variant ktime_get_mono_fast_ns()
are usable. In the worst case they are jiffies driven too, but systems
with jiffies clocksource are pretty much museum pieces.

It's slightly slower than get_cycles() and a get_cyles() based
sched_clock(), but you get the most granular clock of the platform
automatically, which has it's charm too :)

The bad news is that depending on the clocksource frequency the lower
bits might never change. Always true for clocksource jiffies.
sched_clock() has the same issue.

But the below uncompiled hack gives you access to the 'best' clocksource
of a machine, i.e. the one which the platform decided to be the one
which is giving the best resolution. The minimal bitwidth of that is
AFAICT 20 bits. In the jiffies case this will at least advance every
tick.

The price, e.g. on x86 would be that RDTSC would be invoked via an
indirect function call. Not the end of the world...

Thanks,

        tglx
---
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -646,6 +646,11 @@ static void halt_fast_timekeeper(const s
 	update_fast_timekeeper(&tkr_dummy, &tk_fast_raw);
 }
 
+u32 ktime_read_raw_clock(void)
+{
+	return tk_clock_read(&tk_core.timekeeper.tkr_mono);
+}
+
 static RAW_NOTIFIER_HEAD(pvclock_gtod_chain);
 
 static void update_pvclock_gtod(struct timekeeper *tk, bool was_set)






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
