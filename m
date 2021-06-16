Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A5CC48BE6
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 10:48:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA1286100A
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 10:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA1286100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJEZS6GiHH2QSU9WTNvaF7PhyZLvipObqteU0Wd6xwk=; b=BXX5cxqE34gT5C
	Dn9cGkDQFxYD1F2KXm532p2BtzU/qGcmnO8mPN11IXg1tj0lRJiFM5ArK1jEtFm7GRNf4KL7rTlwP
	wloT9d0rPonMUGm3SRk+Ygsr/u3VzQZF9X42+lp6T+I7xB9kWkAjS0S8/XLRmD1SNxMlqZvt0kkOh
	rypuZu9FJg1dqzEoNOPLAsQeGVntR5D3r5lRSUjqUdlQstfEzD918AY/oBGxAU9FJiYYZLywer6mX
	r2jyAfTnTj1ze9odn/amuXnwqQdUhK97auug0pcyil6W0VTwIrdFucOEnh4UUnsdxHnu6+2z63u5C
	MXUhsmN0dMOOEdCFF2CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltT6A-005uqg-LI; Wed, 16 Jun 2021 10:48:42 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltT65-005uoE-3t
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 10:48:39 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id im10so1291875qvb.3
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 03:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=90c14hZ9aZADuEVRp5VuroKQzK2oflVWzh1ZITyAGIE=;
 b=F5ho2QIMyCIFPqcoG+bEjO56CtD+Hgkpx/yUNjxv1h152abZWGYiBImWCmb03gvZv+
 3SrqwnYQKEwHd3FHffjYLyXXZ5qyCdciyiAZEsmNLwcH8/NnqyCgHXbXGAEYrb8ggnMW
 ws6fBBrsK2WBHA9s5RuZI9gr65FeyIxYyMNRB0UIILKSUyQGesmxS8aDqPLuwbZVCEVc
 n6zNDc/clkvfeesH42bhK4i3PwIVRGBDfp5dvYTrzIdCxViLoSE3S4FbxvK4arCrX8it
 LjdxOrhbbSSJBxTAqGkW+N20luBBMM+hpA6v0yj9VDlDaZ9AfP8AZKWSnORN7j19zUMJ
 Mi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=90c14hZ9aZADuEVRp5VuroKQzK2oflVWzh1ZITyAGIE=;
 b=B+eD7zoTEreR5Xi3ZF/q7oTBHGxAt+Zjlkg9SNk1kWugv6tQWMH0ajV+AVfhSkHf5q
 ph+7A670sSgEvB1TEUoXWrRJ/0GFOLlHF5TI7Z1/7BRZxfUJM32ZmUU/uP/M7hZyGCAy
 dFXBfdWYl5/fkX5wZsgqQfsh24FQ7TMIu6PYZAlrIHbA8eoqJ9m63wXw8ThCWiiQxx8r
 hS3IsqqABJIPNrvjTaV4UWYyTqf08AmX/wr4odetgWLfyyFO8ewI6ERHKqLjw7+k9RXc
 H1XNnkjKrfCsvZ9BPc4olK/dE/TlVv00T/O27DcHAl0Pn1EtH9cHeQ/GXL/ndo5ug9tN
 gqzg==
X-Gm-Message-State: AOAM532rF+3VcOikR/j/oPq57vYhY1/iWDnMEnW76w5TAMSxJ6dQ87K3
 wpm7GRm06IZIQ5Q91qGtk8Fvj7b1L145WRHaGec=
X-Google-Smtp-Source: ABdhPJzh3s1b8WlT7LVSUJDRlfI9LLCuPlFvfWqL/vpowEcHhAKHF9hwaw7KJ7GHohstjA4L8lcfOKdMR7qDcvNSCho=
X-Received: by 2002:ad4:5c44:: with SMTP id a4mr10410163qva.22.1623840515391; 
 Wed, 16 Jun 2021 03:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210615023812.50885-1-mcroce@linux.microsoft.com>
 <20210615023812.50885-2-mcroce@linux.microsoft.com>
 <6cff2a895db94e6fadd4ddffb8906a73@AcuMS.aculab.com>
 <CAEUhbmV+Vi0Ssyzq1B2RTkbjMpE21xjdj2MSKdLydgW6WuCKtA@mail.gmail.com>
 <1632006872b04c64be828fa0c4e4eae0@AcuMS.aculab.com>
 <CAEUhbmU0cPkawmFfDd_sPQnc9V-cfYd32BCQo4Cis3uBKZDpXw@mail.gmail.com>
 <CANBLGcxi2mEA5MnV-RL2zFpB2T+OytiHyOLKjOrMXgmAh=fHAw@mail.gmail.com>
 <CAEUhbmX_wsfU9FfRJoOPE0gjUX=Bp7OZWOZDyMNfO6=M-fX_0A@mail.gmail.com>
 <20210616040132.7fbdf6fe@linux.microsoft.com>
 <db7a011867a742528beb6ec17b692842@AcuMS.aculab.com>
