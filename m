Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5C5C433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 04:19:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D15861177
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 04:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D15861177
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RB/Ly9Gq8lIAtGen5nt7Nvpsd744CZbbOWAxv9pEBR0=; b=PHHaJHHf9cPJEmhs3NzCGej+w
	4yCL2MFfwUG3lRpHdQcYn8afdQ3nLmhyzpBJyl5vyDIdJmcXS4sRaAy8rktITntfvTuY2X+UlvdVn
	uiOUDgceqTIxkgKciNuj+pih+pqX5PT8yLhw8HzoBBvVmFBsokzPRh7jhFQeADHNzPhtjwY4SRYJL
	zvs2Go62fo/jWGPtEFbS5UfrzPEO8cbp20tnWtr57qY513BsgD8VhzAdlouFgujTUxfP/YTjxX8rc
	Czd1hKh40KGnnphCXfmdSCAVkqF6oMjbg/EOWqN9ySf+K4eMjg4Yy/ulVVbtK8y1WEgt9p+UTNh7p
	EScuAyUfQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYhrP-00B9i1-VS; Tue, 20 Apr 2021 04:19:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYhrN-00B9hk-M8
 for linux-riscv@desiato.infradead.org; Tue, 20 Apr 2021 04:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6tOKXOtetoB5l502f6CwFsHmwD7mexR6F47nan+OthU=; b=pjdZDytO3PgA1RwzKntgOY+qwR
 7G0aa0dfkAsv7xN+zyBfI9D+uPnwvhGWdSzdlkL7/mMVNLoNFH+lNanJynKshEJ2VCIFzT9asxm8v
 jLXuaVkGiJ44+K8ZUgRFlJxlg/EAUEmGNSawqCtC31nVm6aePLadG0MvtewANRViL2rccmjFA3oLK
 QAauqZI4rD+MMb2GuiJ3mW3jnD7RfP1GjMqY3IkRvaN9ttNAj6sMrjn70FVFieAWaZgd7iDP1i8Ee
 brcxfh/BSNPOTmthDg8YzLRBDufRpoSh5zjD3Uxywzw7DCz6qH59mQhlY7CSf8ZMSCIEg/wzSAjpa
 M2EkY97w==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYhrI-00BnzV-4E
 for linux-riscv@lists.infradead.org; Tue, 20 Apr 2021 04:19:36 +0000
Received: by mail-wr1-x430.google.com with SMTP id m9so23359665wrx.3
 for <linux-riscv@lists.infradead.org>; Mon, 19 Apr 2021 21:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6tOKXOtetoB5l502f6CwFsHmwD7mexR6F47nan+OthU=;
 b=zPHU77GKMzPEi4Z3USHsG2BRW0Zi4R9HfLDI9y7k4FXV1enRHFnEnDFpNblWfiBxmr
 do3ZkVZLdc8LojasG7YWO1dNz1M+r0AXaX9ZjzoEKYFZ8Z/wAxvxyRXTF1NwWMyZJd9B
 O5fNW1Sjd0U6Odjk1x3B8z6uEpc+pHXeBW7ltTAEQu0DpyfIOYhv/0zch1Kw6bX4oIQ1
 a7pVpXyJGsbA3HHIEyJnKH9+kMYJpHy7mGu0VNnpNFdJDPOJmwTEBmrQfuWaCldrzMNy
 nrk1Cd5+0YuXB7qga8FtlY298hCzN0WhhpVElJvtFP5cQ9ghiUqvfTB/LzYFPYwxnETO
 5Ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6tOKXOtetoB5l502f6CwFsHmwD7mexR6F47nan+OthU=;
 b=mDkRTUDgL+3fLl1j1O/cvdf2cEldVjOpI7Ld8v9tYZsu0BvGJEuqN9C0eE/hb0EBD2
 qSfkrV8CSiiI+k935OA34w1r2EkV2e6BRnHvLDGdpE2QJFBco9CJ24XlZ9n4TbSz2hFE
 jfA0vvy9Q8xGO58IPq+tKTqs+i3MR9BNdJXGRRDdj/nM8i5x8RLefKA7Zhm18Ka68puF
 Scniw79Od4/qhDxJabD5KxCc4gDN010RuZfrZ9zfyVtnnh1Ac0G/Q9J9ZSe8+i3vlkD7
 PGJw3pmse738VqPoThwPn/F4Su9+OZ/2pVr02pKaoFV90Xeg5Ioj6nDb5nLic+hBZ0bT
 MTnw==
X-Gm-Message-State: AOAM530WISklLlUgPddRN+HTImpY0vpFYY8NzIrKzSHZnWnpmvsxoZ4i
 9geBMbWmlX5VbHaPqnNwMiHxdVJN6sjMKVonCfy2iQ==
X-Google-Smtp-Source: ABdhPJwyi59C/3tYFHMh5Y6vJynOO8jGTiBuy759HBjpadP75J9jtm+F/ANmSq07/Qd2xqFswBp4XEetGIu9IzB83DY=
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr17850344wrn.128.1618892370130; 
 Mon, 19 Apr 2021 21:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210418112856.15078-1-alex@ghiti.fr>
In-Reply-To: <20210418112856.15078-1-alex@ghiti.fr>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 Apr 2021 09:49:18 +0530
Message-ID: <CAAhSdy3csxeTiXgf8eKnRYhD7BM1LDLPddrn527AkA_-fiEGkw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Remove 32b kernel mapping from page table dump
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Arnd Bergmann <arnd@arndb.de>, Andrey Ryabinin <aryabinin@virtuozzo.com>, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 linux-doc@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, linux-arch <linux-arch@vger.kernel.org>, 
 Linux Memory Management List <linux-mm@kvack.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_211932_188198_070CB6C6 
X-CRM114-Status: GOOD (  17.83  )
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

On Sun, Apr 18, 2021 at 4:59 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> The 32b kernel mapping lies in the linear mapping, there is no point in
> printing its address in page table dump, so remove this leftover that
> comes from moving the kernel mapping outside the linear mapping for 64b
> kernel.
>
> Fixes: e9efb21fe352 ("riscv: Prepare ptdump for vm layout dynamic addresses")
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/mm/ptdump.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
> index 0aba4421115c..a4ed4bdbbfde 100644
> --- a/arch/riscv/mm/ptdump.c
> +++ b/arch/riscv/mm/ptdump.c
> @@ -76,8 +76,8 @@ enum address_markers_idx {
>         PAGE_OFFSET_NR,
>  #ifdef CONFIG_64BIT
>         MODULES_MAPPING_NR,
> -#endif
>         KERNEL_MAPPING_NR,
> +#endif
>         END_OF_SPACE_NR
>  };
>
> @@ -99,8 +99,8 @@ static struct addr_marker address_markers[] = {
>         {0, "Linear mapping"},
>  #ifdef CONFIG_64BIT
>         {0, "Modules mapping"},
> -#endif
>         {0, "Kernel mapping (kernel, BPF)"},
> +#endif
>         {-1, NULL},
>  };
>
> @@ -379,8 +379,8 @@ static int ptdump_init(void)
>         address_markers[PAGE_OFFSET_NR].start_address = PAGE_OFFSET;
>  #ifdef CONFIG_64BIT
>         address_markers[MODULES_MAPPING_NR].start_address = MODULES_VADDR;
> -#endif
>         address_markers[KERNEL_MAPPING_NR].start_address = kernel_virt_addr;
> +#endif
>
>         kernel_ptd_info.base_addr = KERN_VIRT_START;
>
> --
> 2.20.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
