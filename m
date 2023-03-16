Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E42C6FD19
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 07:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jO9XD0bABDUGCo5cHtGdDD6+emjt8ZCnqsHzA5owb9g=; b=VwEfuc6S5GKjYN
	Fn5xNrtj5+9u3hjgcHXrZjvcD2ai7R7tmJZfv8lxCtCInha2Nr+pfV7ULcV/9vdEnfZ4PiXVYQssB
	MK3I2J76jLihUhIEZNTm6UVpqipq4Uq+5wKzC0PKHgf5jnPDRTC5EWaNcV2IChqOQNZXos+XeEuKX
	2rqZ44I10tgcL9QB3jJbxED66nyoxe/VtuRXcGMr5I8jZPwFj3SRLg2bUfcUfU1O6LFYSFRWydpuO
	qXpJ3Sp/BOcFEoVHsBxmKFTaDr0EAGZ9ZTFSekwZxZ+odbqlo5/2abhN6yo1FkOvasEtcMFuHk6yq
	cqnnioJwq2anhz3XCbTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pciAg-00FWhv-0Z;
	Thu, 16 Mar 2023 07:37:10 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pciAc-00FWgO-0D
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 07:37:08 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 1423824E181;
	Thu, 16 Mar 2023 15:36:40 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 15:36:40 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 15:36:39 +0800
Message-ID: <9afeb36f-e95c-c459-c765-9a8ec48a257c@starfivetech.com>
Date: Thu, 16 Mar 2023 15:36:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 3/6] dt-bindings: net: snps,dwmac: Add 'ahb'
 reset/reset-name
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>
References: <20230316043714.24279-1-samin.guo@starfivetech.com>
 <20230316043714.24279-4-samin.guo@starfivetech.com>
 <aa21d3df-0aa5-64b2-060c-3b360ad86917@linaro.org>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <aa21d3df-0aa5-64b2-060c-3b360ad86917@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_003706_249124_4627CE20 
X-CRM114-Status: UNSURE (   9.99  )
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




Re: [PATCH v7 3/6] dt-bindings: net: snps,dwmac: Add 'ahb' reset/reset-name
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
to: Samin Guo <samin.guo@starfivetech.com>, linux-riscv@lists.infradead.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
data : 2023/3/16

> On 16/03/2023 05:37, Samin Guo wrote:
>> According to:
>> stmmac_platform.c: stmmac_probe_config_dt
>> stmmac_main.c: stmmac_dvr_probe
>>
>> dwmac controller may require one (stmmaceth) or two (stmmaceth+ahb)
>> reset signals, and the maxItems of resets/reset-names is going to be 2.
>>
>> The gmac of Starfive Jh7110 SOC must have two resets.
>> it uses snps,dwmac-5.20 IP.
>>
>> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
>> Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
> 
> How do you test the bindings on hardware?
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> Hi, Krzysztof

Thanks a lot.

Sorry, my fault. Tomaso tested gmac based on v5 version. I should only add Tested-by to the driver and dts patches, but not to dt-bindings.
I will fix it in the next version.

Best regards,
Samin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
