Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD20FC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 03:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=BJ6tLgj7W22SywiKrvGKz3hVE7vLHe7IthGoBDO1YJY=; b=ddhZfSAeR99nY8Ozc6OOX7HLmg
	qyCmk0jpGRvS1C7/IkibK0ldxahLc4IDPCGk92wS42C/alj3INVGNLEDHutZ/NVzCNjaNyyK1NYUH
	NDHmSUg0FChs8GjMCQ/izuJKHFYRjayn5QbLSn6jkSgCNKGdU4byeDhpxpIJLeDQv1d6/SKFb+UoR
	NekPtYBgSKVhKgf+lhHvHWc9gmyIdDOEWEhbE37wjl0OkdbaxfdJ9bn+2it/ITPEFBg4e5YjGRQD9
	doSss2AjJg1tHMV2WNkEO8awgF9uG8BodJfkgeZuahyJTtPyH8dD6MHFwQkl0yJ1S07MIW3Y0V6we
	0hgmOJXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS8KH-004VHv-AB; Wed, 15 Feb 2023 03:19:21 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS8KF-004VGy-0C
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 03:19:20 +0000
Received: by mail-pl1-x62f.google.com with SMTP id h4so11162096pll.9
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 19:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBDtDorWVGGnbAJlstCVLXC4KgZYcpfN89nn0eLodho=;
        b=TDWQ9PmrwvLUcTo0lBlRuDBs6LfyqBjYoFXCZSj6/7iKJCjhRwcJUbUfI2buPyb9rd
         xeco65Idbt5F69GXs19eLIIr/E1mdOW2sDO18XzrsZBD+rCxSEr0HrphkGMlLecQRNWE
         fKVUl2wxjhX+iWtZIZ57DBC+0rBbt0ZIv31fmglw+YVgSA6KxZa6p66Eua+MsJsNGMI8
         QUdukJNui/NdiTy6lOPb8nzXYjzh8NSH1P61qaqV/ULSjXcyz1Qe24/S8Er3ohkeZQiP
         ZlVHKsxbxVvaOFpdk5QC1EZcAOetNy6F/lOwxCTH9nYKnwp5L9U3HtfofiOq7NcIsB2B
         A1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBDtDorWVGGnbAJlstCVLXC4KgZYcpfN89nn0eLodho=;
        b=klf+7WTxA9eC4TSjhYtJTRAVvGd22inuWz9tHSFiPzq2bh6H5E+80fLT/y/74mMNjr
         l0vQyuHw/CtXjSl+apw850fb3DoC7sj87siHrFP8jJ4KXqTCirj/zrrhlOUGyvaikYez
         jXsbhbLvWrogBdR+Eq70Rg3toKX0HHj7Rcw2eaQNCdjnOukjuKOx1mgNauumyipYd98q
         8/d09gJz8Avo4X9C+4RTDgpc/mYttWPreGaqHfL6JHiLsiQR404FXuMKxLAQUHxZ2Hua
         ifbwRcHw+dUwSUXUKNSIqxAjt9t/pvV9lu++8lIqmeeJ1JF43yKManx3zjZj8uCGcT17
         hfGw==
X-Gm-Message-State: AO0yUKUcZSFhjOVItDYmQRVNUHHwWgAZKvAeny50Ca8HLj6756C9UKcb
	+aNeHbvjJzpsPK4uaHQjfzqNsw==
X-Google-Smtp-Source: AK7set8IZlzKTCD+NS6NLk03tw12Y2YvjAU5Kw+8dpbaSxkri3GTeMpV3jTg9FWVdAem4jZpgiABJg==
X-Received: by 2002:a17:902:d2c8:b0:19a:85d9:93fd with SMTP id n8-20020a170902d2c800b0019a85d993fdmr938693plc.22.1676431157460;
        Tue, 14 Feb 2023 19:19:17 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id s15-20020a170902b18f00b00189bf5dc96dsm10887390plr.230.2023.02.14.19.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 19:19:16 -0800 (PST)
Date: Tue, 14 Feb 2023 19:19:16 -0800 (PST)
X-Google-Original-Date: Tue, 14 Feb 2023 19:19:13 PST (-0800)
Subject: Re: [PATCH] mm: remove zap_page_range and create zap_vma_pages
In-Reply-To: <20230104002732.232573-1-mike.kravetz@oracle.com>
CC: linux-mm@kvack.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
  linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, netdev@vger.kernel.org,
  Christoph Hellwig <hch@infradead.org>, david@redhat.com, mhocko@suse.com, peterx@redhat.com, nadav.amit@gmail.com,
  willy@infradead.org, vbabka@suse.cz, riel@surriel.com, Will Deacon <will@kernel.org>,
  mpe@ellerman.id.au, borntraeger@linux.ibm.com, dave.hansen@linux.intel.com, brauner@kernel.org,
  edumazet@google.com, akpm@linux-foundation.org, mike.kravetz@oracle.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mike.kravetz@oracle.com
Message-ID: <mhng-6dc92fd9-0fe6-4a0d-974f-4f4468f143e4@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_191919_047326_980610B4 
X-CRM114-Status: GOOD (  17.43  )
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

On Tue, 03 Jan 2023 16:27:32 PST (-0800), mike.kravetz@oracle.com wrote:
> zap_page_range was originally designed to unmap pages within an address
> range that could span multiple vmas.  While working on [1], it was
> discovered that all callers of zap_page_range pass a range entirely within
> a single vma.  In addition, the mmu notification call within zap_page
> range does not correctly handle ranges that span multiple vmas.  When
> crossing a vma boundary, a new mmu_notifier_range_init/end call pair
> with the new vma should be made.
>
> Instead of fixing zap_page_range, do the following:
> - Create a new routine zap_vma_pages() that will remove all pages within
>   the passed vma.  Most users of zap_page_range pass the entire vma and
>   can use this new routine.
> - For callers of zap_page_range not passing the entire vma, instead call
>   zap_page_range_single().
> - Remove zap_page_range.
>
> [1] https://lore.kernel.org/linux-mm/20221114235507.294320-2-mike.kravetz@oracle.com/
> Suggested-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>

[...]

> diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> index e410275918ac..5c30212d8d1c 100644
> --- a/arch/riscv/kernel/vdso.c
> +++ b/arch/riscv/kernel/vdso.c
> @@ -124,13 +124,11 @@ int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
>  	mmap_read_lock(mm);
>
>  	for_each_vma(vmi, vma) {
> -		unsigned long size = vma->vm_end - vma->vm_start;
> -
>  		if (vma_is_special_mapping(vma, vdso_info.dm))
> -			zap_page_range(vma, vma->vm_start, size);
> +			zap_vma_pages(vma);
>  #ifdef CONFIG_COMPAT
>  		if (vma_is_special_mapping(vma, compat_vdso_info.dm))
> -			zap_page_range(vma, vma->vm_start, size);
> +			zap_vma_pages(vma);
>  #endif
>  	}

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
