Return-Path: <SRS0=wY1U=HS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CB1C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 16:52:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA272614A7
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 16:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA272614A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WQ2BnVPka2fEg7LaSKmVokR2gXG0Ypav7ia1QaIvXcI=; b=f6uJFeqcoENpucQ/52NucMdkp
	s2clZkCNjvxiDXIEWBAWXmO9iW57IcJv1YKdArwwKXsH/S6wXpyH8xVlcnC7wlTdl/7vzo9hnuRrl
	f/HgcK+oGzbsAhJJcKaE9KB/lLO+hafDqnPfdVgeJH+kAzGXLRGDNAXnsHxCPEbFaRi72f3NQVgot
	3Hb3sMf/cHjbezpRSiZhqmkF8Sqg7EBDMn9NFXHlSvOW3ZIL9CJdWXzT1LfLP4HJ/FTdkGsTq2Ktw
	PfAyqDkXGaOhu8akF15+MWRd4yzlLJqsMgJ9Pf9OfEP39+ypZ8awtyrPdAqoWg9CkBeWvoOcAyghr
	A0cA8GcUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC3Zh-0005hn-2G; Tue, 16 Feb 2021 16:51:45 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC3Za-0005fZ-Lf; Tue, 16 Feb 2021 16:51:41 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1613494295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fv1cqvwsI0OzZQzjo9Fzqiw9J9sAKYM15trtTiADU8I=;
 b=m+7A3yBnlzXwcSFUtKDR2Y9JcLQQ7GBKZLbjSDY4uRJe8Oprcc1t3A0Yb4nCpmSjJzTq71
 m2lvwh4POgKc94rijkZTo8EsctDQ8udo5YFmIVVBqcDZmQE+zdGsrWJMYIvr1Q40Hpav5m
 AI5AIoiWGkF74EgEjx/NO759Sl7hNIs=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93467AE05;
 Tue, 16 Feb 2021 16:51:35 +0000 (UTC)
Date: Tue, 16 Feb 2021 17:51:34 +0100
From: Michal Hocko <mhocko@suse.com>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <YCv4FhseXJ8cZ62/@dhcp22.suse.cz>
References: <20210214091954.GM242749@kernel.org>
 <052DACE9-986B-424C-AF8E-D6A4277DE635@redhat.com>
 <244f86cba227fa49ca30cd595c4e5538fe2f7c2b.camel@linux.ibm.com>
 <YCo7TqUnBdgJGkwN@dhcp22.suse.cz>
 <be1d821d3f0aec24ad13ca7126b4359822212eb0.camel@linux.ibm.com>
 <YCrJjYmr7A2nO6lA@dhcp22.suse.cz>
 <12c3890b233c8ec8e3967352001a7b72a8e0bfd0.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12c3890b233c8ec8e3967352001a7b72a8e0bfd0.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_115138_975982_ED6B76DB 
X-CRM114-Status: GOOD (  22.28  )
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
 Hagen Paul Pfeifer <hagen@jauu.net>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
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

On Tue 16-02-21 08:25:39, James Bottomley wrote:
> On Mon, 2021-02-15 at 20:20 +0100, Michal Hocko wrote:
> [...]
> > > >   What kind of flags are we talking about and why would that be a
> > > > problem with memfd_create interface? Could you be more specific
> > > > please?
> > > 
> > > You mean what were the ioctl flags in the patch series linked
> > > above? They were SECRETMEM_EXCLUSIVE and SECRETMEM_UNCACHED in
> > > patch 3/5. 
> > 
> > OK I see. How many potential modes are we talking about? A few or
> > potentially many?
>  
> Well I initially thought there were two (uncached or not) until you
> came up with the migratable or non-migratable, which affects the
> security properties.  But now there's also potential for hardware
> backing, like mktme,  described by flags as well.

I do not remember details about mktme but from what I still recall it
had keys associated with direct maps. Is the key management something
that fits into flags management?

> I suppose you could
> also use RDT to restrict which cache the data goes into: say L1 but not
> L2 on to lessen the impact of fully uncached (although the big thrust
> of uncached was to blunt hyperthread side channels).  So there is
> potential for quite a large expansion even though I'd be willing to bet
> that a lot of the modes people have thought about turn out not to be
> very effective in the field.

Are those very HW specific features really viable through a generic
syscall? Don't get me wrong but I find it much more likely somebody will
want a hugetlb (pretty HW independent) without a direct map than a very
close to the HW caching mode soon.

But thanks for the clarification anyway.
-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
