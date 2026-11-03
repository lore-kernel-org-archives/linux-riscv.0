Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187C1606A31B
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 22:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ajf4NGDX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=dabbelt-com.20260707.gappssmtp.com header.i=@dabbelt-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WXuswWzF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=c8h/HQc2WuFEjWR6bQIigrykOyM3cA6tsyPBIq6ojuA=; b=Ajf4NGDX5kSgnZCJg1zj/FpmJD
	pYDaLwhz+KCjxDTbiZ92prvSJotm5s5yB+qVvLoCkJr1iB2WewH0pCzKW0hoi0fG8QO3SdLdOqf8C
	FTBqEEm6EYukspYsiPQD9CE8/xbp1KScLZLNygu560mHaxRO9kF2KILwZZSKnrreKX+GP6uHNjfU8
	DcxPxPWmRhp/K/oZyLwdRQHfoOztvMTimpkLBZhV+w4QvIrqwUY81lfVA8dDPCOsz7NvOGd9HII8l
	LnEhtbTQ1GfwkdG15ETRssx7dFoYQodE911gLE1T1OTpmsQDb8KORd8nar7nYWFrGIDVFSRJcRpW1
	3tthsc1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMyy-00000003qhv-2YAc;
	Tue, 03 Nov 2026 22:27:56 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMyv-00000003qh5-4363
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 22:27:55 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-3282db206d3so67546eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2026 14:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20260707.gappssmtp.com; s=20260707; t=1793744872; x=1794349672; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W46N2zD8d3M/q6sqBtsamnQ8AkzANHljJG6JB3HVn40=;
        b=WXuswWzFZuyWJVAqnUuuI6dW6dEKjGxvgQ8MTxv3shWaoAUKUq1MGPW5x5+UszTJFI
         SMd8+8abG4OfxkALeHDuSNSXEH6qjtRBWzrYmenKN5oAoiR8j6gAA+PGI06ThLCG2je2
         Xir9pqJKQwPwcFou0Z4t42QeZBMbuAsZeSV/V4JS2na+v6flMidTZJf4oUCHkwTZG0vp
         cLXX+ZeSHdSkiQLY7qnwmI1bvTJCdLqblt+iMThEyE4e7XUfdT4MqOqZ2RlR65+zkIQf
         LmbLodxNMoFLZ48NiGX3kxXWbI1azxWoakHBTLmxVC5VSJkuhBmMU4++FcP3ghMNccQ7
         vt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744872; x=1794349672;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W46N2zD8d3M/q6sqBtsamnQ8AkzANHljJG6JB3HVn40=;
        b=sPQxuhSgtBiJlnbmV6CUaXyspUBAEwi1d5Vts2higIL2XDMhppB2XxUqpldhzPzfJ4
         /5BzEDoQW6EUAHP34S6hWXQ41PQ/aJdFh0sfWqK0qvkm27zHXf8eGvh9iuQuJT5jxADi
         LI1mcVM0nSOaavpbV9YCShs78OkFfoP/heAbEYerVmtrCts02rz4U0fVHRsPP629EjIY
         7TpzAu71WtiOuxF3ATQvH12smtl2KfNTYLCPWhp97ZRahj5ees1S5nI7lD3GUOK2EQzB
         Zzg2EAXpB8Y8kz7zYmEn81cmwL9cYwpuev0lv9VBGTN1vU2Ptn1pt8Q2xLRMOqL8q2mC
         uH5A==
X-Forwarded-Encrypted: i=1; AKwUvBz2yDWP3+P0GJVDYlYF81/XV78PxMQFpSRJvHCpIjot57WZGFaqHYXWkevnmkZ5h8rHHnwD1R2cx6CE+w==@lists.infradead.org
X-Gm-Message-State: APuU4Z9GPhCpOD71iEtNYMqPmBbdpashkXKlsqQ7ej98xmUrp2jdBJy3
	upplnt4Gt3RrReH35rxW5FZj6Km4zejn/BkmHNOn9GeV9phmj+w6gmKt91P4cYNucHw=
