Return-Path: <SRS0=Z1AH=DC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3542EC4727D
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2020 14:58:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3C6220715
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2020 14:58:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yvnlld2j";
	dkim=temperror (0-bit key) header.d=tycho.pizza header.i=@tycho.pizza header.b="OofIQppg";
	dkim=temperror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="O2AlydY1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3C6220715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tycho.pizza
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uxa+Kcdz6u3pnaUTcWGHg+zz14UGGECW8Ag3xmN/FQI=; b=Yvnlld2jjcTEiqTiuB3idYK5u
	Hcu0TFKXGVtBDB2UTaalmUzLE6SOlbE1ekkaY4Ww0GBzpsZ7C12xegRFn/8Es4J3vU18Quc4XBizw
	AgPytd0vWolFNZ4p9wJnMnIorQAeh5TtDp9wYYQN3pMBQYFX57/mOaZq7FhYjOvp0oV7mg9jHIoGY
	csUYfJaEQbTSZTa5TpgcVL06/w9N0Yo7ibl7t4OK6j+W0Y+GcBcImwBMrbqHNhh2DpBMtpH5Kal1g
	8XCZjNh9jbyMhB5JHZbr2wh10yL5HTgFZb2NmRuYB9atl7RZmTA6NswSDP5JfBcY3j62hGGfDAgqk
	0R1nnzmaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLpAU-0001JP-OG; Fri, 25 Sep 2020 14:57:50 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLpAA-00016U-2g; Fri, 25 Sep 2020 14:57:35 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6C28D580762;
 Fri, 25 Sep 2020 10:57:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 25 Sep 2020 10:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tycho.pizza; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=tBfuOWmQyjKgArCfu4khNo2TUG7
 Jq21FgCLcBIcnmPM=; b=OofIQppgkot+WhAGmGPKk5hZgjNlpN1ZlHwJkZhHUT7
 KzQ9a4UKLvBtvt6IoY28ep/w/+2zSquvjNGRBmkSersamyUPK4mq6bGc213GAiGs
 6eeA6co4G2jngyV6y9+g8szoci4GiiwwXywXX2pXq0HGjzmMhlmRWxQ85LK/DlDy
 irsPbph5wkukocpS6KgwRtiTKpYoXd3eKdxCN9qwKIkQcRRXIio+zFQ2SjqkppTg
 SNQPkGiduZegcLFBIHP5gJ/Op/FSZLeDDXJiOr9hfVgoldvcVMrRECA9TV6Wq7zO
 8FAbll8jR/Sd8TZyP6RpX6gZdv/A69N8+b8xGORjw1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tBfuOW
 mQyjKgArCfu4khNo2TUG7Jq21FgCLcBIcnmPM=; b=O2AlydY1ltQyDVNghirgyE
 d0O51zrG8EUimzMadviff/NiqC0auMDDpsNj82EjtYhLCHLnvp4ul7cmJcKB4oic
 8GyaGwvleCXSsdBrsydeqkvzbq2T7kD4/ki04+EPu9S3o67WbG3C4srDADzAbfLV
 SaqsEs/JPQPxAl+TMoyLW00k6FlCJFMhhZSC9xeH5+0jlcUcku9NsJuXufMDdzoq
 zdAtNnQpSuuO9acwwrKLSyqcC1vJ24Bg4hY3bq8wGRJsi/GvmWV6uSzubM/akmk0
 XCtdH3b4xnADHi4BE95Cgt9gxaWKV/9k1KSsSHPJtWhz0FVMgsaL4L1E5bop9FyA
 ==
X-ME-Sender: <xms:UwVuXzT2_EVK-X89sY8bB0QEc5kSSYKtd5Y6-1axvefCEYWOlYSnYA>
 <xme:UwVuX0yozWkEYrLjnjNMdRGhiQbd_yK2RWC7ovDaSPkcaNL6mvOJ2S11sWTDI9fTG
 93ab4J4YjRsXoIH6_s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtgdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfihtghhohcu
 tehnuggvrhhsvghnuceothihtghhohesthihtghhohdrphhiiiiirgeqnecuggftrfgrth
 htvghrnhepgeekfeejgeektdejgfefudelkeeuteejgefhhfeugffffeelheegieefvdfg
 tefhnecukfhppedukeegrdduieejrddvtddruddvjeenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehthigthhhosehthigthhhordhpihiiiigr
