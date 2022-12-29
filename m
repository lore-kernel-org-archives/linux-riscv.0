Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F237BC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Dec 2022 16:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=mRE/Scbq6SLimL+7X1EAnTqNEowYHazqImwb1SB/Zpo=; b=hrHjEHJxECTcq8SimJObVMMD56
	SshVMi8xaOYjHZZu2qUgBT+OdtP6dDALLB0hSTZM7ry/a3ecaLNnhXXXI7sQw1Yx2tu8ZStwLXcIe
	xMWt0BKndsMuaYYX2gFymLxlC5UsmgASlQ99fFzXO2x9FEqwFTZBqQ8EOpt8ei40U2KTpOBufq7OO
	//FG41dIvjqEExuHU/vH+u9uipZORRLB+n9arhz8XkRb3JUvd7oy/eHsV8wlSGzZB/aEz2bKc6+Fv
	4hr9oO8eEsjVtFnHYQv/ThE/KkbotSKPdFt12Mpnna3G5BJfXIaAzK3YueXsD/XH+58Dt7sS9OQno
	MbnmxoAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAvfz-00HQ8N-N4; Thu, 29 Dec 2022 16:22:39 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAvfp-00HPyv-6Q
	for linux-riscv@lists.infradead.org; Thu, 29 Dec 2022 16:22:32 +0000
Received: by mail-pj1-x1034.google.com with SMTP id j8-20020a17090a3e0800b00225fdd5007fso9725603pjc.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Dec 2022 08:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ec85AyiKc77bI9XsP5tX5lamemx/Nh18BP3PMc4R5sU=;
        b=JyJ1HotxL5h5gP0PAUr+bSyy8u1zOFXKWz1ZfgSiQeQvzYRYtdYK5A29TTv7eUyBSq
         O6WUTpHiy10Kl0hHmRgy/d9fal5bMY/E/lNTQ2LCgCfG8iVu/uN6+Uj5ExC6mHOnsXiu
         0ohB97kr44YJgmKniWXNLUoVi+8oVMmtdexytQrx6+rzrxhktuoTfzAedL35hCbYbn09
         5yB5XsMVIjKdTNReT5H6YpQsO7a4nnDDcbUBIjnPH2H4vmdpB5S32Eq6ZsH3EXQnBVqu
         h/JxK+dWLoxFuxlgdjXCLEO7aHIvjXxyMe2Wjpx0m1kdrzxduQK6w3r0Q8wQ2fW6djA1
         pXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ec85AyiKc77bI9XsP5tX5lamemx/Nh18BP3PMc4R5sU=;
        b=j9Rhkz+MR7WiV98KPMm32jqi+flKxrFF2Aov5GAGOVwWc5bZf8kAfTmbUwZBsdJNQU
         IjcKV6rNyWcB236UFv26cXLY2anU2TTkENIwp0iMDdOA9AXpCebCwcbJMqiHveT1ippL
         HyIBLGJEaR0e6W7oTuY15i5TYr12MmzRsZbi2rVNrqPVk+WG2zO3Xo//9T44+Va8QpTH
         ZjHpaemhG2lIAM7KhndpkZGRLU+T9EFdhWvJiXoi9Qx2zfpz+YrWWuhPQyqy+nfMosVc
         UGWtlmU1IFRL8oYZPCNYWT6VKMiZSc4onx5GZKOEobB6jl/1Pm9RA9K95eclVWwFsiSY
         ajvQ==
X-Gm-Message-State: AFqh2kpPdwNcgQnOme5QP3F4JlI9x1FMGOY4skpHKtvMvni+KCAtUuXG
	2biNgmA22yKOkWMkpcU7TVD6bN2mcoyaG9Cu
X-Google-Smtp-Source: AMrXdXvdOJhcRsj0KUW218UKcAvJUd1l0xKIGxZQv8spR2kcI0qwBPtGX+cj507spyFm31HkJycFdg==
X-Received: by 2002:a17:902:a981:b0:187:403c:7a3b with SMTP id bh1-20020a170902a98100b00187403c7a3bmr25977484plb.69.1672330943683;
        Thu, 29 Dec 2022 08:22:23 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id o4-20020a170902bcc400b0019254c19697sm13000824pls.289.2022.12.29.08.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:22:23 -0800 (PST)
