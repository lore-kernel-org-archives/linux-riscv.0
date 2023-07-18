Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25318EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4R11X0SyjEhT1kP25uyy721QTmZe8uZenTAeUA2bU0s=; b=vtH8Oi4OK6UKfG
	0oxk+i7iU/x51fuLDZffrKeIkzEWcSymoolgl5pirjBHWHVkWUbrksh4nNbm77hGwegtyAWkHbjgl
	/MMYDZpzXPgcZ9ba3Kh32+SV1flRcpRgB286FbeEzuLZwulmMxCJ6DiSqCfzkLDaSv5QKBRz8Oc5h
	Mg/xWdfXIfxOE13bgY8nuw8WzsbTP6nwjYnWyu9lCm0IjnOfKPQFTNHmevJ7wpuEjJb81cUBOGwHi
	n37Lmyj1IdlzljPdfGLgjXc3gKysZsFxjqlPKqN9Kit555U5XFPlWtZ3LXVPe7GPFIBN3VfP/zRwh
	XKAv/CFKxgCDgyn0lUVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0qs-005pwW-2C;
	Wed, 19 Jul 2023 06:39:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0qp-005puU-20
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ksj+ikSkgFvqM5SgrnPcJxnizWmLdqpcPq6IpS0wGDg=; b=nSLZ1JH4yAFT6OJWzGxmMt1XxF
	P5Kp9qCMPOrg9tyIvapTJ/g7EFltd7bfsS8CrS8usJ24sBAjR0jrHIljCNQpMZ992Bjs5YwqDZPxI
	XEx4zM/SRW5T+YvMbudksuYETghPhZ23/ONKgeUcJB2jiwPZmaY7l2TL4RQbrPwmH2kqjr45Ie29e
	yNPWN2JjgG0ET+JN92Ido1jsr7T2cd8Sf/CNs91nTVLtnHUIc5RWzRZc9J2sQxlqxRBb1kGiS2M25
	87Rp69ej9YjI3/OgBdUkMNOVEQsSIj2ngRTBPUC7qDhbZx3/ysSb1FpNyofClmpcqBvVSv2jr0Neg
	GqxwNNbw==;
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLdsP-00BCzn-2h
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 06:08:13 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 0329224E20D;
	Tue, 18 Jul 2023 14:06:03 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Jul
 2023 14:06:03 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Jul
 2023 14:06:02 +0800
Message-ID: <6c53310c-1dc0-6623-369b-1a73fc8f63a5@starfivetech.com>
Date: Tue, 18 Jul 2023 14:06:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/3] dt-bindings: spi: constrain minItems of clocks and
 clock-names
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, <devicetree@vger.kernel.org>,
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
 <df9de3d8-09da-2b80-b2b4-626cd92fe971@starfivetech.com>
 <9891a7e3-0fce-4d05-8ead-3c0ed155d725@sirena.org.uk>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <9891a7e3-0fce-4d05-8ead-3c0ed155d725@sirena.org.uk>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_070802_628475_3EF4B05D 
X-CRM114-Status: GOOD (  11.60  )
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



On 2023/7/14 19:52, Mark Brown wrote:
> On Fri, Jul 14, 2023 at 03:14:59PM +0800, William Qiu wrote:
>> On 2023/7/13 22:57, Rob Herring wrote:
> 
>> > I suspect that PCLK and SSPCLK are tied to the same clock source. There 
>> > must be an SSPCLK because that is the one used to clock the SPI bus and 
>> > we need to know the frequency of it.
> 
>> After communicating with colleagues in SoC FE, I learned that PCLK and
>> SSPCLK were homologous on JH7110. He said that SSPCLK would divide the
>> frequency internally anyway, and there was no need for external part frequency,
>> so he directly gave them together.
> 
>> So, should I call this clock ssp_apb or keep it SSPCLK?
> 
> I'd expect this to be handled in the DTS for the SoC - connect both
> clocks the binding requires to whatever the upstream clock is, it's not
> clear to me that any binding change is required.

You mean binding two clocks, with the same clock source? Then there is no
need to modify YAML.

Best regards,
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
