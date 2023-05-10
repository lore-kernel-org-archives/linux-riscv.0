Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFC0C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 14:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=xy6muM8BQxAPUocp4c27l5BvT1sH0vI2GuaXJbdQZ08=; b=OFiBSBLDQzr7hs7dunw5d65G2v
	gW/p03MzrzSXWDE1cBfo9T+7vWnH8p26QFT7RAdIJfDwVPbodXlGoF6zE2u/4l3iFMqZWaB1TIRpG
	FPsOnU3BVWOuOqXsrbOoP3mQRXvo0PPN7ndfavfSYeNWs/nWmr4P16jF/PvKKv+w8tcsE3KHKxXQZ
	MfzkHcKTDrutbls75dFQI700C6BMlbQohGTT/2EiIaBHz129gdzBRc8JAbMg5/LsHeIHCzmvdVdMj
	cuKl24ZDiFCvgjx7/XMluYh8JxN7BNkI7wuASLl6HZkYKEFZlkxexIccjTgxyP6zcDmLnVBLm6/M4
	5HCHok8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwkOK-006IbI-2N;
	Wed, 10 May 2023 14:02:04 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwkOH-006IYx-2l
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 14:02:03 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-64115e652eeso50447592b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 May 2023 07:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683727315; x=1686319315;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8O+Xva6SSKUOzu8cD6VykU+fN8y+E0NtB9pirvzzQ9U=;
        b=xm7Lt7K+fM4a6fbPP7MIva3KYIsdEH2pn6NhTnqMZWDxfwMmfjfuC2iA7TIUgSp9X7
         iapnslzabTi/3hpYysj/Y+Qpo/U+trS4YUbBrAymZCbRPQc2GdzYMvfSXRt75xnkQ7HH
         9YmGcBzN1XGEnBnDnk4hqc6szvJ0vnbRYHR7DYbbDIfxitLJRxJHVDjlkZx/sb2Dalmd
         NMN9fv1UEU3MEvWMv2OyK363gty+uPi7R5tqnoKyXja1AZDDzs7OuMx+xXPfQOPl3EBu
         5ahAyXiN9ZWDD9X3LQrrN5sPj7Sd7WcMwJ/uvJSD2iG4PimTEA2R4mrq6SpEbr7//1lB
         gm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683727315; x=1686319315;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8O+Xva6SSKUOzu8cD6VykU+fN8y+E0NtB9pirvzzQ9U=;
        b=AuD4sdeSBVGRgbS14tNR3EaMn0MVCTansIAZ3zBiYn79jgCcB5q/udOd+1TBUgksmz
         zOKjNeP5eXSFkDYfb7DfzvTXG36p1LqhDfTfzY1/JY6R8aLEXw6sB/X5S4Irlb5Y7J/z
         wiK7lF5VyIOGdeS7LAotK4uSfsrWwisslIbWeyvlxS9ggfmjKG7SWp03rr31Z6AfYRQ/
         uqAbfbcqwzU5ZNMPxiSdvpbiZPIoAV/dAGyV9yXKWmyexWCMDW7JrQ1HrRLqCtmdq7Zl
         wkCLe6VNu3kWk5Lpxe/Pd90/JZNxMkZj2e3LE4eWC5V/x3JYtYbbqZguNGbmVaTwpKPs
         l5oA==
X-Gm-Message-State: AC+VfDyWf5kuMFgYnz7GT6NhuLX582X8h3e2xxFb3hENKIO7Yl6PVTSE
	aPfkhe6m84+lrrnrxums348jkA==
X-Google-Smtp-Source: ACHHUZ5DO6A5G9Iwzn4Bquam+4PsWMq7WswXOCHPFyT+gtbX2VPfleyC7b8WGb0kQumaiIfRAr9lsw==
X-Received: by 2002:a17:902:9a03:b0:1ad:1be7:2a76 with SMTP id v3-20020a1709029a0300b001ad1be72a76mr1572089plp.10.1683727315241;
        Wed, 10 May 2023 07:01:55 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id q6-20020a170902dac600b001ac55a5e5eesm3819212plx.121.2023.05.10.07.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 07:01:54 -0700 (PDT)
Date: Wed, 10 May 2023 07:01:54 -0700 (PDT)
X-Google-Original-Date: Wed, 10 May 2023 07:01:48 PDT (-0700)
Subject: Re: [PATCH 14/23] riscv/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <d1e54510-9ea2-edf-3851-fa7635ce1e5e@google.com>
CC: akpm@linux-foundation.org, mike.kravetz@oracle.com, rppt@kernel.org,
  kirill.shutemov@linux.intel.com, willy@infradead.org, david@redhat.com, surenb@google.com,
  zhengqi.arch@bytedance.com, linux@armlinux.org.uk, Catalin Marinas <catalin.marinas@arm.com>,
  Will Deacon <will@kernel.org>, geert@linux-m68k.org, gerg@linux-m68k.org, monstr@monstr.eu,
  tsbogend@alpha.franken.de, deller@gmx.de, dave.anglin@bell.net, aneesh.kumar@linux.ibm.com,
  mpe@ellerman.id.au, alexghiti@rivosinc.com, hca@linux.ibm.com, borntraeger@linux.ibm.com,
  imbrenda@linux.ibm.com, glaubitz@physik.fu-berlin.de, davem@davemloft.net, chris@zankel.net,
  jcmvbkbc@gmail.com, x86@kernel.org, linux-arm-kernel@lists.infradead.org,
  linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
  linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
  linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-mm@kvack.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: hughd@google.com
Message-ID: <mhng-fa58638c-1b42-4264-8bf1-55d4bc42a5e2@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_070201_892405_5C712BC6 
X-CRM114-Status: GOOD (  16.64  )
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

On Tue, 09 May 2023 21:59:57 PDT (-0700), hughd@google.com wrote:
> pte_alloc_map() expects to be followed by pte_unmap(), but hugetlb omits
> that: to keep balance in future, use the recently added pte_alloc_huge()
> instead; with pte_offset_huge() a better name for pte_offset_kernel().
>
> Signed-off-by: Hugh Dickins <hughd@google.com>
> ---
>  arch/riscv/mm/hugetlbpage.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
> index a163a3e0f0d4..80926946759f 100644
> --- a/arch/riscv/mm/hugetlbpage.c
> +++ b/arch/riscv/mm/hugetlbpage.c
> @@ -43,7 +43,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm,
>
>  	for_each_napot_order(order) {
>  		if (napot_cont_size(order) == sz) {
> -			pte = pte_alloc_map(mm, pmd, addr & napot_cont_mask(order));
> +			pte = pte_alloc_huge(mm, pmd, addr & napot_cont_mask(order));
>  			break;
>  		}
>  	}
> @@ -90,7 +90,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
>
>  	for_each_napot_order(order) {
>  		if (napot_cont_size(order) == sz) {
> -			pte = pte_offset_kernel(pmd, addr & napot_cont_mask(order));
> +			pte = pte_offset_huge(pmd, addr & napot_cont_mask(order));
>  			break;
>  		}
>  	}

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
