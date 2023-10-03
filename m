Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FA7E75432
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 07:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K1mSNKEbFS7YeNsCGa2MXF/fFl+IuUxFS9Za96AzkG8=; b=odPJWd/tJRR/cJ
	xmF8GjxSS/04l43QRwBIuYbstfGWfyKw1EJlCC6ysgnaXWGXLN0YrtQdnUxj9CBuRbiFQsNtmPq/v
	cK44lmlOntm970yA2K3KuxrqxQ6aWZqcuomhfUe2mSUW2UsqofajL+9g/B+ziXKZilyqR6FW7QCm9
	OiWypgVZ3FrXJgEx7A8JZUPrW1sfX8osGz5+8YDpGdMkgbZv1c5omN9+0s4ppFtbt+EwBgXU4HKou
	HkunRd/9GuKki76QpyYVRk9ytYtH6qk9IKeMpz/0dm2Wm2gMo0NovZH4uBZ2WrpmPhVNbaM+3sem3
	SeVGvHtG83J20Kj2Z9nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qna2k-00E0sJ-02;
	Tue, 03 Oct 2023 07:42:10 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qna2g-00E0rS-2y
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 07:42:08 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-533d9925094so861832a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 00:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696318922; x=1696923722; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EarP/K2+7ngez1EJdI5nUP41kOhzqNXkW1CqtE7G6xA=;
        b=IXHugi07t4CcytKZQKi6lEwS0YWwQq3Z+qeiV9BuQvNx8too/X+yKblcXRUFeFQnWT
         EUvgNGDv761Q7rIP+BXbkygVb9qNilfQut7qNeqPDt2tPqNcgTgBgHhp2SwmMEArbM2I
         12cpovA7E7C9K8f0VakJxSJQc4Tg1WKxpuLXHvTrNTJOvgCFKFRhJu3a7yc2ueU9WJzw
         AvbLVN7dcpMuuZ4lqVqvocdmhMeyNOsZFfiNbiIdowyUShcQvXJJFImtVt4ccjpMcGm4
         kX8vMUrG77eKDx4DkDUqxeyGUBYwgrLxOFv2kyFlVd4ZUMGFLeidIkGPB37xrDQzIcXc
         EgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696318922; x=1696923722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EarP/K2+7ngez1EJdI5nUP41kOhzqNXkW1CqtE7G6xA=;
        b=RbJIo0iKql62nYiEHOED1akKsZqd14bPMI5qRF/0bRStvgK3NEDg55T+cggFxl1bFq
         kJoc6LyC6FjqJUK/SoyljSwCOeqVdPMgfADet6sZiFcu+qGq4oIMELdouLg7DLsqo3Yn
         6kcZxzBtzV6E6o+QAbXTu67oFrIPQaUdnGyDMtVccroXy8xiTLE1UxZZv2QD+IPNsbrh
         8KkduXYvOGaXYJF/W3dKccn+EQysT7JcZmBzA+jsIT2M16Wwpa2MY22Jwzza6eb++oWW
         c4GRDgvxQQ7vvvNawTSQZginUz1Hmv3HAOwdPGF25fw0yK/qreaiQKPe0Mga5k5XOzmp
         tX6g==
X-Gm-Message-State: AOJu0Yxq3g5ty6Fmyr8rNGUAH0zJUsYTOvMmWuxtlOiFP3RxF2REmFhQ
	I9Ypg4zHs5L1n09rNXqBhuGVICQGhVcnmqY0nBk=
X-Google-Smtp-Source: AGHT+IG1N2+LCXuxOd0Vv82Jtne0d7kp6cgoSOTpGsutcsoXHxeibNyA9BF+dcEU1nuk7EPT5XbNLg==
X-Received: by 2002:aa7:d90f:0:b0:531:5126:cd5e with SMTP id a15-20020aa7d90f000000b005315126cd5emr11963080edr.34.1696318921994;
        Tue, 03 Oct 2023 00:42:01 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v26-20020aa7d65a000000b0053495596f42sm419143edr.30.2023.10.03.00.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 00:42:01 -0700 (PDT)
Date: Tue, 3 Oct 2023 09:42:00 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Qinglin Pan <panqinglin2020@iscas.ac.cn>, Ryan Roberts <ryan.roberts@arm.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes 2/2] riscv: Fix set_huge_pte_at() for NAPOT
 mappings when a swap entry is set
Message-ID: <20231003-555f517e872d4d53ff8d2b02@orel>
References: <20230928151846.8229-1-alexghiti@rivosinc.com>
 <20230928151846.8229-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230928151846.8229-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_004206_961172_15728A89 
X-CRM114-Status: GOOD (  23.11  )
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

On Thu, Sep 28, 2023 at 05:18:46PM +0200, Alexandre Ghiti wrote:
> We used to determine the number of page table entries to set for a NAPOT
> hugepage by using the pte value which actually fails when the pte to set is
> a swap entry.
> 
> So take advantage of a recent fix for arm64 reported in [1] which
> introduces the size of the mapping as an argument of set_huge_pte_at(): we
> can then use this size to compute the number of page table entries to set
> for a NAPOT region.
> 
> Fixes: 82a1a1f3bfb6 ("riscv: mm: support Svnapot in hugetlb page")
> Reported-by: Ryan Roberts <ryan.roberts@arm.com>
> Closes: https://lore.kernel.org/linux-arm-kernel/20230922115804.2043771-1-ryan.roberts@arm.com/ [1]
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/mm/hugetlbpage.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
> index e4a2ace92dbe..b52f0210481f 100644
> --- a/arch/riscv/mm/hugetlbpage.c
> +++ b/arch/riscv/mm/hugetlbpage.c
> @@ -183,15 +183,22 @@ void set_huge_pte_at(struct mm_struct *mm,
>  		     pte_t pte,
>  		     unsigned long sz)
>  {
> +	unsigned long hugepage_shift;
>  	int i, pte_num;
>  
> -	if (!pte_napot(pte)) {
> -		set_pte_at(mm, addr, ptep, pte);
> -		return;
> -	}
> +	if (sz >= PGDIR_SIZE)
> +		hugepage_shift = PGDIR_SHIFT;
> +	else if (sz >= P4D_SIZE)
> +		hugepage_shift = P4D_SHIFT;
> +	else if (sz >= PUD_SIZE)
> +		hugepage_shift = PUD_SHIFT;
> +	else if (sz >= PMD_SIZE)
> +		hugepage_shift = PMD_SHIFT;
> +	else
> +		hugepage_shift = PAGE_SHIFT;
>  
> -	pte_num = napot_pte_num(napot_cont_order(pte));
> -	for (i = 0; i < pte_num; i++, ptep++, addr += PAGE_SIZE)
> +	pte_num = sz >> hugepage_shift;
> +	for (i = 0; i < pte_num; i++, ptep++, addr += (1 << hugepage_shift))
>  		set_pte_at(mm, addr, ptep, pte);
>  }
>

So a 64k napot, for example, will fall into the PAGE_SHIFT arm, but then
we'll calculate 16 for pte_num. Looks good to me.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
