Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BFACA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 16:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l+9WNJl3kUrz+fGRYhqKwvtMhSpvTkOwdYEu7t+Nppc=; b=E6uF5FhxKXOUKF
	rDPp8gtvQl0S+RI6P/gnCRMFZvH39/g/9gvfVxgQM77WnRWAgEmlnDCJsi19yl6C65qotl/AvdRoq
	CcLdRLOFYHXVnqlieDoWMRm/Z5Kz7y4o4xRf1F6C9tmFoYs5ckXA0xFiCaLnNE4mI5ktcfv4suaZa
	nPhka44yw/PTs51opRWcb2DPV3p1kF8YTZ+a5tHv23T1jvzdUvLAi7LTkeAJ8rmQy1S2FABW3OFMU
	9UZiduE/ptXoGW8gnghTcvgPP//oR0FmPO/eQkpRFbZEiZ2E5Y48WX5TduKlcr2bu5/DicyV5nV8Q
	XgqefqLncYK1t9SUd2AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxlb-000000032KV-4AJ7;
	Fri, 15 Aug 2025 16:58:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umveU-00000002kpU-04Va
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 14:43:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEDFF1691;
	Fri, 15 Aug 2025 07:43:20 -0700 (PDT)
Received: from [10.1.196.50] (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E7B33F738;
	Fri, 15 Aug 2025 07:43:27 -0700 (PDT)
Message-ID: <e87aa091-5c02-4cd6-9636-0cb6c0015768@arm.com>
Date: Fri, 15 Aug 2025 15:43:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] iommu/riscv: prevent NULL deref in iova_to_phys
To: Joerg Roedel <joro@8bytes.org>,
 XianLiang Huang <huangxianliang@lanxincomputing.com>
Cc: tjeznach@rivosinc.com, markus.elfring@web.de, will@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250815071244.13982-1-huangxianliang@lanxincomputing.com>
 <aJ8FbvCJEOj2XjT-@8bytes.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aJ8FbvCJEOj2XjT-@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_074330_096576_47095C74 
X-CRM114-Status: UNSURE (   8.81  )
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

On 15/08/2025 11:01 am, Joerg Roedel wrote:
> On Fri, Aug 15, 2025 at 03:12:44PM +0800, XianLiang Huang wrote:
>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>> index 2d0d31ba2886..0eae2f4bdc5e 100644
>> --- a/drivers/iommu/riscv/iommu.c
>> +++ b/drivers/iommu/riscv/iommu.c
>> @@ -1283,7 +1283,7 @@ static phys_addr_t riscv_iommu_iova_to_phys(struct iommu_domain *iommu_domain,
>>   	unsigned long *ptr;
>>   
>>   	ptr = riscv_iommu_pte_fetch(domain, iova, &pte_size);
>> -	if (_io_pte_none(*ptr) || !_io_pte_present(*ptr))
>> +	if (!ptr)
>>   		return 0;
> 
> Zero is usually not an invalid physical address, or is it on RISC-V?

It's a valid PA on many systems of many architectures, but it's also 
been the "not mapped/error" value for the iova_to_phys operation all the 
way back to the very very first intel_iommu_iova_to_pfn() nearly 17 
years ago, so hey :)

Thanks,
Robin.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