X-Gm-Gg: AYBFou07SLAMEOGo0Lu1HzsVJ66qyBrUFMV2SSzXrDhpxdqRfhf43amChN9yR6KK0Ib
	kcs9k50wsMxz+oAizB8mDHaYMoWIvMIwzSpxKsJl/J/0mn4gUTF+FnykKNk7LiRcL7uwRk2UnUZ
	pR8zVggmHjSQ+XEdyETYYWzRCeOLBCerXA3EF2l8insAft4eiCKtmtsnLOoiBOF2I5uP33j1eXO
	msCBlKTlHRE9c5S7S8HWb5BlpD5pVrX+T0bc7p79yxvKKqCIe4XgtP+LbEed2ch7/wTnuyopIcY
	LuoyeMb0En6fTny3hXBvsKsY/pabu848EnEFH1S01OLtueIR9iVWshzEI+4eEVuMBP4nbAE0h90
	/W/xQyN5z27Jb+P8QMWTNHtJt2oNCu848pRXb8fUCCUmTlNj7wzCxbsholxYPTCcKWsnneyEIPB
	aptSuNNjhHGdj2W0mN3L29PCmKcBY62eN5Iu8Ibtl91GYfFxD6sXhW/a7mkJoDTy2yoogZuvUdO
	k47Wiou8O32LuHCmlSjaKF/i2R7QBpTp5EB95L//I13MKhwhOYMkXJB1ec5N+UDtyuYpB99Wex+
	4hHFby/OmsUE9odcjXnBn/oockag1MGeE5OcpySZPzMmWf2M1XF0eRAvnrGCIoRB1ThO9DIhU/e
	EchRhZEB+wC4OsEGEe4y4RA/dF9YaPSk8SA==
X-Received: by 2002:a05:693c:864d:10b0:369:9062:c392 with SMTP id 5a478bee46e88-36a424261c5mr24477930eec.37.1793744872114;
        Tue, 03 Nov 2026 14:27:52 -0800 (PST)
