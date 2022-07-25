Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CB7C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jul 2022 02:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIZZsApeAjpy78f/Iks1rj6gcDkI+6olYtaZnKu4H3I=; b=Vzzcvh1uixP/B9
	CAXNbMAsHOulhvCy+aJqt75ea10N5oxk43P5/6KXZs74Gu6agK1IMGbT/5yCjpZzAcrdi6raXfQKB
	pE52heP9/W2DvybXT5g4Yv0HVsvW3wtgQViduhHHNi3HS9A93olLW9Py4MLzxIVjWgmaPkyHD+fp1
	pNiHWgxs0GjUqwgMA95UfqVFhyEKGjEFL76eKBg8+Vo+Xt7Z+62i0BRn27G861wu3WF+O8Xi+YCqB
	G1eCFteqBNXsHipwlPVMePPHueVkTQIKg3u65414g0hdyOS72UkTf6m0iGR0AlqsvNUIKShOg9N5C
	pkmkZ8XLu9HSxuQ6KXEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFnrw-0012S2-Mi; Mon, 25 Jul 2022 02:30:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFnru-0012Ix-Lf
	for linux-riscv@lists.infradead.org; Mon, 25 Jul 2022 02:30:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1DC9CB80D95
	for <linux-riscv@lists.infradead.org>; Mon, 25 Jul 2022 02:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA71DC341D0
	for <linux-riscv@lists.infradead.org>; Mon, 25 Jul 2022 02:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658716247;
	bh=3Y9WvVFmM0ECeCdNXsmEZ7oye5Th6AVxYZiU45ImmHU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cEuJkFIdcL5eA7zjDyjUv9yKsNHztpEx7BMp/JTYeclXqUbdshF8Z7qyg7afdtOxJ
	 cKWnbIwoBAjTtl4ROi0UWFHUDtd6zyI+gPNwwIpIeBgy91cisCCMG958Qyo3rrp4X9
	 Lts5FZqB7o7lMb+AMKKAnTENIHyKaOI4pxU0yc1u18J11SI9GqGADYpqRmluqFLIX+
	 thUwqBYXhfbe5qQ2Tn4wdQ9/iEs9t3pgRX4mx6F6tHKRG+aiP3PGg5F6Uvvfve1UTw
	 HvixzjQZsn0JAB4mP7blWkoTH4wGyj/ZACoaKYbtTsmol1LcNZ3OThCtLRYgw6cnmX
	 g2v7wzjNM8YEQ==
Received: by mail-lj1-f176.google.com with SMTP id b34so6367437ljr.7
        for <linux-riscv@lists.infradead.org>; Sun, 24 Jul 2022 19:30:47 -0700 (PDT)
X-Gm-Message-State: AJIora8pzYwBc6gCjBExqaflnunK5/wXMUrfEHVy0yoRA4iz41D2NRMV
	8wmOhFM8rxXFcjKFEiUonWVIecVUhgy8hhHhy4I=
X-Google-Smtp-Source: AGRyM1tXIh5WGwVRcYfmMTXpag8CZiQxI7uiBibR6shkAufg4w1IPkQYQBRcVwNoJ3589Vdgit+RMHCz3mz7y70I8CM=
X-Received: by 2002:a2e:309:0:b0:25e:a57:8337 with SMTP id 9-20020a2e0309000000b0025e0a578337mr371519ljd.50.1658716245827;
 Sun, 24 Jul 2022 19:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220724122517.1019187-1-guoren@kernel.org> <20220724122517.1019187-11-guoren@kernel.org>
 <0ea27d18-6d45-9673-38b7-78d59325f9d5@redhat.com>
In-Reply-To: <0ea27d18-6d45-9673-38b7-78d59325f9d5@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 25 Jul 2022 10:30:33 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSf4EX_QpbfgKdYtHK-gShsqh5UcLi5xiMcVDRWx1VxHg@mail.gmail.com>
Message-ID: <CAJF2gTSf4EX_QpbfgKdYtHK-gShsqh5UcLi5xiMcVDRWx1VxHg@mail.gmail.com>
Subject: Re: [PATCH V8 10/10] csky: Add qspinlock support
To: Waiman Long <longman@redhat.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@redhat.com>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Muellner <cmuellner@linux.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Laight <David.Laight@aculab.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_193051_053443_3C83A62D 
X-CRM114-Status: GOOD (  22.70  )
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

On Mon, Jul 25, 2022 at 10:08 AM Waiman Long <longman@redhat.com> wrote:
>
> On 7/24/22 08:25, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Enable qspinlock by the requirements mentioned in a8ad07e5240c9
> > ("asm-generic: qspinlock: Indicate the use of mixed-size atomics").
> >
> > C-SKY only has "ldex/stex" for all atomic operations. So csky give a
> > strong forward guarantee for "ldex/stex." That means when ldex grabbed
> > the cache line into $L1, it would block other cores from snooping the
> > address with several cycles.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > ---
> >   arch/csky/Kconfig               | 16 ++++++++++++++++
> >   arch/csky/include/asm/Kbuild    |  2 ++
> >   arch/csky/include/asm/cmpxchg.h | 20 ++++++++++++++++++++
> >   3 files changed, 38 insertions(+)
> >
> > diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
> > index dfdb436b6078..09f7d1f06bca 100644
> > --- a/arch/csky/Kconfig
> > +++ b/arch/csky/Kconfig
> > @@ -354,6 +354,22 @@ config HAVE_EFFICIENT_UNALIGNED_STRING_OPS
> >         Say Y here to enable EFFICIENT_UNALIGNED_STRING_OPS. Some CPU models could
> >         deal with unaligned access by hardware.
> >
> > +choice
> > +     prompt "C-SKY spinlock type"
> > +     default CSKY_TICKET_SPINLOCKS
> > +
> > +config CSKY_TICKET_SPINLOCKS
> > +     bool "Using ticket spinlock"
> > +
> > +config CSKY_QUEUED_SPINLOCKS
> > +     bool "Using queued spinlock"
> > +     depends on SMP
> > +     select ARCH_USE_QUEUED_SPINLOCKS
> > +     help
> > +       Make sure your micro arch LL/SC has a strong forward progress guarantee.
> > +       Otherwise, stay at ticket-lock/combo-lock.
>
> "combo-lock"? It is a cut-and-paste error. Right?
Yes, it's a typo. No combo-lock for csky.

>
> Cheers,
> Longman
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
