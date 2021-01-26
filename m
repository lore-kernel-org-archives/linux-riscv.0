Return-Path: <SRS0=Tegm=G5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8A6C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jan 2021 09:20:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71D8523109
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jan 2021 09:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71D8523109
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UnopL9URkwih84krAFwX1pzWMKcBme5sYFjePD3DlJY=; b=mmCA/3pfpYIXltP3j9u7N+mb8
	7rDA2NmC9N9j1AFE0YG/SydQzF9ZWhpUQyZH7huOusKABYrRtQi+OJyAormIEyTWEsECzYe8jGWVg
	a9UIKM8Cb/EoXYKQ3yRGTY4j/hInb8bWTIlcU1zGlvwy/wdqWZb8GdpXIW+a63FPKa/QrPzMTOoUs
	K6KeCGIm7fCqNzIVaZ1RTocm7f6XmT4xksLtoQCqskV8eiQeMe4HMieNXByFpsDM7npta0kV2tAVa
	+sYDS/aBco/CdpqDH9/X5uH4u+z8qvB/vqu64eWRhkECtlyjxy+3xbz071OuI2jRpH6xsH789Lpsc
	4WZExBcGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4KWc-0005U1-Nd; Tue, 26 Jan 2021 09:20:38 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4KWR-0005Ov-IW; Tue, 26 Jan 2021 09:20:29 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611652825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Fkh8i4u2Ds7suNHQy8ffJkc7y8JY+c/ULxceSUkTds=;
 b=bqWhNQD/hZoyEpF0cNuKXozUxgro+R+IfdOU/BS2HiMG0+8sw32ccg9JoavrsQIkP6dpVh
 K1iIWCeUmEMm4VHXkiZqSBFZqfHjVghsxokwQGllYDgcYi1VKxKpTZai9iq1zdfPF7t7A3
 /qszOeSUVbFlKJZaNJgfQ/OCqYtH1GU=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9DAAB291;
 Tue, 26 Jan 2021 09:20:24 +0000 (UTC)
Date: Tue, 26 Jan 2021 10:20:23 +0100
From: Michal Hocko <mhocko@suse.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v16 06/11] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <20210126092023.GH827@dhcp22.suse.cz>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-7-rppt@kernel.org>
 <20210125170122.GU827@dhcp22.suse.cz>
 <20210125213618.GL6332@kernel.org>
 <20210126071614.GX827@dhcp22.suse.cz>
 <20210126083311.GN6332@kernel.org>
 <20210126090013.GF827@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126090013.GF827@dhcp22.suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_042027_924958_B9AC24A9 
X-CRM114-Status: GOOD (  35.78  )
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

On Tue 26-01-21 10:00:14, Michal Hocko wrote:
> On Tue 26-01-21 10:33:11, Mike Rapoport wrote:
> > On Tue, Jan 26, 2021 at 08:16:14AM +0100, Michal Hocko wrote:
> > > On Mon 25-01-21 23:36:18, Mike Rapoport wrote:
> > > > On Mon, Jan 25, 2021 at 06:01:22PM +0100, Michal Hocko wrote:
> > > > > On Thu 21-01-21 14:27:18, Mike Rapoport wrote:
> > > > > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > > > > 
> > > > > > Introduce "memfd_secret" system call with the ability to create memory
> > > > > > areas visible only in the context of the owning process and not mapped not
> > > > > > only to other processes but in the kernel page tables as well.
> > > > > > 
> > > > > > The user will create a file descriptor using the memfd_secret() system
> > > > > > call. The memory areas created by mmap() calls from this file descriptor
> > > > > > will be unmapped from the kernel direct map and they will be only mapped in
> > > > > > the page table of the owning mm.
> > > > > > 
> > > > > > The secret memory remains accessible in the process context using uaccess
> > > > > > primitives, but it is not accessible using direct/linear map addresses.
> > > > > > 
> > > > > > Functions in the follow_page()/get_user_page() family will refuse to return
> > > > > > a page that belongs to the secret memory area.
> > > > > > 
> > > > > > A page that was a part of the secret memory area is cleared when it is
> > > > > > freed.
> > > > > > 
> > > > > > The following example demonstrates creation of a secret mapping (error
> > > > > > handling is omitted):
> > > > > > 
> > > > > > 	fd = memfd_secret(0);
> > > > > > 	ftruncate(fd, MAP_SIZE);
> > > > > > 	ptr = mmap(NULL, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> > > > > 
> > > > > I do not see any access control or permission model for this feature.
> > > > > Is this feature generally safe to anybody?
> > > > 
> > > > The mappings obey memlock limit. Besides, this feature should be enabled
> > > > explicitly at boot with the kernel parameter that says what is the maximal
> > > > memory size secretmem can consume.
> > > 
> > > Why is such a model sufficient and future proof? I mean even when it has
> > > to be enabled by an admin it is still all or nothing approach. Mlock
> > > limit is not really useful because it is per mm rather than per user.
> > > 
> > > Is there any reason why this is allowed for non-privileged processes?
> > > Maybe this has been discussed in the past but is there any reason why
> > > this cannot be done by a special device which will allow to provide at
> > > least some permission policy?
> >  
> > Why this should not be allowed for non-privileged processes? This behaves
> > similarly to mlocked memory, so I don't see a reason why secretmem should
> > have different permissions model.
> 
> Because appart from the reclaim aspect it fragments the direct mapping
> IIUC. That might have an impact on all others, right?

Also forgot to mention that you rely on a contiguous allocations and
that can become a very scarce resource so what does prevent one abuser
from using it all and deny the access to others. And unless I am missing
something allocation failure would lead to OOM which cannot really help
because the oom killer cannot compensate for the CMA reservation.
-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
