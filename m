Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E95C10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 06:13:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38C5C214DA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 06:13:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FD7lYe83";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="y691J5tm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38C5C214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrOJW5WmUMi6E5eNDB1VVwyI+BICRq+hPOjWRVJzuJQ=; b=FD7lYe83PAgZiU
	s64p+B9BvxxDQ8nOp2ZrzsqAKOEWeXQMS7a7iQ+hAxXdRQCXIcJ3dX9H31/XtT1aC4pbdf+c+02hN
	IdXpmX8TgZyR4gusODVkAQ6tRDBk6Itu0wqDze06/isbmWa7tAapJGXtyFdcyYsj9xtvb0YnR0oQW
	vzMiiTjzOkAZpFlNhNcFM8UwUUPFcNeBNAUP/oSd9UXLNi+lkIfvHGnCDRm0rF0DkqX7TZfi+65r8
	TnVC3IxSASz8QtrYr8Dz5C0GEoKGVl+WVfZ9ykfJFe3SKgLduGxI+qW1g+HfGFa0yoMcNDkQPhlup
	jm76icIusin3eOnHqw8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH0Ir-00020e-3D; Thu, 18 Apr 2019 06:13:45 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH0Io-0001zf-BR
 for linux-riscv@lists.infradead.org; Thu, 18 Apr 2019 06:13:43 +0000
Received: by mail-wm1-x341.google.com with SMTP id n25so1367613wmk.4
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 23:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f5gAVwPf4LXwi3q6cSJA3lDZFQJ3pBlHI2tkW6FRt4k=;
 b=y691J5tmvg28X5D2wpDYc0Ew89GB+xnBAqxtwmHhLhh0QF4SDBBcPOHGJdpMqPDB6j
 dxQxQs2gf6/ZRObZK3+qKtPTxOWPbvfWaJQ8SOLuFNHfI8NtrZ2RPZqU7fSf+/fMdfxM
 51IhXflHFE8fJDzFFZYTJ29sqBunJSG+Xj4Hd4dENht2fHXgvG0NkGPL6Pa1QLy73S2p
 BkYOTIbkKyfLnhshuVXnz0ea8nb5A+aY0MGGykEFauQW7Cw51yPJELe0VjZM8mV+SyiO
 1GchVq70CVrUjGKg/TqMu5FYNt7lz0Hle1i8u9S6QQOQFHv/qAopYjS4ybSYhFyAXf/u
 eGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f5gAVwPf4LXwi3q6cSJA3lDZFQJ3pBlHI2tkW6FRt4k=;
 b=cH70kIhY7K7mJziuaLXnByzVLeSHsGqbElnIJ61D6VPSEHcAXw4bucX2yAWqtX3/7S
 aC/Hlb/+GF5nFn44mMg7hkAEhFIzjKhUZ5VtH0AL7s2htS77WtvrY2heinSd1T7IkD6W
 c8xcdPpPWykME0KW8pFtl3X8CLaNOFerItEZeijYL7JGPBhCgWTuLJH97b20oC7DwEQR
 6uO4W+GIKPfWF8IRsv1eUwW2VVVVIR5BQePP154gceKi7jsCQ/fal22VAUAcyCTYAlA4
 +U8WWyUz0VHHzA1mxenk0jmO2w05qtpi0SZg+Qprq2I1klfNbRDu4pyV23AF3Ej1X1/w
 slyA==
X-Gm-Message-State: APjAAAXhI6c5Ym6DmWbsSRh1FYNJAKYSG9K1swCZTjEa7Zg3M1X9CcOt
 e7BnKiDN0rrxOX+w3j65gwKG0Sm6u7UlhSfXEhYsQQ==
X-Google-Smtp-Source: APXvYqwAvyA1bcQzgSrkX12V9qt+Chzj+JKaZJECqLPoel5VVl5MhfA6uwQwlxmhcdySHtVEKdsTAgzdC6VBcJJaaiA=
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr1550265wmg.132.1555568018924; 
 Wed, 17 Apr 2019 23:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <1555548975-7011-1-git-send-email-liush.damon@gmail.com>
