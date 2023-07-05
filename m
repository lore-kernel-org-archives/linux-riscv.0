Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FCDEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 07:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n12M1cbSAGr0tQSwq/MyBX53qMb1//ywVII3QFPbGmc=; b=Q9EXC8FkpqIosk
	6dJFTsdzZz+/3wP/W2RTk8huiJuIXlK8SJV10Qr0dcX0UnbCBfn6HzKwtaP1iq/DKg5zncGnXacN2
	MpES7M0PmnsE4ae13TPzuo5nVY8w56k9CnZnyCXTE6P3jtmKpYASwKZu4j4czvcgrDFWpe4sJtCIe
	/eJdY+UdvByzgTyXzNqnB/OUkkf21uG5S1nk6P+GKZ+hGSl5OESBrnjyJntahqBR7ep9ZYlf8VHVW
	ExrE+XCPSEQ85pyDSiROHNN7n2UM2FDhiv02M4hxJg8vfMacWR2gSKTbMMuMm3uJ5QWLOlVJn3CGW
	vdCfL7PwALz1XpSyrMoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwae-00EzdE-0A;
	Wed, 05 Jul 2023 07:06:16 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwaa-00EzcM-2H
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 07:06:14 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id E258024DD82;
	Wed,  5 Jul 2023 15:06:00 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 5 Jul
 2023 15:06:00 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 5 Jul
 2023 15:05:59 +0800
Message-ID: <a4e8929d-f2a6-3429-fc12-78a29e2c8d3a@starfivetech.com>
Date: Wed, 5 Jul 2023 15:05:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 3/3] riscv: dts: starfive: Add QSPI controller node for
 StarFive JH7110 SoC
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Ziv Xu
	<ziv.xu@starfivetech.com>
References: <20230704090453.83980-1-william.qiu@starfivetech.com>
 <20230704090453.83980-4-william.qiu@starfivetech.com>
 <552d39ee-0fa0-94c0-89b9-245e39e8586d@linaro.org>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <552d39ee-0fa0-94c0-89b9-245e39e8586d@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_000613_034241_8212B92A 
X-CRM114-Status: UNSURE (   7.94  )
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



On 2023/7/4 17:43, Krzysztof Kozlowski wrote:
> On 04/07/2023 11:04, William Qiu wrote:
>> Add the quad spi controller node for the StarFive JH7110 SoC.
>> 
>> Co-developed-by: Ziv Xu <ziv.xu@starfivetech.com>
>> Signed-off-by: Ziv Xu <ziv.xu@starfivetech.com>
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> 
> ...
> 
>> +		qspi: spi@13010000 {
>> +			compatible = "starfive,jh7110-qspi", "cdns,qspi-nor";
>> +			reg = <0x0 0x13010000 0x0 0x10000>,
>> +			      <0x0 0x21000000 0x0 0x400000>;
>> +			interrupts = <25>;
>> +			clocks = <&syscrg JH7110_SYSCLK_QSPI_REF>,
>> +				 <&syscrg JH7110_SYSCLK_QSPI_AHB>,
>> +				 <&syscrg JH7110_SYSCLK_QSPI_APB>;
>> +			clock-names = "ref", "ahb", "apb";
>> +			resets = <&syscrg JH7110_SYSRST_QSPI_APB>,
>> +				 <&syscrg JH7110_SYSRST_QSPI_AHB>,
>> +				 <&syscrg JH7110_SYSRST_QSPI_REF>;
>> +			reset-names = "qspi", "qspi-ocp", "rstc_ref";
>> +			cdns,fifo-depth = <256>;
>> +			cdns,fifo-width = <4>;
>> +			cdns,trigger-address = <0x0>;
> 
> Bus nodes are usually disabled by default and enabled when needed for
> specific boards.
> 
Will add status.
Thanks for your comments.

Best regards,
William
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
