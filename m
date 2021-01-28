Return-Path: <SRS0=TFiT=G7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48ADC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 14:43:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6714064DD9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 14:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6714064DD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jJYH6js7AGnEoL1F+cIIIr2KuyAMZXvlyCC58t5pD64=; b=iHWQ8/agkODsYmqg01dmUBeCD
	LfsujmZtWr6oZeK+UoN7nM93U3k1A3vVJCGang1HT7DceE6NyDJpYYjAAaL5N7FxdcCYiDXb1U0/J
	9qeh05ZB7bceQPAG5wkhvSQluSgR6buWrF3p1OArY/E9vFBQlsJ4/hNJlSRa3skOo5Z/hfpGjhvEh
	jBy8uMmtV5B/vYW+2TqtxD39lEIf4wZDPJBcA1enn1us+PoR5SGtz1UtWKrg+eL+Xd6/Dk5jFmsAK
	3vTTZQXddo2btN3cAT1U0oDkW0AU27+9UvVAGLub8xzMcKow/G79NRWzGOj+mee4323ftplY7eCu5
	76pwJIsaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l57vL-00046C-SH; Thu, 28 Jan 2021 14:05:27 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l57vJ-00044z-6H
 for linux-riscv@lists.infradead.org; Thu, 28 Jan 2021 14:05:26 +0000
Received: by mail-lj1-x22f.google.com with SMTP id s18so6445754ljg.7
 for <linux-riscv@lists.infradead.org>; Thu, 28 Jan 2021 06:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y3gG47U5h6Z0ms3PRQUM8QBx0aKm7Kdbts1+blceg04=;
 b=CfsrBQTGs0Esbt43WsOC7Vky4axjxTddmdc93F7OYhDFG0xRi8EFPzo+ljigoe2pot
 nl08e50onWdGXMFNApzFBAnmpeofi5yYUDo1CTz9cqW42zyNQd9HH0L/9STRoEjZ5zJc
 fTQNEKQF+kRCuFHnyz08L6kuBS11UhljPl/rF/qd+Dep7b9BbEiHXcPCIznldnx2v/az
 YhUiFaD5ezD3+239rpnSr1++mcg29oPu7pI5YQLwKfPBN7dvfoXrUj0cu4J0tiwMoTNG
 iQABFGbqct02pstWAwbScdjSu0GGO2jqtYNWDU9LQ7vjkegvI5234iUqZC4wfqsWXuRJ
 Fycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y3gG47U5h6Z0ms3PRQUM8QBx0aKm7Kdbts1+blceg04=;
 b=BwS5J6DErZe6wBiExcfeJ6QygDRaqSA55WT77V+8Ge7NKTQDC1iJl29bESVxT6CD/B
 5MzjRfYC/E1ZocetQs2fFJ+vsz87B3mh0I2SuW4YX8kUokz/XvOy3xA+K8No3KhuX8j7
 zd7yikSAlNMYYfL7AqnyW8P7A6n75zH8kG7TDXhR5m8rSuwSeozHLHIbzMuU2fqgUP0W
 aXQM50SE1WMrPbqUG/V2UolFlmhl6Z/+Rm0pWzoSby65W5tjPtzGz3S/rma1rVeS0V6n
 nsJkRvAXf1L1N//88XgKE8Cauj57TalD9Qbjdwa5kBjnXImN42akfd9GwL1oSr06ugru
 LsCA==
X-Gm-Message-State: AOAM532Aiq2molVPnOrRJa/o5NBXQ9BOxzvDsxlgJVsRW+UZrTP/YiBu
 hPxZmWzxQEnl157HmbEV0sbiS+TU6HY5vNM8NCUMOw==
X-Google-Smtp-Source: ABdhPJzmRLfShao52Wl8c2GnOI8Esxdu0gDu7Q4WjHT9JBMYe6CY6I8ohfbMaBXYGGmZSWG03007q03WUtavSFPY58o=
X-Received: by 2002:a2e:9ed1:: with SMTP id h17mr8071290ljk.160.1611842723157; 
 Thu, 28 Jan 2021 06:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-9-rppt@kernel.org>
 <20210125165451.GT827@dhcp22.suse.cz> <20210125213817.GM6332@kernel.org>
 <20210126144838.GL308988@casper.infradead.org>
 <20210126150555.GU827@dhcp22.suse.cz>
 <20210127184213.GA919963@carbon.dhcp.thefacebook.com>
 <YBJuwqItjCemDN5L@dhcp22.suse.cz>
