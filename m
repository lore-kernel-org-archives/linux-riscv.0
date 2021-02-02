Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2223C433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 13:27:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FBA864EC5
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 13:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FBA864EC5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zWNY2FyoQFas23vADMAv1yIghTlpW1AJTByYlquS2FE=; b=y0o2qfMSYpfpWZ/P6C2JIsNKm
	1bUnYuozJER8JLsPjfariP36/jzvNRs+AWFjEA6zw954Miv9WxBAsV2yBxOA6f+JYyKCpWirBiaU6
	h+aiyc1lOt8qeEW3vJiwr4BcdN2N4uy/O+waadVSqj7aPYBjjZLlQt3Vpb5xPjXL9cTorCK5visJ5
	xH9yWvkZ7hDrhGtyzmveBla94ozAI+w5q0vekRMnxZc0EAGjKJfNiDki5W2ufB47YffjNvCJgEQXX
	fa5+WGY92Hfukkj3VaQldW7Zq6S8AOmaQFaZM8NEtn0+iFbhDFsJ6wX+Ws44OPxD/AiZQKjjZwXVf
	LvhE5mfCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6viI-0008Qh-Bs; Tue, 02 Feb 2021 13:27:26 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6viC-0008O9-DN; Tue, 02 Feb 2021 13:27:21 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1612272437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FyskbEnzuwjyuMTe8c7okJRmhrpRGCqmCZwH5GpQjcw=;
 b=YFgF3+f/w7PxiCxvUVlULmxEm8Z/1W5tSapPIO7tHCcCN5PlV7lWTgawD72voZ495B7JSR
 G26R4mG765744DxzeTd+YhGzjItOhlwQjBpR+BWxJqFdQ3PUGtCeIfFWGaLK4QzSX7b+w+
 mz7G/s66iaoiPvmR2Dk1KU0Nm01tHO4=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 80F75AF92;
 Tue,  2 Feb 2021 13:27:16 +0000 (UTC)
Date: Tue, 2 Feb 2021 14:27:14 +0100
From: Michal Hocko <mhocko@suse.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <YBlTMqjB06aqyGbT@dhcp22.suse.cz>
References: <20210126114657.GL827@dhcp22.suse.cz>
 <303f348d-e494-e386-d1f5-14505b5da254@redhat.com>
 <20210126120823.GM827@dhcp22.suse.cz>
 <20210128092259.GB242749@kernel.org>
 <YBK1kqL7JA7NePBQ@dhcp22.suse.cz>
 <73738cda43236b5ac2714e228af362b67a712f5d.camel@linux.ibm.com>
 <YBPF8ETGBHUzxaZR@dhcp22.suse.cz>
 <6de6b9f9c2d28eecc494e7db6ffbedc262317e11.camel@linux.ibm.com>
 <YBkcyQsky2scjEcP@dhcp22.suse.cz>
 <20210202124857.GN242749@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202124857.GN242749@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_082720_704442_3CE76EC4 
X-CRM114-Status: GOOD (  32.87  )
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
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue 02-02-21 14:48:57, Mike Rapoport wrote:
> On Tue, Feb 02, 2021 at 10:35:05AM +0100, Michal Hocko wrote:
> > On Mon 01-02-21 08:56:19, James Bottomley wrote:
> > 
> > I have also proposed potential ways out of this. Either the pool is not
> > fixed sized and you make it a regular unevictable memory (if direct map
> > fragmentation is not considered a major problem)
> 
> I think that the direct map fragmentation is not a major problem, and the
> data we have confirms it, so I'd be more than happy to entirely drop the
> pool, allocate memory page by page and remove each page from the direct
> map. 
> 
> Still, we cannot prove negative and it could happen that there is a
> workload that would suffer a lot from the direct map fragmentation, so
> having a pool of large pages upfront is better than trying to fix it
> afterwards. As we get more confidence that the direct map fragmentation is
> not an issue as it is common to believe we may remove the pool altogether.

I would drop the pool altogether and instantiate pages to the
unevictable LRU list and internally treat it as ramdisk/mlock so you
will get an accounting correctly. The feature should be still opt-in
(e.g. a kernel command line parameter) for now. The recent report by
Intel (http://lkml.kernel.org/r/213b4567-46ce-f116-9cdf-bbd0c884eb3c@linux.intel.com)
there is no clear win to have huge mappings in _general_ but there are
still workloads which benefit. 
 
> I think that using PMD_ORDER allocations for the pool with a fallback to
> order 0 will do the job, but unfortunately I doubt we'll reach a consensus
> about this because dogmatic beliefs are hard to shake...

If this is opt-in then those beliefs can be relaxed somehow. Long term
it makes a lot of sense to optimize for a better direct map management
but I do not think this is a hard requirement for an initial
implementation if it is not imposed to everybody by default.

> A more restrictive possibility is to still use plain PMD_ORDER allocations
> to fill the pool, without relying on CMA. In this case there will be no
> global secretmem specific pool to exhaust, but then it's possible to drain
> high order free blocks in a system, so CMA has an advantage of limiting
> secretmem pools to certain amount of memory with somewhat higher
> probability for high order allocation to succeed. 
> 
> > or you need a careful access control 
> 
> Do you mind elaborating what do you mean by "careful access control"?

As already mentioned, a mechanism to control who can use this feature -
e.g. make it a special device which you can access control by
permissions or higher level security policies. But that is really needed
only if the pool is fixed sized.
 
> > or you need SIGBUS on the mmap failure (to allow at least some fallback
> > mode to caller).
> 
> As I've already said, I agree that SIGBUS is way better than OOM at #PF
> time.

It would be better than OOM but it would still be a terrible interface.
So I would go that path only as a last resort. I do not even want to
think what kind of security consequences that would have. E.g. think of
somebody depleting the pool and pushing security sensitive workload into
fallback which is not backed by security memory.

> And we can add some means to fail at mmap() time if the pools are running
> low.

Welcome to hugetlb reservation world...

-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
