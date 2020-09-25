Return-Path: <SRS0=Z1AH=DC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E0EC47420
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2020 10:31:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8673721D91
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2020 10:31:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LvYUjIad"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8673721D91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dA0cb4LeW4n3qLEXWFB8KJwPWdDu6NNJqx6wAfCUrn4=; b=LvYUjIadTnovDq4AonhBUjDZD
	JzaKy3iokAx9pQy9hmvIgRXNPCK7PhEU8keNP2H5Tjw5zAM4GIXGF9y9bl1hHXyOwl6/AXPwVce+f
	yOMoQwkVgkm15KJXYNexR4PUSTUVveAARfs0/5DHS5+PGO35MjI1rSo8GO5Lqeak62MMInRXOAowr
	fiSdyMISYihvy0ZCIX08P7fjDE70z5YBbICWV43Y0EH/d/0AK+C0DZchF0tBeZrrrjP/jjXdFcTLx
	uX2VQ5QAlFAm4Yi0ghcNwV6kNoX38Kq5kaYxszQaMDyUleLc0tVZLbuNEB75pN73zfo6MnMJM4esC
	qN1Gt342A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLl0q-0006So-S5; Fri, 25 Sep 2020 10:31:36 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLl0l-0006QH-MQ; Fri, 25 Sep 2020 10:31:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1AE91045;
 Fri, 25 Sep 2020 03:31:28 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.16.138])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1DFE3F718;
 Fri, 25 Sep 2020 03:31:21 -0700 (PDT)
Date: Fri, 25 Sep 2020 11:31:14 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6 5/6] mm: secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <20200925103114.GA7407@C02TD0UTHF1T.local>
References: <20200924132904.1391-1-rppt@kernel.org>
 <20200924132904.1391-6-rppt@kernel.org>
 <20200925074125.GQ2628@hirez.programming.kicks-ass.net>
 <8435eff6-7fa9-d923-45e5-d8850e4c6d73@redhat.com>
 <20200925095029.GX2628@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925095029.GX2628@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_063131_839322_ADCA9C9F 
X-CRM114-Status: GOOD (  34.49  )
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
Cc: David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Shuah Khan <shuah@kernel.org>, x86@kernel.org,
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

Hi,

Sorry to come to this so late; I've been meaning to provide feedback on
this for a while but have been indisposed for a bit due to an injury.

On Fri, Sep 25, 2020 at 11:50:29AM +0200, Peter Zijlstra wrote:
> On Fri, Sep 25, 2020 at 11:00:30AM +0200, David Hildenbrand wrote:
> > On 25.09.20 09:41, Peter Zijlstra wrote:
> > > On Thu, Sep 24, 2020 at 04:29:03PM +0300, Mike Rapoport wrote:
> > >> From: Mike Rapoport <rppt@linux.ibm.com>
> > >>
> > >> Removing a PAGE_SIZE page from the direct map every time such page is
> > >> allocated for a secret memory mapping will cause severe fragmentation of
> > >> the direct map. This fragmentation can be reduced by using PMD-size pages
> > >> as a pool for small pages for secret memory mappings.
> > >>
> > >> Add a gen_pool per secretmem inode and lazily populate this pool with
> > >> PMD-size pages.
> > > 
> > > What's the actual efficacy of this? Since the pmd is per inode, all I
> > > need is a lot of inodes and we're in business to destroy the directmap,
> > > no?
> > > 
> > > Afaict there's no privs needed to use this, all a process needs is to
> > > stay below the mlock limit, so a 'fork-bomb' that maps a single secret
> > > page will utterly destroy the direct map.
> > > 
> > > I really don't like this, at all.
> > 
> > As I expressed earlier, I would prefer allowing allocation of secretmem
> > only from a previously defined CMA area. This would physically locally
> > limit the pain.
> 
> Given that this thing doesn't have a migrate hook, that seems like an
> eminently reasonable contraint. Because not only will it mess up the
> directmap, it will also destroy the ability of the page-allocator /
> compaction to re-form high order blocks by sprinkling holes throughout.
> 
> Also, this is all very close to XPFO, yet I don't see that mentioned
> anywhere.

Agreed. I think if we really need something like this, something between
XPFO and DEBUG_PAGEALLOC would be generally better, since:

* Secretmem puts userspace in charge of kernel internals (AFAICT without
  any ulimits?), so that seems like an avenue for malicious or buggy
  userspace to exploit and trigger DoS, etc. The other approaches leave
  the kernel in charge at all times, and it's a system-level choice
  which is easier to reason about and test.

* Secretmem interaction with existing ABIs is unclear. Should uaccess
  primitives work for secretmem? If so, this means that it's not valid
  to transform direct uaccesses in syscalls etc into accesses via the
  linear/direct map. If not, how do we prevent syscalls? The other
  approaches are clear that this should always work, but the kernel
  should avoid mappings wherever possible.

* The uncached option doesn't work in a number of situations, such as
  systems which are purely cache coherent at all times, or where the
  hypervisor has overridden attributes. The kernel cannot even know that
  whther this works as intended. On its own this doens't solve a
  particular problem, and I think this is a solution looking for a
  problem.

... and fundamentally, this seems like a "more security, please" option
that is going to be abused, since everyone wants security, regardless of
how we say it *should* be used. The few use-cases that may make sense
(e.g. protection of ketys and/or crypto secrrets), aren't going to be
able to rely on this (since e.g. other uses may depelete memory pools),
so this is going to be best-effort. With all that in mind, I struggle to
beleive that this is going to be worth the maintenance cost (e.g. with
any issues arising from uaccess, IO, etc).

Overall, I would prefer to not see this syscall in the kernel.

> Further still, it has this HAVE_SECRETMEM_UNCACHED nonsense which is
> completely unused. I'm not at all sure exposing UNCACHED to random
> userspace is a sane idea.

I agree the uncached stuff should be removed. It is at best misleading
since the kernel can't guarantee it does what it says, I think it's
liable to lead to issues in future (e.g. since it can cause memory
operations to raise different exceptions relative to what they can
today), and as above it seems like a solution looking for a problem.

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
