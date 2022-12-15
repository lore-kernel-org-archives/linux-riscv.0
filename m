Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5ABC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 17:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IF7y0kVHxKaezTwM/zUfVpLtUayEG3EfiIjyLMpGjuc=; b=jpabQWgcirntmS
	yNOQiLz7fztIOEWaWQ2d1+Pn9amRS11DtBIoXwhpyii8W56gZr7JM3Zl78zIpLK0+76dUcYtPmUZL
	FsYypNFrp7R6LgHJxBPgXTdXl1zQ/5yETFD2BLQ4UGCdTHC+aFYuBDqFCsjVOoTxULjHtF4Zhc4tR
	qvg8/CKhl9XCCEg39iWiIbk8mQFODzfoWc8ok/bmxP+/J05JMxxhbx16eo8UObRVjNwZayY2zfbI3
	dkVB5KkLzA8WI23ZqxAIGZIMblmViqEE5VKd27D46L/bLlerYedWM7XUPcEwjnQ9vKIjaq8vYtptZ
	cKGERhfqzY6077KYOteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rqn-00AW7V-Lb; Thu, 15 Dec 2022 17:16:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rql-00AW6Q-7l
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 17:16:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CAB5FEC;
	Thu, 15 Dec 2022 09:17:29 -0800 (PST)
Received: from [10.57.88.90] (unknown [10.57.88.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6F673F5A1;
	Thu, 15 Dec 2022 09:16:47 -0800 (PST)
Message-ID: <c10c9742-06d6-f56b-ea55-47f99b06ca32@arm.com>
Date: Thu, 15 Dec 2022 17:16:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] iommu/renesas: Support riscv compile
Content-Language: en-GB
To: guoren@kernel.org, palmer@dabbelt.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 iommu@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>,
 kernel test robot <lkp@intel.com>
References: <20221215073212.1966823-1-guoren@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20221215073212.1966823-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_091651_352910_D653B600 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

On 2022-12-15 07:32, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> After riscv selects ARCH_RENESAS, we need to add ARM64 || ARM
> dependency here.

This effectively removes all the extra COMPILE_TEST coverage we've been 
enjoying. FWIW I prefer Geert's suggestion to separate the real 
functional dependency from implicit assumptions about ARCH_RENESAS, with 
something like:

	depends on ARCH_RENESAS || COMPILE_TEST
	depends on !GENERIC_ATOMIC64	#for IOMMU_IO_PGTABLE_LPAE

Thanks,
Robin.

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>   drivers/iommu/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index dc5f7a156ff5..746b95b9f345 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -283,6 +283,7 @@ config EXYNOS_IOMMU_DEBUG
>   
>   config IPMMU_VMSA
>   	bool "Renesas VMSA-compatible IPMMU"
> +	depends on ARM64 || ARM
>   	depends on ARCH_RENESAS || (COMPILE_TEST && !GENERIC_ATOMIC64)
>   	select IOMMU_API
>   	select IOMMU_IO_PGTABLE_LPAE

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
