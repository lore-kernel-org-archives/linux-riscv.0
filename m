Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DADFD46626
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 21:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wU68VnnsMvdlJmd7UO1vPnCEtA3SYRE3umYXn+WQ6os=; b=0ZYnXIG9/7Lh2onHhWtft0+G82
	PxL2RPReKhssm4QBft8NmF+TQVKHPGswZspFsFufpjYW4Sa0qI2aqv2eqn+a3chRhYd6d5X8Frwpm
	Qfdpk5VIAbIsmYT79mTXaqYmaIzjs+W6nK5I7C8QTft6FwFqggeMZ6UH1DWSSmESAecs7dapGmGJZ
	Uecla5r80kMO/PyGBx/jZcRl/2yGbJyop1zldWSdeFIWjc95H6azMDhslmqjvLuJqXNNwqtC65Zkf
	NxEfw0f/1GwIPwTGAXyZ0g9h0NfNlnviEBWskMjtJloPAAh++hOm7Ylk0MN0voI7s/ei6Jnd7c8zU
	o++6+Udg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUYm-0000000DCad-3eIe;
	Thu, 15 Jan 2026 21:07:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUYk-0000000DCa5-2v4h
	for linux-riscv@bombadil.infradead.org;
	Thu, 15 Jan 2026 21:07:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:MIME-Version:References:In-Reply-To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=y4BwArZ5FLhyM5BEN34gjuDvwbvdpN2Nxoskvco/5nM=; b=iVEkrGCpFz5smMO8QC/REyE7Ti
	hJHG/9esuC7sCEB8puDK9FhIZsitCa60ihjlyJk0vgjxAhL+lq3SB1YrElptckxolb2lp0+LMRVva
	hhC77JwgY8QLqCwAO6QKzqcImj61UYcTAsr7MaxylcuLcJazi5s2YlgaOKVszGBbQMgb4mSLmqziz
	lHKn8TLJY6J6ZzYkOnc5Xw3ZB9LG+wu3ufHWWJXHbcKJzzzZHqQtqPmrqMHqHQ/OCExE6dGmZcMUz
	xIMNTz/XUXZJxzmKVc7ao0hIbXMTt/jW9pjw3gdAhpc58SDl8EypNj/HBw/CnTM249ddqCdYdwUVQ
	LbNrTY0A==;
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUYg-00000008SoS-2J0x
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 21:07:13 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-5eea3fe88bdso488907137.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 13:07:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768511227; cv=none;
        d=google.com; s=arc-20240605;
        b=Tm9cGpcFmdGIvzB1JfMqwsXfKKZrK+icf7TUr9tx8v9AHDPsR5b4nA2KoxPIbzPxk/
         tJz2JFp9gBrfnzyOdWmdsqHJKpum/tlY9EyOWmhtuRWe0k6SAQcooBwetI6viyGN3JHB
         YD8/25n/WNP9Ihe/pYxoL6dIlCSlFzkXhKlZtxtQDpSd2tMGa+7/n1K33a4hLVD8ePrs
         S23BfNVbi/2wL+UkGndP7qZx4Qq1j5fB+k96egCq76egmvB6fbEwjDRMh6o/Xf4KAOlw
         p936G3Br0NQ344tRTOvAqev2t66UZwSr1VWuEf/V++ENFA360OfDNOHt9s30lQPfRxel
         hVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=y4BwArZ5FLhyM5BEN34gjuDvwbvdpN2Nxoskvco/5nM=;
        fh=tnUVZIg88SyzDuswtYu0+EOVNYzXU1p7CMHHkrAUpRE=;
        b=hOKkd1L1WCV1ma9f5GW1gxwqNgkcekB9t3DYaZBHgyu3hDyhv/RHO9E9SlFA7SSLyP
         QV+wdlxBtrz+zJGNCs9krnhspkwBdMEtTfcAPo4PRb6oinPLu5u7bVN8U5BNsC0c0Av4
         ricIjOn4BmxIj5TYPoUidYYwyUjRvoYP9+aikc0Nd7e3u/6N561Uo84TjGYbvWQtIj7S
         T3N2DXFaUIHgjkCKD8aRy0Clbbm64hxBPeZWJpSlbsqtjdXpfsSqKUaFdF/LFOkIRqdt
         VsYWUbdrcXkmOw8CGDX2WdEA+TOwJsbsDbY7+yXVowK+P26bvOH/FBYeKUUtp3LC5uPG
         4eUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768511227; x=1769116027; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y4BwArZ5FLhyM5BEN34gjuDvwbvdpN2Nxoskvco/5nM=;
        b=vs9WPO2R71Z0+BE7ZmE0PXo4mja+ck1ywUfTlYQplmj9aFQ2WDnbGKegp/wvNsdxFj
         /J8ZWbtO9MJk7MpN7IKuMo0VIwxkdzNuPgRvwadws4QoVnf6ksl09a4PUdHdd39GCklL
         usyxN540Otx4BoudQi70Wcxw0PgF9GdW8ys7xAZs+OYnS187Lmy4XpPJFqMi1fybiUkt
         zdyX1gfn8gKyEcaR3Y3w4xFZxeNdlJEHhSDwAWpOHY7/Ifkc93nTQfxGzWf39XxjCqI8
         f4k25pMIHdH0VPinkNMe2/1Ph38mvL0Ul1CGparV8ZkmGQ34pAM/i3qB4gFvHuCsGbiM
         nPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511227; x=1769116027;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4BwArZ5FLhyM5BEN34gjuDvwbvdpN2Nxoskvco/5nM=;
        b=lkqX2OtVKbr6TrEcVo4vdPEuOY9Wl2lJuFkfzwUXlgZlpaTAFeVOLR+CfUtVc2NaKH
         LhkxwN2SZVXlXeHXxPGhnzVePJgOZgTiUE4egxJm3gujNun7FWkIp6UNsd3K1wpDi1eT
         vGpn4KfkSXg0aKVHbCJJ5w9HxnI3+sC9z3VGZ1qVUynz+B+uh2AaC9OPM+GAt83MJXsf
         4VWZReKHEelK2lDWh7qD4vApyWgfLg5lD7j0DYbfmpE8pQr5SxkzApSQx9n3WlLYcDJz
         cOyrI4F3jxEDsSM9zL7ue5Sf8eJU+nOB/u0El2kt/bOwvL5h978HAg8CGNRUcRXo1QYI
         FqmA==
