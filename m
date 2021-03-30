Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71086C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 22:35:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A278619C2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 22:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A278619C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d/taEpTN+QCM5F3X5UY5RHZf8c7hqDxLkuMgmgDKRis=; b=hCVQbASaH10ucyu/EMPaRum9Q
	iaAxPq7U0CwdY8hRs2xFb6kFAvgK4gOvEBBIDWHJ/IL4fBut7CcqBJNbOunQagabZmHgwHPCu8/O1
	9DIcZ6LXvI95f2qBT6ehgxhUByYLz67xpm7Su7WLrIT60ztiEYr3+5/L6A4uZPjqT1c8BU3Ayu8zr
	DK33SBPXcbqza0UBdfBOO6hryMmoU2Y9oMEa6J9QEGzpBwryIC1i49BTJmEpFkQ4ZgPn5YtRrRgmg
	G84+3fPJIfvoSB/58o2wI/NjAYkG5omKwy55ZZ7c+zJDD6h07AbcsqKkGfkfY90gnJg+GmaTYOOM7
	lkXlM01LQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRMxO-0051IF-IK; Tue, 30 Mar 2021 22:35:30 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRMxG-0051HC-5J
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 22:35:26 +0000
Received: by mail-pj1-x102c.google.com with SMTP id gb6so8519146pjb.0
 for <linux-riscv@lists.infradead.org>; Tue, 30 Mar 2021 15:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MIKmUtb8xO+Dq6yKmOyCR/vq4cKBspfYEllac90t9ag=;
 b=u7XY8xoVgbo8DgwHawUEw/3qA/7IKbnKlWt2hjLE7MtthU8JObswEgN2cDtIX89igu
 UFK/ZOQwBENrZIH3xfFYVhXUCz4yRASvQOOaLFjaxHjXZJ2Twn/zgR0DDpGv/pG6w5M7
 slD9Sc9vt5A1uiHNm64YralGtKOZ9mgov1MEdGTdmo58K+i/OudXj5gpQa0wXILTk5gp
 8NIXyPBtIhKuIJj4zDqsqMNBjSWys1s0jknABPSDMKoPnKFPLjzZ6Ak1TpIlgcC+nCdw
 nCKwHJ8Xa8vTgufrtKp3xnHcO0IIxI5f2uDnJVhIpIvzfDOwv+v4prtROYXsoCZbXaCl
 H/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MIKmUtb8xO+Dq6yKmOyCR/vq4cKBspfYEllac90t9ag=;
 b=Wgr3IVzMuVI9FFxwA+HJ36rpYC0gOLcj9FDPQDaM7a5/5czIq87fAG26w7czR7Ji0N
 9bdvS4ITlbWYClEABzYnLUa66ZK+f8AqJ9FEUmY/u6/NEZ+bdXTU6S6Bp1QA4neI6pfD
 W0wBgHTH5Fys0yLpR+M0Yum1ENBsAI/NrGnDmA172Gh+r0Ma2l7O2OBpBS45II3q1saC
 0hedRQilyBcAGWiJHShgODjKGCeUGvUhNtDYkFlYn4WA4SV2dGzTD3GzUkYLIGWu3xB9
 8RaNdMB+8ZZkoZo6bq7X+2aQ+LuNYUMs9ped343RpEIBw1Uf9Jlrd0meah/Obwjp4E4V
 yKuA==
X-Gm-Message-State: AOAM532cXxbnkE4pjvb5o9WVvJFM1z5VVJ7hNSPOKZJ8J7OPgNBjc2ru
 VfSgsCnXSgt09pWgdFPkZVQ=
X-Google-Smtp-Source: ABdhPJxqxS2YDuahl9PNg4VAillcg0SzefNJodUtgbgZj+qPO8g6vAlXW4UHUCHopV7NROqeoTUwOw==
X-Received: by 2002:a17:90a:c902:: with SMTP id
 v2mr511004pjt.144.1617143717745; 
 Tue, 30 Mar 2021 15:35:17 -0700 (PDT)
Received: from localhost (g139.124-45-193.ppp.wakwak.ne.jp. [124.45.193.139])
 by smtp.gmail.com with ESMTPSA id
 w5sm218189pge.55.2021.03.30.15.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 15:35:16 -0700 (PDT)
Date: Wed, 31 Mar 2021 07:35:14 +0900
From: Stafford Horne <shorne@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Guo Ren <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <20210330223514.GE1171117@lianli.shorne-pla.net>
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
 <YGNNCEAMSWbBU+hd@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YGNNCEAMSWbBU+hd@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_233524_622878_0F184F97 
X-CRM114-Status: GOOD (  28.44  )
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

On Tue, Mar 30, 2021 at 06:08:40PM +0200, Peter Zijlstra wrote:
> On Tue, Mar 30, 2021 at 11:13:55AM +0800, Guo Ren wrote:
> > On Mon, Mar 29, 2021 at 8:50 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Mon, Mar 29, 2021 at 08:01:41PM +0800, Guo Ren wrote:
> > > > u32 a = 0x55aa66bb;
> > > > u16 *ptr = &a;
> > > >
> > > > CPU0                       CPU1
> > > > =========             =========
> > > > xchg16(ptr, new)     while(1)
> > > >                                     WRITE_ONCE(*(ptr + 1), x);
> > > >
> > > > When we use lr.w/sc.w implement xchg16, it'll cause CPU0 deadlock.
> > >
> > > Then I think your LL/SC is broken.
> > >
> > > That also means you really don't want to build super complex locking
> > > primitives on top, because that live-lock will percolate through.
> 
> > Do you mean the below implementation has live-lock risk?
> > +static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
> > +{
> > +       u32 old, new, val = atomic_read(&lock->val);
> > +
> > +       for (;;) {
> > +               new = (val & _Q_LOCKED_PENDING_MASK) | tail;
> > +               old = atomic_cmpxchg(&lock->val, val, new);
> > +               if (old == val)
> > +                       break;
> > +
> > +               val = old;
> > +       }
> > +       return old;
> > +}
> 
> That entirely depends on the architecture (and cmpxchg() impementation).
> 
> There are a number of cases:
> 
>  * architecture has cmpxchg() instruction (x86, s390, sparc, etc.).
> 
>   - architecture provides fwd progress (x86)
>   - architecture requires backoff for progress (sparc)
> 
>  * architecture does not have cmpxchg, and implements it using LL/SC.
> 
>   and here things get *really* interesting, because while an
>   architecture can have LL/SC fwd progress, that does not translate into
>   cmpxchg() also having the same guarantees and all bets are off.
> 
> The real bummer is that C can do cmpxchg(), but there is no way it can
> do LL/SC. And even if we'd teach C how to do LL/SC, it couldn't be
> generic because architectures lacking it can't emulate it using
> cmpxchg() (there's a fun class of bugs there).
> 
> So while the above code might be the best we can do in generic code,
> it's really up to the architecture to make it work.

I just want to chime in here, there may be a better spot in the thread to
mention this but, for OpenRISC I did implement some generic 8/16-bit xchg code
which I have on my todo list somwhere to replace the other generic
implementations like that in mips.

  arch/openrisc/include/asm/cmpxchg.h

The idea would be that architectures just implement these methods:

  long cmpxchg_u32(*ptr,old,new)
  long xchg_u32(*ptr,val)

Then the rest of the generic header would implement cmpxchg.

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
