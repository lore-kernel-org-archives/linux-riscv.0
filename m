Return-Path: <SRS0=PCma=HN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252F0C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 09:38:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D2564DD7
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 09:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7D2564DD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JagdHEUL53vSTtQgUS41FN8sR+bS+YAEtb+lMCDiW5w=; b=Pz9FUAj8wtHsD/JMsHqRYIQ9Q
	brt/y6j1F0yUSG0sHIdGNC06p2IpNzIdM/JC03N+JWny/DBFETbRCCVLiUwcV0QDpaDbQYEa1wW/H
	0S93JBRH7WyvZcO3CWIhsjkh2k4QI6rZqhPYKzhDa2ZUGsZ/afegg6uU7ZDL2DYzP0vZfJGPKaQ2T
	NqUK2aPwPjFG72krIXNxtPj2Ul+zx5a4pqABf9/wim6eleB7Xs1SGA5nTPenQzd5HleO8OsbMwlJd
	t+vF9HYqpzWNEb1YAdkQgXgbb91TrAkHNSUcqqCQfp/iyQ1lDF+XA9mOwf8uZlz+s71n/snuNlQi/
	evM6459Ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA8QP-0006gk-Mh; Thu, 11 Feb 2021 09:38:13 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA8QJ-0006dy-2m; Thu, 11 Feb 2021 09:38:08 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1613036284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IgmP4ChnF5ylKST2wdnNkKGWWTfAZndBC/g6lnPZqtQ=;
 b=gFxEQ1HxiWSFhHn1jwSJVEwHxVpSlJMv6PB7Y1NSZ1/b8fSyhPfVk7yywgPmO4H7XJin/6
 OHl4FZuzyl9SmIpoocVwVNameXLeVOeaSYvQ7jYywhTiC1cf9hdrm6CSlrhOU+pV14KgLG
 e4bGEV2hXCQzrmyfIJHQUSLivHm63jQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8538FADE3;
 Thu, 11 Feb 2021 09:38:04 +0000 (UTC)
Date: Thu, 11 Feb 2021 10:38:03 +0100
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <YCT6+9YW474IaKrm@dhcp22.suse.cz>
References: <20210208084920.2884-1-rppt@kernel.org>
 <20210208084920.2884-8-rppt@kernel.org>
 <YCEXMgXItY7xMbIS@dhcp22.suse.cz>
 <20210208212605.GX242749@kernel.org>
 <YCJMDBss8Qhha7g9@dhcp22.suse.cz>
 <20210209090938.GP299309@linux.ibm.com>
 <YCKLVzBR62+NtvyF@dhcp22.suse.cz>
 <20210211071319.GF242749@kernel.org>
 <YCTtSrCEvuBug2ap@dhcp22.suse.cz>
 <0d66baec-1898-987b-7eaf-68a015c027ff@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0d66baec-1898-987b-7eaf-68a015c027ff@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_043807_425026_6A523C45 
X-CRM114-Status: GOOD (  22.91  )
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

On Thu 11-02-21 10:01:32, David Hildenbrand wrote:
[...]
> AFAIKS, we would need MFD_SECRET and disallow
> MFD_ALLOW_SEALING and MFD_HUGETLB.

Yes for an initial version. But I do expect a request to support both
features is just a matter of time.

> In addition, we could add MFD_SECRET_NEVER_MAP, which could disallow any kind of
> temporary mappings (eor migration). TBC.

I believe this is the mode Mike wants to have by default. A more relax
one would be an opt-in. MFD_SECRET_RELAXED which would allow temporal
mappings in the kernel for content copying (e.g. for migration).

> ---
> 
> Some random thoughts regarding files.
> 
> What is the page size of secretmem memory? Sometimes we use huge pages,
> sometimes we fallback to 4k pages. So I assume huge pages in general?

Unless there is an explicit request for hugetlb I would say the page
size is not really important like for any other fds. Huge pages can be
used transparently.
 
> What are semantics of MADV()/FALLOCATE() etc on such files?

I would expect the same semantic as regular shmem (memfd_create) except
the memory doesn't have _any_ backing storage which makes it
unevictable. So the reclaim related madv won't work but there shouldn't
be any real reason why e.g. MADV_DONTNEED, WILLNEED, DONT_FORK and
others don't work.

> I assume PUNCH_HOLE fails in a nice way? does it work?
> Does mremap()/mremap(FIXED) work/is it blocked?
> Does mprotect() fail in a nice way?

I do not see a reason why those shouldn't work.
 
> Is userfaultfd() properly fenced? Or does it even work (doubt)?
> 
> How does it behave if I mmap(FIXED) something in between?
> In which granularity can I do that (->page-size?)?

Again, nothing really exceptional here. This is a mapping like any
other from address space manipulation POV.

> What are other granularity restrictions (->page size)?
> 
> Don't want to open a big discussion here, just some random thoughts.
> Maybe it has all been already figured out and most of the answers
> above are "Fails with -EINVAL".

I think that the behavior should be really in sync with shmem semantic
as much as possible. Most operations should simply work with an
aditional direct map manipulation. There is no real reason to be
special. Some functionality might be missing, e.g. hugetlb support but
that has been traditionally added on top of shmem interface so nothing
really new here.
-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