X-Forwarded-Encrypted: i=1; AJvYcCXyqlqykkL8G/VRAxCQXQUJpjB6TIayUPkNAqnsSSKvncPo+6BghUVH3P5++2EYG0uHDjR40+vGCo2Ctw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHxkc9rKMONcsWHS5SjLAEEhSiKN8aaG6zBmB2rpMNwqQacddn
	gTnxfjDnEDdfvjHAoriqkO/xjv84k/XctsDYGKcbdW+/NDWRs5v7CX/QsEAXhMkwYIajt3WboVm
	hnyk5rN44lyEkVQdSCYoP7+HbFQDPP7Q3Habk7uJp
X-Gm-Gg: AY/fxX4BN7p5mq1jhIQZPxLV9LmkpAwzqeR2S1wrN5pv8tSUK1jS6QY/OA8HqbdvPMM
	/c/SUYUM9G2UOeBemiDnJHK2d/XxGBjGUNotJV+3OAPT76XsUY1i4Hz4velVViFmmGu+gyKDbnl
	CqWDwRPYmRRj179vIo9D87Bp8iBg1gQDz93xBMV/t2cOI4lZl2uFazrkJ1nyt9kW9YArI6XBPIs
	3nHASa+80hJ1WyF7OOSiBl56PWLpi+1dTsu2fUEJeHYh6p2KDBJuVF2Y/tjz76HxuAzFSVyvOj5
	3WlJ/QNhr/biKyoK1v673iyr5Q==
