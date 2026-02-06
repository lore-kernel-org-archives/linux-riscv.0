Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665DCECD9B0
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 01:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvD+CDlzbxTBL0hKgox/gtm7jAkU29Wb177u7Uwknfk=; b=DAfWlJG935o6wG
	FhFsq1MNBdMD0yvSs904noEaQ0kXThczRXlCcAkranpjhneMh6JikKEa+jlhCDtYjuXXv0k82+mKe
	7tAf6Q9ZdXQRE15RBmeIpnxMsokzWLWtgTRxl1U6VIIaO/cNOmIFvWOc15X/76Piixg6CEyW5g0XY
	ufKUNnjlUM0jWl2VO50sgKWvGPDKp8MtILGMFPQj4hwCaAfFItGQSUga5FNWgTyU1HBli/2sOpCME
	yQs3oKoDowC0+1NghH4cSL2LnC1k/Zu2kynBXfayqZpgIwAhBe0CkOjMU+1hssQo0kvUWJK39r4U/
	+WYheh78NfowlZvZqrSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voAjJ-0000000AiT2-3NMO;
	Fri, 06 Feb 2026 01:33:53 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voAjG-0000000AiS6-1MCv
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 01:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770341599;
	bh=omyy70O3OuJ3VKPU2PzEKTpT9f6MeOhreIgYvWT0TaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=QD07RnPOCILFHz50XHH5mqEvGqH4YyF8vrjecOwWB9+UQtVrpJr7beu84OBiXP2cI
	 m/IZF0D+KARp95TSv69fwBIkHd3T3sgzCDeNPqDVk3zp+wc5dkp7+9U00mP4wyd4GP
	 NiyZfimfKhs0dCNNloCHqaFY28tN9qX/gS/MjyeI=
