Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2964EA7959
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 03:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7NdklatWmlFkRVzWGC7fFMRnz8nQ1/z6AR+6/YpKRE=; b=Wq9gH0ETgzV0hM
	Spqg7e+SsIqmLJI8fk2ycw9aJHAd30AuMRK1clOF/3TiXe1kmiOwxR/eyO7MEukc6vnozgcZa3fJs
	zXu/qyozIKiE5Hn65vau+9g9SjIVPGKo9MXx4A/6pt+SHPo01wF01JdX1fLcTdBhOGG/79MSovZAs
	QezZB8whLC5K8FL94NkTxFP7XKFldSYWWnsl1h46m5I8DFcdgqpZ01FrPoT18UGU/tc6MuxVsXwMo
	h7l07ntP8LR2/lv0OdWgvd1YRnkXVtyw3QbSxn8p+H6Xm3gSPxtQPOSsiSsUmep3XN/lCwqhQOVZO
	uej4RtlayoORrBRT8npw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnpnK-00000009Lhl-2NHI;
	Thu, 05 Feb 2026 03:12:38 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnpnF-00000009LfW-1WKX
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 03:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770261121;
	bh=heHa9rbSouxgofbJnFAFyMF72iwhsC71yP9mq5zUhvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=imwJmyzIaPnAR0HaM7xhEhNSs8Qi0MKFs3Kns/b5uZMs3Mi3w+gJH9qgkw7sqf/pJ
	 76hH3C6n7NdRmFWexy2e1CFkNxa+zEuFlnBH4/xxDSG+HFiWp0XiRIt7BtGatsQ6mP
	 Hx5v4wqq0zBEUD8i3Q5wwE4ePEJasVrnvFAulAes=
