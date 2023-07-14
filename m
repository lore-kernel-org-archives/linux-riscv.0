Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B28C001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 07:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btblkdalwVNaSoYhsUqWRdaG7Q3+WXmLws/b9fYfBlI=; b=rh27zXkhsLPyAm
	9EMfJY1deOLMZCq8widkxu5vUAwOunnNzhFOr2PIgwdKWUurAqsHm0BuyJnvFXxTD9Tfml0ryY3WQ
	ilpPtOvdfL6RMmWIrqZwGF4nuZ8Z8XdUb/N7mibQXfUvt5UwV/LcgGLtzA1QkDKX/ZhPHJPVn0/02
	DR8D+557t3xsuHOhtrhDf8RWUMoInAQWl0BgWNHwcuAiTUWgdeCJMsw1vDbwPBaampYlAAUxQSvW7
	t9UB9DtygSHwCK4LPplQwz0jftcZ1GIS92AvP/b8jggbssGSsBrhcglCFmMvqA/xlj3ArFDzur1ju
	fAzi2NvVqVIqt1Ms08Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKD1T-005GYV-09;
	Fri, 14 Jul 2023 07:15:27 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKD1P-005GVF-0w
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 07:15:26 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2704924E31B;
	Fri, 14 Jul 2023 15:15:02 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 14 Jul
 2023 15:15:02 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 14 Jul
 2023 15:15:01 +0800
Message-ID: <df9de3d8-09da-2b80-b2b4-626cd92fe971@starfivetech.com>
Date: Fri, 14 Jul 2023 15:14:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/3] dt-bindings: spi: constrain minItems of clocks and
 clock-names
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: Mark Brown <broonie@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Emil Renner Berthing" <kernel@esmil.dk>, Linus Walleij
	<linus.walleij@linaro.org>
References: <20230713090015.127541-1-william.qiu@starfivetech.com>
 <20230713090015.127541-3-william.qiu@starfivetech.com>
 <c5ad1e1c-58f4-4833-b9c7-8876c1a0dc27@sirena.org.uk>
 <e3fd0d3f-3fe4-2e23-2548-ecbd487e9c9f@linaro.org>
 <20230713145724.GA3975811-robh@kernel.org>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <20230713145724.GA3975811-robh@kernel.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_001523_617354_68EBB5EF 
X-CRM114-Status: GOOD (  15.01  )
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



On 2023/7/13 22:57, Rob Herring wrote:
> On Thu, Jul 13, 2023 at 02:39:19PM +0200, Krzysztof Kozlowski wrote:
>> On 13/07/2023 14:28, Mark Brown wrote:
>> > On Thu, Jul 13, 2023 at 05:00:14PM +0800, William Qiu wrote:
>> > 
>> >> The SPI controller only need apb_pclk clock to work properly on JH7110 SoC,
>> >> so there add minItems whose value is equal to 1. Other platforms do not
>> >> have this constraint.
>> > 
>> > Presumably this means that this is some variant of the usual pl022 IP,
>> 
>> Hm, in such case this could mean we need dedicated compatible.
> 
> Except the vendor in the ID registers should be different if the IP is 
> modified.
> 
> I suspect that PCLK and SSPCLK are tied to the same clock source. There 
> must be an SSPCLK because that is the one used to clock the SPI bus and 
> we need to know the frequency of it.
> 
> Rob

After communicating with colleagues in SoC FE, I learned that PCLK and
SSPCLK were homologous on JH7110. He said that SSPCLK would divide the
frequency internally anyway, and there was no need for external part frequency,
so he directly gave them together.

So, should I call this clock ssp_apb or keep it SSPCLK?

Best regards,
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