X-Received: by 2002:a05:6102:945:b0:5df:aff3:c41c with SMTP id
 ada2fe7eead31-5f1a719e362mr155618137.30.1768511226367; Thu, 15 Jan 2026
 13:07:06 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jan 2026 13:07:05 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jan 2026 13:07:05 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260114134510.1835-2-kalyazin@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-2-kalyazin@amazon.com>
MIME-Version: 1.0
Date: Thu, 15 Jan 2026 13:07:05 -0800
X-Gm-Features: AZwV_QitN6L4bb0XJb_ZZH7nFdRT7CH1pyddv4cbgutSArI7UeCs00Q7KzDEw7c
Message-ID: <CAEvNRgGXeow48BUJYyuAOUp8qK97v1LdF4KdTB=Nbk7pTs9tfw@mail.gmail.com>
Subject: Re: [PATCH v9 01/13] set_memory: add folio_{zap,restore}_direct_map helpers
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
X-CRM114-CacheID: sfid-20260115_210710_636193_BB72720C 
X-CRM114-Status: GOOD (  14.15  )
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

> From: Nikita Kalyazin <kalyazin@amazon.com>
>
> These allow guest_memfd to remove its memory from the direct map.
> Only implement them for architectures that have direct map.
> In folio_zap_direct_map(), flush TLB on architectures where
> set_direct_map_valid_noflush() does not flush it internally.
>
> The new helpers need to be accessible to KVM on architectures that
> support guest_memfd (x86 and arm64).  Since arm64 does not support
> building KVM as a module, only export them on x86.
>
> Direct map removal gives guest_memfd the same protection that
> memfd_secret does, such as hardening against Spectre-like attacks
> through in-kernel gadgets.
>
> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
> ---
>  arch/arm64/include/asm/set_memory.h     |  2 ++
>  arch/arm64/mm/pageattr.c                | 12 ++++++++++++
>  arch/loongarch/include/asm/set_memory.h |  2 ++
>  arch/loongarch/mm/pageattr.c            | 16 ++++++++++++++++
>  arch/riscv/include/asm/set_memory.h     |  2 ++
>  arch/riscv/mm/pageattr.c                | 16 ++++++++++++++++
>  arch/s390/include/asm/set_memory.h      |  2 ++
>  arch/s390/mm/pageattr.c                 | 18 ++++++++++++++++++
>  arch/x86/include/asm/set_memory.h       |  2 ++
>  arch/x86/mm/pat/set_memory.c            | 20 ++++++++++++++++++++
>  include/linux/set_memory.h              | 10 ++++++++++
>  11 files changed, 102 insertions(+)
>
> diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
> index 90f61b17275e..d949f1deb701 100644
> --- a/arch/arm64/include/asm/set_memory.h
> +++ b/arch/arm64/include/asm/set_memory.h
> @@ -14,6 +14,8 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
>  int set_direct_map_invalid_noflush(struct page *page);
>  int set_direct_map_default_noflush(struct page *page);
>  int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
> +int folio_zap_direct_map(struct folio *folio);
> +int folio_restore_direct_map(struct folio *folio);
>  bool kernel_page_present(struct page *page);
>
>  int set_memory_encrypted(unsigned long addr, int numpages);
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index f0e784b963e6..a94eff324dda 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -357,6 +357,18 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
>  	return set_memory_valid(addr, nr, valid);
>  }
>
> +int folio_zap_direct_map(struct folio *folio)
> +{
> +	return set_direct_map_valid_noflush(folio_page(folio, 0),
> +					    folio_nr_pages(folio), false);
> +}
> +
> +int folio_restore_direct_map(struct folio *folio)
> +{
> +	return set_direct_map_valid_noflush(folio_page(folio, 0),
> +					    folio_nr_pages(folio), true);
> +}
> +

Was going to suggest a _noflush suffix to these functions, but saw
Aneesh's comment that these functions actually do flush_tlb_kernel [1]

[1] https://lore.kernel.org/all/yq5ajz07czvz.fsf@kernel.org/

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

>  #ifdef CONFIG_DEBUG_PAGEALLOC
>  /*
>   * This is - apart from the return value - doing the same
>
> [...snip...]
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
