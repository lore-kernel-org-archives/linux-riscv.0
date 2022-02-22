Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368C0C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Feb 2022 21:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=P8FYlqSj4+Ph2QzXAPkZwZvx/r2k/gXf2PhyalH5g64=; b=B5IBxuBsId+u4bQWpQ9wbdSCjt
	O+ng8h5SJablDCPWozyE+dh4pmWwprgd5b3kGrV0wA6R3+oCA/EuLc151r7c6xuxhWP9VUX78KG9w
	QeK3rchxn5bxUsMjVaj6QEhr7YFmjeCsBR2hoKp/kxfWYe8qOgdXWjggDVuAEuAhm3CzUrsenU4ch
	WJlj67rOLeCHDSsMvwhCyxjo2Uszor046mIj2/OJPTpW/XyVoIKt8GzykiBhhC377ex+T4u1MUcoV
	LhlUJ5dHnNokZpeH4HYDMq7+HirLRvHkGUQ90/sNY2e2EQJdcrhaKcBsoNBgEp0PnXrswwD+CJ2do
	79U+5eow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMcfc-00Bf5O-CR; Tue, 22 Feb 2022 21:26:04 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMcfY-00Bf4i-RE
 for linux-riscv@lists.infradead.org; Tue, 22 Feb 2022 21:26:02 +0000
Received: by mail-pj1-x1033.google.com with SMTP id m22so880099pja.0
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 13:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=3GMGpmsX5Sxh9Rowtyg+q5ai/Y4YeFDXutspTo0kPIY=;
 b=DsglCOfTfDoGrxhojDR2OSvkMLectqlyMrwgCAEGegWACO8c2TO3vAZm5AvuDGbGB/
 AfwU6PLsVNUCL9sjR8OiRWGPi4w6Mzn6aTt5qLRA31Z+7Vx5g7yvzVgn/2TGDmrXwXiR
 tX9rxjEZWMPm4qrXxdcFSUA9q65lbl/3+7CWEkc1+dNLzw9Xgu9CtqgX8I0TdrWDtoZo
 Pmw8yG1ve5uOR3VxbLyZeiSfoyP2HyAaDw2y39u7pKSZHBN4E3RsPhF6wymCys+IwJX9
 0ydnrclVrc7ceNSE2nLgoxHYLEf/goG4zfja1UxHEfgz/ElcwjHLS9z8yGLuZ+Hws1Oy
 cMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=3GMGpmsX5Sxh9Rowtyg+q5ai/Y4YeFDXutspTo0kPIY=;
 b=f+rLPqtpPjkpc+BAo9WllGFAWxY2iB6lh/Y6JXHOJ9XWUjmOW8+ailXHU6fa25BG0b
 PRkxlLMm9vw70xkVNmHYw4vVTw3iapBIzFUvbBCo5xr6UM3PGJzgyvoPNhbRJ6xu6DfL
 0wp8mHAx/fOt1tFtnJPb523iU9PTLUBlUeplPxTI4S+fnchHPDnaem7J+oV31hEcdv13
 8z6u49AFz4S+1CaCYG2OnlY46dx0gLXESwRhaCcV7aV26hM6s3KVnWk6cTgEOMVGdgDk
 YjGWWVzaJo85JsJk6CZbQx9Lcu6XcoFMT04ZnbBiSfnVA31JHTlBqGAz/oYcvqu+G1xY
 zkdw==
X-Gm-Message-State: AOAM533tSMEewepcNFyJtoRF1Eja36Jpmduh+eR7i43NxKQQmZtAFoZ7
 ZG0RISnh4e5ywzl57KjqHqWSew==
X-Google-Smtp-Source: ABdhPJypI0+UnxdX0K60WGxnqqz7+VBknfaZQj1jQNbPKlMSomWbVprZfDl6vXHOVBZEQqXoDneoCQ==
X-Received: by 2002:a17:902:6b49:b0:149:7c73:bd6f with SMTP id
 g9-20020a1709026b4900b001497c73bd6fmr24550258plt.46.1645565158855; 
 Tue, 22 Feb 2022 13:25:58 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 v22-20020a17090ad59600b001b7deb42251sm500928pju.15.2022.02.22.13.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 13:25:58 -0800 (PST)
Date: Tue, 22 Feb 2022 13:25:58 -0800 (PST)
X-Google-Original-Date: Tue, 22 Feb 2022 13:25:00 PST (-0800)
Subject: Re: [PATCH] riscv: mm: Remove the copy operation of pmd
In-Reply-To: <20220127100622.11856-1-hanchuanhua@oppo.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 jszhang@kernel.org, alexandre.ghiti@canonical.com, wangkefeng.wang@huawei.com, 
 zhengqi.arch@bytedance.com, ebiederm@xmission.com, liushixin2@huawei.com,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, hanchuanhua@oppo.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: hanchuanhua@oppo.com
Message-ID: <mhng-98c8a68c-ecb2-4db1-ab3e-3a35d5e764d0@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_132600_929805_D8DF5A9C 
X-CRM114-Status: GOOD (  21.28  )
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

On Thu, 27 Jan 2022 02:06:22 PST (-0800), hanchuanhua@oppo.com wrote:
> Since all processes share the kernel address space,
> we only need to copy pgd in case of a vmalloc page
> fault exception, the other levels of page tables are
> shared, so the operation of copying pmd is unnecessary.
>
> Signed-off-by: hanchuanhua <hanchuanhua@oppo.com>
> ---
>  arch/riscv/mm/fault.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 4e9efbe..40694f0 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -102,9 +102,9 @@ static inline void bad_area(struct pt_regs *regs, struct mm_struct *mm, int code
>  static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long addr)
>  {
>         pgd_t *pgd, *pgd_k;
> -       pud_t *pud, *pud_k;
> -       p4d_t *p4d, *p4d_k;
> -       pmd_t *pmd, *pmd_k;
> +       pud_t *pud_k;
> +       p4d_t *p4d_k;
> +       pmd_t *pmd_k;
>         pte_t *pte_k;
>         int index;
>         unsigned long pfn;
> @@ -132,14 +132,12 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
>         }
>         set_pgd(pgd, *pgd_k);
>
> -       p4d = p4d_offset(pgd, addr);
>         p4d_k = p4d_offset(pgd_k, addr);
>         if (!p4d_present(*p4d_k)) {
>                 no_context(regs, addr);
>                 return;
>         }
>
> -       pud = pud_offset(p4d, addr);
>         pud_k = pud_offset(p4d_k, addr);
>         if (!pud_present(*pud_k)) {
>                 no_context(regs, addr);
> @@ -150,13 +148,11 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
>          * Since the vmalloc area is global, it is unnecessary
>          * to copy individual PTEs
>          */
> -       pmd = pmd_offset(pud, addr);
>         pmd_k = pmd_offset(pud_k, addr);
>         if (!pmd_present(*pmd_k)) {
>                 no_context(regs, addr);
>                 return;
>         }
> -       set_pmd(pmd, *pmd_k);
>
>         /*
>          * Make sure the actual PTE exists as well to

This looks good, but "Signed off by" lines are supposed to have real 
names associated with them and this looks like a handle to me.  There 
also seems to be something broken with the email, as this is causing git 
to blow up, but for a small patch like this that's OK as I can resurrect 
it by hand.

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com> # aside from the name

Please send a v2 with the proper Signed off by line, as that's not 
something I'm supposed to just fix up myself.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
