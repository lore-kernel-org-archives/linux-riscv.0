Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8AB2C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 15:32:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88802601FA
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 15:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88802601FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wsXVVJABl3/2jvmE4I/7K+4btLwUJ8p1uJto0HDVN5s=; b=qjTGdbWZmHkKtC
	1g3gj6EZrbPJ8yvSgth3Cu79jTycRrlH++FCQV7qjzHPv9EBLOLG96oI6Rm0hYoeUTXdzrll8Yany
	GahAwiHwMiWT5V8oAR9Rs1UojJQrkSOlwzafE2L183BAYsyzvz2K8PzjXQ9/yAHWOdLTu7XeFHkFJ
	fhT/epnyg/OkRsuq4QORGPnVodvjD2G9Bz8GKt4Xi54KZVWZ/GryuZoRZm+VthwmmK2OrEJWkAaCT
	I7norBZYr/0iZRR35BuYpUAsUjKYpQZGp+je6YlW+A16/1s0rzvkDBU8eHSgbzpfyNmEmKZlbxguX
	Nd/7JLKoy4p4cZEq/e4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mda3C-0088nn-Sp; Thu, 21 Oct 2021 15:32:14 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mda39-0088lj-3I
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 15:32:12 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MBltM-1mY7SW2As0-00CC05 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct
 2021 17:32:08 +0200
Received: by mail-wr1-f46.google.com with SMTP id u18so134645wrg.5
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 08:32:08 -0700 (PDT)
X-Gm-Message-State: AOAM530nFhAXXZ2lprXNy1BVkcfQOPaqkgALhvFnfv1BNubYkThOs1qx
 fHRishTGrWt9PI5IXR7UbVsLP/9celfRZGzjxYI=
X-Google-Smtp-Source: ABdhPJzHm2YM9grQWPsO7s+9VbY2hH0uDX3eyS0BLSrV4b7iJ7a+z6YKWe2zKAaCfne7uwMOoRlh9ifciSqyUeG2CkU=
X-Received: by 2002:adf:b1c4:: with SMTP id r4mr8105105wra.428.1634830328087; 
 Thu, 21 Oct 2021 08:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <YXFli3mzMishRpEq@hirez.programming.kicks-ass.net>
 <CAK8P3a2+=9jjyqN5dMOb4+bYJy=q5G3CxFaCW+=4xryz-S=zYA@mail.gmail.com>
 <YXGD5OFbI7TEDFTr@hirez.programming.kicks-ass.net>
In-Reply-To: <YXGD5OFbI7TEDFTr@hirez.programming.kicks-ass.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Oct 2021 17:31:51 +0200
X-Gmail-Original-Message-ID: <CAK8P3a14NUvo40GFY5DfQcF28OO22=BiHJO1TzBTEMK0RAwtHg@mail.gmail.com>
Message-ID: <CAK8P3a14NUvo40GFY5DfQcF28OO22=BiHJO1TzBTEMK0RAwtHg@mail.gmail.com>
Subject: Re: [PATCH] locking: Generic ticket lock
To: Peter Zijlstra <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, 
 Ingo Molnar <mingo@kernel.org>, Waiman Long <longman@redhat.com>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christophm30@gmail.com>, 
 Stafford Horne <shorne@gmail.com>
X-Provags-ID: V03:K1:bY/a9CeC94ZCwxUyv3GNEBVQICkyzQ/rjnXs5uMTXk9zmrbIYzp
 BKM94N0/Ls5kHJ5AN+ORaDpy+tfj/gEz8F+3bgRuGq9zYAHGdjtuqG/hILUvn86KDY0Ztyf
 q1wI9PBvLc6Sn0PSuBwyM6d9PFdbz1L8LjFWJyaC64DR95bUug+iiln+NAfx8TTkBCkSXYt
 Pq6+pmQi6cqo6/ZaicW+A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5pe4+C6j1nc=:QowSqP68vKwXFrtKt/LiDL
 r9sUYGMGoQFEKPya4eE03cXq049ulJ1RcUyhyZYH8jWktSgslH92K591o2Z17xm8IG7XJeJB5
 DtsG/7RnyVRRtOiWuJ0M1v7jHyXDSf/+h4CUg90IUwqn4KV2+sy1br41Hsgkd4O7gb1ShGE2X
 8RRHWj12QMa9qy35U0AsExNC81PneFGQxTt71mtyqidnQ368d9MRXIiOUN66CjkHXWjUZ2CzT
 zK7LowZ3nSBOXLDIKz8b/50oZW/lWN3CM8R33mSRi0NoHXQJ00KjtKX93O3os6h2IOMmY9AUl
 uFvlT91bYsFq6eFjX6XZ1S6vsvdL+D/Dy2IQDSb5Eb6aZK1MVh3hvtFbnJwZITTKj5wy4qsU2
 OzplVOaGUCGLLjFBSWW8RsKaI3TEhh1VZyNSPJzpk+5LP/u9dHYjvMWqYap/pMUgag9i+lr3A
 hMTXngNJynFj3v1N7LQj6NuU23oFlk4O75MjEhU4C99kEqZQ7TvWVbB8V1uGa//FACxCk+hfX
 OzJXVaLr61rt6vKUyIypTW+TfWLWBZzLiINd2HsISM5CsW3SgU7qCQya5Nihstn0M64NTcJ2Q
 YP4ZNMqiyG2wdhBLXSudeCNMJQ1w/W/b+254okT0TB1LAacfFU3IR0nmBV9qn7jg5DQ5Rimzq
 2vOuqvdc2mLWtwcAHL9ErMTAXaXefBtz3lOUgFrGsIiQKoEZlo9vVRUK3zyn+8Qm1Hi4hRo1d
 ODWzd9S+dI2aHKWKNcf0rVTtvedblIvx5yy1kvBvPT5ob0E6bclkq49QGGsBZ6KDmXGpRP4Uq
 SrhWwzWcfOEeFbfkbsnXMAX2/gn8ut29tu3HoFY18ELDpT6SEU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_083211_444719_E752A863 
X-CRM114-Status: GOOD (  19.36  )
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

On Thu, Oct 21, 2021 at 5:14 PM Peter Zijlstra <peterz@infradead.org> wrote:
> On Thu, Oct 21, 2021 at 03:49:51PM +0200, Arnd Bergmann wrote:
> I think for a load-store arch this thing should generate pretty close to
> optimal code. x86 can do ticket_unlock() slightly better using a single
> INCW (or ADDW 1) on the owner subword, where this implementation will to
> separate load-add-store instructions.
>
> If that is actually measurable is something else entirely.

Ok, so I guess such an architecture could take the generic implementation
and override just arch_spin_unlock() or just arch_spin_lock(), if that
makes a difference for them.

Should we perhaps turn your modified openrisc asm/spinlock.h
and asm/spin_lock_types.h the fallback in asm-generic, and
remove the ones for the architectures that have no overrides
at all?

Or possibly a version that can do both based on
CONFIG_ARCH_USE_QUEUED_SPINLOCKS? That would
let us remove even more architecture specific headers, but
it increases the risk of some architecture using qspinlock
when they really should not.

> > or a trivial test-and-set?
>
> If your SMP arch is halfway sane (no fwd progress issues etc..) then
> ticket should behave well and avoid the starvation/variablilty of TaS
> lock.

Ok, and I guess we still need to keep the parisc and sparc32 versions
anyway.

> The big exception there is virtualized architectures, ticket is
> absolutely horrendous for 'guests' (any fair lock is for that matter).

This might be useful information to put into the header, at least
I had no idea about this distinction.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