Received: from localhost ([2001:5a8:4687:d600:d5a2:4dd4:6c9b:a9a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm1211516eec.7.2026.11.03.14.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:27:51 -0800 (PST)
Date: Tue, 03 Nov 2026 14:27:51 -0800 (PST)
X-Google-Original-Date: Tue, 03 Nov 2026 14:27:49 PST (-0800)
Subject: Re: [PATCH v4 0/2] riscv: support CPUs with Zalrsc but not Zaamo
In-Reply-To: <20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com>
CC: pjw@kernel.org, aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>,
  Will Deacon <will@kernel.org>, peterz@infradead.org, Mark Rutland <mark.rutland@arm.com>, gary@garyguo.net,
  yury.norov@gmail.com, linux@rasmusvillemoes.dk, cfu@wavecomp.com,
  Linus Torvalds <torvalds@linux-foundation.org>, Olof Johansson <olof@lixom.net>, aleksa.paunovic@htecgroup.com,
  arikalo@gmail.com, boqun@kernel.org, boqun@kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Vladimir.Kondratiev@mobileye.com, vladimir.kondratiev@mobileye.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vladimir.kondratiev@mobileye.com
Message-ID: <mhng-6BAAFBCB-95B3-45AC-9087-C00241996255@Palmers-Mini.rwc.dabbelt.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_142754_240582_9D7BE308 
X-CRM114-Status: GOOD (  38.72  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 01 Nov 2026 04:51:38 PST (-0800), vladimir.kondratiev@mobileye.com wrote:
> RISC-V split the A extension into Zaamo (AMO*.w/AMO*.d) and Zalrsc
> (LR/SC). Linux has so far required the whole A extension.
>
> MIPS P8700 [1] implements only Zalrsc. AMO instructions are emulated by a
> trap into SBI. I measured typical userspace atomics on this CPU: an
> LR/SC atomic takes about 40 cycles, an AMO atomic about 600. The same
> ratio applies to kernel refcounts, bitops, xchg and futexes, so the
> kernel needs to emit LR/SC when Zaamo is not implemented.

In RISC-V land, things that are implemented by M-mode traps are 
generally considered "implemented" in the context of supervisor mode, 
just implemented to have low performance.  I don't agree with that 
decision, but that's really an ISA thing and not something we can do 
that much about it Linux.

So I think the first thing you need to decide here is how you're going 
to be treating the atomics: are they really unimplemented, or are they 
implemented but slow?  Right now this is kind of a mixed bag: you're 
sort of treated them as unimplemented in the kernel (or at least parts 
of the kernel), but then implemented in userspace.

If you're going to treat the AMOs as "implemented but slow", then I 
think it's best to see some actual performance numbers for a real 
application.  Sure 600 cycles is slow for an atomic, but I was recently 
playing around with some much larger systems with ~300 cycle AMOs and 
couldn't get any meaningful benchmarks to show up over there -- those 
were OOO cores blocked on bus resources, so a completely different 
problem, but just saying they're 600 cycles so we can't use them isn't 
really good enough -- particularly when the alternative is 40 cycles, 
which is also super slow, so it's not like you can be doing all that 
much with atomics on these cores even with the "fast" sequences.  You're 
probably also going to need some way to tell userspace about this 
"implemented but slow" behavior, similar to how we describe misaligned 
accesses (which is all a bit of a messy retrofit, so maybe don't copy it 
exactly).

If you're going to treat the AMOs as "unimplemented", then we need some 
way to deal with userspace.  Right now we have A as part of all the base 
behaviors we expose to userspace.  We used to have the non-A userspace 
support, but we decided to drop it when upstreaming the port because it 
didn't seem useful to anyone.  There was a design sketched out here with 
a VDSO call for cmpxchg() that looked similar to some of the non-A Arm 
systems, but as far as I know nobody's implemented that in the kernel or 
userspace so it'd need to be proved out.

> Mobileye is going to use the "eyeq7h" platform, built on this CPU, for
> ADAS and autonomous driving. Kernel atomics are on the scheduling,
> memory-management and driver paths of that product, so the emulated
> AMO cost is not acceptable there.

Is that announced anywhere?  All I can find is an EyeQ 6 on the website.

Also: are you planning on continuing with these non-A systems?  Those 
40-cycle atomics are going to burn you at some point, if the plan for 
the next-generation systems is just to go implement A then maybe it's 
best to keep this out of tree.  We already have way too much 
fragmentation in RISC-V land as it is, we don't need any more.

> This series keeps today's default: both extensions on, -march still
> contains "a", generated code is unchanged. Turning Zaamo off is a
> NONPORTABLE choice. The resulting kernel matches one -march, which
> userspace has to use as well, so a runtime alternative would not
> produce a portable image.

It's really not non-portable, though: the Zalrsc code runs fine on 
systems that support Zaamo, it just may be a performance issue.  I'm not 
sure anyone's actually measured that, but I think it's sane to just 
assume that native AMOs are going to out-performance LR/SC on _some_ 
systems.  It's still just a performance thing, though...

> Zalrsc stays mandatory. cmpxchg, conditional atomics and futex CAS are
> already LR/SC sequences; Zaamo cannot replace them. BPF atomic ops
> still emit AMO and remain unsupported on a Zalrsc-only kernel.
>
> [1] https://mips.com/products/hardware/p8700/
>
> Changes in v4:
> - Require a compiler that accepts _zalrsc in -march before Zaamo can
>   be disabled. GCC 15.1 introduces that support. Older compilers keep
>   Zaamo enabled and -march keeps "a".
> - Link to v3: https://patch.msgid.link/20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com
>
> Changes in v3:
> - Make Zalrsc mandatory. cmpxchg and the conditional atomics already
>   use LR/SC, so RISCV_ISA_ZALRSC can no longer be turned off.
> - Check AMO and LR/SC support independently. A kernel that emits both
>   requires "a", or both "zaamo" and "zalrsc".
> - Put the LR/SC bitop sequence in its own block so two inlined
>   set_bit or clear_bit calls compile.
> - Remove the LR/SC loop that ran after the hart lottery and accessed
>   address 1. Build the lottery increment with add so RV32 assembles.
> - Add an exception-table entry for sc as well as lr in the futex
>   LR/SC helper.
>
> Changes in v2:
> - Switch from a runtime choice of atomic implementation to a
>   compile-time one, gated by NONPORTABLE.
>
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> ---
> Vladimir Kondratiev (2):
>       riscv: build kernel atomics from LR/SC when Zaamo is disabled
>       riscv: accept the atomic extensions this kernel was built with
>
>  arch/riscv/Kconfig               | 32 +++++++++++++++++++++++
>  arch/riscv/Makefile              | 15 ++++++++---
>  arch/riscv/include/asm/atomic.h  | 56 +++++++++++++++++++++++++++++++++++++++-
>  arch/riscv/include/asm/bitops.h  | 51 ++++++++++++++++++++++++++++++++++++
>  arch/riscv/include/asm/cmpxchg.h | 18 +++++++++++++
>  arch/riscv/include/asm/futex.h   | 53 +++++++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/cpu.c          | 28 +++++++++++++++++---
>  arch/riscv/kernel/entry.S        |  9 +++++++
>  arch/riscv/kernel/head.S         | 14 ++++++++++
>  9 files changed, 267 insertions(+), 9 deletions(-)
> ---
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> change-id: 20260120-lrsc-only-cc06422f5bb1
>
> Best regards,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
