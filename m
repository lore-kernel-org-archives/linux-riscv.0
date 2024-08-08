Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7B0C52D7B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 16:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5foaOo7NojnrJra7NQAEnc9zl7QXaZMFk/1fEmVkfQc=; b=wu97IB71tbgMqQ
	nGPHF3PuPXA/+4TgPy9Vaa8qkfxCeis0Og0zQLU4pVXdv8vW9GxE2qoGNd2PJWtIjjwakYW0GRQ2b
	69RR4mD84e99Jq/34jsZV1prLBzCnq5u98NKDRmVjL75XVXj7qILJ5ye+1chdYd3foFHe11+BRQtf
	4lPinaWkUAzXLvTGlQZA1L+lDKZIzUb7TGcNVbyN8XAu2/OQlYZus+scJPlgdiEgl4RV7RL9GnKYA
	Fnl34GeoD6ka+h8MZ13mUoGy5NMeO0yGeaGGNow0w74Zednl2fZY7Gc2jH4RiQaMY+vONGXGS4aVt
	zO4cnivQjZCDsIyGYgEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc6Bl-00000008yRF-35HV;
	Thu, 08 Aug 2024 16:40:33 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc6Bi-00000008yOG-1Ua6
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 16:40:32 +0000
Received: from [100.65.224.131] (unknown [20.236.10.163])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7F15220B7165;
	Thu,  8 Aug 2024 09:40:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7F15220B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1723135227;
	bh=pNSyKAAFSaByPF2gZY6jQTEMrj9M3d4OIOtRITHeq2M=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=PzG10cldv/Tk+MgEh4nS+eROzyXE6w8cgUoROcA4GmIs13++8agdcClHJjbxidRRy
	 nkoLbnPDXPxTaCyWCFmNBbexGH1nWJtNJwXe1emvT9Q8Pka/vPOatVx7jRmy1v2nf/
	 XmiFwcy3ncserwcahCn4oKWurg9NWbyTkVFcVNEo=
Message-ID: <7dfff1ba-44a6-465a-a47c-d344ef00c6d5@linux.microsoft.com>
Date: Thu, 8 Aug 2024 09:40:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/7] iommu/riscv: Paging domain support
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <cover.1718388908.git.tjeznach@rivosinc.com>
 <bdd1e0547e01d012bf40c5e33b752e77c6663c90.1718388909.git.tjeznach@rivosinc.com>
 <389da90e-df78-4ea4-8453-ae2080a68956@linux.microsoft.com>
 <20240808131432.GB1985367@ziepe.ca>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20240808131432.GB1985367@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_094030_512667_13715F01 
X-CRM114-Status: GOOD (  12.82  )
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
Cc: eahariha@linux.microsoft.com, Zong Li <zong.li@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 8/8/2024 6:14 AM, Jason Gunthorpe wrote:
> On Tue, Aug 06, 2024 at 12:24:40PM -0700, Easwar Hariharan wrote:
>> On 6/14/2024 10:27 PM, Tomasz Jeznach wrote:
>>
>>> @@ -856,7 +1473,7 @@ static struct iommu_domain riscv_iommu_identity_domain = {
>>>  
>>>  static int riscv_iommu_device_domain_type(struct device *dev)
>>>  {
>>> -	return IOMMU_DOMAIN_IDENTITY;
>>> +	return 0;
>>>  }
>>
>> <snip>
>> Sorry for the drive by comment, I just happen to be in the nearby code
>> context.
>>
>> Nit: It may be better to use IOMMU_DOMAIN_BLOCKED here for readability
>> rather than the bare value.
> 
> It is weird and confusing, but 0 means "I have nothing to add" not
> BLOCKED.
> 
> You can't return BLOCKED from this op right now..
> 
> Jason

Ok, that's weird and confusing as you say. I went back and looked at the
kerneldoc for iommu_ops and it IS called out, but it's confusing that a
function named get_default_domain_type() can return a value that's a
valid domain type but isn't treated as one.

This was useful to fill in my mental model, thanks!

Easwar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
