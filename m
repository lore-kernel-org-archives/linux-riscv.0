Return-Path: <SRS0=TFiT=G7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E17C4332D
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 14:58:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16FBF64DEC
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 14:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16FBF64DEC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DGeSSjRRJcGw6gVDOjYl0adQ7Ha9cnG81nztuipsw8w=; b=mZio30SbR2lHD3nN6rtKeecga
	PNvDTThV1N7avZmZs+olZsnyrTB+3AoN3xC4OY0rorI/ONqY+2LXja/7+zozKuzbHu8CZXjd5RLy0
	nQ7sAvqY1sTu8WiB0TSWqWsez/oZUnzHzN/oIZcvgDJ4vpakmhsRdFHe+2nbb+u7kTGew3ypjqsvX
	0Z/5EV2dw0tOAd9y/+xiRWMsyJcrS1rWw9MYCVaEdZmqMpFZXHj9y1UaaHFc+pNEbHVLtOp5SDKSQ
	ebEOIooiwOui6z63P3iyxtCDfm4YN4RiXqJWfcOT5zyPNz6sEfH8bwDM5nKBzvFPWEncO6IG1pLFu
	m1K09/CPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l58k5-0001g8-Bp; Thu, 28 Jan 2021 14:57:53 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l58k0-0001dt-0Z
 for linux-riscv@lists.infradead.org; Thu, 28 Jan 2021 14:57:49 +0000
Received: by mail-lf1-x12f.google.com with SMTP id m22so7967762lfg.5
 for <linux-riscv@lists.infradead.org>; Thu, 28 Jan 2021 06:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6JeWN8a5WUkyxnK36YoF5ECUYQ0YQQyZ8/Qna1NsShQ=;
 b=As0f3ZjdzvdCwifWZLl1QKfjKa8UOgbj+P2sZklA3JeJHRBFMWu0H5wiflr7/g1HdC
 3EjIecN6Px4mzk2ZBILkQfelKQTbnGwSzIocfdSMYIkirHo9CBbLzSIMXutUiAf6vvRc
 O/x3qpP8hsiEOTbNWqSjQJEQy2deXqGIeKK1Eiy110fgfCnqxwFB41oeOrAJr2xWvT1q
 RtaTVjDEtI0m7Z5lSQoJRTOt4f3/Vop3rVyNg7HaTwp/ta+UInes3JfxoRBzhApQcJVC
 zRX0Gbp2enO00BN0CoZKSrEiJpykCEajRuhij0lcxoYUBrveBZExa8KzS9ylf7cYTei3
 czvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6JeWN8a5WUkyxnK36YoF5ECUYQ0YQQyZ8/Qna1NsShQ=;
 b=JdF9O7NWGZIvlGfpV38v72wSFophZ8evwsosgKouKxMnxIVPKQQXjzgwllxni+Fw9M
 28XblxkK2Ty3UHPz5GTBbgyMqBdy800FkkmPyMwPoO+EsDv01ZRa/h1rDFhjLIrpvFpq
 hRQ9RckbYTzGzu8fFjckti1hpsfE7yIGI+aQafkPNNqjo2bgODjAFQkDvMT91cMCKq8Z
 MHaITUtT6EL8iu2I80XrRLRNd2gtsbWjTq20hUU7A9DW/T1KnG0RpMWsFKvP3Uam+SxW
 0Td5c44WscH2lRnjT78u7+6PgV4vx2zPK9Lzu1mks98eN/FXHETf8GCF7UBm2yuZL6OI
 qbjw==
X-Gm-Message-State: AOAM5334K9+K2GrOgQSJbTQpa4AnGZwFeMLdNYJ+QbKk3tze0AfzK7hq
 1Qb+jw9zO7mCEATIYP0oQytjGmwO1EXthydO1SosIQ==
X-Google-Smtp-Source: ABdhPJwnMPNGU3TqSk70s7k7l99wJrsKfvMYfSXuKIgpScpKrS2rUc1hXzqqY/mlKLeMfqPqurVK8/4c/RV2TUlC8OE=
X-Received: by 2002:ac2:4c26:: with SMTP id u6mr7622497lfq.347.1611845862683; 
 Thu, 28 Jan 2021 06:57:42 -0800 (PST)
MIME-Version: 1.0
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-9-rppt@kernel.org>
 <20210125165451.GT827@dhcp22.suse.cz> <20210125213817.GM6332@kernel.org>
 <20210126144838.GL308988@casper.infradead.org>
 <20210126150555.GU827@dhcp22.suse.cz>
 <20210127184213.GA919963@carbon.dhcp.thefacebook.com>
 <YBJuwqItjCemDN5L@dhcp22.suse.cz>
 <CALvZod7YjXvaYoZ7HXq2sDkwvpjpLBA-jhrzxa48jEuBt6zLNQ@mail.gmail.com>
 <YBLInhns9ysc4wNF@dhcp22.suse.cz>
