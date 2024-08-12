Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB249C3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 13:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nniTtONnV42rttyei8iI8+fvNsxOvpf1nuhV9DV0S0g=; b=CTRIpfPB1O7Z1QhFycy1xrgeDQ
	cJCM3WAfWQ66bgrPizWM/3qaX70GAGedD7Fdq2ROl87jrAj9gZqql9ZLZr+C9mU0o1Hol1meed552
	q7T98k3ov6wG2xVYaYKtg9rOrwGRDYrUX3HQ5XF0GEgSualH9uyn1NuQqBMuiXg/JfPd798gn6Nt5
	XeG0BfvYKnIwbZr4N9F+iOSm0AtZfKs5Bg8urfYWviIZ0m1L9vPtDjdIEXpxooRg+tmE8xKR9Kgc6
	Y1xUB/QPAFjGlafB9AlWGRj2TV6wE1Vz34nIxJcheSF5m+cB8Hwtf2GQDoaP/DUW3tFPtU7ldi/UH
	t3F0FpBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdUr9-00000000N16-0aoG;
	Mon, 12 Aug 2024 13:13:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdUr5-00000000Mzl-2C6x
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 13:13:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E52CCFEC;
	Mon, 12 Aug 2024 06:13:21 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 959D73F71E;
	Mon, 12 Aug 2024 06:12:53 -0700 (PDT)
Message-ID: <f549b436-b6f4-4ee8-9086-6f8d08e4e49e@arm.com>
Date: Mon, 12 Aug 2024 14:12:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/7] iommu/riscv: Paging domain support
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
References: <cover.1718388908.git.tjeznach@rivosinc.com>
 <bdd1e0547e01d012bf40c5e33b752e77c6663c90.1718388909.git.tjeznach@rivosinc.com>
 <389da90e-df78-4ea4-8453-ae2080a68956@linux.microsoft.com>
 <20240808131432.GB1985367@ziepe.ca>
 <7dfff1ba-44a6-465a-a47c-d344ef00c6d5@linux.microsoft.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <7dfff1ba-44a6-465a-a47c-d344ef00c6d5@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_061259_641684_E4F495C9 
X-CRM114-Status: GOOD (  16.74  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 08/08/2024 5:40 pm, Easwar Hariharan wrote:
> On 8/8/2024 6:14 AM, Jason Gunthorpe wrote:
>> On Tue, Aug 06, 2024 at 12:24:40PM -0700, Easwar Hariharan wrote:
>>> On 6/14/2024 10:27 PM, Tomasz Jeznach wrote:
>>>
>>>> @@ -856,7 +1473,7 @@ static struct iommu_domain riscv_iommu_identity_domain = {
>>>>   
>>>>   static int riscv_iommu_device_domain_type(struct device *dev)
>>>>   {
>>>> -	return IOMMU_DOMAIN_IDENTITY;
>>>> +	return 0;
>>>>   }
>>>
>>> <snip>
>>> Sorry for the drive by comment, I just happen to be in the nearby code
>>> context.
>>>
>>> Nit: It may be better to use IOMMU_DOMAIN_BLOCKED here for readability
>>> rather than the bare value.
>>
>> It is weird and confusing, but 0 means "I have nothing to add" not
>> BLOCKED.
>>
>> You can't return BLOCKED from this op right now..
>>
>> Jason
> 
> Ok, that's weird and confusing as you say. I went back and looked at the
> kerneldoc for iommu_ops and it IS called out, but it's confusing that a
> function named get_default_domain_type() can return a value that's a
> valid domain type but isn't treated as one.
> 
> This was useful to fill in my mental model, thanks!

Yeah, it's perhaps a bit subtle, but the context is that not all domain 
types are valid *default domain* types, those are strictly only DMA or 
identity, because the other types would be nonsensical. If a driver 
really wanted to completely block a device for some specific reason, it 
should do that by refusing to attach it to the default domain at all.

Thanks,
Robin.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
