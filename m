Return-Path: <SRS0=Tegm=G5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5FAC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jan 2021 09:15:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1644B206E5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jan 2021 09:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1644B206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HZkLXNUuS/H3i4+lj4wdNxyVLXqQPh5svo01r3RP96w=; b=hzNXTrPS0m2delVZshN6FzUPd
	U9weh9YQHqToHna6PSc8lEeB5d5E2aPkVkQZqKYh8wAtDR+lq4L5BfRvIYgCZf2qjQzIQBAu6foTA
	7VR8cICvOvfUG8XYdJoSrf1xdrKbfNEvZAEZNKcgtapHWdoDDIrnfgTF8ZBc9F80UEMftVTPZUP7o
	giqydMG/+wOJ5KNtnTe+qsaZyWt0EAAMo96lnkVZtyTl7BBL3sT2ykgxByCTBNUxc33ahXWQRFIeJ
	2+N64Bs9wCxjum7CzXhBqcg/IEc3AbAmFj4D+4XLPs0N6DzJHyBxYJ0s+wjdGJDC71YiVXvcsA5S6
	6FKmACsug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4KRm-0004YF-VJ; Tue, 26 Jan 2021 09:15:39 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4KRi-0004WH-5C; Tue, 26 Jan 2021 09:15:35 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611652532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8+K0oyxRY1+vhNkSeXzm8M4Y2R64gVVtCdOHelIF+V8=;
 b=kShKTVasjKcQgyk49obmmqJEv3Z3d6D+KjtCoEjGXxzkEZlE9pddLwPnfiYIY421ESnwFk
 s121ANy6h6Uf22zm4fCv1pqav6eTOcya5rAIE9EhMH1YsS7w7Ixp5ITIzE4PQfYNNMffQz
 Deb5a3d+IUk2PpGiCwbgFZJfGrBkuvI=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 36ABFB293;
 Tue, 26 Jan 2021 09:15:32 +0000 (UTC)
Date: Tue, 26 Jan 2021 10:15:27 +0100
From: Michal Hocko <mhocko@suse.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v16 08/11] secretmem: add memcg accounting
Message-ID: <20210126091527.GG827@dhcp22.suse.cz>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-9-rppt@kernel.org>
 <20210125165451.GT827@dhcp22.suse.cz>
 <20210125213817.GM6332@kernel.org>
 <20210126073142.GY827@dhcp22.suse.cz>
 <20210126085654.GO6332@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126085654.GO6332@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_041534_429783_95262301 
X-CRM114-Status: GOOD (  30.91  )
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

On Tue 26-01-21 10:56:54, Mike Rapoport wrote:
> On Tue, Jan 26, 2021 at 08:31:42AM +0100, Michal Hocko wrote:
> > On Mon 25-01-21 23:38:17, Mike Rapoport wrote:
> > > On Mon, Jan 25, 2021 at 05:54:51PM +0100, Michal Hocko wrote:
> > > > On Thu 21-01-21 14:27:20, Mike Rapoport wrote:
> > > > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > > > 
> > > > > Account memory consumed by secretmem to memcg. The accounting is updated
> > > > > when the memory is actually allocated and freed.
> > > > 
> > > > What does this mean?
> > > 
> > > That means that the accounting is updated when secretmem does cma_alloc()
> > > and cma_relase().
> > > 
> > > > What are the lifetime rules?
> > > 
> > > Hmm, what do you mean by lifetime rules?
> > 
> > OK, so let's start by reservation time (mmap time right?) then the
> > instantiation time (faulting in memory). What if the calling process of
> > the former has a different memcg context than the later. E.g. when you
> > send your fd or inherited fd over fork will move to a different memcg.
> > 
> > What about freeing path? E.g. when you punch a hole in the middle of
> > a mapping?
> > 
> > Please make sure to document all this.
>  
> So, does something like this answer your question:
> 
> ---
> The memory cgroup is charged when secremem allocates pages from CMA to
> increase large pages pool during ->fault() processing.

OK so that is when the memory is faulted in. Good that is a standard
model we have. The memcg context of the creator of the secret memory is
not really important. So whoever has created is not charged.

> The pages are uncharged from memory cgroup when they are released back to
> CMA at the time secretme inode is evicted.
> ---

so effectivelly when they are unmapped, right? This is similar to
anonymous memory.

As I've said it would be really great to have this life cycle documented
properly.

> > Please note that this all is a user visible stuff that will become PITA
> > (if possible) to change later on. You should really have strong
> > arguments in your justification here.
> 
> I think that adding a dedicated counter for few 2M areas per container is
> not worth the churn. 

What kind of churn you have in mind? What is the downside?

> When we'll get to the point that secretmem can be used to back the entire
> guest memory we can add a new counter and it does not seem to PITA to me.

What does really prevent a larger use with this implementation?

-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
