Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0B4C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 11:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/baM20Enj7QLcJZHGPGVvVMV9Bj1mD1YAtnt6EAzuAA=; b=1GlTSKzPYZaWzdTkrmParkaT8b
	AklHB9/KFtINzCZIprC1I1fKkWIqW3dJ8fEpcd06cR1fiBd3uqevnDtbegnwWKn7kANNnGKYTZpQi
	8tQks/0QNcEyIUL//0ITYQxOqf7bhEWeTCPxEwDICfhUuBbnSXrR/lpJr5nF309Yf/NzFpLN+4Dv8
	IpTpkaq2EaOxFE4OvXrDOqMyY7B45dKVa8wRFHn9wyDhNiAab/44/xf83N27mArORTV1qT7Y4iZ66
	hVW3tytwKUTSB8cfmzai+NXfiBukn7DNpfPZ6L0dWhmerx+u2PzqFTv9mJHRzt6qXOAwGdtxORcgP
	FnpeHh+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzxCC-00000007zKv-0bZl;
	Thu, 25 Apr 2024 11:23:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzxC8-00000007zKO-312q
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 11:23:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CA141007;
	Thu, 25 Apr 2024 04:23:43 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A8B03F7BD;
	Thu, 25 Apr 2024 04:23:12 -0700 (PDT)
Message-ID: <059ae516-aed4-4836-a2ca-aff150ff428d@arm.com>
Date: Thu, 25 Apr 2024 12:23:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] iommu/riscv: Add RISC-V IOMMU platform device
 driver
To: Tomasz Jeznach <tjeznach@rivosinc.com>
References: <cover.1713456597.git.tjeznach@rivosinc.com>
 <741996169fef074b5d9f4f218c2a98bf5dd38386.1713456598.git.tjeznach@rivosinc.com>
 <7f9a82ea-c4c8-40a5-8f26-7cb135e91c5d@arm.com>
 <CAH2o1u6FpDWNZsQCADQQKauPYzxDE73DRHHQKw6LjNb27ePeXw@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAH2o1u6FpDWNZsQCADQQKauPYzxDE73DRHHQKw6LjNb27ePeXw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_042316_896482_F6433F99 
X-CRM114-Status: GOOD (  16.12  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 24/04/2024 10:59 pm, Tomasz Jeznach wrote:
[...]
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 2657f9eae84c..051599c76585 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -18972,6 +18972,12 @@ L:   iommu@lists.linux.dev
>>>    L:  linux-riscv@lists.infradead.org
>>>    S:  Maintained
>>>    F:  Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
>>> +F:   drivers/iommu/riscv/Kconfig
>>> +F:   drivers/iommu/riscv/Makefile
>>> +F:   drivers/iommu/riscv/iommu-bits.h
>>> +F:   drivers/iommu/riscv/iommu-platform.c
>>> +F:   drivers/iommu/riscv/iommu.c
>>> +F:   drivers/iommu/riscv/iommu.h
>>
>> I'm pretty sure a single "F: drivers/iommu/riscv/" pattern will suffice.
>>
> 
> Correct. But will required a workaround for pretty naive MAINTAINERS update
> check in scripts/checkpatch.pl:3014 in next patch.

As long as what you're doing is clearly reasonable to humans, the 
correct workaround for any checkpatch complaint is to ignore checkpatch.

[...]
>>> +static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
>>> +{
>>> +     u64 ddtp;
>>> +
>>> +     /* Hardware must be configured in OFF | BARE mode at system initialization. */
>>> +     riscv_iommu_readq_timeout(iommu, RISCV_IOMMU_REG_DDTP,
>>> +                               ddtp, !(ddtp & RISCV_IOMMU_DDTP_BUSY),
>>> +                               10, RISCV_IOMMU_DDTP_TIMEOUT);
>>> +     if (FIELD_GET(RISCV_IOMMU_DDTP_MODE, ddtp) > RISCV_IOMMU_DDTP_MODE_BARE)
>>> +             return -EBUSY;
>>
>> It looks like RISC-V already supports kdump, so you probably want to be
>> prepared to find the IOMMU with its pants down and deal with it from day
>> one.
>>
> 
> This is the simplest check/fail for the kexec and/or boot loaders
> leaving IOMMU translations active.
> I've been already looking into kexec path to quiesce all devices and
> IOMMU in shutdown path.
> I'm not convinced it's ready for the prime time on RISC-V, will
> address this in follow up patches.

Yeah, for regular kexec you definitely want an orderly shutdown of the 
IOMMU, although there's still a bit of an open question about whether 
it's better to actively block any remaining traffic from devices whose 
drivers haven't cleanly stopped them. It's in the kdump crash kernel 
case that you can't have any expectations and need to be able to recover 
the IOMMU into a usable state, since it's likely to be in the way of 
devices which the crash kernel wants to take over and use.

Thanks,
Robin.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
