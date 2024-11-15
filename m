Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F19D68BC6
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Nov 2024 15:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+C/v3IcqrtgEqM2itERFzt40usIoCwvGUYK6z5dtqtU=; b=ylIkohaGwqzJKO
	IlhZJGYi2V5lO5KOEtuBKWYxDPVhDzUlG1f0ysy3l31g1DQll8K/QYlTb1N1XrIQwARWT92motjmi
	La7ILkk2t8mdL4Ja/dPuFX9u8e//8Hk5NTktZ8AKDshb3iVP55rT4jQojPUV9IYggWM6HB8NymIxw
	wTaxzmhex8lxHFH+HWTZhyrqefM3z286EHcgkL+Pr1vHVextzZTyjsG5JsFLhffrBATrXTTUGt3hE
	G4FQAsZd308tteIsAEZVp8hmIJQnsxqVh3oC7y69KC6stE5MHSoseakkUyCWz3QVRUjFiUF56uw0E
	8ifJZj3f9C8hAlXYhMBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBy7y-000000038db-1lF5;
	Fri, 15 Nov 2024 15:20:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBy7v-000000038cG-0mh0;
	Fri, 15 Nov 2024 15:20:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA1C01424;
	Fri, 15 Nov 2024 07:21:18 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9488D3F6A8;
	Fri, 15 Nov 2024 07:20:38 -0800 (PST)
Message-ID: <ddd40bc3-7f2a-43c2-8918-a10c63bd05ba@arm.com>
Date: Fri, 15 Nov 2024 15:20:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/15] iommu/riscv: report iommu capabilities
To: Andrew Jones <ajones@ventanamicro.com>, iommu@lists.linux.dev,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tjeznach@rivosinc.com, zong.li@sifive.com, joro@8bytes.org,
 will@kernel.org, anup@brainfault.org, atishp@atishpatra.org,
 tglx@linutronix.de, alex.williamson@redhat.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-21-ajones@ventanamicro.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241114161845.502027-21-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_072051_269534_BD2BC629 
X-CRM114-Status: GOOD (  15.05  )
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

On 14/11/2024 4:18 pm, Andrew Jones wrote:
> From: Tomasz Jeznach <tjeznach@rivosinc.com>
> 
> Report RISC-V IOMMU capabilities required by VFIO subsystem
> to enable PCIe device assignment.

IOMMU_CAP_DEFERRED_FLUSH has nothing at all to do with VFIO. As far as I 
can tell from what's queued, riscv_iommu_unmap_pages() isn't really 
implementing the full optimisation to get the most out of it either.

I guess IOMMU_CAP_CACHE_COHERENCY falls out of the assumption of a 
coherent IOMMU and lack of PBMT support making everything implicitly 
IOMMU_CACHE all the time whether you want it or not, but clarifying that 
might be nice (especially since there's some chance that something will 
eventually come along to break it...)

Thanks,
Robin.

> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   drivers/iommu/riscv/iommu.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 8a05def774bd..3fe4ceba8dd3 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1462,6 +1462,17 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
>   	return generic_device_group(dev);
>   }
>   
> +static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
> +{
> +	switch (cap) {
> +	case IOMMU_CAP_CACHE_COHERENCY:
> +	case IOMMU_CAP_DEFERRED_FLUSH:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>   static int riscv_iommu_of_xlate(struct device *dev, const struct of_phandle_args *args)
>   {
>   	return iommu_fwspec_add_ids(dev, args->args, 1);
> @@ -1526,6 +1537,7 @@ static void riscv_iommu_release_device(struct device *dev)
>   static const struct iommu_ops riscv_iommu_ops = {
>   	.pgsize_bitmap = SZ_4K,
>   	.of_xlate = riscv_iommu_of_xlate,
> +	.capable = riscv_iommu_capable,
>   	.identity_domain = &riscv_iommu_identity_domain,
>   	.blocked_domain = &riscv_iommu_blocking_domain,
>   	.release_domain = &riscv_iommu_blocking_domain,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
