Return-Path: <SRS0=Tegm=G5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA315C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jan 2021 12:08:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 920DF2311D
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jan 2021 12:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 920DF2311D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y6MmkQdAXsppZmRXGiIbyGIsr0q5jYNpGMHytCe1tiM=; b=id8OngO2P7nHa6k3UbUAu5z7k
	UuoSKafV5IYiIzbzeOGMWAS7C1f2qGopy3nGwXpgVeRkknuF3CCKeF6/55DXO0Dfowx2Gc7iRGKY4
	PN4s7j69Aa8QHJHO6JuirNPPKEPYfKdBQ+q3oacFkbYzw7XRG7ysDHiX716IhmNPlIzFktDfBxKok
	z3qfL+eV8WmxSqLnhIZFyz2uYGna+/Hw42q17upkQjqtaQoBMa2GR04dSkqlXhqtWUVmDbqcep0YD
	t+33zc7opcnGSJIiojYZZOhp2rrP8whL/uaa7hz7USZyuBXJMMZl7ishMu7E9VAswroeDaFKpedkd
	VV3Q6p0Ow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4N97-0003GT-2z; Tue, 26 Jan 2021 12:08:33 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4N90-0003Ds-4T; Tue, 26 Jan 2021 12:08:27 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611662905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rMlCz0R0+4hx1OA36aSmAlu8tlv8RUdQ0e7IJLpT36s=;
 b=SMhufNb2gWzhhrAZNHftCxKV09Z4ON1Nna331EeVwq6g5uadItVhhfYPwqZMwl7NrZHGoe
 sfrAnbEuROoHMCjd6kgLJlKlWNL6a2+tLn/JlOmK2zxwqEpUN438kLFMPBZjX2B+uErhsc
 6f7ZU3sY9xTAQHU0CIqtjHt0JXNni38=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5805AD26;
 Tue, 26 Jan 2021 12:08:24 +0000 (UTC)
Date: Tue, 26 Jan 2021 13:08:23 +0100
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <20210126120823.GM827@dhcp22.suse.cz>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-8-rppt@kernel.org>
 <20210126114657.GL827@dhcp22.suse.cz>
 <303f348d-e494-e386-d1f5-14505b5da254@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <303f348d-e494-e386-d1f5-14505b5da254@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_070826_389116_662F84FE 
X-CRM114-Status: GOOD (  28.85  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
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
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue 26-01-21 12:56:48, David Hildenbrand wrote:
> On 26.01.21 12:46, Michal Hocko wrote:
> > On Thu 21-01-21 14:27:19, Mike Rapoport wrote:
> > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > 
> > > Removing a PAGE_SIZE page from the direct map every time such page is
> > > allocated for a secret memory mapping will cause severe fragmentation of
> > > the direct map. This fragmentation can be reduced by using PMD-size pages
> > > as a pool for small pages for secret memory mappings.
> > > 
> > > Add a gen_pool per secretmem inode and lazily populate this pool with
> > > PMD-size pages.
> > > 
> > > As pages allocated by secretmem become unmovable, use CMA to back large
> > > page caches so that page allocator won't be surprised by failing attempt to
> > > migrate these pages.
> > > 
> > > The CMA area used by secretmem is controlled by the "secretmem=" kernel
> > > parameter. This allows explicit control over the memory available for
> > > secretmem and provides upper hard limit for secretmem consumption.
> > 
> > OK, so I have finally had a look at this closer and this is really not
> > acceptable. I have already mentioned that in a response to other patch
> > but any task is able to deprive access to secret memory to other tasks
> > and cause OOM killer which wouldn't really recover ever and potentially
> > panic the system. Now you could be less drastic and only make SIGBUS on
> > fault but that would be still quite terrible. There is a very good
> > reason why hugetlb implements is non-trivial reservation system to avoid
> > exactly these problems.
> > 
> > So unless I am really misreading the code
> > Nacked-by: Michal Hocko <mhocko@suse.com>
> > 
> > That doesn't mean I reject the whole idea. There are some details to
> > sort out as mentioned elsewhere but you cannot really depend on
> > pre-allocated pool which can fail at a fault time like that.
> 
> So, to do it similar to hugetlbfs (e.g., with CMA), there would have to be a
> mechanism to actually try pre-reserving (e.g., from the CMA area), at which
> point in time the pages would get moved to the secretmem pool, and a
> mechanism for mmap() etc. to "reserve" from these secretmem pool, such that
> there are guarantees at fault time?

yes, reserve at mmap time and use during the fault. But this all sounds
like a self inflicted problem to me. Sure you can have a pre-allocated
or more dynamic pool to reduce the direct mapping fragmentation but you
can always fall back to regular allocatios. In other ways have the pool
as an optimization rather than a hard requirement. With a careful access
control this sounds like a manageable solution to me.
-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
