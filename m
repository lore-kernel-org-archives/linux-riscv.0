Return-Path: <SRS0=Ai3O=KJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B34C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 09:26:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7710E613FB
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 09:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7710E613FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FBn9Dcmtygx+dL1BrH51jPB2mmZbbK4bdcDpqTpoZEQ=; b=BLyeggY5GpGXvH/LRMGgeeVEr
	I9y80xVVk+cyss27ZFdn3BtHPrcGeU8rjZnY34CYnyZP2LPuDrjQgyDwLZnDQGwVgQTFIdLh1iA8d
	27wmsee9Dr9hW4EQt+AIlIJozbsUJaFV1LUG+JcaTAlQZcFA1W03Xvb93Sijhgl9rrWJeoFby8waw
	PPhPV6u2q383JIv5Be8cisKiu1tCWswwDOVvdn5uUWftP71Cuh5ghXLEtt12p4EH66OMg6pj4gLWW
	h3yjcqZn9Gqq+qFKDlHEzFHLjgO6oWLJav9LAGVLc4nrxY2nUk9WH9e806AzEq+/ayUE2uhVvl8L6
	3IRWsnr4g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhU4y-007cjH-By; Fri, 14 May 2021 09:25:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhU4v-007cij-Vj
 for linux-riscv@desiato.infradead.org; Fri, 14 May 2021 09:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References
 :Cc:To:Sender:Reply-To:Content-ID:Content-Description;
 bh=Fx334L5vVgVDfx7L2kVeRZ1gFR/dFDyujA5YMe7z6io=; b=mWDjBydvgTLX95CpCU+XnDUMb5
 KQuVqDMU6iZ3PHda5SCyErwloQ4e4aH0DSOchHIDXd3IGsUX0pGhIM96uzQ5OZGOUJtb9XOR8D5ko
 tLEuT1QLDHcgleX+hfocFHpvRM6u/SSXDZ/d1lniZtNcwGLB3wb3gOq/OQM4zYxi/DfirA8Esi+ru
 /5Vkk2rfqh0pCCnUH2pmkfnzpHGiX4hmBIlhVzL6VlHumbqtLAxjNi22hqMkZh99d4GJVe2ASaG6t
 ReD68WtcjXYpE2gtd8yU/GyJ/1f9FylSlNuL3Qv7VBXnOpGa7nP6umYxy/nHDhA1/aY0WCcXTvDX0
 abXvSixg==;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhU4s-00Br8c-F0
 for linux-riscv@lists.infradead.org; Fri, 14 May 2021 09:25:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620984349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fx334L5vVgVDfx7L2kVeRZ1gFR/dFDyujA5YMe7z6io=;
 b=S5lFNU5TQKD03U47KGRUq0qxXj401VvzZwf8ycDk75sZ8elD6zmYfr8ormTPVmnMFlB//f
 k7DIspm8Yj8j769M+pu58fgnypnwOYb1A7IAdw2hBPD/n1GZwGdpwstsH11YZVHvVvpX7A
 tkxkRTd+2YudBVAMGoeBZyeF6WdzMDE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-nJfsKbSJNq6-yeenWAWx1A-1; Fri, 14 May 2021 05:25:47 -0400
X-MC-Unique: nJfsKbSJNq6-yeenWAWx1A-1
Received: by mail-ed1-f70.google.com with SMTP id
 o12-20020aa7d3cc0000b02903891695ceabso16081787edr.3
 for <linux-riscv@lists.infradead.org>; Fri, 14 May 2021 02:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Fx334L5vVgVDfx7L2kVeRZ1gFR/dFDyujA5YMe7z6io=;
 b=WBE2wiyq69CGD/EoQ/KDioahhg4k8rf2CnMtqNtn1btZfHdXrq7MdYXK13r0rtkb9t
 SwVJVQt/N2P6rwtUFZ9eQC/4V5JzkdD5wLp8GY8Y0NbiSgSRLLjgC3P0SuBoxXYBaJEw
 9TWJmcTmBGjNcbHM5r9OUosr+LLNURjRO/tgbBrNYPcUTtNcCviBk1GuLKXGRLeOo97K
 Zfk81s68kDLJu70z2KMk7tAIH0g2t6ShxYawC4cUFyutPSC8s7XF/4H01vPybxAcPryn
 x3GzCQWbY2qxkScGYbynRA8vlpB96kUTYNdTH10T3y5F1YeJsj1ctNzbA7qP9EYVic5v
 cI3w==
X-Gm-Message-State: AOAM532qU/Du+CNy4UvqcUJFNebqBUb3NaNKtcgWf6g7EyzfpBEjxm7W
 3DnSm28Ht/IeL3AzSZ7Qvr1oHFI0bOF6lQOU4bic9viyE36Eii5bIjFIRK/yU3w3Nsxm1Ywi5cX
 J4NUB6XaZIPYHBIIHw1lch7dEnKhe
X-Received: by 2002:a50:cd57:: with SMTP id d23mr54117162edj.5.1620984346407; 
 Fri, 14 May 2021 02:25:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwffpojWIdDjWYW/MMXX/wRjb+C923CYpz5CDGlKRq9NSx2v+gQE16nA0IMA6MthtTXx38cuQ==
X-Received: by 2002:a50:cd57:: with SMTP id d23mr54117114edj.5.1620984346105; 
 Fri, 14 May 2021 02:25:46 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6501.dip0.t-ipconnect.de. [91.12.101.1])
 by smtp.gmail.com with ESMTPSA id
 gt12sm3267244ejb.60.2021.05.14.02.25.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 02:25:45 -0700 (PDT)
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>, Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Ingo Molnar <mingo@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Kees Cook <keescook@chromium.org>, "Kirill A. Shutemov"
 <kirill@shutemov.name>, Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org, x86@kernel.org