In-Reply-To: <YBLInhns9ysc4wNF@dhcp22.suse.cz>
From: Shakeel Butt <shakeelb@google.com>
Date: Thu, 28 Jan 2021 06:57:31 -0800
Message-ID: <CALvZod4G3ipt84pQVHYT921hmXQTswivcrU0iqpTof4tO91GxA@mail.gmail.com>
Subject: Re: [PATCH v16 08/11] secretmem: add memcg accounting
To: Michal Hocko <mhocko@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_095748_178829_B0A2CC63 
X-CRM114-Status: GOOD (  43.97  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Linux MM <linux-mm@kvack.org>,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 28, 2021 at 6:22 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Thu 28-01-21 06:05:11, Shakeel Butt wrote:
> > On Wed, Jan 27, 2021 at 11:59 PM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Wed 27-01-21 10:42:13, Roman Gushchin wrote:
> > > > On Tue, Jan 26, 2021 at 04:05:55PM +0100, Michal Hocko wrote:
> > > > > On Tue 26-01-21 14:48:38, Matthew Wilcox wrote:
> > > > > > On Mon, Jan 25, 2021 at 11:38:17PM +0200, Mike Rapoport wrote:
> > > > > > > I cannot use __GFP_ACCOUNT because cma_alloc() does not use gfp.
> > > > > > > Besides, kmem accounting with __GFP_ACCOUNT does not seem
> > > > > > > to update stats and there was an explicit request for statistics:
> > > > > > >
> > > > > > > https://lore.kernel.org/lkml/CALo0P13aq3GsONnZrksZNU9RtfhMsZXGWhK1n=xYJWQizCd4Zw@mail.gmail.com/
> > > > > > >
> > > > > > > As for (ab)using NR_SLAB_UNRECLAIMABLE_B, as it was already discussed here:
> > > > > > >
> > > > > > > https://lore.kernel.org/lkml/20201129172625.GD557259@kernel.org/
> > > > > > >
> > > > > > > I think that a dedicated stats counter would be too much at the moment and
> > > > > > > NR_SLAB_UNRECLAIMABLE_B is the only explicit stat for unreclaimable memory.
> > > > > >
> > > > > > That's not true -- Mlocked is also unreclaimable.  And doesn't this
> > > > > > feel more like mlocked memory than unreclaimable slab?  It's also
> > > > > > Unevictable, so could be counted there instead.
> > > > >
> > > > > yes, that is indeed true, except the unreclaimable counter is tracking
> > > > > the unevictable LRUs. These pages are not on any LRU and that can cause
> > > > > some confusion. Maybe they shouldn't be so special and they should live
> > > > > on unevistable LRU and get their stats automagically.
> > > > >
> > > > > I definitely do agree that this would be a better fit than NR_SLAB
> > > > > abuse. But considering that this is somehow even more special than mlock
> > > > > then a dedicated counter sounds as even better fit.
> > > >
> > > > I think it depends on how large these areas will be in practice.
> > > > If they will be measured in single or double digits MBs, a separate entry
> > > > is hardly a good choice: because of the batching the displayed value
> > > > will be in the noise range, plus every new vmstat item adds to the
> > > > struct mem_cgroup size.
> > > >
> > > > If it will be measured in GBs, of course, a separate counter is preferred.
> > > > So I'd suggest to go with NR_SLAB (which should have been named NR_KMEM)
> > > > as now and conditionally switch to a separate counter later.
> > >
> > > I really do not think the overall usage matters when it comes to abusing
> > > other counters. Changing this in future will be always tricky and there
> > > always be our favorite "Can this break userspace" question. Yes we dared
> > > to change meaning of some counters but this is not generally possible.
> > > Just have a look how accounting shmem as a page cache has turned out
> > > being much more tricky than many like.
> > >
> > > Really if a separate counter is a big deal, for which I do not see any
> > > big reason, then this should be accounted as unevictable (as suggested
> > > by Matthew) and ideally pages of those mappings should be sitting in the
> > > unevictable LRU as well unless there is a strong reason against.
> > >
> >
> > Why not decide based on the movability of these pages? If movable then
> > unevictable LRU seems like the right way otherwise NR_SLAB.
>
> I really do not follow. If the page is unevictable then why movability
> matters?

My point was if these pages are very much similar to our existing
definition of unevictable LRU pages then it makes more sense to
account for these pages into unevictable stat.

> I also fail to see why NR_SLAB is even considered considering
> this is completely outside of slab proper.
>
> Really what is the point? What are we trying to achieve by stats? Do we
> want to know how much secret memory is used because that is an
> interesting/important information or do we just want to make some
> accounting?
>
> Just think at it from a practical point of view. I want to know how much
> slab memory is used because it can give me an idea whether kernel is
> consuming unexpected amount of memory. Now I have to subtract _some_
> number to get that information. Where do I get that some number?
>
> We have been creative with counters and it tends to kick back much more
> often than it helps.
>
> I really do not want this to turn into an endless bike shed but either
> this should be accounted as a general type of memory (unevictable would
> be a good fit because that is a userspace memory which is not
> reclaimable) or it needs its own counter to tell how much of this
> specific type of memory is used for this purpose.
>

I suggested having a separate counter in the previous version but got
shot down based on the not-yet-clear benefit of a separate stat for
it.

There is also an option to not add new or use existing stat at this
moment. As there will be more clear use-cases and usage of secretmem,
adding a new stat at that time would be much simpler than changing the
definition of existing stats.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
