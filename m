Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E12DD4662F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 21:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fQir4NuPs2n/gInkSs7rFEWvnExAZi1D143Um1ra1CQ=; b=P4+bqXrDcB7+qFHtnTCmcFaYxe
	TQ/e/4i1hTyYbQ/Ts85RH0wvdUe7L5vId++CCBkrCQbF6LFSENw0XE4BB123kfc5p6DPATrF47U2p
	6Wc0VCWvTTkVaiE04kWnVlIQ+uaOVFDy8QoRD2/yQn2qWs28xDt1rFO5NA/NjFZPUb7oa1d1/CC8m
	Lwq58iejOnjcxEWo0CzEmiJkBPc/iR+l7NCQN8jVqXpj+qiIKLPbQLDeQke8u+sDhvdQJVWq0XZMt
	e3DzvmoiDQ4KOahXUvjGJhmsUygBnb7QVmXc/w2o0J0jBZiSA//AlmcJkj6nDtmxNUxLQN4EtfIMA
	lKKFxwog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgV7H-0000000DENH-2LcL;
	Thu, 15 Jan 2026 21:42:55 +0000
Received: from mail-ua1-f44.google.com ([209.85.222.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgV7E-0000000DEMZ-1gil
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 21:42:54 +0000
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-93f573ba819so581565241.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 13:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768513370; x=1769118170; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CRW9L/9HA/1Bpy1MjTpDe5h57ZTPcwDUOwqt2sU0Wb8=;
        b=Vz9XpNY/XngSARniYKIn1lBVbjbRycw8Sv+wS7ru8SAitsSgSeh9+NxNfvbQkNsdlt
         C20Z63qvjn7mM258DFj6bDXTGQVIP7lC6MSIjxBl+mW5R/RNlTS3HYyf8fUUgzlhDwHd
         Q+vdRPTgOLtl2d3qVskWbfd9Q6qMcYQtVVFtKdpTBtvIj966FuUJ2+axiPV/2TeFszHy
         mTYtss6bKDntJAQNiUCSyL4j/UPSuW+bINiewq8XSQLx4mOR9Y6fso455MK7ojQC/F/F
         xCZKu1X1Xe9XBTiyDGDVBg9M/dfyspZAU6RO2+S0nIzi2A+1/cdDRBYaLSNFsVCB/W9H
         W7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768513370; x=1769118170;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRW9L/9HA/1Bpy1MjTpDe5h57ZTPcwDUOwqt2sU0Wb8=;
        b=tXityiL3HfX+eIbmuxiYEyBTwB6FumRvuzg29VcSWj0DxvyQVjjFhjrDzPNdAHH0AK
         hxqMIouJkagmIUj8ef15yil7OpF1kmhm3BbWWSO4HU4oHCX8bnp38s0jKX83OvbN0Ysk
         s+RUm5w/9Lk5iD43u6SIV9GTpfxB/TGNUKNc04eyv4IUBVaY7Y/5MU8O/S4gPHeBKAFK
         QS1Y89v1jeFCEDjNTvxQ/6NUu4ZTHfwiOl5hXrmo9NllW4Iqyru0p7Oel3ZgCCjeF5Yx
         sCwvAMTS/NOagsIYSg+jSP9pJvMCzlAr+8GlDxiYEAEPRxjDZ+i7CFkc3xQj0Cx8VCe7
         vQ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsP15L1mSDGyjUgZYXUXKtyP6gGGmdcbu9DQVpB3WRNZvldNT1h9Q8TJiiRqPqY1c9LXn6qkGf1o7xcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZCtBVFgTpA4CXs2ns5D9+v8JlavSsCggv/7Sv+HbGiUtq9C3T
	QOtXlwIVtI63gzJ6jPwFEQVPSI9aRVMS6UjHoyQCUXzlzk/0inh0vDQHu3c0mUd1jgfYbQCG4VD
	OLbiTK7WzGE/Al1oCedypGeoJw0IJNG6tV8GsB86m
X-Gm-Gg: AY/fxX58YVDr0GfuJP5O9ZeTvREPU2i9bGkB1+IPY9Av82ZhD+/4+4KiRRm1vqIDQLt
	WId7PV+oEg2fMTF6io5efVkDM2s/ZG9CYxLVOGswXB7iU7ZJKsQjRyzNnUHHzW3QcQRp/8qa5Ar
	zBRe6yNkpCrLnDIyoNHMJNjiVya+Llr5lM9isVWroyYOQZRGGFATzijduzaxajcf3kxlRvhpWOM
	gyiw3DABzKUIQSE59cAOlWS8HV8R0Kayl2nO3EaM302MU9Ors0eDaoHk+G4N3v1LbBAY+eWFphJ
	sTwTZ3AIKvETPQbm4jrD3Uk/Q8kg+fp6Mcuc
X-Received: by 2002:a05:6102:cc6:b0:5db:20ea:2329 with SMTP id
 ada2fe7eead31-5f1a55a32demr371875137.35.1768513369890; Thu, 15 Jan 2026
 13:42:49 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jan 2026 13:42:48 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jan 2026 13:42:48 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260114134510.1835-4-kalyazin@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-4-kalyazin@amazon.com>
MIME-Version: 1.0
Date: Thu, 15 Jan 2026 13:42:48 -0800
X-Gm-Features: AZwV_Qjy0HC7gblz7T2Mj2ciHvpfRgcw_pe8yM4xzbPDNZpWuI6Qc22FzNRUu1Q
Message-ID: <CAEvNRgF-61VROyB0zG4Gyky_+Pks0wJBX0Uv_ysLGZCw3H8LNQ@mail.gmail.com>
Subject: Re: [PATCH v9 03/13] mm: introduce AS_NO_DIRECT_MAP
To: "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, 
	"ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, 
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, 
	"jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, 
	"shuah@kernel.org" <shuah@kernel.org>, "riel@surriel.com" <riel@surriel.com>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, 
	"yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "prsampat@amd.com" <prsampat@amd.com>, 
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, 
	"jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, 
	"alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, 
	"hca@linux.ibm.com" <hca@linux.ibm.com>, 
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, 
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, 
	"thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, 
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, 
	"vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, 
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, 
	"Thomson, Jack" <jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>, 
	"Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco" <xmarcalx@amazon.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_134252_472963_15ED4608 
X-CRM114-Status: GOOD (  28.87  )
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

"Kalyazin, Nikita" <kalyazin@amazon.co.uk> writes:

> From: Patrick Roy <patrick.roy@linux.dev>
>
> Add AS_NO_DIRECT_MAP for mappings where direct map entries of folios are
> set to not present. Currently, mappings that match this description are
> secretmem mappings (memfd_secret()). Later, some guest_memfd
> configurations will also fall into this category.
>
> Reject this new type of mappings in all locations that currently reject
> secretmem mappings, on the assumption that if secretmem mappings are
> rejected somewhere, it is precisely because of an inability to deal with
> folios without direct map entries, and then make memfd_secret() use
> AS_NO_DIRECT_MAP on its address_space to drop its special
> vma_is_secretmem()/secretmem_mapping() checks.
>
> Use a new flag instead of overloading AS_INACCESSIBLE (which is already
> set by guest_memfd) because not all guest_memfd mappings will end up
> being direct map removed (e.g. in pKVM setups, parts of guest_memfd that
> can be mapped to userspace should also be GUP-able, and generally not
> have restrictions on who can access it).
>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
> Signed-off-by: Patrick Roy <patrick.roy@linux.dev>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
> ---
>  include/linux/pagemap.h   | 16 ++++++++++++++++
>  include/linux/secretmem.h | 18 ------------------
>  lib/buildid.c             |  4 ++--
>  mm/gup.c                  | 10 +++++-----
>  mm/mlock.c                |  2 +-
>  mm/secretmem.c            |  8 ++------
>  6 files changed, 26 insertions(+), 32 deletions(-)
>
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 31a848485ad9..6ce7301d474a 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -210,6 +210,7 @@ enum mapping_flags {
>  	AS_WRITEBACK_MAY_DEADLOCK_ON_RECLAIM = 9,
>  	AS_KERNEL_FILE = 10,	/* mapping for a fake kernel file that shouldn't
>  				   account usage to user cgroups */
> +	AS_NO_DIRECT_MAP = 11,	/* Folios in the mapping are not in the direct map */
>  	/* Bits 16-25 are used for FOLIO_ORDER */
>  	AS_FOLIO_ORDER_BITS = 5,
>  	AS_FOLIO_ORDER_MIN = 16,
> @@ -345,6 +346,21 @@ static inline bool mapping_writeback_may_deadlock_on_reclaim(const struct addres
>  	return test_bit(AS_WRITEBACK_MAY_DEADLOCK_ON_RECLAIM, &mapping->flags);
>  }
>
> +static inline void mapping_set_no_direct_map(struct address_space *mapping)
> +{
> +	set_bit(AS_NO_DIRECT_MAP, &mapping->flags);
> +}
> +
> +static inline bool mapping_no_direct_map(const struct address_space *mapping)
> +{
> +	return test_bit(AS_NO_DIRECT_MAP, &mapping->flags);
> +}
> +
> +static inline bool vma_has_no_direct_map(const struct vm_area_struct *vma)
> +{
> +	return vma->vm_file && mapping_no_direct_map(vma->vm_file->f_mapping);
> +}
> +
>  static inline gfp_t mapping_gfp_mask(const struct address_space *mapping)
>  {
>  	return mapping->gfp_mask;
> diff --git a/include/linux/secretmem.h b/include/linux/secretmem.h
> index e918f96881f5..0ae1fb057b3d 100644
> --- a/include/linux/secretmem.h
> +++ b/include/linux/secretmem.h
> @@ -4,28 +4,10 @@
>
>  #ifdef CONFIG_SECRETMEM
>
> -extern const struct address_space_operations secretmem_aops;
> -
> -static inline bool secretmem_mapping(struct address_space *mapping)
> -{
> -	return mapping->a_ops == &secretmem_aops;
> -}
> -
> -bool vma_is_secretmem(struct vm_area_struct *vma);
>  bool secretmem_active(void);
>
>  #else
>
> -static inline bool vma_is_secretmem(struct vm_area_struct *vma)
> -{
> -	return false;
> -}
> -
> -static inline bool secretmem_mapping(struct address_space *mapping)
> -{
> -	return false;
> -}
> -
>  static inline bool secretmem_active(void)
>  {
>  	return false;
> diff --git a/lib/buildid.c b/lib/buildid.c
> index aaf61dfc0919..b78fe5797e9c 100644
> --- a/lib/buildid.c
> +++ b/lib/buildid.c
> @@ -46,8 +46,8 @@ static int freader_get_folio(struct freader *r, loff_t file_off)
>
>  	freader_put_folio(r);
>
> -	/* reject secretmem folios created with memfd_secret() */
> -	if (secretmem_mapping(r->file->f_mapping))
> +	/* reject folios without direct map entries (e.g. from memfd_secret() or guest_memfd()) */
> +	if (mapping_no_direct_map(r->file->f_mapping))
>  		return -EFAULT;
>
>  	r->folio = filemap_get_folio(r->file->f_mapping, file_off >> PAGE_SHIFT);
> diff --git a/mm/gup.c b/mm/gup.c
> index 9cad53acbc99..11461a54b3ae 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -11,7 +11,6 @@
>  #include <linux/rmap.h>
>  #include <linux/swap.h>
>  #include <linux/swapops.h>
> -#include <linux/secretmem.h>
>
>  #include <linux/sched/signal.h>
>  #include <linux/rwsem.h>
> @@ -1216,7 +1215,7 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
>  	if ((gup_flags & FOLL_SPLIT_PMD) && is_vm_hugetlb_page(vma))
>  		return -EOPNOTSUPP;
>
> -	if (vma_is_secretmem(vma))
> +	if (vma_has_no_direct_map(vma))
>  		return -EFAULT;
>
>  	if (write) {
> @@ -2724,7 +2723,7 @@ EXPORT_SYMBOL(get_user_pages_unlocked);
>   * This call assumes the caller has pinned the folio, that the lowest page table
>   * level still points to this folio, and that interrupts have been disabled.
>   *
> - * GUP-fast must reject all secretmem folios.
> + * GUP-fast must reject all folios without direct map entries (such as secretmem).
>   *
>   * Writing to pinned file-backed dirty tracked folios is inherently problematic
>   * (see comment describing the writable_file_mapping_allowed() function). We
> @@ -2753,7 +2752,7 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
>  	if (WARN_ON_ONCE(folio_test_slab(folio)))
>  		return false;
>
> -	/* hugetlb neither requires dirty-tracking nor can be secretmem. */
> +	/* hugetlb neither requires dirty-tracking nor can be without direct map. */
>  	if (folio_test_hugetlb(folio))
>  		return true;
>
> @@ -2791,8 +2790,9 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
>  	 * At this point, we know the mapping is non-null and points to an
>  	 * address_space object.
>  	 */
> -	if (secretmem_mapping(mapping))
> +	if (mapping_no_direct_map(mapping))
>  		return false;
> +
>  	/* The only remaining allowed file system is shmem. */
>  	return !reject_file_backed || shmem_mapping(mapping);
>  }
> diff --git a/mm/mlock.c b/mm/mlock.c
> index 2f699c3497a5..a6f4b3df4f3f 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -474,7 +474,7 @@ static int mlock_fixup(struct vma_iterator *vmi, struct vm_area_struct *vma,
>
>  	if (newflags == oldflags || (oldflags & VM_SPECIAL) ||
>  	    is_vm_hugetlb_page(vma) || vma == get_gate_vma(current->mm) ||
> -	    vma_is_dax(vma) || vma_is_secretmem(vma) || (oldflags & VM_DROPPABLE))
> +	    vma_is_dax(vma) || vma_has_no_direct_map(vma) || (oldflags & VM_DROPPABLE))
>  		/* don't set VM_LOCKED or VM_LOCKONFAULT and don't count */
>  		goto out;
>
> diff --git a/mm/secretmem.c b/mm/secretmem.c
> index edf111e0a1bb..560cdbe1fe5d 100644
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@ -134,11 +134,6 @@ static int secretmem_mmap_prepare(struct vm_area_desc *desc)
>  	return 0;
>  }
>
> -bool vma_is_secretmem(struct vm_area_struct *vma)
> -{
> -	return vma->vm_ops == &secretmem_vm_ops;
> -}
> -
>  static const struct file_operations secretmem_fops = {
>  	.release	= secretmem_release,
>  	.mmap_prepare	= secretmem_mmap_prepare,
> @@ -156,7 +151,7 @@ static void secretmem_free_folio(struct folio *folio)
>  	folio_zero_segment(folio, 0, folio_size(folio));
>  }
>
> -const struct address_space_operations secretmem_aops = {
> +static const struct address_space_operations secretmem_aops = {
>  	.dirty_folio	= noop_dirty_folio,
>  	.free_folio	= secretmem_free_folio,
>  	.migrate_folio	= secretmem_migrate_folio,
> @@ -205,6 +200,7 @@ static struct file *secretmem_file_create(unsigned long flags)
>
>  	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
>  	mapping_set_unevictable(inode->i_mapping);
> +	mapping_set_no_direct_map(inode->i_mapping);
>
>  	inode->i_op = &secretmem_iops;
>  	inode->i_mapping->a_ops = &secretmem_aops;
> --
> 2.50.1

Thanks also for the cleanups!

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
