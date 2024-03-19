Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B303C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 12:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H6o6qi71PYIFXQv7Ri7TC5mzSjB7SwPykJZo2Jsngdg=; b=O881+Pne3+CMJS
	UbFZZAMCYkgcLk2eZf6Ko/t+UnQWUcMX73qFVNxgJDKgOngdcGFFTkqjNNC9eLleCgKYgNV6hzfU9
	Emm2o4F7PsE1Z9yXO+/080BIHwxN33FlasXDI49vkR4u7mEq6PfiWAqpyen4B4unuWe+T+4xFZRWl
	BYS2LkQiHDpYSmtiR9zRlCqlRiVamsXpPdMRBFOhFx+gadTXxdqeBIlSlcXgetmTgM/nw88jk0M49
	IadtVF9aIno7XFsHcroXbJ080ZmEgU40HNPoylmC2rXfw5vcHNNinoP3iEyLglIxzK+8Yo6aoDllK
	c0G8OJ/3e6erkddflrlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmYtC-0000000Cfe2-0re4;
	Tue, 19 Mar 2024 12:48:22 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmYt9-0000000Cfd8-0u9O
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 12:48:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E316920004;
	Tue, 19 Mar 2024 12:48:12 +0000 (UTC)
Message-ID: <5c900e62-2101-4862-93cf-06292deccabf@ghiti.fr>
Date: Tue, 19 Mar 2024 13:48:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: mm: Fix prototype to avoid discarding const
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel
 <apatel@ventanamicro.com>, Dylan Jhong <dylan@andestech.com>,
 Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
 linux-kernel@vger.kernel.org
References: <20240301201837.2826172-1-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240301201837.2826172-1-samuel.holland@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_054819_435922_CB29F0DA 
X-CRM114-Status: GOOD (  12.87  )
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

Hi Samuel,

On 01/03/2024 21:18, Samuel Holland wrote:
> __flush_tlb_range() does not modify the provided cpumask, so its cmask
> parameter can be pointer-to-const. This avoids the unsafe cast of
> cpu_online_mask.
>
> Fixes: 54d7431af73e ("riscv: Add support for BATCHED_UNMAP_TLB_FLUSH")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>   arch/riscv/mm/tlbflush.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 893566e004b7..07d743f87b3f 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -99,7 +99,7 @@ static void __ipi_flush_tlb_range_asid(void *info)
>   	local_flush_tlb_range_asid(d->start, d->size, d->stride, d->asid);
>   }
>   
> -static void __flush_tlb_range(struct cpumask *cmask, unsigned long asid,
> +static void __flush_tlb_range(const struct cpumask *cmask, unsigned long asid,
>   			      unsigned long start, unsigned long size,
>   			      unsigned long stride)
>   {
> @@ -200,7 +200,7 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>   
>   void flush_tlb_kernel_range(unsigned long start, unsigned long end)
>   {
> -	__flush_tlb_range((struct cpumask *)cpu_online_mask, FLUSH_TLB_NO_ASID,
> +	__flush_tlb_range(cpu_online_mask, FLUSH_TLB_NO_ASID,
>   			  start, end - start, PAGE_SIZE);
>   }
>   


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
