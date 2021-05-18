Return-Path: <SRS0=MbfZ=KN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B08C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 10:32:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE57B61002
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 10:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE57B61002
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NmPu/bdEkMvFpgSTztZM9ZJJvUp25WMPwEgY1IWzSOY=; b=dIq3OYwVtGOkc2Rquf35s+Ck/
	V5A9MfqOdMwEmRVpNl8cVJwohID4J1wGQOaz2/vDh9NvORzNZNfONdwTZkeQyuu8rFvSBh12vf6ET
	fO21MF7GipDmB/ub6DoblgMpdZedsf9vIrNkixggotdQQ7lDfdD0B37LagMLVgKpait3YkJlemIb0
	kUYsMYAoOnmL6BQ3gj+akJS5tzzN/jAg/CGR8Q4YJs+JpsIWj1dC1uRBaUX0DVykz8rjzu+fV68nK
	Ue9aB90iXTulmd+ETe0BP8DagkfO23Qe9li+HXL4m/aJlYTR8WHITFSOffS+aX7etYv/9UnTwCdhS
	vLhxmY3Vg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lix0z-000OWV-0O; Tue, 18 May 2021 10:31:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lix0N-000ONf-WD; Tue, 18 May 2021 10:31:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=11zOMNPLAXlfQ0IrA6mDqgUqLx9G4ocdGPmWlci12vs=; b=scPFuNIF9G+ZlPEakVmmgPaKpU
 V7SjnSBIq8fRyPnLYa21EPFEeMskI8wU6dt/2dhv3ekDGCgr5aW0H3PcvsDyRQK1/VzUKf+3d2ihK
 cN2W/3yNXZxKCN3NOLYDBzjC5IWK5ihOesjvasxi4SztojgfJehDz6XmpXzxkeGVCQOvGNM9gIHpr
 4y7LhHXSzZ1e8/RN4oEspqbtgK1KOyOXNCcZwrrEXWFB0vfT5oP4iG3PNhVTJ7zfHxH3rZwNUTmnI
 S6i/p9+7zQgO1ofBq0msAw2/+VGmWTsUt2PIM++ztBdJBEfjmzFFQ5jf8Api0c5Vo7he/+GDm87QQ
 uNLFWA+A==;
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lix0K-00EZCr-02; Tue, 18 May 2021 10:31:14 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1621333869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=11zOMNPLAXlfQ0IrA6mDqgUqLx9G4ocdGPmWlci12vs=;
 b=bCoq0/YrkDVfJ7aWUPtL/xVkLxy11Ug+HfDnAxDrJFs7J6MgrDlXYRSDS7vwtswRGIHJJl
 uObdMarvUwYFhAdiJHuWUmf5YEujX5yzqduBIhu8Ofk+r5f5M4cJzTltdLBU5nTztdSQFT
 kY0Rtk5Y/SQujsAoM5OCY/XuAUnk3fA=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99DFCAFEC;
 Tue, 18 May 2021 10:31:09 +0000 (UTC)
Date: Tue, 18 May 2021 12:31:08 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Hagen Paul Pfeifer <hagen@jauu.net>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH v19 5/8] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <YKOXbNWvUsqM4uxb@dhcp22.suse.cz>
References: <20210513184734.29317-1-rppt@kernel.org>
 <20210513184734.29317-6-rppt@kernel.org>
 <b625c5d7-bfcc-9e95-1f79-fc8b61498049@redhat.com>
 <YKDJ1L7XpJRQgSch@kernel.org> <YKOP5x8PPbqzcsdK@dhcp22.suse.cz>
 <8e114f09-60e4-2343-1c42-1beaf540c150@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e114f09-60e4-2343-1c42-1beaf540c150@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_033112_343897_A779C6E9 
X-CRM114-Status: GOOD (  29.01  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue 18-05-21 12:06:42, David Hildenbrand wrote:
> On 18.05.21 11:59, Michal Hocko wrote:
> > On Sun 16-05-21 10:29:24, Mike Rapoport wrote:
> > > On Fri, May 14, 2021 at 11:25:43AM +0200, David Hildenbrand wrote:
> > [...]
> > > > > +		if (!page)
> > > > > +			return VM_FAULT_OOM;
> > > > > +
> > > > > +		err = set_direct_map_invalid_noflush(page, 1);
> > > > > +		if (err) {
> > > > > +			put_page(page);
> > > > > +			return vmf_error(err);
> > > > 
> > > > Would we want to translate that to a proper VM_FAULT_..., which would most
> > > > probably be VM_FAULT_OOM when we fail to allocate a pagetable?
> > > 
> > > That's what vmf_error does, it translates -ESOMETHING to VM_FAULT_XYZ.
> > 
> > I haven't read through the rest but this has just caught my attention.
> > Is it really reasonable to trigger the oom killer when you cannot
> > invalidate the direct mapping. From a quick look at the code it is quite
> > unlikely to se ENOMEM from that path (it allocates small pages) but this
> > can become quite sublte over time. Shouldn't this simply SIGBUS if it
> > cannot manipulate the direct mapping regardless of the underlying reason
> > for that?
> > 
> 
> OTOH, it means our kernel zones are depleted, so we'd better reclaim somehow
> ...

Killing a userspace seems to be just a bad way around that.

Although I have to say openly that I am not a great fan of VM_FAULT_OOM
in general. It is usually a a wrong way to tell the handle the failure
because it happens outside of the allocation context so you lose all the
details (e.g. allocation constrains, numa policy etc.). Also whenever
there is ENOMEM then the allocation itself has already made sure that
all the reclaim attempts have been already depleted. Just consider an
allocation with GFP_NOWAIT/NO_RETRY or similar to fail and propagate
ENOMEM up the call stack. Turning that into the OOM killer sounds like a
bad idea to me.  But that is a more general topic. I have tried to bring
this up in the past but there was not much of an interest to fix it as
it was not a pressing problem...
-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
