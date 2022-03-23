Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFABAC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Mar 2022 01:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=moeQ7dURo8kCT9+7s5rQc6G2tRS2hjvK3LxEUTtCifo=; b=PayOd+Q4X9kHWBlLIxIzpH1/oq
	YiUz5D5BKUJ2pWJK2l/bu+4d7B26zWCKCUzxgowudeTNVZL4VJUD6xo/CK60u+lqMZ2c1/ZoXOCEx
	+XA1GAZdeNHLFzV5rVLKajhDHhkx24NkuJRsHTWuO+atNGlXgr3ETl2W45XQcMvbc9jmTYSweF7Po
	0haQ82QKNg+rw8N9aOTotI6J/kNXERVDLePldwNWrWFF6K8gJbXJXKL6IP7rJ9/0D7TA+3Dzcmz0Q
	iSxjf6Wo6n6s6zdSmNFXw5PgA+b17Q9+jbr6bIps0Qt+Dre4zrdNTORUkhOLW726xvJ8Luoz5vWXF
	eu+Q4hmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWplA-00CZ3S-OA; Wed, 23 Mar 2022 01:26:00 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWpl7-00CZ2t-Jx
 for linux-riscv@lists.infradead.org; Wed, 23 Mar 2022 01:25:59 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 bx24-20020a17090af49800b001c6872a9e4eso290020pjb.5
 for <linux-riscv@lists.infradead.org>; Tue, 22 Mar 2022 18:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=SBBIjQeahpoQVzNHZQJxrFx7PVvdykpEH5Fgx1aWa+k=;
 b=HssRNu+XRLu0ZUBm6oG0R4BTbUgHwWfrFegkRpSGP7z7tTM3CWPYpeHcTN5pG4k/9g
 Gu8sGfWM8FkpfF3rR3HP6tHrOq4A/W00y8e4JfK1HciC7VdFEsW5oRSkWyqCCwTMmVD/
 Gq/P7aBhei99Cs31uEB5J78/V0LTsQqxDjiS08rA6MLmzaSTXdBZJTH4sQgBw1TXkceR
 UzxFXwOFFP0q/8xgwuynqv0MkayfT3aFKiS5jzik+HE1Xl3dz++L+uMF5C8IJFwnrQpZ
 MJoNzENhkakJuPPL+rqzA3iQQDBHPnatTydKxSCjHjJVCGbCpz5hUd3fX4aeFEoiCrHi
 pfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=SBBIjQeahpoQVzNHZQJxrFx7PVvdykpEH5Fgx1aWa+k=;
 b=bNv6+7dnoWpeyHk16kuv7OnVGlex+C6I5OBpGfGd/1WR37Lx48+7E1YC2rX5egzfmI
 jbZD1sxfdacmDXVmJEJOvcLZg9N1w9ulISnlIVlwUfWZKWWDKweT/egusPct1bueILTL
 00RPxC/VfqALp0dRFmnU4MAnK921Eftus9nxEWz82oXGfNYpJmN9vXtdGLaBTklWFT6k
 OpjGnI6/i4QXX6gbAQaDObM10MbMwJgL2yEMI0WfVlMz3Hwp7LHhel8aXRDYh5/tAxX0
 zM9lqGpNIsbI3kKB9HwsQDfmBKM7V5HRJbXbEaRP1lbm/Dd7Xuy5w0UbVXCSlLmizCy6
 owUA==
X-Gm-Message-State: AOAM531N1Y3x7xrHOUl1sdg3kyWCik01+RZYZCykOl2ESNuCi0pidSa9
 gYmDRCSM5RkuF5KDt0yFNx0neA==
X-Google-Smtp-Source: ABdhPJxEJD6Pup7Yui+VwTNz2w20ow9ZuuCfc6dsl5GLcjxwNbWP6dib3OM6oLMv5cQ74PBsQfEb9w==
X-Received: by 2002:a17:90b:2246:b0:1c6:5781:7193 with SMTP id
 hk6-20020a17090b224600b001c657817193mr8594516pjb.48.1647998756282; 
 Tue, 22 Mar 2022 18:25:56 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 p27-20020a056a000a1b00b004f3f63e3cf2sm26464785pfh.58.2022.03.22.18.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 18:25:55 -0700 (PDT)
Date: Tue, 22 Mar 2022 18:25:55 -0700 (PDT)
X-Google-Original-Date: Tue, 22 Mar 2022 18:25:52 PDT (-0700)
Subject: Re: [PATCH] riscv: avoid making unexpected changes to pte
In-Reply-To: <20220303092119.25314-1-guangzhen.wang@tihchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, guangzhen.wang@tihchip.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guangzhen.wang@tihchip.com
Message-ID: <mhng-9aa4fb80-e622-424f-8baa-e0ce4ebb7e3f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_182557_678126_BD63E839 
X-CRM114-Status: GOOD (  18.67  )
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

On Thu, 03 Mar 2022 01:21:19 PST (-0800), guangzhen.wang@tihchip.com wrote:
> _PAGE_CHG_MASK does not protect the pte value in pte_modify as
> described. Use _PAGE_CHG_MASK to limit the value of newprot.
>
> Signed-off-by: Guangzhen Wang <guangzhen.wang@tihchip.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index bf204e7c1f74..dfc9cc4146d0 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -370,7 +370,7 @@ static inline int pmd_protnone(pmd_t pmd)
>  /* Modify page protection bits */
>  static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
>  {
> -	return __pte((pte_val(pte) & _PAGE_CHG_MASK) | pgprot_val(newprot));
> +	return __pte((pte_val(pte) & _PAGE_CHG_MASK) | (pgprot_val(newprot) & ~_PAGE_CHG_MASK));
>  }
>
>  #define pgd_ERROR(e) \

This seems like it's a bug it whatever's calling this.  IMO it'd be 
better to fix the caller rather than just silently throwing away some 
bits.  Do you have any more information on how this is manifesting a 
bug?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
