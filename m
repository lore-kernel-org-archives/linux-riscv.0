Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D7EC4360C
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 12:38:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 343A5619EA
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 12:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 343A5619EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xh2WPqLaEb/mrKJr8zF8sUI8Vo8YEbjx2QakAZUIt3Y=; b=c4QzRGqqO1ZfTuyndjbPKtXUo
	KCZUo/D+lowmXqjNmev0kAdscNQS133QTl4CvK4YQNu3bV7A5HNQ4jZWZDbNnrRzjmkh0gTd6E7Ey
	5WN8SqQx5HyEc0hfeCSWtP2ktISUiMNGnwnEXmphvqRWPr69AEMsm6TJS4UDxTDIXAPxw7hwNr9V7
	5yJFfJL6y2LkT7bzKaIvDZOlcdqg1CIBgwGvVPnxjPzMXUVajpID3wVFNJfaBBL0jDWPs7UsAVahq
	hGX9Lfn2YinaHibYjILvoVOvZxIj0cM1yg5Yi0G7CxGqgyobgvQGmkjjFcpDDkDqnGed1Kq+WD4Qv
	c2CJKiRqA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRa0H-006ZEq-HW; Wed, 31 Mar 2021 12:31:21 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRa0D-006ZDx-UV
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 12:31:19 +0000
Received: by mail-pl1-x633.google.com with SMTP id y2so7819379plg.5
 for <linux-riscv@lists.infradead.org>; Wed, 31 Mar 2021 05:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=r0wurEgCXpwLk8V8e0yBHXS1a2Ee8JuUUWzmEE/Af/M=;
 b=HYh87bVhVdS5VrDKKYPgUhVykPRkLtiX6qLzPszCtA/84fkP12rXge+IibQm4nJekx
 siTu2pLi/bDAdAuLX1RZhevc8zPWbB9UM38zuMDDi/jj5sfmyvqNzG3pjCzF82ECILC8
 2CIYpBMZ/903hzzzU7jjx4Ei+cDy05KY614b0g1LqVH2APwryUwpCDRKtuJcYL7HxsYW
 gYJC/ERallREgYeMhxGEBttYuQ6Zi5xKrAyUsLcEbgG+hQPgBWCHTTjyUtmuxeFvCXjv
 JYzjZuCL9V2FrnCuQZvJCSp4jaOqcLHTXRwY9ot+U50D6yI7Qny5PrtmrI1r252xY/Td
 y5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r0wurEgCXpwLk8V8e0yBHXS1a2Ee8JuUUWzmEE/Af/M=;
 b=JsAoEiPnkWk/t8B1FPZRRiKMkh5x4e705EsXJSsi8GgJDJPA0zNSbTGda/Izu2gErK
 gyjaWlf16oVMcjVj7lQ1HBqNDFPAPTL9NuBvC6PY1XhBVoxjmaj4M8j+DEVc/pwa9m3n
 Hm+cxV7+AgiO3tenyB19fDFxK54l/ZQI8yDRn8wPXmYmsvWWkZRf2j87XyYvKj4rURmZ
 Q1S+KXBtePd63v3ej9jV18cwZwiOfrFCBVpVwuySAMR1kDRhRasuYs0w4N9W/swzD/GK
 ssI+63+121jJpAp2q6AoudRKmY5tmtoU2ofOxbx+NjIEy3+yEQGVtedh592sm2ntpVcE
 j1/Q==
X-Gm-Message-State: AOAM531AzhkiXZHCHiToQfQLfj/UZ16/UqfL4Zgcdsri+RNq+ab1U1ky
 yin8mnyzudYLTYZ3vZ++Cs0=
X-Google-Smtp-Source: ABdhPJyG4a82R/BbIuiJluEQk1BqTadUrv91d79dqwaxsWtGJSEWE5901Qw1cGhEGO+9XsI5urPZDQ==
X-Received: by 2002:a17:90a:9385:: with SMTP id
 q5mr3263996pjo.121.1617193870227; 
 Wed, 31 Mar 2021 05:31:10 -0700 (PDT)
Received: from localhost (g139.124-45-193.ppp.wakwak.ne.jp. [124.45.193.139])
 by smtp.gmail.com with ESMTPSA id
 r1sm2026366pjo.26.2021.03.31.05.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 05:31:09 -0700 (PDT)
Date: Wed, 31 Mar 2021 21:31:07 +0900
From: Stafford Horne <shorne@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Guo Ren <guoren@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <20210331123107.GF1171117@lianli.shorne-pla.net>
References: <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
 <YGNNCEAMSWbBU+hd@hirez.programming.kicks-ass.net>
 <20210330223514.GE1171117@lianli.shorne-pla.net>
 <CAK8P3a0hj2pYr-CuNJkjO==RafZ=J+6kCo4HTWEwvvRXPcngJA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0hj2pYr-CuNJkjO==RafZ=J+6kCo4HTWEwvvRXPcngJA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_133118_067464_E7C1CFDE 
X-CRM114-Status: GOOD (  21.12  )
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

On Wed, Mar 31, 2021 at 09:23:27AM +0200, Arnd Bergmann wrote:
> On Wed, Mar 31, 2021 at 12:35 AM Stafford Horne <shorne@gmail.com> wrote:
> >
> > I just want to chime in here, there may be a better spot in the thread to
> > mention this but, for OpenRISC I did implement some generic 8/16-bit xchg code
> > which I have on my todo list somwhere to replace the other generic
> > implementations like that in mips.
> >
> >   arch/openrisc/include/asm/cmpxchg.h
> >
> > The idea would be that architectures just implement these methods:
> >
> >   long cmpxchg_u32(*ptr,old,new)
> >   long xchg_u32(*ptr,val)
> >
> > Then the rest of the generic header would implement cmpxchg.
> 
> I like the idea of generalizing it a little further. I'd suggest staying a
> little closer to the existing naming here though, as we already have
> cmpxchg() for the type-agnostic version, and cmpxchg64() for the
> fixed-length 64-bit version.

OK.

> I think a nice interface between architecture-specific and architecture
> independent code would be to have architectures provide
> arch_cmpxchg32()/arch_xchg32() as the most basic version, as well
> as arch_cmpxchg8()/arch_cmpxchg16()/arch_xchg8()/arch_xchg16()
> if they have instructions for those.

Thanks for the name suggestions, it makes it easier for me.

> The common code can then build cmpxchg16()/xchg16() on top of
> either the 16-bit or the 32-bit primitives, and build the cmpxchg()/xchg()
> wrapper around those (or alternatively we can decide to have them
> only deal with fixed-32-bit and long/pointer sized atomics).

Yeah, that was the idea.

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
