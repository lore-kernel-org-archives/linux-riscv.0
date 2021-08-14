Return-Path: <SRS0=nQgR=NF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCF0C4320E
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Aug 2021 05:01:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C97746101E
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Aug 2021 05:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C97746101E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=acHhLk63rCXXiexz8YFzRiKSMm170n5oFXieF9HDsl4=; b=Z2Qfqx7BvM5UfDzEMuVY19e2VE
	hUXdUHtRsZl1QVKD22hdxoZW9BwayHw0fpumPcRcqki+dwlCsaJ1W7+uQju8Qs6gvtjQ6vNxlVnVA
	fDfsdLVjCbBfoWudSp42HPvT5dgofjapJb7/Vh9PSjlmgJ0aI9zd4fMXC/DMI1Kk58Ss7e1NvTITR
	piPNuUIY0gzyb9/ZYiLtDYozStkFYzeLG+PQWfSUm2zfLg0VEgi46t0vYJBDlxGbR363N1TgFpZpT
	oR47Tx/JBmdNWG+6Z2IorBnAYcgTTSCJsqEfmm8F741W1jH7FnyhvFaCt91/Z2irTA+13ZsZjep/x
	gQUWbLUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mElmf-00Dqq9-VA; Sat, 14 Aug 2021 05:00:37 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mElmO-00Dqp6-E7
 for linux-riscv@lists.infradead.org; Sat, 14 Aug 2021 05:00:22 +0000
Received: by mail-pl1-x62a.google.com with SMTP id e19so14621438pla.10
 for <linux-riscv@lists.infradead.org>; Fri, 13 Aug 2021 22:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=B7FsBNBl1wj9+CpdzAHHpu0R9bUtnuFq39y817XmkFk=;
 b=NJdF3EZsOlDwSne+vtkjUBcH1AZOC4GOUjlZ5fnpjrHxP9WE/gpfot+AqbVzKwkbdg
 F3YXEEG5HM3l6othuu3gEz8SfuxLZD1R8zlakNoSwb/WsayG9ZQQKx8OStvLWo4F7uIA
 EnX3sP9b3wSLCjK9c5aGuQO8nEI5hkOuul/oxQQt/3EPBFB6VwFl1Ih0vkkkkB0ssauE
 CXofDqJ0+mvig3ij/AoqcoxnIY4BhMKwVCfAiKWHpnLbydLgydaF/cKZUnmYYFVYz5A/
 GfmbeEcNhwHdb5/wnKh75F7WkLUoOTJ390BFtWDL8hrPxQWKzG9ZK/HmgzfxK6ncNUuO
 HcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=B7FsBNBl1wj9+CpdzAHHpu0R9bUtnuFq39y817XmkFk=;
 b=eoD5FN8fTE0NY3nsCf0FDIdZuHgXIzOlSxjhyjg84eStJNAS8M8tnyyREBqe7d4uHg
 iVas6TqbqcT9IZOwwYQJVhhRgtul2PJudO+D2PU0OWTJbTNXh+5hCptbMe4SAodS9Le/
 nFL1VpvvSEQxw+v85L4sONAM1siLWApG8wveCD9TXyqNZ9AB5TVvKcW4FLWURzc7ijng
 c5FxbF9GpWfJnAHPwfzA2+1hXM0bxntQgE9midRRW31B+4l5D41ZLB5jzVsvAQ8zslds
 wgDS6BhIn0Lqw+buuXW7gjJ7ekSprjOeTv7dFCatAqywWDkkhr63GumTaStJNErwoU/1
 fH1A==
X-Gm-Message-State: AOAM533u7JQcUU5LaHyiZfIfHeRIckJvG9rfyxTbusnzJp3bWl5blxEw
 2BxLINtogrzYPxivN5LBrNveJg==
X-Google-Smtp-Source: ABdhPJwMlw7acwFz2mAUfup1HEbyw3SEnSxVvFM1Chp5vy1/GQc4QIe3ivH9k5TurwcCpV58whzhow==
X-Received: by 2002:a17:902:c602:b029:12c:daac:c89f with SMTP id
 r2-20020a170902c602b029012cdaacc89fmr4663469plr.78.1628917218314; 
 Fri, 13 Aug 2021 22:00:18 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 4sm3252160pjb.21.2021.08.13.22.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 22:00:17 -0700 (PDT)
Date: Fri, 13 Aug 2021 22:00:17 -0700 (PDT)
X-Google-Original-Date: Fri, 13 Aug 2021 15:33:53 PDT (-0700)
Subject: Re: [PATCH v2] riscv: fix the global name pfn_base confliction error
In-Reply-To: <20210728071557.400163-1-nek.in.cn@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 alex@ghiti.fr, 
 anup@brainfault.org, Atish Patra <Atish.Patra@wdc.com>, liguozhu@hisilicon.com,
 wangkefeng.wang@huawei.com, vitaly.wool@konsulko.com, guoren@linux.alibaba.com,
 jszhang@kernel.org, 
 rppt@kernel.org, mick@ics.forth.gr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, guohanjun@huawei.com, wangzhou1@hisilicon.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nek.in.cn@gmail.com
Message-ID: <mhng-90c1822d-54dc-4212-bddd-515bba4787e7@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_220020_571574_8508EDD0 
X-CRM114-Status: GOOD (  21.11  )
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

On Wed, 28 Jul 2021 00:15:57 PDT (-0700), nek.in.cn@gmail.com wrote:
> From: Kenneth Lee <liguozhu@hisilicon.com>
>
> RISCV uses a global variable pfn_base for page/pfn translation. But this
> is a common name and will be used elsewhere. In those cases, the
> page-pfn macros which refer to this name will be referred to the
> local/input variable instead. (such as in vfio_pin_pages_remote). This
> make everything wrong.
>
> This patch changes the name from pfn_base to riscv_pfn_base to fix
> this problem
>
> Chagne from V1:
> 	use riscv_pfn_base instead of riscv_global_pfn_base.
>
> Signed-off-by: Kenneth Lee <liguozhu@hisilicon.com>
> ---
>  arch/riscv/include/asm/page.h | 4 ++--
>  arch/riscv/mm/init.c          | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index cca8764aed83..c690e83bde23 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -79,8 +79,8 @@ typedef struct page *pgtable_t;
>  #endif
>
>  #ifdef CONFIG_MMU
> -extern unsigned long pfn_base;
> -#define ARCH_PFN_OFFSET		(pfn_base)
> +extern unsigned long riscv_pfn_base;
> +#define ARCH_PFN_OFFSET		(riscv_pfn_base)
>  #else
>  #define ARCH_PFN_OFFSET		(PAGE_OFFSET >> PAGE_SHIFT)
>  #endif /* CONFIG_MMU */
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index a14bf3910eec..788f12bb586b 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -228,8 +228,8 @@ static struct pt_alloc_ops _pt_ops __initdata;
>  #define pt_ops _pt_ops
>  #endif
>
> -unsigned long pfn_base __ro_after_init;
> -EXPORT_SYMBOL(pfn_base);
> +unsigned long riscv_pfn_base __ro_after_init;
> +EXPORT_SYMBOL(riscv_pfn_base);
>
>  pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>  pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> @@ -572,7 +572,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
>  #endif
>
> -	pfn_base = PFN_DOWN(kernel_map.phys_addr);
> +	riscv_pfn_base = PFN_DOWN(kernel_map.phys_addr);
>
>  	/*
>  	 * Enforce boot alignment requirements of RV32 and

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
