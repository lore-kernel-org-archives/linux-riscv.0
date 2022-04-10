Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF842C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Apr 2022 23:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hr1kxX3m2Atbg3GbsrNSYg4/mZEKYSJHZ9oRLboqBz4=; b=f0pSn9s4D4AW7r
	ZqyU7yR+tEqqs+8cv0bKkNhCQAl6TqyQ+AI86P6LSgRjSHNQjylAC4UXGwFV/tMIA+0NKTAIhksRx
	O+ZrXHpWrwkLvj3umvkpttw8k8VzVkK2eXwKiApRtuG+CNS/8yIxxBpmeB1BbWshypazrkbRagS3D
	AXlhGd2ikPK/EuJ829j9iJKQP6Ik1fvgtVFbdfelf1IsNdD07hvpTYFDpwgIwNeYeXD0jC8eo1Fpi
	lhAbC9+YFXV6tAYrQHJbudnGVFySq7Q534S86llVVN7ziq/sw6yZcec+u+0x7Yn1Oo87tEOt7/Dhk
	UqHYIyM44JUB7Zc4ZGMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndh0N-005vfg-E7; Sun, 10 Apr 2022 23:30:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndh0B-005vdX-Gz; Sun, 10 Apr 2022 23:29:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2585460E9A;
 Sun, 10 Apr 2022 23:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E65CC385A4;
 Sun, 10 Apr 2022 23:29:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="kJhfffoW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649633387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xT3So0usAoJxQ304XiPl75pb1sVc2oURXduYIBIz2jE=;
 b=kJhfffoWE5rmSZr2hkEBhrREccH2sB52cPnomZx5gep5MIK4PQjzHHXGb04ece9ONLjSgZ
 yketIE1A/v7z2GoBvYc7ATI8Lj+bmpEBR2ipHdS3falZFhkT8pyVpHMlhjd4pLOOw5jbyD
 lbupiR0wmGHmG3XfeRNkYAbLuj0ruLM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5d916b5b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sun, 10 Apr 2022 23:29:47 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 k25-20020a056830151900b005b25d8588dbso10213940otp.4; 
 Sun, 10 Apr 2022 16:29:46 -0700 (PDT)
X-Gm-Message-State: AOAM533k6/sM4AHlTPED8kya3mkukul1X8Dod5A503IW1Mr0b4Sk+7sE
 ZSHS4sCIgiWD4BPx8+Ngc4JOMct5uTg9reWg1yM=
X-Google-Smtp-Source: ABdhPJyBO6AKhupquz7e2wxSHr1eLUo0K1GhDFMIDJNkDGyTIn23DuFzdaauI+vZ7nL7liNEn+igem8NUaNiYqzOtLk=
X-Received: by 2002:a81:1e81:0:b0:2eb:cdd3:20ee with SMTP id
 e123-20020a811e81000000b002ebcdd320eemr14046908ywe.396.1649633374899; Sun, 10
 Apr 2022 16:29:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:a28:b0:173:f33c:dee9 with HTTP; Sun, 10 Apr 2022
 16:29:34 -0700 (PDT)
In-Reply-To: <YlNiOunUd5xfQiSL@sol.localdomain>
References: <20220408182145.142506-1-Jason@zx2c4.com>
 <YlNiOunUd5xfQiSL@sol.localdomain>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 11 Apr 2022 01:29:34 +0200
X-Gmail-Original-Message-ID: <CAHmME9quorveHN-z=n4r_gfj8ShEfprXcTvsc7bYj9_caxx7sg@mail.gmail.com>
Message-ID: <CAHmME9quorveHN-z=n4r_gfj8ShEfprXcTvsc7bYj9_caxx7sg@mail.gmail.com>
Subject: Re: [PATCH RFC v1 00/10] archs/random: fallback to using
 sched_clock() if no cycle counter
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, arnd@arndb.de, 
 "Theodore Ts'o" <tytso@mit.edu>,
 Dominik Brodowski <linux@dominikbrodowski.net>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "David S . Miller" <davem@davemloft.net>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 John Stultz <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
 linux-xtensa@linux-xtensa.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_162951_665366_DC954BEB 
X-CRM114-Status: GOOD (  24.86  )
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

Hi Eric,

On 4/11/22, Eric Biggers <ebiggers@kernel.org> wrote:
> On Fri, Apr 08, 2022 at 08:21:35PM +0200, Jason A. Donenfeld wrote:
>> By my first guess, we have ktime_get_boottime_ns(), jiffies, and
>> sched_clock(). It seems like sched_clock() has already done a lot of
>> work in being always available with some incrementing value, falling
>> back to jiffies as necessary. So this series goes with that as a
>> fallback, for when the architecture doesn't define random_get_entropy in
>> its own way and when there's no working cycle counter.
>
> Won't this interact badly with how try_to_generate_entropy() (a.k.a. the
> "Linus
> Jitter Dance") detects the presence of an appropriate timer currently?
>
>         stack.cycles = random_get_entropy();
>
>         /* Slow counter - or none. Don't even bother */
>         if (stack.cycles == random_get_entropy())
>                 return;
>
> So if random_get_entropy() always returns 0, then try_to_generate_entropy()
> won't run.  However, if random_get_entropy() is even just a low-precision
> timer,
> then try_to_generate_entropy() will have a chance of running, since the
> timer
> might change between the two calls to random_get_entropy().  And if
> try_to_generate_entropy() does run, then it credits 1 bit of entropy for
> every
> iteration, regardless of the timer's precision.
>
> This is an existing problem, but this patchset will make it worse, as it
> changes
> a lot of cases from "no timer" to "low precision timer".
>
> Perhaps try_to_generate_entropy() should check the timer at least 3 times
> and
> verify that it changed each time?

What you've identified is actually already the case for platforms
where the cycle counter is already just slow (and there are a few such
platforms; my odroid C2 even exhibits this). As you identified, the
cycle counter might already be too slow, yet we get [un]lucky and
reach this code right on the cusp or a change.

So the problem isn't new here, per say, for this patchset. But indeed
perhaps we should consider adjusting the heuristics for that a bit in
a separate patch. Your check three times idea seems like a good
starting point, if you want to send a patch and we can poke at it.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
