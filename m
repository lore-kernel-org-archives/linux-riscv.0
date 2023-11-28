Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D81C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 16:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8AF+ELeCiY4t0Q4GUZY83XE2ec0psz4S4W7OLNWSq4=; b=xxTqh3dlPaUhzt
	JuMCWsJK6baDmmpsTwk29+j1ABAz2bNfgo5VBMuwj66PwHuAIKPt84kUECWwRtRlYtDa91+skaJT9
	8v09MYnZXiL/KfG36lMovrqh9ICRwRkAe4kiCOVnEiM4xJ+KYM5CczDxG2ukPYfQh/NImM/4j5qPW
	XxW/88F+DWtTngxRsjLrvyu6j8xTIp67O5I9JrAZ4KwR/reqcvMcmzw+gTlX4NZRLACbzwOcIuEA3
	pGAe6JoH8sLa29+SenpH9cd34dGYwEeS7EVVUXTBbW2ywhwuewaFkeaGiAlkkakcI6RcnZvMiubi/
	z0WX/1sL3WYGjCqPBKHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r80rc-005nhg-2j;
	Tue, 28 Nov 2023 16:23:08 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r80rY-005ngN-0n;
	Tue, 28 Nov 2023 16:23:06 +0000
Received: from [100.116.17.117] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DAFFE66072E7;
	Tue, 28 Nov 2023 16:23:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701188582;
	bh=666NilPgh2cGqwRIcXHKPf9AcNh0vwxR/Iqn1L5sqb8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lsnjgYK+g1qRAB2aDuzr8WoG7wZywNHXoduL7tX6p+91qSinQ62uOUzJB7OT7VHxj
	 XRcKqjzgCK7Of0lzGH00qmUUFAqzSimzHZhvdfyFp29/bkjwX2KrLbyqHegsEUu9FS
	 tswQPzqI2Ka7qOMvV/c2HxAmgnnpc/hU06tKO/BdB62KNJhhzQS7dfDwAUm1lEYSH0
	 nE643NFCTyWKHqvj/6sv5F6zd0sjdzR3zi9WFSghJn/eTFk1beP3HUOOcgxxij9Z0w
	 hLbjjJuyJ7NfzImFYfbxBHzwGVLDNeumWx34edFDQtHXiw4Tn1LZRodYx/hMMIG4NJ
	 tSxeou+Ck4sZw==
Message-ID: <5395f3ce-f9ec-474b-b145-5f62a3b7c4fc@collabora.com>
Date: Tue, 28 Nov 2023 18:22:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] [UNTESTED] riscv: dts: starfive:
 beaglev-starlight: Enable gmac
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <CAJM55Z9e=vjGKNnmURN15mvXo2bVd3igBA-3puF9q7eh5hiP+A@mail.gmail.com>
 <2f06ce36-0dc1-495e-b6a6-318951a53e8d@collabora.com>
 <CAJM55Z8vkMbqXY5sS2o4cLi8ow-JQTcXU9=uYMBSykwd4ppExw@mail.gmail.com>
 <054bbf2a-e7ba-40bf-8f8b-f0e0e9b396c6@collabora.com>
 <CAJM55Z9+j6CmfjNkPLCk1DR3EBuEMspsRtNvygDbPWJDCytQpw@mail.gmail.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAJM55Z9+j6CmfjNkPLCk1DR3EBuEMspsRtNvygDbPWJDCytQpw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_082304_546668_87686AE7 
