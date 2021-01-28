Return-Path: <SRS0=TFiT=G7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B415C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 07:59:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5E6564DD9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 07:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5E6564DD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YgXn3gHbe1ZaAMBMxGPsPYDhC59cgwRg72nXIQLKh44=; b=cPg8vugtfnx+/0V/tKvd4CP4z
	h53mmdgYhbLIQWAGBrZ7kshI1XlGXMS2YHlkqS1GIIMRND1ZvrbL2/ei7+sH1rukZrxG9tPTpMjAN
	xqfLzasVo01VomQMwGuQ1eaiRZQ6ksQ7wAo0kAdFT2KATyQZ4t/oXqIjAfGxBrLlwhcfmAX6FWUuB
	yGiyq2h0YKaKp7BF3vpfHT0NWAA0J7idh3bPTaZh9zS4FP7XVeSzyioMb6tZrr88wQUYWU4aQamIn
	egwMZ+xa6u5J+HSkaiOkiApjo37ONfdIuJZ/R4iBk/YdpscOHOHLcL28Of2OMavqDK17IqnRNaaCR
	pRDQR0lZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l52Cs-0005h1-Kr; Thu, 28 Jan 2021 07:59:10 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l52Cj-0005cq-2i; Thu, 28 Jan 2021 07:59:03 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611820740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sq6KOdfLPXiwAuLXOW7YjreGdGoulD4muuz4Tw4c0dA=;
 b=BBuX1zyPDBli1wq3/9ieGxAyz7RNNE/U3jwTMZy/jhv7Vz+6hkiEhsZ79YzZbH8kl5y2Bm
 A9arQ9DBK0SAyY7kgadriTJZxWkFGt/xnQF6rpi0s9gD2VaxeLaXb3fFpVR4Dc2f3dqqCc
 OMJ50VBVtpJWHyvl89S1QLIePOScOWk=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D57F3AD18;
 Thu, 28 Jan 2021 07:58:59 +0000 (UTC)
Date: Thu, 28 Jan 2021 08:58:58 +0100
From: Michal Hocko <mhocko@suse.com>
To: Roman Gushchin <guro@fb.com>
Subject: Re: [PATCH v16 08/11] secretmem: add memcg accounting
Message-ID: <YBJuwqItjCemDN5L@dhcp22.suse.cz>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-9-rppt@kernel.org>
 <20210125165451.GT827@dhcp22.suse.cz>
 <20210125213817.GM6332@kernel.org>
 <20210126144838.GL308988@casper.infradead.org>
 <20210126150555.GU827@dhcp22.suse.cz>
 <20210127184213.GA919963@carbon.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210127184213.GA919963@carbon.dhcp.thefacebook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_025902_191497_CED541D6 
X-CRM114-Status: GOOD (  30.86  )
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
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
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
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed 27-01-21 10:42:13, Roman Gushchin wrote:
> On Tue, Jan 26, 2021 at 04:05:55PM +0100, Michal Hocko wrote:
> > On Tue 26-01-21 14:48:38, Matthew Wilcox wrote:
> > > On Mon, Jan 25, 2021 at 11:38:17PM +0200, Mike Rapoport wrote:
> > > > I cannot use __GFP_ACCOUNT because cma_alloc() does not use gfp.
> > > > Besides, kmem accounting with __GFP_ACCOUNT does not seem
> > > > to update stats and there was an explicit request for statistics:
> > > >  
> > > > https://lore.kernel.org/lkml/CALo0P13aq3GsONnZrksZNU9RtfhMsZXGWhK1n=xYJWQizCd4Zw@mail.gmail.com/
> > > > 
> > > > As for (ab)using NR_SLAB_UNRECLAIMABLE_B, as it was already discussed here:
> > > > 
> > > > https://lore.kernel.org/lkml/20201129172625.GD557259@kernel.org/
> > > > 
> > > > I think that a dedicated stats counter would be too much at the moment and
> > > > NR_SLAB_UNRECLAIMABLE_B is the only explicit stat for unreclaimable memory.
> > > 
> > > That's not true -- Mlocked is also unreclaimable.  And doesn't this
> > > feel more like mlocked memory than unreclaimable slab?  It's also
> > > Unevictable, so could be counted there instead.
> > 
> > yes, that is indeed true, except the unreclaimable counter is tracking
> > the unevictable LRUs. These pages are not on any LRU and that can cause
> > some confusion. Maybe they shouldn't be so special and they should live
> > on unevistable LRU and get their stats automagically.
> > 
> > I definitely do agree that this would be a better fit than NR_SLAB
> > abuse. But considering that this is somehow even more special than mlock
> > then a dedicated counter sounds as even better fit.
> 
> I think it depends on how large these areas will be in practice.
> If they will be measured in single or double digits MBs, a separate entry
> is hardly a good choice: because of the batching the displayed value
> will be in the noise range, plus every new vmstat item adds to the
> struct mem_cgroup size.
> 
> If it will be measured in GBs, of course, a separate counter is preferred.
> So I'd suggest to go with NR_SLAB (which should have been named NR_KMEM)
> as now and conditionally switch to a separate counter later.

I really do not think the overall usage matters when it comes to abusing
other counters. Changing this in future will be always tricky and there
always be our favorite "Can this break userspace" question. Yes we dared
to change meaning of some counters but this is not generally possible.
Just have a look how accounting shmem as a page cache has turned out
being much more tricky than many like.

Really if a separate counter is a big deal, for which I do not see any
big reason, then this should be accounted as unevictable (as suggested
by Matthew) and ideally pages of those mappings should be sitting in the
unevictable LRU as well unless there is a strong reason against.
-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
