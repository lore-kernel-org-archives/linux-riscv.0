Return-Path: <SRS0=Jr9t=KL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C2DC433ED
	for <linux-riscv@archiver.kernel.org>; Sun, 16 May 2021 07:30:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFE1B61184
	for <linux-riscv@archiver.kernel.org>; Sun, 16 May 2021 07:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFE1B61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Oc0rzDF6EbAa15mMmL23vUP78n/6GHknBxZwUJqyMXA=; b=orCy2v+38NBd93nwesqm9mbjS
	WOoZxu3VWNzIV0TsvqKwcX9Y4gbad3Soixtp9XkQfQMXnj6pFELAeGcBk0nbUkRiwG0yhWbpBGuA7
	+kwJ+qSoyKclhrZTEljjvANCfvd2F+futhxMwQ1cCobV6/Zj+5KRdR3yTI5uzcm+szwcJ/gZGqofb
	1vT7fSEQq4zWMGKuBsfVoWvqj3XZU7iRs+bzF33BM5PHLG+9CKPracSnWxgeOWFPVflaR1jtxKxFV
	TC1sYuy2SCShu8b+XpOmqymLmf0jmcc+bzb3xKTZdcUEoIXpUpbnvko/Yh7+m+K3H7nDQNORd5V+o
	zkYcFvMSw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liBDr-00BnAs-Ep; Sun, 16 May 2021 07:29:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liBDf-00BnA7-Nc; Sun, 16 May 2021 07:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8mGcJUtvcr5v7+0JXQA3xsqe7cCiC7JcjTrru6HEMOE=; b=Bkpqvs5paMTthLg29K1v5OiHjh
 Hn6mvCIRk8wJNIfBzcOkEixfQPBUsIuwSrnGoV1kZHd4j56nZZEloymqi0VugFAWwjNQY13nPAqtn
 eM8mSYVk6RV9yZKYdw6niZQ23MiB7FuVk3joP5NyS0P2r/dh5Ta1KDAlVdEp3L8g0K3vDWYPsB6YQ
 rQDm5kiwCh67ETiesCK6/IybuyZ7ABmIGii4nXhCLB2On6wa32xqnr5ioo/E86x7LKJbR8ephYXEd
 UiA4+zKCc6MrMQfW9nCeNeL/mkRehsmREXm25ySnpSfynVEQXe+iHUOGy8FOb92+2OjZRKNnyDe3A
 bRWrxZnQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liBDc-00Co3v-Ka; Sun, 16 May 2021 07:29:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E02561186;
 Sun, 16 May 2021 07:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621150183;
 bh=+OVDWA7/0Ml7ugiOtMv/uSOFjjO2dGH0xRQLpIVrDKo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eBhIrhYCTFIxc+VLsj8yA1Hoe59pJz4TDDp6gfkIUHKRIu0++Cr5KOBRH7zrVG52p
 jLfgetdQBPFyGyYlCbhHgrA81HExKP2ocYEBnwzrEhSEVffjHtkoz36MNZWcelhnjr
 noHKLnAroU/P6toelBVnxQ/nCrteyUNSBeOVQywuuFyCuwJ6KjRHTSSw3C+ibOdCJ3
 nZMC/S7X0atBwkdwhNBuFLlwXmQxpjArOHlAb4RGnRXLMyIjWStS2eO92iGNxGhb4j
 AFUJ5pyWh3JLWvb+t/p5OaBJRuDbt8Hej/cPyKYdFGX/8WcxIDRg2v902Yv7qfiYZ0
 ydk4b7ykNjpwQ==
Date: Sun, 16 May 2021 10:29:24 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
 Matthew Garrett <mjg59@srcf.ucam.org>,
 Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
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
Message-ID: <YKDJ1L7XpJRQgSch@kernel.org>
References: <20210513184734.29317-1-rppt@kernel.org>
 <20210513184734.29317-6-rppt@kernel.org>
 <b625c5d7-bfcc-9e95-1f79-fc8b61498049@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b625c5d7-bfcc-9e95-1f79-fc8b61498049@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210516_002944_753878_5FA245CF 
X-CRM114-Status: GOOD (  42.17  )
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

