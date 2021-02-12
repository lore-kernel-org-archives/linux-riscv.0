Return-Path: <SRS0=T1n8=HO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9E3C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Feb 2021 09:02:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 578E964DF2
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Feb 2021 09:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 578E964DF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jTMqq6HfuiTZv+vXlzWDiAK8I9zxAuRfbyjCKHShc4c=; b=tX2dKgeYY1iLWkP47tUtrL0W5
	dauCdYGnJTdXBw3EGWCbXAKjrNHIOmIYXV3k1gkjMWUwQl9SIMU2gcl8JKW/4PQWcsCdmRWTy99Ws
	8fJDtZe8SrGBtHcyUvYHBqcJjvvoeVJG16ZYQaW4pHPYfSQRAmY+nMVBPQjsWfh3F3NfCZ/JiX5l0
	YHlfOgEBE+wI4b+COpmpF6aBVijnyh4pKqmgkllgM2qKsTZ096RF/SoQPbuMb6+tUy1d1Dt1Rzrp0
	d5QFPzuaha5R3kac2imhzlWxA4b5eYr6jcadSE3w1RrIpoTaXieEy3x8mS+Msv7L9CLc0yUfgVM6s
	EVbiGibCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAULN-0007Ey-D0; Fri, 12 Feb 2021 09:02:29 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAULH-0007DJ-Mt; Fri, 12 Feb 2021 09:02:24 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1613120541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fuLAmxR9iwO43/C3LbcJHqR7LRiBnZEE0LsKt1rN5RA=;
 b=maIJbN5v88UD3goki+HrDViBKPQKMVtsrMuVzNcWnDhTSddOOLE9kT0LL00VEyFKn1w2wu
 hBoG4RHY3X+r3uWP/goD/p/Dg7u5wWxfs7ea54Ma6J6j7ggOCIfWOJ3R2fAi1nMYOg65X0
 v0fJhu0jSZq0pBodruezPHImvLU92w8=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E22FB176;
 Fri, 12 Feb 2021 09:02:21 +0000 (UTC)
Date: Fri, 12 Feb 2021 10:02:18 +0100
From: Michal Hocko <mhocko@suse.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <YCZEGuLK94szKZDf@dhcp22.suse.cz>
References: <YCEXMgXItY7xMbIS@dhcp22.suse.cz>
 <20210208212605.GX242749@kernel.org>
 <YCJMDBss8Qhha7g9@dhcp22.suse.cz>
 <20210209090938.GP299309@linux.ibm.com>
 <YCKLVzBR62+NtvyF@dhcp22.suse.cz>
 <20210211071319.GF242749@kernel.org>
 <YCTtSrCEvuBug2ap@dhcp22.suse.cz>
 <20210211112008.GH242749@kernel.org>
 <YCUjck0I8qgjB24i@dhcp22.suse.cz>
 <20210211225929.GK242749@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210211225929.GK242749@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_040224_029103_346BB434 
X-CRM114-Status: GOOD (  29.67  )
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

On Fri 12-02-21 00:59:29, Mike Rapoport wrote:
> On Thu, Feb 11, 2021 at 01:30:42PM +0100, Michal Hocko wrote:
[...]
> > Have a look how hugetlb proliferates through our MM APIs. I strongly
> > suspect this is strong signal that this won't be any different.
> > 
> > > And even if yes, adding SECRETMEM_HUGE
> > > flag seems to me less confusing than saying "from kernel x.y you can use
> > > MFD_CREATE | MFD_SECRET | MFD_HUGE" etc for all possible combinations.
> > 
> > I really fail to see your point. This is a standard model we have. It is
> > quite natural that flags are added. Moreover adding a new syscall will
> > not make it any less of a problem.
> 
> Nowadays adding a new syscall is not as costly as it used to be. And I
> think it'll provide better extensibility when new features would be added
> to secretmem. 
> 
> For instance, for creating a secretmem fd backed with sealing we'd have
> 
> 	memfd_secretm(SECRETMEM_HUGE);

You mean SECRETMEM_HUGE_1G_AND_SEALED or SECRET_HUGE_2MB_WITHOUT_SEALED?
This would be rather an antipatern to our flags design, no? Really there
are orthogonal requirements here and there is absolutely zero reason
to smash everything into a single thing. It is just perfectly fine to
combine those functionalities without a pre-described way how to do
that.

> rather than
> 
> 	memfd_create(MFD_ALLOW_SEALING | MFD_HUGETLB | MFD_SECRET);
> 
> 
> Besides, if we overload memfd_secret we add complexity to flags validation
> of allowable flag combinations even with the simplest initial
> implementation.

This is the least of my worry, really. The existing code in
memfd_create, unlike others legacy interfaces, allows extensions just
fine.

> And what it will become when more features are added to secretmem?

Example?

> > > > I by no means do not insist one way or the other but from what I have
> > > > seen so far I have a feeling that the interface hasn't been thought
> > > > through enough.
> > > 
> > > It has been, but we have different thoughts about it ;-)
> > 
> > Then you must be carrying a lot of implicit knowledge which I want you
> > to document.
> 
> I don't have any implicit knowledge, we just have a different perspective.

OK, I will stop discussing now because it doesn't really seem to lead
anywhere.

Just to recap my current understanding. Your main argument so far is
that this is somehow special and you believe it would be confusing
to use an existing interface. I beg to disagree here because memfd
interface is exactly a way to get a file handle to describe a memory
which is what you want. About the only thing that secretmem is special
is that it only operates on mapped areas and read/write interface is
not supported (but I do not see a fundamental reason this couldn't be
added in the future). All the rest is just operating on a memory backed
file. I envison the hugetlb support will follow and sealing sounds like
a useful thing to be requested as well.  All that would have to be
added to a new syscall over time and then we will land at two parallel
interface supporting a largerly overlapping feature set.

To me all the above sounds to be much stronher argument than your worry
this might be confusing.

I will not insist on this but you should have some more thought on those
arguments.
-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