X-CRM114-Status: GOOD (  27.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/28/23 18:09, Emil Renner Berthing wrote:
> Cristian Ciocaltea wrote:
>> On 11/28/23 14:08, Emil Renner Berthing wrote:
>>> Cristian Ciocaltea wrote:
>>>> On 11/26/23 23:10, Emil Renner Berthing wrote:
>>>>> Cristian Ciocaltea wrote:
>>>>>> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
>>>>>> RGMII-ID.
>>>>>>
>>>>>> TODO: Verify if manual adjustment of the RX internal delay is needed. If
>>>>>> yes, add the mdio & phy sub-nodes.
>>>>>
>>>>> Sorry for being late here. I've tested that removing the mdio and phy nodes on
>>>>> the the Starlight board works fine, but the rx-internal-delay-ps = <900>
>>>>> property not needed on any of my VisionFive V1 boards either.
>>>>
>>>> No problem, thanks a lot for taking the time to help with the testing!
>>>>
>>>>> So I wonder why you need that on your board
>>>>
>>>> I noticed you have a patch 70ca054e82b5 ("net: phy: motorcomm: Disable
>>>> rgmii rx delay") in your tree, hence I you please confirm the tests were
>>>> done with that commit reverted?
>>>>
>>>>> Also in the driver patch you add support for phy-mode = "rgmii-txid", but here
>>>>> you still set it to "rgmii-id", so which is it?
>>>>
>>>> Please try with "rgmii-id" first. I added "rgmii-txid" to have a
>>>> fallback solution in case the former cannot be used.
>>>
>>> Ah, I see. Sorry I should have read up on the whole thread. Yes, the Starlight
>>> board with the Microchip phy works with "rgmii-id" as is. And you're right,
>>> with "rgmii-id" my VF1 needs the rx-internal-delay-ps = <900> property too.
>>
>> That's great, we have now a pretty clear indication that this uncommon behavior
>> stems from the Motorcomm PHY, and *not* from GMAC.
>>
>>>>
>>>>> You've alse removed the phy reset gpio on the Starlight board:
>>>>>
>>>>>   snps,reset-gpios = <&gpio 63 GPIO_ACTIVE_LOW>
>>>>>
>>>>> Why?
>>>>
>>>> I missed this in v1 as the gmac handling was done exclusively in
>>>> jh7100-common. Thanks for noticing!
>>>>
>>>>>>
>>>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>>>> ---
>>>>>>  arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts | 5 +++++
>>>>>>  1 file changed, 5 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
>>>>>> index 7cda3a89020a..d3f4c99d98da 100644
>>>>>> --- a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
>>>>>> +++ b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
>>>>>> @@ -11,3 +11,8 @@ / {
>>>>>>  	model = "BeagleV Starlight Beta";
>>>>>>  	compatible = "beagle,beaglev-starlight-jh7100-r0", "starfive,jh7100";
>>>>>>  };
>>>>>> +
>>>>>> +&gmac {
>>>>>> +	phy-mode = "rgmii-id";
>>>>>> +	status = "okay";
>>>>>> +};
>>>>>
>>>>> Lastly the phy-mode and status are the same for the VF1 and Starlight boards,
>>>>> so why can't these be set in the jh7100-common.dtsi?
>>>>
>>>> I wasn't sure "rgmii-id" can be used for both boards and I didn't want
>>>> to unconditionally enable gmac on Starlight before getting a
>>>> confirmation that this actually works.
>>>>
>>>> If there is no way to make it working with "rgmii-id" (w/ or w/o
>>>> adjusting rx-internal-delay-ps), than we should switch to "rgmii-txid".
>>>
>>> Yeah, I don't exactly know the difference, but both boards seem to work fine
>>> with "rgmii-id", so if that is somehow better and/or more correct let's just go
>>> with that.
>>
>> As Andrew already pointed out, going with "rgmii-id" would be the recommended
>> approach, as this passes the responsibility of adding both TX and RX delays to
>> the PHY.  "rgmii-txid" requires the MAC to handle the RX delay, which might
>> break the boards having a conformant (aka well-behaving) PHY.  For some reason
>> the Microchip PHY seems to work fine in both cases, but that's most likely an
>> exception, as other PHYs might expose a totally different and undesired
>> behavior.
>>
>> I will prepare a v3 soon, and will drop the patches you have already submitted
>> as part of [1].
> 
> Sounds good. Then what's missing for ethernet to work is just the clock patches:
> https://github.com/esmil/linux/commit/b5abe1cb3815765739aff7949deed6f65b952c4a
> https://github.com/esmil/linux/commit/3a7a423b15a9f796586cbbdc37010d2b83ff2367
> 
> You can either include those as part of your patch series enabling ethernet, or
> they can be submitted separately with the audio clocks. Either way is
> fine by me.

I can cherry-pick them, but so far I couldn't identify any networking
related issues if those patches are not applied. Could it be something
specific to Starlight board only?

> /Emil
> 
>>
>> Thanks again for your support,
>> Cristian
>>
>> [1]: https://lore.kernel.org/all/20231126232746.264302-1-emil.renner.berthing@canonical.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
