Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8B8C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 19:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=kz6t1EQ2KC9H1/mUmgaNVIIEr3nAM/UfMcHpBSPjh8Q=; b=M8bYEjvGC1iXvoSqeIX6TSQiYr
	xU3l+rBioaYGRTKVD8FUHJF8GYQPQgyHtuPZo8O29Jw/p19AnpBN06Twrv4OaYbC8qslcRmQt9rXb
	pH8JgK2On5G5+AjYRX1Sq0z4hc6VgsoQRs67mIL25ky5nwLGjIy53VuB+VCJi5e/2YEDb8tLu4QSd
	BKtlto5Thec7foUGFgZ+BBH4VG7hD+DV9ndKjdloRMpamGG6ExI6xZO2hEDmwFEWj/75Ds5wLNkTg
	ZK5L95sq8gHfWl19rIYD8iH60hCEcgqts8hICBkqcS1Q/UXfzKwokZUZJMoeBsJlwRxm8YIqXj5sd
	Zw/1ceVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pEx-00AFeK-Qi; Thu, 01 Dec 2022 19:28:59 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pAx-00ABYV-GU
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 19:24:52 +0000
Received: by mail-pj1-x102c.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so6156308pje.5
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 11:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EyC+l2xoTg21FRJVHmDMpGpIwBHjk+EZXckKbYJ+bM=;
        b=Wvpk6usHFf08wgUpOcO61wbMziW2fNh4OWe2RL89HYS0FFeCsZxunqN5skgJbIb8aW
         o/jRO40/pTnhi0DuRlkNclEKnBLFNvn6hkVF2UUc+ZNQBPMCT/wMJREn8ZsMyY8JXFwl
         FUHLao2DRyLhv4voSy6fqh0VjBWyGm13QYGS1m5OJFJ1SyIOxsSESqAA/2Y3TOh5EFOe
         mJIlZkBIS7r50Uhc6Imtc0twTUqmDbHHHsgdCMyfyJkpZzgWLuQb7mHRS3rMSMCH0gGP
         g/fLkQ17sWj9fj3Wieg/mqPvIUWXFN/6z4TpNli4y+FQDPdEQPxFkcemuUn7Jmz+MpxB
         hNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EyC+l2xoTg21FRJVHmDMpGpIwBHjk+EZXckKbYJ+bM=;
        b=H7bozsLjJ/kqp77b4U+py4r3IMZTgLjh9CzSbFJF0sU8lpmBn0Pe0LOq0Jsig5JUrR
         EQ/auH6Tz+ZxP2CKmpFPLZng/wbtQVZNS1NrGc3fPSaiXa7OkVJA4aWwvb+eGODoimdM
         k3Pq0YvdA/7o1SeufpeftP1WhACvtssSOvuQ/xXs5VMmkj0YVsVE9X5SymxTrI+ef26U
         BQpf1JKjwDAwLnZ+YIL286plZkXEAtPyXAAVSEH3zmDqYHCgIdk6Y4WlgzBabBkdFFAl
         bhBhYskfQVj6WHZq8dGF1KKVoUJC65YvzjEzYPu4HiCMMwjmoZU+blh9Nwh/+Aux2877
         PTOQ==
X-Gm-Message-State: ANoB5pnH5ILeNZnfQwHQHP5wxY4BHwuANwj/BkMyXUp7rhxNb2aiRLqI
	5UM4HQnVd6xXjy3Mv6mjb3CPCQ==
X-Google-Smtp-Source: AA0mqf48dwpXs3J0JRG21XUWX/PuQXxmt3SsEI7+2JhTfc0RC63eVOE3Yv3fog/cYbprpi8COni6JA==
X-Received: by 2002:a17:903:28f:b0:189:8a36:1b70 with SMTP id j15-20020a170903028f00b001898a361b70mr22952985plr.12.1669922689973;
        Thu, 01 Dec 2022 11:24:49 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id o13-20020a170902778d00b00176ba091cd3sm3982639pll.196.2022.12.01.11.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:24:49 -0800 (PST)
Date: Thu, 01 Dec 2022 11:24:49 -0800 (PST)
X-Google-Original-Date: Thu, 01 Dec 2022 11:24:27 PST (-0800)
Subject: Re: [PATCH 1/1] riscv: Fix P4D_SHIFT definition for 3-level page table mode
In-Reply-To: <20221201135128.1482189-2-alexghiti@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  panqinglin2020@iscas.ac.cn, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, alexghiti@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-46a9363c-895f-4cc2-a8e3-3a48f2fee418@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_112451_589422_C97F7E96 
X-CRM114-Status: GOOD (  21.05  )
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

On Thu, 01 Dec 2022 05:51:28 PST (-0800), alexghiti@rivosinc.com wrote:
> RISC-V kernels support 3,4,5-level page tables at runtime by folding
> upper levels.
>
> In case of a 3-level page table, PGDIR is folded into P4D which in turn
> is folded into PUD: PGDIR_SHIFT value is correctly set to the same value
> as PUD_SHIFT, but P4D_SHIFT is not, then any use of P4D_SHIFT will access
> invalid address bits (all set to 1).
>
> Fix this by dynamically defining P4D_SHIFT value, like we already do for
> PGDIR_SHIFT.
>
> Fixes: d10efa21a937 ("riscv: mm: Control p4d's folding by pgtable_l5_enabled")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/pgtable-64.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index dc42375c2357..42a042c0e13e 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -25,7 +25,11 @@ extern bool pgtable_l5_enabled;
>  #define PGDIR_MASK      (~(PGDIR_SIZE - 1))
>
>  /* p4d is folded into pgd in case of 4-level page table */
> -#define P4D_SHIFT      39
> +#define P4D_SHIFT_L3   30
> +#define P4D_SHIFT_L4   39
> +#define P4D_SHIFT_L5   39
> +#define P4D_SHIFT      (pgtable_l5_enabled ? P4D_SHIFT_L5 : \
> +		(pgtable_l4_enabled ? P4D_SHIFT_L4 : P4D_SHIFT_L3))
>  #define P4D_SIZE       (_AC(1, UL) << P4D_SHIFT)
>  #define P4D_MASK       (~(P4D_SIZE - 1))

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

Too late for this week, but if someone's got a concrete regression then 
I'm happy to take it next week.  Otherwise it'll end up on for-next, 
it'll be backported anyway but this way it'll have a touch more time.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
