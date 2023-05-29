Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0617BC77B7A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 06:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJK0MStWB6iX0sbzje8TGv8TZZiJcnrj/MT7MEXScGw=; b=M7Pj9nSYaptNPW
	GYpeLzcaXQPakvImhmd+uK4jzkvj/cncFym2vkpnhPcoQKgH9yWTOOAug9221yMX4dOSIayG0QYxk
	NG4GZk7Pdm9oKtDPfxSYUWdBLNCvY8rYQsdLYpWYD7+pMeIHjpLuh/I9rnI8Q6JW1/hc/1TfWzLG5
	Hv9RZRhoBdEUNTlys8ycHDK1TdB1xJumNVaCf2Vlm3J4K5w4+ZZNzzNeVPObUjEODUWpSXrF7kABR
	NtKsRfeaSCZvr/Jnq4V1JqfCOHNi7RkFMW6bw1bs3Of48nYIBnpCeqYD5EpW32Yw06WIYsB16QDo2
	lPMfv6Ainw7rBVh4C5/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Wch-009Qcr-0g;
	Mon, 29 May 2023 06:44:55 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Wcc-009QZj-1F
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 06:44:53 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id E8A4780ED;
	Mon, 29 May 2023 14:44:14 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 29 May
 2023 14:44:14 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 29 May
 2023 14:44:14 +0800
Message-ID: <a09cc0c9-ef4e-120f-e61a-94f628d67e38@starfivetech.com>
Date: Mon, 29 May 2023 14:44:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 1/3] dt-bindings: qspi: cdns,qspi-nor: Add clocks for
 StarFive JH7110 SoC
To: Mark Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Emil Renner Berthing" <kernel@esmil.dk>, Ziv Xu <ziv.xu@starfivetech.com>
References: <20230526062529.46747-1-william.qiu@starfivetech.com>
 <20230526062529.46747-2-william.qiu@starfivetech.com>
 <87e9ed95-ea57-44c8-85f8-34264b5c6dde@sirena.org.uk>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <87e9ed95-ea57-44c8-85f8-34264b5c6dde@sirena.org.uk>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_234450_764878_AE635100 
X-CRM114-Status: GOOD (  11.87  )
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



On 2023/5/26 23:33, Mark Brown wrote:
> On Fri, May 26, 2023 at 02:25:27PM +0800, William Qiu wrote:
> 
>>      then:
>>        properties:
>> +        clocks:
>> +          maxItems: 3
>> +
>> +        clock-names:
>> +          items:
>> +            - const: qspi-ref
>> +            - const: qspi-ahb
>> +            - const: qspi-apb
>> +
> 
> Are these really the names that the clocks have in the IP?  It seems
> weird that they'd include the IP name in there and not just be ref, ahb
> and apb.
Hi Mark,

	These three clocks are the internal clocks in the IP. The AHB
clock is the main system clock used to transfer data over the AHB bus
between an external master and the QSPI controller. The APB clock is used
to access the register map of the QSPI controller, perform controller and
device configuration.service interrupts and control certain run time modes.
The reference clock is used to serialize the data and drive the external
SPI interface.

	I'm going to change the names of these three clocks to hclk, pclk,
and ref_clk, as defined in the data book. What do you think?

	Thanks for taking time to review this patch series and give useful
suggestions.

Best regards,
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
