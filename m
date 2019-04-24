Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F51C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 08:14:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04B11206A3
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 08:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="inC+UzvC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="fZm/mIR1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04B11206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MB/6U8NDKvtxU1QWeeyKBmN5U8MjrTrcs9tn5ZEcqTU=; b=inC+UzvCG2CJ8T
	MW0HZ4ilt02bHxxlqyeU7cZKlDXTLgnc6lkgxUzPCd5x9f3AjlpwByrSNQjCr6L3wLnR0byW88WU5
	WYoUVGaFhk5ZdA+YI0xLLYgtbgKu0x9mQAdiqf4+yMU9PuB2c6K6Vumo7nRE+mD/exvGdyJqAcCtm
	IcDICi+wUTTbh9iDHBM+loMEUT/JEl5abbxmUFS5jHXcdXznXEMTvj+ONhMMaRI41Vcz0BWhaFLP1
	e83GavWTJDitNPDIQt7uvmlEqJ65y8HrdesOs2hAMl4+5h7+JrXLT8M5srPC16mt83rv1Dmm10LtY
	KV5qJBqpxjwfCDEZMMXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJD2f-0000b2-Jo; Wed, 24 Apr 2019 08:14:09 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJD2d-0000aY-1X
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 08:14:08 +0000
Received: by mail-wm1-x341.google.com with SMTP id y197so3681593wmd.0
 for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2019 01:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CiGHCAKatf4kNBt0YMVwMSFYBbcXaklFVv/SSVvxcOU=;
 b=fZm/mIR1WzmM7VHB9v+sy1F9NYu0FQse6CdMo7LM/go+9NRrtXwiqVB+huVDiQxTCr
 DL/Vpj82t1EeJFa3H+blI0PnDBX+ISFey09idiEOcSUPohGzj8QH1B/hd9B8sXD3kgVU
 rOonZV2dbIbz/IFqEMhAaADlQ52EIZ7OVmTDZJSMEFr4Uhx022H8HHegwKn3beFuBapH
 2o5isqGyFqt+Ig/SALbeGGW3J/3cHhRA6QowTnpmSroM+zy8gVgMfOZhzfU609zbVJ8j
 pMI1ZSV61/rf8KUxpTcPjTlEApnxE5hIkM3sOpnsCuzOsiccDbjH4fAEphX/2nvjad9x
 3urQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CiGHCAKatf4kNBt0YMVwMSFYBbcXaklFVv/SSVvxcOU=;
 b=WQU3KOMt0ImbyjTgfEAnekSkauix78++XYxu+38l/gL/GzqQIOIC2dl4HmaYlvIHPx
 n7DO0qo5qSE2vXKP2rqWBIuNLcPxBvysnvoDSCzifuVC0C+QIYLSd5AwU5DazIBT2ryG
 isLDIEvWv+UQEKcgM7V0EgzLONjXkx/Fjg0Hpa1R8GDlBN045oZ3YwzYgc0V2mJw/iye
 Zfa+6Po7EF8LOPXhqdTOau4vT9Th/vV5fD7mk2RuFbmkYlbWz/YksjmcqRSRziLKqoKN
 sTsbTr6+rd3IDIppeJOlK7EXxn83c2vbOoGs8lgtfYckWa5hWk+oAwT1kshZlTzSZLJS
 NZSQ==
X-Gm-Message-State: APjAAAWlD8joEPp7ccCVUGDm2HTI2itmJp43V3yFURWpIJ0CKy/UcZv9
 EZI3x0a9OO9epkL/deMEqfn/i3oA+SLNG7/OKpy0fQ==
X-Google-Smtp-Source: APXvYqwXbtV4U4CykIgfkPgsoEEUYYYmr76i1L1smAsmZgLvHMi2zqQeELl0BXguQuKMh2mmZqL2wyF59YjeDw6UPPQ=
X-Received: by 2002:a1c:7610:: with SMTP id r16mr5145006wmc.21.1556093644902; 
 Wed, 24 Apr 2019 01:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <1556093512-5006-1-git-send-email-liush.damon@gmail.com>
In-Reply-To: <1556093512-5006-1-git-send-email-liush.damon@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 24 Apr 2019 13:43:53 +0530
Message-ID: <CAAhSdy1O9LLezMxJ0zBNYRMtS69k1GmGFhMRR4PCtUd44-fbhg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: redefine PTRS_PER_PGD/PTRS_PER_PMD/PTRS_PER_PTE
To: damon <liush.damon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_011407_081050_054D466F 
X-CRM114-Status: GOOD (  13.09  )
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

On Wed, Apr 24, 2019 at 1:42 PM damon <liush.damon@gmail.com> wrote:
>
> Use the number of addresses to define the relevant macros.
>
> Signed-off-by: damon <liush.damon@gmail.com>
> ---
>  arch/riscv/include/asm/pgtable-32.h | 1 +
>  arch/riscv/include/asm/pgtable-64.h | 3 ++-
>  arch/riscv/include/asm/pgtable.h    | 8 ++++++--
>  3 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
> index d61974b7..c9c8ca8 100644
> --- a/arch/riscv/include/asm/pgtable-32.h
> +++ b/arch/riscv/include/asm/pgtable-32.h
> @@ -17,6 +17,7 @@
>  #include <asm-generic/pgtable-nopmd.h>
>  #include <linux/const.h>
>
> +#define MAX_USER_VA_BITS       32
>  /* Size of region mapped by a page global directory */
>  #define PGDIR_SHIFT     22
>  #define PGDIR_SIZE      (_AC(1, UL) << PGDIR_SHIFT)
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
> index 1141364..9148043 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -33,9 +33,13 @@
>  #endif /* CONFIG_64BIT */
>
>  /* Number of entries in the page global directory */
> -#define PTRS_PER_PGD    (PAGE_SIZE / sizeof(pgd_t))
> +#define PTRS_PER_PGD (1 << (MAX_USER_VA_BITS - PGDIR_SHIFT))
>  /* Number of entries in the page table */
> -#define PTRS_PER_PTE    (PAGE_SIZE / sizeof(pte_t))
> +#ifdef __PAGETABLE_PMD_FOLDED
> +#define PTRS_PER_PTE   (1 << (PGDIR_SHIFT - PAGE_SHIFT))
> +#else
> +#define PTRS_PER_PTE   (1 << (PMD_SHIFT - PAGE_SHIFT))
> +#endif
>
>  /* Number of PGD entries that a user-mode program can use */
>  #define USER_PTRS_PER_PGD   (TASK_SIZE / PGDIR_SIZE)
> --
> 1.9.1
>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
