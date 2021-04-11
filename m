Return-Path: <SRS0=IRtM=JI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192D5C433B4
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Apr 2021 21:12:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6526E6103D
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Apr 2021 21:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6526E6103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Uu1si+66JbNbK3ING44IgD8svgXRYbEjSiQ+zvn+sao=; b=mjLJl/626IQXyafZXsmUGYgZR
	VI5o1KJF/7oe69M8M+6pszcbbo66JpZldNSnmtGgU6j19QO+vhCPSU0XTZwe0USL4ujPIODf7lWnk
	plP6hGSKngaY6ttMxUXvkXv0qeG/4qHSQuug8Mj2NVrYv7sZa/UwE0QKd8CcfXJANXFF/A093aLsr
	LK139DP4+RGt38W1iz5uROioLHtsbzaFyaAkplax2nEDjXpvj4uC5LI1j2S6IKwna/oC1WiEdqKzJ
	lJKQpTbLoFl3a8Ap6h4A+x+A5wHniQGUY2riOZeQXPMds6H8CMyDo8Xu2AAXLBATbER8+otW5Ow66
	xwEDSLkgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVhMx-0056Vi-Br; Sun, 11 Apr 2021 21:11:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVhMu-0056Vb-7O
 for linux-riscv@desiato.infradead.org; Sun, 11 Apr 2021 21:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=6xOdm+Zk4/ZZ/vvuWQaRhSpOzrzYPOE+3wRzoAL0QmI=; b=Jvc/CGRwrGmvYkkrNZwI1bnG/A
 XUVelV4+OQtNV4vuyNs8zlWaaZf86T6Ij4rcdk+byRGZHwcQY9R2DNxcErTbq3J1GXcCB5HBJ4SVP
 SfX0NE0sJq0j4N1u+H39eSuDZcXYpjZMVXQ4iAlhXA0KPswrHazjuZY/jWOCxBWQ+ekywC8Di25EQ
 KueRIm/biXW//KtT5OdY3bIXHoTxPli/LAa09+VBQxWJu+ap5+QmdXTszkPEz7/MCQjggb4O1PnXE
 ClZmFEgTLeFpr1c9qDk5aDOzyikzU3u18St1gPPZQkZ5nFAQGWAbPPTOROLRAHzXT8clemJ5R8JMH
 Lf/Vp9zQ==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVhMr-005kH6-CY
 for linux-riscv@lists.infradead.org; Sun, 11 Apr 2021 21:11:43 +0000
Received: by mail-pf1-x430.google.com with SMTP id a85so7427526pfa.0
 for <linux-riscv@lists.infradead.org>; Sun, 11 Apr 2021 14:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6xOdm+Zk4/ZZ/vvuWQaRhSpOzrzYPOE+3wRzoAL0QmI=;
 b=v/tHpZPS+OJvJQ4G+VIJMcUyV5j85u/apZQ0K7QaKLveC1QbRSZ+L6qYrvc8Bqsfpl
 HOYzLz3xv1iJBYs8XqHGCBQrMC0HPXNBSQWoNi7lIYGzwn+6OZAtXbFTSReUPQ92Xn1D
 w1LVzXtRqt+1pdYMx/qniqq1IyT+YwCgT6GhcCu4urKSDSzaIUANKYGZNDk4gX7UGTWY
 ftIbP8qJPm8neCnzIRDBSF8Y2E+Eawi5rCeT6r1sqaU6osptDjJD+9kpRjTWd0MC7alT
 pF6C+JOhNWBmPJHQV0c5nPjCtxGSjSLLsQVJlxgQesNUHL3ZowCUyTVzCOkyuWNdu7JT
 T1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6xOdm+Zk4/ZZ/vvuWQaRhSpOzrzYPOE+3wRzoAL0QmI=;
 b=kcWd2aLNzcFovRzzkYlY/PflXOTCtZk/LA1T/Apa+sMKFXXgAw4xI+dPpAErQ57KhG
 HrnTmpxhHnjPguBPd/VZK3ADMJJyiCDjphvSWr5qy+XO5K4u9QYXSas1Bf+zaNzeXi7p
 aAWYro+Fp3s1dJPCyw/2Nt5NNuQEWpa4LVmczOURJ3h8GX0cMJb4wcBnPGpk2txSMiau
 HVx1uVgaXq0sMHXIj5p9HQY3/WqvwRQmq3HQnDXPYcHuIeIKIQ5wMj5UAOG+QSYrdLNG
 +pFyi2boQLJTdZIPjNd/0i8IDDawjykHljMHEJNPGhZYCs6MlP/FnWjwuyDNqlAOyUDg
 55pQ==
