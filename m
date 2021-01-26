Return-Path: <SRS0=Tegm=G5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBEDC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jan 2021 08:33:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C86EB223E4
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jan 2021 08:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C86EB223E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OqqLMQ+SiuvnJ29vGzi9lFa0e+Ac9eM8+LxRMjLGGcs=; b=Vk/l0+WyRc7ec1WvXEHNm2WlY
	irok3o7BhdAaGOadC1wZKJyWcgs2Jq8nFGKsPcAaknVVpuOVU7r8DnN8+HZ2uuh0w3T7U996krs/x
	5b4PswMvQsFKSbP2B+kSmMzOSOZWD+ud/JJu5qIsZsZVO66ZFLp4D+Vjco9fRporBngnhyFModX0P
	Xyu6N2MyaeT7XtAz0SDJTJqXCGCQK4jSDhoFmdNE/aZRY0A9+60dc1E3XQVQ97c1RA77cbpHenLow
	6q+AtB0USSrBpvZ7REDzwVNBqg2OtthiAXlU2u/1+oBG9Bm1D05NK9zVn533p4Nu7aOm75Mn6PH1w
	3Gbfnilxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4Jn3-0004La-4x; Tue, 26 Jan 2021 08:33:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4Jmz-0004KQ-Lo; Tue, 26 Jan 2021 08:33:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80421221EB;
 Tue, 26 Jan 2021 08:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611650008;
 bh=H0L/s8b4ORCyoaJiNR4/K6IuwhLTXEpC4ZxQCe2ujf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EiBtPa6OHymra64Rxg1txloFiP5zjzCvuSlyIWVKmTvpUQdX/H67DIMK2i2Uuodnj
 +pJRik86ygJhPW3cqQpj8FV++iT2hrMKpDvLQYhvX44rTITRurUjen/zoJmMCQae3l
 Lcmo9GGwXJm85xFsIWywNeP7VUd2gTVus5ElWf7PtfH5tVV1lax9hRI14JSRV54lD0
 87cNfRzXdbjKDvN/lHzsMDhXJYMYhdbs3ULnE6saF1L3DUJZ00q1I65E4c1szhEa/q
 NYwZ6iwhJfaJttOq3tbqFu9cHDCpuiTKRUJgeTaGGA94lPYwrOTfi1R7p0Odgfis+A
 brW+tXgU4OohQ==
Date: Tue, 26 Jan 2021 10:33:11 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v16 06/11] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <20210126083311.GN6332@kernel.org>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-7-rppt@kernel.org>
 <20210125170122.GU827@dhcp22.suse.cz>
 <20210125213618.GL6332@kernel.org>
 <20210126071614.GX827@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126071614.GX827@dhcp22.suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_033329_911257_F6152393 
X-CRM114-Status: GOOD (  31.29  )
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

On Tue, Jan 26, 2021 at 08:16:14AM +0100, Michal Hocko wrote:
> On Mon 25-01-21 23:36:18, Mike Rapoport wrote:
> > On Mon, Jan 25, 2021 at 06:01:22PM +0100, Michal Hocko wrote:
> > > On Thu 21-01-21 14:27:18, Mike Rapoport wrote:
> > > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > > 
> > > > Introduce "memfd_secret" system call with the ability to create memory
> > > > areas visible only in the context of the owning process and not mapped not
> > > > only to other processes but in the kernel page tables as well.
> > > > 
> > > > The user will create a file descriptor using the memfd_secret() system
> > > > call. The memory areas created by mmap() calls from this file descriptor
> > > > will be unmapped from the kernel direct map and they will be only mapped in
> > > > the page table of the owning mm.
> > > > 
> > > > The secret memory remains accessible in the process context using uaccess
> > > > primitives, but it is not accessible using direct/linear map addresses.
> > > > 
> > > > Functions in the follow_page()/get_user_page() family will refuse to return
> > > > a page that belongs to the secret memory area.
> > > > 
> > > > A page that was a part of the secret memory area is cleared when it is
> > > > freed.
> > > > 
> > > > The following example demonstrates creation of a secret mapping (error
> > > > handling is omitted):
> > > > 
> > > > 	fd = memfd_secret(0);
> > > > 	ftruncate(fd, MAP_SIZE);
> > > > 	ptr = mmap(NULL, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> > > 
> > > I do not see any access control or permission model for this feature.
> > > Is this feature generally safe to anybody?
> > 
> > The mappings obey memlock limit. Besides, this feature should be enabled
> > explicitly at boot with the kernel parameter that says what is the maximal
> > memory size secretmem can consume.
> 
> Why is such a model sufficient and future proof? I mean even when it has
> to be enabled by an admin it is still all or nothing approach. Mlock
> limit is not really useful because it is per mm rather than per user.
> 
> Is there any reason why this is allowed for non-privileged processes?
> Maybe this has been discussed in the past but is there any reason why
> this cannot be done by a special device which will allow to provide at
> least some permission policy?
 
Why this should not be allowed for non-privileged processes? This behaves
similarly to mlocked memory, so I don't see a reason why secretmem should
have different permissions model.

> Please make sure to describe all those details in the changelog.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