References: <20210513184734.29317-1-rppt@kernel.org>
 <20210513184734.29317-6-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v19 5/8] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <b625c5d7-bfcc-9e95-1f79-fc8b61498049@redhat.com>
Date: Fri, 14 May 2021 11:25:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513184734.29317-6-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_022550_609975_99E9181A 
X-CRM114-Status: GOOD (  31.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

>   #ifdef CONFIG_IA64
>   # include <linux/efi.h>
> @@ -64,6 +65,9 @@ static inline int valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
>   #ifdef CONFIG_STRICT_DEVMEM
>   static inline int page_is_allowed(unsigned long pfn)
>   {
> +	if (pfn_valid(pfn) && page_is_secretmem(pfn_to_page(pfn)))
> +		return 0;
> +

1. The memmap might be garbage. You should use pfn_to_online_page() instead.

page = pfn_to_online_page(pfn);
if (page && page_is_secretmem(page))
	return 0;

2. What about !CONFIG_STRICT_DEVMEM?

3. Someone could map physical memory before a secretmem page gets 
allocated and read the content after it got allocated and gets used. If 
someone would gain root privileges and would wait for the target 
application to (re)start, that could be problematic.


I do wonder if enforcing CONFIG_STRICT_DEVMEM would be cleaner. 
devmem_is_allowed() should disallow access to any system ram, and 
thereby, any possible secretmem pages, avoiding this check completely.


[...]

>   
> diff --git a/mm/secretmem.c b/mm/secretmem.c
> new file mode 100644
> index 000000000000..1ae50089adf1
> --- /dev/null
> +++ b/mm/secretmem.c
> @@ -0,0 +1,239 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright IBM Corporation, 2021
> + *
> + * Author: Mike Rapoport <rppt@linux.ibm.com>
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/fs.h>
> +#include <linux/swap.h>
> +#include <linux/mount.h>
> +#include <linux/memfd.h>
> +#include <linux/bitops.h>
> +#include <linux/printk.h>
> +#include <linux/pagemap.h>
> +#include <linux/syscalls.h>
> +#include <linux/pseudo_fs.h>
> +#include <linux/secretmem.h>
> +#include <linux/set_memory.h>
> +#include <linux/sched/signal.h>
> +
> +#include <uapi/linux/magic.h>
> +
> +#include <asm/tlbflush.h>
> +
> +#include "internal.h"
> +
> +#undef pr_fmt
> +#define pr_fmt(fmt) "secretmem: " fmt
> +
> +/*
> + * Define mode and flag masks to allow validation of the system call
> + * parameters.
> + */
> +#define SECRETMEM_MODE_MASK	(0x0)
> +#define SECRETMEM_FLAGS_MASK	SECRETMEM_MODE_MASK
> +
> +static bool secretmem_enable __ro_after_init;
> +module_param_named(enable, secretmem_enable, bool, 0400);
> +MODULE_PARM_DESC(secretmem_enable,
> +		 "Enable secretmem and memfd_secret(2) system call");
> +
> +static vm_fault_t secretmem_fault(struct vm_fault *vmf)
> +{
> +	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
> +	struct inode *inode = file_inode(vmf->vma->vm_file);
> +	pgoff_t offset = vmf->pgoff;
> +	gfp_t gfp = vmf->gfp_mask;
> +	unsigned long addr;
> +	struct page *page;
> +	int err;
> +
> +	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
> +		return vmf_error(-EINVAL);
> +
> +retry:
> +	page = find_lock_page(mapping, offset);
> +	if (!page) {
> +		page = alloc_page(gfp | __GFP_ZERO);

We'll end up here with gfp == GFP_HIGHUSER (via the mapping below), correct?

> +		if (!page)
> +			return VM_FAULT_OOM;
> +
> +		err = set_direct_map_invalid_noflush(page, 1);
> +		if (err) {
> +			put_page(page);
> +			return vmf_error(err);

Would we want to translate that to a proper VM_FAULT_..., which would 
most probably be VM_FAULT_OOM when we fail to allocate a pagetable?

> +		}
> +
> +		__SetPageUptodate(page);
> +		err = add_to_page_cache_lru(page, mapping, offset, gfp);
> +		if (unlikely(err)) {
> +			put_page(page);
> +			/*
> +			 * If a split of large page was required, it
> +			 * already happened when we marked the page invalid
> +			 * which guarantees that this call won't fail
> +			 */
> +			set_direct_map_default_noflush(page, 1);
> +			if (err == -EEXIST)
> +				goto retry;
> +
> +			return vmf_error(err);
> +		}
> +
> +		addr = (unsigned long)page_address(page);
> +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);

Hmm, to me it feels like something like that belongs into the 
set_direct_map_invalid_*() calls? Otherwise it's just very easy to mess 
up ...


I'm certainly not a filesystem guy. Nothing else jumped at me.


To me, the overall approach makes sense and I consider it an improved 
mlock() mechanism for storing secrets, although I'd love to have some 
more information in the log regarding access via root, namely that there 
are still fancy ways to read secretmem memory once root via

1. warm reboot attacks especially in VMs (e.g., modifying the cmdline)
2. kexec-style reboot attacks (e.g., modifying the cmdline)
3. kdump attacks
4. kdb most probably
5. "letting the process read the memory for us" via Kees if that still
    applies
6. ... most probably something else

Just to make people aware that there are still some things to be sorted 
out when we fully want to protect against privilege escalations.

(maybe this information is buried in the cover letter already, where it 
usually gets lost)

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
