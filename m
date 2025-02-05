Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16321C02198
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 16:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQzigvmkBMs5EdjZkMY5eLdib5XdftbpIMWXaWrl1xQ=; b=IDquCApBlRy7ii
	2BpR/ti2cAyq2wDzZfFw0I0iuq0JkZUXrYgREnWlEMVt1m6nRckjJ73KGGoI74YrwZWBauR0EoioD
	25+heeR8lZIx4VajB1Y/jbwzu5ODMEG47cmFG6IqRXzy3zArx5AAm4CsgHerJFFTgrb3iyLa5GF5V
	RLpmduQfJJ0tApNFu0F2YbIfKwUW/ha+36Q+o1Yj49FdhKJJrWlhKxfvmafDuriSPNtfAvHvyOMp0
	6JaUwNF6+KOOT1IL5cjNmifBavM0kn0EWiRuaV95js/uf+PLbjZED5RBUVxIr85hhPxkiBZAE4i2v
	GZrI9curuNIVc3pIOdQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfiBQ-00000003xsF-0Xgv;
	Wed, 05 Feb 2025 16:23:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhzd-00000003vEA-2DtL;
	Wed, 05 Feb 2025 16:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9Pzq4QpU0v28Zgo9HpuqC1pSA+SuR0VCiDXZ1fsrvgA=; b=G1OrSepYxlVkjuTXnzsKHQAj2E
	rQUPTuE4Fet2r1ztVU5iJCrK/G3FtCkqTHJJT1ill2618fyU1cC6S2S91kz4CBdpJnUx8bbG35XTC
	oq7iERpM3gbwLDMTqPweQGQdxAC5Mt/OcufcquLunDnsMkJtozbIzO0/TclxYGzW7Z3Ek7EeeWuCo
	m52XC5LV7EM/nLi46Z28JgwR8j1gZPXlsCa/Js46cddfXFYr/SwcOefFV8jiibywpdk6S6adWHcbS
	i+bSvos5c6rcIt2SORTHbe2dNgmqnEIoINYdcWjLhJVAPPWtzrMZPMOXEpXDtFWmP+OCsBrbtJJBn
	4shh5YSw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhza-0000000Gh0U-1Otj;
	Wed, 05 Feb 2025 16:11:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3605E1063;
	Wed,  5 Feb 2025 08:11:31 -0800 (PST)
Received: from [10.57.35.21] (unknown [10.57.35.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6F3C3F58B;
	Wed,  5 Feb 2025 08:11:01 -0800 (PST)
Message-ID: <f8d73cd3-f85c-49c3-8b37-4eaad0255860@arm.com>
Date: Wed, 5 Feb 2025 16:11:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/19] iommu/amd: Use roundup_pow_two() instead of
 get_order()
To: Jason Gunthorpe <jgg@nvidia.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>,
 asahi@lists.linux.dev, Lu Baolu <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Heiko Stuebner <heiko@sntech.de>,
 iommu@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Hector Martin <marcan@marcan.st>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel@sholland.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Krishna Reddy <vdumpa@nvidia.com>,
 Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
 David Rientjes <rientjes@google.com>, Matthew Wilcox <willy@infradead.org>
References: <16-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <16-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_161110_595267_66D2632B 
X-CRM114-Status: GOOD (  13.33  )
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

On 2025-02-04 6:34 pm, Jason Gunthorpe wrote:
>    1 << (get_order(x) + PAGE_SHIFT) ==  roundup_pow_two()

...unless x < 2048, which does seem possible here if last_bdf is 
sufficiently small. Not too significant in the cases where the result is 
only rounded back up again for an allocation or remap anyway, but I do 
wonder about the use of dev_table_size in iommu_set_device_table(), and 
whether this change might break it, or whether it's already wrong for 
that case and this might actually fix it...

Thanks,
Robin.

> Use the shorter version.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/amd/init.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
> index f1c5041647173c..7d77929bc63af3 100644
> --- a/drivers/iommu/amd/init.c
> +++ b/drivers/iommu/amd/init.c
> @@ -247,10 +247,7 @@ static void init_translation_status(struct amd_iommu *iommu)
>   
>   static inline unsigned long tbl_size(int entry_size, int last_bdf)
>   {
> -	unsigned shift = PAGE_SHIFT +
> -			 get_order((last_bdf + 1) * entry_size);
> -
> -	return 1UL << shift;
> +	return roundup_pow_of_two((last_bdf + 1) * entry_size);
>   }
>   
>   int amd_iommu_get_num_iommus(void)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