In-Reply-To: <db7a011867a742528beb6ec17b692842@AcuMS.aculab.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Date: Wed, 16 Jun 2021 19:48:22 +0900
Message-ID: <CACuRN0OThmL5yAAzGv9r6LjR8Z7q4-FJs4LpU50xWNDtyXQyYw@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: optimized memcpy
To: David Laight <David.Laight@aculab.com>
Cc: Matteo Croce <mcroce@linux.microsoft.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, Gary Guo <gary@garyguo.net>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, Drew Fustini <drew@beagleboard.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_034837_249132_E8AEB48C 
X-CRM114-Status: GOOD (  33.92  )
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

On Wed, Jun 16, 2021 at 5:24 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Matteo Croce
> > Sent: 16 June 2021 03:02
> ...
> > > > That's a good idea, but if you read the replies to Gary's original
> > > > patch
> > > > https://lore.kernel.org/linux-riscv/20210216225555.4976-1-gary@garyguo.net/
> > > > .. both Gary, Palmer and David would rather like a C-based version.
> > > > This is one attempt at providing that.
> > >
> > > Yep, I prefer C as well :)
> > >
> > > But if you check commit 04091d6, the assembly version was introduced
> > > for KASAN. So if we are to change it back to C, please make sure KASAN
> > > is not broken.
> > >
> ...
> > Leaving out the first memcpy/set of every test which is always slower, (maybe
> > because of a cache miss?), the current implementation copies 260 Mb/s when
> > the low order bits match, and 114 otherwise.
> > Memset is stable at 278 Mb/s.
> >
> > Gary's implementation is much faster, copies still 260 Mb/s when euqlly placed,
> > and 230 Mb/s otherwise. Memset is the same as the current one.
>
> Any idea what the attainable performance is for the cpu you are using?
> Since both memset and memcpy are running at much the same speed
> I suspect it is all limited by the writes.
>
> 272MB/s is only 34M writes/sec.
> This seems horribly slow for a modern cpu.
> So is this actually really limited by the cache writes to physical memory?
>
> You might want to do some tests (userspace is fine) where you
> check much smaller lengths that definitely sit within the data cache.
>
> It is also worth checking how much overhead there is for
> short copies - they are almost certainly more common than
> you might expect.
> This is one problem with excessive loop unrolling - the 'special
> cases' for the ends of the buffer start having a big effect
> on small copies.
>
> For cpu that support misaligned memory accesses, one 'trick'
> for transfers longer than a 'word' is to do a (probably) misaligned
> transfer of the last word of the buffer first followed by the
> transfer of the rest of the buffer (overlapping a few bytes at the end).
> This saves on conditionals and temporary values.

I am fine with Matteo's memcpy.

The two culprits seen by the `perf top -Ue task-clock` output during the
tcp and ucp network are

> Overhead  Shared O  Symbol
>  42.22%  [kernel]  [k] memcpy
>  35.00%  [kernel]  [k] __asm_copy_to_user

so we really need to optimize both memcpy and __asm_copy_to_user.

The main reason of speed up in memcpy is that

> The Gary's assembly version of memcpy is improving by not using unaligned
> access in 64 bit boundary, uses shifting it after reading with offset of
> aligned access, because every misaligned access is trapped and switches to
> opensbi in M-mode. The main speed up is coming from avoiding S-mode (kernel)
> and M-mode (opensbi) switching.

which are in the code:

Gary's:
+       /* Calculate shifts */
+       slli    t3, a3, 3
+       sub    t4, x0, t3 /* negate is okay as shift will only look at LSBs */
+
+       /* Load the initial value and align a1 */
+       andi    a1, a1, ~(SZREG-1)
+       REG_L    a5, 0(a1)
+
+       addi    t0, t0, -(SZREG-1)
+       /* At least one iteration will be executed here, no check */
+1:
+       srl    a4, a5, t3
+       REG_L    a5, SZREG(a1)
+       addi    a1, a1, SZREG
+       sll    a2, a5, t4
+       or    a2, a2, a4
+       REG_S    a2, 0(a0)
+       addi    a0, a0, SZREG
+       bltu    a0, t0, 1b

and Matteo ported to C:

+#pragma GCC unroll 8
+        for (next = s.ulong[0]; count >= bytes_long + mask; count -=
bytes_long) {
+            last = next;
+            next = s.ulong[1];
+
+            d.ulong[0] = last >> (distance * 8) |
+                     next << ((bytes_long - distance) * 8);
+
+            d.ulong++;
+            s.ulong++;
+        }

I believe this is reasonable and enough to be in the upstream.

Akira


>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
