Return-Path: <SRS0=Tegm=G5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EEEC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jan 2021 09:49:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FD812311B
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jan 2021 09:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FD812311B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6WNJ6IqpgfLz/z/ElL0GHhkySyhOGzyYh2SZjIatO+U=; b=oeReiNh+y+RIElE1EtqEXCm9R
	/45zvWoZ2hTG/oTxYh0zkqCS1lBKkfgF9KgQHnKiHkiGI8JwH2HaCxssrlUAZPRpS498/12A6QJ4q
	u6Fye/ACcTM7wY67iy0y+qotqAH3TTy++IDNvXZQpg9pNBi5pZRN3F48iyUpe2BCExA0XAQKMWopO
	49UiFD2Bxeq6UPubesffHQWFTCeSNKVkWRRH32P0Oei7MS0qU11wQq1LvpQb3ZRy5lYKKW1K2UZXu
	E+9vgjBkqzL0469cAT5P9ACrIYqcSj9s+DtgWCr01bgqNxZkE/AzMKdVf1zTo+WSeU1/mdkBPqZzC
	u76kd4Nng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4KyE-0001a8-PD; Tue, 26 Jan 2021 09:49:10 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4Ky9-0001Yw-SD; Tue, 26 Jan 2021 09:49:07 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611654544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=osw4L0DyfBtcvVTgNeZhtou4RLCF+glHhzfn0pNfjYg=;
 b=umFtaF7Xp+88tywWv+IHw+GChi1pbTz5a0a/jUxktvgzyCsZINaZZCBo497bleXWAM+EaU
 GR3gp9zDi+MvoS/Bfup9r+ocJQrD+2eLOJm6arv0yMnJpQ/n5l0mmiAHda+EzLGkIzOcSy
 pFLJXF60F17xvk+8Oxor/2Ezl2/NIsE=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D1727AC4F;
 Tue, 26 Jan 2021 09:49:03 +0000 (UTC)
Date: Tue, 26 Jan 2021 10:49:03 +0100
From: Michal Hocko <mhocko@suse.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v16 06/11] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <20210126094903.GI827@dhcp22.suse.cz>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-7-rppt@kernel.org>
 <20210125170122.GU827@dhcp22.suse.cz>
 <20210125213618.GL6332@kernel.org>
 <20210126071614.GX827@dhcp22.suse.cz>
 <20210126083311.GN6332@kernel.org>
 <20210126090013.GF827@dhcp22.suse.cz>
 <20210126092011.GP6332@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126092011.GP6332@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_044906_151392_95F97667 
X-CRM114-Status: GOOD (  39.51  )
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

On Tue 26-01-21 11:20:11, Mike Rapoport wrote:
> On Tue, Jan 26, 2021 at 10:00:13AM +0100, Michal Hocko wrote:
> > On Tue 26-01-21 10:33:11, Mike Rapoport wrote:
> > > On Tue, Jan 26, 2021 at 08:16:14AM +0100, Michal Hocko wrote:
> > > > On Mon 25-01-21 23:36:18, Mike Rapoport wrote:
> > > > > On Mon, Jan 25, 2021 at 06:01:22PM +0100, Michal Hocko wrote:
> > > > > > On Thu 21-01-21 14:27:18, Mike Rapoport wrote:
> > > > > > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > > > > > 
> > > > > > > Introduce "memfd_secret" system call with the ability to create memory
> > > > > > > areas visible only in the context of the owning process and not mapped not
> > > > > > > only to other processes but in the kernel page tables as well.
> > > > > > > 
> > > > > > > The user will create a file descriptor using the memfd_secret() system
> > > > > > > call. The memory areas created by mmap() calls from this file descriptor
> > > > > > > will be unmapped from the kernel direct map and they will be only mapped in
> > > > > > > the page table of the owning mm.
> > > > > > > 
> > > > > > > The secret memory remains accessible in the process context using uaccess
> > > > > > > primitives, but it is not accessible using direct/linear map addresses.
> > > > > > > 
> > > > > > > Functions in the follow_page()/get_user_page() family will refuse to return
> > > > > > > a page that belongs to the secret memory area.
> > > > > > > 
> > > > > > > A page that was a part of the secret memory area is cleared when it is
> > > > > > > freed.
> > > > > > > 
> > > > > > > The following example demonstrates creation of a secret mapping (error
> > > > > > > handling is omitted):
> > > > > > > 
> > > > > > > 	fd = memfd_secret(0);
> > > > > > > 	ftruncate(fd, MAP_SIZE);
> > > > > > > 	ptr = mmap(NULL, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> > > > > > 
> > > > > > I do not see any access control or permission model for this feature.
> > > > > > Is this feature generally safe to anybody?
> > > > > 
> > > > > The mappings obey memlock limit. Besides, this feature should be enabled
> > > > > explicitly at boot with the kernel parameter that says what is the maximal
> > > > > memory size secretmem can consume.
> > > > 
> > > > Why is such a model sufficient and future proof? I mean even when it has
> > > > to be enabled by an admin it is still all or nothing approach. Mlock
> > > > limit is not really useful because it is per mm rather than per user.
> > > > 
> > > > Is there any reason why this is allowed for non-privileged processes?
> > > > Maybe this has been discussed in the past but is there any reason why
> > > > this cannot be done by a special device which will allow to provide at
> > > > least some permission policy?
> > >  
> > > Why this should not be allowed for non-privileged processes? This behaves
> > > similarly to mlocked memory, so I don't see a reason why secretmem should
> > > have different permissions model.
> > 
> > Because appart from the reclaim aspect it fragments the direct mapping
> > IIUC. That might have an impact on all others, right?
> 
> It does fragment the direct map, but first it only splits 1G pages to 2M
> pages and as was discussed several times already it's not that clear which
> page size in the direct map is the best and this is very much workload
> dependent.

I do appreciate this has been discussed but this changelog is not
specific on any of that reasoning and I am pretty sure nobody will
remember details in few years in the future. Also some numbers would be
appropriate.

> These are the results of the benchmarks I've run with the default direct
> mapping covered with 1G pages, with disabled 1G pages using "nogbpages" in
> the kernel command line and with the entire direct map forced to use 4K
> pages using a simple patch to arch/x86/mm/init.c.
> 
> https://docs.google.com/spreadsheets/d/1tdD-cu8e93vnfGsTFxZ5YdaEfs2E1GELlvWNOGkJV2U/edit?usp=sharing

A good start for the data I am asking above.
-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
