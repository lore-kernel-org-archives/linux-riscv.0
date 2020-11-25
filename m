Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B238C2D0E4
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 00:52:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E2172151B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 00:52:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NTz0j7o7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uq66iisQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E2172151B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tDQzkq3+WRdoHgh2dVve4VWHV/SX8HULT5OkS/hakcM=; b=NTz0j7o7Kf30kkLClSn2pD6dY
	WyORt4hyw/VePYQrmcn04b/4YQ8W8VKJrlraTPz/5KGINmtIj9AQYvkMVDVZxKOPVHnH9n54JOJQx
	XYcmOEenfwEYloDi3cXbAbO3MsL83jSw74CZ8FSJtw620rWfTThI5QEzexKXFdji/ok2waK8Z8tuf
	fN4yN9u0cOQGP6G1lO+T31MNeMYLxdxCAO4eCE8LyqtpkEXrFWy93gahwiHojjYvViAyKHhm+o8Lk
	pcdEE/d6II9VgHbHXz8H4iOgi1vSlHV4jUkwwqKEC7XccHxLG3eMtOOaE/+RQ9gDoVbztO8JV7BUb
	yxVXSiqdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khj33-0005Lh-74; Wed, 25 Nov 2020 00:52:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khj30-0005Kv-Iz
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 00:52:39 +0000
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A7C9217A0
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 00:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606265556;
 bh=CyLRVh8JtmFuJs0UzEiC19JLYFq/L1Q+qkZ2v4YFjYo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Uq66iisQgQ3PIjtDoE4msOhqb5OHJ3lFF57H0J9pOfOI7izqnpVv7JWsMXjv0WP6+
 Zdt4rAhfJf64SNHy3loP5/dMi5t4SugO1tTpQ4+NM4pqEyQ0Wnj+KgD0sbYyjfKfBg
 66yXHsIfGBf8VrGfRTF8+lDdnuqak9ZLIlSVa1a0=
Received: by mail-lj1-f172.google.com with SMTP id j10so469724lja.5
 for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2020 16:52:36 -0800 (PST)
X-Gm-Message-State: AOAM531rlCzv9SfnoL1HphiBvlFHM4R5iQCJlmnwUZGVtNsB+0CX6u4n
 C1AC/ZypyQ5z7DkbKBzSJO+AQiRCqBPWIsGebwA=
X-Google-Smtp-Source: ABdhPJxXNypMXNrwvl404YxnwDVGzaYXnO59TiupDEKcpkPWd6NZwPa2V/R/J4KGCf3GcXUkVvM9vFT0gdbbTku0XNk=
X-Received: by 2002:a05:651c:213:: with SMTP id
 y19mr325504ljn.250.1606265554826; 
 Tue, 24 Nov 2020 16:52:34 -0800 (PST)
MIME-Version: 1.0
References: <1606225437-22948-1-git-send-email-guoren@kernel.org>
 <1606225437-22948-2-git-send-email-guoren@kernel.org>
 <20201124143931.GI2414@hirez.programming.kicks-ass.net>
In-Reply-To: <20201124143931.GI2414@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 25 Nov 2020 08:52:23 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTBbjOhvvLTd6d5zgb0kskoSJhPW7nmg==4w2wV+OaUgg@mail.gmail.com>
Message-ID: <CAJF2gTTBbjOhvvLTd6d5zgb0kskoSJhPW7nmg==4w2wV+OaUgg@mail.gmail.com>
Subject: Re: [PATCH 2/5] riscv: Add QUEUED_SPINLOCKS & QUEUED_RWLOCKS supported
To: Peter Zijlstra <peterz@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_195238_786146_C1DE1CF3 
X-CRM114-Status: GOOD (  18.06  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Thx Peter,

On Tue, Nov 24, 2020 at 10:39 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Nov 24, 2020 at 01:43:54PM +0000, guoren@kernel.org wrote:
> > diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
> > index 59dd7be..6f5f438 100644
> > --- a/arch/riscv/include/asm/Kbuild
> > +++ b/arch/riscv/include/asm/Kbuild
> > @@ -6,3 +6,6 @@ generic-y += kvm_para.h
> >  generic-y += local64.h
> >  generic-y += user.h
> >  generic-y += vmlinux.lds.h
> > +generic-y += mcs_spinlock.h
> > +generic-y += qrwlock.h
> > +generic-y += qspinlock.h
> > diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> > index 5609185..e178700 100644
> > --- a/arch/riscv/include/asm/cmpxchg.h
> > +++ b/arch/riscv/include/asm/cmpxchg.h
> > @@ -16,7 +16,43 @@
> >       __typeof__(ptr) __ptr = (ptr);                                  \
> >       __typeof__(new) __new = (new);                                  \
> >       __typeof__(*(ptr)) __ret;                                       \
> > +     register unsigned long __rc, tmp, align, addr;                  \
> >       switch (size) {                                                 \
> > +     case 2:                                                         \
> > +             align = ((unsigned long) __ptr & 0x3);                  \
> > +             addr = ((unsigned long) __ptr & ~0x3);                  \
> > +             if (align) {                                            \
> > +             __asm__ __volatile__ (                                  \
> > +                     "0:     lr.w %0, 0(%z4)\n"                      \
> > +                     "       move %1, %0\n"                          \
> > +                     "       slli %1, %1, 16\n"                      \
> > +                     "       srli %1, %1, 16\n"                      \
> > +                     "       move %2, %z3\n"                         \
> > +                     "       slli %2, %2, 16\n"                      \
> > +                     "       or   %1, %2, %1\n"                      \
> > +                     "       sc.w %2, %1, 0(%z4)\n"                  \
> > +                     "       bnez %2, 0b\n"                          \
> > +                     "       srli %0, %0, 16\n"                      \
> > +                     : "=&r" (__ret), "=&r" (tmp), "=&r" (__rc)      \
> > +                     : "rJ" (__new), "rJ"(addr)                      \
> > +                     : "memory");                                    \
> > +             } else {                                                \
> > +             __asm__ __volatile__ (                                  \
> > +                     "0:     lr.w %0, (%z4)\n"                       \
> > +                     "       move %1, %0\n"                          \
> > +                     "       srli %1, %1, 16\n"                      \
> > +                     "       slli %1, %1, 16\n"                      \
> > +                     "       move %2, %z3\n"                         \
> > +                     "       or   %1, %2, %1\n"                      \
> > +                     "       sc.w %2, %1, 0(%z4)\n"                  \
> > +                     "       bnez %2, 0b\n"                          \
> > +                     "       slli %0, %0, 16\n"                      \
> > +                     "       srli %0, %0, 16\n"                      \
> > +                     : "=&r" (__ret), "=&r" (tmp), "=&r" (__rc)      \
> > +                     : "rJ" (__new), "rJ"(addr)                      \
> > +                     : "memory");                                    \
> > +             }                                                       \
> > +             break;                                                  \
> >       case 4:                                                         \
> >               __asm__ __volatile__ (                                  \
> >                       "       amoswap.w %0, %2, %1\n"                 \
>
> I'm pretty sure there's a handfull of implementations like this out
> there... if only we could share.
Michael has sent qspinlock before, ref to Link below. He reused mips' code.

Link: https://lore.kernel.org/linux-riscv/20190211043829.30096-1-michaeljclark@mac.com/

Which short xchg implementation do you prefer (Mine or his)?

>
> Anyway, this too should be an independent patch.
Ok, I'll separate it into two patches,
1. implement short xchg
2. qspinlock enabled based on Michael's patch

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