X-QQ-mid: zesmtpsz2t1770341592t1b2531e8
X-QQ-Originating-IP: IGc2qSSjBPifceWa0Fo5f41QcQ3coZKZBB3/OIZklF4=
Received: from [10.3.91.191] ( [101.70.125.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Feb 2026 09:33:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3718362222748311692
Message-ID: <B8005DB6301AACB4+374512e1-f561-4d2f-afd6-7a4b51012501@linux.spacemit.com>
Date: Fri, 6 Feb 2026 09:33:09 +0800
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
 iommu@lists.linux.dev, linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 devicetree@vger.kernel.org
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <A0E91F323138E92F+a27d73b00f3324f0d3885128f5596230b3f1370b.1770195980.git.lv.zheng@linux.spacemit.com>
 <20260204-primer-wrought-6f64b14bf152@spud>
 <53171BEB06F43599+7c1f54bc-e72d-4cbd-9d10-194ae6b13744@linux.spacemit.com>
 <20260205-attitude-customer-129fe2bd5dc7@spud>
Content-Language: en-US
From: Lv Zheng <lv.zheng@linux.spacemit.com>
In-Reply-To: <20260205-attitude-customer-129fe2bd5dc7@spud>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: NpfbsqbTlzxUCzfq5/Ht/zQVJr3Bf4NUwUOdJ0yKuokkmbVjA4paMjQL
	4P+y5Sb/x2r4ENt8IPN+u1sNaRtD6J0QQprHOFmsn/aDCg61UG9d/e8vgplO24EYYmzrD1K
	8LkWC6kRc1rTWVDJIs7IZp9cdyOYkmsxQIzj9qpVLUlySQkio9Epye1AyvWYDx5DN3lvyv7
	gexLk6MLENDqFrrGFMmwxDruTGzgB54S6dn9Nyb9MLNRaDtFZFCjGh8g1apqmYothR39zN4
	OARlarPovAHNEYhFw6g9r1aac5Cn/SqpieglMBygIUdmBBQZzCREDp4e/0cNyPssA3Fed8n
	MELiOn1wvmuNLDe8If8RsHOfPs6638OrIrAOYkSnfhc5tqwBjaBseuImDZl16NaU/ktFqXt
	pZ5BarfNsWr+z0rSmzah3bUJEH+uqXdMx5hK+wXI2p6NZoy8oeTnp0TzqO8RwlyrB+JQ3LC
	tzc4fFgJKLFODbWTMqwhj21nq3+08mVZzsyKnlO6L64avZNCqlfATYSkkAOX0M99ADxvcX6
	mAPgVbvzt5dV1AAsJFRGGQHeVWoNbtc0zqPCy7iDugjqwQi5VkUhjHbXijy/Eg3YmmeRl4R
	L7MLtzN8w4llS/srGye5InBXNbv0q+urusZJvd9jahfsKGJSlzUSLT37mQjXXMVt6ueGbou
	kdzg4tj7xX9PO9HwHLWof65dC4Km6ziD+hOVCAYL88QPAwZZvBkcRVWb1KRFdWcxJAoMrWz
	ghWrlscjUfb5Q8HUhGWUsXhNHDNJUREyDD3/pNf/DbgQhYFcjpUMcwb1DG+dVy9YG0lfnWc
	Z49zEUvc1j7ZECtJD+F2fyWrs8t2gUromBwZtCD0CuB7z9HCzNxj+btctKZkCgNFEdeAFfe
	i3fud1EWG3g5qZN94w3KIHl2heZMI826kPInG+0OKlIfpqOy4BRP8qh2Iev2PU9ZcUrsRd8
	6/LpRAdtAXORLMEfNhghXSHzMdH6HtAhMhjDYPCPv14B65LC57k8QaiFO1HCq52woYqEiZ0
	GcxksBJfeocoJz+3xw/aprWTNHdYU=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_173351_150198_84B8B8C7 
X-CRM114-Status: GOOD (  21.03  )
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

On 2/6/2026 2:24 AM, Conor Dooley wrote:
> On Thu, Feb 05, 2026 at 11:11:51AM +0800, Lv Zheng wrote:
>> On 2/5/2026 1:37 AM, Conor Dooley wrote:
>>> On Wed, Feb 04, 2026 at 05:09:12PM +0800, Lv Zheng wrote:
>>>> Adds device tree bindings for SpacemiT T100 specific features by
>>>> introducing spacemit,100 compatible. T100 contains distributed IOATCs,
>>>> each of which exposes pmiv interrupt.
>>>>
>>>> Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
>>>> Signed-off-by: Jingyu Li <joey.li@spacemit.com>
>>>> ---
>>>>    .../bindings/iommu/riscv,iommu.yaml           | 37 +++++++++++++++++++
>>>>    1 file changed, 37 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
>>>> index d4838c3b3741..2da3456e7402 100644
>>>> --- a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
>>>> +++ b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
>>>> @@ -32,6 +32,12 @@ properties:
>>>>      # should be specified along with 'reg' property providing MMIO location.
>>>>      compatible:
>>>>        oneOf:
>>>> +      - description: SpacemiT distributed IOMMUs
>>>> +        items:
>>>> +          - enum:
>>>> +              - spacemit,t100
>>>> +          - const: spacemit,riscv-iommu
>>>
>>> What actually is the t100? Is it an SoC or is it the name of the core
>>> complex IP that spacemit is using in multiple SoCs?
>>
>> T100 is the name of the IOMMU IP developed by SpacemiT, announced in RISC-V
>> 2024 China Summit:
>> https://www.bilibili.com/video/BV1DNtCeiEBk/
>> It's world first server SPEC IOMMU in RISC-V, supports IOTLB placed in
>> adjacent to the DMA masters and supports PCIe ATS and PRI.
>> You can find it shipped in the recent publicly purchasable SoC SpacemiT K3.
> 
> Right, then what you need here is something like:
> 
> items:
>    - enum:
>        - spacemit,k3-iommu
>    - spacemit,t100-iommu
>    - riscv,iommu
> 
> Driver can then match on spacemit,t100-iommu - but you need to have
> soc-specific compatibles.
> I'm not convinced that riscv,iommu is suitable here though, does the
> driver work on your platform without the portions of code that are added
> by this series and enabled by your new compatible? If not, the I don't
> think the riscv,iommu fallback should be here.
> 
> Additionally, please stop sending new versions so frequently and in
> response to earlier submissions. I have a v4 in my inbox while we are
> still discussing v3.

SpacemiT provides RISC-V IOMMU implementation, T100 is the first
generation of the this IP product line, we have plan to develop T200,
T300, etc., with more features introduced to be adoptive to new
RISC-V IOMMU specifications.
Besides, T100 is not only shipped in K3, but also shipped in V100 and
the follow-up SoCs, like Kn, Vn00, they will likely use the same
synthesis result of T100 RTLs.

 From SpacemiT's point of view, we need a common sense of this IP
series for something like IOATCs, that's why spacemit,riscv-iommu
(this is same like qemu,riscv-iommu) is introduced. And a common sense
of T100 for all SoCs shipped T100 (like global filters, vendor events
and etc.,).

IMO, the current compatible is proper to reflect these concerns.
What do you think?

Cheers,
Lv

> 
> Cheers,
> Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
