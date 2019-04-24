Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42338C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 07:59:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10B60218D3
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 07:59:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dEatFoRU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="eSQsKxtS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10B60218D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSBUo6pOV5LzoG6WGHyL6VWW5B26qcS3v05sfCXnznQ=; b=dEatFoRUPStJ6g
	eq5isqNti33nQFMtF6y8485fgE1kSMgn6g4151pdCNVzj6tGIcNzM/h858mNPVc/VyZTnAk1GQ3Iv
	pcm2M9GmRH0TqFUvo0hFjscVVKaI4Pzb4ltTHQ1rQOW1EIxDa52hGqMhpaXIBTKe/zebqcdD5VpB3
	gEvhkHvj4YD40xr9DXiUpuNmjxGYUGs8kop1SnPB+xXHhSJWt+lZmfFStyDW5Qf3Oa2ECG7H6KBj2
	SqWlzRcbFv9pmJSqBimASlaqbsbL6LfDBiAUwaSN7sJYFbJvDkDKMB2jfexAcJlzhtL7WrcZQ9zKe
	+KDtT/hc5zTNREQhjhtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJCot-0002aR-1x; Wed, 24 Apr 2019 07:59:55 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJCoq-0002Zc-Jx
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 07:59:54 +0000
Received: by mail-wm1-x344.google.com with SMTP id z24so3595662wmi.5
 for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2019 00:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HyTsqy7X1JazJUQoVEjyllLP8FDd9yEAFMHRETlOF2g=;
 b=eSQsKxtSjfDf4N3PhAMrQfz4dP/T/6tIiJMoVr2kiUc86ErKN77c4CapAEg+Wpl3tU
 6FAS3TTMBZeNE86LuGJMy88vP95qJgi48b+HQ/c0DJByLwepKXxOC73LXibEatbCNd6m
 MZf6irgEk31upC72RuOK7rrs7N3FUhsvWId6fWVxUxYpTv07fxRK0gdX/92SnbcvMHp/
 t84Xj+RnxASHhApaA++Fqc09m+DrX41TgC3nHlnLBpeT+wHIhBDGxX/KuvJubmDZeaon
 iyrdJsiCGY2ATnMQvs2SpB0HS2jHfqyh7GofnPvAe3sTGDELXK1niripoEXgPlgNDOV6
 h4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HyTsqy7X1JazJUQoVEjyllLP8FDd9yEAFMHRETlOF2g=;
 b=RxHvXL8M+DsL5k4fzUIXy/3E2fN6yMZV4NgMt5iAhBTSW2HySqQQ3i1g95AXdAXOGf
 1dra5QoO0CbJ110w1ovy+JpJNOAQUmu7RIy0MhQEs+RyoL1HALUopsLu8dl/8zvs1I1L
 yQjQNBrVRqMX/MGrTeIeAeyTtwbi/C9khb7o76eH6OOlN0vr8vmaV2sMuuEsy1XUzvcu
 MwcYSgzXHYRDUzpN5/vUn/X0rNMuSv+kAHO/aGEXWJS8pVnQNORfeCzZngihr5nRLyPQ
 aH8NGc6OCDQM3fdzAifmAekpvfHaoX+0yHQyfALh7ER9q4o+r3fMlpZRV4Jq1oc9i5MI
 WHWA==
X-Gm-Message-State: APjAAAU+1TLjb55q0jxVRi/jHkJIlVFbOQZBYKDPgdH3O3dG05aj8NRE
 vAbFO89aWAx5mwFjHphD8sP+WmLWyDT0r69YErz4UA==
X-Google-Smtp-Source: APXvYqwvnlBkuWUrsASv3lFrwcbt/gOEnzvkEKWlrG6yE0gONqTMH9/IPWsCm++w9fEHJWrMp9HGE96CecL41KbRg1Y=
X-Received: by 2002:a1c:7610:: with SMTP id r16mr5090269wmc.21.1556092789784; 
 Wed, 24 Apr 2019 00:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <1556092268-4646-1-git-send-email-liush.damon@gmail.com>
In-Reply-To: <1556092268-4646-1-git-send-email-liush.damon@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 24 Apr 2019 13:29:38 +0530
Message-ID: <CAAhSdy0yB7iPgZXKu0DpBh_8kgH2xrpSK1aGuOrLkBto3=qC0g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: redefine PTRS_PER_PGD/PTRS_PER_PMD/PTRS_PER_PTE
To: damon <liush.damon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_005952_721253_B2FAF274 
X-CRM114-Status: GOOD (  13.51  )
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

On Wed, Apr 24, 2019 at 1:21 PM damon <liush.damon@gmail.com> wrote:
>
> Use the number of addresses to define the relevant macros.
>
> Signed-off-by: damon <liush.damon@gmail.com>
> ---
>  arch/riscv/include/asm/pgtable-32.h | 2 ++
>  arch/riscv/include/asm/pgtable-64.h | 3 ++-
>  arch/riscv/include/asm/pgtable.h    | 8 ++++++--
>  3 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
> index d61974b7..433886b 100644
> --- a/arch/riscv/include/asm/pgtable-32.h
> +++ b/arch/riscv/include/asm/pgtable-32.h
> @@ -17,6 +17,8 @@
>  #include <asm-generic/pgtable-nopmd.h>
>  #include <linux/const.h>
>
> +#define __PAGETABLE_PMD_FOLDED    1

The __PAGETABLE_PMD_FOLDED is already defined in
asm-generic/pgtable-nopmd.h so we don't need to define it here.

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

Apart from above, looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