X-QQ-mid: zesmtpgz6t1770261114t5898cb5b
X-QQ-Originating-IP: jDGCraUegzvM3hA1qOZ0LYZjnZ72m2Z4CgJiGlR3ogc=
Received: from [10.3.91.191] ( [101.70.125.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Feb 2026 11:11:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8415482529480836692
Message-ID: <53171BEB06F43599+7c1f54bc-e72d-4cbd-9d10-194ae6b13744@linux.spacemit.com>
Date: Thu, 5 Feb 2026 11:11:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] dt-bindings: iommu: Add spacemit/t100 features
To: Conor Dooley <conor@kernel.org>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jingyu Li <joey.li@spacemit.com>,
 Zhijian Chen <zhijian@spacemit.com>, iommu@lists.linux.dev,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <A0E91F323138E92F+a27d73b00f3324f0d3885128f5596230b3f1370b.1770195980.git.lv.zheng@linux.spacemit.com>
 <20260204-primer-wrought-6f64b14bf152@spud>
Content-Language: en-US
From: Lv Zheng <lv.zheng@linux.spacemit.com>
In-Reply-To: <20260204-primer-wrought-6f64b14bf152@spud>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: NQDSFSrlZSaiMN5aacZjVMSPnLrTFIEwUy+Y7sQ2D74QLSdwSST+SHiO
	24rwkL6JyiLcqTOQx7YEPOLBluzJzM9kFH+z1H9n91UCejLPUVnG8qXU66PEOr95RIVY4O7
	oqiXDvTay/anh9o7mxn3GSZj3BuhpETUJUsRUV5a9oJ12KFVzVWHabM4PMaLwfDeRvFGh+D
	4LUD0nlolBJKvk08101pgNxgfA47bVZmszo9F7zLw9lpIpiiZ67eG6WlKWHGpSSaQR2637e
	j/cQlZb0LFPZbqE+zwtCSmfIPAHP7/CiInDfyDa5eflYFbRJvzebNoikbezB0iSOL/JRPtK
	BXBn4iG+MGZqrrKDG0TRDd9vrRz4zaTIyx+8wNa475tOj6sNr/wmRaxZ3WkQBGM9qxO0kGt
	jdLKorrxzIRUNy68vGePd5XzEuftEHH1Oi8jzhFN1/rLSt+Vb96XftuQPqoE+yBWLBXIq+W
	YUzNxf42gBXCwU9rVGqZ7cDtp2fMwxQd1Kp8NCQOCi1N5rsyAfCZsP8ckrJVZgRhEL2n47c
	Zmw9/CU0Qleu5yj7FrcozZ+zc0j8uEEMedTDmyPv4Y/qJ1Gb0MD/xQ2PX1w1mRh2auujFwo
	Zfqb8Vuy+hGRjK6Z9EM5AKP8KBcbP50IZaO1HWvME3EjvAJnuqJW7xQQG8RmTAkWeYP8z+1
	/by7ok8uuLrrUlAjcNlAuHg4/JHOb74vGYo6N1d4kBnjPgcvHnhCQXgDax6w+1mAM/Mucg6
	s2oXvEJ++8DVr35KXCdK9SEFCVBZoHcrzZWBEOKKZQOEXLSYjsDF4iJKp5UGVaPrWdPqHVZ
	acBr8W+Ko8aSp2q8KU3ODRPJN7p5q+E2zYCjHcZPOO9pD9to0/sEBP5Vh4uI4uyoW18+dqW
	KMNeHZVrK1/Cd8Ak/avCbkMCYiycHkkgTS5fMM27uszQPqtEuYvmWdMoi3p7iOO35qZ9vex
	4UElN7LemDmmb92BW6+HYtywPKX8GMTwv01i3Wg7Dzi3DUcEm3WJlKtWB3iWoReJ6LajgWZ
	xfVx/QbYqsn7OVom0FVdh8vp0LHMGhtlfdsIR7Pw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_191234_419555_74ED30C4 
X-CRM114-Status: GOOD (  19.98  )
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

On 2/5/2026 1:37 AM, Conor Dooley wrote:
> On Wed, Feb 04, 2026 at 05:09:12PM +0800, Lv Zheng wrote:
>> Adds device tree bindings for SpacemiT T100 specific features by
>> introducing spacemit,100 compatible. T100 contains distributed IOATCs,
>> each of which exposes pmiv interrupt.
>>
>> Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
>> Signed-off-by: Jingyu Li <joey.li@spacemit.com>
>> ---
>>   .../bindings/iommu/riscv,iommu.yaml           | 37 +++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
>> index d4838c3b3741..2da3456e7402 100644
>> --- a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
>> @@ -32,6 +32,12 @@ properties:
>>     # should be specified along with 'reg' property providing MMIO location.
>>     compatible:
>>       oneOf:
>> +      - description: SpacemiT distributed IOMMUs
>> +        items:
>> +          - enum:
>> +              - spacemit,t100
>> +          - const: spacemit,riscv-iommu
> 
> What actually is the t100? Is it an SoC or is it the name of the core
> complex IP that spacemit is using in multiple SoCs?

T100 is the name of the IOMMU IP developed by SpacemiT, announced in 
RISC-V 2024 China Summit:
https://www.bilibili.com/video/BV1DNtCeiEBk/
It's world first server SPEC IOMMU in RISC-V, supports IOTLB placed in 
adjacent to the DMA masters and supports PCIe ATS and PRI.
You can find it shipped in the recent publicly purchasable SoC SpacemiT K3.

> 
>> +          - const: riscv,iommu
>>         - items:
>>             - enum:
>>                 - qemu,riscv-iommu
>> @@ -75,6 +81,23 @@ required:
>>   
>>   additionalProperties: false
>>   
>> +select: false
> 
> Why is this here? It just breaks the whole binding.
> pw-bot: changes-requested

OK.

> 
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: spacemit,riscv-iommu
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          maxItems: 68
> 
> This isn't right. You would need to make the interrupts property itself
> have maxItems: 68, then add an else to this conditional that has
> maxItems: 4. What you've done just doesn't work, and if you removed the
> "select: false: you'd see.

Indeed, thanks for pointing this out.
Will dig deeper to correct this.

> 
>> +          description:
>> +            SpacemiT distributed IOMMU includes additional interrupts for
>> +            IOATCs. Each IOATC exposes pmiv wired vector as standalone
>> +            interrupt and the maximum number of IOATCs can be up to 64.
>> +
>>   examples:
>>     - |+
>>       /* Example 1 (IOMMU device with wired interrupts) */
>> @@ -145,3 +168,17 @@ examples:
>>               };
>>           };
>>       };
>> +
>> +  - |+
>> +    /* Example 5 (SpacemiT distributed IOMMU) */
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    iommu4: iommu@1bccd000 {
> 
> Remove the iommu4 label, there's no references to it.

Sure.

Cheers,
Lv

> 
> Cheers,
> Conor.
> 
>> +        compatible = "spacemit,t100", "spacemit,riscv-iommu", "riscv,iommu";
>> +        reg = <0x1bccd000 0x1000>;
>> +        interrupts = <58 IRQ_TYPE_LEVEL_HIGH>, <58 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <58 IRQ_TYPE_LEVEL_HIGH>, <58 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <62 IRQ_TYPE_LEVEL_HIGH>, <63 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-parent = <&saplic>;
>> +        #iommu-cells = <0x01>;
>> +    };
>> -- 
>> 2.43.0
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