On Fri, May 14, 2021 at 11:25:43AM +0200, David Hildenbrand wrote:
> >   #ifdef CONFIG_IA64
> >   # include <linux/efi.h>
> > @@ -64,6 +65,9 @@ static inline int valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
> >   #ifdef CONFIG_STRICT_DEVMEM
> >   static inline int page_is_allowed(unsigned long pfn)
> >   {
> > +	if (pfn_valid(pfn) && page_is_secretmem(pfn_to_page(pfn)))
> > +		return 0;
> > +
> 
> 1. The memmap might be garbage. You should use pfn_to_online_page() instead.
> 
> page = pfn_to_online_page(pfn);
> if (page && page_is_secretmem(page))
> 	return 0;
> 
> 2. What about !CONFIG_STRICT_DEVMEM?
> 
> 3. Someone could map physical memory before a secretmem page gets allocated
> and read the content after it got allocated and gets used. If someone would
> gain root privileges and would wait for the target application to (re)start,
> that could be problematic.
> 
> 
> I do wonder if enforcing CONFIG_STRICT_DEVMEM would be cleaner.
> devmem_is_allowed() should disallow access to any system ram, and thereby,
> any possible secretmem pages, avoiding this check completely.

I've been thinking a bit more about the /dev/mem case, it seems I was to
fast on the trigger with adding that test for page_is_secretmem().

When CONFIG_STRICT_DEVMEM=y the access to RAM is anyway forbidden and if
the user built a kernel with CONFIG_STRICT_DEVMEM=n all the physical memory
is accessible by root anyway.

We might want to default STRICT_DEVMEM to "y" for all architectures and not
only arm64, ppc and x86, but this is not strictly related to this series.
 
> [...]
> 
> > diff --git a/mm/secretmem.c b/mm/secretmem.c
> > new file mode 100644
> > index 000000000000..1ae50089adf1
> > --- /dev/null
> > +++ b/mm/secretmem.c
> > @@ -0,0 +1,239 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright IBM Corporation, 2021
> > + *
> > + * Author: Mike Rapoport <rppt@linux.ibm.com>
> > + */
> > +
> > +#include <linux/mm.h>
> > +#include <linux/fs.h>
> > +#include <linux/swap.h>
> > +#include <linux/mount.h>
> > +#include <linux/memfd.h>
> > +#include <linux/bitops.h>
> > +#include <linux/printk.h>
> > +#include <linux/pagemap.h>
> > +#include <linux/syscalls.h>
> > +#include <linux/pseudo_fs.h>
> > +#include <linux/secretmem.h>
> > +#include <linux/set_memory.h>
> > +#include <linux/sched/signal.h>
> > +
> > +#include <uapi/linux/magic.h>
> > +
> > +#include <asm/tlbflush.h>
> > +
> > +#include "internal.h"
> > +
> > +#undef pr_fmt
> > +#define pr_fmt(fmt) "secretmem: " fmt
> > +
> > +/*
> > + * Define mode and flag masks to allow validation of the system call
> > + * parameters.
> > + */
> > +#define SECRETMEM_MODE_MASK	(0x0)
> > +#define SECRETMEM_FLAGS_MASK	SECRETMEM_MODE_MASK
> > +
> > +static bool secretmem_enable __ro_after_init;
> > +module_param_named(enable, secretmem_enable, bool, 0400);
> > +MODULE_PARM_DESC(secretmem_enable,
> > +		 "Enable secretmem and memfd_secret(2) system call");
> > +
> > +static vm_fault_t secretmem_fault(struct vm_fault *vmf)
> > +{
> > +	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
> > +	struct inode *inode = file_inode(vmf->vma->vm_file);
> > +	pgoff_t offset = vmf->pgoff;
> > +	gfp_t gfp = vmf->gfp_mask;
> > +	unsigned long addr;
> > +	struct page *page;
> > +	int err;
> > +
> > +	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
> > +		return vmf_error(-EINVAL);
> > +
> > +retry:
> > +	page = find_lock_page(mapping, offset);
> > +	if (!page) {
> > +		page = alloc_page(gfp | __GFP_ZERO);
> 
> We'll end up here with gfp == GFP_HIGHUSER (via the mapping below), correct?

Yes
 
> > +		if (!page)
> > +			return VM_FAULT_OOM;
> > +
> > +		err = set_direct_map_invalid_noflush(page, 1);
> > +		if (err) {
> > +			put_page(page);
> > +			return vmf_error(err);
> 
> Would we want to translate that to a proper VM_FAULT_..., which would most
> probably be VM_FAULT_OOM when we fail to allocate a pagetable?

That's what vmf_error does, it translates -ESOMETHING to VM_FAULT_XYZ.

> > +		}
> > +
> > +		__SetPageUptodate(page);
> > +		err = add_to_page_cache_lru(page, mapping, offset, gfp);
> > +		if (unlikely(err)) {
> > +			put_page(page);
> > +			/*
> > +			 * If a split of large page was required, it
> > +			 * already happened when we marked the page invalid
> > +			 * which guarantees that this call won't fail
> > +			 */
> > +			set_direct_map_default_noflush(page, 1);
> > +			if (err == -EEXIST)
> > +				goto retry;
> > +
> > +			return vmf_error(err);
> > +		}
> > +
> > +		addr = (unsigned long)page_address(page);
> > +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> 
> Hmm, to me it feels like something like that belongs into the
> set_direct_map_invalid_*() calls? Otherwise it's just very easy to mess up
> ...

AFAIU set_direct_map() deliberately do not flush TLB and leave it to the
caller to allow gathering multiple updates of the direct map and doing a
single TLB flush afterwards.

> I'm certainly not a filesystem guy. Nothing else jumped at me.
> 
> 
> To me, the overall approach makes sense and I consider it an improved
> mlock() mechanism for storing secrets, although I'd love to have some more
> information in the log regarding access via root, namely that there are
> still fancy ways to read secretmem memory once root via
> 
> 1. warm reboot attacks especially in VMs (e.g., modifying the cmdline)
> 2. kexec-style reboot attacks (e.g., modifying the cmdline)
> 3. kdump attacks
> 4. kdb most probably
> 5. "letting the process read the memory for us" via Kees if that still
>    applies
> 6. ... most probably something else
> 
> Just to make people aware that there are still some things to be sorted out
> when we fully want to protect against privilege escalations.
> 
> (maybe this information is buried in the cover letter already, where it
> usually gets lost)

I believe that it belongs more to the man page than to changelog so that
the *users* are aware of secretmem limitations.
 
-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
