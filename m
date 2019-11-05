Return-Path: <SRS0=54uT=Y5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	URIBL_SBL,URIBL_SBL_A autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23323CA9ED3
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2019 03:21:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE3E121882
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2019 03:21:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="abiBgL0W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="tO/w9J5+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE3E121882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ksz7r9YV3vwLi5eUpqg5c7XXh2jcwx+ueg4/VTPaVfE=; b=abiBgL0Wrrm1Uu
	0JvB7+3Fb2xRZePbq4X8JyWqXT2zfVKvRvgIqIROAexBcTzzJhSfMlOhejU5Dgl6ttW0fkYEMyKUr
	d6D936AtMz9hvIBUajXv6HxmoTuzGxqyO04aNQafqcmf1oj3m/pSb2S2BwWehl/+bU+dWfcjQzBA2
	2IGqnUfgLPFP75XNRtmJg28FWtqQdIVk4j8ypouwXFGQbSGrmHMhR8/KJZGJNmFv/bSaURazy6dYn
	K7Y8AhDszb3pa7HpCbc1zN/PXXR/bVjWkbr/fxHFm3GEo1MdFzOe/wIrECfasIY6hWp/fVPoB+zXU
	PKbSxNZA91MAOHD4vYPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRpPd-0000RJ-Ss; Tue, 05 Nov 2019 03:21:45 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRpPa-0000Ql-Rp
 for linux-riscv@lists.infradead.org; Tue, 05 Nov 2019 03:21:44 +0000
Received: by mail-wm1-x341.google.com with SMTP id 6so15478920wmf.0
 for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2019 19:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bAiMHQsOuI6hnngn6+5CXNDYY+Zdldt5dUW/4rLN07w=;
 b=tO/w9J5+r4DEJmrnMm3ifg3uO8ptXHzrnI6zja/xK4eHep7B+AAjX+LZAEQ1b7e9Rj
 PlvGJ+8LHgZc7RzsKDGJsu7aCHWeNzVKMuyDvMLR4Csz8sXaeMsujCSW8wb3rJuflg/F
 9pSp9tz1VeQQorsBT31aOi7DdqviWdTUGL/WMGFhaAsxl34SgqSBOHO2HKSkkiK3YM69
 VWi6JT4IWGyCxOObusEIvQcwzTDC3hjaBy9TFBNkcd6cDpYp/TgMvIlUzgpYaYciLXng
 yilVpU4ig1m41sqRHfGExoZJIjzSk3RZYQoD8E1+kY732qewJ8ntGf2ZX/lefqpCGiDi
 E8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bAiMHQsOuI6hnngn6+5CXNDYY+Zdldt5dUW/4rLN07w=;
 b=hJYPrFx/iUwzkcWf6hMqW6VdhfMMdXz/K4zkay5hTCjdN1O+UJd3daoxqHEID6+dtg
 jsNCUdBqI6Lk7SKtmbEUTVq4l1ERx2uuKydo7Bjd4Wxz68N3gCzIEy8Ot2A4KCnrKdM8
 9Y242AEWBNUzbvNQ1tBhCWP3bNVTLYxAlEv8vhFA/L/CXaYu0NwJZNuAC6AvEqAK96Yr
 keiQi8rtDIz19ECROBnLh2+vD+D9GEwj8qO4tzXZs+h1MWdCzwWMlWKbnOAfwpUJl4ke
 s3O5t/C0GURfipybz1dHs+JZgyxAeMKLKkmAJIaHn2J7w3NoxE0UdNdY7vrDLapJtkFr
 JCWg==
X-Gm-Message-State: APjAAAV1flGoHS1QmUWZvdm5vZyZTIg00YixtsVQJovM/WlfTdyo2Bmw
 RUVK37EYBYNVvav8IuQZRRWjMp7GuA8MfThywX0I+w==
X-Google-Smtp-Source: APXvYqz8SNF/4Hb4TkDt7a0lWTBr/B5XYCNv1Hg9vWdWC5a3G9WlPoJUaOOfv0Mhu8kB+wQtLGzerp13KfwzRHQAvps=
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr1833021wmf.24.1572924100474; 
 Mon, 04 Nov 2019 19:21:40 -0800 (PST)
MIME-Version: 1.0
References: <1572920412-15661-1-git-send-email-zong.li@sifive.com>
In-Reply-To: <1572920412-15661-1-git-send-email-zong.li@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 5 Nov 2019 08:51:29 +0530
Message-ID: <CAAhSdy2FkTqbYzP9naeUeOR+pW5-GphCR118D63Oy5C8UyQwhA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Use PMD_SIZE to repalce PTE_PARENT_SIZE
To: Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191104_192142_961892_CA042856 
X-CRM114-Status: GOOD (  14.08  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <Anup.Patel@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 5, 2019 at 7:50 AM Zong Li <zong.li@sifive.com> wrote:
>
> The PMD_SIZE is equal to PGDIR_SIZE when __PAGETABLE_PMD_FOLDED is
> defined.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/mm/init.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 573463d..642b330 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -273,7 +273,6 @@ static void __init create_pmd_mapping(pmd_t *pmdp,
>  #define get_pgd_next_virt(__pa)        get_pmd_virt(__pa)
>  #define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)     \
>         create_pmd_mapping(__nextp, __va, __pa, __sz, __prot)
> -#define PTE_PARENT_SIZE                PMD_SIZE
>  #define fixmap_pgd_next                fixmap_pmd
>  #else
>  #define pgd_next_t             pte_t
> @@ -281,7 +280,6 @@ static void __init create_pmd_mapping(pmd_t *pmdp,
>  #define get_pgd_next_virt(__pa)        get_pte_virt(__pa)
>  #define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)     \
>         create_pte_mapping(__nextp, __va, __pa, __sz, __prot)
> -#define PTE_PARENT_SIZE                PGDIR_SIZE
>  #define fixmap_pgd_next                fixmap_pte
>  #endif
>
> @@ -316,10 +314,10 @@ static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
>  {
>         uintptr_t map_size = PAGE_SIZE;
>
> -       /* Upgrade to PMD/PGDIR mappings whenever possible */
> -       if (!(base & (PTE_PARENT_SIZE - 1)) &&
> -           !(size & (PTE_PARENT_SIZE - 1)))
> -               map_size = PTE_PARENT_SIZE;
> +       /* Upgrade to PMD_SIZE mappings whenever possible */
> +       if (!(base & (PMD_SIZE - 1)) &&
> +           !(size & (PMD_SIZE - 1)))
> +               map_size = PMD_SIZE;
>
>         return map_size;
>  }
> --
> 2.7.4
>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