X-Gm-Message-State: AOAM532c1iA4iHA0QsdhuQzjgX/1Nr6OXyCOEuchJDNhT694TPtltJsA
 B0oygFdu5O6+c1O3iK0YDjx6Vg==
X-Google-Smtp-Source: ABdhPJw4gxZir6kSGD3JTBMYlSDlpics5szHwKrwILMYiVM3H0WGzXT1v2ibASqqnkrWcGvmR5V2zw==
X-Received: by 2002:a63:f008:: with SMTP id k8mr23555000pgh.15.1618175500173; 
 Sun, 11 Apr 2021 14:11:40 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t5sm2582384pjy.8.2021.04.11.14.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 14:11:39 -0700 (PDT)
Date: Sun, 11 Apr 2021 14:11:39 -0700 (PDT)
X-Google-Original-Date: Sun, 11 Apr 2021 14:11:37 PDT (-0700)
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
In-Reply-To: <CAAhSdy1JHLUFwu7RuCaQ+RUWRBks2KsDva7EpRt8--4ZfofSUQ@mail.gmail.com>
CC: peterz@infradead.org, guoren@kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, guoren@linux.alibaba.com,
 catalin.marinas@arm.com, will.deacon@arm.com, 
 Arnd Bergmann <arnd@arndb.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: anup@brainfault.org
Message-ID: <mhng-0bf68290-a014-43d7-b193-8ac839c5433a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_141141_451428_944FA82A 
X-CRM114-Status: GOOD (  28.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 24 Mar 2021 05:53:51 PDT (-0700), anup@brainfault.org wrote:
> On Wed, Mar 24, 2021 at 6:08 PM Peter Zijlstra <peterz@infradead.org> wrote:
>>
>> On Wed, Mar 24, 2021 at 05:58:58PM +0530, Anup Patel wrote:
>> > On Wed, Mar 24, 2021 at 3:45 PM <guoren@kernel.org> wrote:
>> > >
>> > > From: Guo Ren <guoren@linux.alibaba.com>
>> > >
>> > > This patch introduces a ticket lock implementation for riscv, along the
>> > > same lines as the implementation for arch/arm & arch/csky.
>> > >
>> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
>> > > Cc: Will Deacon <will.deacon@arm.com>
>> > > Cc: Peter Zijlstra <peterz@infradead.org>
>> > > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
>> > > Cc: Anup Patel <anup@brainfault.org>
>> > > Cc: Arnd Bergmann <arnd@arndb.de>
>> > > ---
>> > >  arch/riscv/Kconfig                      |   1 +
>> > >  arch/riscv/include/asm/Kbuild           |   1 +
>> > >  arch/riscv/include/asm/spinlock.h       | 158 ++++++++++++--------------------
>> > >  arch/riscv/include/asm/spinlock_types.h |  19 ++--
>> >
>> > NACK from myside.
>> >
>> > Linux ARM64 has moved away from ticket spinlock to qspinlock.
>> >
>> > We should directly go for qspinlock.
>>
>> I think it is a sensible intermediate step, even if you want to go
>> qspinlock. Ticket locks are more or less trivial and get you fairness
>> and all that goodness without the mind bending complexity of qspinlock.
>>
>> Once you have the ticket lock implementation solid (and qrwlock) and
>> everything, *then* start to carefully look at qspinlock.
>
> I do understand qspinlock are relatively complex but the best thing
> about qspinlock is it tries to ensure each CPU spins on it's own location.
>
> Instead of adding ticket spinlock now and later replacing it with qspinlock,
> it is better to straight away explore qspinlock hence my NACK.
>
>>
>> Now, arguably arm64 did the heavy lifting of making qspinlock good on
>> weak architectures, but if you want to do it right, you still have to
>> analyze the whole thing for your own architecture.
>
> Most of the RISC-V implementations are weak memory ordering so it
> makes more sense to explore qspinlock first.

I know I'm somewhat late to the party here.  I talked with Will (and 
to a lesser extent Peter) about this a week or two ago and it seems the 
best way to go here is to start with ticket locks.  They're simpler, and 
in Arm land they performed better until we got to the larger systems.  
Given that we don't have any high performance implementations of the 
RISC-V memory model (and likely won't any time soon) it's hard to reason 
about the performance of anything like this, but at a bare minimum 
having fair locks is a pretty big positive and ticket locks should have 
very little overhead while providing fairness.

IMO the decision between ticket and queueing locks is really more of a 
property of the hardware/workload than the ISA, though there are of 
course some pretty deep ISA dependencies than can make one saner than 
the other.  It seems best to me to just allow users to pick their own 
flavor of locks, and at least PPC is already doing that.  I threw 
together a quick asm-generic ticket lock that can be selected at compile 
time, but I want to spend some more time playing with the other 
architectures before sending anything out.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
