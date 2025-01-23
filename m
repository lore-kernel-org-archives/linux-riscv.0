Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B79BC02182
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 11:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2JIMMjIu3SxAKTi+2Q4pt9SpRj/T0YPLPkGyZAPWoA=; b=ZX9XlT+PJPxLT2
	c9Tg8xhNPp9jur5MReJYzV78yTcqr8g2mk0lsHP34wixP77ldjO+Z90F/wepktXpUchU1HAWhuJEk
	P4HWpu/E1HZqIgGduWl03eJejJWM2+EV1h96c3PBFoJrBSDu6DmUwLTRCOMEb6tuKidGximrlNKjl
	jeTNC5svgfrzknLMmxupkM0AxCgPeiPRqrmMcCx9UbJdQzBKkjJmX8l4JTaEeyuOvPdFraB/+eSkj
	WUYAcEciSCUnRBykoST9m1fXIu/PylBJtYZqbzjZ9reZXOgBRANKGg3DR9VnYLpXxUFJMZzOdqwMY
	BOksBxVkGET6d1+SAAwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavdV-0000000CNI0-2rUq;
	Thu, 23 Jan 2025 11:44:37 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tavY4-0000000CLub-21G4
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 11:39:02 +0000
Received: from [IPV6:2605:59c0:20f3:a400:5304:e921:4d34:736a] (unknown [IPv6:2605:59c0:20f3:a400:5304:e921:4d34:736a])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id ECA41B4B455B;
	Thu, 23 Jan 2025 12:38:52 +0100 (CET)
Message-ID: <bce19eaf-11bf-4ce8-bc15-dffb96cae9d4@freeshell.de>
Date: Thu, 23 Jan 2025 03:38:51 -0800
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
 <dd3aefec-0e1a-4025-812b-daa67a53f4ee@freeshell.de>
 <BJXPR01MB08553280FF7E342451053A6FE6E1A@BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <BJXPR01MB08553280FF7E342451053A6FE6E1A@BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_033900_695139_90DD9A20 
X-CRM114-Status: GOOD (  28.13  )
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



On 1/22/25 02:41, Minda Chen wrote:
> 
> 
> 
>>
>> Hi Minda,
>>
>> On 1/15/25 02:58, Minda Chen wrote:
>>>
>>>
>>>>
>>>> On Tue, Jan 14, 2025 at 05:42:28AM +0000, Minda Chen wrote:
>>>>>
>>>>>
>>>>>>
>>>>>> On Thu, Jan 02, 2025 at 10:37:36AM -0800, E Shattow wrote:
>>>>>>> StarFive JH7110 contains a Cadence USB2.0+USB3.0 controller IP
>>>>>>> block that may exclusively use pciephy0 for USB3.0 connectivity.
>>>>>>> Add the register offsets for the driver to enable/disable USB3.0
>>>>>>> on
>>>> pciephy0.
>>>>>>>
>>>>>>> Signed-off-by: E Shattow <e@freeshell.de>
>>>>>>> ---
>>>>>>>    arch/riscv/boot/dts/starfive/jh7110.dtsi | 2 ++
>>>>>>>    1 file changed, 2 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>>>>>> b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>>>>>> index 0d8339357bad..75ff07303e8b 100644
>>>>>>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>>>>>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>>>>>> @@ -611,6 +611,8 @@ usbphy0: phy@10200000 {
>>>>>>>    		pciephy0: phy@10210000 {
>>>>>>>    			compatible = "starfive,jh7110-pcie-phy";
>>>>>>>    			reg = <0x0 0x10210000 0x0 0x10000>;
>>>>>>> +			starfive,sys-syscon = <&sys_syscon 0x18>;
>>>>>>> +			starfive,stg-syscon = <&stg_syscon 0x148 0x1f4>;
>>>>>>
>>>>>> Why weren't these added in the first place? Minda, do you know?
>>>>>>
>>>>> The driver only require to set syscon register while the PHY attach
>>>>> to Cadence USB.(star64 board case) The PHY default attach to PCIe0,
>>>>> VF2 board
>>>> do not set any setting. So I don't set it.
>>>>
>>>> Does this mean that the change should be made in files where it will
>>>> only affect
>>>> non-VF2 boards, or is it harmless if applied to the VF2 also?
>>> Harmless. The PCIe PHY driver still set the PCIe mode syscon setting.
>>
>> Sounds good to me. However some tangent topic related to this series:
>>
>> Our questions and answers in this discussion are a representation of what is
>> missing from the documentation.
>>
>> What do I want to know? :  "pdrstn split sw usbpipe plugen" abbreviation.
>>
>> What are the full words that is from?
>>
>> I will guess the words are:
>>
>> "Power domain reset negative? Split... Switch? USB pipeline plug enable?"
>>
>> When this is explained for me I will send a patch to add information into
>> documentation at dt-bindings/phy/starfive,jh7110-pcie-phy.yaml
>> file. I know that the functionality is already said in discussion;  What I want are
>> the full words to expand the "pdrstn split sw usbpipe plugen"
>> as any abbreviation would also be expanded and explained in documentation.
>>
>> It would be difficult to improve the documentation before our discussion about
>> this series here. Now it is clear what questions and answers are missing from
>> documentation.
>>
>> -E
> In my view, pdrstn split sw usbpipe is bit17 setting. Set to 1 is mean split the PCIe PHY from
> Cadence USB controller.

Hi, Minda. Yes, the functional description is very good.

What I want to know is the language "pdrstn" for example, was this from 
StarFive and someone you can ask what those words are ? Else is it from 
Cadence and I should next ask some design person from Cadence company? I 
want to show in documentation what is the long word (or many words) that 
are changed to short words and become "pdrstn split sw usbpipe plugen".

When I read "pdrstn split sw usbpipe plugen":

pdrstn = ?  I do not know, it is different than any word I know. This 
could be like Power Domain (or Power Delivery), Reset, Negative... Pulse 
Data Rate Standard... Plug Drivers Transmission... it is non-sense to 
guess. I prefer in writing documentation to give some information that 
is accurate.

split = split. Ok. I think this is true. You provide us code and good 
description that bit17 setting is a "split" action so this is easy for 
understanding.

sw = ? maybe this is "switch"?  or "software", "southwest", "signal 
watch", "sine wave", ... probably switch.

usbpipe = 'pipe' is a connection. okay, this is acceptable. It is a 
"pipe" connection of Cadence IP block with a different part of JH7110 
design (PCIe?)

plugen = plug enable? I do not think of any different possible words for 
this, so it may be that.

I am aware this request is not any better for us to understand the code. 
We do know what the code does - Thank you, I appreciate your time! The 
English word choices are not very interesting (?) but I want to be 
accurate for documentation.

Someone at a moment in past time decided "pdrstn split sw usbpipe 
plugen" is a good description for this. Who is that person? What are 
those long words they did change into confusing short form? :-)

If you can ask around and maybe someone at StarFive does know?  Else you 
can confirm that it was something "not documented" and I will explain in 
documentation that it was "not documented" this exact source of words 
for "pdrstn split sw usbpipe plugen". We can substitute a functional 
description with or without a source of the words.

Best regards,

E Shattow

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
