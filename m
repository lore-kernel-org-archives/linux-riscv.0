Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BC3C433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 21:55:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9657F6128E
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 21:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9657F6128E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mWa8oW0knBMDVFqQBN/3r1hmj6kz08cGLnT38Y3/nR8=; b=I8ANs3/GQFel/NdBuyFNJU73p
	ZwYpnpNJy0wMQvqGHEoUTMmPjo9K5hvvMl9t52m+JkMIDpQRKg8DkxZj703RUBtcJyH4CHq+1GQ52
	U5D8ggkpp064V0pFZ/aiGPdvmWYnwqKDO/mYyII6MVhY7n/llckCNITxAlQAFwk2nZpMVcsTjdT4E
	tztfWORPgK4jMSF+URpa25ZqDXuax5WE+0JOh15JMIAdCtmi9Cwm/76xWIoy+v71eYxTN6ms/eTwB
	JS38X4H1iaYlfQZZuJs3ODSEGDVUf/JVzUcyDcBJ5MQGAhiCqW0ggZnI28uoqR6Lp2yyuL9hPM5xD
	fdSKfFyAA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lW4WX-007k7g-OE; Mon, 12 Apr 2021 21:55:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW4WV-007k5z-3b
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 21:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=t5fVUkd+WomlsCNU89f4RWlfU0YVBDUJUCaSO8s0yz4=; b=uRDCZFqLNHZASqOUKKmunUM1Ev
 2Req6dhjOLRZw2SDcDeXTshCQudA5nB0JAsopjzdAjTgwOYKsnbMqTh6vFYXpyY1r2ve1tBGZQRSY
 uJ8EbUsC41P4Wdqe4Ux5FZlp1aJubUcYbZKCeiUvejov0oSzqwC+cnZ73gwidHHDcYewPAoKJjFSj
 e1TkRAlHMz4F+SNdTTkSj8JtY9pm7ztm7ETIbSxxYpyNw/tu/Iksnf2Ms61NgXiY3ekm+9y3NP4dr
 PL9YqD2H7bIklg0QcEMocK4eqEbyQMfZvbk825f4/X2cykUprXdCV/WQlZCZI0fnswQsyE+AAbos/
 536u8PeQ==;
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW4WR-006ZnA-Md
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 21:55:09 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id x4so3202100vkx.5
 for <linux-riscv@lists.infradead.org>; Mon, 12 Apr 2021 14:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t5fVUkd+WomlsCNU89f4RWlfU0YVBDUJUCaSO8s0yz4=;
 b=C48EX6sTyzyYI13xT3m6LhIltbKVwTvAMxMIvWpFMBQldDt9fkWQjGStnNIujuqDAb
 FvxNMzJQ5vJrPQ0yE3DZ17W3Wkgm5kkILoegGfP0xZa/XuVA4hMWo+GVAse2qYUchx+3
 rd0EmwGonwMd9johSjDzZZZw0Is4BPh9j3yHeXDAY3K5TpnV2nIyTloRd4gc6qeLtoxu
 haQ94hyUe1v3QHdAqE1PnYigi3po4khla0TVsr446QDEoW0znI1V8tu0LufLRCsw+hf5
 zpUa6jA/hWEvEOdtzSfZwJG9q6cvGz5+LmLftk7XPKJJGj3Ms5q+GE2iwshxkS/p4t4c
 bEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t5fVUkd+WomlsCNU89f4RWlfU0YVBDUJUCaSO8s0yz4=;
 b=MXOoh1Ink6siJcXIh7S6mWL+6hmvk2uKEKOX0neOKkV+TflSF2XbKDBsWWFlxRf70J
 YBD06RS05Vx9cAUjsahcxndQWkeHIhnrnSXEv7Zf51a05HZKMu0RcOBFswZj0iGAEk7J
 +GbdzQA9YRzZ+leNqXbX+Z+8z3sN4Yw6cdfXppTK16ahOCnn2WhpDSzpeyoKG4uEOy9N
 LKtpl3LKO4PcQ1zcA65IibO6UVHhQD5cVShZN7AwAskxBrHmoJIuAcvJ6/jn87zRBEpb
 tNsBLp+wfQgvp5u2xeN/6gvKYnv6+5Eh9gg0Z2Px+H6W/jY7xX5sUDiOeV+Hluboh7Y3
 1I3Q==
X-Gm-Message-State: AOAM533tLS1XLOVo3HWdYQgZovFom/Z13pBPLa8q9TAk/414QMLes5SD
 WSyrqhR/xHWlAYQZPQV+5ZjITCt0mvaBV64GBIU=
X-Google-Smtp-Source: ABdhPJwHXpFwhMtsPvlkkUyd51gLr4OjE3amwRTBBlGgSpDsteWaRv2mFW+RJBBrIFqPYP9vtw7jIdy3GkfSwi1vpNE=
X-Received: by 2002:a1f:e582:: with SMTP id c124mr21566105vkh.0.1618264506319; 
 Mon, 12 Apr 2021 14:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
