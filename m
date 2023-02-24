Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C17C61DA3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 12:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SjVMu5b4chZO7lwxdP39NroXM1cL1zVxzmCK68YZ65Y=; b=szeeBi/hxwHo2I
	gavoMy7lvNgS2Da56V8EbRALQsUJxXCgaXIFBjoRLWYKYTDQLEyebSsIrDMx3icUa4U7bkIq5y2Hj
	vIt4UlFCa7qCg0bFk/1lSEN/nQg3ESvUThiY86lgw5NX5MKg02vrWYP+BHthtdLCQ5CYSY+x7+vAW
	nq2iaiZGAiwFEgncej1jqPJ934w9d4Unzni27MyZsSs6zo5PV5OBDkur9DOTrNI720V7vJaB91VzB
	sUNYV/c/kuft4sl5/EKN56IKsQ8rFsVAt4eF//i5T6WvpqIjPrTsIq3eV3Dv/LdKZ8TlN3voatSqr
	ZROF5upiGSfiIXnXihSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXU9-002Sgr-Ck; Fri, 24 Feb 2023 12:47:37 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXU6-002SeB-Kq
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 12:47:36 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id CDC69240003;
	Fri, 24 Feb 2023 12:47:20 +0000 (UTC)
Message-ID: <8adb9dcb-621a-0392-9ccd-0117345636ec@ghiti.fr>
Date: Fri, 24 Feb 2023 13:47:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] RISC-V: mm: Support huge page in vmalloc_fault()
Content-Language: en-US
To: Dylan Jhong <dylan@andestech.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: liushixin2@huawei.com, x5710999x@gmail.com, bjorn@rivosinc.com,
 abrestic@rivosinc.com, peterx@redhat.com, hanchuanhua@oppo.com,
 apopple@nvidia.com, hca@linux.ibm.com, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, paul.walmsley@sifive.com, tim609@andestech.com,
 peterlin@andestech.com, ycliang@andestech.com
References: <20230224104001.2743135-1-dylan@andestech.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230224104001.2743135-1-dylan@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_044734_852528_46E7DAB5 
X-CRM114-Status: GOOD (  15.63  )
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

Hi Dylan,

On 2/24/23 11:40, Dylan Jhong wrote:
> RISC-V supports ioremap() with huge page (pud/pmd) mapping, but
> vmalloc_fault() assumes that the vmalloc range is limited to pte
> mappings. Add huge page support to complete the vmalloc_fault()
> function.
>
> Fixes: 310f541a027b ("riscv: Enable HAVE_ARCH_HUGE_VMAP for 64BIT")
>
> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> ---
>   arch/riscv/mm/fault.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index eb0774d9c03b..4b9953b47d81 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -143,6 +143,8 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
>   		no_context(regs, addr);
>   		return;
>   	}
> +	if (pud_leaf(*pud_k))
> +		goto flush_tlb;
>   
>   	/*
>   	 * Since the vmalloc area is global, it is unnecessary
> @@ -153,6 +155,8 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
>   		no_context(regs, addr);
>   		return;
>   	}
> +	if (pmd_leaf(*pmd_k))
> +		goto flush_tlb;
>   
>   	/*
>   	 * Make sure the actual PTE exists as well to
> @@ -172,6 +176,7 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
>   	 * ordering constraint, not a cache flush; it is
>   	 * necessary even after writing invalid entries.
>   	 */
> +flush_tlb:
>   	local_flush_tlb_page(addr);
>   }
>   


This looks good to me, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

One question: how did you encounter this bug?

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
