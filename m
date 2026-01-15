Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468E7D4662F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 21:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mshFj/ZnyVWK60NyoYuD+BD/W+nc4CZ6/ofuQh7chXs=; b=K1R0dQ6Lz3xFEHwuCxRjgcP6HX
	z+xUwxB1BV4wcYMdfoHq+GE+HjH+hUzRv2kCSIxY5yVxBLzdU8/cyrPMXWcESR/FpsIzYPN0sNAH4
	2x5wFTe35X/DgDGp3qvvf05vUVGS43S5WFxhj/Di3p4mrEKjBzeII7XK26Vx300ZeBonRLoKR5M97
	szp3h0S/uPyAZXLyAlGnP7+BIZNpq8yIQzZdmjsAuvqDvG9EDYOs6GN1py4c1pLuuWNtm1r1fYkOk
	aJ+FYNwlk18EPZjBt59uVNetKxPiy9YTAye0fLFywAfBQxZsDre7cmXo7u/x5tL+nsrZvfG5zu5Xk
	4h3eyqJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgV4z-0000000DEBZ-1Zz2;
	Thu, 15 Jan 2026 21:40:33 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgV4x-0000000DEBA-23if
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 21:40:32 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-5eea6f90d7fso994434137.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 13:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768513230; x=1769118030; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4NEsY4l4MT9Q6cBqefYtZtOy3s+dR+V7JNDYTBav7MA=;
        b=LDA7DcJH6JzPEhFMpGO2SZsMxPM1pO4sSpwbt0OqXjD6lq8QxPQM3B9aR/r4yXYUVG
         xsrbUtAQ2gaaQB7UXdNNih4/6RdELdR7jbiy0Vo+m/8ah+cPdFIozLgWOOaPOscfMkMz
         z+WSZTx9gOuxVTIPBQKeqbRrf3/cpZ26aS/md1H8bQdluGFIZP7x4iQ1rnnSX+3ND8lS
         e5vV10E1EGh22BX789t4CsMPB9vJUQf2oksUWJPbvKgvMMKPYUJZpnB2bIkUK4RHuOjd
         APPlKHy5jsT5Mty4tPHFwlQfkpCamB1rle4s7xU2NN9CeWgCzid0xs8wrmH+7Semotgf
         Q9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768513230; x=1769118030;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NEsY4l4MT9Q6cBqefYtZtOy3s+dR+V7JNDYTBav7MA=;
        b=hy/BnQikSuOMVuort/9cMDBUDnfM89IRUml38ETJ52tfkYIfxwmOyjCcn8iOngjgQl
         sOcXkcFSAlKERvTOuaOxXFwSlwfoJ+4O57keRMNRhzgTauNpP5GO4pFW5ttaiynAfSMv
         wwX5PaAriEx7FBOo/LRjsIDdjXv7JPCfJFj6YS1s7qxji6Rl/cVcT7rtnZ9Ez/Vmm9QC
         5JBO3TnAZhfASDIj6+Zu4AONWaVIvwjFEu2yzuAjOq22aHsRIbGy5nfa9d17qdTt4epk
         Vj6R6SnM40Lzhoakl6bO1daEtCN103dViFQYQ2ACeyoxVhMMj0VmZGqfxKyNzLGkGWKh
         EmYg==
X-Forwarded-Encrypted: i=1; AJvYcCXR6Rb0XqNJu1sytcSR13N/xoxVl3ef79yw2KeEwOZnKKI7Claqyi+rcTSg58AtIAvhl5SPRHnvZ8SpUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YytKw4+jj6dFyQbVg6XE4jn8ieP9xM4dlmKMpIOBsZc8AFASvNX
	LSan2iwEbi0FEvrGm25vvY5V2F8ZnRDEV1YjS1lFrI6jLvSiRm2L7GrwIOQdQh9Oou94Gg//+lF
	eFilV1Xv+ErNp/DTPACjcXVO4fTOM29QroixTZHm1
X-Gm-Gg: AY/fxX6ben86CmYfBNp/56J07MuZBIHjGng0TffvGi2t6UqEgDH9aknd4zIKfwoNAjW
	iK7FWB/mesRMqd3BblXAthe0m+vmQganjZW5gvJJrdW3h7Mzyo57YOwz8koquKE3KkMW0tI1HYa
	gvzvIv5BKsQTvZNJ9ey33bMeCn0CfNgjbZS67tIRXu/JNt2a3PdaF166gHHTZFhtAWnJE4XfUhJ
	lGrVoFwo20rZtoi4H8mIsIVkIe4y4FRh0MBLHVtc6zxBHOZr+CREOAZWsNiL4pbqqIM0MojxYZj
	r0ImbFf0hPHndX9lQWGQ2h/OIQtNE+jKed3A
