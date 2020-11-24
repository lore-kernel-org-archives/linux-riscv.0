Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509D2C63798
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 15:00:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A48A420782
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 15:00:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NT7vkg5w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPWtNM1W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A48A420782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ab2FZtQCIUGth+whwr8gu8wHQgtn1gi4y7aRxl71lVY=; b=NT7vkg5w4xtD6Orfxoaz3FEiB
	wFs88KreXfPW4yHAGzr+3zVH3vzkL6LvPR6wap74g+IvudkPCC0B6776gA16yYKDB/LXCNF1o/a2s
	9muPAPufmgznusJOtY8/s1pfL7PtvFM+hQLiFGYa44S32aSVtA8JoM9/XzsHaRWSlu422cac13LsL
	hRdpB20zjDp25GUV5c2/LYfrqGJF6x7wR76Vl5OkeIaP53XRlDylSrNqZPgfC64hLXFYeBJVHZtxJ
	CVR6AMZIy0hRajXK8C5u5ZU77CkmXnqBrItPtdy8XEgggHs+IB6ms0sfzOZTEIcDAR5sM5yxL482L
	/ARvA8P4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khZo3-0007Tu-Ne; Tue, 24 Nov 2020 15:00:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khZo0-0007T9-Rf
 for linux-riscv@lists.infradead.org; Tue, 24 Nov 2020 15:00:33 +0000
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C85C3208CA
 for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2020 15:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606230031;
 bh=jrkhRJAQ6WX9jUTFzUQ9ZskOIfBQw4WD0MUtGWKbkbg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZPWtNM1Wg/Ge59qS+TzcYQZgVm+SyaZC8VJhc+aSPEU0VYpi/Ecm8PG2QQ9XCgfIf
 fDUGbvmWq41UYivUC/q/d55pTMHpvYknrEaa2ajJsGa9qwI5DaAecJX4CAC3CcDQ+t
 M47y5q41NFbHfus2nZaBVxVPvJvTW2pekhQJXs64=
Received: by mail-oi1-f177.google.com with SMTP id c80so24085942oib.2
 for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2020 07:00:31 -0800 (PST)
X-Gm-Message-State: AOAM532Q4/9n4/ZcqI0tk49WupxMo1Jhsytj1VWY3WYreUH26GJya34v
 auDp2vsayd3QdBPd3NT+vTuYoxGPfujkpXHCfa4=
X-Google-Smtp-Source: ABdhPJyXhaM6qPmBM6ocwvecSvtLK4YjCoo/ko4z8+MS1WzfLOppPY8CpkPDtOQ+dtRUJNaah5BbhpxRPGAzDRXMxjE=
X-Received: by 2002:aca:180a:: with SMTP id h10mr2843518oih.4.1606230030889;
 Tue, 24 Nov 2020 07:00:30 -0800 (PST)
MIME-Version: 1.0
References: <1606225437-22948-1-git-send-email-guoren@kernel.org>
 <1606225437-22948-2-git-send-email-guoren@kernel.org>
 <20201124143931.GI2414@hirez.programming.kicks-ass.net>
In-Reply-To: <20201124143931.GI2414@hirez.programming.kicks-ass.net>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 24 Nov 2020 16:00:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1ykYmpXtjVbeAjLPY0AtfQTpL9jJ8e6SokiTb=J9UhnQ@mail.gmail.com>
Message-ID: <CAK8P3a1ykYmpXtjVbeAjLPY0AtfQTpL9jJ8e6SokiTb=J9UhnQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] riscv: Add QUEUED_SPINLOCKS & QUEUED_RWLOCKS supported
To: Peter Zijlstra <peterz@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_100033_064057_D048030A 
X-CRM114-Status: GOOD (  15.01  )
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 3:39 PM Peter Zijlstra <peterz@infradead.org> wrote:
> On Tue, Nov 24, 2020 at 01:43:54PM +0000, guoren@kernel.org wrote:
> > diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild

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
>
> I'm pretty sure there's a handfull of implementations like this out
> there... if only we could share.

Isn't this effectively the same as the "_Q_PENDING_BITS != 8"
version of xchg_tail()?

If nothing else needs xchg() on a 16-bit value, maybe
changing the #ifdef in the qspinlock code is enough.

Only around half the architectures actually implement 8-bit
and 16-bit cmpxchg() and xchg(), it might even be worth trying
to eventually change the interface to not do it at all, but
instead have explicit cmpxchg8() and cmpxchg16() helpers
for the few files that do use them.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