Date: Thu, 29 Dec 2022 08:22:23 -0800 (PST)
X-Google-Original-Date: Thu, 29 Dec 2022 07:51:42 PST (-0800)
Subject: Re: [RFC PATCH] mm: remove zap_page_range and change callers to use zap_vma_page_range
In-Reply-To: <20221216192012.13562-1-mike.kravetz@oracle.com>
CC: linux-mm@kvack.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
  linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, netdev@vger.kernel.org, david@redhat.com,
  mhocko@suse.com, peterx@redhat.com, nadav.amit@gmail.com, willy@infradead.org, vbabka@suse.cz,
  riel@surriel.com, Will Deacon <will@kernel.org>, mpe@ellerman.id.au, borntraeger@linux.ibm.com,
  dave.hansen@linux.intel.com, brauner@kernel.org, edumazet@google.com, akpm@linux-foundation.org,
  mike.kravetz@oracle.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mike.kravetz@oracle.com
Message-ID: <mhng-3136c2a0-6953-4794-856c-46cacdc2c30a@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_082229_373482_C096C6EA 
X-CRM114-Status: GOOD (  18.21  )
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

On Fri, 16 Dec 2022 11:20:12 PST (-0800), mike.kravetz@oracle.com wrote:
> zap_page_range was originally designed to unmap pages within an address
> range that could span multiple vmas.  While working on [1], it was
> discovered that all callers of zap_page_range pass a range entirely within
> a single vma.  In addition, the mmu notification call within zap_page
> range does not correctly handle ranges that span multiple vmas as calls
> should be vma specific.
>
> Instead of fixing zap_page_range, change all callers to use the new
> routine zap_vma_page_range.  zap_vma_page_range is just a wrapper around
> zap_page_range_single passing in NULL zap details.  The name is also
> more in line with other exported routines that operate within a vma.
> We can then remove zap_page_range.
>
> Also, change madvise_dontneed_single_vma to use this new routine.
>
> [1] https://lore.kernel.org/linux-mm/20221114235507.294320-2-mike.kravetz@oracle.com/
> Suggested-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> ---
>  arch/arm64/kernel/vdso.c                |  4 ++--
>  arch/powerpc/kernel/vdso.c              |  2 +-
>  arch/powerpc/platforms/book3s/vas-api.c |  2 +-
>  arch/powerpc/platforms/pseries/vas.c    |  2 +-
>  arch/riscv/kernel/vdso.c                |  4 ++--
>  arch/s390/kernel/vdso.c                 |  2 +-
>  arch/s390/mm/gmap.c                     |  2 +-
>  arch/x86/entry/vdso/vma.c               |  2 +-
>  drivers/android/binder_alloc.c          |  2 +-
>  include/linux/mm.h                      |  7 ++++--
>  mm/madvise.c                            |  4 ++--
>  mm/memory.c                             | 30 -------------------------
>  mm/page-writeback.c                     |  2 +-
>  net/ipv4/tcp.c                          |  6 ++---
>  14 files changed, 22 insertions(+), 49 deletions(-)

[snip]

> diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> index e410275918ac..a405119da2c0 100644
> --- a/arch/riscv/kernel/vdso.c
> +++ b/arch/riscv/kernel/vdso.c
> @@ -127,10 +127,10 @@ int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
>  		unsigned long size = vma->vm_end - vma->vm_start;
>
>  		if (vma_is_special_mapping(vma, vdso_info.dm))
> -			zap_page_range(vma, vma->vm_start, size);
> +			zap_vma_page_range(vma, vma->vm_start, size);
>  #ifdef CONFIG_COMPAT
>  		if (vma_is_special_mapping(vma, compat_vdso_info.dm))
> -			zap_page_range(vma, vma->vm_start, size);
> +			zap_vma_page_range(vma, vma->vm_start, size);
>  #endif
>  	}

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
