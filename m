Return-Path: <SRS0=Tegm=G5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C4CC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jan 2021 08:57:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5AD2230FC
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jan 2021 08:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5AD2230FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CnFLoAeGmjGz/eXzFQqBClY+f0rAfFF4gz3nAgCJ5fs=; b=M0YjPIJamv4A1pBcQ0VRwek62
	h01zL5tvkM5HujdkMFkyf2IacCo73TJyzABDxhCG2jk0eKunxZnvFE+t83I5py7ssQEcP7C9k6jca
	OlvIS5ACgDp+7wv+Zwa6WB40oY23qLqzPt6+JvvFVqGIhCKHOQssv5XZ+2QQLxxAso8VROcqv2h7i
	kJ2tILtB3HieW/EElW9ucjmPoQ3l9eCCQefV/2KAgkGo7K58sNcuROcv1ljtn+nvo7Nzsd4hUah6a
	zQRNjzUzseomAFee3ltl+KmL+8OxuwCBPJXdwtXcdK/ehKmN3yYlLBHVxx+jMw4BXvJVlMr32dn7u
	RbzXj1i7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4KA3-0007kV-4F; Tue, 26 Jan 2021 08:57:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4K9w-0007hd-Db; Tue, 26 Jan 2021 08:57:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77A1B229C4;
 Tue, 26 Jan 2021 08:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611651431;
 bh=3dgUnP8aJ1eg4nORcRJtC2l55XdTih1ZiktWTkuQgN4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sSPJ+2FNgJy9vX8TwuFtwlJ4BJGqjUsMVwz5vKSBR+DobJHY/hllcDCu+vsFJxOfA
 PtkBWbLVoKefAGzdw4tyPia/jf4/w/CTdqHUVcVPQYf8O6K/yO3n8YH3+6Qdp/WX2S
 3kpUytNDMZHdzYJVTeOCy1th0H1D8f7O80nUrqwGjIsLbS4pp10nhROJcxxrWQAvfI
 8rjhyrPOGkxeS0hfiSW+pq2m1eEQO7Dad0uLwiHZ3KfYXTJUzK2DuHM2u3gAHO+f+q
 ugk4X5eb03lt2fccryhj8VWMjQNpJj9IPEsXSd0j6TsD/IowA22eEkV42dAFy7PBId
 8LtfF1A42mNbA==
Date: Tue, 26 Jan 2021 10:56:54 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v16 08/11] secretmem: add memcg accounting
Message-ID: <20210126085654.GO6332@kernel.org>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-9-rppt@kernel.org>
 <20210125165451.GT827@dhcp22.suse.cz>
 <20210125213817.GM6332@kernel.org>
 <20210126073142.GY827@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126073142.GY827@dhcp22.suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_035712_675860_DA4132D8 
X-CRM114-Status: GOOD (  37.91  )
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

On Tue, Jan 26, 2021 at 08:31:42AM +0100, Michal Hocko wrote:
> On Mon 25-01-21 23:38:17, Mike Rapoport wrote:
> > On Mon, Jan 25, 2021 at 05:54:51PM +0100, Michal Hocko wrote:
> > > On Thu 21-01-21 14:27:20, Mike Rapoport wrote:
> > > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > > 
> > > > Account memory consumed by secretmem to memcg. The accounting is updated
> > > > when the memory is actually allocated and freed.
> > > 
> > > What does this mean?
> > 
> > That means that the accounting is updated when secretmem does cma_alloc()
> > and cma_relase().
> > 
> > > What are the lifetime rules?
> > 
> > Hmm, what do you mean by lifetime rules?
> 
> OK, so let's start by reservation time (mmap time right?) then the
> instantiation time (faulting in memory). What if the calling process of
> the former has a different memcg context than the later. E.g. when you
> send your fd or inherited fd over fork will move to a different memcg.
> 
> What about freeing path? E.g. when you punch a hole in the middle of
> a mapping?
> 
> Please make sure to document all this.
 
So, does something like this answer your question:

---
The memory cgroup is charged when secremem allocates pages from CMA to
increase large pages pool during ->fault() processing.
The pages are uncharged from memory cgroup when they are released back to
CMA at the time secretme inode is evicted.
---

> > > [...]
> > > 
> > > > +static int secretmem_account_pages(struct page *page, gfp_t gfp, int order)
> > > > +{
> > > > +	int err;
> > > > +
> > > > +	err = memcg_kmem_charge_page(page, gfp, order);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > +	/*
> > > > +	 * seceremem caches are unreclaimable kernel allocations, so treat
> > > > +	 * them as unreclaimable slab memory for VM statistics purposes
> > > > +	 */
> > > > +	mod_lruvec_page_state(page, NR_SLAB_UNRECLAIMABLE_B,
> > > > +			      PAGE_SIZE << order);
> > > 
> > > A lot of memcg accounted memory is not reclaimable. Why do you abuse
> > > SLAB counter when this is not a slab owned memory? Why do you use the
> > > kmem accounting API when __GFP_ACCOUNT should give you the same without
> > > this details?
> > 
> > I cannot use __GFP_ACCOUNT because cma_alloc() does not use gfp.
> 
> Other people are working on this to change. But OK, I do see that this
> can be done later but it looks rather awkward.
> 
> > Besides, kmem accounting with __GFP_ACCOUNT does not seem
> > to update stats and there was an explicit request for statistics:
> >  
> > https://lore.kernel.org/lkml/CALo0P13aq3GsONnZrksZNU9RtfhMsZXGWhK1n=xYJWQizCd4Zw@mail.gmail.com/
> 
> charging and stats are two different things. You can still take care of
> your stats without explicitly using the charging API. But this is a mere
> detail. It just hit my eyes.
> 
> > As for (ab)using NR_SLAB_UNRECLAIMABLE_B, as it was already discussed here:
> > 
> > https://lore.kernel.org/lkml/20201129172625.GD557259@kernel.org/
> 
> Those arguments should be a part of the changelof.
> 
> > I think that a dedicated stats counter would be too much at the moment and
> > NR_SLAB_UNRECLAIMABLE_B is the only explicit stat for unreclaimable memory.
> 
> Why do you think it would be too much? If the secret memory becomes a
> prevalent memory user because it will happen to back the whole virtual
> machine then hiding it into any existing counter would be less than
> useful.
> 
> Please note that this all is a user visible stuff that will become PITA
> (if possible) to change later on. You should really have strong
> arguments in your justification here.

I think that adding a dedicated counter for few 2M areas per container is
not worth the churn. 

When we'll get to the point that secretmem can be used to back the entire
guest memory we can add a new counter and it does not seem to PITA to me.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