X-Received: by 2002:a05:6102:947:b0:5db:cec7:810b with SMTP id
 ada2fe7eead31-5f1a556dabcmr465899137.29.1768513229577; Thu, 15 Jan 2026
 13:40:29 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jan 2026 13:40:28 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jan 2026 13:40:28 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260114134510.1835-3-kalyazin@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-3-kalyazin@amazon.com>
MIME-Version: 1.0
Date: Thu, 15 Jan 2026 13:40:28 -0800
X-Gm-Features: AZwV_Qj-0gm6vYHJJ3iH96aBpuGEWZXgwnMiQkeNvlZWuDVc-Nc0GygCth2Cvyc
Message-ID: <CAEvNRgGrpv5h04s+btubhUFHo=d6mBFbr2BVrMt=bWuWOztdJQ@mail.gmail.com>
Subject: Re: [PATCH v9 02/13] mm/gup: drop secretmem optimization from gup_fast_folio_allowed
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
X-CRM114-CacheID: sfid-20260115_134031_571368_A6BB7469 
X-CRM114-Status: GOOD (  20.50  )
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
> This drops an optimization in gup_fast_folio_allowed() where
> secretmem_mapping() was only called if CONFIG_SECRETMEM=y. secretmem is
> enabled by default since commit b758fe6df50d ("mm/secretmem: make it on
> by default"), so the secretmem check did not actually end up elided in
> most cases anymore anyway.
>
> This is in preparation of the generalization of handling mappings where
> direct map entries of folios are set to not present.  Currently,
> mappings that match this description are secretmem mappings
> (memfd_secret()).  Later, some guest_memfd configurations will also fall
> into this category.
>
> Signed-off-by: Patrick Roy <patrick.roy@linux.dev>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
> ---
>  mm/gup.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/mm/gup.c b/mm/gup.c
> index 95d948c8e86c..9cad53acbc99 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2739,7 +2739,6 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
>  {
>  	bool reject_file_backed = false;
>  	struct address_space *mapping;
> -	bool check_secretmem = false;
>  	unsigned long mapping_flags;
>
>  	/*
> @@ -2751,14 +2750,6 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)

Copying some lines the diff didn't contain:

	/*
	 * If we aren't pinning then no problematic write can occur. A long term
	 * pin is the most egregious case so this is the one we disallow.
	 */
	if ((flags & (FOLL_PIN | FOLL_LONGTERM | FOLL_WRITE)) ==
	    (FOLL_PIN | FOLL_LONGTERM | FOLL_WRITE))

If we're pinning, can we already return true here? IIUC this function
is passed a folio that is file-backed, and the check if (!mapping) is
just there to catch the case where the mapping got truncated.

Or should we wait for the check where the mapping got truncated? If so,
then maybe we can move this "are we pinning" check to after this check
and remove the reject_file_backed variable?

	/*
	 * The mapping may have been truncated, in any case we cannot determine
	 * if this mapping is safe - fall back to slow path to determine how to
	 * proceed.
	 */
	if (!mapping)
		return false;


>  		reject_file_backed = true;
>
>  	/* We hold a folio reference, so we can safely access folio fields. */
> -
> -	/* secretmem folios are always order-0 folios. */
> -	if (IS_ENABLED(CONFIG_SECRETMEM) && !folio_test_large(folio))
> -		check_secretmem = true;
> -
> -	if (!reject_file_backed && !check_secretmem)
> -		return true;
> -
>  	if (WARN_ON_ONCE(folio_test_slab(folio)))
>  		return false;
>
> @@ -2800,7 +2791,7 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
>  	 * At this point, we know the mapping is non-null and points to an
>  	 * address_space object.
>  	 */
> -	if (check_secretmem && secretmem_mapping(mapping))
> +	if (secretmem_mapping(mapping))
>  		return false;
>  	/* The only remaining allowed file system is shmem. */
>  	return !reject_file_backed || shmem_mapping(mapping);
> --
> 2.50.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
