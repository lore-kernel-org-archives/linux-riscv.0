Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C258C77B72
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 06:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oqg3/lUjh0/aWvIlnb5yDnbAlCKeKKia75IS/olBEIw=; b=Q2+NHvudLez0vn
	qmI5I8+0PS+1jt4fvdz5B0mJGWYDOjH2hEBNaNcJeYiizMEA9/9eYyhfTtG6n840uICeGlOZOXCnD
	XjMzvwNv+4aBgzyQOiE7MSquc6a41iHidBpymkhHly8oVXcMUiMQbPV0Tr+gIYOvzJGtaamMn2LYC
	+bhJ2sFsElazyG244bqGHeoLg/YkL7nqVPn61MlDqWaK2XFSfJGyTrIkKdGeUXLH0F2u8+eDcjfbo
	2qj2FqQHIoVchZ+Hewx6SQzKazXPAbVw00aBO4prgIuTNvDUYyr4Z65BEZ6fqeJ7feCXlrI6q+mT6
	DlJYcKfrrh04ivzvKhTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppNP3-0079PN-2N;
	Thu, 20 Apr 2023 06:04:21 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppNOz-0079Mr-32
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 06:04:20 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 6C3F324E1B2;
	Thu, 20 Apr 2023 14:03:16 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Apr
 2023 14:03:16 +0800
Received: from [192.168.125.106] (113.72.144.253) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Apr
 2023 14:03:15 +0800
Message-ID: <2e9d1548-1a2b-d4aa-2582-f70299d1b050@starfivetech.com>
Date: Thu, 20 Apr 2023 14:03:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RESEND v2 3/6] soc: starfive: Modify ioremap to regmap
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Walker Chen
	<walker.chen@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230419035646.43702-1-changhuang.liang@starfivetech.com>
 <20230419035646.43702-4-changhuang.liang@starfivetech.com>
 <20230419-headdress-surcharge-8017d6db444b@spud>
Content-Language: en-US
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230419-headdress-surcharge-8017d6db444b@spud>
X-Originating-IP: [113.72.144.253]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_230418_269141_C4C30CA9 
X-CRM114-Status: GOOD (  10.66  )
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



On 2023/4/20 1:29, Conor Dooley wrote:
> On Tue, Apr 18, 2023 at 08:56:43PM -0700, Changhuang Liang wrote:
>> Modify ioremap to regmap which can be compatible with the syscon
>> interface, such as:
>> struct regmap *syscon_node_to_regmap(struct device_node *np)
>> Convenient introduction of syscon operation.
> 
> What's missing here is an explanation of *why* you are making this
> compatible with the syscon interface. Provided everything else is fine,
> I can fix this when applying the series.
> 
> Thanks,
> Conor.
> 

Add this patch just for using the same member(struct regmap *base) in patch 5.

Maybe I should replace syscon_node_to_regmap() with of_iomap() in patch 5.
So that patch 5 will use (void __iomem *base) member, and I also can drop
this patch 3 in this series. 

struct regmap *syscon_node_to_regmap(struct device_node *np);
void __iomem *of_iomap(struct device_node *node, int index);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
