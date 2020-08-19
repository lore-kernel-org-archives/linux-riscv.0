Return-Path: <SRS0=trTC=B5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AC9C433E3
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2020 11:43:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5293206FA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2020 11:43:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yvAJSn6Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2Z9IophM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5293206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bNyfTA3kFkrs48JsjUvqG1GCPaP0bO1Ma7+9qItw8gI=; b=yvAJSn6QX+WxRN+8okYYq+Png
	moRIOcGP6sTrhDm6XwAMrcm2rup3jk4BRZPjr6THco6QSmDoyRcJ+9EgEF/KORh+601GdPasqshPM
	b+Ept+kD12Bp1Ke6VrtGKqWr8dgQVMiSOuOA+b8CsqqbDsI4iFXPrmL04ruGLvD4IzisNFK1cubmP
	cAIDoL9zFNhVrd+rmKWxGBqBebY/tL/2CeLS+I6Gg6yOjb5C4A5MhgR6pQiAZB5xTe0H7yDb3BByy
	3bF6cYydJ/43bmsU9wXfn8sd9N01YkGwlzHqJmH3kLOrRPuPIsJSKQE4Bgqm1DxxIyuX9FFobe0bF
	3JRSq+JIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8MUf-0003My-Uj; Wed, 19 Aug 2020 11:43:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8MUb-0003LB-Cx; Wed, 19 Aug 2020 11:42:58 +0000
Received: from kernel.org (unknown [87.70.91.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB23E206FA;
 Wed, 19 Aug 2020 11:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837376;
 bh=oRLqxLOhAk2wnqABtg3LIfVpl96FyLYFzASr1U/ua+Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2Z9IophMNzk8pDJ8BdCg/mK2k2gQuqV8UM0qQAmx+Sn6zj919AK6cSjrUfOGKNQT4
 FgdC+v6CR36y9JK0bGfz3O20UZlSub/rKj1DDNqRtiGiQklQFxbD8gym7lAVbdhBXm
 bYUybp6KP1/X0bvM8WCYlmLMym+12jW5T0ZamYZo=
Date: Wed, 19 Aug 2020 14:42:44 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 0/6] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <20200819114244.GT752365@kernel.org>
References: <20200818141554.13945-1-rppt@kernel.org>
 <e82ca20e-a88e-d7ff-e99b-4189aac54f3a@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e82ca20e-a88e-d7ff-e99b-4189aac54f3a@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_074257_648806_F9C83B8F 
X-CRM114-Status: GOOD (  31.10  )
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
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 19, 2020 at 12:47:54PM +0200, David Hildenbrand wrote:
> On 18.08.20 16:15, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > Hi,
> > 
> > This is an implementation of "secret" mappings backed by a file descriptor. 
> > 
> > v4 changes:
> > * rebase on v5.9-rc1
> > * Do not redefine PMD_PAGE_ORDER in fs/dax.c, thanks Kirill
> > * Make secret mappings exclusive by default and only require flags to
> >   memfd_secret() system call for uncached mappings, thanks again Kirill :)
> > 
> > v3 changes:
> > * Squash kernel-parameters.txt update into the commit that added the
> >   command line option.
> > * Make uncached mode explicitly selectable by architectures. For now enable
> >   it only on x86.
> > 
> > v2 changes:
> > * Follow Michael's suggestion and name the new system call 'memfd_secret'
> > * Add kernel-parameters documentation about the boot option
> > * Fix i386-tinyconfig regression reported by the kbuild bot.
> >   CONFIG_SECRETMEM now depends on !EMBEDDED to disable it on small systems
> >   from one side and still make it available unconditionally on
> >   architectures that support SET_DIRECT_MAP.
> > 
> > 
> > The file descriptor backing secret memory mappings is created using a
> > dedicated memfd_secret system call The desired protection mode for the
> > memory is configured using flags parameter of the system call. The mmap()
> > of the file descriptor created with memfd_secret() will create a "secret"
> > memory mapping. The pages in that mapping will be marked as not present in
> > the direct map and will have desired protection bits set in the user page
> > table. For instance, current implementation allows uncached mappings.
> > 
> > Although normally Linux userspace mappings are protected from other users, 
> > such secret mappings are useful for environments where a hostile tenant is
> > trying to trick the kernel into giving them access to other tenants
> > mappings.
> > 
> > Additionally, the secret mappings may be used as a mean to protect guest
> > memory in a virtual machine host.
> > 
> 
> Just a general question. I assume such pages (where the direct mapping
> was changed) cannot get migrated - I can spot a simple alloc_page(). So
> essentially a process can just allocate a whole bunch of memory that is
> unmovable, correct? Is there any limit? Is it properly accounted towards
> the process (memctl) ?

The memory as accounted in the same way like with mlock(), so normal
user won't be able to allocate more than RLIMIT_MEMLOCK.

> -- 
> Thanks,
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
