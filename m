Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FB1C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 17:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=XcMK9eoPBuPqjMWV/+huHMak9ZaG76Dfgb3HQHYGnZo=; b=Udk0FsQuP/hjFLcgDAg4mFyJn2
	oYd9Gozmxnhu+TDZF8fZLYTiiJ3pgEcSxt7mm7yXZiLt0S/WoWXf+ypb3J3k0FHw3Hlg649Hz2SpE
	Cy6Fji+zFegopupqc4pKuFrSCSd9D3ExRY0Ff1wce73h/0zrYFO2NCg3F/+7CspNjM6Kl1u7nHxvX
	rxgeyVr5WzM1XfXQviDRHm5pndyVUszC5ygmtKtsYPEfmv0odWqfvjgTnNu+f0Vg+Tz1ZvdmSWmWk
	+ijZ/H5VKHsLWIVe1/J47ccP258rLilx+phbTyUJz1ayvGmsfW8aRceb71CXSmJJMNedAn5UmBStf
	H0/2Mo9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhaFS-00ENgT-9n; Thu, 21 Apr 2022 17:05:42 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhaFP-00ENfF-P3
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 17:05:41 +0000
Received: by mail-pl1-x629.google.com with SMTP id c23so5491342plo.0
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 10:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=5gmIij74AnDbY6qgr01UCnK6HzZogNxUIMK/+QoMp5g=;
 b=pM6fVZiauwUEHH9GIOQ7ii10p9f8+vmUKQ3AZQXvSVOyYpmrdeVJXqZ3gVAaXvEWIb
 qQYl4kET7hzWq+UBVuBLR3NhkTm4nVshvjF3JDmpxICdfecWmGHB04aLJ2sx6rFX6Fpf
 oc1NeoXWW21u2K5sz1/Xob4hzfcFubhIOtg3rPKyv7o1YyMOMDaJsUXg+NaG4VCDhL+C
 Mziu8u5sTDqbl2xd71Fh5h+QQCoCYNgmCL9cR4SchNBvU3swo5SdRH6xmPMBCKgQkzUp
 yvMzci+GHzKLqj0sVn1nf/QT7X6JkWpue6d62p4ilbzEZgZ5O9f7AYXYhuU0JCXP0tKm
 TbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=5gmIij74AnDbY6qgr01UCnK6HzZogNxUIMK/+QoMp5g=;
 b=zVNiKNBECKQ0Y1NZXz4i8eYJoUo++7pckHwAspgRhkwjACUVdbn6kljTp0c9kuj845
 eB0NvD4vwOiPjUnOefO23UB2sYacga0TUKn8eFvVs7Xpw/afMhDRgZ5jjUvXe50qiLkZ
 A41ScNmMIeui+9vKZr4xoq6MFSfpDtSmhsvUFE3/oKZgCJGOEmeB8EUumRA6K/8aponi
 AGsLlQWP/EVql9pXqnTPjwsvlkiQ1K2oThIY0yzTkDpyGEtSBNXY1XrzdtVkLsMusSSJ
 cVKsWWZOB7xGLaG2fjCpDzPNq/B5YjtwbVFqCidRz32lEVBOh6cr8ysF0rv+IjKwTFvO
 cupA==
X-Gm-Message-State: AOAM5326Zylww8JxpdN94eyy33geDZMS5vbjlAW2WUMcRP8pdUdyMmrd
 /gHulVdE2zseUkgEXHGdMQv0Xw==
X-Google-Smtp-Source: ABdhPJytsH5waRAiVkAmq21l+Ij9qBhY0E5qN6lPrVZhHH/1g1nDZiZgCJ+6vs/jotE6GkZYBNDK8w==
X-Received: by 2002:a17:902:9a4c:b0:158:b6f0:4aa2 with SMTP id
 x12-20020a1709029a4c00b00158b6f04aa2mr354677plv.163.1650560737879; 
 Thu, 21 Apr 2022 10:05:37 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 c16-20020a631c50000000b003a39244fe8esm19043710pgm.68.2022.04.21.10.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 10:05:36 -0700 (PDT)
Date: Thu, 21 Apr 2022 10:05:36 -0700 (PDT)
X-Google-Original-Date: Thu, 21 Apr 2022 09:51:26 PDT (-0700)
Subject: Re: [PATCH v4] riscv: mm: Remove the copy operation of pmd
In-Reply-To: <20220401024320.98510-1-hanchuanhua@oppo.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 alexandre.ghiti@canonical.com, jszhang@kernel.org, mhiramat@kernel.org,
 akpm@linux-foundation.org, 
 zhengqi.arch@bytedance.com, ebiederm@xmission.com, liushixin2@huawei.com,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, hanchuanhua@oppo.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: hanchuanhua@oppo.com
Message-ID: <mhng-2e84f176-f077-4a7a-b1e0-66813b2c0e7d@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_100540_068496_40BC4ADC 
X-CRM114-Status: GOOD (  17.98  )
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

On Thu, 31 Mar 2022 19:43:20 PDT (-0700), hanchuanhua@oppo.com wrote:
> Since all processes share the kernel address space,
> we only need to copy pgd in case of a vmalloc page
> fault exception, the other levels of page tables are
> shared, so the operation of copying pmd is unnecessary.
>
> Signed-off-by: Chuanhua Han <hanchuanhua@oppo.com>
> ---
> Changes in v4:
>   -Modify incorrect author name.
>
> Changes in v3:
>   -Change the real name of signed-off-by.
>
> Changes in v2:
>   -Delete incorrect default signatures.
>
>
>  arch/riscv/mm/fault.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 4e9efbe46d5f..40694f0cab9e 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -102,9 +102,9 @@ static inline void bad_area(struct pt_regs *regs, struct mm_struct *mm, int code
>  static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long addr)
>  {
>  	pgd_t *pgd, *pgd_k;
> -	pud_t *pud, *pud_k;
> -	p4d_t *p4d, *p4d_k;
> -	pmd_t *pmd, *pmd_k;
> +	pud_t *pud_k;
> +	p4d_t *p4d_k;
> +	pmd_t *pmd_k;
>  	pte_t *pte_k;
>  	int index;
>  	unsigned long pfn;
> @@ -132,14 +132,12 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
>  	}
>  	set_pgd(pgd, *pgd_k);
>
> -	p4d = p4d_offset(pgd, addr);
>  	p4d_k = p4d_offset(pgd_k, addr);
>  	if (!p4d_present(*p4d_k)) {
>  		no_context(regs, addr);
>  		return;
>  	}
>
> -	pud = pud_offset(p4d, addr);
>  	pud_k = pud_offset(p4d_k, addr);
>  	if (!pud_present(*pud_k)) {
>  		no_context(regs, addr);
> @@ -150,13 +148,11 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
>  	 * Since the vmalloc area is global, it is unnecessary
>  	 * to copy individual PTEs
>  	 */
> -	pmd = pmd_offset(pud, addr);
>  	pmd_k = pmd_offset(pud_k, addr);
>  	if (!pmd_present(*pmd_k)) {
>  		no_context(regs, addr);
>  		return;
>  	}
> -	set_pmd(pmd, *pmd_k);
>
>  	/*
>  	 * Make sure the actual PTE exists as well to

Thanks, this is on for-next (it was last night, but looks like I forgot 
to send the email).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
