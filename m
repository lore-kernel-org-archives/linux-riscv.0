Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E7FC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 08:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZLbmQ8POln5fbud+wd45q9i8vq45HCTkDyDT5GinAk=; b=zoCJgwb7M6nXQm
	mZT+9gyE7l2093tbD+E/LWUqWYFk7+hYr5YUzl6wQssmrW4y1HnecmZBJpjNM0uiKOL8CSvwNwlr1
	XWAYy+xD/jWFF5fQuiHFL98cYwwIos26sWf1X3eoKVdAJRKU9/60E4qoVYxiGhvVrWSiwqCFU3L0w
	xo1RRNuQgQ5cQ/1sxjfnzxmNv8TkEP2vgxeuJPS6iIpXZPCV/aKK3IWi//SPyBNtOhQiYLNcZBuEM
	RtsEUOu/sJhmB0p58wg8jnUb8TUpBRruvXRI3obhkO54vj8hPInPYG4pM84C0uEA5bbQJskjlQV4x
	Ap1GFxM+Ik08aRTzbFDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26nd-00GDVY-90; Mon, 05 Dec 2022 08:26:05 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26nY-00GDBv-Sk
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 08:26:03 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id E57A124E0AC;
	Mon,  5 Dec 2022 16:25:29 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 5 Dec
 2022 16:25:29 +0800
Received: from [192.168.125.128] (113.72.146.33) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 5 Dec
 2022 16:25:28 +0800
Message-ID: <4327b879-e499-41cd-1846-ce9194efb906@starfivetech.com>
Date: Mon, 5 Dec 2022 16:22:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 1/3] dt-bindings: watchdog: Add watchdog for StarFive
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-watchdog@vger.kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Wim Van
 Sebroeck" <wim@linux-watchdog.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Samin Guo <samin.guo@starfivetech.com>, Guenter Roeck <linux@roeck-us.net>,
	<linux-kernel@vger.kernel.org>
References: <20221202093943.149674-1-xingyu.wu@starfivetech.com>
 <20221202093943.149674-2-xingyu.wu@starfivetech.com>
 <cb8deb55-902a-0058-4764-a5f391f8de6d@linaro.org>
 <e0551ed7-2208-6d08-235b-993702f0d89b@starfivetech.com>
 <d6f3d8ac-4fbe-40ca-299b-046973cd0b25@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <d6f3d8ac-4fbe-40ca-299b-046973cd0b25@linaro.org>
X-Originating-IP: [113.72.146.33]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_002601_220833_8DB151FC 
X-CRM114-Status: GOOD (  11.42  )
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

On 2022/12/5 15:30, Krzysztof Kozlowski wrote:
> On 05/12/2022 04:49, Xingyu Wu wrote:
>> On 2022/12/2 18:46, Krzysztof Kozlowski wrote:
>>> On 02/12/2022 10:39, xingu.wu wrote:
>>>> From: Xingyu Wu <xingyu.wu@starfivetech.com>
>>>>
>>>> Add bindings to describe the watchdog for the StarFive SoCs.
>>>>
>>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>>> ---
>>>>  .../bindings/watchdog/starfive,wdt.yaml       | 77 +++++++++++++++++++
>>>>  1 file changed, 77 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml b/Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml
>>>> new file mode 100644
>>>> index 000000000000..ece3e80153a0
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml
>>>
>>> Filename should be based on compatible. You do not allow here any other
>>> models... If you intent and you are 100% sure you will grow with new
>>> models, make it maybe a family-based name.
>> 
>> First, thank you for your reply. We have some other SoCs like JH7100 would use
>> this watchdog driver, but we now use JH7110 as our main release chip.
>> As you say, should we use "starfive,jh71xx-wdt.yaml" as filename?
> 
> starfive,jh7110-wdt.yaml
> I would say because you do not expect any other models (const for
> compatible, not enum)
> 

Thanks, I will rename the file in the patches for next version.

Best regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