In-Reply-To: <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christophm30@gmail.com>
Date: Mon, 12 Apr 2021 23:54:55 +0200
Message-ID: <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>, Peter Zijlstra <peterz@infradead.org>, 
 Guo Ren <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 catalin.marinas@arm.com, will.deacon@arm.com, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_145507_770733_E2CFDCCF 
X-CRM114-Status: GOOD (  83.74  )
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

On Mon, Apr 12, 2021 at 7:33 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Mon, 12 Apr 2021 06:32:27 PDT (-0700), christophm30@gmail.com wrote:
> > On Sun, Apr 11, 2021 at 11:11 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >>
> >> On Wed, 24 Mar 2021 05:53:51 PDT (-0700), anup@brainfault.org wrote:
> >> > On Wed, Mar 24, 2021 at 6:08 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >> >>
> >> >> On Wed, Mar 24, 2021 at 05:58:58PM +0530, Anup Patel wrote:
> >> >> > On Wed, Mar 24, 2021 at 3:45 PM <guoren@kernel.org> wrote:
> >> >> > >
> >> >> > > From: Guo Ren <guoren@linux.alibaba.com>
> >> >> > >
> >> >> > > This patch introduces a ticket lock implementation for riscv, along the
> >> >> > > same lines as the implementation for arch/arm & arch/csky.
> >> >> > >
> >> >> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >> >> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> >> >> > > Cc: Will Deacon <will.deacon@arm.com>
> >> >> > > Cc: Peter Zijlstra <peterz@infradead.org>
> >> >> > > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> >> >> > > Cc: Anup Patel <anup@brainfault.org>
> >> >> > > Cc: Arnd Bergmann <arnd@arndb.de>
> >> >> > > ---
> >> >> > >  arch/riscv/Kconfig                      |   1 +
> >> >> > >  arch/riscv/include/asm/Kbuild           |   1 +
> >> >> > >  arch/riscv/include/asm/spinlock.h       | 158 ++++++++++++--------------------
> >> >> > >  arch/riscv/include/asm/spinlock_types.h |  19 ++--
> >> >> >
> >> >> > NACK from myside.
> >> >> >
> >> >> > Linux ARM64 has moved away from ticket spinlock to qspinlock.
> >> >> >
> >> >> > We should directly go for qspinlock.
> >> >>
> >> >> I think it is a sensible intermediate step, even if you want to go
> >> >> qspinlock. Ticket locks are more or less trivial and get you fairness
> >> >> and all that goodness without the mind bending complexity of qspinlock.
> >> >>
> >> >> Once you have the ticket lock implementation solid (and qrwlock) and
> >> >> everything, *then* start to carefully look at qspinlock.
> >> >
> >> > I do understand qspinlock are relatively complex but the best thing
> >> > about qspinlock is it tries to ensure each CPU spins on it's own location.
> >> >
> >> > Instead of adding ticket spinlock now and later replacing it with qspinlock,
> >> > it is better to straight away explore qspinlock hence my NACK.
> >> >
> >> >>
> >> >> Now, arguably arm64 did the heavy lifting of making qspinlock good on
> >> >> weak architectures, but if you want to do it right, you still have to
> >> >> analyze the whole thing for your own architecture.
> >> >
> >> > Most of the RISC-V implementations are weak memory ordering so it
> >> > makes more sense to explore qspinlock first.
> >>
> >> I know I'm somewhat late to the party here.  I talked with Will (and
> >> to a lesser extent Peter) about this a week or two ago and it seems the
> >> best way to go here is to start with ticket locks.  They're simpler, and
> >> in Arm land they performed better until we got to the larger systems.
> >> Given that we don't have any high performance implementations of the
> >> RISC-V memory model (and likely won't any time soon) it's hard to reason
> >> about the performance of anything like this, but at a bare minimum
> >> having fair locks is a pretty big positive and ticket locks should have
> >> very little overhead while providing fairness.
> >>
> >> IMO the decision between ticket and queueing locks is really more of a
> >> property of the hardware/workload than the ISA, though there are of
> >> course some pretty deep ISA dependencies than can make one saner than
> >> the other.  It seems best to me to just allow users to pick their own
> >> flavor of locks, and at least PPC is already doing that.  I threw
> >> together a quick asm-generic ticket lock that can be selected at compile
> >> time, but I want to spend some more time playing with the other
> >> architectures before sending anything out.
> >
> > This discussion came up again a few weeks ago because I've been stumbling over
> > the test-and-set implementation and was wondering if nobody cared to
> > improve that yet.
> > Then I saw, that there have been a few attempts so far, but they did not land.
> > So I brought this up in RVI's platform group meeting and the attendees
> > showed big
> > interest to get at least fairness. I assume Guo sent out his new
> > patchset as a reaction
> > to this call (1 or 2 days later).
> >
> > We have the same situation on OpenSBI, where we've agreed (with Anup)
> > to go for a ticket lock implementation.
> > A series for that can be found here (the implementation was tested in
> > the kernel):
> > http://lists.infradead.org/pipermail/opensbi/2021-April/000789.html
> >
> > In the mentioned RVI call, I've asked the question if ticket locks or
> > MCF locks are preferred.
> > And the feedback was to go for qspinlock/qrwlock. One good argument to
> > do so would be,
> > to not have to maintain an RV-specific implementation, but to use a
> > well-tested in-kernel mechanism.
> >
> > The feedback in the call is also aligned with the previous attempts to
> > enable MCF-locks on RV.
> > However, the kernel's implementation requires sub-word atomics. And
> > here is, where we are.
> > The discussion last week was about changing the generic kernel code to
> > loosen its requirements
> > (not accepted because of performance regressions on e.g. x86) and if
> > RV actually can provide
> > sub-word atomics in form of LL/SC loops (yes, that's possible).
> > Providing sub-word xchg() can be done within a couple of hours (some
> > solutions are already on the list),
> > but that was not enough from the initial patchset from Michael on
> > (e.g. Christoph Hellwig asked back then
> > for moving arch-independent parts into lib, which is a good idea given
> > other archs do the same).
> > So I expect this might require some more time until there is a
> > solution, that's accepted by
> > a broad range of maintainers.
> >
> > I've been working on a new MCF-lock series last week.
> > It is working, but I did not publish it yet, because I wanted to go
> > through the 130+ emails
> > on the riscv-linux list and check for overseen review comments and
> > validate the patch authors.
> > You can find the current state here:
> > https://github.com/cmuellner/linux/pull/new/riscv-spinlocks
> > So, if you insist on ticket locks, then let's coordinate who will do
> > that and how it will be tested
> > (RV32/RV64, qemu vs real hw).
>
> My plan is to add a generic ticket-based lock, which can be selected at
> compile time.  It'll have no architecture dependencies (though it'll
> likely have some hooks for architectures that can make this go faster).
> Users can then just pick which spinlock flavor they want, with the idea
> being that smaller systems will perform better with ticket locks and
> larger systems will perform better with queued locks.  The main goal
> here is to give the less widely used architectures an easy way to have
> fair locks, as right now we've got a lot of code duplication because any
> architecture that wants ticket locks has to do it themselves.

In the case of LL/SC sequences, we have a maximum of 16 instructions
on RISC-V. My concern with a pure-C implementation would be that
we cannot guarantee this (e.g. somebody wants to compile with -O0)
and I don't know of a way to abort the build in case this limit exceeds.
Therefore I have preferred inline assembly for OpenSBI (my initial idea
was to use closure-like LL/SC macros, where you can write the loop
in form of C code).

In case you care, here is the ticket lock code from the OpenSBI patchset
ported over to Linux:
https://github.com/cmuellner/linux/commit/40a41d561df71fbe247016b303a1ef91bf9702f3

> I'm not really convinced we have the ability to discuss the performance
> of locks on RISC-V right now, at least in any meaningful capacity.  The
> set of systems we have right now are just so far off from having a
> competitive memory system that optimizing for them doesn't seem to be
> worth the time, and as there really aren't any users we don't know what
> workloads people care about.  I'm mostly interested in just keeping the
> implementation simple, and ticket locks are the simplest spinlock flavor
> I know of that's fair (I think we can all agree that unfair locks are
> going to be a disaster).
>
> There are certainly classes of systems for which ticket locks will be
> the wrong choice, and for those it makes sense to use the generic
> qspinlock implementation.  We'll likely need some changes to make that
> go fast on RISC-V, but we won't know what those are until we have
> hardware.  For now just having something that works (while staying away
> from anything that's obviously horribly inefficient) is as good as we
> can do, so I'm perfectly happy to take whatever we need to enable
> qspinlock on RISC-V.
>
> I'll likely default to the ticket locks on RISC-V as it's simpler, but
> my main goal is to just get rid of the code duplication.  IMO the
> correct lock flavor is really something that's tightly coupled to both
> the microarchitecture and workload, but given how poorly the current
> crop of implementations performs on anything parallel I'm more swayed by
> simplicity.  When we end up with real hardware I'll be happy to
> re-evaluate that choice, but I don't think it's all that important today
> because we're going to need a whole new generation of implementations
> (and likely at least some ISA clarifications, as whether anything based
> on cmpxchg can be fair right now is still an open question) before we
> have anything competitive.
>
> If you guys want to go throw a "thou shalt make queued spinlocks better
> than ticket spinlocks" (or the other way around, I don't really
> personally care all that much about spinlock flavors) in the platform
> spec that's fine.  Performance knobs are always a headache so getting
> rid of one would be great, but ultimately this is a microarchitecture
> thing so we'll have to see what gets implemented.

No, the implementation details of the spinlock algorithm are not part of
any platform specification. It was discussed in this forum because I did
not know a better place to ask this question. We all expect the RISC-V
kernel maintainer(s) to make a proper choice in the end. And as you said,
this can be re-evaluated in the future (based on results on real HW).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
