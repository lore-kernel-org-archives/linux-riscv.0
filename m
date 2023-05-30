Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894B4C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 02:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SetHMIYk8MCBTKuTPzuFsQAP1ID5QuArqJD0A2TT9Y=; b=NdNvPP2+mkToln
	58YglKezuJdrtSRQyjxmFD9fKkZN9AhBeFDuPfCE7HpFMVdGJPlfmcKbyaWhxb1fj5KGwpR3glayp
	sNa4QBiGOpf3kefoMM9J0zYj5ChAgHVP+NGnm0ybHyahkYAuharx+6sxZXwbFCYKi5ukhfwGw1mPH
	wmf3IEZWrmj77NHv97JRBwoXAB18iM+WLOTDKWQD7Ph5E/kHA3dF6izcuJVjugOezgh/OBE4FhWbw
	LpP9RkbErmIWmrKpR25uav05KChSo7kk0/5kLA8LIizGSM9bGZ6keSImyyPHOvy89x7jcAiu6JuyQ
	5nrqO5JGxQpnRLJnzI6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3pFW-00CCvr-0b;
	Tue, 30 May 2023 02:38:14 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3pFR-00CCud-36;
	Tue, 30 May 2023 02:38:12 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 8D13724E282;
	Tue, 30 May 2023 10:37:52 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 30 May
 2023 10:37:52 +0800
Received: from [192.168.125.107] (113.72.147.198) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 30 May
 2023 10:37:51 +0800
Message-ID: <3b4eff36-28db-5880-3094-efa491a69dc7@starfivetech.com>
Date: Tue, 30 May 2023 10:37:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: Add starfive,jh7110-dphy-rx
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jack Zhu <jack.zhu@starfivetech.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230529121503.3544-1-changhuang.liang@starfivetech.com>
 <20230529121503.3544-2-changhuang.liang@starfivetech.com>
 <20230529-envy-itinerary-e4007cb0da9a@wendy>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230529-envy-itinerary-e4007cb0da9a@wendy>
X-Originating-IP: [113.72.147.198]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_193810_137621_D1B3ACBD 
X-CRM114-Status: GOOD (  13.48  )
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



On 2023/5/29 22:05, Conor Dooley wrote:
> Hey Changhuang,
> 
> Couple of minor bits from me here, you don't need to fix them unless
> the binding has to change for other reasons.
> 

Thanks for your comments.

[...]
>> +$id: http://devicetree.org/schemas/phy/starfive,jh7110-dphy-rx.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive SoC MIPI D-PHY Rx Controller
> 
> nit: either s/SoC/JH7110/ or s/SoC//.
> 

Changed to "StarFive JH7110 SoC MIPI D-PHY Rx Controller"?

>> +
>> +maintainers:
>> +  - Jack Zhu <jack.zhu@starfivetech.com>
>> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
>> +
>> +description:
>> +  The StarFive SoC uses the MIPI CSI D-PHY based on M31 IP to transfer
>> +  CSI camera data.
> 
> nit: "Starfive SoCs contain a MIPI CSI D-PHY based on an M31 IP, used to
> transfer CSI camera data."
> 

Will fixed this.

>> +properties:
>> +  compatible:
>> +    const: starfive,jh7110-dphy-rx
[...]
>> +  resets:
>> +    items:
>> +      - description: DPHY_HW reset
>> +      - description: DPHY_B09_ALWAYS_ON reset
> 
> I'd prefer not to have what looks like copy-paste from a datasheet
> and instead a description of what they do.
> 
> Otherwise, this looks grand to me, but I don't understand the hardware
> so there is no point in me leaving an R-b on this.
> Hopefully Krzysztof can take a look at it in the coming days.
> 
I will wait for Krzysztof's comments.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
