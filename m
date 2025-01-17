Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AD2C02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 14:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/D0AquDoZsofnTcUaoLgScgDd74d85uyNxXIUcDFbOU=; b=WqB2seEZnZ+w46
	zeHlWfifbkn2wqifggz8Bvwp+8eQpvLn+N2kpZDpjqUKC3A5SBoezw4mNsAIc6jXMJ0Vzb+N2JEeM
	7lQzgT6jYrij2nDzupwjsUc6AML/v52jjXhmUhNyC+vy8AXqa1rvsvH/mFdp2EfJ3dwKu1ZrV84wO
	C6/vnGHc+LZdxeCJkgEkH/+HLevd93fLoqFhahOb2FhS30AEghm9vFnHojRtsAPGjfr20JB1TzR9q
	/UK1Jt+iXxEmG59vbTHk07tpONJZbcdYQ89gKNDZ79b5uEF6ilA1igKJrt7YCKJfZcDkpJks07KNm
	29Z72qCzDu1noxC3ZRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYmxv-00000000PvF-048J;
	Fri, 17 Jan 2025 14:04:51 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYmxs-00000000Puj-19gX
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 14:04:49 +0000
Received: from [IPV6:2605:59c0:20f3:a400:5304:e921:4d34:736a] (unknown [IPv6:2605:59c0:20f3:a400:5304:e921:4d34:736a])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id DDA7BB4B438D;
	Fri, 17 Jan 2025 15:04:40 +0100 (CET)
Message-ID: <dd3aefec-0e1a-4025-812b-daa67a53f4ee@freeshell.de>
Date: Fri, 17 Jan 2025 06:04:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] riscv: dts: starfive: jh7110: pciephy0 USB 3.0
 configuration registers
To: Minda Chen <minda.chen@starfivetech.com>, Conor Dooley <conor@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250102183746.411526-1-e@freeshell.de>
 <20250102183746.411526-2-e@freeshell.de>
 <20250113-mushiness-snugness-0f55574e3956@spud>
 <SHXPR01MB0863DBF85A9874C9F93ECD25E618A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
 <20250114-recollect-dictate-104e890d116e@spud>
 <SHXPR01MB08631714C914911D343372ACE619A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <SHXPR01MB08631714C914911D343372ACE619A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_060448_465012_88114057 
X-CRM114-Status: GOOD (  16.79  )
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

Hi Minda,

On 1/15/25 02:58, Minda Chen wrote:
> 
> 
>>
>> On Tue, Jan 14, 2025 at 05:42:28AM +0000, Minda Chen wrote:
>>>
>>>
>>>>
>>>> On Thu, Jan 02, 2025 at 10:37:36AM -0800, E Shattow wrote:
>>>>> StarFive JH7110 contains a Cadence USB2.0+USB3.0 controller IP
>>>>> block that may exclusively use pciephy0 for USB3.0 connectivity.
>>>>> Add the register offsets for the driver to enable/disable USB3.0 on
>> pciephy0.
>>>>>
>>>>> Signed-off-by: E Shattow <e@freeshell.de>
>>>>> ---
>>>>>   arch/riscv/boot/dts/starfive/jh7110.dtsi | 2 ++
>>>>>   1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>>>> b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>>>> index 0d8339357bad..75ff07303e8b 100644
>>>>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>>>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>>>> @@ -611,6 +611,8 @@ usbphy0: phy@10200000 {
>>>>>   		pciephy0: phy@10210000 {
>>>>>   			compatible = "starfive,jh7110-pcie-phy";
>>>>>   			reg = <0x0 0x10210000 0x0 0x10000>;
>>>>> +			starfive,sys-syscon = <&sys_syscon 0x18>;
>>>>> +			starfive,stg-syscon = <&stg_syscon 0x148 0x1f4>;
>>>>
>>>> Why weren't these added in the first place? Minda, do you know?
>>>>
>>> The driver only require to set syscon register while the PHY attach to
>>> Cadence USB.(star64 board case) The PHY default attach to PCIe0, VF2 board
>> do not set any setting. So I don't set it.
>>
>> Does this mean that the change should be made in files where it will only affect
>> non-VF2 boards, or is it harmless if applied to the VF2 also?
> Harmless. The PCIe PHY driver still set the PCIe mode syscon setting.

Sounds good to me. However some tangent topic related to this series:

Our questions and answers in this discussion are a representation of 
what is missing from the documentation.

What do I want to know? :  "pdrstn split sw usbpipe plugen" abbreviation.

What are the full words that is from?

I will guess the words are:

"Power domain reset negative? Split... Switch? USB pipeline plug enable?"

When this is explained for me I will send a patch to add information 
into documentation at dt-bindings/phy/starfive,jh7110-pcie-phy.yaml 
file. I know that the functionality is already said in discussion;  What 
I want are the full words to expand the "pdrstn split sw usbpipe plugen" 
as any abbreviation would also be expanded and explained in documentation.

It would be difficult to improve the documentation before our discussion 
about this series here. Now it is clear what questions and answers are 
missing from documentation.

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