X-ME-Proxy: <xmx:UwVuX41INdcWU29T0AMGhJaB3HJIGlhdpwpZMI-KwyruwPc6EXwYOw>
 <xmx:UwVuXzD-ve1UN48X78PrtetY1smAql28prAO4tEFqGl7ymEh84gqxQ>
 <xmx:UwVuX8geyBzOSq6I0Ijh-k5-hQ3NuL4eld4Pjyi37IJqiLjeZx6tRA>
 <xmx:VQVuX1Bsar3AUsWBYtFGXXzyHoYMRcAzPxIbRAmmT678sqzqCjgIfI7lyA7qd_3J>
Received: from cisco (184-167-020-127.res.spectrum.com [184.167.20.127])
 by mail.messagingengine.com (Postfix) with ESMTPA id B8B0B328005D;
 Fri, 25 Sep 2020 10:57:18 -0400 (EDT)
Date: Fri, 25 Sep 2020 08:57:17 -0600
From: Tycho Andersen <tycho@tycho.pizza>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v6 5/6] mm: secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <20200925145717.GA284424@cisco>
References: <20200924132904.1391-1-rppt@kernel.org>
 <20200924132904.1391-6-rppt@kernel.org>
 <20200925074125.GQ2628@hirez.programming.kicks-ass.net>
 <8435eff6-7fa9-d923-45e5-d8850e4c6d73@redhat.com>
 <20200925095029.GX2628@hirez.programming.kicks-ass.net>
 <20200925103114.GA7407@C02TD0UTHF1T.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925103114.GA7407@C02TD0UTHF1T.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_105730_376974_C9E5BAB4 
X-CRM114-Status: GOOD (  30.76  )
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 linux-nvdimm@lists.01.org, Shuah Khan <shuah@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 25, 2020 at 11:31:14AM +0100, Mark Rutland wrote:
> Hi,
> 
> Sorry to come to this so late; I've been meaning to provide feedback on
> this for a while but have been indisposed for a bit due to an injury.
> 
> On Fri, Sep 25, 2020 at 11:50:29AM +0200, Peter Zijlstra wrote:
> > On Fri, Sep 25, 2020 at 11:00:30AM +0200, David Hildenbrand wrote:
> > > On 25.09.20 09:41, Peter Zijlstra wrote:
> > > > On Thu, Sep 24, 2020 at 04:29:03PM +0300, Mike Rapoport wrote:
> > > >> From: Mike Rapoport <rppt@linux.ibm.com>
> > > >>
> > > >> Removing a PAGE_SIZE page from the direct map every time such page is
> > > >> allocated for a secret memory mapping will cause severe fragmentation of
> > > >> the direct map. This fragmentation can be reduced by using PMD-size pages
> > > >> as a pool for small pages for secret memory mappings.
> > > >>
> > > >> Add a gen_pool per secretmem inode and lazily populate this pool with
> > > >> PMD-size pages.
> > > > 
> > > > What's the actual efficacy of this? Since the pmd is per inode, all I
> > > > need is a lot of inodes and we're in business to destroy the directmap,
> > > > no?
> > > > 
> > > > Afaict there's no privs needed to use this, all a process needs is to
> > > > stay below the mlock limit, so a 'fork-bomb' that maps a single secret
> > > > page will utterly destroy the direct map.
> > > > 
> > > > I really don't like this, at all.
> > > 
> > > As I expressed earlier, I would prefer allowing allocation of secretmem
> > > only from a previously defined CMA area. This would physically locally
> > > limit the pain.
> > 
> > Given that this thing doesn't have a migrate hook, that seems like an
> > eminently reasonable contraint. Because not only will it mess up the
> > directmap, it will also destroy the ability of the page-allocator /
> > compaction to re-form high order blocks by sprinkling holes throughout.
> > 
> > Also, this is all very close to XPFO, yet I don't see that mentioned
> > anywhere.
> 
> Agreed. I think if we really need something like this, something between
> XPFO and DEBUG_PAGEALLOC would be generally better, since:

Perhaps we can brainstorm on this? XPFO has mostly been abandoned
because there's no good/safe way to make it faster. There was work on
eliminating TLB flushes, but that waters down the protection. When I
was last thinking about it in anger, it just seemed like it was
destined to be slow, especially on $large_num_cores machines, since
you have to flush everyone else's map too.

I think the idea of "opt in to XPFO" is mostly attractive because then
people only have to pay the slowness cost for memory they really care
about. But if there's some way to make XPFO, or some alternative
design, that may be better.

Tycho

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