In-Reply-To: <1555548975-7011-1-git-send-email-liush.damon@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 Apr 2019 11:43:27 +0530
Message-ID: <CAAhSdy1ra-khBQU2s14StbiojFMk4tokGqAbp-u3j51bksbjQA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: redefine PTRS_PER_PGD/PTRS_PER_PMD/PTRS_PER_PTE
To: damon <liush.damon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_231342_444907_57E5A3F6 
X-CRM114-Status: GOOD (  12.34  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: sorear2@gmail.com, Palmer Dabbelt <palmer@sifive.com>,
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 18, 2019 at 6:26 AM damon <liush.damon@gmail.com> wrote:
>
> Use the number of addresses to define the relevant macros.
>
> Signed-off-by: damon <liush.damon@gmail.com>
> ---
>  arch/riscv/include/asm/pgtable-32.h | 2 ++
>  arch/riscv/include/asm/pgtable-64.h | 3 ++-
>  arch/riscv/include/asm/pgtable.h    | 4 ++--
>  3 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
> index d61974b7..93607f6 100644
> --- a/arch/riscv/include/asm/pgtable-32.h
> +++ b/arch/riscv/include/asm/pgtable-32.h
> @@ -17,8 +17,10 @@
>  #include <asm-generic/pgtable-nopmd.h>
>  #include <linux/const.h>
>
> +#define MAX_USER_VA_BITS       32
>  /* Size of region mapped by a page global directory */
>  #define PGDIR_SHIFT     22
> +#define PMD_SHIFT       PGDIR_SHIFT

We don't have PMD in RV32. We have only two level page table
for RV32 so defining PMD_SHIFT is misleading and in-correct.

I suggest you drop PMD_SHIFT here instead look at below
suggestion for defining PTRS_PER_PTE  in asm/pgtable.h

>  #define PGDIR_SIZE      (_AC(1, UL) << PGDIR_SHIFT)
>  #define PGDIR_MASK      (~(PGDIR_SIZE - 1))
>
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index 7aa0ea9..a56d4d0 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -16,6 +16,7 @@
>
>  #include <linux/const.h>
>
> +#define MAX_USER_VA_BITS       39
>  #define PGDIR_SHIFT     30
>  /* Size of region mapped by a page global directory */
>  #define PGDIR_SIZE      (_AC(1, UL) << PGDIR_SHIFT)
> @@ -34,7 +35,7 @@
>  #define pmd_val(x)      ((x).pmd)
>  #define __pmd(x)        ((pmd_t) { (x) })
>
> -#define PTRS_PER_PMD    (PAGE_SIZE / sizeof(pmd_t))
> +#define PTRS_PER_PMD    (1 << (PGDIR_SHIFT - PMD_SHIFT))
>
>  static inline int pud_present(pud_t pud)
>  {
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 1141364..d9cb3c8 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -33,9 +33,9 @@
>  #endif /* CONFIG_64BIT */
>
>  /* Number of entries in the page global directory */
> -#define PTRS_PER_PGD    (PAGE_SIZE / sizeof(pgd_t))
> +#define PTRS_PER_PGD (1 << (MAX_USER_VA_BITS - PGDIR_SHIFT))
>  /* Number of entries in the page table */
> -#define PTRS_PER_PTE    (PAGE_SIZE / sizeof(pte_t))
> +#define PTRS_PER_PTE   (1 << (PMD_SHIFT - PAGE_SHIFT))

Instead of defining PTRS_PER_PTD using PMD_SHIFT for both RV32
and RV64, do the following:

#ifdef __PAGETABLE_PMD_FOLDED
#define PTRS_PER_PTE   (1 << (PGDIR_SHIFT - PAGE_SHIFT))
#else
#define PTRS_PER_PTE   (1 << (PMD_SHIFT - PAGE_SHIFT))
#endif

>
>  /* Number of PGD entries that a user-mode program can use */
>  #define USER_PTRS_PER_PGD   (TASK_SIZE / PGDIR_SIZE)
> --
> 1.9.1
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
