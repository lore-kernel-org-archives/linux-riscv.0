Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E162AC77B61
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 12:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGwsNChVA7SgSenbxCf59KtA6I0fe2ALv2goA15ZC5k=; b=pLpaWuk+F/oJyB
	ML8V9o4bAIxD7V/49WZVKTpC7yGAp1QU5GkQoQZAlK8QUtHpx4pbiO3eWyJYTYGpWcGoZXdjeB67q
	PJTbXYagKqbmBzKy3aNaCen3ctmDpi0+XB1yZoEW9KOr5G6wU+cgUiMh7FgtY0Rj2ZwihXG9NCcHm
	r6E6S3R9TpTpfLM1+dDqTRd2RI2KPNzCNo8FtPndYxyysHUxadjDDxFaAHPgHYiAlGe2QcwQpnj7g
	Xk0XOyGufXj4FGLwUKJuw1pYsLv/CoJWA1NXWzlANgJsjbO0eU8pEPbD8ZdcoIbJHg+gEu3tsu7CL
	Okl4qd2g4pRVEBE/vDFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psNOY-009vbs-17;
	Fri, 28 Apr 2023 12:40:14 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psNOV-009vZ3-0X
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 12:40:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f178da219bso97699645e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Apr 2023 05:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682685609; x=1685277609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=so9KIu8LhIXSS+RBaLCGXQCS3RVkKbWGe3Dy1K6fiZY=;
        b=o3eKynrvckfOC+ssqQyzYTN2KeT3Zzl/oOjDyJyACeNd8w5nkc2hcADb4Eua5+ukMC
         YCm6nu+j2wVj93GqWWrOFHZuLveZZW7SlFHHzz/07WSeAVjgmF0qqs5Kn0MuUONHIHYA
         +tS8mqgKXxPgzqa0unn3Ru0JPz+aWGz00siCESWtOmajQN6cYlyKxMfKF2vybgKnnoO0
         R3mxJjWdr3R4GfdLfbIyyh1WtmC/88rU8i3QOykJPl0KZJtbNzeJ+piw0Q6ntIUwk7BT
         Aj84oNnGTs9M3DKiF2MTrlYGUJr/Pb3fC+LZHhM2XZQNMGFuK/gSDbDIDeEtEbT4AYOW
         cjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682685609; x=1685277609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=so9KIu8LhIXSS+RBaLCGXQCS3RVkKbWGe3Dy1K6fiZY=;
        b=UnK71xc/cZf2KfLZLjOvjzInsU84QAjJ0TZ6wuWJ2Gyd8SA332hoBLLHTXd9IYMOL3
         Ej/hL+S78zLqeWcw+uwNksAI+Zc9RXkgYOyYLXoCSDWBxI+aNElEOoY0Cx+fKlp4eHJe
         zCNrQJYJ4/Ab/4TTO3s2P1skBZlzA0xUWptFY6MUqac2D9dMFv2d3yfSWFUfiiX/cZg8
         5D/XUQiNumQMB4q/OPinDnwwCXGBtSWQX8TAZDECmBLPMD3zqRRu1sipm2dq2wmnqyoK
         tYGFNZjvt4Kyll7lBrcOgNa8Xf26swUFGGQb0YG2j9w/Hbl48IK/SVtjSHgv9HDuxwY+
         Omww==
X-Gm-Message-State: AC+VfDxsFgWSPb6QcctrBL3x7IjhH+xeNPKTKpJ1O/2O18/0aDurprSI
	sG5c26+jdw0HWBKM8w5d7Df+eg==
X-Google-Smtp-Source: ACHHUZ4oyJ+//cf4rNgEGKdKn3OlOaCIZYzyzPVMMmjxajbwFk646G1FPmc6yNlWg2VxJFCB+I8dVQ==
X-Received: by 2002:a05:600c:ad9:b0:3f1:7bac:d411 with SMTP id c25-20020a05600c0ad900b003f17bacd411mr4233018wmr.39.1682685609550;
        Fri, 28 Apr 2023 05:40:09 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id g10-20020a7bc4ca000000b003f171234a08sm24069000wmk.20.2023.04.28.05.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 05:40:09 -0700 (PDT)
Date: Fri, 28 Apr 2023 14:40:08 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Qinglin Pan <panqinglin2020@iscas.ac.cn>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes 1/2] riscv: Fix huge_ptep_set_wrprotect when PTE
 is a NAPOT
Message-ID: <baf74szfva57nyqhjmikd6ll4pmz4bj2i7p2wgs2hwwfu5bhap@ixcccn4xf4n3>
References: <20230428120120.21620-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428120120.21620-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_054011_272693_1A3DBBD7 
X-CRM114-Status: GOOD (  18.63  )
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

On Fri, Apr 28, 2023 at 02:01:19PM +0200, Alexandre Ghiti wrote:
> We need to avoid inconsistencies across the PTEs that form a NAPOT
> region, so when we write protect such a region, we should clear and flush
> all the PTEs to make sure that any of those PTEs is not cached which would
> result in such inconsistencies (arm64 does the same).
> 
> Fixes: f2aeb0118ddd ("riscv: mm: support Svnapot in hugetlb page")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/mm/hugetlbpage.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
> index a163a3e0f0d4..238d00bdac14 100644
> --- a/arch/riscv/mm/hugetlbpage.c
> +++ b/arch/riscv/mm/hugetlbpage.c
> @@ -218,6 +218,7 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
>  {
>  	pte_t pte = ptep_get(ptep);
>  	unsigned long order;
> +	pte_t orig_pte;
>  	int i, pte_num;
>  
>  	if (!pte_napot(pte)) {
> @@ -228,9 +229,12 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
>  	order = napot_cont_order(pte);
>  	pte_num = napot_pte_num(order);
>  	ptep = huge_pte_offset(mm, addr, napot_cont_size(order));
> +	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
> +
> +	orig_pte = pte_wrprotect(orig_pte);
>  
>  	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
> -		ptep_set_wrprotect(mm, addr, ptep);
> +		set_pte_at(mm, addr, ptep, orig_pte);
>  }
>  
>  pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
> -- 
> 2.37.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
