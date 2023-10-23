Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE7DC0032E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 01:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3xynWccnXhiUzn53Tuhb2ROeQLK1xgVKSKtPwKebCrA=; b=rFoductZ9cGQYJ
	Mi5Fq2N/pb9kLCumw/dGBx9vUMZBYu3PaD7B2RGYx7X+NjS3L3qEHzrgg7Xb2IMem7eByNRIFlx+H
	srrn3iKWkcUx9IxL6qUDSH16nmxcP7scKzG92ZmxSHKc5EbmKJ1g4ndZt67y8P2WPyKEDhJWbYYiX
	TMS9pgSKv8NhXAYLdCCYDRk/yd4BwwaqW9X4MkSg6YiRYZAsNgvLSc38+zvvbE1wF890tQ6mQVLmd
	9sraYBs9oEohSu1CkFWvtZYyLeDNUp0nKTmPs6SANeK2yhG/RkBm2aCWsNex6kixtvt3E6KN9TVOI
	kL8cgJpdFbpOAcpP8sPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qujP6-006Ahr-1S;
	Mon, 23 Oct 2023 01:06:48 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qujO5-006Adu-0W
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 01:06:46 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A192924E167;
	Mon, 23 Oct 2023 09:04:51 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 23 Oct
 2023 09:04:51 +0800
Received: from [192.168.125.85] (183.27.99.123) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 23 Oct
 2023 09:04:50 +0800
Message-ID: <bd441e1d-73ae-4abc-8eb2-877419acb2df@starfivetech.com>
Date: Mon, 23 Oct 2023 09:04:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/20] dt-bindings: PCI: Add PLDA XpressRICH PCIe host
 common properties
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley
	<conor@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
	"Rob Herring" <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"Lorenzo Pieralisi" <lpieralisi@kernel.org>, Daire McNamara
	<daire.mcnamara@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pci@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
References: <20231020104341.63157-1-minda.chen@starfivetech.com>
 <20231020104341.63157-2-minda.chen@starfivetech.com>
 <8ced1915-7b94-4abc-bd8b-cb4bf027fa01@linaro.org>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <8ced1915-7b94-4abc-bd8b-cb4bf027fa01@linaro.org>
X-Originating-IP: [183.27.99.123]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_180644_338156_8FDA7841 
X-CRM114-Status: UNSURE (   7.77  )
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



On 2023/10/20 19:04, Krzysztof Kozlowski wrote:
> On 20/10/2023 12:43, Minda Chen wrote:
>> Add PLDA XpressRICH PCIe host common properties dt-binding doc.
>> Microchip PolarFire PCIe host using PLDA IP.
>> Move common properties from Microchip PolarFire PCIe host
>> to PLDA files.
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>  .../bindings/pci/microchip,pcie-host.yaml     | 55 +-------------
>>  .../pci/plda,xpressrich3-axi-common.yaml      | 75 +++++++++++++++++++
> 
> Where was this patch reviewed?
> 
> Best regards,
> Krzysztof
> 
This Conor's review tag. v2 : https://patchwork.kernel.org/project/linux-pci/patch/20230727103949.26149-2-minda.chen@starfivetech.com/
This is Rob's review tag v3: https://patchwork.kernel.org/project/linux-pci/patch/20230814082016.104181-2-minda.chen@starfivetech.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
