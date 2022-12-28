Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C7EC10F1B
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 03:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w+qjpD944HSRN6FAVDP8mQS0S2dAReFhE54S4UD/m6E=; b=V5cD2zid8pXeB5
	bB5MHU5RvavVN/xk2vKWW03TPZosvBvoUHS0YAw4kqYqrFbFPXsnQTMY3oV7Ti2gnnTznyvlGYiW+
	SeICViW4KM5Qmh3m7/rGkCbR6rRv6Y1n7NfwEvJhEM1bXoR+q5cUINUPsLECbIr8YrA5TG9+V4JFm
	Y5mOtQnovxLY0HAbF8hFOVCgStA1cQ3U3FbtGjbN0aoOeuAv3SV7iBD1bYWGCTfC6+oLWD/KqKdX7
	+9ibhrOEpLYXImpr8zHGU31dtQyQMM3qYPaqcjhCPLW/ulwp5qmKueFPiglhww38T6NdvZIW9j1eA
	5j4NB7q9RvXbVAjurDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAN36-001ACk-Go; Wed, 28 Dec 2022 03:24:12 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAN33-001A3h-3k
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 03:24:11 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7D12C24E232;
	Wed, 28 Dec 2022 11:23:33 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 28 Dec
 2022 11:23:33 +0800
Received: from [192.168.120.49] (171.223.208.138) by EXMBX173.cuchost.com
 (172.16.6.93) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 28 Dec
 2022 11:23:31 +0800
Message-ID: <e03fb7bc-b196-bc8a-b396-fab8686d396b@starfivetech.com>
Date: Wed, 28 Dec 2022 11:23:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/9] dt-bindings: net: motorcomm: add support for
 Motorcomm YT8531
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20221216070632.11444-1-yanhong.wang@starfivetech.com>
 <20221216070632.11444-6-yanhong.wang@starfivetech.com>
 <994718d8-f3ee-af5e-bda7-f913f66597ce@linaro.org>
 <134a2ead-e272-c32e-b14f-a9e98c8924ac@starfivetech.com>
 <c296cf6b-6c50-205d-d5f5-6095c0a6c523@linaro.org>
From: yanhong wang <yanhong.wang@starfivetech.com>
In-Reply-To: <c296cf6b-6c50-205d-d5f5-6095c0a6c523@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_192409_478470_4497BEDC 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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



On 2022/12/27 17:52, Krzysztof Kozlowski wrote:
> On 27/12/2022 10:38, yanhong wang wrote:
>>>
>>> This must be false. After referencing ethernet-phy this should be
>>> unevaluatedProperties: false.
>>>
>>>
>> 
>> Thanks. Parts of this patch exist already, after discussion unanimity was achieved,
>> i will remove the parts of YT8531 in the next version.
> 
> I don't understand what does it mean. You sent duplicated patch? If so,
> please do not... you waste reviewers time.
> 
> Anyway this entire patch does not meet criteria for submission at all,
> so please start over from example-schema.
> 

Sorry, maybe I didn't make it clear, which led to misunderstanding. Motorcomm Inc is also 
carrying out the upstream of YT8531, and my patch will be duplicated and conflicted 
with their submission. By communicating with the developers of Motorcomm Inc, the part 
of YT8531 will be submitted by Motorcomm Inc, so my submission about YT8531 will be withdrawn.

> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
