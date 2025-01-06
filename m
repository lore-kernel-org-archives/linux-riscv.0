Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644B2E77199
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 10:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MqXfdZ6esJMvFtiwgF7ufQSXYOdDB0DqlleTr2iIFX8=; b=1VbyA6KrZmd7Mo
	BZPyrQ5NXAhm+x6Bf4VKykUDkHuis2o0pj3dUSk+556i4XmY4TBctHsfH9JcvuGsyhHqQ1rDCjOuP
	aNMdN3VuiU99mjTZKKyjBth+ewvZhR6A5pRzFWOrg3ovGaQOmKZqv7Osygv86P977t3MwJmTpxEMu
	gYOQOs+GcTKQHBAznCYNdPNnJK1xjVLwydSDsMRUoeG+2krojoILdCauazNjieEDiubzbFxFBDqdV
	xekujpAfaFOaqOASKJT68y1nN8J8ccQePWu/G2WKCQ++iDQy+oEhAFqET7M+tR9vv8zYvla77+bH7
	hXqJA4tUU6dtx03HKEnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkPi-00000000rkf-41ls;
	Mon, 06 Jan 2025 10:32:50 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkOk-00000000rak-2xuY
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 10:31:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97A2DC0003;
	Mon,  6 Jan 2025 10:31:45 +0000 (UTC)
Message-ID: <a110be11-923e-4943-8741-43b5513c9691@ghiti.fr>
Date: Mon, 6 Jan 2025 11:31:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/riscv: Fixup compile warning
Content-Language: en-US
To: guoren@kernel.org, tjeznach@rivosinc.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, baolu.lu@linux.intel.com,
 zong.li@sifive.com, iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
References: <20250103024616.3359159-1-guoren@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250103024616.3359159-1-guoren@kernel.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_023150_892452_8EBD08FF 
X-CRM114-Status: GOOD (  12.55  )
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

Hi Guo,

On 03/01/2025 03:46, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> When __BITS_PER_LONG == 32, size_t is defined as unsigned int rather


RISCV_IOMMU depends on 64BIT so how do you get __BITS_PER_LONG == 32?

Thanks,

Alex


> than unsigned long. Therefore, we should use size_t to avoid
> type-checking errors.
>
> Fixes: 488ffbf18171 ("iommu/riscv: Paging domain support")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Tomasz Jeznach <tjeznach@rivosinc.com>
> ---
>   drivers/iommu/riscv/iommu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 8a05def774bd..38d381164385 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1270,7 +1270,7 @@ static phys_addr_t riscv_iommu_iova_to_phys(struct iommu_domain *iommu_domain,
>   					    dma_addr_t iova)
>   {
>   	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
> -	unsigned long pte_size;
> +	size_t pte_size;
>   	unsigned long *ptr;
>   
>   	ptr = riscv_iommu_pte_fetch(domain, iova, &pte_size);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
