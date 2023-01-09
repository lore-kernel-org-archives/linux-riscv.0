Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA54C5479D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOsAs+mQ5TvxaQUEC/YJBUjUSZ4x2pvvjqjqpGHUI0Y=; b=o5y4jJoglo8gNO
	rkHlQszsA/OUPnoyXOTonN7EoHNjqu/VUwI4Zq3t0h0IuzH1avFox0y2u0cFzPzdQRuXrDjYv1ICj
	XYp20/tGJP7RLNeeLOZ5qlnDXLRpIV8G6hmNSUbfSjRi+yic+0DUQvD+qJIE7wIQY/STu2nnYaKcS
	Bq2Sxv4pzPfhauBKMbG0e8dVw84zqm2oCB6mRCelIRrZzzZYivTa1y/h90ifxefpVoI8TDPIjI+R6
	fMrfkU/V/tJsY0PmNsUZ+yu5wTOBOqr54Jzv0DIcvSt7aONfDjOgXuJCXTS+FU7/6fdmsFtOjI7NS
	LwnuwlT88Edxj95voBpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEtPC-00237R-E4; Mon, 09 Jan 2023 14:45:42 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEtP9-002332-UG
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 14:45:41 +0000
Received: by mail-wr1-x433.google.com with SMTP id w1so8400845wrt.8
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jan 2023 06:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f4nomVRoCsc9GUqeoBFhY0eow9fFXNRDDHoKBG0FKZE=;
        b=QizTsEib1Gz7Z0f2WIilfh/uo0XL7bV8O3B/m93vY5xO+Cu6BybzidsT4IiaLsPq72
         vTxaM5IwgxexxggZDy2N3lXdIA8hGBBBQtPnUMmCbaE8OtlkN4tIPC1ptUeH+8e7B4yx
         9Dsz5CPIavu4/OJpB/essGdiRKJvuNxKdgCHlb1jpRL1r548UhG19N3lKsrWEZZ3ppQl
         eRByWUhQ0jp2RXngN09RoLJKEZtermI83T0WR1FSvPp73I2oL4FPL3JEzQyJ2Wn1GAjO
         SGeJxHQmwdRM9P0LITCoYjtHMfSeuva8VgbOvbUwP8miAshCdR8aKoYhyTGeOumdHwrF
         UpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4nomVRoCsc9GUqeoBFhY0eow9fFXNRDDHoKBG0FKZE=;
        b=BwBwMTRDUGJQv4BjgnEX+QA43iDOE06hP20P+kDbP2o50UU6mac6ImlEVWVy9JnENz
         zU9W3a+4qAbrvbizNigQW8RzYTgG8VvkOQwBjcVudCK87P0s6h/NGbeT2hqrHy+t41JZ
         UOGgm37gLAjByCBMUd9XkSKNVXtErxQkPnEc05HHrwSu5oCh6PoEfPP8H5ToWDTds33q
         5eHy/v+S+2+HsMNoQTzE+XFM6qk5BPGfwNBTghrLRR5g0civF7bl4d3MdwAd4tX7q05h
         gBn75KDzqmDAeOqaxUBiTO0XcEFFeZ45/Z8f5V4x4rZvH7F13PixqQwDABP0zOTkFsgF
         gfFA==
X-Gm-Message-State: AFqh2kqLTG8qWkppwlUmHimfwEuG9faGAs4sj+n9sTg9LOqTIejbSTE6
	NeZXfyKWCfY2izSz2jMu8Ajxng==
X-Google-Smtp-Source: AMrXdXtWn6KoxGCoYyooVHeOgyDujNEnjFYXv0ZjU8ERf4Z6uznxIyzJfeoYKDUfdssNnxjyp5HV7w==
X-Received: by 2002:adf:f3c9:0:b0:2bb:eb1d:bbb1 with SMTP id g9-20020adff3c9000000b002bbeb1dbbb1mr3064310wrp.7.1673275526508;
        Mon, 09 Jan 2023 06:45:26 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id e10-20020adfe38a000000b002bc7fcf08ddsm1389482wrm.103.2023.01.09.06.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 06:45:26 -0800 (PST)
Date: Mon, 9 Jan 2023 15:45:25 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com
Subject: Re: [PATCH v2 2/3] RISC-V: mm: Enable huge page support to
 kernel_page_present() function
Message-ID: <20230109144525.4xgnpeb6zcyyvx4j@orel>
References: <20230109062407.3235-1-jeeheng.sia@starfivetech.com>
 <20230109062407.3235-3-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230109062407.3235-3-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_064540_006171_A0169EE9 
X-CRM114-Status: GOOD (  15.17  )
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

On Mon, Jan 09, 2023 at 02:24:06PM +0800, Sia Jee Heng wrote:
> Currently kernel_page_present() function doesn't support huge page
> detection causes the function to mistakenly return false to the
> hibernation core.
> 
> Add huge page detection to the function to solve the problem.
> 
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
> ---
>  arch/riscv/mm/pageattr.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index 86c56616e5de..73fdec8c0a72 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -221,14 +221,20 @@ bool kernel_page_present(struct page *page)
>  	p4d = p4d_offset(pgd, addr);
>  	if (!p4d_present(*p4d))
>  		return false;
> +	if (p4d_leaf(*pud))
                      ^ p4d

I guess you got lucky with the stack garbage in your testing.

> +		return true;
>  
>  	pud = pud_offset(p4d, addr);
>  	if (!pud_present(*pud))
>  		return false;
> +	if (pud_leaf(*pud))
> +		return true;
>  
>  	pmd = pmd_offset(pud, addr);
>  	if (!pmd_present(*pmd))
>  		return false;
> +	if (pmd_leaf(*pmd))
> +		return true;
>  
>  	pte = pte_offset_kernel(pmd, addr);
>  	return pte_present(*pte);
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
