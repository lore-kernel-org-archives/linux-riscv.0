Return-Path: <SRS0=S+R5=LD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C93EC4743D
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 00:08:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11A0D6108E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 00:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11A0D6108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Bqk+7DV1c1QLG7JLXmvRoO5H/9nduuActFC0a0iu7oA=; b=vDkPWL1HK3/aJXKbUmDZnLC5ve
	BhpaNWO4t3blaOJ6SAo2GOTk/SQirjxygTTmYKijnvuRncGiaF+iFyeBIkemhIfMVhGtsX2Btfmwp
	lF5Xe2d8FvPKPNU4Se9tGSc2FCrFaqnbzPx6oAcoz5+7Nq5oNOsG0C50JY4f1d7xHIdZ7/MKeiLA2
	k/pzqheFFRZdFmjdgo/uOTeGy/Ja6HjTgz4YY3ik8T2HlpRCpXxTKelIEIvxU9l8yzvCGIllJXB49
	hJU+rWkjO7e0ScUHq6aWuKwGlx2pygM4rKx9ejy3dJJoB8EsMKn1BU9T85cHtyb0iCqcYQy+qsyDP
	/uoXzJnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqllb-00ApzG-0P; Wed, 09 Jun 2021 00:08:19 +0000
Received: from mail-pf1-f176.google.com ([209.85.210.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqllX-00AprH-UD
 for linux-riscv@lists.infradead.org; Wed, 09 Jun 2021 00:08:17 +0000
Received: by mail-pf1-f176.google.com with SMTP id k15so16998066pfp.6
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jun 2021 17:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=R/k0myT1X7Ewv76TA+iGRlCsIF04l49PA1ocz9s7kkU=;
 b=XFN6hEgeyL7VQ+lHXBNI1EMYNmWB3f2IbRNINoLGZ172p543bg08XWPuy1GOY1A/V+
 c4pd5fRkMfw3LXXTbefHrusAgpEyveNdHOpolFk1RMHTgyzrqqo87xnD6c9CxWUbh6kx
 VrkT6+PrPmUxg22oc53mnOFbRullxEc4NWtvttdTnMM7ICsaeOMri+J5E5Lt1bc8d8Ys
 4Ph1g40MhZ8zJMuSa0btSNQC8GlI40efsxBv3O76d5ywlhO/F29Zy2bPbuwtooNFw/oz
 jk49UmYy/gLaFPkVC4xNNi29/pVffLZy9I2DTmZyUPDaTlwgWvn9iW/evP7pBU/EA/Xr
 x7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=R/k0myT1X7Ewv76TA+iGRlCsIF04l49PA1ocz9s7kkU=;
 b=QyuuPhb7Og0bTafLiYFXOVq2przjgd8ujfi967SyQaC4izete02x8edcHv+ffecOVh
 z6gm20YH4RdhHFHnP0DcJOA3xAbNHiyGZCW6my4NSzLVhiBrjfuHKIk1fN+Zw1u9rSSb
 N10JVfNKNVf4lKOL/fm5TtWzWu4DAjAdRLimEBGUggnh73wq5YGGFeTqfAJFb0x53nO2
 ie8vJw9nfX40G83lxliu3e1trDXZivHq77QtwFzt6wv3Tg3tMceUQRNOeP+9ujiCulTz
 TIiLO6wR/XaC7G3ptpRXUO8YdQlNfUwJJqZMXB2H3tGntwLk+2Y9I/FIqmnXTy5hfRyI
 Kr4Q==
X-Gm-Message-State: AOAM530Ja8kb8ub+6Ps1tFYmhnbOocla8JVoVRauA+LXB0nVXgW5Npyw
 88eRxA5vimmolzExT64Nn7sC3w==
X-Google-Smtp-Source: ABdhPJye+W8VRhoqCXDkNa2Q2xQUuGVDU122+jgT3y0Vuv9BLAvkAVIfht2VcK8SrIzNgFC/bgc2Sg==
X-Received: by 2002:a63:1542:: with SMTP id 2mr827496pgv.329.1623197113206;
 Tue, 08 Jun 2021 17:05:13 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w125sm11361134pfw.214.2021.06.08.17.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 17:05:12 -0700 (PDT)
Date: Tue, 08 Jun 2021 17:05:12 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Jun 2021 17:05:10 PDT (-0700)
Subject: Re: [PATCH -next v3] riscv: fix build error when CONFIG_SMP is
 disabled
In-Reply-To: <20210529080657.18997-1-cuibixuan@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 vincent.chen@sifive.com, sunnanyong@huawei.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, cuibixuan@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: cuibixuan@huawei.com
Message-ID: <mhng-ce62a50e-85c7-4fc2-9dc0-7b8a9105ab4b@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_170816_001546_39BAF160 
X-CRM114-Status: GOOD (  19.54  )
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

On Sat, 29 May 2021 01:06:57 PDT (-0700), cuibixuan@huawei.com wrote:
> Fix build error when disable CONFIG_SMP:
> mm/pgtable-generic.o: In function `.L19':
> pgtable-generic.c:(.text+0x42): undefined reference to `flush_pmd_tlb_range'
> mm/pgtable-generic.o: In function `pmdp_huge_clear_flush':
> pgtable-generic.c:(.text+0x6c): undefined reference to `flush_pmd_tlb_range'
> mm/pgtable-generic.o: In function `pmdp_invalidate':
> pgtable-generic.c:(.text+0x162): undefined reference to `flush_pmd_tlb_range'
>
> Fixes: e88b333142e4 ("riscv: mm: add THP support on 64-bit")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
> Acked-by: Nanyong Sun <sunnanyong@huawei.com>
> ---
> Changes in v3:
> Deleted the declaration of the flush_pmd_tlb_range() in the patch
>
> Changes in v2:
> Move the declaration of flush_pmd_tlb_rang to tlbflush.h
>
>  arch/riscv/include/asm/pgtable.h  | 5 -----
>  arch/riscv/include/asm/tlbflush.h | 5 +++++
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 29e2c836848d..eda31002c4b1 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -622,11 +622,6 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>  {
>  	return __pmd(atomic_long_xchg((atomic_long_t *)pmdp, pmd_val(pmd)));
>  }
> -
> -#define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
> -void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
> -			unsigned long end);
> -
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>
>  /*
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index c84218ad7afc..801019381dea 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -33,6 +33,11 @@ void flush_tlb_mm(struct mm_struct *mm);
>  void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
>  void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  		     unsigned long end);
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +#define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
> +void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
> +			unsigned long end);
> +#endif
>  #else /* CONFIG_SMP && CONFIG_MMU */
>
>  #define flush_tlb_all() local_flush_tlb_all()

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
