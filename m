Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037A9C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 13:53:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF400611F2
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 13:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF400611F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDiR7BlcOXfJgO9YVmUj90THdq9KYMqQt6Wxz39wyGQ=; b=aq12Bne6xelTB7
	9Yt37lRa1H9zbFrdOtO3EF59ZCitpiw3kIM1kYaCd+fH/q8nWRcglZSO+pWvRFHaOkaHeFQJRaYE5
	J+D32vN4HUKyeSfsV8IV09ZP6xPGvGqQ531mmdaAUWsdlY9jKWEbQqzaPGh5/oFgoiOP0/BVrAUk7
	ZlA0vYB3zOhp5uePZLga59BDxDaEn6P1jh2UvfTnRLJVX9U15j1qVjIKzuAJR6Dph0u+hXPWKVz9v
	ZO5QGlAHuiYgMFqTHLadI871LcXokD+tLmr38lG7vpkIZahjjgGOllea/vDt88bhRx+mHL+B++iF/
	ylFjYHPfISCrBvEKoIVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdYVD-007jW1-IN; Thu, 21 Oct 2021 13:53:03 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdYSS-007iTO-DQ
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 13:50:15 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MnJQq-1n5A312aH6-00jJrf for <linux-riscv@lists.infradead.org>; Thu, 21 Oct
 2021 15:50:07 +0200
Received: by mail-wr1-f45.google.com with SMTP id i12so1206551wrb.7
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 06:50:07 -0700 (PDT)
X-Gm-Message-State: AOAM532ie5+YHljaq24nfQypqM9GKWEKSIDvLYzYKvCx48QQiYDhgl0S
 YnGlqksF/3x6TPnJJOhrOjw27ol0SlfleqxtJDg=
X-Google-Smtp-Source: ABdhPJzFgn79Ic6FqBqH1cvM4ZGB9Dra++hlNfhANl9ybgG+sQ8/6wYtZISF0tQPrg0FbbKYG8md6racZvoc4a5yYuU=
X-Received: by 2002:a05:6000:18c7:: with SMTP id
 w7mr7104304wrq.411.1634824207284; 
 Thu, 21 Oct 2021 06:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <YXFli3mzMishRpEq@hirez.programming.kicks-ass.net>
In-Reply-To: <YXFli3mzMishRpEq@hirez.programming.kicks-ass.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Oct 2021 15:49:51 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2+=9jjyqN5dMOb4+bYJy=q5G3CxFaCW+=4xryz-S=zYA@mail.gmail.com>
Message-ID: <CAK8P3a2+=9jjyqN5dMOb4+bYJy=q5G3CxFaCW+=4xryz-S=zYA@mail.gmail.com>
Subject: Re: [PATCH] locking: Generic ticket lock
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Ingo Molnar <mingo@kernel.org>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christophm30@gmail.com>, 
 Stafford Horne <shorne@gmail.com>
X-Provags-ID: V03:K1:rk9luiv2QLMwItq1CZ0l/5RKSVKLw122z6W4L+0owQUBlgvxg/E
 XCr1WkYdJVxOXNoYFcW9IKwi/a+OZy7n3smgkzsJ8F56RiOKOGNysE9Rpq/DX3xCUiPOd6p
 IoqTCYS1nUk1hJrTubX/hOeHmlRhnyQssoKMKtqwXYJvD7Yqe9CrML2p1TLZcmvvoxdXIL8
 fJvqzLYlFwwnsKKm3qP0g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8DHWvmBFKj8=:cNW5xuWivBWK3YsUV7FDWQ
 Q1eSPJmOWcEvls9hp7LI5bu355P+Wwi0FC60ux72AwvIeYaaj6vfI2RspKDNWeDR29twq4j5h
 5G17kAJp2UPujQW/GNf9L3GRE7EyEjflsQeHaT1BrakdITZF+breTg644AhEEvyVE1XNCS6tl
 lsyppTmQn8rOyUsbLAUzwgTddIYZFfERSPDmaczgkhGEpyKsakkvLlfPnZ/wfakqeje4xirIy
 v7nXJz38RWCSx+s4q8D4zoDH20rtPWHAz6PawTFP4SLGBqPyNSnjoeViBytUPUNofOn7hwRSk
 xxQDV9lC8N7SlA7eP4LB4gAZ3x8o3HWhGPWe+rIWnpaq02NSqLLmU9Q2rRFb/6J2Fo8yWbBUV
 OfTacIju8ZgWcbU4TETBKrgbSI+3w8twjYN9HHE6zrgB0shvwYmRGhHtdiP7ZwvnE8I+IYXni
 eTyOsBEANKsDol7Kw6GYFcqnaKq1wq6n3c3lhGy52Fyx/wljvVdbBlFD+cqbbKCN592d/KvXz
 2/EESaIeub1uIIIckQ8tyvmCmm5wocUF0RAj/7PaVQkY0HoniYrseuDuRm0ZAt4UPe4cJIHAv
 z1YiZRVf6AQHY8WWGwJ4CWscRtz2y6EIMafU1Oum0h7MnccOBOlPZbJh0xMOtjS58vlzkCZCd
 URTp4HCY67bvNKXfD7K19496JFfskGPCqpZKm4CiJVEsTL7D9x7WJr7HRL0EVMWbvuuI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_065012_792294_ACA13BA7 
X-CRM114-Status: GOOD (  13.28  )
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

On Thu, Oct 21, 2021 at 3:05 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Therefore provide ticket locks, which depend on a single atomic
> operation (fetch_add) while still providing fairness.

Nice!

Aside from the qspinlock vs ticket-lock question, can you describe the
tradeoffs between this generic ticket lock and a custom implementation
in architecture code? Should we convert most architectures over
to the generic code in the long run, or is there something they
can usually do better with an inline asm based ticket lock or
a trivial test-and-set?

> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  include/asm-generic/qspinlock.h         |   30 +++++++++
>  include/asm-generic/ticket_lock_types.h |   11 +++
>  include/asm-generic/ticket_lock.h       |   97 ++++++++++++++++++++++++++++++++
>  3 files changed, 138 insertions(+)

If anyone wants to use this for their architecture, feel free to add

Acked-by: Arnd Bergmann <arnd@arndb.de>

to merge it through the respective architecture git tree. If there is more
than one architecture that wants it right now, I could also take them
all through
the asm-generic tree.

          Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
