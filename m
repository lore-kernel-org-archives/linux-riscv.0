Return-Path: <SRS0=590W=KZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C65C4C47082
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 01:22:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 208C760E0B
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 01:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 208C760E0B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=OdehMbgDi8CNt0j/LLnZZEp03p8AuxPSTsr4sWZfX/4=; b=xZVxskX8901V4j/qqKaSKAo2At
	4OM/Uv+u67bjiADRWz9wcS4m9IXD9I+nY4CR8AmzRUJ31YsEs3j2bCabsAktFvJJ74MtUQ2Qiuhrx
	GOORxiKOyABCnwqK/VWuricAy4sXY5l6UdXw/KQDeuNF4Q903Y+Qf9HfSRXsYnB8O/JobeWYTC4of
	JYzcmrWuxvd5B0u93MXFdWee/XfdUw7TSiW+QRoBoZdcqPiuTGAQeESlGsHfJ2Nxu1X5/F/uzaAgG
	3E7pLnTqBrcCx8XaRFBO/lHGZbSaqws1bHXFIt/7hBkhM8b68Bn+hVw8rGaghaTEgnd7w+1zyz3dX
	3msdKiLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnA9U-008jwe-Q3; Sun, 30 May 2021 01:22:04 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnA9P-008ju6-2K
 for linux-riscv@lists.infradead.org; Sun, 30 May 2021 01:22:03 +0000
Received: by mail-pl1-x629.google.com with SMTP id t21so3446355plo.2
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 18:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=xEi6BXoNnqtihXfBBcx4dPYE6EijHD5pKsgqYkE4P1o=;
 b=njwqfZE8koNsvOck2/ofN7d+VeB9/E7agwkbIWPFN8S37AyMerjqqKz0V8hWHejz/W
 KKgX7L/+HAb4y3usDPcNGrcSU/QAX0Iagyogl0FZzt3oFCPljEk/heMiCdJ1LIg9ymCQ
 v+xeboWgbaWpQug7Dk/UsI1nW3gstZ0zL80egM1CBOvR94CAw9zv4DnjaDBiYA7A+4Xr
 AvWuyjzo1QfuqIWC3ChrCOJetq+8z2s4gTbq3flNl0ifg6Bwypds4FmRaajKGM4hNPiW
 4Pe3h9UKu7COlOyWOdD/Dn1Ro+iIOIFFzVIl0rFNIWkMlPXjEX6lAk5l8AS03Jk5kaW7
 cZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=xEi6BXoNnqtihXfBBcx4dPYE6EijHD5pKsgqYkE4P1o=;
 b=XkKhYDq/klJkuyEF9WIlg9fodlfARf/tdNF+AxvFH3zwTrLhxKb4rb0kV8d8GBsmpt
 h9Ly2BI/TjHsjFoTpm/FunLNQOFFDwOo0r1iLwn2x2yEhr7DWZbu8zOVm5YIBcFxsmYp
 Y3TTMGR0TOKz1ZssZ+9GpI2FLGbtXtrxclGRFyB4lpEfK8QM+f2sGmh3joKmuymi7JLH
 28vY77pIVrp2t1YMZhRJjjkWxqxgyjTda6MyJGkof99RqQBkCJ4SwJ1jBq3tX24CyIsA
 oN8nhNIGqKEvkxTaVg11jj5x5UNBdjllMkRMJ8cIdFT4kqyRM1ve2DLC9Q5SsTLEm5qM
 UzoA==
X-Gm-Message-State: AOAM5303s8tF7+AqYuAxq9QGqf3TUCS2l35qlsISy96ImhDpQ1tsTAl5
 GTnS6WADhrcG3LvFAGXnF9OQ5CmLtC0EUWqe
X-Google-Smtp-Source: ABdhPJwXmSyqUABdXDz0ldneJ5UzS6/oEHX7G+UGEOWDVAMNntp8O5RLzJ4SG1+zJ7w5qYdkAwo2Bw==
X-Received: by 2002:a17:90a:de09:: with SMTP id
 m9mr11649295pjv.41.1622337713693; 
 Sat, 29 May 2021 18:21:53 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e17sm7340341pfi.131.2021.05.29.18.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 18:21:53 -0700 (PDT)
Date: Sat, 29 May 2021 18:21:53 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 18:21:51 PDT (-0700)
Subject: Re: [PATCH -next] riscv: mm: fix build errors caused by mk_pmd()
In-Reply-To: <mhng-4fb5ea1f-084a-4010-b4a6-d19423511720@palmerdabbelt-glaptop>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, 
 wangkefeng.wang@huawei.com, sunnanyong@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sunnanyong@huawei.com
Message-ID: <mhng-5dc6487a-bafb-471f-ac5c-f6ec93cd311c@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_182159_207213_AF7F4303 
X-CRM114-Status: GOOD (  16.57  )
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

On Sat, 29 May 2021 15:45:04 PDT (-0700), Palmer Dabbelt wrote:
> On Mon, 24 May 2021 00:02:20 PDT (-0700), sunnanyong@huawei.com wrote:
>> With "riscv: mm: add THP support on 64-bit", mk_pmd() function
>> introduce build errors,
>> 1.build with CONFIG_ARCH_RV32I=y:
>> arch/riscv/include/asm/pgtable.h: In function 'mk_pmd':
>> arch/riscv/include/asm/pgtable.h:513:9: error: implicit declaration of function 'pfn_pmd';
>>  did you mean 'pfn_pgd'? [-Werror=implicit-function-declaration]
>>
>> 2.build with CONFIG_SPARSEMEM=y && CONFIG_SPARSEMEM_VMEMMAP=n
>> arch/riscv/include/asm/pgtable.h: In function 'mk_pmd':
>> include/asm-generic/memory_model.h:64:14: error: implicit declaration of function 'page_to_section';
>>  did you mean 'present_section'? [-Werror=implicit-function-declaration]
>>
>> Use macro definition instead of inline function for mk_pmd
>> to fix the above problems.It is similar to the mk_pte macro.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Nanyong Sun <sunnanyong@huawei.com>
>> ---
>>  arch/riscv/include/asm/pgtable.h | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> index 4b708ae08910..f35d9c90d4cb 100644
>> --- a/arch/riscv/include/asm/pgtable.h
>> +++ b/arch/riscv/include/asm/pgtable.h
>> @@ -508,10 +508,7 @@ static inline unsigned long pmd_pfn(pmd_t pmd)
>>  	return ((__pmd_to_phys(pmd) & PMD_MASK) >> PAGE_SHIFT);
>>  }
>>
>> -static inline pmd_t mk_pmd(struct page *page, pgprot_t prot)
>> -{
>> -	return pfn_pmd(page_to_pfn(page), prot);
>> -}
>> +#define mk_pmd(page, prot)    pfn_pmd(page_to_pfn(page), prot)
>>
>>  static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>>  {
>
> Thanks, this is on for-next.

Sorry, I wasn't looking closely enough.  I think the actual problem here 
is that mk_pmd() should be in pgtable-64.h.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