In-Reply-To: <YBJuwqItjCemDN5L@dhcp22.suse.cz>
From: Shakeel Butt <shakeelb@google.com>
Date: Thu, 28 Jan 2021 06:05:11 -0800
Message-ID: <CALvZod7YjXvaYoZ7HXq2sDkwvpjpLBA-jhrzxa48jEuBt6zLNQ@mail.gmail.com>
Subject: Re: [PATCH v16 08/11] secretmem: add memcg accounting
To: Michal Hocko <mhocko@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_090525_329211_EF2DF753 
X-CRM114-Status: GOOD (  31.19  )
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

On Wed, Jan 27, 2021 at 11:59 PM Michal Hocko <mhocko@suse.com> wrote:
>
> On Wed 27-01-21 10:42:13, Roman Gushchin wrote:
> > On Tue, Jan 26, 2021 at 04:05:55PM +0100, Michal Hocko wrote:
> > > On Tue 26-01-21 14:48:38, Matthew Wilcox wrote:
> > > > On Mon, Jan 25, 2021 at 11:38:17PM +0200, Mike Rapoport wrote:
> > > > > I cannot use __GFP_ACCOUNT because cma_alloc() does not use gfp.
> > > > > Besides, kmem accounting with __GFP_ACCOUNT does not seem
> > > > > to update stats and there was an explicit request for statistics:
> > > > >
> > > > > https://lore.kernel.org/lkml/CALo0P13aq3GsONnZrksZNU9RtfhMsZXGWhK1n=xYJWQizCd4Zw@mail.gmail.com/
> > > > >
> > > > > As for (ab)using NR_SLAB_UNRECLAIMABLE_B, as it was already discussed here:
> > > > >
> > > > > https://lore.kernel.org/lkml/20201129172625.GD557259@kernel.org/
> > > > >
> > > > > I think that a dedicated stats counter would be too much at the moment and
> > > > > NR_SLAB_UNRECLAIMABLE_B is the only explicit stat for unreclaimable memory.
> > > >
> > > > That's not true -- Mlocked is also unreclaimable.  And doesn't this
> > > > feel more like mlocked memory than unreclaimable slab?  It's also
> > > > Unevictable, so could be counted there instead.
> > >
> > > yes, that is indeed true, except the unreclaimable counter is tracking
> > > the unevictable LRUs. These pages are not on any LRU and that can cause
> > > some confusion. Maybe they shouldn't be so special and they should live
> > > on unevistable LRU and get their stats automagically.
> > >
> > > I definitely do agree that this would be a better fit than NR_SLAB
> > > abuse. But considering that this is somehow even more special than mlock
> > > then a dedicated counter sounds as even better fit.
> >
> > I think it depends on how large these areas will be in practice.
> > If they will be measured in single or double digits MBs, a separate entry
> > is hardly a good choice: because of the batching the displayed value
> > will be in the noise range, plus every new vmstat item adds to the
> > struct mem_cgroup size.
> >
> > If it will be measured in GBs, of course, a separate counter is preferred.
> > So I'd suggest to go with NR_SLAB (which should have been named NR_KMEM)
> > as now and conditionally switch to a separate counter later.
>
> I really do not think the overall usage matters when it comes to abusing
> other counters. Changing this in future will be always tricky and there
> always be our favorite "Can this break userspace" question. Yes we dared
> to change meaning of some counters but this is not generally possible.
> Just have a look how accounting shmem as a page cache has turned out
> being much more tricky than many like.
>
> Really if a separate counter is a big deal, for which I do not see any
> big reason, then this should be accounted as unevictable (as suggested
> by Matthew) and ideally pages of those mappings should be sitting in the
> unevictable LRU as well unless there is a strong reason against.
>

Why not decide based on the movability of these pages? If movable then
unevictable LRU seems like the right way otherwise NR_SLAB.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
