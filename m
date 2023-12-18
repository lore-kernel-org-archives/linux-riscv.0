Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827B4C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 11:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rhsh/aYND3OpCVEn585HZJUCx1vvensT4sdmX3Qn3Is=; b=knqW1mpcdFv8ON
	vWUHnc21HRRNf4tfHGkYzG1KVLrYIwza4IsCpSHbqLcLw+3Y8UYFKvofkwxIHqhDiIC9CsTTa82xx
	8Z51m8p2ToQz8h0Q8bBXhq2kDLgdG5EiZo5FEnhhDhN42jy1+FDJskOo5JGtgqR2WNxQceeq3DvM1
	9i8uAn/tgFF9qUCnpkGkGMRQS+oqYJ8kw2OFMyRxxu5QIo4bxA6nYpWRAx7J97e3kkyijQe88IH/1
	qTJk/GC58YTH76cZKns91pIY6qS+rt+xB4s34Ol+NQr8naVjrnHHbomV0r5PqZC8GQXErKUo3r54K
	rABJq2uPhd6z7D512Iug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBwy-00ADqh-1Z;
	Mon, 18 Dec 2023 11:38:20 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBwu-00ADmJ-1Z;
	Mon, 18 Dec 2023 11:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702899493;
	bh=V5PA5oyxCd5DFK291fOQmsy6Q17j3UOvBS6drZZobsg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lFn6oaU5/zBXfw/lfDzsQZdCaZFrqBfttjH8fN5pBpC+x9ugq0uF/v0dGZEiFXRc6
	 +7oyXTScJk0y2/u+13P+FgCN9xo9hOk0ujzwxI2YY2XRVgOAS3UHZbgaQf3b/Nyyn8
	 x9KWS4ulLJGO2JJ/FNGyadTdjybGHs7OxL+L7IeijvJf5RQvh9tMcINNbnZ5A9aGYP
	 0tQfFgU/lZk8ls4dofDxlacunvvIR+6USPl7W0C7WeZQ9UPXms/MR1v5xiZfdnFQWA
	 UXhwYOJolTHy+09ThqcCCwO1/J2c1p0e6rjcTtFXobbHcUK49iLD+meFAW+xXeGU3F
	 nALQ2xfxXz1Rg==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8A206378149C;
	Mon, 18 Dec 2023 11:38:11 +0000 (UTC)
Message-ID: <a06aaab5-b433-44a6-89a4-bdf713d5e1a9@collabora.com>
Date: Mon, 18 Dec 2023 13:38:10 +0200
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
 <698fbb5d-0750-4f2a-857f-5429e5f589f9@collabora.com>
 <CAJM55Z-e8mkjac-nCF9_w6EmMVbL9ued0mAcjwTMF=pKDLkMsA@mail.gmail.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAJM55Z-e8mkjac-nCF9_w6EmMVbL9ued0mAcjwTMF=pKDLkMsA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_033816_743634_C84C5499 
X-CRM114-Status: GOOD (  11.15  )
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

On 12/16/23 21:24, Emil Renner Berthing wrote:
> Cristian Ciocaltea wrote:
>> On 11/28/23 02:40, Cristian Ciocaltea wrote:
>>> On 11/26/23 23:10, Emil Renner Berthing wrote:
>>>> Cristian Ciocaltea wrote:
>>>>> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
>>>>> RGMII-ID.
>>>>>
>>
>> [...]
>>
>>>> You've alse removed the phy reset gpio on the Starlight board:
>>>>
>>>>   snps,reset-gpios = <&gpio 63 GPIO_ACTIVE_LOW>
>>>>
>>>> Why?
>>>
>>> I missed this in v1 as the gmac handling was done exclusively in
>>> jh7100-common. Thanks for noticing!
>>
>> Hi Emil,
>>
>> I think the reset doesn't actually trigger because "snps,reset-gpios" is
>> not a valid property, it should have been "snps,reset-gpio" (without the
>> trailing "s").
>>
>> However, this seems to be deprecated now, and the recommended approach
>> would be to define the reset gpio in the phy node, which I did in [1].
>>
>> Hopefully this won't cause any unexpected behaviour. Otherwise we should
>> probably simply drop it.
>>
>> [1]: https://lore.kernel.org/lkml/20231215204050.2296404-8-cristian.ciocaltea@collabora.com/
> 
> Oh, nice catch! With your v3 patches the Starlight board still works fine and
> GPIO63 is correctly grabbed and used for "PHY reset".

Great, thanks a lot for retesting this!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
